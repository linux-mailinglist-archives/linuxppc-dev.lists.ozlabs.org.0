Return-Path: <linuxppc-dev+bounces-12728-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED81BC7723
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 07:37:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chzCh1b5Xz3cDN;
	Thu,  9 Oct 2025 16:37:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ef0:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759988240;
	cv=none; b=encsRrt6LUwJeyN9VU8Gxwaw2lgZ8eH9I8eFDsM+xemXdFU9bQzuo0+jqBmF4ux6A2Q68j2t9PbfMC4Kpalp3juB1zzCEqtvqRdG4CCi9MdRkVDO0wpnUXlDdBIWoQP/qq8VKbVh0ylo4qeNtJfy+szRSShkMJXn6sXeJsu6V5q21XA3RyPucNWJ9FbPxQub5HCUv2q9udhGz5S0vVDDBM3FlIs+AqsfsPpt+gbL6qRaCdJ2PxJlWXdZMJABk4nlu/IVN/a36/vp0BGnWHtWeLq9Bg+0rNOgA6xVC4JnvvkMuNWGfzVf9ucfxohJYgt0Sc/G9pQpvmkK1oUr66cGlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759988240; c=relaxed/relaxed;
	bh=+tpN2O6fR9WI13p0CIg6nzrDDPvtQapqYXSzBdGG/Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZxX2A4lvLQlcdH74B+3wFwRpxWHHL5nPmcevR8GYh51GQwsnC6SrVbGLKQaCuAfGT7R78Jj2lxsXJ6yNq8ofBE20EPuhKT40d+7yUinClnMr1t1qO/s1dM64gM25GmlvGv6c/KPCKCsFuyqxuirRrGdeThK1O3ieIp/Eo7uoIvUIt3FoGtqm/Mt6SjQhZ1mwAQgWprm2nsFQfrlEmR95bCAenwN3yGaOxKHyNwGWC0ghf5LC1GObVDZPg6AzUYKQmJ5BolImQMhkcQtYVTY2ccg9uMkG8D0tRT9CqapZR6u8NSX25IDimQulMNWasgtsx7m9+DUJFcrI1W7nPNgVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chzCg0XkZz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 16:37:18 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id B668320083CC;
	Thu,  9 Oct 2025 07:37:06 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id A8524495692; Thu,  9 Oct 2025 07:37:06 +0200 (CEST)
Date: Thu, 9 Oct 2025 07:37:06 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	mad skateman <madskateman@gmail.com>,
	"R.T.Dickinson" <rtd2@xtra.co.nz>,
	Christian Zigotzky <info@xenosoft.de>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
	Darren Stevens <darren@stevens-zone.net>,
	"debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <aOdKAp8P0WwVfjbv@wunner.de>
References: <20251008195136.GA634732@bhelgaas>
 <bf9ca58b-b54a-42fc-99f7-4edaa7e561f3@xenosoft.de>
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
In-Reply-To: <bf9ca58b-b54a-42fc-99f7-4edaa7e561f3@xenosoft.de>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 09, 2025 at 06:54:58AM +0200, Christian Zigotzky wrote:
> On 08 October 2025 at 09:51 pm, Bjorn Helgaas wrote:
> > On Wed, Oct 08, 2025 at 06:35:42PM +0200, Christian Zigotzky wrote:
> > > Our PPC boards [1] have boot problems since the pci-v6.18-changes. [2]
> > > 
> > > Without the pci-v6.18-changes, the PPC boards boot without any problems.
> > > 
> > > Boot log with error messages:
> > > https://github.com/user-attachments/files/22782016/Kernel_6.18_with_PCI_changes.log
> > > 
> > > Further information: https://github.com/chzigotzky/kernels/issues/17
> > 
> > Do you happen to have a similar log from a recent working kernel,
> > e.g., v6.17, that we could compare with?
> 
> Thanks for your answer. Here is a similar log from the kernel 6.17.0:
> https://github.com/user-attachments/files/22789946/Kernel_6.17.0_Cyrus_Plus_board_P5040.log

These lines are added in v6.18:

  pci 0000:01:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
  pci 0000:01:00.0: ASPM: DT platform, enabling ClockPM
  pci 0001:01:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
  pci 0001:01:00.0: ASPM: DT platform, enabling ClockPM
  pci 0001:03:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
  pci 0001:03:00.0: ASPM: DT platform, enabling ClockPM

