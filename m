Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3120414AD1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 15:20:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yNf932bpzDqKS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 23:20:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yNZ41KwgzDqHp
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 23:17:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44yNZ20xVWz9s9y;
 Mon,  6 May 2019 23:17:13 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Dmitry V. Levin" <ldv@altlinux.org>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH linux-next v10 5/7] powerpc: define syscall_get_error()
In-Reply-To: <20190415234444.GE9384@altlinux.org>
References: <20190415234307.GA9364@altlinux.org>
 <20190415234444.GE9384@altlinux.org>
Date: Mon, 06 May 2019 23:17:12 +1000
Message-ID: <87woj3wwmf.fsf@concordia.ellerman.id.au>
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
Cc: Eugene Syromyatnikov <esyr@redhat.com>, Oleg Nesterov <oleg@redhat.com>,
 Elvira Khabirova <lineprinter@altlinux.org>, Paul Mackerras <paulus@samba.org>,
 Andy Lutomirski <luto@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Dmitry V. Levin" <ldv@altlinux.org> writes:

> syscall_get_error() is required to be implemented on this
> architecture in addition to already implemented syscall_get_nr(),
> syscall_get_arguments(), syscall_get_return_value(), and
> syscall_get_arch() functions in order to extend the generic
> ptrace API with PTRACE_GET_SYSCALL_INFO request.
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Elvira Khabirova <lineprinter@altlinux.org>
> Cc: Eugene Syromyatnikov <esyr@redhat.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Oleg Nesterov <oleg@redhat.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
> ---
>
> Michael, this patch is waiting for ACK since early December.

Sorry, the more I look at our seccomp/ptrace code the more problems I
find :/

This change looks OK to me, given it will only be called by your new
ptrace API.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>


> Notes:
>     v10: unchanged
>     v9: unchanged
>     v8: unchanged
>     v7: unchanged
>     v6: unchanged
>     v5: initial revision
>     
>     This change has been tested with
>     tools/testing/selftests/ptrace/get_syscall_info.c and strace,
>     so it's correct from PTRACE_GET_SYSCALL_INFO point of view.
>     
>     This cast doubts on commit v4.3-rc1~86^2~81 that changed
>     syscall_set_return_value() in a way that doesn't quite match
>     syscall_get_error(), but syscall_set_return_value() is out
>     of scope of this series, so I'll just let you know my concerns.
     
Yeah I think you're right. My commit made it work for seccomp but only
on the basis that seccomp calls syscall_set_return_value() and then
immediately goes out via the syscall exit path. And only the combination
of those gets things into the same state that syscall_get_error()
expects.

But with the way the code is currently structured if
syscall_set_return_value() negated the error value, then the syscall
exit path would then store the wrong thing in pt_regs->result. So I
think it needs some more work rather than just reverting 1b1a3702a65c.

But I think fixing that can be orthogonal to this commit going in as the
code does work as it's currently written, the in-between state that
syscall_set_return_value() creates via seccomp should not be visible to
ptrace.

cheers

>     See also https://lore.kernel.org/lkml/874lbbt3k6.fsf@concordia.ellerman.id.au/
>     for more details on powerpc syscall_set_return_value() confusion.
>
>  arch/powerpc/include/asm/syscall.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> index a048fed0722f..bd9663137d57 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -38,6 +38,16 @@ static inline void syscall_rollback(struct task_struct *task,
>  	regs->gpr[3] = regs->orig_gpr3;
>  }
>  
> +static inline long syscall_get_error(struct task_struct *task,
> +				     struct pt_regs *regs)
> +{
> +	/*
> +	 * If the system call failed,
> +	 * regs->gpr[3] contains a positive ERRORCODE.
> +	 */
> +	return (regs->ccr & 0x10000000UL) ? -regs->gpr[3] : 0;
> +}
> +
>  static inline long syscall_get_return_value(struct task_struct *task,
>  					    struct pt_regs *regs)
>  {
> -- 
> ldv
