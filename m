Return-Path: <linuxppc-dev+bounces-16027-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC21D3BB20
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 00:01:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw5Yj12gwz2xm5;
	Tue, 20 Jan 2026 10:01:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768863705;
	cv=none; b=Lnx9VniYBPGcO/OYef8R5rXfNyWRq71YOg2/rAcd2hrC1akoAjzR8TVopE3Kz5CSN+8VT3Jwbyfpe0WQs+wuajgiR9qtzScR6IWm1wAJnmKAl3RoHvLRiYCaIYqNSV13Z2KBeq9l0Ofe263tX7+pT3saEz61BrcFryVTUfuZ1kGpU8FpLZIJkKqFAJ2a2CxGMY3rEY4Lc+dvW0NP8G4bWw9NyMSzFuav898obfgeoPiMldZOohspzURUR2JaytztxKXYYaA64Ef0wvye5ygtEvp1g1Bzx9Q0zgUQNWV2ivCpwvFANi4ywCgd/qzapCuuAB3cdbLKGqlSGzSlN+CtiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768863705; c=relaxed/relaxed;
	bh=t4IKtjKIPaTyUPeC+tbAFZ1mfWke80YUyMIQ3D+uxWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QKDn/6X5qyc1W0vporpz4zdqo1l52RrClV4gixJ38JdsQVU9eIJ/nmiL/I/x3omj6YpbXoN5rl/O3wu5UmGseMPb5meTKg6ytYBYgL13FBkwaN+lVsNrpM2fm6klLrHy2IPIojEPeKxuYxIa1xUd20cro3Ct+R1u4OCYdZPHPLU/uq4LbnxI1Co525jqt8+hNDFmsBCK7GzV9rxGd9ND9crUUBr+We1K/JSb/YiQULmxl6kqLPLopaL2AxIPWzMr/ZzHGmJhBeGcX1eoOYracpwV6EdtojBtmgxWh7goimZdqBDZa8wcbLma60KgGbfrz3hexOAHs14bTHHp5GgCpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RftC9SBk; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RftC9SBk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw5Yg658Nz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 10:01:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01FB4434EA;
	Mon, 19 Jan 2026 23:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742E9C116C6;
	Mon, 19 Jan 2026 23:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768863701;
	bh=pkO47DmDTlCVZ4qWJyLDetbEa5q1OzobH5egyxMl/Xc=;
	h=From:To:Cc:Subject:Date:From;
	b=RftC9SBkj9jynEzKvEsWZNv24oX1nY1eTCTvgu0zWx5vcx/TAqUodDraVVJ6yyQlt
	 jFCksuPGdnY0aN7o82O4UUhCSnO7fRapHqehFETIxw94lG3xwNmxThkWvhVpjmrJVQ
	 wTYFG8cXS44T/p0hca8aNArdiOczaKjFXYDb7+rWepH1lGYeEdhZ1E/OjX5iUTgOhQ
	 X6p31FWDuqzbxFyOsxMyhIDYJ9K3ewTKBRlJjOozr+b46wTyLd6JlbJ/6VzIUE3iUN
	 wHQ68zwSdazzPYKx+CNSTQu7vHgT2W1vhN/JK3oCMTxZAiHP4SjR9kWBCQe2s3GmZA
	 CwfqDt2NtDkTg==
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
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
Subject: [PATCH v3 00/24] mm: balloon infrastructure cleanups
Date: Tue, 20 Jan 2026 00:01:08 +0100
Message-ID: <20260119230133.3551867-1-david@kernel.org>
X-Mailer: git-send-email 2.52.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

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

--

v2 -> v3:
* "mm/balloon_compaction: centralize basic page migration handling"
  -> Remove newline
  -> Talk about "page" instead of "old page"
  -> avoid the switch statement
* "mm/balloon_compaction: move internal helpers to balloon_compaction.c"
  -> No need to carry over the "inline"
* "fixup mm: rename CONFIG_BALLOON_COMPACTION to CONFIG_BALLOON_MIGRATION
  -> Remove some more "balloon page compaction" thingies
*  "MAINTAINERS: move memory balloon infrastructure to "MEMORY MANAGEMENT -
    BALLOON"
   -> CC the virt list and use the proper mail address
* "mm/balloon_compaction: improve comments for WARN_ON_ONCE(!b_dev_info)
   -> Added

v1 -> v2:
* Rebased to latest mm/mm-unstable without any conflicts
* Minor patch description/subject and comment fixups
* Retested

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

David Hildenbrand (Red Hat) (24):
  vmw_balloon: adjust BALLOON_DEFLATE when deflating while migrating
  vmw_balloon: remove vmballoon_compaction_init()
  powerpc/pseries/cmm: remove cmm_balloon_compaction_init()
  mm/balloon_compaction: improve comments for WARN_ON_ONCE(!b_dev_info)
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
  mm/balloon_compaction: move internal helpers to balloon_compaction.c
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
 MAINTAINERS                                   |  13 +-
 arch/powerpc/platforms/pseries/Kconfig        |   2 +-
 arch/powerpc/platforms/pseries/cmm.c          |  53 +----
 drivers/misc/Kconfig                          |   2 +-
 drivers/misc/vmw_balloon.c                    | 105 +++------
 drivers/virtio/Kconfig                        |   2 +-
 drivers/virtio/virtio_balloon.c               |  64 ++----
 include/linux/balloon.h                       |  77 +++++++
 include/linux/balloon_compaction.h            | 160 --------------
 include/linux/vm_event_item.h                 |   8 +-
 mm/Kconfig                                    |  23 +-
 mm/Makefile                                   |   2 +-
 mm/{balloon_compaction.c => balloon.c}        | 200 ++++++++++++------
 mm/memory_hotplug.c                           |   4 +-
 mm/migrate.c                                  |   2 +-
 mm/vmscan.c                                   |   1 -
 mm/vmstat.c                                   |   8 +-
 19 files changed, 319 insertions(+), 417 deletions(-)
 create mode 100644 include/linux/balloon.h
 delete mode 100644 include/linux/balloon_compaction.h
 rename mm/{balloon_compaction.c => balloon.c} (58%)


base-commit: f8ed52ac0cfbddff992bb9600941bfe51e1e385a
-- 
2.52.0


