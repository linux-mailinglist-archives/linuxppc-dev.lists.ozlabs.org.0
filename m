Return-Path: <linuxppc-dev+bounces-16334-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOFqBzU7eWkmwAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16334-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 23:24:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3929AFF4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 23:24:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f10ML6F1Rz2y7b;
	Wed, 28 Jan 2026 09:24:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769552686;
	cv=none; b=N1yJOlgl8F2heNaNBGH+zAdXrousLuOBZBXFuPdNhw5LjI138ni6h7NLhQrughvK68ksiX9LFBUd0D9jg6x66+gZAWbzQl5H1CL0Ky3olzAZVxrLQObN6H18ySaxrx07G0nvGKFDZZ1ID2F6cDvNu56qY8TZxGBbmGTWObYqRloPsY4kq/GXWpTdIvoC6S/p1gZyXQdg+BUr45ich95tYLEizm2TrSFAaleAKZZckmhktJHjsMMr2JE3i/GkXB9SD4q51jRXyUQwWpr9gPnC6Q1vlHkraKjX/arusOF9m8wXwUOY1kiNuI+e8Ti85ma/45s4Kxo102Gvm7D0X61Q3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769552686; c=relaxed/relaxed;
	bh=04n91jW8NL9aWB+fkk69TvAPRR9Oshnv2f6pWTS23p0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jwB37CINU649/r5ujQQgkN8dYThdD4AVBOq8QyUa9yWLCrHz/aUNzreOxUXr6cKEk10hWlPyUnZMf52ndkL7DgS/XtPTgwbFTZkf6yK9CoubNJWdwCHguW7iXSYclPouX7dK8VmNdtzvg2Kv+0ZXvLzgxGSxuI6mXR97deCzJQTiAyhLwvvUfNGIgc/GCLVfknuE25PHmkLyhU+VWmyKJ654msE28urfF3Tbc7AcOooIgBONhwyAsQvKdPg5mFL7FlObzRxLzoX3w+sne9OyVqRnEA82BWCev30C8hcBWCptnML3QPbzCLVhjqce8VEBLv8dMosQNIdCCBHQAAPHIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ec7Mlq26; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ec7Mlq26;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f10ML0Hh2z2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 09:24:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E059040324;
	Tue, 27 Jan 2026 22:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11B8C116C6;
	Tue, 27 Jan 2026 22:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769552683;
	bh=XAyXKUf6q/0z3PUr5sC//LrqmgO0EPfzDjK+XCHmP/o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ec7Mlq26+vqOlpYOZBpxXb0vji+31/Ak5zmDkDh5FN9xMmbs4r0QOiKPUM8p8v3CJ
	 71DY16D+R+d7+2FfPIbCt0FK+WOf8LTQNE6XhxMTYGnGwivvgATkI4GrURtlxn1wr1
	 GjvYRrQ6A72582sJhwh85d9hIRuv2kHjqrgQ74a2iM1XG0PGvo98glYn/51o6qwccR
	 iwsdsUNCGDvAEYxVAaBRvuL+dZFwjaVcYNnZ5765xGn1+TSAFuZ4e4TQ0ELEudDB8o
	 i1vSWdgS/fylsVdc96IsQLxn1r3s9QaQDSq5MvZ6nmF3TZ8vh8MZNU84ZdJG+zeKL8
	 APFASB2wtRdRw==
Date: Tue, 27 Jan 2026 16:24:42 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: =?utf-8?B?SMOla29u?= Bugge <haakon.bugge@oracle.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Greg Kroah-Hartman <gregkh@suse.de>,
	Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>,
	Alex Williamson <alex@shazbot.org>,
	Johannes Thumshirn <morbidrsa@gmail.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 2/2] PCI/ACPI: Confine program_hpx_type2 to the AER
 bits
