Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D23E111E3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 05:31:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vgmN26wdzDqQB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 13:31:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vgkr4zCSzDqBP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 13:30:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44vgkq24r6z9s5c;
 Thu,  2 May 2019 13:30:27 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christoph Hellwig <hch@lst.de>, Oleg Nesterov <oleg@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/5] powerpc: don't use asm-generic/ptrace.h
In-Reply-To: <20190501173943.5688-3-hch@lst.de>
References: <20190501173943.5688-1-hch@lst.de>
 <20190501173943.5688-3-hch@lst.de>
Date: Thu, 02 May 2019 13:30:26 +1000
Message-ID: <87ftpxa5yl.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christoph Hellwig <hch@lst.de> writes:

> Doing the indirection through macros for the regs accessors just
> makes them harder to read, so implement the helpers directly.
>
> Note that only the helpers actually used are implemented now.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/powerpc/include/asm/ptrace.h | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)

Looks fine, thanks.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
> index 64271e562fed..5d30944f1f6b 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -108,18 +108,33 @@ struct pt_regs
>  
>  #ifndef __ASSEMBLY__
>  
> -#define GET_IP(regs)		((regs)->nip)
> -#define GET_USP(regs)		((regs)->gpr[1])
> -#define GET_FP(regs)		(0)
> -#define SET_FP(regs, val)
> +static inline unsigned long instruction_pointer(struct pt_regs *regs)
> +{
> +	return regs->nip;
> +}
> +
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +		unsigned long val)
> +{
> +	regs->nip = val;
> +}
> +
> +static inline unsigned long user_stack_pointer(struct pt_regs *regs)
> +{
> +	return regs->gpr[1];
> +}
> +
> +static inline unsigned long frame_pointer(struct pt_regs *regs)
> +{
> +	return 0;
> +}
>  
>  #ifdef CONFIG_SMP
>  extern unsigned long profile_pc(struct pt_regs *regs);
> -#define profile_pc profile_pc
> +#else
> +#define profile_pc(regs) instruction_pointer(regs)
>  #endif
>  
> -#include <asm-generic/ptrace.h>
> -
>  #define kernel_stack_pointer(regs) ((regs)->gpr[1])
>  static inline int is_syscall_success(struct pt_regs *regs)
>  {
> -- 
> 2.20.1
