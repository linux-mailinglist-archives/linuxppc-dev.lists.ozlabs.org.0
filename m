Return-Path: <linuxppc-dev+bounces-12775-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B11DDBCF015
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Oct 2025 07:32:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ckC1X41yMz2yr9;
	Sat, 11 Oct 2025 16:32:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.242.62
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760160768;
	cv=none; b=mvZkpQTR593v953lmVx0n+nKLAty1ngY2YC6GlJurT1K61TD0RS2CYMmN+nKRxrrXiJ7UuMtoYqvApfpDZh9lMPtHbnu0H6E6nutKuJTZ+2eOp8XOOZbMjKVpKcG2K2158dytrwYHS5laDWGLqo2b8dilg2MKV2qtNKuq9xZ72c2cxcNoKMYcGT/MaW3CNlP2brP3eHoHyzQpx+tyAvmy8sTBVLJE8fEJn5yN6RcbZFVI2cTi885gVkjxeOmvwEgwJ1DDxaB3YkmzsiDhA70MG2oqvbKW/IrWWJ4R9IyGQnTrk5ykg23H/xBQIkRZHo32tPnDTidsnEMnprPiWaRQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760160768; c=relaxed/relaxed;
	bh=olfOof6KYpHd+T9VK9zcttUC2nr/fD3dhNKaxdAn02k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YL8ZLDhQ1dSdA3maqH2+g55JoMUEvl1MP17EG8/8fA8tQpf+qvSu8vGKRb6v6AvR4pa79dO0t2jmfO1khtSTHaXA0q5rJHC5NfC+nCNCkOCUZM7otn6E132lQgc3L38F4+xptOx43Gv1x1AlnPWFw72EWRx0pVQxOuqcYkFrVwTmKZwsqidEqt9wU1D6SIl8K+AcZV5Ba/Jmo4ochAGg3YVPWA0+REpPS93C6+5NRwCL5PhQbGxxZhMSRCVEzGmCC3MvWyW7q+XoFEt7xsRDhuUP0n3zuQJi5aJ9i2PHtq1mocBq8WAvoqyrtNPcndGW32XEKzcXHJvcmGgNP2/4nA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 428 seconds by postgrey-1.37 at boromir; Sat, 11 Oct 2025 16:32:46 AEDT
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ckC1V6BjXz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Oct 2025 16:32:46 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id C3D2E2C06F50;
	Sat, 11 Oct 2025 07:25:26 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 852524A12; Sat, 11 Oct 2025 07:25:26 +0200 (CEST)
Date: Sat, 11 Oct 2025 07:25:26 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	mad skateman <madskateman@gmail.com>,
	"R.T.Dickinson" <rtd2@xtra.co.nz>,
	Christian Zigotzky <info@xenosoft.de>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
	Darren Stevens <darren@stevens-zone.net>,
	"debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <aOnqRqmHfaguJqyS@wunner.de>
References: <20251008195136.GA634732@bhelgaas>
 <bf9ca58b-b54a-42fc-99f7-4edaa7e561f3@xenosoft.de>
 <aOdKAp8P0WwVfjbv@wunner.de>
 <d89576ac-c34c-4832-b51b-cf6f60c5c85c@xenosoft.de>
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
In-Reply-To: <d89576ac-c34c-4832-b51b-cf6f60c5c85c@xenosoft.de>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

[cc += Mani]

On Sat, Oct 11, 2025 at 07:12:49AM +0200, Christian Zigotzky wrote:
> On 09 October 2025 at 07:37 am, Lukas Wunner wrote:
> > On Thu, Oct 09, 2025 at 06:54:58AM +0200, Christian Zigotzky wrote:
> > > On 08 October 2025 at 09:51 pm, Bjorn Helgaas wrote:
> > > > On Wed, Oct 08, 2025 at 06:35:42PM +0200, Christian Zigotzky wrote:
> > > > > Our PPC boards [1] have boot problems since the pci-v6.18-changes. [2]
> > > > > 
> > > > > Without the pci-v6.18-changes, the PPC boards boot without any problems.
> > > > > 
> > > > > Boot log with error messages:
> > > > > https://github.com/user-attachments/files/22782016/Kernel_6.18_with_PCI_changes.log
> > > > > 
> > > > > Further information: https://github.com/chzigotzky/kernels/issues/17
> > > > Do you happen to have a similar log from a recent working kernel,
> > > > e.g., v6.17, that we could compare with?
> > > Thanks for your answer. Here is a similar log from the kernel 6.17.0:
> > > https://github.com/user-attachments/files/22789946/Kernel_6.17.0_Cyrus_Plus_board_P5040.log
> > These lines are added in v6.18:
> > 
> >    pci 0000:01:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
> >    pci 0000:01:00.0: ASPM: DT platform, enabling ClockPM
> >    pci 0001:01:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
> >    pci 0001:01:00.0: ASPM: DT platform, enabling ClockPM
> >    pci 0001:03:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
> >    pci 0001:03:00.0: ASPM: DT platform, enabling ClockPM
> > 
> > Possible candidate:
> > 
> > f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
> 
> After reverting the commit f3ac2ff14834, the kernel boots without any
> problems.
> 
> f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree
> platforms") is the bad commit.

Hi Mani, your commit f3ac2ff14834 is causing a regression on certain
powerpc machines.  Any ideas?

Thanks,

Lukas

