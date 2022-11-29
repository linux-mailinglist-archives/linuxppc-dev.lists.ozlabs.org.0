Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AF163BE1F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 11:40:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLzPj5JFkz3bTm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 21:40:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dZfNI+PJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dZfNI+PJ;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLzNk3Qjxz2xf2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 21:39:32 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id h193so12603792pgc.10
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 02:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ct/dPbMqE7h4fq9J5MYHkEa28gohGcxwuExR+jn/KN4=;
        b=dZfNI+PJvmBE0K8/tpV17gUYFoJrq/7YYPKSLyrT3W42D7MIR04xIKfZoKqBmU8hLn
         sysz8GeEG/iceJJW7lCPjthwaS4hvEt1vktABsFlfqb/RelGgwrad3178/G//+isllBA
         Frudxdh7UtE0a+bb4Dg1RPIhli0g7RC7y5UDPpGl49cUjZKdfOcO6YgCaX0MbMvAyJ8Z
         uE6L7d0rVIR6IUSwA3yKwVM9zVRThIp/7KPem96bTb6Abr50t0lFJEkwlV5fFxtK4eBS
         kOYHFs2Dmq415op7mE9d3vmEyAvJ5hfvpOPmLGISVktaJ0EIoguBB9e6Fe1xz7FDrycc
         rx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ct/dPbMqE7h4fq9J5MYHkEa28gohGcxwuExR+jn/KN4=;
        b=cqp2M+NI5s5o1cSX44h1KQPwmkQ0cTAgbiUzsOA+7ket/fTuIIFN738pwaHa53LZjm
         kzaWxk4dorY7lEqUhA/r8fi2k/5gTOgvxjGxMhBPSXHkCgIpcykgxDFHWHr/QWI2l5+m
         98x7NfNEfV+WhMdIC61M5AuEyGTAieCFmzOoCH9SuCQrXGtLH9N7kUMET1B7cZGMqNyp
         WcxyT81SrqkhXw+M8dcjP1Ph1ZWaqiaXMQ4ESCC3I5L1TqA7WNQa4OYUywL42Nl17AKB
         2Img3Z6aVkzI7+UNqe/VjJg6/kLEF8I6zxQ698XhF9eefsO43hqN1AkXupDV7Gs4xmo1
         1b1g==
X-Gm-Message-State: ANoB5pl1AxCe3koHOW5873KSYIQYikUmw/118Hpg+9Umt9WKMlfbxySt
	Aj0AXYLZ41YhN8Q2JZCRgHbUVSXcjTKU5A==
X-Google-Smtp-Source: AA0mqf67p/212mvFT9Sy0Q8ojeDQfSte4J1QPkHDdKaNdgtjhitBMyj0HLEgKUsBAijfv/fnndHcPw==
X-Received: by 2002:a63:140e:0:b0:477:b461:3a3b with SMTP id u14-20020a63140e000000b00477b4613a3bmr28146081pgl.623.1669718369512;
        Tue, 29 Nov 2022 02:39:29 -0800 (PST)
Received: from localhost (193-116-112-94.tpgi.com.au. [193.116.112.94])
        by smtp.gmail.com with ESMTPSA id u10-20020a170902714a00b0018941395c40sm10415281plm.285.2022.11.29.02.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 02:39:28 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Nov 2022 20:39:24 +1000
Message-Id: <COOPRF72WR3V.1WPE5NI7M8V7J@bobo>
Subject: Re: [RFC PATCH 03/13] powerpc/dexcr: Handle hashchk exception
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Benjamin Gray" <bgray@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20221128024458.46121-1-bgray@linux.ibm.com>
 <20221128024458.46121-4-bgray@linux.ibm.com>
