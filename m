Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1665E9E62
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 11:53:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbdPN28RCz3c6N
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 19:53:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lVCEGIAz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lVCEGIAz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbdNm6tHNz2xGS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 19:53:12 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F420160023;
	Mon, 26 Sep 2022 09:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1834BC433C1;
	Mon, 26 Sep 2022 09:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664185989;
	bh=XFUdlFGFYCg/e1pAPdVv5AlfL0RZd2gUplf7gXpHyxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lVCEGIAzNxzQkm76KPmyF38LJWGmedSubsA6GCBTOvDH/Mdj6S3iLV9rMwPl02hmf
	 ct6GQeTKsuqcLgctYSqbYwqGFQyrw3WFXnbxZBzbQCitcH6znOc4bX0KT5nrWTsUvO
	 E6vcMScJKqaJtN2FxFaV145BVGxNCFRO0/iKngyo3X9otMG1AWYPKEKKerIK6Sm6Tq
	 GWzFKiH6Am81v/HOcfvO3Ifo++NBV0O9pnzTLiQC2d4MPczCmejYdcZ976WmlnlWuz
	 pI+yN7fnmstYcLgPTqFIPKtD/4OfnsD/Xbz5IoG4MkcWXHnfV4PhyrTtJa+K8vY+n5
	 JoWUUdjMLewEg==
Received: by pali.im (Postfix)
	id 0DC848A3; Mon, 26 Sep 2022 11:53:05 +0200 (CEST)
Date: Mon, 26 Sep 2022 11:53:05 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 3/7] powerpc/85xx: p2020: Move all P2020 machine
 descriptions to p2020.c
Message-ID: <20220926095305.gfwgf66ypah53cjx@pali>
References: <20220819191557.28116-1-pali@kernel.org>
 <20220819191557.28116-4-pali@kernel.org>
 <bf01338b-b0a1-1fef-f29d-c864b9bc49a8@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf01338b-b0a1-1fef-f29d-c864b9bc49a8@csgroup.eu>
User-Agent: NeoMutt/20180716
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
Cc: Sinan Akman <sinan@writeme.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 26 September 2022 09:48:02 Christophe Leroy wrote:
> Le 19/08/2022 à 21:15, Pali Rohár a écrit :
> > This moves machine descriptions and all related code for all P2020 boards
> > into new p2020.c source file. This is preparation for code deduplication
> > and providing one unified machine description for all P2020 boards.
> 
> I'm having hard time to review this patch.
> 
> It looks like you are doing much more than just moving machine 
> descriptions and related code into p2020.c
> 
> Apparently p2020.c has a lot of code that doesn't seem be move from 
> somewhere else.
> 
> Maybe there is a need to tidy up in order to ease reviewing.

This is probably harder to read due to how git format-patch generated
this email. The important is:

 copy from arch/powerpc/platforms/85xx/mpc85xx_ds.c
 copy to arch/powerpc/platforms/85xx/p2020.c

Which means that git thinks that my newly introduced file p2020.c is
similar to old file mpc85xx_ds.c and generated diff in format which do:

 1. copy mpc85xx_ds.c to p2020.c
 2. apply diff on newly introduced file p2020.c

Code is really moved from mpc85xx_ds.c and mpc85xx_rdb.c files into file
p2020.c.

File p2020.c is new in this patch.

