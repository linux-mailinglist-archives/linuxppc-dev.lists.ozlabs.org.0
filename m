Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF7A5A0BA8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 10:37:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCxDg1knbz3c6y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 18:37:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AeUdWJUS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AeUdWJUS;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCxD034RLz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 18:37:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 24B8E61AD5;
	Thu, 25 Aug 2022 08:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6245BC433D6;
	Thu, 25 Aug 2022 08:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661416636;
	bh=DQkeUSNAM7a0Ct6liI0HLA9bV98qJ/CZ/IG4vaOqxsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AeUdWJUS3tnCZQdfBBXxvqxoDm+LX48nLuOD51qoa96w3LHQAFxU5gI/83osG5nY7
	 r0spjYhNDQh5jqZPHpG94ihNUVABK7OLJkCF2SmNjsx0fMPZiGRnJ7gHXfbNdqk/9S
	 ANCDy1eEnRTJxO2SHp6SGveStRURh5mFZ+njbQD8+kVkFdPU5gw3aP+u88svhy1phz
	 f4m+eZVDiB325dbsLCiFY8giD0eC2No9CuP0YyyK22/y+jVpkUYMTniNnLxt4usMyY
	 0QHHlU+lHa4+wtGCf3mEl51tkCRRseZsoe9+TBK1enKKptYAEnoOecBlwPyUTOGDY6
	 YR2Bw+GEiUm8w==
Received: by pali.im (Postfix)
	id 1CCC4742; Thu, 25 Aug 2022 10:37:13 +0200 (CEST)
Date: Thu, 25 Aug 2022 10:37:13 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pci: Enable PCI domains in /proc when PCI bus
 numbers are not unique
Message-ID: <20220825083713.4glfivegmodluiun@pali>
References: <20220820115113.30581-1-pali@kernel.org>
 <878rnclq47.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878rnclq47.fsf@mpe.ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday 25 August 2022 17:49:28 Michael Ellerman wrote:
> Pali Rohár <pali@kernel.org> writes:
> > On 32-bit powerpc systems with more PCIe controllers and more PCI domains,
> > where on more PCI domains are same PCI numbers, when kernel is compiled
> > with CONFIG_PROC_FS=y and CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT=y
> > options, kernel prints "proc_dir_entry 'pci/01' already registered" error
> > message.
> 
> Thanks, I'll pick this up.
> 
> > This regression started appearing after commit 566356813082 ("powerpc/pci:
> > Add config option for using all 256 PCI buses") in case in each mPCIe slot
> > is connected PCIe card and therefore PCI bus 1 is populated in for every
> > PCIe controller / PCI domain.
> >
> > The reason is that PCI procfs code expects that when PCI bus numbers are
> > not unique across all PCI domains, function pci_proc_domain() returns true
> > for domain dependent buses.
> >
> > Fix this issue by setting PCI_ENABLE_PROC_DOMAINS and PCI_COMPAT_DOMAIN_0
> > flags for 32-bit powerpc code when CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
> > is enabled. Same approach is already implemented for 64-bit powerpc code
> > (where PCI bus numbers are always domain dependent).
> 
> We also have the same in ppc4xx_pci_find_bridges().
> 
> And if we can eventually make CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
> the standard behaviour on 32-bit then everything would behave the same
> and we could simplify pci_proc_domain() to match what other arches do.

I sent two patches which do another steps to achieve it:
https://lore.kernel.org/linuxppc-dev/20220817163927.24453-1-pali@kernel.org/t/#u

Main blocker is pci-OF-bus-map which is in direct conflict with
CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT and which used on chrp and pmac.
And I have no idea if pci-OF-bus-map is still needed or not.

> cheers
> 
> 
> > Fixes: 566356813082 ("powerpc/pci: Add config option for using all 256 PCI buses")
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > ---
> >  arch/powerpc/kernel/pci_32.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
> > index ffc4e1928c80..8acbc9592ebb 100644
> > --- a/arch/powerpc/kernel/pci_32.c
> > +++ b/arch/powerpc/kernel/pci_32.c
> > @@ -249,6 +249,15 @@ static int __init pcibios_init(void)
> >  
> >  	printk(KERN_INFO "PCI: Probing PCI hardware\n");
> >  
> > +#ifdef CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
> > +	/*
> > +	 * Enable PCI domains in /proc when PCI bus numbers are not unique
> > +	 * across all PCI domains to prevent conflicts. And keep PCI domain 0
> > +	 * backward compatible in /proc for video cards.
> > +	 */
> > +	pci_add_flags(PCI_ENABLE_PROC_DOMAINS | PCI_COMPAT_DOMAIN_0);
> > +#endif
> > +
> >  	if (pci_has_flag(PCI_REASSIGN_ALL_BUS))
> >  		pci_assign_all_buses = 1;
> >  
> > -- 
> > 2.20.1
