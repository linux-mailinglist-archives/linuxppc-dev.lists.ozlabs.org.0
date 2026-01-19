Return-Path: <linuxppc-dev+bounces-16037-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA34AD3BB3F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 00:03:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw5b151gFz3bf8;
	Tue, 20 Jan 2026 10:02:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768863773;
	cv=none; b=Iodn1lwaQGDiwRnRVzLZ8U8hbiSpWrBIlIxZoyXrzVMVfYebxS351g7JxjdUeU21+uuA+9g5CLHIMhffTyMd+3PCNflf8OAknNcNzf4iVEixIw06fAXqq4MbIpGO4OLLiANcT/iyOGwL5S8Tn11YqqpMnyXUzwPQCVC4Jv68Uf94sMkRpNoogbpmC58JCT3ppaNK4dDtIkJ3sR23k9Y4cZUkg4B0f0BojjdTiUNUzdXn6r+x/H4RzvObuEomBDAkEIGBuUGrDLRp+D1jOIaM28Nhu0iwm2JDEe88ijv/pBpF10IgoliUrDfiDCuW2Fbr+Oy59JNcINDD0utvEvA9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768863773; c=relaxed/relaxed;
	bh=Rm7tnLSr2BiP2RY9L0NausdLTDHloCsMvtehZeF/Cwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grtM4UprHH358MWwf940Ad3pKk22Abd7HP+q+NPTy9PZpvV+QOJlpAWMRJLQtccEkxIk3qHuUGbrXXFzU77qv4ryk1dXslva5m4IhEWOe6bMVymoLlvDT+4+3HfKQm1xCKQ4a+Hp6lvaWoyNHY/lakSOpfFgVrtxx/j33NIgIAmCea0t2LpqcWBbyKvHZpptThrTE73EL1+4VA226yIuANl3UFwh1mpBiLjjCb9h7MYKBxXJMN3S+yoNuDk7+5a/ubFQRpr/MGDGRC0Gsumu6xyHXaCfTC/9HEbHoejTkgVXsT+d4etjTGz597SV0YH3WOdug8OAUVkf/+4fQKSI2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HvOvpttf; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HvOvpttf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw5b10XSdz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 10:02:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FB254075C;
	Mon, 19 Jan 2026 23:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D84FCC116C6;
	Mon, 19 Jan 2026 23:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768863771;
	bh=L0GQNAdOR/JPbtfKkp93QvUS5ciLoWv5t16Us2SfM7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HvOvpttf1kAvLfqKLjmfytunK2LOvgBgWZQy98vpmZf7M69HJPyEbpN59hjBYAgAN
	 5IC6xIovQKda6++cNe2jxPvRgCcQJ+i8VziIHmD+7tQWhJ500BB/Szo1tx1O6Niu0y
	 Qi5Ch2QWUIG2rXheRPalPAahZeIRoYRBP8prE05DO0S7M7eTw7FTcTH84epyfKTlhG
	 dAy/nCWJ9Xevj+prD5Id4gP3Bda+nuYUvOyk7JlBtw/QY79TkePDV3UN9A2wMPFxQy
	 XKgu9yINJPlolyHER1O5vx7qk05ZEiAOV+fLo5L70CTssW7IxUYcfiSq9tAC06TS5H
	 00IZRTVLUlvPA==
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
Subject: [PATCH v3 10/24] mm/balloon_compaction: make balloon_mops static
Date: Tue, 20 Jan 2026 00:01:18 +0100
Message-ID: <20260119230133.3551867-11-david@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119230133.3551867-1-david@kernel.org>
References: <20260119230133.3551867-1-david@kernel.org>
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

There is no need to expose this anymore, so let's just make it static.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 include/linux/balloon_compaction.h | 1 -
 mm/balloon_compaction.c            | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index ad594af6ed100..7db66c2c86cdc 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -78,7 +78,6 @@ static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 }
 
 #ifdef CONFIG_BALLOON_COMPACTION
-extern const struct movable_operations balloon_mops;
 /*
  * balloon_page_device - get the b_dev_info descriptor for the balloon device
  *			 that enqueues the given page.
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 75763c73dbd52..cf4d931763920 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -288,7 +288,7 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 	return 0;
 }
 
-const struct movable_operations balloon_mops = {
+static const struct movable_operations balloon_mops = {
 	.migrate_page = balloon_page_migrate,
 	.isolate_page = balloon_page_isolate,
 	.putback_page = balloon_page_putback,
-- 
2.52.0


