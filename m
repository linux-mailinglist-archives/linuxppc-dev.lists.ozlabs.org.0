Return-Path: <linuxppc-dev+bounces-15796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7672D23717
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 10:22:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsHZ76K6yz30M0;
	Thu, 15 Jan 2026 20:22:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768468943;
	cv=none; b=cUDvo0OHvQxG0BahVTcfeuN/PawWQ+3qhMDU8EzEVFZ5W4+8qceH5DWu8jt4OAsC6Zc8ZIOtor9ZaUW9z1BSJlIvx02HYz9BXDe7N/84sHs9AbUFGhcG8mDFWebuAgrpfvj+lhKy4pBAs3y6q1PZSgF8vW++oavep7jt3hPUKB9w3UTCRiyML+Jn/ywxOpZURSH2AmrBWSkUme8rOL5SR5xbNOtx9WVAGdaQvC2Hpg0KmDb8vRJ3baQj/tcTdQkE1fgpWpPEffcmE3Z3bcsEDoWavxFusybeXEcOoHatA71hV0BigpHxWbSSCxfHXTwxAPwQB/6oBmmwPU8AS+zQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768468943; c=relaxed/relaxed;
	bh=JZY0xn2Me635ovey5ksmcPxpugv1NLh0yp+8ZC+NRLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=haIwesVOobIVmwb0VYI6RL8Eh6QMsK4X1CUY9oirXNg8K45DRItKZbNUWLFaUAJAWqrmWrrWlkauMBWrOBNcQ8s/rU+XDdMloAvwBPp9/0fbI24wZhdw7xINRNRZ5gGrbYxqnP7hbNyIHNpNNzhW+NbDhibB2ULQdtyahQRO5QkwhG4AUgpATQDSc4idYHy45CCv7F+/LlpA1vIYh3CM4tszphyWceXYGHYvtgFnRU4zOo1PEH1i8O8FY9J7iIWrlImYCBxQuNqSKiTP1mfioHCE1BsDFMs2KEDv6YR0AKGghADBwz0Wh1re+fUvEYPTOB8EQlMhTWeta76Zt6wAcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bGUQs23U; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bGUQs23U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsHZ71XHhz30Lv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 20:22:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B6E442AB1;
	Thu, 15 Jan 2026 09:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC667C116D0;
	Thu, 15 Jan 2026 09:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468941;
	bh=Oj+us+E2nZAjD82c0L65S4QjEivMkfGsOYR3vhKdMVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bGUQs23UuL0MUIaVZt7HjPch43nLsyQr8N/KNriEAjCx1ksgLfhW3wh48gTZaa+qY
	 96tnj/UUzP0PIXCipF3pzqx5dBpKsv8RRkmQpvassgvOnDD1yC83WGpuc9Tn802iSC
	 a9cN1fN0mpI9pDPh/+61Faxwx0B8M6IYupNqigL7L/7o/aZQnf8fmy2eka+e+iRqad
	 d2DobqERbxqyaFK6XuxZf8/k65wudAWKWSX8Qqu6w1yrr1CNUzKqkUMrU0y1SwVQSg
	 XF7DROKXMmmj9QotQznh5z9X3AmNma7WE8e2XDgJ4amiXBfaEc6aoY4Q3j2AMyI5mw
	 rQEuDPtwxRwvQ==
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
Subject: [PATCH v2 17/23] mm/balloon_compaction: remove "extern" from functions
Date: Thu, 15 Jan 2026 10:20:07 +0100
Message-ID: <20260115092015.3928975-18-david@kernel.org>
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

Adding "extern" to functions is frowned-upon. Let's just get rid of it
for all functions here.

Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 include/linux/balloon_compaction.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index eec8994056a44..7757e0e314fdb 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -59,14 +59,14 @@ struct balloon_dev_info {
 	bool adjust_managed_page_count;
 };
 
-extern struct page *balloon_page_alloc(void);
-extern void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
-				 struct page *page);
-extern struct page *balloon_page_dequeue(struct balloon_dev_info *b_dev_info);
-extern size_t balloon_page_list_enqueue(struct balloon_dev_info *b_dev_info,
-				      struct list_head *pages);
-extern size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
-				     struct list_head *pages, size_t n_req_pages);
+struct page *balloon_page_alloc(void);
+void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
+		struct page *page);
+struct page *balloon_page_dequeue(struct balloon_dev_info *b_dev_info);
+size_t balloon_page_list_enqueue(struct balloon_dev_info *b_dev_info,
+		struct list_head *pages);
+size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
+		struct list_head *pages, size_t n_req_pages);
 
 static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 {
-- 
2.52.0


