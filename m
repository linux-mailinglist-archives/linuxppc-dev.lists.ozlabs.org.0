Return-Path: <linuxppc-dev+bounces-13089-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6439EBF695B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 14:59:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crXSZ3nLSz304H;
	Tue, 21 Oct 2025 23:59:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761051582;
	cv=none; b=m9reQ/uYECRshxVoYmdKDZ1kGXr2vC9ApUYSEUaZ7l3ePdR9ZhGB4TDgAVureim16sQsyc8DOd8XrO73TNK4hxmldoPJlCwlsq+qfznEIYDPzOiGzP6L7l1TpMdAmrgjRXuU7+k+njlfoIKfbJhu7BoTMoWJuGhMaev5Nd1ALqhM4f4zFAilyZ3XDc9fH6/CvpcUlH8sCqWyyaueVzJN7VpCYPz1Y15Jw3bwOYl3qJoyAWhkMacL9urEYL+oJu0HxW4LMEZuXo8AgN8A2hLNAXKvukwYgNNTV7hUEK/m58Fup1jrFlCn3J9pGrgvOyS/UR7JnY8WHCUpL9CrJghu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761051582; c=relaxed/relaxed;
	bh=omAB84zm1ZJJGkhLo0LBcnP4dZPVDNNrUkrD6enlyeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fpcULlPn0/fp0/vvbLHKjdv47PgvdXdJfdzzu8snKu0kuYmt2GL9hNBRr26/duk3ZmApXXIIEIY4jhbrRe+dR1rRG5mzetFHyi9wwLxUHjFfnxFv56TrNUWgn4IYxLRkNZ2gcVaMZfBLkO/vY4Dh9tVJGpSHu+cq8+JIaPGF5Tg+VVYG/F2XpAG8oBZxark2VZCRP3WT2zEPSwtwy81hOV7usMorHseca2/SOy3OR1yLIZ+ErWX5viNiGYXefvOjVUw5P/lUHXQm9NcP6xKsrfX+BeufPDgDPKAEzwm6M3T9fTSHWvlXGpqMpuux4Y+7EI2/IufPTB5YcBNiVE6PZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aG9ukBQj; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gHTktpJ3; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aG9ukBQj;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gHTktpJ3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crXSY2hvzz2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 23:59:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=omAB84zm1ZJJGkhLo0LBcnP4dZPVDNNrUkrD6enlyeI=;
	b=aG9ukBQjBk5GKfZEJ5+4xJWqUb4xddeh+AAm/v8I1t3d+n3EzI7AuyDL3CCZkXxB5VpF67
	eyR/ZgKVxiUYe8h+bhmMCZENyhmJKoHxiikL08QUN2wCJLKYayYH1Xa0M4E6P77a80xhD2
	e6X3C/Wc2QUa1HKuVnHAqzTmIdQ6HCg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=omAB84zm1ZJJGkhLo0LBcnP4dZPVDNNrUkrD6enlyeI=;
	b=gHTktpJ3ezaTogH9TWNBJJj9pqn4zBw7IB9sjRkdCrsiELnqGkEdro1fILceuluoVvLz0h
	CGMbQrPBrleoJ2j3+ZKuhDmKETpg8uVFq398SpnjucDh/jmbjYWCjeBXuj7sR/2zrkyx3b
	mag+H9Mvz9JQ8eEcntlN0yUEQEQrAS4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-2jgF6zH-OKug887Q1CxOQA-1; Tue, 21 Oct 2025 08:59:34 -0400
