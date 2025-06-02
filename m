Return-Path: <linuxppc-dev+bounces-9086-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C20EACBCAA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 23:19:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bB6Dj4RTRz2yFJ;
	Tue,  3 Jun 2025 07:19:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748899189;
	cv=none; b=HoDKWZY/RcpeCLzDoSkyiXAtjxagP3/WCNPJE0dVo9NEpQpdsDNZUeIrh3bRHd0MHyFy/4alcDafM7S5kXSGjxfluOaBUGsruexHA4RkTptfnLvDKhejBxVWQwQjn4RVEPwLuRc1kGGjjvh258LFAcPPkB0C+oM7F00rHsIKnUvl3qV2sk+OTQ1ZdVe7OWLTS+svjFLQq+gYB/bED1FqrH0J3/lbaibHaS+w7hWIcjPlma6d1EvKB0s/nsntHyQcns3tdDd14U1IUw8yVwHGgSdAUhh7WliS5fNc8/UgFo5MwpGywDasQppGvy6q8wD/R4PfJtViWSop852yKnHbyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748899189; c=relaxed/relaxed;
	bh=cvG5ebpKTZEmM8Z9VnrAL8jj9cDueMGGayXKA5dUonw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IzntzY2Yn2c4sQhSla3UeYXxm0c1ux/RxTug9GVBLFmLbZierh9JgPV06f7YP3N00WsvD3ddDs3OLk6FKRxNnMz7ZyS5kkWQKOYMY3WZuIAS22X96Vgm2iTAndj76ntDoj/n5nM6JAYCkt9XQp/j+6V0uXsvgZ0hiGtLR4tepjxdawCJFwL1BndVV6LdB66q9ipTUmUN3WEPwj0cT8qbeFAkLB8XfIZyu8g1BANYEMkSPlvjtApm3xtTIBKRJTuBRl9nClsUaxmxBjhrhmA/k0sQYus61regAdbDo64SBGVgG8Cbs6lL279sLt7FEB9QbnT2CpbMPa29r4rWDpErXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IfLj37KI; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IfLj37KI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bB6Dh5nGpz2xmZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 07:19:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88DF243C9D;
	Mon,  2 Jun 2025 21:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3319DC4CEEB;
	Mon,  2 Jun 2025 21:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748899186;
	bh=6mj/BlYXhWA2zqQmobSnww4HV6I3qNHM38OyJ0T6thY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=IfLj37KIEU0Jy+o62Y0/R/gpmCidEqsAZWzdxwnL5HG85g62rUbIrFSLo1ASjyW0E
	 y087JbYvyqH6P0sxoL5Qky0xSKuJSHtn/j8nE76kFXO/pv8Yvty3tt8qc7yiB5Xyfw
	 oR7816Es3kjDy+NpaxUuATsG/9yz3l6s0Mcf5TX3TWFDvUxPJHfYJve1DpFDrl5/TD
	 aTidwE3xAY+YwOXO+C4kxAEjuR3zzU0LFIplBOpp/6XKnqvxU1wpzdPOrFATsTLkVs
	 9KPt/oUZvn0rRo5D+EdjpdLuaozVtiIt7kB8psup46KAwCEAani/+R9Zz46DS9un6V
	 bN+Em+YzTa7Vg==
Date: Mon, 2 Jun 2025 16:19:44 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>, dingwei@marvell.com,
	cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <20250602211944.GA150795@bhelgaas>
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
In-Reply-To: <20250508-pcie-reset-slot-v4-4-7050093e2b50@linaro.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 08, 2025 at 12:40:33PM +0530, Manivannan Sadhasivam wrote:
> The PCI link, when down, needs to be recovered to bring it back. But that
> cannot be done in a generic way as link recovery procedure is specific to
> host bridges. So add a new API pci_host_handle_link_down() that could be
> called by the host bridge drivers when the link goes down.

IIUC you plumbed this into the reset path so the standard entries
(pci_reset_function() and the sysfs "reset" files) work can now work
for Root Ports on DT systems just like they do for ACPI systems
(assuming the ACPI systems supply an _RST method for the ports).  That
all sounds good.

> The API will iterate through all the slots and calls the pcie_do_recovery()
> function with 'pci_channel_io_frozen' as the state. This will result in the
> execution of the AER Fatal error handling code. Since the link down
> recovery is pretty much the same as AER Fatal error handling,
> pcie_do_recovery() helper is reused here. First the AER error_detected
> callback will be triggered for the bridge and the downstream devices. Then,
> pci_host_reset_slot() will be called for the slot, which will reset the
> slot using 'reset_slot' callback to recover the link. Once that's done,
> resume message will be broadcasted to the bridge and the downstream devices
> indicating successful link recovery.

We have standard PCIe mechanisms to learn about "link down" events,
e.g., AER Surprise Down error reporting and the Data Link Layer State
Changed events for hot-plug capable ports.

How does this controller-specific "link down" notification relate to
those?  Is this for controllers that don't support those AER or
hotplug mechanisms?  Or is this a different scenario that wouldn't be
covered by them?

If AER is enabled, do we get both the AER interrupt and the controller
"link down" interrupt?

> In case if the AER support is not enabled in the kernel, only
> pci_bus_error_reset() will be called for each slots as there is no way we
> could inform the drivers about link recovery.

