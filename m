Return-Path: <linuxppc-dev+bounces-16039-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F30BCD3BB44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 00:03:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw5bJ1ZVxz3bjN;
	Tue, 20 Jan 2026 10:03:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768863788;
	cv=none; b=NHZqJuMhQ5vQ+ROSFZdpEfTYhPPwyDXi996JcozXoyXjtyv+8EKbqSam5S20Xt5Mi0ABye12FNnXle609WH2G+PvfbpjkwVq6b8g8GrRUO2vagOuGCLOzx+Vo3jLbJK/YLN6ZPj/9e+vsNEVCW4Hr2CfoUhcBIxrslRCIlvqE//l1cmo4pzqOkLN70dyFhaHTSVYCoL95V4nU4GK/BHHXlU0EeBUkpQPPT4R0a0r1zmw2XJo/zDDNOYuQW4+vXUM4egu4Rfijh90FfOLkcfBRMftT/v1MkLF8Vgauieu+hfBR2RYibjy+Ugm7hWG0LH389XTxQNMDq9QxUTaysZMug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768863788; c=relaxed/relaxed;
	bh=VO9wuUA/EX1nPbSdezgUs6+CQU3PwkcKqXHdDIEeFUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nY+ix3soO3CKHxiVY3fALfCT7zJwjyHpAk2KquXx8wAOSrC7p6bXm/wTLh2feczGHyfDy+lzELu/tETc0buD3rUFlz34nb4iNOyrcIPVKwKmESBZSMxOBI6MQs3hduMqzbtGIRzNRA4qSxvpZ1KvjtHX6HtEnqie7GjjwcyJLKC1JryTexXBFkxuCjPzNgzpHCufIuwFeDNfWieg1pnZ64QyTr8sKNlfvxRvoureIl7d7kGNfd/uyAqzuJMZCj188ThNUbMMETZUx8rXZdxvAqZ+U+TSNR/MvkuAyNDzmjr8y0kyAx6Pv0XpIsnD30MHY0oWBwPeHwusg78jUMg2nQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kmYAethO; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kmYAethO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw5bH2Gb8z2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 10:03:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 638BB600CB;
	Mon, 19 Jan 2026 23:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCEAC19423;
	Mon, 19 Jan 2026 23:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768863785;
	bh=zj9sKtWRdKX3eQh5DiITmdQ2hR8ll6W7fi9C9Q8cgJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kmYAethOA7nMRUFhdBBERTrxwJxKacgPLraITEsM51q/xkAq5MgpSYoRetjELCjTf
	 pVGZC4C7WCra3xxAMTL9T8fnDQ2zTp5N1EdgmR7rCAgofrrFbDHOqRn3u7c10Sa9gT
	 jANs1LZ+LwGchIOXjBKglorB87RFNVM8XFlI1Uqp2fTuIDfd9X9mhLBpit6JevElrF
	 JFOT+2uHzHYISS3Zp0CFmwJy79JYaIJ26eOy+SbJouNGpVhad79c/Mu9FMsnAmElcx
	 4ebU+qhgPTIMYX/TP8G4jX7GahExH0+5k6idx5iApHdM1lOY370XAIHNAerzmvCZxw
	 F2WUUFU/nU/6g==
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
Subject: [PATCH v3 12/24] drivers/virtio/virtio_balloon: stop using balloon_page_push/pop()
Date: Tue, 20 Jan 2026 00:01:20 +0100
Message-ID: <20260119230133.3551867-13-david@kernel.org>
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

Let's stop using these functions so we can remove them. They look like
belonging to the balloon API for managing the device balloon list when
really they are just simple helpers only used by virtio-balloon.

Let's just inline them and switch to a proper
list_for_each_entry_safe().

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 drivers/virtio/virtio_balloon.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 15c1cf5fd249c..6ae00de78b61b 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -242,8 +242,8 @@ static void set_page_pfns(struct virtio_balloon *vb,
 static unsigned int fill_balloon(struct virtio_balloon *vb, size_t num)
 {
 	unsigned int num_allocated_pages;
+	struct page *page, *next;
 	unsigned int num_pfns;
-	struct page *page;
 	LIST_HEAD(pages);
 
 	/* We can only do one array worth at a time. */
@@ -262,14 +262,15 @@ static unsigned int fill_balloon(struct virtio_balloon *vb, size_t num)
 			break;
 		}
 
-		balloon_page_push(&pages, page);
+		list_add(&page->lru, &pages);
 	}
 
 	mutex_lock(&vb->balloon_lock);
 
 	vb->num_pfns = 0;
 
-	while ((page = balloon_page_pop(&pages))) {
+	list_for_each_entry_safe(page, next, &pages, lru) {
+		list_del(&page->lru);
 		balloon_page_enqueue(&vb->vb_dev_info, page);
 
 		set_page_pfns(vb, vb->pfns + vb->num_pfns, page);
@@ -474,15 +475,19 @@ static inline s64 towards_target(struct virtio_balloon *vb)
 static unsigned long return_free_pages_to_mm(struct virtio_balloon *vb,
 					     unsigned long num_to_return)
 {
-	struct page *page;
-	unsigned long num_returned;
+	unsigned long num_returned = 0;
+	struct page *page, *next;
+
+	if (unlikely(!num_to_return))
+		return 0;
 
 	spin_lock_irq(&vb->free_page_list_lock);
-	for (num_returned = 0; num_returned < num_to_return; num_returned++) {
-		page = balloon_page_pop(&vb->free_page_list);
-		if (!page)
-			break;
+
+	list_for_each_entry_safe(page, next, &vb->free_page_list, lru) {
+		list_del(&page->lru);
 		__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
+		if (++num_returned == num_to_return)
+			break;
 	}
 	vb->num_free_page_blocks -= num_returned;
 	spin_unlock_irq(&vb->free_page_list_lock);
@@ -717,7 +722,7 @@ static int get_free_page_and_send(struct virtio_balloon *vb)
 		}
 		virtqueue_kick(vq);
 		spin_lock_irq(&vb->free_page_list_lock);
-		balloon_page_push(&vb->free_page_list, page);
+		list_add(&page->lru, &vb->free_page_list);
 		vb->num_free_page_blocks++;
 		spin_unlock_irq(&vb->free_page_list_lock);
 	} else {
-- 
2.52.0