X-MC-Unique: 2jgF6zH-OKug887Q1CxOQA-1
X-Mimecast-MFC-AGG-ID: 2jgF6zH-OKug887Q1CxOQA_1761051573
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4711899ab0aso42901105e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 05:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051573; x=1761656373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omAB84zm1ZJJGkhLo0LBcnP4dZPVDNNrUkrD6enlyeI=;
        b=t88AvKfVAff8pnuYzMqWHwlYuZmM8p01vUgPJc3apmiL52wgh5kBRw6ZOQsFhVt9VZ
         4VIt2dc/WnQRBlWHsjh/zBggJ32VPfoXcKzwYD7s8p/ZRQWrr0g8hXy1hzhFZcx3EoNW
         sAnuDG5hiLOhqCYOxNLCjjnpfFrVdUNqrluz0QRIhgGXRaj0Gt1sCp8coQGUmk9dKXO9
         MFmLHZSTL+jV1ZRhv0RnmMuIWqW7Wy8iMxzYklUlHWIRBwtrNYKjqRHEdD/doXNEloHm
         CUt6LMenmtrshQ9SzxWaG2cux+7RLSbpTCXAWQPWeWaZB45C308i99PaZ4GBE0EqhXhZ
         bRdg==
X-Forwarded-Encrypted: i=1; AJvYcCXqguMYdggKMDKFeHcwHep+HIGIwMsT1Y6OJl6VQviLfMpr07oCvuXlEONvVkHXa2MSVekjw2BZWlYNAH0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxGTWTDncNC77kgz8YA7tWOQ6TYh2QsaNaD/1Sxp7t0Ao4MYsEu
	h6Ijtdbh/13wz0McK8cYTSU0pYtAqMfQfC8e5hGEvyumhRPfw4OOAqYAaTyx8RjazLpxEEYC7mT
	hr5PUFgNJhssNWn2n8lcJQ/9+mF6SEAmpyOIHNfZ8nzjXtcb7IEa67wQIUCNA3vzF4+I=
X-Gm-Gg: ASbGnct0ca2/M17xcnvI0u3PagIrkuVBpwcvLudtxbXuB74FeI859BkoN3Gmel4XYWl
	l6fbsfvnm7Z2XPp3iNrKJFnYGfRfegyvusFiV6d4T5wFzTvDr4StenSgUlNPtOt7pBdEkKZT1XD
	PNPeDD95E73SDoNDHTUrpeUAVZGMcnNSOrQvlU65cCEOi+XoVq9CI427R4awXULLH6bO5S52isB
	DzCaUKq9ZJqe2aYnEOC7CVWVqEyNYAproQJt2nJf3280YKMWijtD8KJGJw7mvIeNAMjX6lkw/WS
	Z/fakpdHPwvW7rUXFQ1paE/NHbjKPwDVf8jwad4lXB1wWKhmgghr8pdSnB64BQeo2z6u1L0d2tu
	McWModTWrfC8BDh346VmD/2GKBOHZuF8BWneqMz/l+BoCjjroRLUevi4gOs3r
X-Received: by 2002:a05:600c:3b03:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-471178a3ff6mr120309725e9.18.1761051572763;
        Tue, 21 Oct 2025 05:59:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN1EuUZZ8R3FSSnr8qb9y2RESEr9jR6C/rPmGSz5JIIAcste2ucC0iMZFWCPlNIaKu6Wi9QA==
X-Received: by 2002:a05:600c:3b03:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-471178a3ff6mr120309195e9.18.1761051572222;
        Tue, 21 Oct 2025 05:59:32 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5b3dabsm21210821f8f.16.2025.10.21.05.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:31 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v1 00/23] mm: balloon infrastructure cleanups
Date: Tue, 21 Oct 2025 14:59:05 +0200
Message-ID: <20251021125929.377194-1-david@redhat.com>
X-Mailer: git-send-email 2.51.0
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _sRyt1EjwWepjU-6052FM1UOxb6p_k6l60-sixkv9F0_1761051573
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is based on mm/mm-unstable with two PPC CMM fixes I sent out
separately earlier today [1] applied first.

[1] https://lkml.kernel.org/r/20251021100606.148294-1-david@redhat.com

---

I started with wanting to remove the dependency of the balloon
infrastructure on the page lock, but ended up performing various other
cleanups, some of which I had on my todo list for years.

This series heavily cleans up and simplifies our balloon infrastructure,
including our balloon page migration functionality.

