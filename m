Return-Path: <linuxppc-dev+bounces-16702-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPr7GdxUhmlzMAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16702-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 21:53:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D40F10348A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 21:53:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f75sh3qdcz30Lv;
	Sat, 07 Feb 2026 07:53:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:fff3:b8::112"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770411224;
	cv=none; b=UTSEmP4aNIBIEli6hqGNdzAgQptrTDPHnLThO1caiCOhssJpkYEi9L9G5Pp53OGqIwcbGY5U0YOWJlWto8gdEgH5lHhbKAkC5HXFqlOE3QUDCVSUoW0kHGQ9D5P58uups2gdwVVWKTP4VBF8ffqP55lj3q6qzFFG3mKjuF53Cx108KJ3KNzMLrup5eo3s83eLziWnzsZ6EkEG+Z6LfcC9GPHb2FgsyzSP4mdhQivgQCmNmGTeU8YZXp+e9jSw42xRlT0haO4av8Y3l+iaqmHqlZUr3qCT+IcX8GDgHl0kAr3xwdH88N7/lgdlHLM/p/aDTSfyqMAn1SvVTy9lA08ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770411224; c=relaxed/relaxed;
	bh=fXYC91HcJkNCizZyqKOcLutS+6c83bpXhkw5cRYiMRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GL0gy1P7hyEOW1VcPlsKjEI6McDqF3F9YhwPR+13zfJj6ecnd59vfMQ5XIyD9FzbIaQLuKjJn7NRNgxHI2BF501xSbyWuy/OT/DsNp19bglHdG1F7Z7DUNzeiSR1q46adr4mcE+YABm/ow8I1CR6Q6UYIP+xmOz7eUCU1rw8+TDlnH9jGhFoTll9RzXs82w1aQgFYFNPY1WNZl9q1xJbivnCxwqb5zKzxY7YlP9bab9eZOP47QVgGZ3XlVVJUWRfWZVX40KvA7cem/QPiqJzhBjXzH37RpXmkOl13goKhcwPrx6jDQrcjEBfdHRGP3W/y0YL5OkTLKyrZuhsb9GqUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:4f8:fff3:b8::112; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=2a01:4f8:fff3:b8::112; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [IPv6:2a01:4f8:fff3:b8::112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f75sg2vPzz309y
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 07:53:42 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 50E4F2C0162F;
	Fri,  6 Feb 2026 21:53:39 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 377E14936; Fri,  6 Feb 2026 21:53:39 +0100 (CET)
Date: Fri, 6 Feb 2026 21:53:39 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Breno Leitao <leitao@debian.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, dcostantino@meta.com, rneu@meta.com,
	kernel-team@meta.com
Subject: Re: [PATCH] PCI/AER: Add option to panic on unrecoverable errors
Message-ID: <aYZU09qCN3u-_byj@wunner.de>
References: <20260206-pci-v1-1-85160f02d956@debian.org>
 <20260206185232.GA70936@bhelgaas>
 <aYY_hMZyVp7GZvX2@kbusch-mbp>
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
In-Reply-To: <aYY_hMZyVp7GZvX2@kbusch-mbp>
X-Spam-Status: No, score=0.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.51 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[wunner.de: no valid DMARC record];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kbusch@kernel.org,m:helgaas@kernel.org,m:leitao@debian.org,m:corbet@lwn.net,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:bhelgaas@google.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:dcostantino@meta.com,m:rneu@meta.com,m:kernel-team@meta.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-16702-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,debian.org,lwn.net,linux.ibm.com,gmail.com,google.com,vger.kernel.org,lists.ozlabs.org,meta.com];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.980];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wunner.de:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 1D40F10348A
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 12:22:44PM -0700, Keith Busch wrote:
> On Fri, Feb 06, 2026 at 12:52:32PM -0600, Bjorn Helgaas wrote:
> > Are there any other similar flags you already use that we could
> > piggy-back on?  E.g., if we raised the level to KERN_WARNING, maybe
> > the existing "panic_on_warn" would be enough?
> 
> There are many KERN_WARNING messages that don't rise to the level of
> warranting a 'panic' that don't want to enable such an option in
> production. It looks like the panic_on_warn was introduced for developer
> debugging.

panic_on_warn springs into action on WARN() splats, not arbitrary
messages with KERN_WARNING severity.  Also, sysctl kernel.warn_limit
may be used to grant a certain number of panic-free WARNs.

FWIW, the "pcieportdrv.aer_unrecoverable_fatal" parameter introduced
by this patch feels somewhat oddly named.  Something like
"pci.panic_on_fatal" might be clearer and more succinct.

> I agree the curnent INFO level is too low for the generic unrecovered
> condition, though.

At least for unbound devices, I think 918b4053184c went way too far.
I think an unbound device should generally be considered recoverable
through a reset.

As for bound devices whose drivers lack pci_error_handlers, it has been
painful in practice that they're considered unrecoverable wholesale.
E.g. GPUs often expose an audio device as well as telemetry devices,
all arranged below an integrated PCIe switch.  All of these devices
need drivers with pci_error_handlers in order for the GPU to be
recoverable.  In some cases, dummy callbacks were added to render
the whole thing recoverable.

So I wouldn't consider 918b4053184c to have been a universally successful
approach and I fear that this patch goes even further.

Thanks,

Lukas

