Return-Path: <linuxppc-dev+bounces-15804-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C45D23940
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 10:34:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsHqr1J49z309N;
	Thu, 15 Jan 2026 20:34:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768469656;
	cv=none; b=Vkp7BLB0AOB/IAuTwFEIx6aeoP4qbt5TXXAixXXSnq73yyTcUF7MBzR9NJgS5mHyd+yU4Q14te63VxCO+jhZKToelj5xUfOM4l5yr0ATbU2YAXN8Kf3h+tAMhjDexhTyyB7K2SA85x/ZfUoIaKecpSnPTQOuHU9b80OrGTFdFY8TBfDBlDQgmZ1pT/aozSY1pQM7E1VOnlKfazBgdGL8qCfh7bow7nQKpu9rMzoBT522N+KjpGEE32F1Tfuy+XKeT98dqnTNMNjXPGBQAMT3PTX5HbvLi4NSoijUOhT8dNLk5OA2RzA7WowzfxT+oCvScGzVijRBKKDDWVokRXQEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768469656; c=relaxed/relaxed;
	bh=E3+emnN/FUkaljXR8TzqIDHk76UR0X2pbJSmye/ZyuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UBTEhbvF3TUYrBnw+VJ6WHNhv7+ORR6EbVqybr4kr4IvHmUUNg123Pw1khHEA0UHG9hlP9NEEqiV/BJEtw+DgIIouDaC8b5/68GIad8/8QhD/+1DN03qEkU1gi64nb3EAywvnhPo+3eb1RzJNqKfcPtK0Zg+kvMDb9qHVve1tStelRmuST+o/fcswWi1PFz3DdT8CLMbvj3cHjm1WRqDXosP+4JmdanqnBP4azhAXK+OxsljQwW3+m59u/4PHv2qKrovpwfSpTUPkU98+bF93uV39gBhhx5y3ZUl73lcbjj4+ZFuNBcoKTJJttQdRa7k2/5Bg84tqMCGQcO6w5qkMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i8OBAAJ9; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gOMZxbiT; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i8OBAAJ9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gOMZxbiT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsHqq1y02z2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 20:34:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768469652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E3+emnN/FUkaljXR8TzqIDHk76UR0X2pbJSmye/ZyuY=;
	b=i8OBAAJ9UZmxYIv2d1jA1ZCwNy2kAS582j1ndX87H3NECWsvloKyobOojSc6Z+cKocypQO
	fBxePX2zy2dyMS8Wz9sEKlqXIEHLx/3nhwG6rW6ft92Nm8IPt4cweF8KaPcLS2H0Auf9Ht
	sb302/0UOx0TF7WaYmWIaEFPkvGuXJM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768469653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E3+emnN/FUkaljXR8TzqIDHk76UR0X2pbJSmye/ZyuY=;
	b=gOMZxbiT9rBd3y5gT4VEaR3SzPCAbnTURINH6xMs340QlwKwt9yP0ccY3lS009OKumK4CJ
	OOFNK1yuG+m2hxL3N1FwuisCd+7PBrBqHJoVqfEjvra1ZSvbafhwZSd8WQMHxNc5oGuY1w
	+uo2BY1vxyr7CJpDzu+BNUcCYzhEFZY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610--jGTT1RnM9SR3z5AV6jgSg-1; Thu, 15 Jan 2026 04:33:04 -0500
X-MC-Unique: -jGTT1RnM9SR3z5AV6jgSg-1
X-Mimecast-MFC-AGG-ID: -jGTT1RnM9SR3z5AV6jgSg_1768469583
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4779edba8f3so5327485e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 01:33:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469583; x=1769074383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E3+emnN/FUkaljXR8TzqIDHk76UR0X2pbJSmye/ZyuY=;
        b=WF60hIwNO5gf0+mHsSiGPL1KqC+c6hMgTVnqUNIXNUPx1wWsxZnwfl/LsLPy/FflN9
         31i5grILkA+SfMXv27LoOynKcGk2k4MGIt2enaovdpa+QC0c45l6YnqFrDoPtCCPGHJU
         UV2RA9sjOhtwqt+0fmhY9aQ5h9ExOrk4QWrjbLon8c6JmeN+gkRwYZ1nyQWcDVFKy+oA
         E8vlAI19Enwb89E/OxBBLUpgVjoTmbBBIKzwmcqZNztxnBLuMm9vTf978V80Pgw7hx1L
         WUTtB+5ETbJ7j7ta4bky2l/QYM84nKyYBLv+9CBwabpMN6KTWYoe3YWkZplAmVH9hEE6
         3cHA==
