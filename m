Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 247611BBBE0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 13:05:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BJhJ2JcKzDqw9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 21:05:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BJf630PNzDqsv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 21:03:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=m5TX1bbE; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49BJf40DSRz9sSG;
 Tue, 28 Apr 2020 21:03:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588071788;
 bh=MPI12AY7oRSfmLR9rvrdFStijboh0K0Bkvc9B5rcOmk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=m5TX1bbEgNJrEnEL/uiCWNMTqzyibud0uTzY2WzQsGNQ+7eaB/F1hXSFRPCHfyzUo
 n3onqPSx7u4NH1muMuYmzDY6uwCMCeznU1l1nqjaUaLPwJk3ujr9VQAHLjw0p8FeGO
 nSEZlq1Q1AnCkd2roJhTZ+38fSxwkg4A/wQ3SlUJTx86hdwC5qTBdfKy3RsXRro2Hj
 Mqljs8xxluygVbwWhh902Dc8+YzQDuixBQjRX3V+rYdw8vecwZivxn314Pws7bEo4x
 GDSiXFX8To6CS0Y4P1+x0SMkiAXWrhiVpQCWz6zIxF78N0+UUvghQtkmuVHF4lpHS3
 EB/6sBiqooPUQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] powerpc: Add interrupt mode information in /proc/cpuinfo
In-Reply-To: <20200427140644.332815-1-clg@kaod.org>
References: <20200427140644.332815-1-clg@kaod.org>
Date: Tue, 28 Apr 2020 21:03:20 +1000
Message-ID: <87v9ljg9dz.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:
> PowerNV and pSeries machines can run using the XIVE or XICS interrupt
> mode. Report this information in /proc/cpuinfo :
>
>     timebase    : 512000000
>     platform    : PowerNV
>     model       : 9006-22C
>     machine     : PowerNV 9006-22C
>     firmware    : OPAL
>     MMU         : Radix
>     IRQ         : XIVE

Hmmmm, I dunno. At what point do we stop putting random non CPU-related
things in cpuinfo? :)

The IRQ mode is (reasonably) easily discovered in sys, eg:

  $ cat /sys/kernel/irq/*/chip_name | grep -m 1 XIVE
  XIVE-IRQ

vs:

  $ cat /sys/kernel/irq/*/chip_name | grep -m 1 XICS
  XICS


cheers

> diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platfo=
rms/powernv/setup.c
> index 3bc188da82ba..39ef3394038d 100644
> --- a/arch/powerpc/platforms/powernv/setup.c
> +++ b/arch/powerpc/platforms/powernv/setup.c
> @@ -196,14 +196,18 @@ static void pnv_show_cpuinfo(struct seq_file *m)
>  		model =3D of_get_property(root, "model", NULL);
>  	seq_printf(m, "machine\t\t: PowerNV %s\n", model);
>  	if (firmware_has_feature(FW_FEATURE_OPAL))
> -		seq_printf(m, "firmware\t: OPAL\n");
> +		seq_puts(m, "firmware\t: OPAL\n");
>  	else
> -		seq_printf(m, "firmware\t: BML\n");
> +		seq_puts(m, "firmware\t: BML\n");
>  	of_node_put(root);
>  	if (radix_enabled())
> -		seq_printf(m, "MMU\t\t: Radix\n");
> +		seq_puts(m, "MMU\t\t: Radix\n");
>  	else
> -		seq_printf(m, "MMU\t\t: Hash\n");
> +		seq_puts(m, "MMU\t\t: Hash\n");
> +	if (xive_enabled())
> +		seq_puts(m, "IRQ\t\t: XIVE\n");
> +	else
> +		seq_puts(m, "IRQ\t\t: XICS\n");
>  }
>=20=20
>  static void pnv_prepare_going_down(void)
> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platfo=
rms/pseries/setup.c
> index 0c8421dd01ab..d248fca67797 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -95,9 +95,13 @@ static void pSeries_show_cpuinfo(struct seq_file *m)
>  	seq_printf(m, "machine\t\t: CHRP %s\n", model);
>  	of_node_put(root);
>  	if (radix_enabled())
> -		seq_printf(m, "MMU\t\t: Radix\n");
> +		seq_puts(m, "MMU\t\t: Radix\n");
>  	else
> -		seq_printf(m, "MMU\t\t: Hash\n");
> +		seq_puts(m, "MMU\t\t: Hash\n");
> +	if (xive_enabled())
> +		seq_puts(m, "IRQ\t\t: XIVE\n");
> +	else
> +		seq_puts(m, "IRQ\t\t: XICS\n");
>  }
>=20=20
>  /* Initialize firmware assisted non-maskable interrupts if
> --=20
> 2.25.3
