Return-Path: <linuxppc-dev+bounces-15785-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F084BD236C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 10:21:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsHXh3MNnz3cD7;
	Thu, 15 Jan 2026 20:21:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768468868;
	cv=none; b=ehqYjGk+A2FNGuc7BhVHUJMH+OABkWjOK0jMqLD9oSVLN9IqfAkFK/M2DNr6Sp5IAsNWNZo+KDb/DzEuxFfSDwT1AJQI3VGoOAOacDzfN5nvJqNFNbjXsDo95XTEGQpTMCSgDUiYLyzxfFQNur7dBswxxPzWUeaT+ke2VjZlPnQPUfU/OFIRbUCM8imdGF+FFQcWdmrbiPALTfGNlHA1uO1vZXeikHQK/KIZLc1Ornrf69L7x4XRxd9mBzzYKm2HDPc+fdsP9LM5JFXXeO8j0aH/BX3qgey9CRhNFjcwZzHc/CICAbMj4CL8afWQhybORTtrYCyaA61t9+NfKKwR3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768468868; c=relaxed/relaxed;
	bh=GhmI/YXbXaD8EQlnB7HumxCi6p4qAIdlRnQBD0SBVO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTUBLkb3dKW/LU6EUV7cXXk0N7Lt9F1ZYZMhTlnf8+KkrnSHBCzWEGQ6KMd31KrIA0wKw6wdR15kvkOd6mGEWPVDQy6d3NSqfC+P7f1XbbCTyGUO6xdAsLViMoOaHTGcJlomfzeCysEWRNIhxlEDZi052B/m7qLqNK9E5E1hG2DUMn1LyubZ8u1IJIVnQGT3YDjr6y83/Uj4JsFYZqI3CsyA4whIoJ7cWoovWjzP+LqLYkFV/E1MwVlBQfgPARYW4DTVgwT/Rc4y8JY6tOO2cSJ68teLdFWR9s/KrQzBe+Mn2vWIU+Dobyxqts267jK0ZBQGVqxVbLtcjGQ8mqUSxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YXLQM63O; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YXLQM63O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsHXg50b4z309H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 20:21:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 292D440867;
	Thu, 15 Jan 2026 09:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD927C116D0;
	Thu, 15 Jan 2026 09:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468866;
	bh=q+Q0Uz5/ogC154Dbd2goOOehqbQ7Ij08x/c47bAW3yk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YXLQM63OvUIAXjYM+1gJ3tSen1quB36s7/mPz09KWLc8uyMyUjvkG+5++fUqmVxEC
	 Ykn9RLJBfr+XLAQCzsxuqPR3iFk2NH5/VUlGWjrSQvbN6yRv6MdW+RPqgfBGTpbb7s
	 yNUtgwNE0o8ISZJVBv0oWmfNnm2mXPLKwkfb9gfxKlvygbG7+Qgtuzt2sunaQRDlew
	 /SjsLbp9llx3T5l3KcqqQxexGe+DtC/i7Rli1miNq1yQYMRLazApEy59dXNa41Y9aj
	 sEY7jrlMhmyPaOGOgRBrG9ePy1z2tZsMKrJJKpCEre3nCdobOpHUefVnVn5mBk6HET
	 ZAoNRBLwYG8TA==
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
Subject: [PATCH v2 06/23] vmw_balloon: stop using the balloon_dev_info lock
Date: Thu, 15 Jan 2026 10:19:56 +0100
Message-ID: <20260115092015.3928975-7-david@kernel.org>
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

Let's not piggy-back on the existing lock and use a separate lock for the
huge page list. Now that we use a separate lock, there is no need to
disable interrupts, so use the non-irqsave variants.

This is a preparation for changing the locking used to protect
balloon_dev_info.

While at it, talk about "page migration" instead of "page compaction".
We'll change that in core code soon as well.

Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 drivers/misc/vmw_balloon.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index 52b8c0f1eead7..53e9335b6718c 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -354,10 +354,15 @@ struct vmballoon {
 	/**
 	 * @huge_pages - list of the inflated 2MB pages.
 	 *
-	 * Protected by @b_dev_info.pages_lock .
+	 * Protected by @huge_pages_lock.
 	 */
 	struct list_head huge_pages;
 
+	/**
+	 * @huge_pages_lock: lock for the list of inflated 2MB pages.
+	 */
+	spinlock_t huge_pages_lock;
+
 	/**
 	 * @vmci_doorbell.
 	 *
@@ -987,7 +992,6 @@ static void vmballoon_enqueue_page_list(struct vmballoon *b,
 					unsigned int *n_pages,
 					enum vmballoon_page_size_type page_size)
 {
-	unsigned long flags;
 	struct page *page;
 
 	if (page_size == VMW_BALLOON_4K_PAGE) {
@@ -995,9 +999,9 @@ static void vmballoon_enqueue_page_list(struct vmballoon *b,
 	} else {
 		/*
 		 * Keep the huge pages in a local list which is not available
-		 * for the balloon compaction mechanism.
+		 * for the balloon page migration.
 		 */
-		spin_lock_irqsave(&b->b_dev_info.pages_lock, flags);
+		spin_lock(&b->huge_pages_lock);
 
 		list_for_each_entry(page, pages, lru) {
 			vmballoon_mark_page_offline(page, VMW_BALLOON_2M_PAGE);
@@ -1006,7 +1010,7 @@ static void vmballoon_enqueue_page_list(struct vmballoon *b,
 		list_splice_init(pages, &b->huge_pages);
 		__count_vm_events(BALLOON_INFLATE, *n_pages *
 				  vmballoon_page_in_frames(VMW_BALLOON_2M_PAGE));
-		spin_unlock_irqrestore(&b->b_dev_info.pages_lock, flags);
+		spin_unlock(&b->huge_pages_lock);
 	}
 
 	*n_pages = 0;
@@ -1033,7 +1037,6 @@ static void vmballoon_dequeue_page_list(struct vmballoon *b,
 {
 	struct page *page, *tmp;
 	unsigned int i = 0;
-	unsigned long flags;
 
 	/* In the case of 4k pages, use the compaction infrastructure */
 	if (page_size == VMW_BALLOON_4K_PAGE) {
@@ -1043,7 +1046,7 @@ static void vmballoon_dequeue_page_list(struct vmballoon *b,
 	}
 
 	/* 2MB pages */
-	spin_lock_irqsave(&b->b_dev_info.pages_lock, flags);
+	spin_lock(&b->huge_pages_lock);
 	list_for_each_entry_safe(page, tmp, &b->huge_pages, lru) {
 		vmballoon_mark_page_online(page, VMW_BALLOON_2M_PAGE);
 
@@ -1054,7 +1057,7 @@ static void vmballoon_dequeue_page_list(struct vmballoon *b,
 
 	__count_vm_events(BALLOON_DEFLATE,
 			  i * vmballoon_page_in_frames(VMW_BALLOON_2M_PAGE));
-	spin_unlock_irqrestore(&b->b_dev_info.pages_lock, flags);
+	spin_unlock(&b->huge_pages_lock);
 	*n_pages = i;
 }
 
@@ -1828,6 +1831,7 @@ static int __init vmballoon_init(void)
 		balloon.b_dev_info.migratepage = vmballoon_migratepage;
 
 	INIT_LIST_HEAD(&balloon.huge_pages);
+	spin_lock_init(&balloon.huge_pages_lock);
 	spin_lock_init(&balloon.comm_lock);
 	init_rwsem(&balloon.conf_sem);
 	balloon.vmci_doorbell = VMCI_INVALID_HANDLE;
-- 
2.52.0


