Return-Path: <linuxppc-dev+bounces-14138-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3797C5480E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 21:47:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6Fnf4YGdz2yvR;
	Thu, 13 Nov 2025 07:47:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762980422;
	cv=none; b=aSg1+YsTTZycIGVhNq8/Yus96C2yrS6uujKJhTz1Nshmeuu3jhTcynKbIs53ItyN6MPK59GpSpPfQuLbyaNisPx2Cj3S2YNy920xx5voYtxs4EQyj0JeognUqdXLkjw0QEg26N41hWvbWhP4npBJT90uLqaheF67BBD+YDt9WCqaVMSRHv7ZlijQtQqXQndXAxEPXYarukxMjHsSLiwU+Ge/7ZFQkqqBJ5yv2lWhjSWqxPwIlIvAiDnfm1B53SHwDIumF0WRXlgD20YnqZDmD8GECHNUU09yu73lxx7p/QztT+ZaxQTS2mtR8MVVGGP+Q1ZSJCQ/ZPYoI00s80yVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762980422; c=relaxed/relaxed;
	bh=B0qU9GDj7zLI3gM4qosu2ZQC6DsPzB4LySvGeyeYPFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=R0KNNjiV15OJ0fk+psqhPpl6py7WTzwzz1pwBGLD/oxRy6XyteI4IxqTlf2Fuc4mEzOkW1q+3nc09/vRcAIn/D6l1JqwQ7mywLtZCE5TVtEaTt/88luF90r/wzuyLAs7bWVrHn87Auk7xbDT+e41F2DWf/PiLjtIgyURtzDUh37kzYmReD21sU2VzJ7rGqw01s2HaXiT209mMi9UniqISyvRlJJmKF4YpzH6arxx3/K1+GEnKghrjAV0Ah2SYoL4/aEzuL/59PXwEKgbAnvHLLAJI6eEj1pUN5A+g4xRLqxCrvk7ZHiyKIzNi0A1rZWXQ6IjFrBqoBIv1pTTdT660g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dKMYKfcQ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dKMYKfcQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6Fnd6kpkz2yv7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 07:47:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D586944544;
	Wed, 12 Nov 2025 20:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945E9C4CEF5;
	Wed, 12 Nov 2025 20:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762980419;
	bh=lJDXcU4HmyqsCodwOYZlrF98db34gvUMj2RqmNG9p5Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=dKMYKfcQlGxHL5i1//TBakdBTUaKDr8+kyK5mNZ04ErIRVeFBpq7rdCGhLYjB2IfQ
	 rJyc16fvGYnkrVawDsSf06LF6buucCuJkpA3KV5ZgpxpettYlwykHvmNyVBCmaSiW6
	 bt+Mm92ci37oJvf8ycARugxsFcHxnnNK/EEXtqXSxLv2v90zzLCBcc67+o9cgd/oro
	 U9glheJHz/iIimMEoR54E/Ph9oPL3HhUnd103YrVWqQquaeiip8kLQMEBn2LoXJDmI
	 URQZ+Pl9xzFOtv+MMrQxAMXTACJTh1B06qv7Uak2+lET4Qldkwsz944qrZUwCOxdc7
	 ZEnc1glDsuFbg==
Date: Wed, 12 Nov 2025 14:46:58 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
	mad skateman <madskateman@gmail.com>,
	"R. T. Dickinson" <rtd2@xtra.co.nz>,
	Darren Stevens <darren@stevens-zone.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Lukas Wunner <lukas@wunner.de>,
	luigi burdo <intermediadc@hotmail.com>, Al <al@datazap.net>,
	Hongxing Zhu <hongxing.zhu@nxp.com>, hypexed@yahoo.com.au,
	linuxppc-dev@lists.ozlabs.org, debian-powerpc@lists.debian.org,
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 2/4] PCI/ASPM: Add pcie_aspm_remove_cap() to override
 advertised link states
Message-ID: <20251112204658.GA2242023@bhelgaas>
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
In-Reply-To: <xkrehb72sk7x5iyxbkvydu356hgo5t2xr3asnwiddvhtz5eqam@jlzd6gwg256n>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

[-cc Roland]

On Wed, Nov 12, 2025 at 10:57:07PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Nov 10, 2025 at 04:22:26PM -0600, Bjorn Helgaas wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > Add pcie_aspm_remove_cap().  A quirk can use this to prevent use of ASPM
> > L0s or L1 link states, even if the device advertised support for them.

> > +void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap)
> > +{
> > +	if (lnkcap & PCI_EXP_LNKCAP_ASPM_L0S)
> > +		pdev->aspm_l0s_support = 0;
> > +	if (lnkcap & PCI_EXP_LNKCAP_ASPM_L1)
> > +		pdev->aspm_l1_support = 0;
> > +
> > +	pci_info(pdev, "ASPM:%s%s removed from Link Capabilities to avoid device defect\n",
> > +		 lnkcap & PCI_EXP_LNKCAP_ASPM_L0S ? " L0s" : "",
> > +		 lnkcap & PCI_EXP_LNKCAP_ASPM_L1 ? " L1" : "");
> 
> I think this gives a false impression that the ASPM CAPs are being
> removed from the LnkCap register. This function is just removing it
> from the internal cache and the LnkCap register is left unchanged.

Very true, this is confusing since we're not actually changing the
LnkCap register, so lspci etc will still show these states as
supported.  The quirk needs to work for arbitrary devices, and there's
no generic way to change LnkCap, so the quirk can't do that.

Any ideas for better wording?  I don't like "disable" because that
suggests that we're clearing bits in LnkCtl.

"L0s L1 in Link Capabilities will be ignored ..."?

"ignoring Link Capabilities L0s L1 ..."?

"L0s L1 treated as unsupported ..."?

