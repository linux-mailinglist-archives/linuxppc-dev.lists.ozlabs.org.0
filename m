Return-Path: <linuxppc-dev+bounces-16700-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PTHKI8/hmnzLAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16700-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 20:22:55 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5069102A9C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 20:22:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f73rp0Jmwz30Lv;
	Sat, 07 Feb 2026 06:22:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770405769;
	cv=none; b=P07f7XfoFf1HqpUz62axkrzqBwDOwo91GTi/uwjErV+r6Ej/KmrpI/zFPedBFUmHxnCtuyCV90ovz1gz813tvRn3cnllivuU7G1lJfyMPip8YGcXMkru/flRH2GtqNZxYbPRlm+9g/U4u+GUyPAPgHgFR9IysGUkshVbiNNPyLGhTZTyPyBniSbwA+L9ubxZT/xTyF8STFEGvAZEcvSlqJNCCpOQCcFuC7QVQFhRmMRcZd0KjzGumVUwiCPs2yJhVL/LA+/lkjhROco69SSRSrZCtKZUKrriSTSKcTKqMAFtndahZmkR35T/VUw+TPkKiFey2Ncc8cPFFAIZ9fSBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770405769; c=relaxed/relaxed;
	bh=pQrdhcdv6XYyTqD5OWGtLKx1it+pTil8E6MWWEWD8xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXj6Lnz/MAlq5HoKFUX+AAdjz3tSgdKp1fbr8IvdGs0BoQckaXx4+VbeZ3ReouW0Pj0JuYcCClBkoEAndH6nq14tgmPkdeo5Qk7k48/huQDUuNKpFn+ikkF0f87O8A2LVuVdu2VLcTbuUfKotXNYrpG2cZXm1pRFp6LJUnA2jfP+F+6Kr87HpI0w3rSL2Sp6lAWzLfxWuxkRNrGm7VPvcAy8OTLtCne8oe1qp/HRdPXp0ipTdDToU8pMSyT5xA4wNHo8AGPjEdtu9y8qoKRpt79+XTYpxmeB0TLnmeTW/OBICwXBP8fegXfc1FcHREhu5l68DWJOGqHuxemUVx8sEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=spbrbna5; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=spbrbna5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f73rn1KR8z30BR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 06:22:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B26F06001A;
	Fri,  6 Feb 2026 19:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C917DC116C6;
	Fri,  6 Feb 2026 19:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770405766;
	bh=Kx5wCP16pk7aUKUS5Xc0tFB0Vbdh59w+1I8LJqs55U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=spbrbna5ixWjIiDUfzkYLTPfYSHLqaWM1tapgfHoQuHb0w8yXLKcZ0NuUXaWX09mc
	 Srkbc+faDpBQkr+3X1x0jaCfz+OkN9DPzefo8+ODZ7+Y9/N6qlbExQws5bVJnS4OBK
	 sCX/+c15tp23trM6HBpYwDUlzJbHP7gqvGFu8s6cR6AO95wTNCBOeWxs8LgxLD4ZP1
	 p9mX08kUANVWoTd47pUPFYryWSoNnUNyC8N+t4hv6Ov/0oiOCGcQ8T9+/hitYkUvrr
	 TDmuTgrhjUdTNn6dyZyGqRhdryecNjbDkgQLC7ooJjmsYT9Splcu+EukfqOpN4kpJ5
	 ZZFbEM5w9Nd7A==
Date: Fri, 6 Feb 2026 12:22:44 -0700
From: Keith Busch <kbusch@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Jonathan Corbet <corbet@lwn.net>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, dcostantino@meta.com, rneu@meta.com,
	kernel-team@meta.com
Subject: Re: [PATCH] PCI/AER: Add option to panic on unrecoverable errors
Message-ID: <aYY_hMZyVp7GZvX2@kbusch-mbp>
References: <20260206-pci-v1-1-85160f02d956@debian.org>
 <20260206185232.GA70936@bhelgaas>
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
In-Reply-To: <20260206185232.GA70936@bhelgaas>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16700-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:leitao@debian.org,m:corbet@lwn.net,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:bhelgaas@google.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:dcostantino@meta.com,m:rneu@meta.com,m:kernel-team@meta.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[debian.org,lwn.net,linux.ibm.com,gmail.com,google.com,vger.kernel.org,lists.ozlabs.org,meta.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[kbusch@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kbusch@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D5069102A9C
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 12:52:32PM -0600, Bjorn Helgaas wrote:
> Just from an overall complexity point of view, I'm a little hesitant
> to add new kernel parameters because this seems like a very specific
> case.
> 
> Is there anything we could do to improve the logging to make the issue
> more recognizable?  I assume you already look for KERN_CRIT, KERN_ERR,
> etc., but it looks like the current message is just KERN_INFO.  I
> think we could make a good case for at least KERN_WARNING.
> 
> But I guess you probably want something that's just impossible to
> ignore.

It's not necessarily about improving visibility with a higher alert
level. It's more that the system can't be trusted to operate correctly
from here on. Consider an interconnected GPU setup and only one
experiences an unrecoverable error. We don't want to leave the system
limping along with this unresolved error as it can't perform anything
useful. A panic induced reboot is the least bad option to return the
system to operation, or crashes the system temporally close to failure
to get logs for the vendor if we're actively debugging.
 
> Are there any other similar flags you already use that we could
> piggy-back on?  E.g., if we raised the level to KERN_WARNING, maybe
> the existing "panic_on_warn" would be enough?

There are many KERN_WARNING messages that don't rise to the level of
warranting a 'panic' that don't want to enable such an option in
production. It looks like the panic_on_warn was introduced for developer
debugging.

I agree the curnent INFO level is too low for the generic unrecovered
condition, though.

