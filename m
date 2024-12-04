Return-Path: <linuxppc-dev+bounces-3779-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC1E9E3616
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 10:00:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3BM03VL8z30Vn;
	Wed,  4 Dec 2024 20:00:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733302844;
	cv=none; b=fk/tI63UlvFBtOrE3r9tXKxq/ItdxNn00YuJLkIrT8Q11Fnw73vMJcpGj73HVcY6h30SfJCkegMU4qnxFXW+arlpwnvFj6fLo84adbldIuFWJlvs3mI624QDyONJqR3EdFdidGAL4C9j6xtAiPvH38K4rZoofu9xh4tpbpzDQBq2auKfLEyQtEX8Oj8upIil+z6VEody/EyYL9Fr8d7oFVk5MHX+AXfcmhss3GaXkgm1EEPYU5u3ddXleuVd+7EM11OMqvbAKoIYU3bhy+gAq/7Q4UufmWOCsiDaRMT1DGneoGBZ07h/4MzpkEuBbRpX1nFT00sCFG7ceQ3hEAjPLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733302844; c=relaxed/relaxed;
	bh=TGkrUIOK/o63mrqNdDYDHJlhGNtDvFUF9t/TpwiJRQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLvZwINUPjkaRozT3/EJO3SVidrKcrnID+fz9echHkkVmVTkZr7hdGBlH3vqnw615xKoXioB/Pj9W3Wa2eCIOfvRyeQVrPOrOpxZPW8xIbN1cWOBgpTnprOWqpLnJfpbcmOalwYpIyTXkkSD0avGrdcdqykirepl7v/sEeD/C2bLEAISujyTYnIzTt7WyPYJEE+zbOvcgBvpx4kCjZbjmkBnhwBNLWZ4I+OfQ09aDAbJ3w8IQj/2HkvnlYd2P8d/zZlJVfil/1ZpykZDPLOiR9ypwRASJMi9ZAj15OPm+XAd7VkgQu2Dj67azOP2R/BoUzsUvRYH/3vqEcjBz4XOgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3BLz46SVz30Sx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 20:00:43 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F095A21167;
	Wed,  4 Dec 2024 09:00:40 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 51CEC139C2;
	Wed,  4 Dec 2024 09:00:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kxxfETgaUGcyZAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 04 Dec 2024 09:00:40 +0000
Date: Wed, 4 Dec 2024 10:00:34 +0100
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
Subject: Re: [PATCH RESEND v2 4/6] mm/page_alloc: sort out the
 alloc_contig_range() gfp flags mess
Message-ID: <Z1AaMikjy9BUNe7v@localhost.localdomain>
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-5-david@redhat.com>
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
In-Reply-To: <20241203094732.200195-5-david@redhat.com>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: F095A21167
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Dec 03, 2024 at 10:47:30AM +0100, David Hildenbrand wrote:
> It's all a bit complicated for alloc_contig_range(). For example, we don't
> support many flags, so let's start bailing out on unsupported
> ones -- ignoring the placement hints, as we are already given the range
> to allocate.
> 
> While we currently set cc.gfp_mask, in __alloc_contig_migrate_range() we
> simply create yet another GFP mask whereby we ignore the reclaim flags
> specify by the caller. That looks very inconsistent.
> 
> Let's clean it up, constructing the gfp flags used for
> compaction/migration exactly once. Update the documentation of the
> gfp_mask parameter for alloc_contig_range() and alloc_contig_pages().
> 
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs

