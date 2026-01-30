Return-Path: <linuxppc-dev+bounces-16457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KZ/GHOefGkLOAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 13:05:07 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B731EBA519
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 13:05:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2ZSs6pGHz2xWJ;
	Fri, 30 Jan 2026 23:05:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.78.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769774701;
	cv=none; b=YmiVGelk2Z3/j25V01KNjrxV1f6mq8Pe46U8SeZOXiIF9FuJPsOfrQcjDgO+i+ibAbA6w/pONVqMsATPJ5ayKfzlyLLN9MqSQiDoZZsS6UkvfUR+9EZLPifchfRWiiwtEoiCR7v4/WQIuUA3ziCbui+Cut6eFGz3pgQEyWQEQR+6/9RDn4kfRS4Gsm/PNOEsAtX3moDSXStKXBFindrNllwc55PHn7wCiOwcR2Cdcfdz3jls2G8qcLQKx5DKRq7z+j/ymNrZNrXLTpFbY59WmgueP9gtPtEeXN/W8vaFF9gc4KZIbs+cItcqDuv1yF0C4GHSgtmxJ7tQQH8P+YP6CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769774701; c=relaxed/relaxed;
	bh=efaCVRq6qsWUgBJqlh7FMFp+f3/sulNDqCLb8eykcL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aetQVd5mMBAGw31P2LcOCuyGqzfHXzTDteF2FNlyEYYShDZM/xm9RXvrSAjJzLG52SIM6NaQnOO/mlBlYJXGStvvH2bKtVgYATFuVk/eA3DreSf+Hdo1zV+aD4f8Qxds3VRYtHJk/dMEX3OMvqMwcY6brXCP5LqEpe/3G16psQ1VMYl14enQ8l3/hD1/ZtMESgwjfaYRiPNIB4LfzhY7gRgljaWBYepCz+Br06wmqAbq1AfCH/l7CCuJmwEDRbODBjxflIWKDFGf9DWoqi8d7humW2FuIweWUZpUVvPanTpqOZFVv9LkwHebv1pZxmtiwdMi3KICkA97YLc/MNJ+Cg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 330 seconds by postgrey-1.37 at boromir; Fri, 30 Jan 2026 23:05:00 AEDT
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2ZSr0wF4z2xS6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 23:05:00 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 85CA72007FB1;
	Fri, 30 Jan 2026 12:59:14 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 75DB71BDD9; Fri, 30 Jan 2026 12:59:14 +0100 (CET)
Date: Fri, 30 Jan 2026 12:59:14 +0100
From: Lukas Wunner <lukas@wunner.de>
To: LeoLiu-oc <LeoLiu-oc@zhaoxin.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, mahesh@linux.ibm.com,
	oohall@gmail.com, bhelgaas@google.com,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, CobeChen@zhaoxin.com,
	TonyWWang@zhaoxin.com, ErosZhang@zhaoxin.com
Subject: Re: [PATCH] PCI: dpc: Increase pciehp waiting time for DPC recovery
Message-ID: <aXydEn_lAbNROQKy@wunner.de>
References: <20260123202140.GA84703@bhelgaas>
 <3af9f754-d282-485c-a3f2-49a230bfe143@zhaoxin.com>
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
In-Reply-To: <3af9f754-d282-485c-a3f2-49a230bfe143@zhaoxin.com>
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
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16457-lists,linuxppc-dev=lfdr.de];
	DMARC_NA(0.00)[wunner.de: no valid DMARC record];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:LeoLiu-oc@zhaoxin.com,m:helgaas@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:bhelgaas@google.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:CobeChen@zhaoxin.com,m:TonyWWang@zhaoxin.com,m:ErosZhang@zhaoxin.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,gmail.com,google.com,lists.ozlabs.org,vger.kernel.org,zhaoxin.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wunner.de:mid]
X-Rspamd-Queue-Id: B731EBA519
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 06:07:51PM +0800, LeoLiu-oc wrote:
> Without this patch, PCIE devices may not be usable and could even cause
> more serious errors, such as a kernel panic. For example, the following
> log is encountered in hardware testing:
> 
> list_del corruption, ffff8881418b79e8->next is LIST_POISON1
> (dead000000000100)
> ------------[ cut here ]------------
> kernel BUG at lib/list_debug.c:56!
> invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> ...
> Kernel panic - not syncing: Fatal exception

This should not happen.  Which kernel version are you using?

There used to be a use-after-free on concurrent DPC and hot-removal.
It was fixed by 11a1f4bc4736, which went into v6.11 and was subsequently
ported all the way back to v5.10-stable.

I suspect you may be using a kernel which lacks that fix.

Thanks,

Lukas

