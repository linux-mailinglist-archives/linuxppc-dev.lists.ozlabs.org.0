Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D497051CC18
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 00:33:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvT4n5s4Cz3bnr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 08:33:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qKyg1Dej;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qKyg1Dej; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvT450Dcjz3bZC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 08:33:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37DC961F38;
 Thu,  5 May 2022 22:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1BBC385AE;
 Thu,  5 May 2022 22:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651789985;
 bh=IwLNVdmXkWJlJv1H8DWp3R3tO+S7/oJXphfMgwAIYX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qKyg1DejWTFAApJVOCIcjdgkYAfj42ZnoJqTr6/Qiqb/9HcOUG0IMxlQ/mKLX1qce
 u0e/CrnAjZc3WRX9AQbSlUlhzqucLUXIFZGkDfyp9z00pKR/qwqRnwAKeuPh0mFEtY
 D6E6gxIgfy4xf6gKYwWVkZbYMuncSQWVuNgANsVkJtnlF8DRKQIFTRafRFx6b5dqIj
 +faqz+HBw7hpnUZnJ4Zf3RQFul4vF10NDE2dz0OyBqEqYbyb9pZDgUl9MxloFNXBp2
 RDrkPsNlE+BWmFpZkOqtujVxyLfXAyMHHzXGU4nsdUCwWq8TLvQ72kCSWDCw5zZHJ6
 NltmTW3w6AmXA==
Received: by pali.im (Postfix)
 id 56A46945; Fri,  6 May 2022 00:33:02 +0200 (CEST)
Date: Fri, 6 May 2022 00:33:02 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pci: Add config option for using OF 'reg' for
 PCI domain