X-Forwarded-Encrypted: i=1; AJvYcCVRX2Sbr+SCJ8GSurVudzhkVKD/x8EXtx38F5l1CKo5h7WFnIASF+oZVIwO6PIEo/z14W0uZRZziwXudWc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwBgu2THgKrBNIjqnSA6vRX2HuKkh9BAYixqMCEmo0QZCbny87j
	Fwrvj4R2cOHEmQJWuxXA1CtNkTbeAOaRryLtM/Gmu66gQV0AgB3y5vQPxxxsDxvPwg3FANQ7oIa
	s3dHFMeYafh1s/5l3L4GMU4W6BXhoBfrmvXl6cz90Pfyjmyojf4LZbLwdJfOIfhLOQxU=
X-Gm-Gg: AY/fxX4lLokGQrwl2IKmXiv4rollCZST30GCwQS19TPiZER6NYGDhuYi5Frb6zEFtti
	KRhZcvGjNva2QRC6FSTxwHPmcLaBsHKfm/dv9IHYdi4TmINNQkflU0USduC1w2MF+IXCGCsMi5c
	G/CAMRkFR3Rg2uUmg2TWVOU/z0+cJ2uqb29Kxd6eXZ8nQ8i+vPGfZAXLMnGxCqsfjK7ZF7X69P2
	5MCBfDeHs4u0BEPBC8/oMHGq/f+ramTBHoQPQmAKO7yWLI0pFcQa1IrFSHBFcJxNZUtZ4kNsr4H
	pFu+fzYcbMrJsv0TqskitDPOkNFX+cvVGs9Spyx0vsqM5XBApNoL9UvBgvINHx23I/TpR7LPIi1
	gPwDBqDsx/AilTuKmk5hJKRS1koWhUw==
X-Received: by 2002:a05:600c:6610:b0:477:b642:9dc9 with SMTP id 5b1f17b1804b1-47ee48271b8mr47954375e9.28.1768469583347;
        Thu, 15 Jan 2026 01:33:03 -0800 (PST)
X-Received: by 2002:a05:600c:6610:b0:477:b642:9dc9 with SMTP id 5b1f17b1804b1-47ee48271b8mr47953965e9.28.1768469582848;
        Thu, 15 Jan 2026 01:33:02 -0800 (PST)
