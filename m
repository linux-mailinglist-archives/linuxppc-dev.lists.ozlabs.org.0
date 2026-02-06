Return-Path: <linuxppc-dev+bounces-16699-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJwEDXg4hmmcLAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16699-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 19:52:40 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4064710246A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 19:52:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f739w4lkVz30Lv;
	Sat, 07 Feb 2026 05:52:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770403956;
	cv=none; b=P4ltU5ZYLy/+ePzsYhORkt7fYvyPYGp76qySBCY3kgZhcTPSZKoWUw+Viv8CHA3HjvJ+KHsKaP+Eo/zouGOIqxpkicyss0SUzeOgStCzG0HlALe+ppLZhtD995DQxnYM7GFVFQzLrb8Q/IsmN0CPnkgZXtL0WH+3FZvkbDCOp0pAksfRUK/PPBk0d02EmA/EcsQwSXsfa7uau8qvjkiDOdin9K4BHJI44GNsLvVRl4kzNtaVxAqAwEnUAkNfqdClK613DY73TkN+p0RDrnftB4ehXK/hyxiFE/toyAY+5zWYAdj9kg/kMNPb+N4Hf/9+NQY9yUoMLHDAO0H7XnAf0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770403956; c=relaxed/relaxed;
	bh=x+Fsw3Tu3KCX6ABd9wkoRrk7DIgVQUml8WtItK+9rlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NuPzpGUnBIyrdmQrZZu8Xmv8tgguZuq+q6bj4EOO0axwN4kHWudrvDhCerezdGBlrNfokYp32rzMcBsFOuGE0OMf5THAh9bV0pfMipSbJHNwmWygpa2yekmYzpOOfj8mmV/9NsQ5O2SzC/EKbJa6dKyWXTUvZbrBlud4+JtTjlElLiCatscpnq1ud7fo+sLp77RbsxL9kE7xbvEZ1lYFfDwSf2gE+SxVJFEAYJRHHcICyzhdgHMUbW/hDqPO1jra3q0W92UpouNOUPQgRI6Xaqhy1hbR9Id2KEqG8HeuNYqYaBYMXseeBvpXnat3uVvt9RNkZYh3XAAzn21U13nQtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZE3Fr/ax; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZE3Fr/ax;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f739v5Vcjz30FP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 05:52:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2C6D600CB;
	Fri,  6 Feb 2026 18:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEBEC116C6;
	Fri,  6 Feb 2026 18:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770403953;
	bh=m2ypES2rM7EyVxp1tfQXLSSqW5w9aIlx80GmOIA+GnA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ZE3Fr/axECilcGfQx0BOXqnr2NFY7z+oy1SxFhVAqtX4EyDQpwMkfmepZ3mEndVwM
	 cPS4NCDMXYmtD8Wp3kehS1wH/WdJWt/YZcZnRqNoLpaET2dN89sR2rB95LF5+/G5k2
	 76QK4hDACmDhXhMFQinJVyholxEXXsw2fxOe8J9voztNwMobn8Fq/J+k1RnYcUxULl
	 LP71K8xw6RdVtffruSerFUEBwMLD7HWDNvCU6FwtCswzyXnoQ+ETQp73Rd2enK1/c7
	 Mf40kVI+TKsXaoHsmBmcrbrIadIbTX6DY72RTYxxFIJpBLpVHO1Lv/A5k8g7tOvELH
	 HHSpgnH/NpRnQ==
Date: Fri, 6 Feb 2026 12:52:32 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>, kbusch@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	dcostantino@meta.com, rneu@meta.com, kernel-team@meta.com
Subject: Re: [PATCH] PCI/AER: Add option to panic on unrecoverable errors
Message-ID: <20260206185232.GA70936@bhelgaas>
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
In-Reply-To: <20260206-pci-v1-1-85160f02d956@debian.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16699-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:leitao@debian.org,m:corbet@lwn.net,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:bhelgaas@google.com,m:kbusch@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:dcostantino@meta.com,m:rneu@meta.com,m:kernel-team@meta.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lwn.net,linux.ibm.com,gmail.com,google.com,kernel.org,vger.kernel.org,lists.ozlabs.org,meta.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: 4064710246A
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 10:23:11AM -0800, Breno Leitao wrote:
> When a device lacks an error_detected callback, AER recovery fails and
> the device is left in a disconnected state. This can mask serious
> hardware issues during development and testing.
> 
> Add a module parameter 'aer_unrecoverable_fatal' that panics the kernel
> instead, making such failures immediately visible. The parameter
> defaults to false to preserve existing behavior.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> In environments where all hardware must be fully operational, silently
> leaving a device in a disconnected state after an AER recovery failure
> is unacceptable. This is common in high-reliability systems, production
> servers, and testing infrastructure where a degraded system should not
> continue running.
> 
> This patch adds a module parameter that allows administrators to enforce
> a strict policy: if a device cannot recover from an AER error, the
> kernel panics instead of continuing with degraded hardware. This ensures
> that hardware failures are immediately visible and can trigger
> appropriate remediation (restart, failover, alerting).
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 9 +++++++++
>  drivers/pci/pcie/err.c                          | 3 +++
>  drivers/pci/pcie/portdrv.c                      | 7 +++++++
>  drivers/pci/pcie/portdrv.h                      | 1 +
>  4 files changed, 20 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 1058f2a6d6a8c..ff95c24280e3c 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5240,6 +5240,15 @@ Kernel parameters
>  		nomsi	Do not use MSI for native PCIe PME signaling (this makes
>  			all PCIe root ports use INTx for all services).
>  
> +	pcieportdrv.aer_unrecoverable_fatal=
> +			[PCIE] Panic on unrecoverable AER errors:
> +		0	Log the error and leave the device in a disconnected
> +			state (default).
> +		1	Panic the kernel when a device cannot recover from an
> +			AER error (no error_detected callback). Useful for
> +			high-reliability systems where degraded hardware is
> +			unacceptable.

Just from an overall complexity point of view, I'm a little hesitant
to add new kernel parameters because this seems like a very specific
case.

Is there anything we could do to improve the logging to make the issue
more recognizable?  I assume you already look for KERN_CRIT, KERN_ERR,
etc., but it looks like the current message is just KERN_INFO.  I
think we could make a good case for at least KERN_WARNING.

But I guess you probably want something that's just impossible to
ignore.

Are there any other similar flags you already use that we could
piggy-back on?  E.g., if we raised the level to KERN_WARNING, maybe
the existing "panic_on_warn" would be enough?

> +++ b/drivers/pci/pcie/err.c
> @@ -73,6 +73,9 @@ static int report_error_detected(struct pci_dev *dev,
>  		if (dev->hdr_type != PCI_HEADER_TYPE_BRIDGE) {
>  			vote = PCI_ERS_RESULT_NO_AER_DRIVER;
>  			pci_info(dev, "can't recover (no error_detected callback)\n");
> +			if (aer_unrecoverable_fatal)
> +				panic("AER: %s: no error_detected callback\n",
> +				      pci_name(dev));
>  		} else {
>  			vote = PCI_ERS_RESULT_NONE;
>  		}

