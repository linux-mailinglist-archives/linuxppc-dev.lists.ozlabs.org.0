Return-Path: <linuxppc-dev+bounces-16948-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOjhBBBJl2m2wQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16948-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 18:32:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE7E161383
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 18:31:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH0mp6Zybz30GV;
	Fri, 20 Feb 2026 04:31:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771522314;
	cv=none; b=EVE52sa06s3Nm2u2Ax8Rp4Z4Va+Eoo4Rt+zmPlZ7rKf4NtGoDYygjT9R1MXs7k0PRyJE97fJ74BSCrzvQYkdUqeuQuz+FTX1ohHZdQ6MZcKZhrdw47t8iE+m/D8fMo6uaYRb+KGb2MZptq/wh/NovvQS+cVM8HtewgTKlbWKNVzkHAdt6ZBMZE4JlMiWC1RMnuSdyklL/0grZdW/55HcWDF//rg5QwZVFo9J9E/JswLiAk/L1+IAorVeX8R252gAU1eA0OJLo+ZJ1ZrWF26Z/YhJEDjQJwuTyosmN7lo9v9kkYiL2bsKo3tWoSYU8hAKn/vY5BFwul26prcFBma1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771522314; c=relaxed/relaxed;
	bh=gMZMGI9DFRcoBCmnUZnVFyXMa+6eSmDPF0UxUNXBiSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MHZp317bHLe3Sl4u4+kSYkF0VkqdqA0gRYJyW2hnuSRnRxApQ1dUMU661Qs25BejDxRxhTS9uaUZn6nCPb4XPCygOgCGgj+VoG1QE909EwQwD2BR5ohpMNqPaguhy0HmDAu5aAc7NOAI+OJxAAR+UbTmZ7ge8oXmJR7dZfH0valB3fqNqJxenYCwUcM6ayPU5Lefd1X3CYPwyqugCZShmUtMtI1ZO3CdDBXA/1McGDm71fB/sHyRpZ7ldNzXk4wSkION9Jwi4csQjFP+2BzvKnVcrQzsS1TUDYEK0Phzpz/gUGo/BIdb1BIXkDPzRZqr5HCXJInP5Q33DhMxIC0WbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EE1AbYSe; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EE1AbYSe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fH0mn2xgYz2xlj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 04:31:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FBDC4412E;
	Thu, 19 Feb 2026 17:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC62C4CEF7;
	Thu, 19 Feb 2026 17:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771522311;
	bh=0dApmxehIq0f8g9XqkVrjuvILuR13XJVXhzmBt9EhFs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=EE1AbYSeKETi2ThDlSv0TnnumMJA/WnZ349B6kNnGdpgA9LW/9+vC7JayIZNWGJSZ
	 hEs+ayWmYXnxhqOQLanbr2uZHkKEDjAA9D6xvTp7fL0IePQVB2XeboRqLwoV82QKtw
	 ZLK5YLmh8GHnmmahCi+0QjAjEZmIk2meP4n3FFiP9rZFrhicOFDwFMY5feIqmkwiq8
	 idKz/foFLrSwzQtL8BkTL9L+4XBl59WRnJSr/iU5D9g3UiZGyX4QrJI2aS36gc0iOv
	 hVOUqM+A9TH5uJeDCATcOfemJe+0O08Cl8OQKJd5zu/yjepam7Xlc5ZNQWHbZ3aFhP
	 QJw4S7nCQjCrQ==
Date: Thu, 19 Feb 2026 11:31:49 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nilay Shroff <nilay@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	wangruikang@iscas.ac.cn, tglx@kernel.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	gjoyce@ibm.com, "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, sparclinux@vger.kernel.org
Subject: Re: [PATCH] powerpc/pci: Initialize msi_addr_mask for OF-created PCI
 devices
Message-ID: <20260219173149.GA3486808@bhelgaas>
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
In-Reply-To: <20260217174537.1154686-1-nilay@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16948-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nilay@linux.ibm.com,m:tglx@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:wangruikang@iscas.ac.cn,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:gjoyce@ibm.com,m:davem@davemloft.net,m:andreas@gaisler.com,m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,iscas.ac.cn,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,ibm.com,davemloft.net,gaisler.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2EE7E161383
X-Rspamd-Action: no action

[+cc sparc folks, PCI enumeration via OF likely broken]

On Tue, Feb 17, 2026 at 11:15:26PM +0530, Nilay Shroff wrote:
> Recent changes [1] replaced the use of no_64bit_msi with msi_addr_mask.
> As a result, msi_addr_mask is now expected to be initialized to
> DMA_BIT_MASK(64) when a pci_dev is set up. However, this initialization
> was missed on powerpc due to differences in the device initialization
> path compared to other architectures. Due to this, now pci device probe
> method fails on powerpc system.

s/pci/PCI/ to match below.

> On powerpc systems, struct pci_dev instances are created from device
> tree nodes via of_create_pci_dev(). Because msi_addr_mask was not
> initialized there, it remained zero. Later, during MSI setup,
> msi_verify_entries() validates the programmed MSI address against
> pdev->msi_addr_mask. Since the mask was not set correctly, the
> validation fails, causing PCI driver probe failures for devices on
> powerpc systems.
> 
> Initialize pdev->msi_addr_mask to DMA_BIT_MASK(64) in
> of_create_pci_dev() so that MSI address validation succeeds and device
> probe works as expected.
> 
> [1] https://lore.kernel.org/all/20260129-pci-msi-addr-mask-v4-0-70da998f2750@iscas.ac.cn/
> 
> Fixes: 386ced19e9a3 ("PCI/MSI: Convert the boolean no_64bit_msi flag to a DMA address mask")
> Signed-off-by: Nilay Shroff <nilay@linux.ibm.com>

Looks like this and a similar sparc fix need to be in v7.0.  Would be
great if they could make v7.0-rc1 (Sunday), but that's pretty close.

Thomas, you merged 386ced19e9a3.  I'm happy to merge the powerpc and
sparc fixes, given acks from you and the powerpc & sparc folks, or
feel free to take them yourself.

> ---
>  arch/powerpc/kernel/pci_of_scan.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pci_of_scan.c
> index 756043dd06e9..26ec97ce6b40 100644
> --- a/arch/powerpc/kernel/pci_of_scan.c
> +++ b/arch/powerpc/kernel/pci_of_scan.c
> @@ -211,6 +211,12 @@ struct pci_dev *of_create_pci_dev(struct device_node *node,
>  	dev->current_state = PCI_UNKNOWN;	/* unknown power state */
>  	dev->error_state = pci_channel_io_normal;
>  	dev->dma_mask = 0xffffffff;

It's typical to add a blank line between the code above and the
comment below, as was done in 386ced19e9a3.

> +	/*
> +	 * Assume 64-bit addresses for MSI initially. Will be changed to 32-bit
> +	 * if MSI (rather than MSI-X) capability does not have
> +	 * PCI_MSI_FLAGS_64BIT. Can also be overridden by driver.
> +	 */
> +	dev->msi_addr_mask = DMA_BIT_MASK(64);
>  
>  	/* Early fixups, before probing the BARs */
>  	pci_fixup_device(pci_fixup_early, dev);
> -- 
> 2.52.0
> 

