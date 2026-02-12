Return-Path: <linuxppc-dev+bounces-16854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCSbDLNDjmmPBQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 22:18:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C96CF13130C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 22:18:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBp7g43KDz2xKh;
	Fri, 13 Feb 2026 08:18:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770931119;
	cv=none; b=ZrvRcvPcnQvBxaITiw9vWIjlLfkOzOSZjgHciwjMj2kS6yZDfnjy27Gum6J3mbSQTonqbBcrn8iYM0hRbyQr72wWOxqP9slrWoUOkcAoHVUie8/a6vSGPOo1ldy+rMr9q9Uxql5hZ6C+Mj6rJmBBaDa43l9Dj4+eYGUFcq7MD7Ty9nWRP7muAFpMzM+TUhDEMSFHDH8eTY9RGH54+4ObskLSHNNEKaEzktF3CqBZvPIHjM2K90lgq8T0Ggdlw6iWP5DoO33Rz+//DAzk61nQ8Z0eHYmJTeuAvS+eKCilFVHVAbIWGjTDEsB+QRIUyxniSeTH9UQfo6VZvuKGfCxQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770931119; c=relaxed/relaxed;
	bh=l6Qgd8q97IOwavSYuNdyrUq53+L1BehAFL5b246zql8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hNTLZ7CpYuv/GTwEYzOzSt9+Ug1ORmyhStmXYlb3eKKShpWjmrIh77BaY68ehqc03LHwMVtKBip39YLkAU9PzWR7OWmABSOt23545/KOiqqPc9AXdCdtbW9lb0lZ28SIGJ/vwK9uxBWAZaUbNqUikCNXNqmzHtXMsBom6W7Jqw8egDi4xl5g78F7LS9M+2UW7N6UohfsRXcBVUjQCTHMrSfXaisiJbZVUahNVj4utoRiL6/xnKhbI42wo0R+/3vC1wOOCvjXrLB/2fjd9pa14lh/XaHxwLEUIUo+huiDZCjsGI1sg6aaDVpdE8AJG3kddcyFRaC6TWrHeOJCuMbGzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZqKOS5wm; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZqKOS5wm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBp7f3skXz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Feb 2026 08:18:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D36542DF7;
	Thu, 12 Feb 2026 21:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018AFC4CEF7;
	Thu, 12 Feb 2026 21:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770931116;
	bh=ZwjtNdHrTt4z5zvI0HCzLCKNAoAwOFoGsgaqJCN6lHc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ZqKOS5wmzLv7LH2bJxsIltWIQIbCLYwUcK2r6Uiwb0CIgWGuGHeTuWg6k20hQ8P49
	 RZTaUSds/6ApSanFdQ5NpNeA6lS7x89gZxgNvkPqwmNk5tShRwTPm1lULIgP9P+618
	 N6xPu6PUsNUK6sKp/z+sJFeZStTaP/YxDRWpXzTqkXiLMO0B3PEZ5bvXlV6wrnLHPk
	 +z5OmSfLOq/13hMC7e0xpIZ7mMtlTY0fMOUFDi3mysIyUz3MWIvvs27Vx+qiVodEHk
	 4Uz4otm2Uf4Fi5mHYyYrQFwl3m9UKc2UnGoLCVm8uW8YjX68utcSN+VMc1mDfH8ZqT
	 deD6SyzqPhdQg==
Date: Thu, 12 Feb 2026 15:18:34 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
	kbusch@kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com,
	lukas@wunner.de, mahesh@linux.ibm.com, oohall@gmail.com,
	Jonathan.Cameron@huawei.com, terry.bowman@amd.com,
	tianruidong@linux.alibaba.com, zhuo.song@linux.alibaba.com,
	oliver.yang@linux.alibaba.com
Subject: Re: [PATCH v3] PCI/AER: Only clear error bits in PCIe Device Status
 register
Message-ID: <20260212211834.GA3075092@bhelgaas>
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
In-Reply-To: <20260211124624.49656-1-xueshuai@linux.alibaba.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:xueshuai@linux.alibaba.com,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:kbusch@kernel.org,m:sathyanarayanan.kuppuswamy@linux.intel.com,m:lukas@wunner.de,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:Jonathan.Cameron@huawei.com,m:terry.bowman@amd.com,m:tianruidong@linux.alibaba.com,m:zhuo.song@linux.alibaba.com,m:oliver.yang@linux.alibaba.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16854-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,google.com,kernel.org,linux.intel.com,wunner.de,linux.ibm.com,gmail.com,huawei.com,amd.com,linux.alibaba.com];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alibaba.com:email,intel.com:email,wunner.de:email]
X-Rspamd-Queue-Id: C96CF13130C
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 08:46:24PM +0800, Shuai Xue wrote:
> Currently, pcie_clear_device_status() clears the entire PCIe Device
> Status register (PCI_EXP_DEVSTA) by writing back the value read from
> the register, which affects not only the error status bits but also
> other writable bits.
> 
> According to PCIe Base Specification r7.0, sec 7.5.3.5 (Device Status
> Register), this register contains:
> 
> - RW1C error status bits (CED, NFED, FED, URD at bits 0-3): These are
>   the four error status bits that need to be cleared.
> 
> - Read-only bits (AUXPD at bit 4, TRPND at bit 5): Writing to these
>   has no effect.
> 
> - Emergency Power Reduction Detected (bit 6): A RW1C non-error bit
>   introduced in PCIe r5.0 (2019). This is currently the only writable
>   non-error bit in the Device Status register. Unconditionally
>   clearing this bit can interfere with other software components that
>   rely on this power management indication.
> 
> - Reserved bits (RsvdZ): These bits are required to be written as
>   zero. Writing 1s to them (as the current implementation may do)
>   violates the specification.
> 
> To prevent unintended side effects, modify pcie_clear_device_status()
> to only write 1s to the four error status bits (CED, NFED, FED, URD),
> leaving the Emergency Power Reduction Detected bit and reserved bits
> unaffected.
> 
> Fixes: ec752f5d54d7 ("PCI/AER: Clear device status bits during ERR_FATAL and ERR_NONFATAL")
> Cc: stable@vger.kernel.org
> Suggested-by: Lukas Wunner <lukas@wunner.de>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Reviewed-by: Lukas Wunner <lukas@wunner.de>
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>

Applied to pci/aer for v7.1, thank you!

This branch will be rebased to v7.0-rc1 when it is tagged.

> ---
> changes since v2:
> - accommodate two macros per line per Lukas
> - pick up Reviewed-by tag from Lukas
> ---
>  drivers/pci/pci.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 13dbb405dc31..0e6a50260555 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -2243,10 +2243,9 @@ EXPORT_SYMBOL_GPL(pci_set_pcie_reset_state);
>  #ifdef CONFIG_PCIEAER
>  void pcie_clear_device_status(struct pci_dev *dev)
>  {
> -	u16 sta;
> -
> -	pcie_capability_read_word(dev, PCI_EXP_DEVSTA, &sta);
> -	pcie_capability_write_word(dev, PCI_EXP_DEVSTA, sta);
> +	pcie_capability_write_word(dev, PCI_EXP_DEVSTA,
> +				   PCI_EXP_DEVSTA_CED | PCI_EXP_DEVSTA_NFED |
> +				   PCI_EXP_DEVSTA_FED | PCI_EXP_DEVSTA_URD);
>  }
>  #endif
>  
> -- 
> 2.43.5
> 

