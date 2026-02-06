Return-Path: <linuxppc-dev+bounces-16703-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIg0NOxYhmnDMAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16703-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 22:11:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1892103569
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 22:11:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f76Ff3ndCz2xKh;
	Sat, 07 Feb 2026 08:11:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.78.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770412262;
	cv=none; b=fT2N412GB3VSH6oYIKrbWJElTY4tyndHO44FFVroULd3+hQNkwkk9xiaNQrIxx8YwJ2/t6QZnqmgWpY0Xq8U5htsX/5Yw8y87vxvh7W2ic12O/YJHTrvEaBHNMfcCSdIot6n7MWZQXClMMcOfY2ubqYMQ2EdLg5KIsSHcgfcl/kgQQ41IVEQhQTHOVXRYmJJWKhFHFi7YuUSTaqHx6ngPpONLrOSj8DDARw6DPemMp/exxPX21fsQQzAAkpW5urbSsmCzRIcSWcI6mlXQ2Td1DGSARExbaSoUsPJzM/fVU1D4fRvI6TQoRfPagZLh73vNO+LbzX/cI44vcQMcVl1Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770412262; c=relaxed/relaxed;
	bh=mz1qbjBAzYoHdpr/Nta6rs4B8XNVt+UNtvznF5azaYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfQzkjR1nJv7pd680590mFzLUQqDnNflqZg72Z2G432Ju+9PKnwscmBBM77icbnykA/GqDMRMC6tjls1cDBSRAZLpRgYb0/kHhdPYR6ZKkrA6mqj4v3hp1m+6Rp5rIJOt2VhtpUN+WErU8JKb0RFlybPCyJrJaIKmV/Ny3c0UVAMzAD1WHA1n7gcC/LnRISOYV0uD9je0sMa3M1y5JSkGKMIP4bGzRV0UpOHDg+LWEh/sAxqZl+59b+AzGPrIUyF6bxZfdPdZWI0tOqhzKRL2YdZiVRU3NxzSbHekfhvXUh6LsmCRanycVB8ch9S7bmOqaO9zuPAUsinXhiiserS9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f76Fd444Vz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 08:11:01 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 246912008014;
	Fri,  6 Feb 2026 22:10:48 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 1F9F0473B; Fri,  6 Feb 2026 22:10:48 +0100 (CET)
Date: Fri, 6 Feb 2026 22:10:48 +0100
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
Message-ID: <aYZY2KgtSnqUWXbu@wunner.de>
References: <20260206-pci-v1-1-85160f02d956@debian.org>
 <20260206185232.GA70936@bhelgaas>
 <aYY_hMZyVp7GZvX2@kbusch-mbp>
 <aYZU09qCN3u-_byj@wunner.de>
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
In-Reply-To: <aYZU09qCN3u-_byj@wunner.de>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.51 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
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
	TAGGED_FROM(0.00)[bounces-16703-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,debian.org,lwn.net,linux.ibm.com,gmail.com,google.com,vger.kernel.org,lists.ozlabs.org,meta.com];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.977];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wunner.de:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: F1892103569
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 09:53:39PM +0100, Lukas Wunner wrote:
> So I wouldn't consider 918b4053184c to have been a universally successful
> approach and I fear that this patch goes even further.

Forgot to mention -- there's another problem:

PCI_ERS_RESULT_NO_AER_DRIVER is obviously AER-specific.

powerpc (EEH) and s390 have error recovery mechanisms separate from AER
and we've been trying to align them more closely so that drivers don't
need to be aware of platform-specific behavior.

eeh_pe_report_edev() does not modify the pci_ers_result for unbound
drivers and those without pci_error_handlers.  And the default is
PCI_ERS_RESULT_NONE.  eeh_report_error() also returns PCI_ERS_RESULT_NONE
for drivers without ->error_detected() callback.

In the PCI_ERS_RESULT_NONE case, EEH seems to perform a reset and
assume successful recovery.

It's only AER that is this strict about unbound devices and drivers that
lack pci_error_handlers.

If anything we should try to *reduce* deviations between the various
error recovery mechanisms, not double down on increasing them.

Thanks,

Lukas

