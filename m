Return-Path: <linuxppc-dev+bounces-16745-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBtCBzjviWn4EQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16745-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 15:29:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63880110527
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 15:29:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8nBW469Cz2yGx;
	Tue, 10 Feb 2026 01:29:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41b8:202:deb::311:108"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770647347;
	cv=none; b=Ss1xAmFGJS0Lo0Feop/ZUTxkRWTZqhSx1Fb82ISQLs6+O9y/VrOfXcGPWnZJfqCKJiIL8ylkoQXs5Con4mXj9bC9sHrEaTA4S7FofMXniuYU7TEHBCEfB0l0YgXe21GkEKcukN1cRapePLqIC782s8ctNhsgU8qQjHWtVuLpYvlMIHs8tNxrpQU26/Z3baVEW4YM1Ba5EGmfYyvP80eHDFxojPM5hAz0mr/7nvUBh6zTfzEzwB7L1pDGliDj3e80AvpKRMET9IVfbgyRqB8drjxBkPyYUA6IKSHzchONdvq12upTMDTK/IyMNBA3GOXl5CQUv1WIOM49wVdPip6O7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770647347; c=relaxed/relaxed;
	bh=ADcr7MHeE4Wfa+rW+wWhUw4Yt3swRnjusQVf8Yvintg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7Bu/Kx8oG0CCX+R2pQlBiJXUgV31f9JfjZOBDDDN2pGGfGTE9n5i5ihc6IKZExN6lCSOo5cza5w5VdQEl9QvZjvhKKLPIBOjjISi6KfDnaTDPB7+NhGC2U4Fe/7wSE48ydd2xWfmHj96LxnRptFcIIr373wovl17svOlko0edSbeOV6hbpx2pbu1Quu0hF/oXNDkcv5PL1g8pPHsj4FdNXCRXJBlFMgehJnzLNjkQt7tbXlwE+KKI8wSeCrf585NKLDYgTsP6ssfYB5QDbeJ8r0JPv/MOnZgYdrdvEZ2YIQBKwIbHyrfqO/RyIhcXbKNMzTFKXXdLsT3j96XtYKfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; dkim=pass (2048-bit key; secure) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=CgDKPToJ; dkim-atps=neutral; spf=none (client-ip=2001:41b8:202:deb::311:108; helo=stravinsky.debian.org; envelope-from=leitao@debian.org; receiver=lists.ozlabs.org) smtp.mailfrom=debian.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=CgDKPToJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=debian.org (client-ip=2001:41b8:202:deb::311:108; helo=stravinsky.debian.org; envelope-from=leitao@debian.org; receiver=lists.ozlabs.org)