Message-ID: <20260127222442.GA379147@bhelgaas>
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
In-Reply-To: <20260122130957.68757-3-haakon.bugge@oracle.com>
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
	TAGGED_FROM(0.00)[bounces-16334-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:haakon.bugge@oracle.com,m:bhelgaas@google.com,m:schnelle@linux.ibm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:gregkh@suse.de,m:kaneshige.kenji@jp.fujitsu.com,m:alex@shazbot.org,m:morbidrsa@gmail.com,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[google.com,linux.ibm.com,kernel.org,gmail.com,suse.de,jp.fujitsu.com,shazbot.org,vger.kernel.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CD3929AFF4
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 02:09:54PM +0100, Håkon Bugge wrote:
> program_hpx_type2() is today unconditionally called, despite the fact
> that when the _HPX was added to the ACPI spec. v3.0, the description
> stated:
> 
>  OSPM [1] will only evaluate _HPX with Setting Record – Type 2 if OSPM
>  is not controlling the PCI Express Advanced Error Reporting
>  capability.
> 
> Hence, we only call program_hpx_type2() when the OSPM owns the PCIe
> hotplug capability but not the AER.
> 
> The Advanced Configuration and Power Interface (ACPI) Specification
> version 6.6 has a provision that gives the OSPM the ability to control
> the other PCIe Device Control bits any way. In a note in section
> 6.2.9, it is stated:
> 
> "OSPM may override the settings provided by the _HPX object's Type2
> record (PCI Express Settings) or Type3 record (PCI Express Descriptor
> Settings) when OSPM has assumed native control of the corresponding
> feature."
> 
> So, in order to preserve the non-AER bits in PCIe Device Control, in
> particular the performance sensitive ExtTag and RO, we make sure
> program_hpx_type2() if called, doesn't modify any non-AER bits.
> 
> Also, when program_hpx_type2() is called, we completely avoid
> modifying any bits in the Link Control register. However, if the _HPX
> type 2 records contains bits indicating such modifications, we print
> an info message.
> 
> [1] Operating System-directed configuration and Power Management

I looked at the specs again and pulled out some more details.  Here's
what seemed relevant to me:

    PCI/ACPI: Restrict program_hpx_type2() to AER bits
    
    Previously program_hpx_type2() applied PCIe settings unconditionally, which
    could incorrectly change bits like Extended Tag Field Enable and Enable
    Relaxed Ordering.
    
    When _HPX was added to ACPI r3.0, the intent of the PCIe Setting Record
    (Type 2) in sec 6.2.7.3 was to configure AER registers when the OS does not
    own the AER Capability:
    
      The PCI Express setting record contains ... [the AER] Uncorrectable Error
      Mask, Uncorrectable Error Severity, Correctable Error Mask ... to be used
      when configuring registers in the Advanced Error Reporting Extended
      Capability Structure ...
    
      OSPM will only evaluate _HPX with Setting Record – Type 2 if OSPM is not
      controlling the PCI Express Advanced Error Reporting capability.
    
    ACPI r3.0b, sec 6.2.7.3, added more AER registers, including registers in
    the PCIe Capability with AER-related bits, and the restriction that the OS
    use this only when it owns PCIe native hotplug:
    
      ... when configuring PCI Express registers in the Advanced Error
      Reporting Extended Capability Structure *or PCI Express Capability
      Structure* ...
    
      An OS that has assumed ownership of native hot plug but does not ... have
      ownership of the AER register set must use ... the Type 2 record to
      program the AER registers ...
    
      However, since the Type 2 record also includes register bits that have
      functions other than AER, the OS must ignore values ... that are not
      applicable.
    
    Restrict program_hpx_type2() to only the intended purpose:
    
      - Apply settings only when OS owns PCIe native hotplug but not AER,
    
      - Only touch the AER-related bits (Error Reporting Enables) in Device
        Control
    
      - Don't touch Link Control at all, since nothing there seems AER-related,
        but log _HPX settings for debugging purposes
    
    Note that Read Completion Boundary is now configured elsewhere, since it is
    unrelated to _HPX.

> +	/* Log if _HPX attempts to modify PCIe Link Control register */
>  	if (pcie_cap_has_lnkctl(dev)) {
> -
> -		/*
> -		 * If the Root Port supports Read Completion Boundary of
> -		 * 128, set RCB to 128.  Otherwise, clear it.
> -		 */
> -		hpx->pci_exp_lnkctl_and |= PCI_EXP_LNKCTL_RCB;
> -		hpx->pci_exp_lnkctl_or &= ~PCI_EXP_LNKCTL_RCB;
> -		if (pcie_root_rcb_set(dev))
> -			hpx->pci_exp_lnkctl_or |= PCI_EXP_LNKCTL_RCB;
> -
> -		pcie_capability_clear_and_set_word(dev, PCI_EXP_LNKCTL,
> -			~hpx->pci_exp_lnkctl_and, hpx->pci_exp_lnkctl_or);
> +		if (hpx->pci_exp_lnkctl_and)
> +			pci_info(dev,
> +				 "_HPX attempts to reset the following bits in PCIe Link Control: 0x%04x\n",
> +				 hpx->pci_exp_lnkctl_and);
> +		if (hpx->pci_exp_lnkctl_or)
> +			pci_info(dev,
> +				 "_HPX attempts to set the following bits in PCIe Link Control: 0x%04x\n",
> +				 hpx->pci_exp_lnkctl_or);

Again I'm afraid I suggested some over-engineering, and even worse, I
misinterpreted the pci_exp_lnkctl_and and pci_exp_lnkctl_or usage when
I said "if pci_exp_lnkctl_and or pci_exp_lnkctl_or are *non-zero*".

Per spec, we are supposed to AND the register with pci_exp_lnkctl_and,
so the interesting value would be anything other than 0xffff.  Since
we OR it with pci_exp_lnkctl_or, the interesting values there would be
anything non-zero.  So I think what we would want is something like
this:

+	/* Log if _HPX attempts to modify PCIe Link Control register */
 	if (pcie_cap_has_lnkctl(dev)) {
-
-		/*
-		 * If the Root Port supports Read Completion Boundary of
-		 * 128, set RCB to 128.  Otherwise, clear it.
-		 */
-		hpx->pci_exp_lnkctl_and |= PCI_EXP_LNKCTL_RCB;
-		hpx->pci_exp_lnkctl_or &= ~PCI_EXP_LNKCTL_RCB;
-		if (pcie_root_rcb_set(dev))
-			hpx->pci_exp_lnkctl_or |= PCI_EXP_LNKCTL_RCB;
-
-		pcie_capability_clear_and_set_word(dev, PCI_EXP_LNKCTL,
-			~hpx->pci_exp_lnkctl_and, hpx->pci_exp_lnkctl_or);
+		if (hpx->pci_exp_lnkctl_and != 0xffff ||
+		    hpx->pci_exp_lnkctl_or != 0)
+			pci_info(dev, "_HPX attempts Link Control setting (AND %#06x OR %#06x)\n",
+				 hpx->pci_exp_lnkctl_and,
+				 hpx->pci_exp_lnkctl_or);
 	}

