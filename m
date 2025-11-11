Return-Path: <linuxppc-dev+bounces-14086-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9160CC4CAF1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 10:33:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5LvM4L9Tz2yvd;
	Tue, 11 Nov 2025 20:33:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.78.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762853631;
	cv=none; b=JRkIasDkNYMaJ7rzLm9R+tlN2i0cNbgSdfEZwYOiitDw7X14EKGJVps9XMRRQejDqPRuMAfJsFZqmaAyZ23TyVL2BfTHXJQMVWTchrTaZ+S7wFziod9aiuqajDYLD1M6sN0jFzUwSNFY8QxfGRemNXo3b0mR0Mtwr878ghA25hOAgNYaIZpAS3j3Nl9DyVyE9oKHeydCz/K6h7Nen0rZhWLvtQDrx/swjf3zCW/mnc4nI1IGPc/JzJTXCwigoz+zIf6dIZIgZA7ts+5eTk34j5Pg0Bjp8Ar/oeMULhmZ+0LzQo4wIpbbpLJrgjuS68ipAqErywcLxPPLGkhOa+R/uA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762853631; c=relaxed/relaxed;
	bh=WUn3AQySGtfkrc+86vlQW4vdfX9eNmZsHkiRw9uhCT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W382DgIuX5LIcK05Ycge9WK3rYrlgQMXGZzYb4Sq4UC/yie8hLZ0/PzEUW28s0n1wdZePLYQ9sZ7GpMg3pEvmCQxZa1Z/E20lmwXY/h3bKKwlSb0Qn/9jq7blaT0p4jPuYsEYxhf1DFKWg0jbjB5PL2+0fE/PCh7U4z14TGB66E/kWXm1gqc9SA2mrBUTgQhV5aC887yRzdyXqj5N5drCm+WM5Y9irzJddNkxKso0V5ex4S4Jf38uD3u9eqVubjsPrO2euNZ1d2HVnVdLV5t2Sf3oGoi4jbco7Y+eAMKN9UN75wKFfIMsIM78kOK9GJyjCICCe82YeiFHTrDrNkF/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5LvL2Hhtz2yvS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 20:33:48 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id F0F48200B1DF;
	Tue, 11 Nov 2025 10:33:43 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id E0F1C23FB; Tue, 11 Nov 2025 10:33:43 +0100 (CET)
Date: Tue, 11 Nov 2025 10:33:43 +0100
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
Subject: Re: [PATCH v2 0/4] PCI/ASPM: Allow quirks to avoid L0s and L1
Message-ID: <aRMC9z93mI5BKbW0@wunner.de>
References: <20251110222929.2140564-1-helgaas@kernel.org>
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
In-Reply-To: <20251110222929.2140564-1-helgaas@kernel.org>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Nov 10, 2025 at 04:22:24PM -0600, Bjorn Helgaas wrote:
> We enabled ASPM too aggressively in v6.18-rc1.  f3ac2ff14834 ("PCI/ASPM:
> Enable all ClockPM and ASPM states for devicetree platforms") enabled ASPM
> L0s, L1, and (if advertised) L1 PM Substates.
> 
> df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree platforms")
> (v6.18-rc3) backed off and omitted Clock PM and L1 Substates because we
> don't have good infrastructure to discover CLKREQ# support, and L1
> Substates may require device-specific configuration.
> 
> L0s and L1 are generically discoverable and should not require
> device-specific support, but some devices advertise them even though they
> don't work correctly.  This series is a way to add quirks avoid L0s and L1
> in this case.

Reviewed-by: Lukas Wunner <lukas@wunner.de>

I note that a number of drivers call pci_disable_link_state() or
pci_disable_link_state_locked() to disable ASPM on probe.
Can we convert (all of) these to quirks which use the new helper
introduced here?

I think that would be useful because it would disable ASPM even if
the driver isn't available and thus avoid e.g. AER messages caused
by ASPM issues.

pcie_aspm_init_link_state() also contains the following code comment:

	/*
	 * At this stage drivers haven't had an opportunity to change the
	 * link policy setting. Enabling ASPM on broken hardware can cripple
	 * it even before the driver has had a chance to disable ASPM, so
	 * default to a safe level right now. If we're enabling ASPM beyond
	 * the BIOS's expectation, we'll do so once pci_enable_device() is
	 * called.
	 */

If we'd mask out incorrect or non-working L0s/L1 capabilities for all
devices early during enumeration via quirks, we wouldn't have to go
through these contortions of setting up deeper ASPM states only at
device enable time.

Thanks,

Lukas