Received: from stravinsky.debian.org (stravinsky.debian.org [IPv6:2001:41b8:202:deb::311:108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8nBT5bJsz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 01:29:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ADcr7MHeE4Wfa+rW+wWhUw4Yt3swRnjusQVf8Yvintg=; b=CgDKPToJEwvMWABCeYQbO42oJ7
	D91kxQf19eLqrPivJsLPizip9ylwh2/MUNvPRMw5zC8jvYgSPGnn7IL9MRuVxShAXo9k8SnjEYF0b
	m7TFQn0cL6iRuX0KEQ1XPEp1N//LZ3dtX0sgrVZ7foF4LG9xHtIqeqnozjcBccwHPxEhQTTPymKdF
	n8LnJN2CSfPjskbV5vhITfH8jO/Rm3IytlexAaXkrlVre0NO7cOakWYbCbWglcLpHIAw2Ui/bTxT8
	BxSpIQDDX/FM7DXo8Rtp7D3DtZvWM+GkiwvlLOE5czLyV2LbXQo+onRnyYdyD/gUG/xa8a3tJ9f8j
	+Bl/gZ3Q==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vpSFp-009Xzj-Rf; Mon, 09 Feb 2026 14:28:46 +0000
Date: Mon, 9 Feb 2026 06:28:40 -0800
From: Breno Leitao <leitao@debian.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, kbusch@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	dcostantino@meta.com, rneu@meta.com, kernel-team@meta.com
Subject: Re: [PATCH] PCI/AER: Add option to panic on unrecoverable errors
Message-ID: <aYnour-Z8rm8pW2D@gmail.com>
References: <20260206-pci-v1-1-85160f02d956@debian.org>
 <20260206185232.GA70936@bhelgaas>
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
In-Reply-To: <20260206185232.GA70936@bhelgaas>
X-Debian-User: leitao
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:corbet@lwn.net,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:bhelgaas@google.com,m:kbusch@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:dcostantino@meta.com,m:rneu@meta.com,m:kernel-team@meta.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[leitao@debian.org,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[debian.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16745-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[debian.org:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lwn.net,linux.ibm.com,gmail.com,google.com,kernel.org,vger.kernel.org,lists.ozlabs.org,meta.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_TWELVE(0.00)[13];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 63880110527
X-Rspamd-Action: no action

Hello Bjorn,

On Fri, Feb 06, 2026 at 12:52:32PM -0600, Bjorn Helgaas wrote:
> On Fri, Feb 06, 2026 at 10:23:11AM -0800, Breno Leitao wrote:
> Is there anything we could do to improve the logging to make the issue
> more recognizable?  I assume you already look for KERN_CRIT, KERN_ERR,
> etc., but it looks like the current message is just KERN_INFO.  I
> think we could make a good case for at least KERN_WARNING.
>
> But I guess you probably want something that's just impossible to
> ignore.
>
> Are there any other similar flags you already use that we could
> piggy-back on?  E.g., if we raised the level to KERN_WARNING, maybe
> the existing "panic_on_warn" would be enough?

Let me provide context on what we observe in production environments.

We manage a fleet of machines that regularly encounter AER errors. The
typical failure pattern we see involves:

1) AER errors on devices (sometimes with proprietary drivers):

	{2}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 302
	 	0009:01:00.0:    [22] UncorrIntErr

2) The device enters an unrecoverable state where any subsequent access
   triggers additional failures.

3) The driver continues attempting hardware access, which generates
   cascading errors. On arm64, we observe sequences like:

	arm-smmu-v3 arm-smmu-v3.13.auto: unexpected global error reported (0x00000001), this could be serious
	arm-smmu-v3 arm-smmu-v3.13.auto: CMDQ error (cons 0x030120f3): ATC invalidate timeout
	..
	watchdog: CPU75: Watchdog detected hard LOCKUP on cpu 76

4) For NIC uncorrectable errors, we see:

	pcieport 0007:00:00.0: DPC: containment event, status:0x2009: unmasked uncorrectable error detected
	mlx5_core 0017:01:00.0 eth1: ERR CQE on SQ: 0x128b
	mlx5_core 0017:01:00.0 eth1: hw csum failure
	mlx5_core 0007:01:00.0 eth0: mlx5e_ethtool_get_link_ksettings: query port ptys failed: -67
	WARNING: CPU: 32 PID: 0 at drivers/iommu/dma-iommu.c:1237 iommu_dma_unmap_phys+0xd0/0xe0 (in a loop)


Keith and I discussed several approaches (all untested except the last
one -- this patch):

a) Mark the device as disconnected when recovery fails:

	diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
	index 6b697654d654..405aac6085a1 100644
	--- a/drivers/pci/pcie/err.c
	+++ b/drivers/pci/pcie/err.c
	@@ -271,6 +271,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
	     return status;

	 failed:
	+    pci_walk_bridge(bridge, pci_dev_set_disconnected, NULL);
	     pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);

	     pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);

b) Remove the device from the bus entirely:

	diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
	index 6b697654d6546..33559a0022318 100644
	--- a/drivers/pci/pcie/err.c
	+++ b/drivers/pci/pcie/err.c

		cb(bridge, userdata);
	}

	+static void pci_err_detach_subordinate(struct pci_dev *bridge)
	+{
	+    struct pci_dev *dev, *tmp;
	+    int ret;
	+
	+    pci_walk_bus(parent, pci_dev_set_disconnected, NULL);
	+
	+    ret = pci_trylock_rescan_remove(bridge);
	+    if (!ret)
	+        return;
	+
	+    list_for_each_entry_safe_reverse(dev, tmp, &bridge->devices, bus_list) {
	+        pci_dev_get(dev);
	+        pci_stop_and_remove_bus_device(dev);
	+        pci_dev_put(dev);
	+    }
	+    pci_unlock_rescan_remove();
	+}
	+
	pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
		pci_channel_state_t state,
		pci_ers_result_t (*reset_subordinates)(struct pci_dev *pdev))
	@@ -271,6 +290,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
	return status;

	failed:
	+    pci_err_detach_subordinate(bridge);
	pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);

	pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);

c) Panic the system (this patch).

The key issue is that simply raising the log level to KERN_WARNING
wouldn't address the fundamental problem. Once recovery fails, the system
becomes unstable and eventually crashes with varied symptoms (soft lockup,
hard lockup, BUG). These different crash signatures make correlation
difficult and prevent effective tracking of the root cause.

As Keith suggested, panicking immediately when a device is unrecoverable
appears to be the most appropriate approach for our use case. While the
other options may have merit in different scenarios, they don't adequately
address our stability requirements.

Thanks for the review and suggestions,
--breno

