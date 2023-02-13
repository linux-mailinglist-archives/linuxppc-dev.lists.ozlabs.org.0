Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7846951BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 21:19:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFwfX62PHz30RJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 07:19:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xir4goSR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xir4goSR;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFwdZ5pZjz3bVP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 07:18:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 150E3B81908;
	Mon, 13 Feb 2023 20:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E58C433EF;
	Mon, 13 Feb 2023 20:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676319502;
	bh=RnVBagAMOmkHvQopNbeQ+l1UqK7L+0+OD4GzcEr+ujw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xir4goSRalMuDHdCcM8LIh2kAo9paTl0P17cnPsZOHHAajJ7pGbI8Tb+HYlbxZXau
	 faGhk/lHBcaPkQfEwO87UEe3kF8CbMoV7zOq69Sj0lvzeVYlik/JXn1osxDDyTNHk2
	 8Phx08FYAGyWhX3W+aWmHrdwJxzXMUIFTHy36VD2WDR3mvv93znyTnstxEyDoAcrfm
	 LGBoWI/f9heIIVlCfbintYAuG+8EmS8ZoofF4nkpyAMVB7ThmCp9q0FyqSdrIi4QkK
	 0wv1i2NR6ywi/hMT08G36U8bovc/jf+aVefy1AFgUqawo+OhOLSl2m1PSIFz9EAgDn
	 Go1pyISDhlNag==
Received: by pali.im (Postfix)
	id 18C00687; Mon, 13 Feb 2023 21:18:20 +0100 (CET)
Date: Mon, 13 Feb 2023 21:18:20 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 6/8] powerpc/85xx: p2020: Define just one machine
 description
Message-ID: <20230213201820.xej7opc55e6obiti@pali>
References: <20221224211425.14983-1-pali@kernel.org>
 <20221224211425.14983-7-pali@kernel.org>
 <fc688761-5854-a171-c5e9-fae9eb25e798@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc688761-5854-a171-c5e9-fae9eb25e798@csgroup.eu>
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
Cc: Sinan Akman <sinan@writeme.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Scott Wood <oss@buserror.net>, Martin Kennedy <hurricos@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 13 February 2023 20:08:52 Christophe Leroy wrote:
> Le 24/12/2022 à 22:14, Pali Rohár a écrit :
> > Combine machine descriptions and code of all P2020 boards into just one
> > generic unified P2020 machine description. This allows kernel to boot on
> > any P2020-based board with P2020 DTS file without need to patch kernel and
> > define a new machine description in 85xx powerpc platform directory.
> > 
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > ---
> >   arch/powerpc/platforms/85xx/p2020.c | 83 +++++++----------------------
> >   1 file changed, 19 insertions(+), 64 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/85xx/p2020.c b/arch/powerpc/platforms/85xx/p2020.c
> > index adf3750abef9..b3fb600e1d83 100644
> > --- a/arch/powerpc/platforms/85xx/p2020.c
> > +++ b/arch/powerpc/platforms/85xx/p2020.c
> > @@ -156,83 +156,38 @@ static void __init p2020_setup_arch(void)
> >   #endif
> >   }
> >   
> > -#ifdef CONFIG_MPC85xx_DS
> > -machine_arch_initcall(p2020_ds, mpc85xx_common_publish_devices);
> > -#endif /* CONFIG_MPC85xx_DS */
> > -
> > -#ifdef CONFIG_MPC85xx_RDB
> > -machine_arch_initcall(p2020_rdb, mpc85xx_common_publish_devices);
> > -machine_arch_initcall(p2020_rdb_pc, mpc85xx_common_publish_devices);
> > -#endif /* CONFIG_MPC85xx_RDB */
> > +machine_arch_initcall(p2020, mpc85xx_common_publish_devices);
> >   
> >   /*
> >    * Called very early, device-tree isn't unflattened
> >    */
> > -#ifdef CONFIG_MPC85xx_DS
> > -static int __init p2020_ds_probe(void)
> > -{
> > -	return !!of_machine_is_compatible("fsl,P2020DS");
> > -}
> > -#endif /* CONFIG_MPC85xx_DS */
> > -
> > -#ifdef CONFIG_MPC85xx_RDB
> > -static int __init p2020_rdb_probe(void)
> > -{
> > -	if (of_machine_is_compatible("fsl,P2020RDB"))
> > -		return 1;
> > -	return 0;
> > -}
> > -
> > -static int __init p2020_rdb_pc_probe(void)
> > +static int __init p2020_probe(void)
> >   {
> > -	if (of_machine_is_compatible("fsl,P2020RDB-PC"))
> > -		return 1;
> > -	return 0;
> > +	struct device_node *p2020_cpu;
> > +
> > +	/*
> > +	 * There is no common compatible string for all P2020 boards.
> > +	 * The only common thing is "PowerPC,P2020@0" cpu node.
> > +	 * So check for P2020 board via this cpu node.
> > +	 */
> > +	p2020_cpu = of_find_node_by_path("/cpus/PowerPC,P2020@0");
> > +	if (!p2020_cpu)
> > +		return 0;
> > +
> > +	of_node_put(p2020_cpu);
> 
> of_node_put() already checks for nullity of its parameter, so you can 
> simplify stuff here, something like
> 
> 	p2020_cpu = of_find_node_by_path("/cpus/PowerPC,P2020@0");
> 	of_node_put(p2020_cpu);
> 
> 	return !!p2020_cpu;

Ok!

> > +	return 1;
> >   }
> > -#endif /* CONFIG_MPC85xx_RDB */
> > -
> > -#ifdef CONFIG_MPC85xx_DS
> > -define_machine(p2020_ds) {
> > -	.name			= "P2020 DS",
> > -	.probe			= p2020_ds_probe,
> > -	.setup_arch		= p2020_setup_arch,
> > -	.init_IRQ		= p2020_pic_init,
> > -#ifdef CONFIG_PCI
> > -	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
> > -	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
> > -#endif
> > -	.get_irq		= mpic_get_irq,
> > -	.calibrate_decr		= generic_calibrate_decr,
> > -	.progress		= udbg_progress,
> > -};
> > -#endif /* CONFIG_MPC85xx_DS */
> > -
> > -#ifdef CONFIG_MPC85xx_RDB
> > -define_machine(p2020_rdb) {
> > -	.name			= "P2020 RDB",
> > -	.probe			= p2020_rdb_probe,
> > -	.setup_arch		= p2020_setup_arch,
> > -	.init_IRQ		= p2020_pic_init,
> > -#ifdef CONFIG_PCI
> > -	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
> > -	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
> > -#endif
> > -	.get_irq		= mpic_get_irq,
> > -	.calibrate_decr		= generic_calibrate_decr,
> > -	.progress		= udbg_progress,
> > -};
> >   
> > -define_machine(p2020_rdb_pc) {
> > -	.name			= "P2020RDB-PC",
> > -	.probe			= p2020_rdb_pc_probe,
> > +define_machine(p2020) {
> > +	.name			= "Freescale P2020",
> > +	.probe			= p2020_probe,
> >   	.setup_arch		= p2020_setup_arch,
> >   	.init_IRQ		= p2020_pic_init,
> >   #ifdef CONFIG_PCI
> >   	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
> > -	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
> > +	.pcibios_fixup_phb	= fsl_pcibios_fixup_phb,
> >   #endif
> >   	.get_irq		= mpic_get_irq,
> >   	.calibrate_decr		= generic_calibrate_decr,
> >   	.progress		= udbg_progress,
> >   };
> > -#endif /* CONFIG_MPC85xx_RDB */