Possible candidate:

f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")

More lines are added in v6.18:

  pci 0001:03:00.0: disabling bridge window [mem 0x00000000-0xffffffffffffffff 64bit pref] to [bus 04] (unused)
  pci 0001:02:01.0: disabling bridge window [mem 0x00000000-0xffffffffffffffff 64bit pref] to [bus 03-04] (unused)
  pci 0001:02:02.0: disabling bridge window [io  0x0000-0xffffffffffffffff] to [bus 05] (unused)
  pci 0001:02:02.0: disabling bridge window [mem 0x00000000-0xffffffffffffffff 64bit pref] to [bus 05] (unused)
  pci 0001:02:02.0: disabling bridge window [mem 0x00000000-0xffffffffffffffff] to [bus 05] (unused)
  pci 0001:02:03.0: disabling bridge window [io  0x0000-0xffffffffffffffff] to [bus 06] (unused)
  pci 0001:02:03.0: disabling bridge window [mem 0x00000000-0xffffffffffffffff 64bit pref] to [bus 06] (unused)
  pci 0001:02:03.0: disabling bridge window [mem 0x00000000-0xffffffffffffffff] to [bus 06] (unused)
  pci 0001:02:08.0: disabling bridge window [io  0x0000-0xffffffffffffffff] to [bus 07] (unused)
  pci 0001:02:08.0: disabling bridge window [mem 0x00000000-0xffffffffffffffff 64bit pref] to [bus 07] (unused)
  pci 0001:02:08.0: disabling bridge window [mem 0x00000000-0xffffffffffffffff] to [bus 07] (unused)
  pci 0001:02:10.0: disabling bridge window [io  0x0000-0xffffffffffffffff] to [bus 08] (unused)
  pci 0001:02:10.0: disabling bridge window [mem 0x00000000-0xffffffffffffffff 64bit pref] to [bus 08] (unused)
  pci 0001:02:10.0: disabling bridge window [mem 0x00000000-0xffffffffffffffff] to [bus 08] (unused)
  pci 0001:01:00.0: disabling bridge window [mem 0x00000000-0xffffffffffffffff 64bit pref] to [bus 02-08] (unused)
  pci_bus 0001:02: resource 2 [mem 0x00000000-0xffffffffffffffff 64bit pref disabled]
422a445
  pci_bus 0001:03: resource 2 [mem 0x00000000-0xffffffffffffffff 64bit pref disabled]
424a448,460
  pci_bus 0001:04: resource 2 [mem 0x00000000-0xffffffffffffffff 64bit pref disabled]
  pci_bus 0001:05: resource 0 [io  0x0000-0xffffffffffffffff disabled]
  pci_bus 0001:05: resource 1 [mem 0x00000000-0xffffffffffffffff disabled]
  pci_bus 0001:05: resource 2 [mem 0x00000000-0xffffffffffffffff 64bit pref disabled]
  pci_bus 0001:06: resource 0 [io  0x0000-0xffffffffffffffff disabled]
  pci_bus 0001:06: resource 1 [mem 0x00000000-0xffffffffffffffff disabled]
  pci_bus 0001:06: resource 2 [mem 0x00000000-0xffffffffffffffff 64bit pref disabled]
  pci_bus 0001:07: resource 0 [io  0x0000-0xffffffffffffffff disabled]
  pci_bus 0001:07: resource 1 [mem 0x00000000-0xffffffffffffffff disabled]
  pci_bus 0001:07: resource 2 [mem 0x00000000-0xffffffffffffffff 64bit pref disabled]
  pci_bus 0001:08: resource 0 [io  0x0000-0xffffffffffffffff disabled]
  pci_bus 0001:08: resource 1 [mem 0x00000000-0xffffffffffffffff disabled]
  pci_bus 0001:08: resource 2 [mem 0x00000000-0xffffffffffffffff 64bit pref disabled]

Possible candidate:

fead6a0b15bf ("Merge branch 'pci/resource'")

Adding Ilpo to cc.

Unrelated, it looks like 6a1eda745967 ("PCI/AER: Consolidate Error
Source ID logging in aer_isr_one_error_type()") erroneously omitted
a closing brace in the "no details found" string:

  pcieport 0001:00:00.0: AER: Correctable error message received from 0001:00:00.0 (no details found

Thanks,

Lukas

