Return-Path: <linuxppc-dev+bounces-12918-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D5BBDE8A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 14:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmrY022mkz3dDg;
	Wed, 15 Oct 2025 23:50:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760532644;
	cv=none; b=Ai4yQufD1j4ZBkBUKUDCfRiXZb1fNNw+/T9pmIaXf52x3PJyoNwSAf90GzYYD81sMYf0gMV8zDON1YYvLE/HP+NABHPhFU9/1j/pJcv9bHvIdcXmdbRo1DDermR0BRKh89WqD893BGm5KxeJS9mjlaDtV5n8LXECNNm9chrmAoX1ztPQe73MpfDHnlypldrZh25GQDwD15Dx6fdeqfqAAY+Anxo7SfXpDx5wi2tAf33FMHmex19A8UoxJOIYuJIDcO2xUb+n/UEeqJr+Ex3arkTeDej+76g0s3uhVAAnmlLS20Nyb6IhGl/O7OEnvaoRiBE4zGo9BaCWRUqCUtwEGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760532644; c=relaxed/relaxed;
	bh=o0XL9dXSTM9JrPA0Rx5KPc0/DRSMuXbha7ZFydAvPVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ir24Ja5K1Tz7dOKIs25775yJWSYr6huOY3TL2TaxWS0fRUd0pOS1Q0pzZHrt+zfZ9ozQeFEua/HAWONm/nEBNmOzU/K671/L4/C4Y7TMohH87VjP6/pJ64++RL1mITEpQBUTqLwlYvVnhw0CkoTKRrYbU47WJ9WfbnaAjqXW910VLzlFXS9ltXtw2uUDCT9EcLqWaHEWognS+3fn36zx0IORrk75RsZTPimF9KKe4D2J+QtlT1jzAwzUfIj0Sn6Ps5GLd1hGSYqMlTXveMcUQ+/ofRIoAJVJeKNZyljZ8UFcssxOvQ/+aI7N15gul7C3/C20Ok5LeLbFlgl632FznQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m6AWUj0I; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m6AWUj0I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmrXz3hMjz3dBy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 23:50:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48AA144B14;
	Wed, 15 Oct 2025 12:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7925DC113D0;
	Wed, 15 Oct 2025 12:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760532641;
	bh=Eb4JLoZqVqU9ky2AENiU0jUGVLJvJ3LzN4uBoMOWI9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6AWUj0IPKxHXNLCsCxBe6Z/Duk6JjjFCDlQ0ecK0dKAo2pXI6YLZO0ohCgNnmOgc
	 zq6hamFjf5/ZQz7mxwBDRGMnneW/Nm0lzUw90lzJWLdrKc/0vrLWsWhrSixjX8gZfj
	 Aead77stdNIBSalhSl69mv98BaPBo3y6lBVXjlpKmJurfXQiqt9QZM51exHATchMev
	 fhLOxVY/DRJMu6r/oE7fgVD4k36OajpN2cBZSfrEYJtYDfGqu4pNZqvVRQIrFhBYsy
	 ZpLjAexovRpN5wdvdkOv70AxvRP5wNPrQDzjn1k8WLu7j3eAPVa/8gb4YtYuaim/Fq
	 mfFd++d82yatQ==
Date: Wed, 15 Oct 2025 18:20:22 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>, 
	Bjorn Helgaas <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	linux-pci@vger.kernel.org, mad skateman <madskateman@gmail.com>, 
	"R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au, Darren Stevens <darren@stevens-zone.net>, 
	debian-powerpc@lists.debian.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <4rtktpyqgvmpyvars3w3gvbny56y4bayw52vwjc3my3q2hw3ew@onz4v2p2uh5i>
References: <20251015101304.3ec03e6b@bootlin.com>
 <A11312DD-8A5A-4456-B0E3-BC8EF37B21A7@xenosoft.de>
 <20251015135811.58b22331@bootlin.com>
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
In-Reply-To: <20251015135811.58b22331@bootlin.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Herve,

On Wed, Oct 15, 2025 at 01:58:11PM +0200, Herve Codina wrote:
> Hi Christian,
> 
> On Wed, 15 Oct 2025 13:30:44 +0200
> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
> 
> > Hello Herve,
> > 
> > > On 15 October 2025 at 10:39 am, Herve Codina <herve.codina@bootlin.com> wrote:
> > > 
> > > ﻿Hi All,
> > > 
> > > I also observed issues with the commit f3ac2ff14834 ("PCI/ASPM: Enable all
> > > ClockPM and ASPM states for devicetree platforms")  
> > 
> > Thanks for reporting.
> > 
> > > 
> > > Also tried the quirk proposed in this discussion (quirk_disable_aspm_all)
> > > an the quirk also fixes the timing issue.  
> > 
> > Where have you added quirk_disable_aspm_all?
> 
> --- 8< ---
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 214ed060ca1b..a3808ab6e92e 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -2525,6 +2525,17 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
>   */
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
>  
> +static void quirk_disable_aspm_all(struct pci_dev *dev)
> +{
> +       pci_info(dev, "Disabling ASPM\n");
> +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);

Could you please try disabling L1SS and L0s separately to see which one is
causing the issue? Like,

	pci_disable_link_state(dev, PCIE_LINK_STATE_L1_1 | PCIE_LINK_STATE_L1_2);

	pci_disable_link_state(dev, PCIE_LINK_STATE_L0S);

- Mani

-- 
மணிவண்ணன் சதாசிவம்

