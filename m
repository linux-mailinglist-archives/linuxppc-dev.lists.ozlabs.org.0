Return-Path: <linuxppc-dev+bounces-16537-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMhyEYingWm3IQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16537-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 08:45:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D02D5CFD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 08:45:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4wW84bNWz30GV;
	Tue, 03 Feb 2026 18:45:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.78.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770104708;
	cv=none; b=aEUozyksflQm+cDP/RBGbhDklDdfU6Cwu8E97tzqUVAzSe5mk0Li3072uV9QPs301wE7FwZltLi2uXESgfkSZU6iaWvsZAqyjZeerwqUBgGkBWPcaj0phh6lYDohKVag1NDIKop6A211zE+Mb5n3vXGf5tvijxtDz9wvrYMi7KL8f1lvwB7nsqfSqb6l5RQafg2xonpva1XFdaeRN34B6o0YnKok2VMXTtaH/mUPGLx+y1zIw70qbZ3kwDjL1vFPuWcxdfJ/sQdhrFfyTACJaX4E5UIq4Tu+jabxxP/L3SHRuusEF09AQYITjPPpcyxD6cVCT4Rh/7ZOEqamkv71tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770104708; c=relaxed/relaxed;
	bh=9sX3wRAtrEossmq3cY7uDXzysZPX25inkDRtX1XRoX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfKtGAE2EKIRsUuQBEQEuKq9Bp2iytieBlD+FyiOo1Il2c4Y1THqt8hWbiJ/nHswVbu8FFEf0AuNFVS7HQpzZPGMv7Tft+EjxN/bMYD0hndcJDYM0mBui19kxfnLvyRszimgloz7SKi87BaPjsYBmB9LKKIE+oxz/Xm3BnvlLln5BMNEjjZ4V0yWSUJIew2jVR/uKFgvVKC+12uwROInZjY/h30ynl2/4Uo0oxQvXtkBcM4NqIK6xA4Ui5YQ/QoolHybzpbpAAQKYs6cyBKn+nP/sAsWgTt6nohzjbxz0dP/szUYsJ5YfErnS+c4nN5XQr54nPfT150L5suFPIk03A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4wW70F8Pz309y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 18:45:04 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id C7AB02007FCC;
	Tue,  3 Feb 2026 08:44:59 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id A334D290DB; Tue,  3 Feb 2026 08:44:59 +0100 (CET)
Date: Tue, 3 Feb 2026 08:44:59 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
	kbusch@kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com,
	mahesh@linux.ibm.com, oohall@gmail.com, terry.bowman@amd.com,
	tianruidong@linux.alibaba.com
Subject: Re: [PATCH v7 5/5] PCI/AER: Only clear error bits in
 pcie_clear_device_status()
Message-ID: <aYGne72Gjb_d9Myd@wunner.de>
References: <20260124074557.73961-1-xueshuai@linux.alibaba.com>
 <20260124074557.73961-6-xueshuai@linux.alibaba.com>
 <20260127104520.0000579c@huawei.com>
 <881e57b7-aa73-4df6-b37b-d71571567436@linux.alibaba.com>
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
In-Reply-To: <881e57b7-aa73-4df6-b37b-d71571567436@linux.alibaba.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.51 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[wunner.de: no valid DMARC record];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:xueshuai@linux.alibaba.com,m:jonathan.cameron@huawei.com,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:kbusch@kernel.org,m:sathyanarayanan.kuppuswamy@linux.intel.com,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:terry.bowman@amd.com,m:tianruidong@linux.alibaba.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-16537-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[huawei.com,vger.kernel.org,lists.ozlabs.org,google.com,kernel.org,linux.intel.com,linux.ibm.com,gmail.com,amd.com,linux.alibaba.com];
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
X-Rspamd-Queue-Id: 54D02D5CFD
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 08:45:36PM +0800, Shuai Xue wrote:
> The revised the commit message is:
> 
> PCI/AER: Only clear error bits in PCIe Device Status register
> 
> Currently, pcie_clear_device_status() clears the entire PCIe Device
> Status register (PCI_EXP_DEVSTA), which includes both error status bits
> and other status bits.
> 
> According to PCIe Base Spec r6.0 sec 7.5.3.5, the Device Status register
> contains different types of status bits:

Always cite the latest spec revision, i.e. PCIe r7.0 sec 7.5.3.5.

> - RW1C (read/write 1 to clear) non-error bits: For example, Emergency
>   Power Reduction Detected (bit 6). Unconditionally clearing these bits
>   can interfere with other drivers or subsystems that rely on them.

It would be good to explicitly call out that this bit was introduced with
PCIe r5.0 in 2019 and that it's currently the only writable bit in the
register besides the error bits.

> - Reserved bits: May be used for future features and should be preserved.

Wrong, they're marked "RsvdZ" (not "RsvdP"), so they're supposed to be
written as zero (not preserved).

Thanks,

Lukas

