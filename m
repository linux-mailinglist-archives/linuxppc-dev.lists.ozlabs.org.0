Return-Path: <linuxppc-dev+bounces-3778-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEBE9E3615
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 10:00:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3BLG6X2wz30Vl;
	Wed,  4 Dec 2024 20:00:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733302806;
	cv=none; b=Et2bjU0B9lQ0y5lOoliKbUBWKi2Wnn15hpvrFx7WPBm6x9v11UB35Vmi5pVlXhqdQLFDtjSmWQ0ItamPSFIO3Dn91Ywb+DZRN9Oku1tvf2eQhvjvvu6TidhPb4/fKWKRPo/0SDOcNjEKKbkiAArE6TxmMcs2qXuu9PdKTdGR84+A+RJIxrWsFqFqIvSVFJPwbo5skafdk4B+05fZ0hLsUPt/Y+/VqojgHUtAXeCElq+7YAbCUWuLZziVBkI/fliCxOvSXi3shnu4JLtCMIcQqqXhLHTpnQ2ot1+T8lXWEY1LA2QvSnrRkhOUeVjNVe5b58qO7ze8rzPYnZ6JBzAE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733302806; c=relaxed/relaxed;
	bh=dpM2g75VsCwF4ni06a0Pzx4MSEcEE2LipOKSwUbh+bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ir9pq47WCwCioCCArutvL4amlN0wb8Dt3ELfSAuSfbnsCKSk7jK7xj2ejhxfU9diRanuyb6/vR8epaO7cmPPjCHn9HW1p3qJnkICSCXgOU247CftmDcWdiWD+xXdlAF1td6exrH03LKxdPdr7mpkDOJ24naxYUcf6uEpG+tYI6tmgO7ciDCsUSjvCfDyUyTrsitAfQvl4cL7YCKOk75xo09io83Ox0C+12pNWK7XlcnsjsK1at16MkbBocamEcb7hBt0u7m8Rs0TV1l7azAAnbcudaZ6vv+ve3QEwc2hOed8PV9olGAsDSTLRTlvGeOSQd7DFDThNa5JbqL/5UzwQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Ee1l/Ah+; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zTnU/GM2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Ee1l/Ah+; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zTnU/GM2; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Ee1l/Ah+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zTnU/GM2;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Ee1l/Ah+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zTnU/GM2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3BLD4lybz30Sx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 20:00:04 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 76CC52115F;
	Wed,  4 Dec 2024 09:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733302801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dpM2g75VsCwF4ni06a0Pzx4MSEcEE2LipOKSwUbh+bo=;
	b=Ee1l/Ah+Pm5rKdmO+heBpdxK+OnoQ1Y6vsDu/7UdtyhbeTig6IMM+ir6esMbt7WsVye4Dj
	TYUsezH0zs8DaQMlZByRLKBlew8vVBji8ZWQWGso6Ka1ti1Jh981Qda3YuzLSycRLRrda7
	8BCgN9p+ZU/U5Pjl0WZ6wKu9G+1ZGmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733302801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dpM2g75VsCwF4ni06a0Pzx4MSEcEE2LipOKSwUbh+bo=;
	b=zTnU/GM2sKznNNBKjO8JuBYwiqqwB3w6yaFytNWcjcrWE9hbjOk6QGtYs5hxmvQTfY4zO3
	8vHnKuloPcTIbgBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733302801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dpM2g75VsCwF4ni06a0Pzx4MSEcEE2LipOKSwUbh+bo=;
	b=Ee1l/Ah+Pm5rKdmO+heBpdxK+OnoQ1Y6vsDu/7UdtyhbeTig6IMM+ir6esMbt7WsVye4Dj
	TYUsezH0zs8DaQMlZByRLKBlew8vVBji8ZWQWGso6Ka1ti1Jh981Qda3YuzLSycRLRrda7
	8BCgN9p+ZU/U5Pjl0WZ6wKu9G+1ZGmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733302801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dpM2g75VsCwF4ni06a0Pzx4MSEcEE2LipOKSwUbh+bo=;
	b=zTnU/GM2sKznNNBKjO8JuBYwiqqwB3w6yaFytNWcjcrWE9hbjOk6QGtYs5hxmvQTfY4zO3
	8vHnKuloPcTIbgBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5389139C2;
	Wed,  4 Dec 2024 09:00:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HKtXLRAaUGfLYwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 04 Dec 2024 09:00:00 +0000
Date: Wed, 4 Dec 2024 09:59:55 +0100
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH RESEND v2 4/6] mm/page_alloc: sort out the
 alloc_contig_range() gfp flags mess
Message-ID: <Z1AaC5Hj2RV_5FDD@localhost.localdomain>
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-5-david@redhat.com>
 <feffbbe8-4176-48e8-b503-ef53d7914197@suse.cz>
 <96c92857-4850-4f85-9474-ac193c5ea48c@redhat.com>
 <04c1d28e-bbea-4499-9a6d-770f9ca53ba9@suse.cz>
 <d736f1c0-343e-4031-88ba-3b33b73dbeba@redhat.com>
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
In-Reply-To: <d736f1c0-343e-4031-88ba-3b33b73dbeba@redhat.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.cz,vger.kernel.org,kvack.org,lists.ozlabs.org,linux-foundation.org,nvidia.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,linux.ibm.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid]
X-Spam-Score: -8.30
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Dec 03, 2024 at 08:19:02PM +0100, David Hildenbrand wrote:
> It was always set using "GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL",
> and I removed the same flag combination in #2 from memory offline code, and
> we do have the exact same thing in do_migrate_range() in
> mm/memory_hotplug.c.
> 
> We should investigate if__GFP_HARDWALL is the right thing to use here, and
> if we can get rid of that by switching to GFP_KERNEL in all these places.

Why would not we want __GFP_HARDWALL set?
Without it, we could potentially migrate the page to a node which is not
part of the cpuset of the task that originally allocated it, thus violating the
policy? Is not that a problem?
 

-- 
Oscar Salvador
SUSE Labs

