Return-Path: <linuxppc-dev+bounces-3780-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAC09E3620
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 10:03:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3BQD0R60z30W0;
	Wed,  4 Dec 2024 20:03:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733303012;
	cv=none; b=gnMhux6HiJbTYgT3YNDt+pIyz6FVhjBRnUWMK7CDXrdixiDCBSFDmI8rqE3Z71CBqCkAf96ooeXwzFi4IONVMcGQlQAqv4eIE0Pxq4q6sSrDmaLBZ7TDfEepVrCa4kK3DXjJ/xgiI4/KqYjlnV0kDXGZhvMxnMcvLWJToEcgaL0zVaCWAcZIOjsBQKzatLLL7ZVcRDKVdjQ354u/gM+wCf+bkK+Lm9LqIoqXuHn2U44H8SQySvEadlAI0OSDSwm3e3r0vhIECP/JtxeYcqdQoo0u9OTFss4DcnhkkYsM69loSBKD6EpBDonWam54pwiokYvWPzZ0G8gvUmeNT1V3xA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733303012; c=relaxed/relaxed;
	bh=ywTnp4/Sv+64CfrtrhNnzI96LOiUWNdzN1oMV+Mq6WE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/hhd2arQeMkhLG3or4yUdlhXgSMkmk0j2ZV9k4Ywz4t4YpqSex2pywQzvzbgyh8YL00E4cxPCIIjrjv+lh6vMVyIv5JWqwXtz6e983stFttAonSo/KsJL4+soUcFUX6gy5G8xXM+90rHuQaXfEl89tAskNy6m7X/QyO0PqUMWKldh7re+UJB9E/9nxssSl1m94IYHhEtLD50lH0i07VF5FNt+OerWzAaBpZKcB4EHknPBb86bdFrsKzQrj2A/JQZN8aBAMkZzsS7FnLkVcIqmNgalE57JD5o0AHCIVMsxJrFvxQL52AD3z51hANMCI7Cyds0nt05v0xCE0SSNmoSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3BQC0YWSz30Vv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 20:03:30 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0E5F91F45F;
	Wed,  4 Dec 2024 09:03:28 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6AC88139C2;
	Wed,  4 Dec 2024 09:03:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DfrUFt8aUGfgZAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 04 Dec 2024 09:03:27 +0000
Date: Wed, 4 Dec 2024 10:03:25 +0100
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH RESEND v2 5/6] mm/page_alloc: forward the gfp flags from
 alloc_contig_range() to post_alloc_hook()
Message-ID: <Z1Aa3SjgMCS59agm@localhost.localdomain>
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-6-david@redhat.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203094732.200195-6-david@redhat.com>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 0E5F91F45F
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Dec 03, 2024 at 10:47:31AM +0100, David Hildenbrand wrote:
> In the __GFP_COMP case, we already pass the gfp_flags to
> prep_new_page()->post_alloc_hook(). However, in the !__GFP_COMP case, we
> essentially pass only hardcoded __GFP_MOVABLE to post_alloc_hook(),
> preventing some action modifiers from being effective..
> 
> Let's pass our now properly adjusted gfp flags there as well.
> 
> This way, we can now support __GFP_ZERO for alloc_contig_*().
> 
> As a side effect, we now also support __GFP_SKIP_ZERO and__GFP_ZEROTAGS;
> but we'll keep the more special stuff (KASAN, NOLOCKDEP) disabled for
> now.
> 
> It's worth noting that with __GFP_ZERO, we might unnecessarily zero pages
> when we have to release part of our range using free_contig_range() again.
> This can be optimized in the future, if ever required; the caller we'll
> be converting (powernv/memtrace) next won't trigger this.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs

