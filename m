Return-Path: <linuxppc-dev+bounces-16043-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB55D3BB51
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 00:03:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw5br1fmTz3bhq;
	Tue, 20 Jan 2026 10:03:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768863816;
	cv=none; b=cng/smTz2WeSpeZkSg8t2oATJIN+yzihiFrJyKUeSKLMWtrcfNBuU3q3mYNIr3N1uYAJCEzE4T0XRfdsjqoWAticyoXkFJOqqYl4Bzs9V1wEPz5D0J6hkPsf/GKlfj46IPQJkhpv7yThAXgjDm6l9++xoW+wk12b6UwWzGot42g/s0y+hVwD6xeEghgzrV/InjHz6Z4/hUokDnwOU6qVAHs8VxPrrMbahG4PmKIO6ihvJYxj+19mtjIxtTtsMbDkW+WEDUR91x6NRLfJBimzzuYCfHxWwf1heQF3w7JFkgksk+UnwNMecnji74SnvKlPDyjxkcLGLKLWyk0KYlUfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768863816; c=relaxed/relaxed;
	bh=q8d+2/D1teZCo60BpmpOBq7MFQaV2ftPntom0fj9RHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8d/L/l6/HTTRQ5VkinhnSesoLigonp6/wIAT+LoDjzdOQEfygHNPUCwo72FkmfCRzZ6I8YT4URJmV239ksLpiVBOTnDbAks3HWrIcfDVrJKPYVjmI8SRBxF/uiM0or0IH0ckft9xiXRis2uhuvIMLJ3ekExbJDiIRilcWnOH+7loKRCVeV1ZRS+FULlTqBcN5VCRSRCn/lq6QQzPm0hzQTDQytPqP5yaRlC24X/9osOwACIkt47QvZoyXqfQIAGul3Y7VpetKiNIM3sRvEpktiiuF3/SYyyzOAngBnYDbmzvL0h1z3qEgr6J+OGgSD7QtpsUXsZbpueGyVdOlswvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JOFQQSl3; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JOFQQSl3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw5bq4KdBz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 10:03:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BEA5860151;
	Mon, 19 Jan 2026 23:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE3BC116C6;
	Mon, 19 Jan 2026 23:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768863813;
	bh=93bCC0t6vSff2vK8TVOF8nE3nZ/IKYJWWQ5I2pcLHSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JOFQQSl3AQjJzyLdOYrRwc0dbiFxoJf/oza6XFRsomdnnGo9O/OX5gzccdwhSVAzd
	 eUUGHNU9pBbhGaBYhz2UG4QleWsuFA3IfyZYp0y+Pogp9exSIRdeujhZTKkfU4uTQp
	 wXYzgkMwBOWrX0vUSyhU35NIc97JkVBhLG+862uizkAT4HLinjE2jSbCewl/b5RZAT
	 ZekWMFOYRgBb/iN0UioxgVJC8SV5NUVf7KktwPqhiTpLShfkv98cBCzBgcYFo3gFH1
	 5alKNgx5IzaY2+JIomSSnEU1ASOeg+eBrlVyrnfV0w/vnhLfhzhnh2LoTMpUr28Dcg
	 RqL1z5c7xZa0w==
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
Subject: [PATCH v3 16/24] mm/balloon_compaction: assert that the balloon_pages_lock is held
Date: Tue, 20 Jan 2026 00:01:24 +0100
Message-ID: <20260119230133.3551867-17-david@kernel.org>
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

Let's add some sanity checks for holding the balloon_pages_lock when
we're effectively inflating/deflating a page.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 mm/balloon_compaction.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index e0a4b481c3eda..bb2e5ec2cab36 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -33,6 +33,7 @@ static struct balloon_dev_info *balloon_page_device(struct page *page)
 static void balloon_page_insert(struct balloon_dev_info *balloon,
 				       struct page *page)
 {
+	lockdep_assert_held(&balloon_pages_lock);
 	__SetPageOffline(page);
 	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
 		SetPageMovableOps(page);
@@ -50,6 +51,7 @@ static void balloon_page_insert(struct balloon_dev_info *balloon,
  */
 static void balloon_page_finalize(struct page *page)
 {
+	lockdep_assert_held(&balloon_pages_lock);
 	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
 		set_page_private(page, 0);
 	/* PageOffline is sticky until the page is freed to the buddy. */
-- 
2.52.0


