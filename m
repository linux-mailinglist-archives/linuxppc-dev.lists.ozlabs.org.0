Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B81E268339
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 05:40:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqXF35NRwzDqVj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 13:40:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqXCB2RyCzDqSV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 13:38:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ldhHUItJ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BqXC775j3z9sTR;
 Mon, 14 Sep 2020 13:38:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1600054725;
 bh=WSYInpRYBtYDkZHBmQQDThkXjUE9NyRyhjskGzBOWfs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ldhHUItJlbckAFthBQwfzljIGVNGGy6y4M98azT/BZOxPnqEu0BODf5RZB5v+neFy
 rfYyn3r+eDg/2K1P9lS394q3hoLl37t06b0X9b35e8/dI9bVMYm23lPi05FGhQ7z9C
 Isa7kMcyiKZXGtsXQ8iCTg4dFgEdseOX0NKSmqPPjBKZuU2R0y5THdXI4kFcpeqqCG
 d9HLOXJ7zYr60UdwFJbiXw5lvWWrzrQgPTwdbH6YQwaaS6Mj0MToJ89PrdSwxf2pYI
 6G4p4fDMIRyX/oc9cmZAn2VP0PLlNIKOCMcSOPWOgPdN+35V1iqo6AYk3qv4Wct9/l
 Uga4UjBME7XXQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/15] selftests/seccomp: powerpc: Fix seccomp return
 value testing
In-Reply-To: <20200912110820.597135-13-keescook@chromium.org>
References: <20200912110820.597135-1-keescook@chromium.org>
 <20200912110820.597135-13-keescook@chromium.org>
Date: Mon, 14 Sep 2020 13:38:40 +1000
Message-ID: <87363lqb7j.fsf@mpe.ellerman.id.au>
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christian Brauner <christian@brauner.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kees Cook <keescook@chromium.org> writes:
> On powerpc, the errno is not inverted, and depends on ccr.so being
> set. Add this to a powerpc definition of SYSCALL_RET_SET().
>
> Co-developed-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> Link: https://lore.kernel.org/linux-kselftest/20200911181012.171027-1-cascardo@canonical.com/
> Fixes: 5d83c2b37d43 ("selftests/seccomp: Add powerpc support")
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

This looks right to me, and matches what strace does AFAICS.

Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 623953a53032..bbab2420d708 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -1750,6 +1750,21 @@ TEST_F(TRACE_poke, getpid_runs_normally)
>  # define ARCH_REGS		struct pt_regs
>  # define SYSCALL_NUM(_regs)	(_regs).gpr[0]
>  # define SYSCALL_RET(_regs)	(_regs).gpr[3]
> +# define SYSCALL_RET_SET(_regs, _val)				\
> +	do {							\
> +		typeof(_val) _result = (_val);			\
> +		/*						\
> +		 * A syscall error is signaled by CR0 SO bit	\
> +		 * and the code is stored as a positive value.	\
> +		 */						\
> +		if (_result < 0) {				\
> +			SYSCALL_RET(_regs) = -result;		\
> +			(_regs).ccr |= 0x10000000;		\
> +		} else {					\
> +			SYSCALL_RET(_regs) = result;		\
> +			(_regs).ccr &= ~0x10000000;		\
> +		}						\
> +	} while (0)
>  #elif defined(__s390__)
>  # define ARCH_REGS		s390_regs
>  # define SYSCALL_NUM(_regs)	(_regs).gprs[2]
> -- 
> 2.25.1
