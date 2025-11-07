Return-Path: <linuxppc-dev+bounces-13915-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8674C3E864
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 06:35:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2npf4VG7z3bsN;
	Fri,  7 Nov 2025 16:35:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ef0:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762493754;
	cv=none; b=XvatE+FVbhamQd7VHn60WEQJE9aPuEfdhReQqJbJ2dTXrxUdOeKWc2rLc53JXPZJFUg7JGtNluTGBlxmsB+CfH8VQUCiKWh34i+vF3xeOyoazFMA1IphuF/BCJ8j5FmqNdya3oPOyPVCITOsj1zAocCFkPzjm2R3VLbnmpOjkvoIS5dmiolxwcIHtu0mbfS41nMucBxek0ErJVaMrIACtCrbkoQRfg00SShvyRvzTEvzPXLwI7djFtMTjpHDc1414MqYQEPAx3OANjCErUg0A4YAHkXpGeC56lDu91caq9I4hA31NgdXQ7rfgD7/yCy5vb3/FXdfOlghJ/7hR3YQUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762493754; c=relaxed/relaxed;
	bh=26MuIXUtAwhjogIhC9lTFSY92pYtKn2b8YK/ra97v78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3oZiUZg6cH2QEKKtLsDDlJTFoY1Cwvan22gwlGMTA+JzTTR7FDuLXXw3iiSfb2bpxHv//pl3R2S4iTAZf6OzJhJNYaBeT1ibKYwUuM1icraPN1nRdR9x9Iwhvojtab0cmcLaiCi6LHEhDtSWATq8YZ5T2g+GCXC3jO+/NiABaU76Js+MF715Fsr3Vu/Lw6/qTcNpPofWm4FOUFwMa/2Ynwq6u8UHsTQg06D5VcvgBUBVZXiyXinMxMeje1BAxkEkTLHV38QoPvb8OTikz12CG0lgQi+/zTUT32EbskarSa/mMzZWE4fPXPY4wSML/nRxCdm6fAcM50j1ckXWZBSaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2npd6Qv4z2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 16:35:53 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 2FCBC20083CF;
	Fri,  7 Nov 2025 06:35:49 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 18CF2469; Fri,  7 Nov 2025 06:35:49 +0100 (CET)
Date: Fri, 7 Nov 2025 06:35:49 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	mad skateman <madskateman@gmail.com>,
	"R . T . Dickinson" <rtd2@xtra.co.nz>,
	Darren Stevens <darren@stevens-zone.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	luigi burdo <intermediadc@hotmail.com>, Al <al@datazap.net>,
	Roland <rol7and@gmx.com>, Hongxing Zhu <hongxing.zhu@nxp.com>,
	hypexed@yahoo.com.au, linuxppc-dev@lists.ozlabs.org,
	debian-powerpc@lists.debian.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 2/2] PCI/ASPM: Avoid L0s and L1 on Freescale Root Ports
Message-ID: <aQ2FNfdDPUdA27rS@wunner.de>
References: <20251106183643.1963801-1-helgaas@kernel.org>
 <20251106183643.1963801-3-helgaas@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106183643.1963801-3-helgaas@kernel.org>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 06, 2025 at 12:36:39PM -0600, Bjorn Helgaas wrote:
> +++ b/drivers/pci/quirks.c
> @@ -2525,6 +2525,18 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
>   */
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
>  
> +/*
> + * Remove ASPM L0s and L1 support from cached copy of Link Capabilities so
> + * aspm.c won't try to enable them.
> + */
> +static void quirk_disable_aspm_l0s_l1_cap(struct pci_dev *dev)
> +{
> +	dev->lnkcap &= ~PCI_EXP_LNKCAP_ASPM_L0S;
> +	dev->lnkcap &= ~PCI_EXP_LNKCAP_ASPM_L1;
> +	pci_info(dev, "ASPM: L0s L1 removed from Link Capabilities to work around device defect\n");
> +}
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_FREESCALE, 0x0451, quirk_disable_aspm_l0s_l1_cap);
> +

Hm, I liked the nice generic pcie_aspm_disable_cap() helper that
you had in this earlier version:

https://lore.kernel.org/all/20251105220925.GA1926619@bhelgaas/

Thanks,

Lukas

