Return-Path: <linuxppc-dev+bounces-15799-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 798BCD2372C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 10:23:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsHZX1hHSz3c8W;
	Thu, 15 Jan 2026 20:22:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768468964;
	cv=none; b=QcY3m4CYvQsWp9Ja9nBotuHOp5MOJnozJWMpBQaTt3N7ivgUI0KInbie/7lGoBhin+EMgIE7UnHZHZfm9TAYGDMr6OWkmXqh5aKahnPf7vnOp14G6d5MtfD37s7/y52TwETp8VXGGqJLhnQ9edM24zuchraw7+TIr0WZGa8Gej1di93WC9nzKjgsFUN1znFlivxqfLSGE+nnwTz+B+ZQM7BwttwI5GUygZ71L4V3907/9sXUxwBPUEB2gycOzK93/3WKE6f309umhCr/gyyC91zT7ivGUdvoRi3sp9nj/r2fPszE8CtZ3XcVfsLCYo0/oZhBMUIXs8SGreweSzaA/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768468964; c=relaxed/relaxed;
	bh=vqJdNUKiAh1EO7rwT09LrhzLOCSfFprnsP6lu5Nv5fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6j8yXoOUjhRo4IMIjWfu/wN8CL8mg+GrnPU0tS7o/HmIuk81aJ1K8KTrzC0iN8TRSjGVjJi5fgLz9yvKAPoMxIrRdsgAOIZNzryJFk/ezcZoa+CZID1vQWm7mfO9zbwb60Sa4Tw1hMHCue7LCg2tHfuduf1yfr+JFwwyGD7NqPYuHE0ZkJaAtq5407f2k8YUee1ZqxXDCI7wFCbT7Pt6tAQCdkHw9R7dnQfLufzMBXHUrcNO4GSSiRBAQFts6Zota0GjPN9dEhiy0Qx0cuHRO8hwuRo3ZjdD1OhubLpL2+Nwfn1ToWlaaXP+1/vw3VFFEcA4UuNC6zNArrMdVpcaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O8jYzSQQ; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O8jYzSQQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsHZW32P6z30Lv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 20:22:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC51E40658;
	Thu, 15 Jan 2026 09:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948EDC116D0;
	Thu, 15 Jan 2026 09:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468961;
	bh=nMSbJ130FsUcdSsvFUeUBR1YMlPlSjm9XeIRM/kAkzM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O8jYzSQQhivp9+oi3e+25bY5iCyiGPyPZY4Q5d6BT6vIFTT2h6LTECelzgIQUwBam
	 xm93YDpR/+tfwHTtSoZFn4io0EPnm7MXDaUCFJBiGSmOzZEsonSTnTAxHsKjgTmePs
	 H1WVZ6Ru1nLs8fYp2MEhnZtBPHrn7pIJQJ4NUvjSZQzddO+dTHGoMvFy05u0Yzgkpg
	 9S7YHWca/kqlFCmPhigeFIAT6icw+tMlOJZGExUL4+q8ikAyOvua74wdBt7xThNHPm
	 pwqoKl6EwJ/Zyx8ks0VFdx3aSfDNXWYRAOTML42Re/Qkt3iA/jsQXyOkuLXfvG+dA4
	 H6XnATH7JX0Lg==
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
Subject: [PATCH v2 20/23] mm/kconfig: make BALLOON_COMPACTION depend on MIGRATION
Date: Thu, 15 Jan 2026 10:20:10 +0100
Message-ID: <20260115092015.3928975-21-david@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115092015.3928975-1-david@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Migration support for balloon memory depends on MIGRATION not
COMPACTION. Compaction is simply another user of page migration.

The last dependency on compaction.c was effectively removed with
commit 3d388584d599 ("mm: convert "movable" flag in page->mapping to a
page flag"). Ever since, everything for handling movable_ops page
migration resides in core migration code.

So let's change the dependency and adjust the description +
help text.

We'll rename BALLOON_COMPACTION separately next.

Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 mm/Kconfig | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index 24a3ff149a1b0..0d13c1b36e1c1 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -599,17 +599,14 @@ config MEMORY_BALLOON
 #
 # support for memory balloon compaction
 config BALLOON_COMPACTION
-	bool "Allow for balloon memory compaction/migration"
+	bool "Allow for balloon memory migration"
 	default y
-	depends on COMPACTION && MEMORY_BALLOON
-	help
-	  Memory fragmentation introduced by ballooning might reduce
-	  significantly the number of 2MB contiguous memory blocks that can be
-	  used within a guest, thus imposing performance penalties associated
-	  with the reduced number of transparent huge pages that could be used
-	  by the guest workload. Allowing the compaction & migration for memory
-	  pages enlisted as being part of memory balloon devices avoids the
-	  scenario aforementioned and helps improving memory defragmentation.
+	depends on MIGRATION && MEMORY_BALLOON
+	help
+	  Allow for migration of pages inflated in a memory balloon such that
+	  they can be allocated from memory areas only available for movable
+	  allocations (e.g., ZONE_MOVABLE, CMA) and such that they can be
+	  migrated for memory defragmentation purposes by memory compaction.
 
 #
 # support for memory compaction
-- 
2.52.0