With this series, we no longer make use of the page lock for PageOffline
pages as part of the balloon infrastructure (preparing for memdescs
where PageOffline pages won't have any such lock), and simplifies
migration handling such that refcounting can more easily be adjusted
later (long-term focus is for PageOffline pages to not have a refcount
either).

Plenty of related cleanups.

Heavily compile-tested and heavily runtime-tested with virtio-balloon.
PPC CMM and the VMware balloon are untested and I'd appreciate a helping
hand from people that have suitable environments.

Not CCing maintainers for the vmscan.c and migrate.c change as they
are rather trivial and I don't want to patchbomb them.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jerrin Shaji George <jerrin.shaji-george@broadcom.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: "Eugenio Pérez" <eperezma@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>

David Hildenbrand (23):
  vmw_balloon: adjust BALLOON_DEFLATE when deflating while migrating
  vmw_balloon: remove vmballoon_compaction_init()
  powerpc/pseries/cmm: remove cmm_balloon_compaction_init()
  mm/balloon_compaction: centralize basic page migration handling
  mm/balloon_compaction: centralize adjust_managed_page_count() handling
  vmw_balloon: stop using the balloon_dev_info lock
  mm/balloon_compaction: use a device-independent balloon (list) lock
  mm/balloon_compaction: remove dependency on page lock
  mm/balloon_compaction: make balloon_mops static
  mm/balloon_compaction: drop fs.h include from balloon_compaction.h
  drivers/virtio/virtio_balloon: stop using balloon_page_push/pop()
  mm/balloon_compaction: remove balloon_page_push/pop()
  mm/balloon_compaction: fold balloon_mapping_gfp_mask() into
    balloon_page_alloc()
  mm/balloon_compaction: move internal helpers to memory_compaction.c
  mm/balloon_compaction: assert that the balloon_pages_lock is held
  mm/balloon_compaction: mark remaining functions for having proper
    kerneldoc
  mm/balloon_compaction: remove "extern" from functions
  mm/vmscan: drop inclusion of balloon_compaction.h
  mm: rename balloon_compaction.(c|h) to balloon.(c|h)
  mm/kconfig: make BALLOON_COMPACTION depend on MIGRATION
  mm: rename CONFIG_BALLOON_COMPACTION to CONFIG_BALLOON_MIGRATION
  mm: rename CONFIG_MEMORY_BALLOON -> CONFIG_BALLOON
  MAINTAINERS: move memory balloon infrastructure to "MEMORY MANAGEMENT
    - BALLOON"

 .../admin-guide/mm/memory-hotplug.rst         |   8 +-
 Documentation/core-api/mm-api.rst             |   2 +-
 MAINTAINERS                                   |  12 +-
 arch/powerpc/platforms/pseries/Kconfig        |   2 +-
 arch/powerpc/platforms/pseries/cmm.c          |  53 +----
 drivers/misc/Kconfig                          |   2 +-
 drivers/misc/vmw_balloon.c                    | 105 +++-------
 drivers/virtio/Kconfig                        |   2 +-
 drivers/virtio/virtio_balloon.c               |  64 ++----
 include/linux/balloon.h                       |  77 +++++++
 include/linux/balloon_compaction.h            | 160 ---------------
 include/linux/vm_event_item.h                 |   8 +-
 mm/Kconfig                                    |  23 +--
 mm/Makefile                                   |   2 +-
 mm/{balloon_compaction.c => balloon.c}        | 194 +++++++++++++-----
 mm/memory_hotplug.c                           |   4 +-
 mm/migrate.c                                  |   2 +-
 mm/vmscan.c                                   |   1 -
 mm/vmstat.c                                   |   8 +-
 19 files changed, 314 insertions(+), 415 deletions(-)
 create mode 100644 include/linux/balloon.h
 delete mode 100644 include/linux/balloon_compaction.h
 rename mm/{balloon_compaction.c => balloon.c} (59%)

-- 
2.51.0


