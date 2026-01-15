Return-Path: <linuxppc-dev+bounces-15779-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6CAD23696
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 10:20:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsHWy1dP1z309S;
	Thu, 15 Jan 2026 20:20:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768468830;
	cv=none; b=F9P+5Js2yHVE3H9BrEWwFcYYiqZEx10f5aKTFFQvZvH0w50rOxRDwArXJhhKiCqhRxxVGzQZDrFP6kduFgsFzifTUVRP/ogTwKGsrxp2aVyEYOb14Zxtti5FjxbrOyQxuEhGAjUe1nG0xtwXVvHHyYY0nrUBkEnidOVoSl7R4aE5kQJfSovuTP57MHJPe/1o9NVB3p82TDNlBOvOnJbQ2xwlHJjNBM9/2FVrR9M2WK5PLCJ2FNzkNmP/bICTvlCkmQwL5ud+4SsSwnz5I9H8fsNA3T8PJnH6kHucDFFj8bPV5ZvpjpY7h4rQKpO6mNIyvQq3kymhR1MgJDTsqCEz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768468830; c=relaxed/relaxed;
	bh=Ecus/ncCEZHXyn1xqjQ963qgwNIW3kv/fmuKYykm8F4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DasOnSCJCNNIez8U0Ct7TfP3jLCv7YoX/MKhp+lwoHLjH6LaSefMwGjrQLDzgAJvdisqF1OHLl0qJ/XFx+mgCtIgFtHvTyH6nzSL+8qTdWiLACHOfvKaACGndDnSjEqZ1YuqJmC7CAkR+S9pW9LJ9JzbiuFYnxWQ6pmw4nEyQa3HwjICvv/DvoFWMo9HSPHytQvZFwAO3+HT+R96bWIik3y5QaeYoCcTU1fw7n8Tq+fS45FkXkv6lAUBNNCwz7Ohc76woGq5Afqq+lLatQ6ANPemx497N8RaoKQA/eE0fDyjWOJeqlAMJ7EQy+qVyQSxQKK/vWf+K6fb8b/mKhxrAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X1qu5Bgb; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X1qu5Bgb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsHWx25LSz309H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 20:20:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9876601B6;
	Thu, 15 Jan 2026 09:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D47EC116D0;
	Thu, 15 Jan 2026 09:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468824;
	bh=WaIWpwazcvVnbufInohMJecM5S3wznCXPsNAkuQTp/U=;
	h=From:To:Cc:Subject:Date:From;
	b=X1qu5BgbGnEpfWZBzrjXHqJoCKqJJRmiAWYdCNRbS02dD8STBEkI8kP41iFR9OUTg
	 K/Trml2L4kt5vWmNtX3Ntov92t836Zp8uLrL/cwjugequU9Ta2rD+L7KqUJfwBop9n
	 RuuiDwA5g4tV+m2z65ABjUeku3fknpLlsKcvdO+umd/7qq/uvR+IbCF6/pgGqqSwbo
	 uqfomfeiwRbe80r4ADbV+Pe9XyalGhQ6mLij5HXgCKPRn+dWudsqdsiTKxHTisCkeq
	 TKMFXjQL1jg0PMNJtIuDaWXAwPoDtsKrlqgz94Omgzbx+89d6WRhrmK+vImCBWHIQx
	 7QoPHPbH88SEQ==
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
Subject: [PATCH v2 00/23] mm: balloon infrastructure cleanups
Date: Thu, 15 Jan 2026 10:19:50 +0100
Message-ID: <20260115092015.3928975-1-david@kernel.org>
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

This is based on mm/mm-unstable.

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

David Hildenbrand (Red Hat) (23):
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


base-commit: f8ed52ac0cfbddff992bb9600941bfe51e1e385a
-- 
2.52.0


