Return-Path: <linuxppc-dev+bounces-16528-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MilIZcSgWkqEAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16528-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 22:09:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5ED18AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 22:09:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4fPs3bSMz2xKx;
	Tue, 03 Feb 2026 08:09:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.78.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770066577;
	cv=none; b=eiJoRqpHSy3zN+tQb0BjN5121JdwTN2ttAeMWE9Vj8lcoK+360PIRFjGOGueXpwSLGC5M74AxCyAscaOD3s/B8QGd2LrwpuENaUzOLqg4/YLyZhEwqvAk5lWl288++Dv2hEvnsmFpbAfUhPGaGrbKWc4gsvyC6FgzCX+a5NalFT590iq7WY3QqSaEIv+pIKlCZWDqDC+9k8ExsxU5vpIRyzdnSVEd69RvwYTXAgvlDj37Td8JwkB6wE5oSp2vDsN40e6xf1xi8+9Ghanyzw1hDtvOY7idOuYVY6KZMiXvS8FRvkl7SXrJ388xkMAlgx9LGuUXUShg3gfWFRSvqKayg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770066577; c=relaxed/relaxed;
	bh=gNiJ/jl1QYyOrGHHsZeeP54O4O8Pg59etnwrRXvoaLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSf5XQjDsZ1t9xejYmaA0K8xodto0FGdaXAP/0Wh9pW9Vbk4vwuIhh8PimL8EWGYwf+4+LHQ8hqUXQUU47wDDNWeW2IaPAw3YGbr3BnPZJYWTg49iG2cu2WnpkJCj7S9/PQJrjrYGC0PccioDT4EXXHP68g19wnL64ZtwyvxNexkh5DhX9OZ/PpPVEofhVGLvWr4V1qwLwNYp/GMn+a4RBfjR0gkZeoAtyMIJrzbCf0O42fW5G/6kD9v208HEhDTWSG9cVhvh5Wc49HVkw5iQjfy7jj2W6/j71p/iwmnNbEAvykY1wStDFogQwglg6/5F2ytUCOWVK9eLL6/lGtR7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4fPq5QXRz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 08:09:33 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 520912006F69;
	Mon,  2 Feb 2026 22:09:27 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 4B301290DD; Mon,  2 Feb 2026 22:09:27 +0100 (CET)
Date: Mon, 2 Feb 2026 22:09:27 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
	kbusch@kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com,
	mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
	terry.bowman@amd.com, tianruidong@linux.alibaba.com
Subject: Re: [PATCH v7 2/5] PCI/DPC: Run recovery on device that detected the
 error
Message-ID: <aYESh4bCE2lzTg2S@wunner.de>
References: <20260124074557.73961-1-xueshuai@linux.alibaba.com>
 <20260124074557.73961-3-xueshuai@linux.alibaba.com>
 <aYCujqZIvxElSsOE@wunner.de>
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
In-Reply-To: <aYCujqZIvxElSsOE@wunner.de>
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
	FORGED_RECIPIENTS(0.00)[m:xueshuai@linux.alibaba.com,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:kbusch@kernel.org,m:sathyanarayanan.kuppuswamy@linux.intel.com,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:Jonathan.Cameron@huawei.com,m:terry.bowman@amd.com,m:tianruidong@linux.alibaba.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-16528-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,google.com,kernel.org,linux.intel.com,linux.ibm.com,gmail.com,huawei.com,amd.com,linux.alibaba.com];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wunner.de:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 95A5ED18AA
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 03:02:54PM +0100, Lukas Wunner wrote:
> You're assuming that the parent of the Requester is always identical
> to the containing Downstream Port.  But that's not necessarily the case:
> 
> E.g., imagine a DPC-capable Root Port with a PCIe switch below
> whose Downstream Ports are not DPC-capable.  Let's say an Endpoint
> beneath the PCIe switch sends ERR_FATAL upstream.  AFAICS, your patch
> will cause pcie_do_recovery() to invoke dpc_reset_link() with the
> Downstream Port of the PCIe switch as argument.  That function will
> then happily use pdev->dpc_cap even though it's 0.

Thinking about this some more, I realized there's another problem:

In a scenario like the one I've outlined above, after your change,
pcie_do_recovery() will only broadcast error_detected (and other
callbacks) below the downstream port of the PCIe switch -- and not
to any other devices below the containing Root Port.

However, the DPC-induced Link Down event at the Root Port results
in a Hot Reset being propagated down the hierarchy to any device
below the Root Port.  So with your change, the siblings of the
downstream port on the PCIe switch will no longer be informed of
the reset and thus are no longer given an opportunity to recover
after reset.

The premise on which this patch is built is false -- that the bridge
upstream of the error-reporting device is always equal to the
containing Downstream Port.

It seems the only reason why you want to pass the reporting device
to pcie_do_recovery() is that you want to call pcie_clear_device_status()
and pci_aer_clear_nonfatal_status() with that device.

However as I've said before, those calls are AER-specific and should
be moved out of pcie_do_recovery() so that it becomes generic and can
be used by EEH and s390:

https://lore.kernel.org/all/aPYKe1UKKkR7qrt1@wunner.de/

There's another problem:  When a device experiences an error while DPC
is ongoing (i.e. while the link is down), its ERR_FATAL or ERR_NONFATAL
Message may not come through.  Still the error bits are set in the
device's Uncorrectable Error Status register.  So I think what we need to
do is walk the hierarchy below the containing Downstream Port after the
link is back up and search for devices with any error bits set,
then report and clear those errors.  We may do this after first
examining the device in the DPC Error Source ID register.
Any additional errors found while walking the hierarchy can then
be identified as "occurred during DPC recovery".

Thanks,

Lukas

