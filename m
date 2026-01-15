Return-Path: <linuxppc-dev+bounces-15794-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24875D23705
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 10:22:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsHYt13CTz3btg;
	Thu, 15 Jan 2026 20:22:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768468930;
	cv=none; b=LI2SIZqPMSewLm9xKX1PO3RonG/ZgWyxn9qvuyfAkbhybw6D40FhJIPhX4xCxyzgmPH46X9xn8BBbzPUB9/F3OsxAuHpStc7cZq7xR5BDGe4IbU9J+7Pi/ejMhVjlEaxRY/k/lJhOa4CccptIbZP2UCYzQRIpPury3+Q7ZnVi2Ty6ff4sbG1+Y0Q5eFt1qD4qYGjL5z6ulkfjRBS0Ixb8Z7PrJR8VP+D2Lmj5v2RFxoxI2CWEtnrTXw7bJtvWtZA0xGDzXcYScvKsPUznU4a6SEGSJt5EV/nNgXFwO996zlR9TzIJ9iQnfCvZ2wQqJzFNzZ8+X1Me2rtjrCBtAotMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768468930; c=relaxed/relaxed;
	bh=Krs6z9vYOwh9+ATnDFgY6x2j3KV8kxuQF0FGa+p9kUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EH1zEJHwL86LXqJeacv+pq4c7O260yHegDRugkFu3pz8lysEOHxd/mOcZ5bEZOgD2zICtwyvFrnvZ8wziGcm4ihMPZ4IbsukAk7aS1mBIsItQYnVtR1F/Xeg9j3Jbu8VOjf3ixkmAsqTS/z0UAZrAVBpEIl+yzBNVEapKCMl6F7In7dh54+2gGr6vIar2j5jZgHwISx4qXIuUeY88sqSacg7vsUfjM8sT8LEvQEDYDMaGI5oyE7uVSXArYC+mQWcDC7fxN6tcNvkw6TZdL+TkxSwwh/4anzxskRFDmeb4y1LnNdipYKDpFkqX9dev5nTOtWidkIKfqdNR1YI0tHa/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kZdLhXG4; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kZdLhXG4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsHYs0BJLz3bt7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 20:22:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 737104174F;
	Thu, 15 Jan 2026 09:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4A1C116D0;
	Thu, 15 Jan 2026 09:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468927;
	bh=9RrxLDqhOcILNhAHJt+XRLUWGRQWJudLU4Xe8hhYhVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kZdLhXG4JXKgdqJL7DBaf/x0yhRcWA9OMea3z22FVMpb45e1AaUr5hCLnS7f6YE70
	 De84oIOk6cku3p9sQhGMVZskL3VdEGt9Ewx80abTgrJKY4swAbL7miB0ZBVaEtBNRs
	 LL+KhZAmuO0EV3W4N4F4/bifWzXyoSFMibubLSjNT4Lvbq01o9PD5M0/KuzxxGAlRc
	 pLcCk39qQsCsTevuPxOywxBWafY5Koq0CnZqDsn1KfM3FV/RAEoo8IJbgMX6/XoKOY
	 ukV9b8vgh4FO+UTIvYaYV/n4HqHOJpoe86jRjAMqgxRCcnPJTKAtCShqEKaeucUCQU
	 rU9hb8FynZuxw==
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
Subject: [PATCH v2 15/23] mm/balloon_compaction: assert that the balloon_pages_lock is held
Date: Thu, 15 Jan 2026 10:20:05 +0100
Message-ID: <20260115092015.3928975-16-david@kernel.org>
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

Let's add some sanity checks for holding the balloon_pages_lock when
we're effectively inflating/deflating a page.

Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 mm/balloon_compaction.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 717bc43732d09..f6e0582bd7ffe 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -33,6 +33,7 @@ static inline struct balloon_dev_info *balloon_page_device(struct page *page)
 static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 				       struct page *page)
 {
+	lockdep_assert_held(&balloon_pages_lock);
 	__SetPageOffline(page);
 	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
 		SetPageMovableOps(page);
@@ -50,6 +51,7 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
  */
 static inline void balloon_page_finalize(struct page *page)
 {
+	lockdep_assert_held(&balloon_pages_lock);
 	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
 		set_page_private(page, 0);
 	/* PageOffline is sticky until the page is freed to the buddy. */
-- 
2.52.0