Message-ID: <20220505223302.2ydcssvdgoyqv7e5@pali>
References: <20220504175718.29011-1-pali@kernel.org>
 <8ffa0287-de5e-4308-07d8-204ac2e7f63a@csgroup.eu>
 <20220505093132.45ehu6pdfzmvt2xw@pali>
 <2cfb2cd8-3bad-3c66-b8ee-918d615f7719@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2cfb2cd8-3bad-3c66-b8ee-918d615f7719@linux.ibm.com>
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
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday 05 May 2022 15:10:01 Tyrel Datwyler wrote:
> On 5/5/22 02:31, Pali Rohár wrote:
> > Hello!
> > 
> > On Thursday 05 May 2022 07:16:40 Christophe Leroy wrote:
> >> Le 04/05/2022 à 19:57, Pali Rohár a écrit :
> >>> Since commit 63a72284b159 ("powerpc/pci: Assign fixed PHB number based on
> >>> device-tree properties"), powerpc kernel always fallback to PCI domain
> >>> assignment from OF / Device Tree 'reg' property of the PCI controller.
> >>>
> >>> PCI code for other Linux architectures use increasing assignment of the PCI
> >>> domain for individual controllers (assign the first free number), like it
> >>> was also for powerpc prior mentioned commit.
> >>>
> >>> Upgrading powerpc kernels from LTS 4.4 version (which does not contain
> >>> mentioned commit) to new LTS versions brings a regression in domain
> >>> assignment.
> >>
> >> Can you elaborate why it is a regression ?
> >>63a72284b159
> >> That commit says 'no functionnal changes', I'm having hard time 
> >> understanding how a nochange can be a regression.
> > 
> > It is not 'no functional change'. That commit completely changed PCI
> > domain assignment in a way that is incompatible with other architectures
> > and also incompatible with the way how it was done prior that commit.
> 
> I agree that the "no functional change" statement is incorrect. However, for
> most powerpc platforms it ended up being simply a cosmetic behavior change. As
> far as I can tell there is nothing requiring domain ids to increase montonically
> from zero or that each architecture is required to use the same domain numbering
> scheme.

That is truth. But it looks really suspicious why domains are not
assigned monotonically. Some scripts / applications are using PCI
location (domain:bus:dev:func) for remembering PCI device and domain
change can cause issue for config files. And some (older) applications
expects existence of domain zero. In systems without hot plug support
with small number of domains (e.g. 3) it means that there are always
domains 0, 1 and 2.

> Its hard to call this a true regression unless it actually broke
> something. The commit in question has been in the kernel since 4.8 which was
> released over 5 1/2 years ago.

I agree, it really depends on how you look at it.

The important is that lot of people are using LTS versions and are doing
upgrades when LTS support is dropped. Which for 4.4 now happened. So not
all smaller or "cosmetic" changes could be detected until longer LTS
period pass.

> With all that said looking closer at the code in question I think it is fair to
> assume that the author only intended this change for powernv and pseries
> platforms and not every powerpc platform. That change was done to make
> persistent naming easier to manage in userspace.

I agree that this behavior change may be useful in some situations and I
do not object this need.

> Your change defaults back to
> the old behavior which will now break both powernv and pseries platforms with
> regard to hotplugging and persistent naming.

I was aware of it, that change could cause issues. And that is why I
added config option for choosing behavior. So users would be able to
choose what they need.

> We could properly limit it to powernv and pseries by using ibm,fw-phb-id instead
> of reg property in the look up that follows a failed ibm,opal-phbid lookup. I
> think this is acceptable as long as no other powerpc platforms have started
> using this behavior for persistent naming.

And what about setting that new config option to enabled by default for
those series?

Or is there issue with introduction of the new config option?

One of the point is that it is really a good idea to have similar/same
behavior for all linux platforms. And if it cannot be enabled by default
(for backward compatibility) add at least some option, so new platforms
can start using it or users can decide to switch behavior.

> -Tyrel
> 
> > For example, prior that commit on P2020 RDB board were PCI domains 0, 1 and 2.
> > 
> > $ lspci
> > 0000:00:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
> > 0000:01:00.0 USB controller: Texas Instruments TUSB73x0 SuperSpeed USB 3.0 xHCI Host Controller (rev 02)
> > 0001:02:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
> > 0001:03:00.0 Network controller: Qualcomm Atheros AR93xx Wireless Network Adapter (rev 01)
> > 0002:04:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
> > 0002:05:00.0 Network controller: Qualcomm Atheros QCA986x/988x 802.11ac Wireless Network Adapter
> > 
> > After that commit on P2020 RDB board are PCI domains 0x8000, 0x9000 and 0xa000.
> > 
> > $ lspci
> > 8000:00:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
> > 8000:01:00.0 USB controller: Texas Instruments TUSB73x0 SuperSpeed USB 3.0 xHCI Host Controller (rev 02)
> > 9000:02:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
> > 9000:03:00.0 Network controller: Qualcomm Atheros AR93xx Wireless Network Adapter (rev 01)
> > a000:04:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
> > a000:05:00.0 Network controller: Qualcomm Atheros QCA986x/988x 802.11ac Wireless Network Adapter
> > 
> > It is somehow strange that PCI domains are not indexed one by one and
> > also that there is no domain 0
> > 
> > With my patch when CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG is not set, then
> > previous behavior used and PCI domains are again 0, 1 and 2.
> > 
> >> Usually we don't commit regressions to mainline ...
> >>
> >>
> >>>
> >>> Fix this issue by introducing a new option CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG
> >>> When this options is disabled then powerpc kernel would assign PCI domains
> >>> in the similar way like it is doing kernel for other architectures and also
> >>> how it was done prior that commit.
> >>
> >> You don't define CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG on by default, it 
> >> means this commit will change the behaviour. Is that expected ?
> >>
> >> Is that really worth a user selectable option ? Is the user able to 
> >> decide what he needs ?
> > 
> > Well, I hope that maintainers of that code answer to these questions.
> > 
> > In any case, I think that it could be a user selectable option as in
> > that commit is explained that in some situation is makes sense to do
> > PCI domain numbering based on DT reg.
> > 
> > But as I pointed above, upgrading from 4.4 TLS kernel to some new TLS
> > kernel brings above regression, so I think that there should be a way to
> > disable this behavior.
> > 
> > In my opinion, for people who are upgrading from 4.4 TLS kernel, this
> > option should be turned off by default (= do not change behavior). For
> > people who want same behaviour on powerpc as on other platforms, also it
> > should be turned off by default.
> > 
> >>>
> >>> Fixes: 63a72284b159 ("powerpc/pci: Assign fixed PHB number based on device-tree properties")
> >>
> >> Is that really a fix ? What is the problem really ?
> > 
> > Problem is that PCI domains were changed in a way that is not compatible
> > neither with version prior that commit and neither with how other linux
> > platforms assign PCI domains for controllers.
> > 
> >>> Signed-off-by: Pali Rohár <pali@kernel.org>
> >>> ---
> >>>   arch/powerpc/Kconfig             | 10 ++++++++++
> >>>   arch/powerpc/kernel/pci-common.c |  4 ++--
> >>>   2 files changed, 12 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> >>> index 174edabb74fa..4dd3e3acddda 100644
> >>> --- a/arch/powerpc/Kconfig
> >>> +++ b/arch/powerpc/Kconfig
> >>> @@ -375,6 +375,16 @@ config PPC_OF_PLATFORM_PCI
> >>>   	depends on PCI
> >>>   	depends on PPC64 # not supported on 32 bits yet
> >>>   
> >>> +config PPC_PCI_DOMAIN_FROM_OF_REG
> >>> +	bool "Use OF reg property for PCI domain"
> >>> +	depends on PCI
> >>
> >> Should it depend on PPC_OF_PLATFORM_PCI instead ?
> > 
> > No, PPC_OF_PLATFORM_PCI has line "depends on PPC64 # not supported on 32
> > bits yet". But it is already used also for e.g. P2020 which is 32-bit
> > platform.
> > 
> >>> +	help
> >>> +	  By default PCI domain for host bridge during its registration is
> >>> +	  chosen as the lowest unused PCI domain number.
> >>> +
> >>> +	  When this option is enabled then PCI domain is determined from
> >>> +	  the OF / Device Tree 'reg' property.
> >>> +
> >>>   config ARCH_SUPPORTS_UPROBES
> >>>   	def_bool y
> >>>   
> >>> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> >>> index 8bc9cf62cd93..8cb6fc5302ae 100644
> >>> --- a/arch/powerpc/kernel/pci-common.c
> >>> +++ b/arch/powerpc/kernel/pci-common.c
> >>> @@ -74,7 +74,6 @@ void __init set_pci_dma_ops(const struct dma_map_ops *dma_ops)
> >>>   static int get_phb_number(struct device_node *dn)
> >>>   {
> >>>   	int ret, phb_id = -1;
> >>> -	u32 prop_32;
> >>>   	u64 prop;
> >>>   
> >>>   	/*
> >>> @@ -83,7 +82,8 @@ static int get_phb_number(struct device_node *dn)
> >>>   	 * reading "ibm,opal-phbid", only present in OPAL environment.
> >>>   	 */
> >>>   	ret = of_property_read_u64(dn, "ibm,opal-phbid", &prop);
> >>
> >> This looks like very specific, it is not reflected in the commit log.
> > 
> > I have not changed nor touched this "ibm,opal-phbid" setting. And it was
> > not also touched in that mentioned patch. I see that no DTS file in
> > kernel use this option (so probably only DTS files supplied by
> > bootloader use it). So I thought that there is not reason to mention in
> > commit message.
> > 
> > But if you think so, I can add some info to commit message about it.
> > 
> >>> -	if (ret) {
> >>> +	if (ret && IS_ENABLED(CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG)) {
> >>> +		u32 prop_32;
> >>>   		ret = of_property_read_u32_index(dn, "reg", 1, &prop_32);
> >>>   		prop = prop_32;
> >>>   	}
> 
