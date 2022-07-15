Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F305765A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 19:12:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lkyb160yYz3cd2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 03:12:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dfN0uPKE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dfN0uPKE;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkyZN5rl9z3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 03:11:40 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D9DC62237;
	Fri, 15 Jul 2022 17:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D36AC34115;
	Fri, 15 Jul 2022 17:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657905095;
	bh=p0+be8P4mJSpNS9w7xRI+Uug5MZvY14f4VbucNXXoio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dfN0uPKEoJHsjrZ16wMRE+U8mUy79Engm2H+j29wl7llvEOh0cZoHz50aSsAi/JSB
	 Ghd3O1BP3YOdN+7THMTOItFNjrsmlFIUq2zZFUgSdxBmwtYe88iEAVr6OqgwprbKy3
	 2zG8Z1r/o/9kCxQyDeLjrBIvcmaf9rGihLckb297CFMCQq8Qg97sH3gEgFNzEz51e7
	 qLWmPKypPxqv9ULkzkU4SN2rCIMjW+5fayPDFCxdqzXgHMZ6+BjhMT/VRgvpLnXWyj
	 HhJB3IUEjCrvqroaoyaKHsWq8LF+h/s+rZ31KzFsc5I5cr3xor44C4dv8M05Ufwcee
	 I7dj5LUYfWYaA==
Received: by pali.im (Postfix)
	id 47F2DA32; Fri, 15 Jul 2022 19:11:32 +0200 (CEST)
Date: Fri, 15 Jul 2022 19:11:32 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH v2 1/2] powerpc/pci: Add config option for using OF 'reg'
 for PCI domain
Message-ID: <20220715171132.ujaexzm4ipad7o4f@pali>
References: <20220706102148.5060-1-pali@kernel.org>
 <17fb8d12-60f9-09d5-91fa-09d5a5a9a4fd@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17fb8d12-60f9-09d5-91fa-09d5a5a9a4fd@igalia.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Guowen Shan <gshan@redhat.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday 15 July 2022 11:55:04 Guilherme G. Piccoli wrote:
> On 06/07/2022 07:21, Pali Rohár wrote:
> > [...] 
> > Fix this issue and introduce a new option CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG.
> > When this option is disabled then powerpc kernel would assign PCI domains
> > in the similar way like it is doing kernel for other architectures,
> > starting from zero and also how it was done prior that commit.
> 
> I found this sentence a bit weird, "in the similar way like it is doing
> kernel for other architectures", but other than that:

If you have some idea how to improve commit description, let me know and
I can change it.

> Reviewed-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> 
> Thanks for the improvement!
> Cheers,
> 
> 
> Guilherme
> 
> 
> > 
> > This option is by default enabled for powernv and pseries platform for which
> > was that commit originally intended.
> > 
> > With this change upgrading kernels from LTS 4.4 version does not change PCI
> > domain on smaller embedded platforms with fixed number of PCIe controllers.
> > And also ensure that PCI domain zero is present as before that commit.
> > 
> > Fixes: 63a72284b159 ("powerpc/pci: Assign fixed PHB number based on device-tree properties")
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > ---
> > Changes in v2:
> > * Enable CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG by default on powernv and pseries
> > ---
> >  arch/powerpc/Kconfig             | 11 +++++++++++
> >  arch/powerpc/kernel/pci-common.c |  4 ++--
> >  2 files changed, 13 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index f66084bc1dfe..053a88e84049 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -386,6 +386,17 @@ config PPC_OF_PLATFORM_PCI
> >  	depends on PCI
> >  	depends on PPC64 # not supported on 32 bits yet
> >  
> > +config PPC_PCI_DOMAIN_FROM_OF_REG
> > +	bool "Use OF reg property for PCI domain"
> > +	depends on PCI
> > +	default y if PPC_PSERIES || PPC_POWERNV
> > +	help
> > +	  By default PCI domain for host bridge during its registration is
> > +	  chosen as the lowest unused PCI domain number.
> > +
> > +	  When this option is enabled then PCI domain can be determined
> > +	  also from lower bits of the OF / Device Tree 'reg' property.
> > +
> >  config ARCH_SUPPORTS_UPROBES
> >  	def_bool y
> >  
> > diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> > index 068410cd54a3..7f959df34833 100644
> > --- a/arch/powerpc/kernel/pci-common.c
> > +++ b/arch/powerpc/kernel/pci-common.c
> > @@ -74,7 +74,6 @@ void __init set_pci_dma_ops(const struct dma_map_ops *dma_ops)
> >  static int get_phb_number(struct device_node *dn)
> >  {
> >  	int ret, phb_id = -1;
> > -	u32 prop_32;
> >  	u64 prop;
> >  
> >  	/*
> > @@ -83,7 +82,8 @@ static int get_phb_number(struct device_node *dn)
> >  	 * reading "ibm,opal-phbid", only present in OPAL environment.
> >  	 */
> >  	ret = of_property_read_u64(dn, "ibm,opal-phbid", &prop);
> > -	if (ret) {
> > +	if (ret && IS_ENABLED(CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG)) {
> > +		u32 prop_32;
> >  		ret = of_property_read_u32_index(dn, "reg", 1, &prop_32);
> >  		prop = prop_32;
> >  	}
