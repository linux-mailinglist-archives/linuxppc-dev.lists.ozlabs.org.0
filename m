Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 593A444D535
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 11:42:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hqdb01LS7z2yZt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 21:42:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KjU/logh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqdZK3wMKz2xXm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 21:42:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KjU/logh; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HqdZG6D6Dz4xbs;
 Thu, 11 Nov 2021 21:41:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1636627318;
 bh=508EvATBTUgT4RP3xXzYmoION19rKtHl4Vb8VbpgFcg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KjU/loghlYKgeXGMgRsQcvBlJT2wAzx01jngbO03grjmezF9Edk9AuQQ9u6sAhZGd
 Yh9KagEEh0lxDO4a/XUOp44KsYVSFeOAXfxz4NS83dahQWVoQINILeuYbulXUlHs+o
 /fMyqNTvw2miRz5hcSc8x/AUvbTOxrmIxD5HFNL0xK6FfyIM9FP/Jjd11CJSE363Hm
 8RuxV1LpQCV5TWLOaau3TPIjkMEAfz9Q7M+1ikYVAq8xTR83O4o5YBuGjH9W3DkaB2
 pFraFA9N0MD7/mUPm8Fc01FhQQRvE57OKyLOH7Ad9erEgIaI1cQdmm+fuRalzTweqe
 KXQnm7k2Szflw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 11/11] powerpc/smp: Add a doorbell=off kernel parameter
In-Reply-To: <20211105102636.1016378-12-clg@kaod.org>
References: <20211105102636.1016378-1-clg@kaod.org>
 <20211105102636.1016378-12-clg@kaod.org>
Date: Thu, 11 Nov 2021 21:41:58 +1100
Message-ID: <87fss3m0sp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
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
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:
> On processors with a XIVE interrupt controller (POWER9 and above), the
> kernel can use either doorbells or XIVE to generate CPU IPIs. Sending
> doorbell is generally preferred to using the XIVE IC because it is
> faster. There are cases where we want to avoid doorbells and use XIVE
> only, for debug or performance. Only useful on POWER9 and above.

How much do we want this?

Kernel command line args are a bit of a pain, they tend to be poorly
tested, because someone has to explicitly enable them at boot time, and
then reboot to test the other case.

When would we want to enable this? Can we make the kernel smarter about
when to use doorbells and make it automated?

Could we make it a runtime switch?

cheers

>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/include/asm/dbell.h                |  1 +
>  arch/powerpc/kernel/dbell.c                     | 17 +++++++++++++++++
>  arch/powerpc/platforms/powernv/smp.c            |  7 +++++--
>  arch/powerpc/platforms/pseries/smp.c            |  3 +++
>  Documentation/admin-guide/kernel-parameters.txt | 10 ++++++++++
>  5 files changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/dbell.h b/arch/powerpc/include/asm/=
dbell.h
> index 3e9da22a2779..07775aa3e81b 100644
> --- a/arch/powerpc/include/asm/dbell.h
> +++ b/arch/powerpc/include/asm/dbell.h
> @@ -90,6 +90,7 @@ static inline void ppc_msgsync(void)
>  #endif /* CONFIG_PPC_BOOK3S */
>=20=20
>  extern void doorbell_exception(struct pt_regs *regs);
> +extern bool doorbell_disabled;
>=20=20
>  static inline void ppc_msgsnd(enum ppc_dbell type, u32 flags, u32 tag)
>  {
> diff --git a/arch/powerpc/kernel/dbell.c b/arch/powerpc/kernel/dbell.c
> index 5545c9cd17c1..681ee4775629 100644
> --- a/arch/powerpc/kernel/dbell.c
> +++ b/arch/powerpc/kernel/dbell.c
> @@ -38,6 +38,23 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(doorbell_exception)
>=20=20
>  	set_irq_regs(old_regs);
>  }
> +
> +bool doorbell_disabled;
> +
> +static int __init doorbell_cmdline(char *arg)
> +{
> +	if (!arg)
> +		return -EINVAL;
> +
> +	if (strncmp(arg, "off", 3) =3D=3D 0) {
> +		pr_info("Doorbell disabled on kernel command line\n");
> +		doorbell_disabled =3D true;
> +	}
> +
> +	return 0;
> +}
> +__setup("doorbell=3D", doorbell_cmdline);
> +
>  #else /* CONFIG_SMP */
>  DEFINE_INTERRUPT_HANDLER_ASYNC(doorbell_exception)
>  {
> diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platform=
s/powernv/smp.c
> index cbb67813cd5d..1311bda9446a 100644
> --- a/arch/powerpc/platforms/powernv/smp.c
> +++ b/arch/powerpc/platforms/powernv/smp.c
> @@ -338,10 +338,13 @@ static void __init pnv_smp_probe(void)
>  		ic_cause_ipi =3D smp_ops->cause_ipi;
>  		WARN_ON(!ic_cause_ipi);
>=20=20
> -		if (cpu_has_feature(CPU_FTR_ARCH_300))
> +		if (cpu_has_feature(CPU_FTR_ARCH_300)) {
> +			if (doorbell_disabled)
> +				return;
>  			smp_ops->cause_ipi =3D doorbell_global_ipi;
> -		else
> +		} else {
>  			smp_ops->cause_ipi =3D pnv_cause_ipi;
> +		}
>  	}
>  }
>=20=20
> diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platform=
s/pseries/smp.c
> index f47429323eee..3bc9e6aaf645 100644
> --- a/arch/powerpc/platforms/pseries/smp.c
> +++ b/arch/powerpc/platforms/pseries/smp.c
> @@ -229,6 +229,9 @@ static __init void pSeries_smp_probe(void)
>  			return;
>  	}
>=20=20
> +	if (doorbell_disabled)
> +		return;
> +
>  	/*
>  	 * Under PowerVM, FSCR[MSGP] is enabled as guest vCPU siblings are
>  	 * gang scheduled on the same physical core, so doorbells are always
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index 10fa093251e8..2e1284febe39 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1041,6 +1041,16 @@
>  			The filter can be disabled or changed to another
>  			driver later using sysfs.
>=20=20
> +	doorbell=3Doff	[PPC]
> +			On processors with a XIVE interrupt controller
> +			(POWER9 and above), the kernel can use either
> +			doorbells or XIVE to generate CPU IPIs.	Sending
> +			doorbell is generally preferred to using the XIVE
> +			IC because it is faster. There are cases where
> +			we want to avoid doorbells and use XIVE only,
> +			for debug or performance. Only useful on
> +			POWER9 and above.
> +
>  	driver_async_probe=3D  [KNL]
>  			List of driver names to be probed asynchronously.
>  			Format: <driver_name1>,<driver_name2>...
> --=20
> 2.31.1