> > 
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > ---
> >   arch/powerpc/platforms/85xx/Makefile          |   2 +
> >   arch/powerpc/platforms/85xx/mpc85xx_ds.c      |  23 ---
> >   arch/powerpc/platforms/85xx/mpc85xx_rdb.c     |  44 ------
> >   .../platforms/85xx/{mpc85xx_ds.c => p2020.c}  | 134 ++++++++++++------
> >   4 files changed, 91 insertions(+), 112 deletions(-)
> >   copy arch/powerpc/platforms/85xx/{mpc85xx_ds.c => p2020.c} (65%)
> > 
> > diff --git a/arch/powerpc/platforms/85xx/Makefile b/arch/powerpc/platforms/85xx/Makefile
> > index 260fbad7967b..1ad261b4eeb6 100644
> > --- a/arch/powerpc/platforms/85xx/Makefile
> > +++ b/arch/powerpc/platforms/85xx/Makefile
> > @@ -23,6 +23,8 @@ obj-$(CONFIG_P1010_RDB)   += p1010rdb.o
> >   obj-$(CONFIG_P1022_DS)    += p1022_ds.o
> >   obj-$(CONFIG_P1022_RDK)   += p1022_rdk.o
> >   obj-$(CONFIG_P1023_RDB)   += p1023_rdb.o
> > +obj-$(CONFIG_MPC85xx_DS)  += p2020.o
> > +obj-$(CONFIG_MPC85xx_RDB) += p2020.o
> >   obj-$(CONFIG_TWR_P102x)   += twr_p102x.o
> >   obj-$(CONFIG_CORENET_GENERIC)   += corenet_generic.o
> >   obj-$(CONFIG_FB_FSL_DIU)	+= t1042rdb_diu.o
> > diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
> > index 9a6d637ef54a..05aac997b5ed 100644
> > --- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
> > +++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
> > @@ -168,7 +168,6 @@ static int __init mpc8544_ds_probe(void)
> >   
> >   machine_arch_initcall(mpc8544_ds, mpc85xx_common_publish_devices);
> >   machine_arch_initcall(mpc8572_ds, mpc85xx_common_publish_devices);
> > -machine_arch_initcall(p2020_ds, mpc85xx_common_publish_devices);
> >   
> >   /*
> >    * Called very early, device-tree isn't unflattened
> > @@ -178,14 +177,6 @@ static int __init mpc8572_ds_probe(void)
> >   	return !!of_machine_is_compatible("fsl,MPC8572DS");
> >   }
> >   
> > -/*
> > - * Called very early, device-tree isn't unflattened
> > - */
> > -static int __init p2020_ds_probe(void)
> > -{
> > -	return !!of_machine_is_compatible("fsl,P2020DS");
> > -}
> > -
> >   define_machine(mpc8544_ds) {
> >   	.name			= "MPC8544 DS",
> >   	.probe			= mpc8544_ds_probe,
> > @@ -213,17 +204,3 @@ define_machine(mpc8572_ds) {
> >   	.calibrate_decr		= generic_calibrate_decr,
> >   	.progress		= udbg_progress,
> >   };
> > -
> > -define_machine(p2020_ds) {
> > -	.name			= "P2020 DS",
> > -	.probe			= p2020_ds_probe,
> > -	.setup_arch		= mpc85xx_ds_setup_arch,
> > -	.init_IRQ		= mpc85xx_ds_pic_init,
> > -#ifdef CONFIG_PCI
> > -	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
> > -	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
> > -#endif
> > -	.get_irq		= mpic_get_irq,
> > -	.calibrate_decr		= generic_calibrate_decr,
> > -	.progress		= udbg_progress,
> > -};
> > diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
> > index b6129c148fea..05f1ed635735 100644
> > --- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
> > +++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
> > @@ -108,8 +108,6 @@ static void __init mpc85xx_rdb_setup_arch(void)
> >   	printk(KERN_INFO "MPC85xx RDB board from Freescale Semiconductor\n");
> >   }
> >   
> > -machine_arch_initcall(p2020_rdb, mpc85xx_common_publish_devices);
> > -machine_arch_initcall(p2020_rdb_pc, mpc85xx_common_publish_devices);
> >   machine_arch_initcall(p1020_mbg_pc, mpc85xx_common_publish_devices);
> >   machine_arch_initcall(p1020_rdb, mpc85xx_common_publish_devices);
> >   machine_arch_initcall(p1020_rdb_pc, mpc85xx_common_publish_devices);
> > @@ -122,13 +120,6 @@ machine_arch_initcall(p1024_rdb, mpc85xx_common_publish_devices);
> >   /*
> >    * Called very early, device-tree isn't unflattened
> >    */
> > -static int __init p2020_rdb_probe(void)
> > -{
> > -	if (of_machine_is_compatible("fsl,P2020RDB"))
> > -		return 1;
> > -	return 0;
> > -}
> > -
> >   static int __init p1020_rdb_probe(void)
> >   {
> >   	if (of_machine_is_compatible("fsl,P1020RDB"))
> > @@ -153,13 +144,6 @@ static int __init p1021_rdb_pc_probe(void)
> >   	return 0;
> >   }
> >   
> > -static int __init p2020_rdb_pc_probe(void)
> > -{
> > -	if (of_machine_is_compatible("fsl,P2020RDB-PC"))
> > -		return 1;
> > -	return 0;
> > -}
> > -
> >   static int __init p1025_rdb_probe(void)
> >   {
> >   	return of_machine_is_compatible("fsl,P1025RDB");
> > @@ -180,20 +164,6 @@ static int __init p1024_rdb_probe(void)
> >   	return of_machine_is_compatible("fsl,P1024RDB");
> >   }
> >   
> > -define_machine(p2020_rdb) {
> > -	.name			= "P2020 RDB",
> > -	.probe			= p2020_rdb_probe,
> > -	.setup_arch		= mpc85xx_rdb_setup_arch,
> > -	.init_IRQ		= mpc85xx_rdb_pic_init,
> > -#ifdef CONFIG_PCI
> > -	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
> > -	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
> > -#endif
> > -	.get_irq		= mpic_get_irq,
> > -	.calibrate_decr		= generic_calibrate_decr,
> > -	.progress		= udbg_progress,
> > -};
> > -
> >   define_machine(p1020_rdb) {
> >   	.name			= "P1020 RDB",
> >   	.probe			= p1020_rdb_probe,
> > @@ -222,20 +192,6 @@ define_machine(p1021_rdb_pc) {
> >   	.progress		= udbg_progress,
> >   };
> >   
> > -define_machine(p2020_rdb_pc) {
> > -	.name			= "P2020RDB-PC",
> > -	.probe			= p2020_rdb_pc_probe,
> > -	.setup_arch		= mpc85xx_rdb_setup_arch,
> > -	.init_IRQ		= mpc85xx_rdb_pic_init,
> > -#ifdef CONFIG_PCI
> > -	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
> > -	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
> > -#endif
> > -	.get_irq		= mpic_get_irq,
> > -	.calibrate_decr		= generic_calibrate_decr,
> > -	.progress		= udbg_progress,
> > -};
> > -
> >   define_machine(p1025_rdb) {
> >   	.name			= "P1025 RDB",
> >   	.probe			= p1025_rdb_probe,
> > diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/p2020.c
> > similarity index 65%
> > copy from arch/powerpc/platforms/85xx/mpc85xx_ds.c
> > copy to arch/powerpc/platforms/85xx/p2020.c
> > index 9a6d637ef54a..d65d4c88ac47 100644
> > --- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
> > +++ b/arch/powerpc/platforms/85xx/p2020.c
> > @@ -1,11 +1,9 @@
> >   // SPDX-License-Identifier: GPL-2.0-or-later
> >   /*
> > - * MPC85xx DS Board Setup
> > + * Freescale P2020 board Setup
> >    *
> > - * Author Xianghua Xiao (x.xiao@freescale.com)
> > - * Roy Zang <tie-fei.zang@freescale.com>
> > - * 	- Add PCI/PCI Exprees support
> > - * Copyright 2007 Freescale Semiconductor Inc.
> > + * Copyright 2007,2009,2012-2013 Freescale Semiconductor Inc.
> > + * Copyright 2022 Pali Rohár <pali@kernel.org>
> >    */
> >   
> >   #include <linux/stddef.h>
> > @@ -17,6 +15,7 @@
> >   #include <linux/interrupt.h>
> >   #include <linux/of_irq.h>
> >   #include <linux/of_platform.h>
> > +#include <linux/fsl/guts.h>
> >   
> >   #include <asm/time.h>
> >   #include <asm/machdep.h>
> > @@ -27,6 +26,8 @@
> >   #include <asm/i8259.h>
> >   #include <asm/swiotlb.h>
> >   
> > +#include <soc/fsl/qe/qe.h>
> > +
> >   #include <sysdev/fsl_soc.h>
> >   #include <sysdev/fsl_pci.h>
> >   #include "smp.h"
> > @@ -41,6 +42,8 @@
> >   #define DBG(fmt, args...)
> >   #endif
> >   
> > +#ifdef CONFIG_MPC85xx_DS
> > +
> >   #ifdef CONFIG_PPC_I8259
> >   static void mpc85xx_8259_cascade(struct irq_desc *desc)
> >   {
> > @@ -62,18 +65,11 @@ static void __init mpc85xx_ds_pic_init(void)
> >   	struct device_node *cascade_node = NULL;
> >   	int cascade_irq;
> >   #endif
> > -	if (of_machine_is_compatible("fsl,MPC8572DS-CAMP")) {
> > -		mpic = mpic_alloc(NULL, 0,
> > -			MPIC_NO_RESET |
> > -			MPIC_BIG_ENDIAN |
> > -			MPIC_SINGLE_DEST_CPU,
> > -			0, 256, " OpenPIC  ");
> > -	} else {
> > -		mpic = mpic_alloc(NULL, 0,
> > -			  MPIC_BIG_ENDIAN |
> > -			  MPIC_SINGLE_DEST_CPU,
> > -			0, 256, " OpenPIC  ");
> > -	}
> > +
> > +	mpic = mpic_alloc(NULL, 0,
> > +		  MPIC_BIG_ENDIAN |
> > +		  MPIC_SINGLE_DEST_CPU,
> > +		0, 256, " OpenPIC  ");
> >   
> >   	BUG_ON(mpic == NULL);
> >   	mpic_init(mpic);
> > @@ -142,9 +138,27 @@ static void __init mpc85xx_ds_uli_init(void)
> >   #endif
> >   }
> >   
> > +#endif /* CONFIG_MPC85xx_DS */
> > +
> > +#ifdef CONFIG_MPC85xx_RDB
> > +static void __init mpc85xx_rdb_pic_init(void)
> > +{
> > +	struct mpic *mpic;
> > +
> > +	mpic = mpic_alloc(NULL, 0,
> > +	  MPIC_BIG_ENDIAN |
> > +	  MPIC_SINGLE_DEST_CPU,
> > +	  0, 256, " OpenPIC  ");
> > +
> > +	BUG_ON(mpic == NULL);
> > +	mpic_init(mpic);
> > +}
> > +#endif /* CONFIG_MPC85xx_RDB */
> > +
> >   /*
> >    * Setup the architecture
> >    */
> > +#ifdef CONFIG_MPC85xx_DS
> >   static void __init mpc85xx_ds_setup_arch(void)
> >   {
> >   	if (ppc_md.progress)
> > @@ -157,38 +171,65 @@ static void __init mpc85xx_ds_setup_arch(void)
> >   
> >   	printk("MPC85xx DS board from Freescale Semiconductor\n");
> >   }
> > +#endif /* CONFIG_MPC85xx_DS */
> >   
> > -/*
> > - * Called very early, device-tree isn't unflattened
> > - */
> > -static int __init mpc8544_ds_probe(void)
> > +#ifdef CONFIG_MPC85xx_RDB
> > +static void __init mpc85xx_rdb_setup_arch(void)
> >   {
> > -	return !!of_machine_is_compatible("MPC8544DS");
> > +	if (ppc_md.progress)
> > +		ppc_md.progress("mpc85xx_rdb_setup_arch()", 0);
> > +
> > +	mpc85xx_smp_init();
> > +
> > +	fsl_pci_assign_primary();
> > +
> > +#ifdef CONFIG_QUICC_ENGINE
> > +	mpc85xx_qe_par_io_init();
> > +#endif	/* CONFIG_QUICC_ENGINE */
> > +
> > +	printk(KERN_INFO "MPC85xx RDB board from Freescale Semiconductor\n");
> >   }
> > +#endif /* CONFIG_MPC85xx_RDB */
> >   
> > -machine_arch_initcall(mpc8544_ds, mpc85xx_common_publish_devices);
> > -machine_arch_initcall(mpc8572_ds, mpc85xx_common_publish_devices);
> > +#ifdef CONFIG_MPC85xx_DS
> >   machine_arch_initcall(p2020_ds, mpc85xx_common_publish_devices);
> > +#endif /* CONFIG_MPC85xx_DS */
> >   
> > -/*
> > - * Called very early, device-tree isn't unflattened
> > - */
> > -static int __init mpc8572_ds_probe(void)
> > -{
> > -	return !!of_machine_is_compatible("fsl,MPC8572DS");
> > -}
> > +#ifdef CONFIG_MPC85xx_RDB
> > +machine_arch_initcall(p2020_rdb, mpc85xx_common_publish_devices);
> > +machine_arch_initcall(p2020_rdb_pc, mpc85xx_common_publish_devices);
> > +#endif /* CONFIG_MPC85xx_RDB */
> >   
> >   /*
> >    * Called very early, device-tree isn't unflattened
> >    */
> > +#ifdef CONFIG_MPC85xx_DS
> >   static int __init p2020_ds_probe(void)
> >   {
> >   	return !!of_machine_is_compatible("fsl,P2020DS");
> >   }
> > +#endif /* CONFIG_MPC85xx_DS */
> > +
> > +#ifdef CONFIG_MPC85xx_RDB
> > +static int __init p2020_rdb_probe(void)
> > +{
> > +	if (of_machine_is_compatible("fsl,P2020RDB"))
> > +		return 1;
> > +	return 0;
> > +}
> > +
> > +static int __init p2020_rdb_pc_probe(void)
> > +{
> > +	if (of_machine_is_compatible("fsl,P2020RDB-PC"))
> > +		return 1;
> > +	return 0;
> > +}
> > +#endif /* CONFIG_MPC85xx_RDB */
> >   
> > -define_machine(mpc8544_ds) {
> > -	.name			= "MPC8544 DS",
> > -	.probe			= mpc8544_ds_probe,
> > +#ifdef CONFIG_MPC85xx_DS
> > +define_machine(p2020_ds) {
> > +	.name			= "P2020 DS",
> > +	.probe			= p2020_ds_probe,
> >   	.setup_arch		= mpc85xx_ds_setup_arch,
> >   	.init_IRQ		= mpc85xx_ds_pic_init,
> >   #ifdef CONFIG_PCI
> > @@ -199,12 +240,14 @@ define_machine(mpc8544_ds) {
> >   	.calibrate_decr		= generic_calibrate_decr,
> >   	.progress		= udbg_progress,
> >   };
> > -
> > -define_machine(mpc8572_ds) {
> > -	.name			= "MPC8572 DS",
> > -	.probe			= mpc8572_ds_probe,
> > -	.setup_arch		= mpc85xx_ds_setup_arch,
> > -	.init_IRQ		= mpc85xx_ds_pic_init,
> > +#endif /* CONFIG_MPC85xx_DS */
> > +
> > +#ifdef CONFIG_MPC85xx_RDB
> > +define_machine(p2020_rdb) {
> > +	.name			= "P2020 RDB",
> > +	.probe			= p2020_rdb_probe,
> > +	.setup_arch		= mpc85xx_rdb_setup_arch,
> > +	.init_IRQ		= mpc85xx_rdb_pic_init,
> >   #ifdef CONFIG_PCI
> >   	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
> >   	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
> > @@ -214,11 +257,11 @@ define_machine(mpc8572_ds) {
> >   	.progress		= udbg_progress,
> >   };
> >   
> > -define_machine(p2020_ds) {
> > -	.name			= "P2020 DS",
> > -	.probe			= p2020_ds_probe,
> > -	.setup_arch		= mpc85xx_ds_setup_arch,
> > -	.init_IRQ		= mpc85xx_ds_pic_init,
> > +define_machine(p2020_rdb_pc) {
> > +	.name			= "P2020RDB-PC",
> > +	.probe			= p2020_rdb_pc_probe,
> > +	.setup_arch		= mpc85xx_rdb_setup_arch,
> > +	.init_IRQ		= mpc85xx_rdb_pic_init,
> >   #ifdef CONFIG_PCI
> >   	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
> >   	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
> > @@ -227,3 +270,4 @@ define_machine(p2020_ds) {
> >   	.calibrate_decr		= generic_calibrate_decr,
> >   	.progress		= udbg_progress,
> >   };
> > +#endif /* CONFIG_MPC85xx_RDB */
