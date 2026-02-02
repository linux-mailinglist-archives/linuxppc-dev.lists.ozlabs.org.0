Return-Path: <linuxppc-dev+bounces-16507-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NjxK6V/gGnE8wIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16507-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 11:42:45 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0238CCB1F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 11:42:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4NVS1Yv6z30BR;
	Mon, 02 Feb 2026 21:42:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.76.133.112
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770028960;
	cv=none; b=UdOXekg5duSAJvxtffhex301M1XinQJAlHqBuTO2D3dnYSCvLvtieL/slC4BeoJmTSr80tNqw4YOoWlmgjED36N6B6NHyOO+dyiTqDTM5Z+8v14zD6YuWN0f90iU9sOWXho5qdzayubPR8hCBzVQDYbP67gH0naAnz+aecegBIwsewSOy1ZnZcn34776CB9VOVg5KQSu92nwnocUQkl3BCt4IFvPpBOQQh0ADL2kXPRi6jzHIEIyjfFMtnyEBrcgbz2NxWjwKsb5DjiMRlaQUInyiuZyz3t98DvrMJh5ccBMalTkxGOMTE8dHpxz+MvSJQvCnQhiGDCUsesgtbCg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770028960; c=relaxed/relaxed;
	bh=ZBwuQk8EZrJwCiU7oQADauSTurIIZ5Gjc9dV7Hy+u7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMNoKPy2/QOzbC/bwSGy711aPUzvEG6zjuKN628/yuCrCurY28hKgBt4spe6k4znaE3uytFwGzIanibYACXB3gB0HROFgB8/Owhu6lQ4lH8lbMS9Mz4t7GRz/kpVlE46a/O990GEIaup1iZ91ZBBzw2zY+h2MURvx3rbtqW3a8Iq9eQ6hTVFeQZGGYtAjcHo2+SCwvNarmfMneE40CcBegllX1Mx5Ld6G+bqG9Gxusg2uIi8T0TdI56e34Vh6MOJ4WIr13NS77XsrJ6eMSNulJD18HBD7mvhJtD+2fRZCmIAYoI6AkhEBC5hV0BNZLJ0ndJcZoN8UinVu3QjH7mFig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=144.76.133.112; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=144.76.133.112; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [144.76.133.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4NVP5YCQz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 21:42:37 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 365AE2C02044;
	Mon,  2 Feb 2026 11:42:22 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 09132290CA; Mon,  2 Feb 2026 11:42:22 +0100 (CET)
Date: Mon, 2 Feb 2026 11:42:22 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Terry Bowman <terry.bowman@amd.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	linux-pci@vger.kernel.org, Shuai Xue <xueshuai@linux.alibaba.com>,
	tianruidong@linux.alibaba.com, Keith Busch <kbusch@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] PCI/AER: Clear stale errors on reporting agents upon
 probe
Message-ID: <aYB_jmq7xlyKpBFb@wunner.de>
References: <3011c2ed30c11f858e35e29939add754adea7478.1769332702.git.lukas@wunner.de>
 <20260127230055.GA384686@bhelgaas>
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
In-Reply-To: <20260127230055.GA384686@bhelgaas>
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
	TAGGED_FROM(0.00)[bounces-16507-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,linux.intel.com,vger.kernel.org,linux.alibaba.com,kernel.org,linux.ibm.com,gmail.com,lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[wunner.de: no valid DMARC record];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:terry.bowman@amd.com,m:sathyanarayanan.kuppuswamy@linux.intel.com,m:linux-pci@vger.kernel.org,m:xueshuai@linux.alibaba.com,m:tianruidong@linux.alibaba.com,m:kbusch@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0238CCB1F7
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 05:00:55PM -0600, Bjorn Helgaas wrote:
> On Sun, Jan 25, 2026 at 10:25:51AM +0100, Lukas Wunner wrote:
> > Correctable and Uncorrectable Error Status Registers on reporting agents
> > are cleared upon PCI device enumeration in pci_aer_init() to flush past
> > events.  They're cleared again when an error is handled by the AER driver.
> 
> Do you think pci_aer_init() is the right time to clear the error
> status bits?  Most of those bits are sticky, so they're not cleared by
> reset.
> 
> I'm thinking about the scenario where a PCIe error occurs is captured
> in the AER error status registers, but the system reboots before the
> AER driver can log the error.  Since the bits are sticky, the new
> kernel might have a chance to find and log the error that happened
> with the previous kernel.

I agree that *reporting* errors instead of just silently *clearing* them
could be useful.

We cannot pinpoint when the errors occurred, so we'd have to mark them
in the log messages as having occurred "during shutdown or early boot"
or "during suspend or resume" (for errors occurring during a system sleep
cycle).  But that could still be good enough and helpful for users.

We could report them with KERN_INFO severity and if that turns out to be
too noisy, demote them to KERN_DEBUG or exempt certain error types
(such as Unsupported Requests).

Shuai Xue and I had a discussion late last year about reporting
versus silently clearing stale errors:
https://lore.kernel.org/all/aPoIDW_Yt90VgHL8@wunner.de/

I think we were both unsure back then whether you would entertain a patch
to report stale errors.  But since you're now raising the issue yourself,
I'd say yes, it's worth pursuing.

However I think the $SUBJECT_PATCH still makes sense:  If I were to submit
a series to report stale errors, I'd still first amend the code to clear
all stale errors (instead of leaving some of them uncleared), then amend it
to report errors prior to clearing them.  The $SUBJECT_PATCH is sort of
a fix that distributions may want to backport, whereas *reporting*
stale errors would be a new feature not eligible for backporting.

> So I wonder if pci_aer_init() should just find the Capability and
> alloc its buffers, and aer_probe() should look for existing errors and
> log them before clearing them.

Devices may be enumerated after aer_probe(), e.g. when they're hot-added
below an AER-capable and hotplug-capable Root Port.  For cases like this,
we'll still have to clear (and in the future report) stale errors in
pci_aer_init().

(The $SUBJECT_PATCH takes this into account and explicitly calls out
this corner case in the commit message.)

Thanks,

Lukas

