Return-Path: <linuxppc-dev+bounces-12802-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B035BBD4B11
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 18:02:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clhtj2VbHz30P3;
	Tue, 14 Oct 2025 03:02:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760371325;
	cv=none; b=DcBHEOvME5xehuyFD6QABmc6y7yErHtnrZmO2kMT05tDzp85dlQEtmsyZ4ZOrkXEW+h1ADTUVvX5E8QejYudkcdrIZSHPJsJ6hrTJXEV6F16qb/5KWj3VUzRbhv3yzGu0ykExY1/gWw2wbZIA1J2Deklgk82qXIgyJrVVjfVRH6EGPX0SRJzg+hIu1JL/uoccKShrEAxrJogXtRo7VevaUyKAjxkKi3PRsNsDvVr8C/1PE70A9Qw7eggtIly+BY9mKtNVNLyMQI2Hkvl6ZAKoHoPyHn5NGqQVcHpxX8F+Joz+gnVka+XyBFAirRPUv4TloZ9BnX7OQsnm/VbmnqU4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760371325; c=relaxed/relaxed;
	bh=D3rBH6fJ3if0hTugwlEzY1GrZNRke8eE92podKj58lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4BAuR9gF83MVpUeikT1IKenuM9w1dJnb4D/ApdTtwkXMg+OsUCpFxoco012gpVdrPED1bskx1cgz7uCKTi4qiLC7v03DJfxLgscMNeMrP6xoGykal9HCXEXewj/IxBLSZM1x86Q0UO0tDPIbU37OHgBWM0DDRbicZIqgrheovI52wMAiiMEUZyrZmyhXMYBxp5jZqIJIS9VZo5Z4nz7NM76QdZwwFIqffYtkaPWrn6DIz7IFsIiMNe+c19NhRE11Aol+Tmz6Hb6QZ47/pOSWbnzuuZJRsocxZ4NP7tDKfxRa5H+BegvyODtExH2EYwGh848zoSBv7jzrQ7BWqdEEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kkkiw79w; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kkkiw79w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clhth3Lgpz302l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 03:02:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D940343C98;
	Mon, 13 Oct 2025 16:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B548DC4CEE7;
	Mon, 13 Oct 2025 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760371322;
	bh=zmWs4tyPdA4WSf506TonoWwzqbFwMzD2ey7AUqVphrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kkkiw79wL7Hof/AILG3pyTbRsVPGf1cs703PPmyV0W7PsPP+ptpwEo7RZpZXBZ3Pb
	 2BGDoaDCWx1H4lgm/h5JCR5oExPfQLwWzFx0QiA5GnlJd5eDQJXjYWSPemDe5u0ymJ
	 YdKnQYUNVLsXYNch3R5eh9y8T1isFqieT/LsIqkdLS+VviZyvHKoYP84wO0g349LxI
	 TdHODQT2CmgmeH2hkYIy8LpJqu85XrytPHLD6MhDstMEEfo5jgDfcXA82vqrYYbxAN
	 UJ+Fw0wK/9inL5MM4f/DUA6O1no7TX9lKMeWy4fRYgD5aZ6gpIacYLgs+SBThvSmEd
	 jPJahPvBexD4Q==
Date: Mon, 13 Oct 2025 21:31:48 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Lukas Wunner <lukas@wunner.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, mad skateman <madskateman@gmail.com>, 
	"R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au, Darren Stevens <darren@stevens-zone.net>, 
	debian-powerpc@lists.debian.org
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <rmczfftmndkj7vofbol6i3enl26dbqv4mbbqsxyiruif6xjfd3@3yotxa4j2com>
References: <0BE6C5AD-8DFD-4126-9B18-C012B522B442@xenosoft.de>
 <2E40B1CD-5EDA-4208-8914-D1FC02FE8185@xenosoft.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2E40B1CD-5EDA-4208-8914-D1FC02FE8185@xenosoft.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 13, 2025 at 07:02:19AM +0200, Christian Zigotzky wrote:
> 
> 
> > On 13 October 2025 at 06:47 am, Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
> > 
> > ﻿
> >> On 11 October 2025 at 07:36 pm, Manivannan Sadhasivam <mani@kernel.org> wrote:
> >> 
> >> Hi Lukas,
> >> 
> >> Thanks for looping me in. The referenced commit forcefully enables ASPM on all
> >> DT platforms as we decided to bite the bullet finally.
> >> 
> >> Looks like the device (0000:01:00.0) doesn't play nice with ASPM even though it
> >> advertises ASPM capability.
> >> 
> >> Christian, could you please test the below change and see if it fixes the issue?
> >> 
> >> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> >> index 214ed060ca1b..e006b0560b39 100644
> >> --- a/drivers/pci/quirks.c
> >> +++ b/drivers/pci/quirks.c
> >> @@ -2525,6 +2525,15 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
> >> */
> >> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
> >> 
> >> +
> >> +static void quirk_disable_aspm_all(struct pci_dev *dev)
> >> +{
> >> +       pci_info(dev, "Disabling ASPM\n");
> >> +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);
> >> +}
> >> +
> >> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6738, quirk_disable_aspm_all);
> >> +
> >> /*
> >> * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
> >> * Link bit cleared after starting the link retrain process to allow this
> >> 
> >> 
> >> Going forward, we should be quirking the devices if they behave erratically.
> >> 
> >> - Mani
> >> 
> >> --
> >> மணிவண்ணன் சதாசிவம்
> > 
> > Hello Mani,
> > 
> >> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6738, quirk_disable_aspm_all);
> > 
> > Is this only for my AMD Radeon HD6870?
> > 
> > My AMD Radeon HD5870 is also affected.
> > 
> > And I tested it with my AMD Radeon HD5870.
> > 
> > What would the line be for all AMD graphics cards?
> > 
> > Thanks,
> > Christian
> 
> I see. 0x6738 is for the AMD Radeon HD 6800 series.
> 
> It could be, that your patch works because I tested it with an AMD Radeon HD5870 instead of an AMD Radeon HD6870. Sorry 
> 
> This could be the correct line for the HD5870:
> 
> >> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6898, quirk_disable_aspm_all);
> 
> There are some more id numbers for the HD5870.
> 
> Correct:
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 214ed060ca1b..e006b0560b39 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -2525,6 +2525,15 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
> */
> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
> 
> +
> +static void quirk_disable_aspm_all(struct pci_dev *dev)
> +{
> +       pci_info(dev, "Disabling ASPM\n");
> +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);
> +}
> +
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6738, quirk_disable_aspm_all);

As you've figured out, we need to add the quirks for individual devices. Btw, I
just used PCIE_LINK_STATE_ALL to make sure the patch works. But for properly
fixing the issue, we need to try disabling L0s, L1 separately and check which
one (or both) is causing issue.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

