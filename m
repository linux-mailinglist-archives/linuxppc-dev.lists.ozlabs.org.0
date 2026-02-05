Return-Path: <linuxppc-dev+bounces-16614-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCC/BsZahGl92gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16614-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 09:54:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2781EF019E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 09:54:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f69yB4jT4z2yFb;
	Thu, 05 Feb 2026 19:54:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.76.133.112
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770281666;
	cv=none; b=Ln6RF/dH/mbKBTPyshCVD1ixp2gMmu5bJhJQku2mjGBx/XeousIWCa+jE1EobMLZZGMTQtuMGuXMOW6XgQu2XzgOr5Z1G0dMRdLO5pSRIwvFZ/FUjUbbsQnv1Ow+G2myzQm6eerc3AwJqMh7Er7GLaF7+tKe2WqmzfPDn8akKd9Hz8LUx+CPwDRxEQUqPJ6OEqBxrQ1356/1xBordgUGVAvZQIECajc9jJKoAFHyM5fXY5We7REuKylYYaTErnPtaixq2d9gQKKSPO/g+LePJh0GnVIQpD3GEfg33QTg7i0UjZPHAmv1yNzKXaSKd62rvywwwddRjvtM8+rH5Rx1IA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770281666; c=relaxed/relaxed;
	bh=SUeJNyehexqoYDeID7nGrc+f51GZT9nIaXngPQXE76E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbgrmGdFbldhVzXBkS0bQTb83sZq00X404r9YP0gJALEeZF52V0mQMohfwu3456Icitp8ofjtWaw/FABP/xvsiuLxOIKrmv3vBG/qJJ8IXwdecEFhIcuo3+73DR6dszcT59YyW3g/ReOjFhxtsuzjcnaCSEBYuXH76cTGfXbql+OmzFBMFmKUSIpDb6dkWsfYIxp7y9M4TsJ6L8VPzDw1fclobuDqDbBHX+lXytd+RKfr8oLahumOYo2TjHeLXqRS/mH1xvSYcikcmQfU/utlzwoZwG+eSquN8DrmhoSk21PDPm6rNfLEpEuYwkKO/2H1t8LHpDJPDOm6BSnazojCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=144.76.133.112; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=144.76.133.112; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [144.76.133.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f69y93gDdz2xg9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 19:54:22 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 3F7ED2C0161B;
	Thu,  5 Feb 2026 09:54:16 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id F0B4A36476; Thu,  5 Feb 2026 09:54:15 +0100 (CET)
Date: Thu, 5 Feb 2026 09:54:15 +0100
From: Lukas Wunner <lukas@wunner.de>
To: LeoLiu-oc <LeoLiu-oc@zhaoxin.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	CobeChen@zhaoxin.com, ErosZhang@zhaoxin.com, TonyWWang@zhaoxin.com
Subject: Re: [PATCH v2] PCI: dpc: Increase pciehp waiting time for DPC
 recovery
Message-ID: <aYRatwSvUG0yQkHd@wunner.de>
References: <20260204035542.53232-1-LeoLiu-oc@zhaoxin.com>
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
In-Reply-To: <20260204035542.53232-1-LeoLiu-oc@zhaoxin.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.51 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16614-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,linux.ibm.com,intel.com,gmail.com,lists.ozlabs.org,vger.kernel.org,zhaoxin.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[wunner.de: no valid DMARC record];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:LeoLiu-oc@zhaoxin.com,m:bhelgaas@google.com,m:mahesh@linux.ibm.com,m:przemyslaw.kitszel@intel.com,m:oohall@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:CobeChen@zhaoxin.com,m:ErosZhang@zhaoxin.com,m:TonyWWang@zhaoxin.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2781EF019E
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 11:55:42AM +0800, LeoLiu-oc wrote:
> For example, The execution of the ice_pci_err_detected() in the ice network
> card driver exceeded the maximum waiting time for DPC recovery, causing the
> pciehp_disable_slot() to be executed which is not needed. From the user's
> point of view, you will see that the ice network card may not be usable and
> could even cause more serious errors, such as a kernel panic. kernel panic
> is caused by a race between pciehp_disable_slot() and pcie_do_recovery().
> In practice, we would observe that the ice network card is in an
> unavailable state and a kernel panic.

Unfortunately v2 was submitted without answering all of the questions
and testing all of the things asked for during review:

https://lore.kernel.org/all/aYBoP-B2E9fp_4YZ@wunner.de/

