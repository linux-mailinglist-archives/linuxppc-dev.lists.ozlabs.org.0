Return-Path: <linuxppc-dev+bounces-14106-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74258C4ED55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 16:44:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5W7P3b1Fz304h;
	Wed, 12 Nov 2025 02:44:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762875889;
	cv=none; b=EPrb6EZlUGUNKMQK9fJR8W49fmlCZhhSvQGCX4ja0gFfesbTvg++St+FA0sQ/Bq0j9jk/3EZafldWtAeEbn9zeTblBrCBRv39PAqolvF6qVBjUegNiF3qnfyG38nFTvNmTAAwfTVkKoKFtAZfTAWoYHSYfjQWtQWaQvH4XqykNlxC7MNO8WvkhXHtBhO8rYDaxKB0r/VkWoaTlsW+zcpjsrA0i49SgS3HF7avTMm7pWLXLeJynhUOWwqFKIdmekz3UA4n5fndxnzRUZ3jFkg56jHHm8slXXKK830ZBMNDSBpkxyA18G2up11UsBehdcq2K5sPZ4Cb2fkJP4Buj/bxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762875889; c=relaxed/relaxed;
	bh=Fq7BwnY4CU803RbB1ABnIKKLDH+itY4JvzdBYWfObY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Kdiyc9QcxKgA8E0ETB6Ii2+6KqZUYqdJZA+WrOqJMW6DBuhW7vy7B4cwqfcOy755IL2pMI1RRhLnFNCIo9hrCRxkB55bdb+9lWKqPM+0kFn6fnLI8emfukGi9eKNimODO3YwMFkISkpbhO4Se2TD19b/fFFQRTHvPB6GM9rA2uHFiJWp4xD1zLCGStasHxhsdlQfVkvwujKcR5qrSSsaZlEsFfF/esbVWCJRH5WZv0Gguv5+FvjJvpZprwMhl8XM+lhMrfP+X6otbn8iNPb+vPxMr0XzMZ/8jX2XkL6ZMS9MbHsr/ZoDFNZFnr4JlAM5bClI0dQ2kv0xYS53xUyjag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HzG6rQ3X; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HzG6rQ3X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5W7N6HCVz2ySq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 02:44:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02DA14420B;
	Tue, 11 Nov 2025 15:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9780C4CEF5;
	Tue, 11 Nov 2025 15:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762875886;
	bh=kEIGVMJBVgHNfIsiqOwArbHxxwlSOP5asagz3P1dOYM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=HzG6rQ3XnpbNRMYPZqf6GW3qRv66U2ogE5HBMLFcHTastXLV865vpAqesAjiTw0xW
	 vuoYR5fSX/oc0NdvRHNDpqRQ+65k1MKSmY1klwOIFU+PNl0hzHhQXHn2hZWHDWMO2r
	 mX7AX9TNL5UHcfOgNWcU+h0F2A8piJLgOJPWlZvK8n+KG3evkRQ1AKGMUOCN9h5FNI
	 e+6FBekHbauDgnPHF0EgKlFZiJhDCy5L57NdDJbtRWoz1G6Fm6EJT/KwMrilkusw3l
	 V8xVkucrNjEElXKevi5q0jxAzK41WFn+5tsOO7TRqF376loU+B9V09Fzf4ZmgqjoE3
	 j/I3ZOlpGG+2w==
Date: Tue, 11 Nov 2025 09:44:45 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
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
Message-ID: <20251111154445.GA2175922@bhelgaas>
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
In-Reply-To: <aRMC9z93mI5BKbW0@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 11, 2025 at 10:33:43AM +0100, Lukas Wunner wrote:
> On Mon, Nov 10, 2025 at 04:22:24PM -0600, Bjorn Helgaas wrote:
> > We enabled ASPM too aggressively in v6.18-rc1.  f3ac2ff14834 ("PCI/ASPM:
> > Enable all ClockPM and ASPM states for devicetree platforms") enabled ASPM
> > L0s, L1, and (if advertised) L1 PM Substates.
> > 
> > df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree platforms")
> > (v6.18-rc3) backed off and omitted Clock PM and L1 Substates because we
> > don't have good infrastructure to discover CLKREQ# support, and L1
> > Substates may require device-specific configuration.
> > 
> > L0s and L1 are generically discoverable and should not require
> > device-specific support, but some devices advertise them even though they
> > don't work correctly.  This series is a way to add quirks avoid L0s and L1
> > in this case.
> 
> Reviewed-by: Lukas Wunner <lukas@wunner.de>

Thanks!

> I note that a number of drivers call pci_disable_link_state() or
> pci_disable_link_state_locked() to disable ASPM on probe.
> Can we convert (all of) these to quirks which use the new helper
> introduced here?
> 
> I think that would be useful because it would disable ASPM even if
> the driver isn't available and thus avoid e.g. AER messages caused
> by ASPM issues.
> 
> pcie_aspm_init_link_state() also contains the following code comment:
> 
> 	/*
> 	 * At this stage drivers haven't had an opportunity to change the
> 	 * link policy setting. Enabling ASPM on broken hardware can cripple
> 	 * it even before the driver has had a chance to disable ASPM, so
> 	 * default to a safe level right now. If we're enabling ASPM beyond
> 	 * the BIOS's expectation, we'll do so once pci_enable_device() is
> 	 * called.
> 	 */
> 
> If we'd mask out incorrect or non-working L0s/L1 capabilities for all
> devices early during enumeration via quirks, we wouldn't have to go
> through these contortions of setting up deeper ASPM states only at
> device enable time.

I definitely agree.  I forgot to follow up on all of those cases.
There aren't that many of them, but it looks like probably too many to
address for v6.18, and I *think* it's safe to wait and deal with them
for v6.19.

Bjorn

