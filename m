Return-Path: <linuxppc-dev+bounces-14142-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F430C54F96
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Nov 2025 01:44:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6M462hjjz2yv5;
	Thu, 13 Nov 2025 11:44:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762994694;
	cv=none; b=hVVKeaXx+wS5DQJeyj7b7fHkl7ynJfL4VHsmjSOIAOyOHcDG13zxEiD2rFFx5tbBcsrBeKHpFcmqQfKlaIx6gUq4bY5u/jjfoK8vOUhku83BINzJg/izY8y6AQScyTR84ycDrtLglfZ8MiYzpBxnnDLPJtei4q9MSjyPtdCOxmvgT4SstxqJBBjVRxaWoi8lH9oAIE0D81uJmEhbz7dBcq4D3RYCIhG9quUfZYMoNOOdjxj5sUt4at8PFJH4axReweP/Q01k4MBpIS8M23MhdoZXb6+GE66i4u+0W5a+dQJWKE4SWNvzDPlDkuMSCNeytZaR39/i6ncv+tOO6d/MCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762994694; c=relaxed/relaxed;
	bh=JuKGewac0NW0cpMRPzepFL0zeHO94ZmT7r8fiqBUjmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JwzYCvPi5Ae8tyO3z5VAP75cOK1fwsVRrRFw2Uayxr7Q3FWHzoZozRYM2di3EjmyZYK22RtEYz1qY7bb0hUnLivkXhkfzN0hw8/Ba0NeKUej92vqaSiVGN7IlQNUl2E+7A523g+OYyOdFnp+/NWTWUmPD+Zu/I22XWGLsA9SeSAgmUq80dz3xWHFpPcG2PfJ40NDu8deCq9VUkYrDjlj9g6Lv6U6VzkQ8AxGFIHxgqvoqdmOvgLLbFKxXDnWH7iIgj6UZSf0jG2Ot+W+cEq4t6M4M9z+51jRajPpzFntYwJn/t1kBb1Hth4tIb/jRwzaD45wqwpAqskoNFxfiXgLtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o0VRMzbx; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o0VRMzbx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6M451ylJz2yjq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 11:44:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90E1E601BB;
	Thu, 13 Nov 2025 00:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22EBCC16AAE;
	Thu, 13 Nov 2025 00:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762994690;
	bh=57ae9P0/hhPWmajdru2W+nfLg3XVRIoY0iNOydVXYn4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=o0VRMzbxfOdJ0k1X0t5Em0PgWLCWr3i/rM9WQcSQt9kJFNb2oWS5gVBVdgG7g39JX
	 kZlFpNmIptAr9SEP1VGZStCJVUH7E/0KKLMdQIS7tswdVSjj2kzHGOuKpYe/AJY9ms
	 8PxC6ObQ7IL8uEB8FrdyApoSnGQtMmu3iwv6Ua46RjGTkUwnlo8fF2/ldbT7euyJrs
	 pTQaihVFnTbk8ok+d4MEo0PEfPe5VaOkwN5E6Z2zugPqos50/MjYQh2gkZJhRbYijr
	 QS+Uv+Gu7nw/lIPHs84aFKTeECQ+fP8BUu9KVn6NR3XGjvz5lodc1QIwnjk8VQdWRl
	 /TtwB3dFoBqHQ==
Date: Wed, 12 Nov 2025 18:44:48 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	mad skateman <madskateman@gmail.com>,
	"R.T.Dickinson" <rtd2@xtra.co.nz>,
	Christian Zigotzky <info@xenosoft.de>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
	Darren Stevens <darren@stevens-zone.net>,
	debian-powerpc@lists.debian.org,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Lukas Wunner <lukas@wunner.de>, regressions@lists.linux.dev,
	luigi burdo <intermediadc@hotmail.com>, Al <al@datazap.net>
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <20251113004448.GA2251273@bhelgaas>
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
In-Reply-To: <f4331d1c-8695-19c3-608b-210b3242aaf0@xenosoft.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 12, 2025 at 04:40:18AM +0100, Christian Zigotzky wrote:
> On 11/11/2025 01:20 PM, Bjorn Helgaas wrote:
> > On Tue, Nov 11, 2025 at 06:15:20AM +0100, Christian Zigotzky wrote:
> >> On 11/07/2025 06:06 AM, Christian Zigotzky wrote:
> >>> On 11/05/2025 11:09 PM, Bjorn Helgaas wrote:
> >>>>> I tested your patch with the RC4 of kernel 6.18 today. Unfortunately
> >>> it
> >>>>> doesn't solve the boot issue.
> >>>>
> >>>> Thanks for testing that.  I see now why that approach doesn't work:
> >>>> quirk_disable_aspm_l0s_l1() calls pci_disable_link_state(), which
> >>>> updates the permissible ASPM link states, but pci_disable_link_state()
> >>>> only works for devices at the downstream end of a link.  It doesn't
> >>>> work at all for Root Ports, which are at the upstream end of a link.
> >>>>
> >>>> Christian, you originally reported that both X5000 and X1000 were
> >>>> broken.  I suspect X1000 may have been fixed in v6.18-rc3 by
> >>>> df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree
> >>>> platforms"), but I would love to have confirmation of that.
> >>>
> >>> Hello Bjorn,
> >>>
> >>> I will enable CONFIG_PCIEASPM and CONFIG_PCIEASPM_DEFAULT for the RC5 of
> >>> kernel 6.18 and test it with the X1000.
> >>
> >> I tested the RC5 of kernel 6.18 with CONFIG_PCIEASPM and
> >> CONFIG_PCIEASPM_DEFAULT enabled on my X1000 today. Unfortunately the boot
> >> problems are still present.
> >
> > Thanks.  Can you post a dmesg somewhere so I can see what the relevant
> > device IDs are?  Can be with any kernel, doesn't have to be v6.18.  We
> > need the Vendor and Device IDs to add a quirk.
> 
> X1000 kernel 6.18.0-rc5 dmesg:
> https://github.com/user-attachments/files/23491291/dmesg_x1000.txt

Thanks!  This shows all the Root Ports are [1959:a002]:

  pci 0000:00:10.0: [1959:a002] type 01 class 0x060400 PCIe Root Port
  pci 0000:00:10.0: PCI bridge to [bus 01]
  pci 0000:01:00.0: [1002:6898] type 00 class 0x030000 PCIe Legacy Endpoint

I'm confused because Hypexed's 6.18.0-a7-dmesg.log from
https://github.com/chzigotzky/kernels/issues/17#issuecomment-3400419966
shows the same Root Ports, and apparently it booted fine even though
we enabled *everything*: 

  pci 0000:00:10.0: [1959:a002] type 01 class 0x060400 PCIe Root Port
  pci 0000:00:10.0: PCI bridge to [bus 01]
  pci 0000:01:00.0: [1002:6610] type 00 class 0x030000 PCIe Legacy Endpoint
  pci 0000:01:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2

It's *possible* that ASPM doesn't work on your endpoint (AMD Cypress
XT [Radeon HD 5870]) but does work on Hypexed's endpoint (AMD Oland XT
[Radeon HD 8670 / R5 340X OEM / R7 250/350/350X OEM]), but that seems
unlikely to me.

Maybe we just give up on ASPM on the [1959:a002] device.  A web search
doesn't show many users of it, so I don't know how many people would
care.

Bjorn

