Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C1119EF2F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 03:44:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wYH61XxdzDqvt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 11:44:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jQ+PmV5d; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wYDj4sFZzDqw4
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 11:41:57 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id q3so6759843pff.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 18:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=ZjAetnopWdMxGyjnSrN75kk2ay5nqI1VTFapcI0Q71Y=;
 b=jQ+PmV5dBl4ToT38NRk69sBj73w87EirdNztRXfBQppNXYzGLqw3QzPw+pui13r1UO
 U0bsOqCVN5M20WFP1ylKlpYTWn+SVSU81+J2hqnTHG5dbRtl9tNPNDCvAZsImqOdp6pW
 IIWu2yzdlPcdo8FB9/Hg0UQZYxCpPBmdrPiGLIXbG0S/5H93HAlaeE5fPJ/JVO5u60eC
 tTLDIurjTt4FZgYFTvlgRfF7SiPcN8fbmSIncAbc/wD/Kx0cdD4tfjrNIN2COy5CVlBm
 Y5HCFWkKGMvLky19HBsKvbINpbSQln+nDvOVTLhPbyWZ6/j7XUCsahuv5n2UD3kC4DB4
 6IeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=ZjAetnopWdMxGyjnSrN75kk2ay5nqI1VTFapcI0Q71Y=;
 b=UFjHuv0Pw+1UQR2jIYLMSed1uFb+7OIvRlvHdSXtYV4MFMfE5uYlenlQijsSyzxsSV
 FY7ccDv+4xNDfj1gmrvT2X6X9Gbm3VGEi5NBseJ2kND3hGAMrJQcdIcg2tYFaG+kU9Lu
 lDcl+zYbS+z5AA+mPLBq4Dg6ISGC0AUkEWya+PTf5xbwKF2x8gQ32nKFtw9sDuCZKWk1
 sux9eQk8KxQC9WSMR+3thG0dVc6+VtPQD4jS9g6F7RrdnP/HqnqPhNCAQ8iXCcSLjjoV
 4cfjuHRO90aiX9H9p4McfWpFviS7yGwEjWhPrcB4DL5U+HAtykDE9w0a2PZtXTgYax9E
 /ozQ==
X-Gm-Message-State: AGi0PuaFmQQkFGaGR8lZmYmj39AXKPig8gjFoMcID7e5Hb9w1FrleN5k
 3cEA0GTq8fhJi3nF6/MuXoY=
X-Google-Smtp-Source: APiQypK/otmJxZFUmepB+6PtPtUiBN9QrDEIqmQuG5yWxoWRBkAClAWfcaSUmVnhCGYEl6A5JQi8nA==
X-Received: by 2002:a63:2057:: with SMTP id r23mr19445823pgm.232.1586137313658; 
 Sun, 05 Apr 2020 18:41:53 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id i15sm9511571pgc.74.2020.04.05.18.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 18:41:53 -0700 (PDT)
Date: Mon, 06 Apr 2020 11:40:46 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v2 01/13] powerpc/radix: Make kuap_check_amr() and
 kuap_restore_amr() generic
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
In-Reply-To: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586137222.q67h0yqplh.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on April 6, 2020 3:44 am:
> In preparation of porting powerpc32 to C syscall entry/exit,
> rename kuap_check_amr() and kuap_restore_amr() as kuap_check()
> and kuap_restore(), and move the stub for when CONFIG_PPC_KUAP is
> not selected in the generic asm/kup.h

I have no problem with this,

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/include/asm/book3s/64/kup-radix.h | 12 ++----------
>  arch/powerpc/include/asm/kup.h                 |  2 ++
>  arch/powerpc/kernel/syscall_64.c               | 10 +++++-----
>  3 files changed, 9 insertions(+), 15 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerp=
c/include/asm/book3s/64/kup-radix.h
> index 3bcef989a35d..1f2716a0dcd8 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
> @@ -60,13 +60,13 @@
>  #include <asm/mmu.h>
>  #include <asm/ptrace.h>
> =20
> -static inline void kuap_restore_amr(struct pt_regs *regs)
> +static inline void kuap_restore(struct pt_regs *regs)
>  {
>  	if (mmu_has_feature(MMU_FTR_RADIX_KUAP))
>  		mtspr(SPRN_AMR, regs->kuap);
>  }
> =20
> -static inline void kuap_check_amr(void)
> +static inline void kuap_check(void)
>  {
>  	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_RADIX_=
KUAP))
>  		WARN_ON_ONCE(mfspr(SPRN_AMR) !=3D AMR_KUAP_BLOCKED);
> @@ -141,14 +141,6 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long a=
ddress, bool is_write)
>  		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_RE=
AD)),
>  		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
>  }
> -#else /* CONFIG_PPC_KUAP */
> -static inline void kuap_restore_amr(struct pt_regs *regs)
> -{
> -}
> -
> -static inline void kuap_check_amr(void)
> -{
> -}
>  #endif /* CONFIG_PPC_KUAP */
> =20
>  #endif /* __ASSEMBLY__ */
> diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/ku=
p.h
> index 92bcd1a26d73..1100c13b6d9e 100644
> --- a/arch/powerpc/include/asm/kup.h
> +++ b/arch/powerpc/include/asm/kup.h
> @@ -62,6 +62,8 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long addr=
ess, bool is_write)
>  {
>  	return false;
>  }
> +static inline void kuap_restore(struct pt_regs *regs) { }
> +static inline void kuap_check(void) { }
>  #endif /* CONFIG_PPC_KUAP */
> =20
>  static inline void allow_read_from_user(const void __user *from, unsigne=
d long size)
> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/sysca=
ll_64.c
> index cf06eb443a80..72f3d2f0a823 100644
> --- a/arch/powerpc/kernel/syscall_64.c
> +++ b/arch/powerpc/kernel/syscall_64.c
> @@ -2,7 +2,7 @@
> =20
>  #include <linux/err.h>
>  #include <asm/asm-prototypes.h>
> -#include <asm/book3s/64/kup-radix.h>
> +#include <asm/kup.h>
>  #include <asm/cputime.h>
>  #include <asm/hw_irq.h>
>  #include <asm/kprobes.h>
> @@ -48,7 +48,7 @@ notrace long system_call_exception(long r3, long r4, lo=
ng r5,
>  	}
>  #endif
> =20
> -	kuap_check_amr();
> +	kuap_check();
> =20
>  	/*
>  	 * This is not required for the syscall exit path, but makes the
> @@ -206,7 +206,7 @@ notrace unsigned long syscall_exit_prepare(unsigned l=
ong r3,
>  	local_paca->tm_scratch =3D regs->msr;
>  #endif
> =20
> -	kuap_check_amr();
> +	kuap_check();
> =20
>  	account_cpu_user_exit();
> =20
> @@ -294,7 +294,7 @@ notrace unsigned long interrupt_exit_user_prepare(str=
uct pt_regs *regs, unsigned
>  	local_paca->tm_scratch =3D regs->msr;
>  #endif
> =20
> -	kuap_check_amr();
> +	kuap_check();
> =20
>  	account_cpu_user_exit();
> =20
> @@ -372,7 +372,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(s=
truct pt_regs *regs, unsign
>  	 * We don't need to restore AMR on the way back to userspace for KUAP.
>  	 * The value of AMR only matters while we're in the kernel.
>  	 */
> -	kuap_restore_amr(regs);
> +	kuap_restore(regs);
> =20
>  	return ret;
>  }
> --=20
> 2.25.0
>=20
>=20
=
