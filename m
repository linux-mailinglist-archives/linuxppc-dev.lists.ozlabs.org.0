Return-Path: <linuxppc-dev+bounces-16697-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPs6KO01hmlrLAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16697-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 19:41:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6EF102220
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 19:41:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f72xM4VW5z30GV;
	Sat, 07 Feb 2026 05:41:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:fff3:b8::112"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770403303;
	cv=none; b=opgfdKzgVx0adoCGFFBAMdJ+g7aKZ3p50OtDJSl3v6+Y4lIhTvIf09KE62cS+D246BdJa4sN6hu0mZ5u8qXO/gZ7/zJ76ZKrYmxQ+sL3nfdWnU2HuJPFp1TbhLctbI+xDZMY1TnaeXaHQnXL47OgI0PSr0QRK5FKINckCCMxwztX34oUCZcoZMeIF6Teobcw0+EzsOmU3206Uu9HKdT0T0uM96B9cDKjkKwy2fyqblQmoQCOnLehTOx5rCNTGAKTur2I0qcBI0OHMLycdsrfGt9aWA54eyoz8tXJgaU53FbnICCsrTiW07/YvocM0AzjkIOyeBadY4v1x8RXkqTy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770403303; c=relaxed/relaxed;
	bh=olpzSYNZ14XlLZXB8TEqRSt5VCQJjkswosd7/BfjpQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfiWpXz1cEebCFkgO6JIGER1+hT6qPQcGG6JIvHNsefhWw1XI+KX9qIBg44f0DOKI33+eojQtk74KcHYVdsX1XnXiOxtUI2k/w5hxBanr+DXkkUlU1jhhErjd90bjLR3tai6BSJVAjIl0L4rZDi6v3AA0ZdTyeBGbooXeCvG42B7TmngXxlvCr3BjHZkcCkZ/VQp7XCoTyLl+JM/lchSqiU79pGOGFVaA7W8lPQZsYK0bj+DY8gRqUDu1xkBSaiOGd3jU0/bqRh24Hf5bBIULs2pv4dSZ3FaikeoFfuf628E/L0MIKAz6IH7RsQ2W33H4qZHkpIKNYpV15ITPKd60A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:4f8:fff3:b8::112; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=2a01:4f8:fff3:b8::112; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [IPv6:2a01:4f8:fff3:b8::112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f72xK3F19z2xpg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 05:41:38 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id ACA912C03E87;
	Fri,  6 Feb 2026 19:41:33 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 89013473B; Fri,  6 Feb 2026 19:41:33 +0100 (CET)
Date: Fri, 6 Feb 2026 19:41:33 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Breno Leitao <leitao@debian.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>, kbusch@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	dcostantino@meta.com, rneu@meta.com, kernel-team@meta.com,
	Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PATCH] PCI/AER: Add option to panic on unrecoverable errors
Message-ID: <aYY13T00wmo-toap@wunner.de>
References: <20260206-pci-v1-1-85160f02d956@debian.org>
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
X-Spam-Status: No, score=0.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
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
	FORGED_RECIPIENTS(0.00)[m:leitao@debian.org,m:corbet@lwn.net,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:bhelgaas@google.com,m:kbusch@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:dcostantino@meta.com,m:rneu@meta.com,m:kernel-team@meta.com,m:terry.bowman@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-16697-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lwn.net,linux.ibm.com,gmail.com,google.com,kernel.org,vger.kernel.org,lists.ozlabs.org,meta.com,amd.com];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wunner.de:mid]
X-Rspamd-Queue-Id: 2A6EF102220
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 10:23:11AM -0800, Breno Leitao wrote:
> When a device lacks an error_detected callback, AER recovery fails and
> the device is left in a disconnected state. This can mask serious
> hardware issues during development and testing.
> 
> Add a module parameter 'aer_unrecoverable_fatal' that panics the kernel
> instead, making such failures immediately visible. The parameter
> defaults to false to preserve existing behavior.

There's a parallel effort by Terry Bowman (+cc) to introduce a
PCI_ERS_RESULT_PANIC return value for error handling:

https://lore.kernel.org/all/20260203025244.3093805-4-terry.bowman@amd.com/

Please consider using that as the basis for your needs.

Thanks,

Lukas

