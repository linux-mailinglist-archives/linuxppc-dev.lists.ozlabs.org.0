Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5833332AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 02:17:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwDhQ012dz3cKv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 12:17:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NFP/fOl8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NFP/fOl8; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwDgz240Vz30QD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 12:17:00 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id x29so10253489pgk.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Mar 2021 17:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=DjidbrwyCx3lORD3j61lhIQB01qhNRAIbQn71N/GNnc=;
 b=NFP/fOl8BCAapNo/2gaBvjw/pa0scQdoJA9QjrWcRvb09sWIwzFqlBHXFWGc36E/95
 lQhvzcVswpo7zSr/0EUho7lqZ7jPW5xGstl5gQj2nd/pGygE5rKok0egs5SR6QsKo01Q
 04IfXWwGSN3Yevzkp6UBSFQeeOniDjlIGWn8TBMt6VL+jDGvS9xviXckbCZk2P7jWT/N
 Fw8UMGb9YulUI3EEyF4f9+41kqMs2J0ieXJB/POmvPyCsij24EB7Oyouzlezu/hVrxBK
 7Y0BQqxsfT0mZvVf9LxwMqqakPMIxLFHB6QMvis8iP7YVAv0SCxH+d0VCe8fdxuh+jeD
 ldNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=DjidbrwyCx3lORD3j61lhIQB01qhNRAIbQn71N/GNnc=;
 b=l7otiM/Qr8mAXuSKTWZGN2tA3wZvpdSeFEEEElZ3OuplUNxbhyzydcDAlwPosuEpaE
 ijBWKoPEsY1NFWEHz5GXhB6vaWenfC5zlGfzLQchM2QuTn9FQdx8dq6z77wc7J6gtKMN
 g/LbaI0t0XNbf20wvUtRDz6O/nRgw8UFUVLHHkMPo01WeUaGlpQruCfQF83GLIwZqxgT
 07LL+XYNyg3QE7YW2XcqWOk1Fs7I4DGhgNzbYE8PTLUacegODODcALY97jI+uGU9QRAN
 RpZEq2C72oT5VlluHCaLwPKR7v07P8NGIj6zfzhVKkPaKzMb9zZ4NAh9VF/rgWG9DHU8
 yo/g==
X-Gm-Message-State: AOAM530QJ1pvKKvhCOj9TCX8ImYpCzKRA93qFqP+cWIlX2rF+dwevVFh
 m/K0k/ZEkT16vqVUHvoZZw8=
X-Google-Smtp-Source: ABdhPJyQq4Lc5AFbI42oqK1tMmOp5ZBN1pH2tB5VAev9LMJErHXAaM0Qxhs1H9CMlazf7jv+S5A8eg==
X-Received: by 2002:a63:40c5:: with SMTP id n188mr516700pga.255.1615339015898; 
 Tue, 09 Mar 2021 17:16:55 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a204sm3162989pfd.106.2021.03.09.17.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 17:16:54 -0800 (PST)
Date: Wed, 10 Mar 2021 11:16:49 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 01/43] powerpc/traps: unrecoverable_exception() is not
 an interrupt handler
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
 <ae96c59fa2cb7f24a8929c58cfa2c909cb8ff1f1.1615291471.git.christophe.leroy@csgroup.eu>
In-Reply-To: <ae96c59fa2cb7f24a8929c58cfa2c909cb8ff1f1.1615291471.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1615338957.9ydlqjl817.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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

Excerpts from Christophe Leroy's message of March 9, 2021 10:09 pm:
> unrecoverable_exception() is called from interrupt handlers or
> after an interrupt handler has failed.
>=20
> Make it a standard function to avoid doubling the actions
> performed on interrupt entry (e.g.: user time accounting).
>=20
> Fixes: 3a96570ffceb ("powerpc: convert interrupt handlers to use wrappers=
")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

This should go in as a fix for this release I think.

> ---
>  arch/powerpc/include/asm/interrupt.h | 3 ++-
>  arch/powerpc/kernel/interrupt.c      | 1 -
>  arch/powerpc/kernel/traps.c          | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/=
asm/interrupt.h
> index aedfba29e43a..e8d09a841373 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -410,7 +410,6 @@ DECLARE_INTERRUPT_HANDLER(altivec_assist_exception);
>  DECLARE_INTERRUPT_HANDLER(CacheLockingException);
>  DECLARE_INTERRUPT_HANDLER(SPEFloatingPointException);
>  DECLARE_INTERRUPT_HANDLER(SPEFloatingPointRoundException);
> -DECLARE_INTERRUPT_HANDLER(unrecoverable_exception);
>  DECLARE_INTERRUPT_HANDLER(WatchdogException);
>  DECLARE_INTERRUPT_HANDLER(kernel_bad_stack);
> =20
> @@ -437,6 +436,8 @@ DECLARE_INTERRUPT_HANDLER_NMI(hmi_exception_realmode)=
;
> =20
>  DECLARE_INTERRUPT_HANDLER_ASYNC(TAUException);
> =20
> +void unrecoverable_exception(struct pt_regs *regs);
> +
>  void replay_system_reset(void);
>  void replay_soft_interrupts(void);
> =20
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interr=
upt.c
> index 398cd86b6ada..b8e7d25be31b 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -436,7 +436,6 @@ notrace unsigned long interrupt_exit_user_prepare(str=
uct pt_regs *regs, unsigned
>  	return ret;
>  }
> =20
> -void unrecoverable_exception(struct pt_regs *regs);
>  void preempt_schedule_irq(void);
> =20
>  notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs=
, unsigned long msr)
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 1583fd1c6010..a44a30b0688c 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -2170,7 +2170,7 @@ DEFINE_INTERRUPT_HANDLER(SPEFloatingPointRoundExcep=
tion)
>   * in the MSR is 0.  This indicates that SRR0/1 are live, and that
>   * we therefore lost state by taking this exception.
>   */
> -DEFINE_INTERRUPT_HANDLER(unrecoverable_exception)
> +void unrecoverable_exception(struct pt_regs *regs)
>  {
>  	pr_emerg("Unrecoverable exception %lx at %lx (msr=3D%lx)\n",
>  		 regs->trap, regs->nip, regs->msr);
> --=20
> 2.25.0
>=20
>=20