Received: from redhat.com (IGLD-80-230-35-22.inter.net.il. [80.230.35.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee97b2bebsm19745355e9.18.2026.01.15.01.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:33:02 -0800 (PST)
Date: Thu, 15 Jan 2026 04:32:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v2 00/23] mm: balloon infrastructure cleanups
Message-ID: <20260115043240-mutt-send-email-mst@kernel.org>
References: <20260115092015.3928975-1-david@kernel.org>
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
In-Reply-To: <20260115092015.3928975-1-david@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5VntfVKrzHwJCxzmVbEtyBF_7U0LDsnhlG7A6WzdS5k_1768469583
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 10:19:50AM +0100, David Hildenbrand (Red Hat) wrote:
> I started with wanting to remove the dependency of the balloon
> infrastructure on the page lock, but ended up performing various other
> cleanups, some of which I had on my todo list for years.
> 
> This series heavily cleans up and simplifies our balloon infrastructure,
> including our balloon page migration functionality.
> 
> With this series, we no longer make use of the page lock for PageOffline
> pages as part of the balloon infrastructure (preparing for memdescs
> where PageOffline pages won't have any such lock), and simplifies
> migration handling such that refcounting can more easily be adjusted
> later (long-term focus is for PageOffline pages to not have a refcount
> either).
> 
> Plenty of related cleanups.
> 
> Heavily compile-tested and heavily runtime-tested with virtio-balloon.
> PPC CMM and the VMware balloon are untested and I'd appreciate a helping
> hand from people that have suitable environments.
> 
> Not CCing maintainers for the vmscan.c and migrate.c change as they
> are rather trivial and I don't want to patchbomb them.

besides MAINTAINERS thing:

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> --
> 
> This is based on mm/mm-unstable.
> 
> v1 -> v2:
> * Rebased to latest mm/mm-unstable without any conflicts
> * Minor patch description/subject and comment fixups
> * Retested
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jerrin Shaji George <jerrin.shaji-george@broadcom.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Cc: "Eugenio Pérez" <eperezma@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> 
> David Hildenbrand (Red Hat) (23):
>   vmw_balloon: adjust BALLOON_DEFLATE when deflating while migrating
>   vmw_balloon: remove vmballoon_compaction_init()
>   powerpc/pseries/cmm: remove cmm_balloon_compaction_init()
>   mm/balloon_compaction: centralize basic page migration handling
>   mm/balloon_compaction: centralize adjust_managed_page_count() handling
>   vmw_balloon: stop using the balloon_dev_info lock
>   mm/balloon_compaction: use a device-independent balloon (list) lock
>   mm/balloon_compaction: remove dependency on page lock
>   mm/balloon_compaction: make balloon_mops static
>   mm/balloon_compaction: drop fs.h include from balloon_compaction.h
>   drivers/virtio/virtio_balloon: stop using balloon_page_push/pop()
>   mm/balloon_compaction: remove balloon_page_push/pop()
>   mm/balloon_compaction: fold balloon_mapping_gfp_mask() into
>     balloon_page_alloc()
>   mm/balloon_compaction: move internal helpers to balloon_compaction.c
>   mm/balloon_compaction: assert that the balloon_pages_lock is held
>   mm/balloon_compaction: mark remaining functions for having proper
>     kerneldoc
>   mm/balloon_compaction: remove "extern" from functions
>   mm/vmscan: drop inclusion of balloon_compaction.h
>   mm: rename balloon_compaction.(c|h) to balloon.(c|h)
>   mm/kconfig: make BALLOON_COMPACTION depend on MIGRATION
>   mm: rename CONFIG_BALLOON_COMPACTION to CONFIG_BALLOON_MIGRATION
>   mm: rename CONFIG_MEMORY_BALLOON -> CONFIG_BALLOON
>   MAINTAINERS: move memory balloon infrastructure to "MEMORY MANAGEMENT
>     - BALLOON"
> 
>  .../admin-guide/mm/memory-hotplug.rst         |   8 +-
>  Documentation/core-api/mm-api.rst             |   2 +-
>  MAINTAINERS                                   |  12 +-
>  arch/powerpc/platforms/pseries/Kconfig        |   2 +-
>  arch/powerpc/platforms/pseries/cmm.c          |  53 +----
>  drivers/misc/Kconfig                          |   2 +-
>  drivers/misc/vmw_balloon.c                    | 105 +++-------
>  drivers/virtio/Kconfig                        |   2 +-
>  drivers/virtio/virtio_balloon.c               |  64 ++----
>  include/linux/balloon.h                       |  77 +++++++
>  include/linux/balloon_compaction.h            | 160 ---------------
>  include/linux/vm_event_item.h                 |   8 +-
>  mm/Kconfig                                    |  23 +--
>  mm/Makefile                                   |   2 +-
>  mm/{balloon_compaction.c => balloon.c}        | 194 +++++++++++++-----
>  mm/memory_hotplug.c                           |   4 +-
>  mm/migrate.c                                  |   2 +-
>  mm/vmscan.c                                   |   1 -
>  mm/vmstat.c                                   |   8 +-
>  19 files changed, 314 insertions(+), 415 deletions(-)
>  create mode 100644 include/linux/balloon.h
>  delete mode 100644 include/linux/balloon_compaction.h
>  rename mm/{balloon_compaction.c => balloon.c} (59%)
> 
> 
> base-commit: f8ed52ac0cfbddff992bb9600941bfe51e1e385a
> -- 
> 2.52.0