In-Reply-To: <20221128024458.46121-4-bgray@linux.ibm.com>
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
Cc: linux-hardening@vger.kernel.org, ajd@linux.ibm.com, cmr@bluescreens.de, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Nov 28, 2022 at 12:44 PM AEST, Benjamin Gray wrote:
> Recognise and pass the appropriate signal to the user program when a
> hashchk instruction triggers. This is independent of allowing
> configuration of DEXCR[NPHIE], as a hypervisor can enforce this aspect
> regardless of the kernel.
>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/ppc-opcode.h |  1 +
>  arch/powerpc/include/asm/processor.h  |  6 ++++++
>  arch/powerpc/kernel/dexcr.c           | 22 ++++++++++++++++++++++
>  arch/powerpc/kernel/traps.c           |  6 ++++++
>  4 files changed, 35 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include=
/asm/ppc-opcode.h
> index 21e33e46f4b8..89b316466ed1 100644
> --- a/arch/powerpc/include/asm/ppc-opcode.h
> +++ b/arch/powerpc/include/asm/ppc-opcode.h
> @@ -215,6 +215,7 @@
>  #define OP_31_XOP_STFSX	    663
>  #define OP_31_XOP_STFSUX    695
>  #define OP_31_XOP_STFDX     727
> +#define OP_31_XOP_HASHCHK   754
>  #define OP_31_XOP_STFDUX    759
>  #define OP_31_XOP_LHBRX     790
>  #define OP_31_XOP_LFIWAX    855
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/=
asm/processor.h
> index 0a8a793b8b8b..c17ec1e44c86 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -448,10 +448,16 @@ void *exit_vmx_ops(void *dest);
> =20
>  #ifdef CONFIG_PPC_BOOK3S_64
> =20
> +bool is_hashchk_trap(struct pt_regs const *regs);
>  unsigned long get_thread_dexcr(struct thread_struct const *t);
> =20
>  #else
> =20
> +static inline bool is_hashchk_trap(struct pt_regs const *regs)
> +{
> +	return false;
> +}
> +
>  static inline unsigned long get_thread_dexcr(struct thread_struct const =
*t)
>  {
>  	return 0;
> diff --git a/arch/powerpc/kernel/dexcr.c b/arch/powerpc/kernel/dexcr.c
> index 32a0a69ff638..11515e67afac 100644
> --- a/arch/powerpc/kernel/dexcr.c
> +++ b/arch/powerpc/kernel/dexcr.c
> @@ -3,6 +3,9 @@
> =20
>  #include <asm/cpu_has_feature.h>
>  #include <asm/cputable.h>
> +#include <asm/disassemble.h>
> +#include <asm/inst.h>
> +#include <asm/ppc-opcode.h>
>  #include <asm/processor.h>
>  #include <asm/reg.h>
> =20
> @@ -19,6 +22,25 @@ static int __init dexcr_init(void)
>  }
>  early_initcall(dexcr_init);
> =20
> +bool is_hashchk_trap(struct pt_regs const *regs)
> +{
> +	ppc_inst_t insn;
> +
> +	if (!cpu_has_feature(CPU_FTR_DEXCR_NPHIE))
> +		return false;
> +
> +	if (get_user_instr(insn, (void __user *)regs->nip)) {
> +		WARN_ON(1);
> +		return false;
> +	}

Nice series, just starting to have a look at it.

You probably don't want a WARN_ON() here because it's user triggerable
and isn't necessarily even indiciating a problem or attack if the app
is doing code unmapping in order to get faults.

Check some of the other instruction emulation for what to do in case of
an EFAULT.

> +
> +	if (ppc_inst_primary_opcode(insn) =3D=3D 31 &&
> +	    get_xop(ppc_inst_val(insn)) =3D=3D OP_31_XOP_HASHCHK)
> +		return true;
> +
> +	return false;
> +}
> +
>  unsigned long get_thread_dexcr(struct thread_struct const *t)
>  {
>  	return DEFAULT_DEXCR;
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 9bdd79aa51cf..b83f5b382f24 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -1516,6 +1516,12 @@ static void do_program_check(struct pt_regs *regs)
>  				return;
>  			}
>  		}
> +
> +		if (user_mode(regs) && is_hashchk_trap(regs)) {
> +			_exception(SIGILL, regs, ILL_ILLOPN, regs->nip);
> +			return;
> +		}

I guess ILLOPN makes sense. Do you know if any other archs do similar?

Thanks,
Nick
