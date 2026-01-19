Return-Path: <linuxppc-dev+bounces-16053-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF7CD3BBC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 00:27:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw6760zSWz2xm5;
	Tue, 20 Jan 2026 10:27:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768865234;
	cv=none; b=EvMXBI+DIjk73qS/qzNFhHKzEIS3efoOLsw7gbnjXRiOhGLGbNSZza79raBTHo+zJMEi4WGsb7YLDp1ZCZaeEj7pwsZbZBuhc0C3W48IFF5LEsNzVGJ8kCcgMiyTwCsjs6BA/ceXJwOPLRqRdzVGvwQnr/3wTyO/2HsNFMAafoZaQ1Mi0N1a8UBUM5KvAYKnA964GXiL7Uf4NUSkgpbccctq2xx7aFTwExYcEIsTLPF12ygV0cpO8ScGSDO7963kNvQbfj6Oh8hQap7W7fngDHR8HZTmJn3EJNjxJe/4Va4kzMuOAFwn30UqMYlEAU0dl7i1YHz81BdmT5x8A3iKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768865234; c=relaxed/relaxed;
	bh=zSAlxfaOZZaZpPTPZXflnDLTIJcp6DGSu13bwZSbl6w=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=AzX0CHP3QB24refn97C5b0XhIJDTUubpPeKVRybVQFpIuhfY1c/goanmbQ0JW08fRzZl4OlmV8yxHYFYBAv6KqO6M7WMh+hdjgSakd+ciicOLqhBRJbMwVN/3wjt8Z4I6QrAl0U4KYp9309az9HiZ1CAsf2U8iYGiwnlW8YIndTi+PPZQIRwZf2y9Qz3K3nm+aJa8wdytWOC+1muKX/4rpT7991KrsaSZmnwjlgvkgFNBYlSFmULwtfZkdJaDXCmK9JElTZ1wUBP1KwJOmAIVDnDe1oxh6TTl0gdMP/w+RJIvQysrpLCAEgxAoktzDK1X8Fmg7+uUoN69UccPwmRoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=xrBGHQue; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=xrBGHQue;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw6750ZQrz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 10:27:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E17C40DE8;
	Mon, 19 Jan 2026 23:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261DFC116C6;
	Mon, 19 Jan 2026 23:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768865230;
	bh=qA/8S2QM28lHfe8iWXS+dSTad4XAM1EUKu8s/MTOUFo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xrBGHQueZoDFvdTmOQPzEhyTnBkDlHnjYIq2aJDzDK8Pwpb4kNvE6OulLNIT2p6DQ
	 efJvqzcCQRWhmE4Pi9gqIp5GZ8/xrPAz4jvQUkI4vNLAmrXXEROBM1Ju2tCcPEk+CD
	 wf3hkXxUOTH0q5QPOaNvHpPmaNgx4zQZpaLafCIo=
Date: Mon, 19 Jan 2026 15:27:08 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-doc@vger.kernel.org,
 virtualization@lists.linux.dev, Oscar Salvador <osalvador@suse.de>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jerrin Shaji George
 <jerrin.shaji-george@broadcom.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Eugenio =?ISO-8859-1?Q?P=E9rez?= <eperezma@redhat.com>, Zi Yan
 <ziy@nvidia.com>
Subject: Re: [PATCH v3 00/24] mm: balloon infrastructure cleanups
Message-Id: <20260119152708.0737b211a2167054cf6eb18c@linux-foundation.org>
In-Reply-To: <20260119230133.3551867-1-david@kernel.org>
References: <20260119230133.3551867-1-david@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 20 Jan 2026 00:01:08 +0100 "David Hildenbrand (Red Hat)" <david@kernel.org> wrote:

> I started with wanting to remove the dependency of the balloon
> infrastructure on the page lock, but ended up performing various other
> cleanups, some of which I had on my todo list for years.
> 
> This series heavily cleans up and simplifies our balloon infrastructure,
> including our balloon page migration functionality.

Updated, thanks.

fwiw, below is how v3 altered mm.git:

--- a/include/linux/balloon.h~b
+++ a/include/linux/balloon.h
@@ -22,9 +22,9 @@
  *
  * As the page isolation scanning step a compaction thread does is a lockless
  * procedure (from a page standpoint), it might bring some racy situations while
- * performing balloon page compaction. In order to sort out these racy scenarios
- * and safely perform balloon's page compaction and migration we must, always,
- * ensure following these simple rules:
+ * performing balloon page migration. In order to sort out these racy scenarios
+ * and safely perform balloon's page migration we must, always, ensure following
+ * these simple rules:
  *
  *   i. Inflation/deflation must set/clear page->private under the
  *      balloon_pages_lock
@@ -47,8 +47,8 @@
  * Balloon device information descriptor.
  * This struct is used to allow the common balloon page migration interface
  * procedures to find the proper balloon device holding memory pages they'll
- * have to cope for page compaction / migration, as well as it serves the
- * balloon driver as a page book-keeper for its registered balloon devices.
+ * have to cope for page migration, as well as it serves the balloon driver as
+ * a page book-keeper for its registered balloon devices.
  */
 struct balloon_dev_info {
 	unsigned long isolated_pages;	/* # of isolated pages for migration */
--- a/mm/balloon.c~b
+++ a/mm/balloon.c
@@ -16,7 +16,7 @@
  */
 static DEFINE_SPINLOCK(balloon_pages_lock);
 
-static inline struct balloon_dev_info *balloon_page_device(struct page *page)
+static struct balloon_dev_info *balloon_page_device(struct page *page)
 {
 	return (struct balloon_dev_info *)page_private(page);
 }
@@ -29,7 +29,7 @@ static inline struct balloon_dev_info *b
  *
  * Caller must ensure the balloon_pages_lock is held.
  */
-static inline void balloon_page_insert(struct balloon_dev_info *balloon,
+static void balloon_page_insert(struct balloon_dev_info *balloon,
 				       struct page *page)
 {
 	lockdep_assert_held(&balloon_pages_lock);
@@ -48,7 +48,7 @@ static inline void balloon_page_insert(s
  *
  * Caller must ensure the balloon_pages_lock is held.
  */
-static inline void balloon_page_finalize(struct page *page)
+static void balloon_page_finalize(struct page *page)
 {
 	lockdep_assert_held(&balloon_pages_lock);
 	if (IS_ENABLED(CONFIG_BALLOON_MIGRATION))
@@ -262,7 +262,11 @@ static void balloon_page_putback(struct
 	struct balloon_dev_info *b_dev_info = balloon_page_device(page);
 	unsigned long flags;
 
-	/* Isolated balloon pages cannot get deflated. */
+	/*
+	 * When we isolated the page, the page was still inflated in a balloon
+	 * device. As isolated balloon pages cannot get deflated, we still have
+	 * a balloon device here.
+	 */
 	if (WARN_ON_ONCE(!b_dev_info))
 		return;
 
@@ -279,18 +283,22 @@ static int balloon_page_migrate(struct p
 	unsigned long flags;
 	int rc;
 
-	/* Isolated balloon pages cannot get deflated. */
+	/*
+	 * When we isolated the page, the page was still inflated in a balloon
+	 * device. As isolated balloon pages cannot get deflated, we still have
+	 * a balloon device here.
+	 */
 	if (WARN_ON_ONCE(!b_dev_info))
 		return -EAGAIN;
 
 	rc = b_dev_info->migratepage(b_dev_info, newpage, page, mode);
-	switch (rc) {
-	case 0:
-		spin_lock_irqsave(&balloon_pages_lock, flags);
+	if (rc < 0 && rc != -ENOENT)
+		return rc;
 
+	spin_lock_irqsave(&balloon_pages_lock, flags);
+	if (!rc) {
 		/* Insert the new page into the balloon list. */
 		get_page(newpage);
-
 		balloon_page_insert(b_dev_info, newpage);
 		__count_vm_event(BALLOON_MIGRATE);
 
@@ -303,18 +311,12 @@ static int balloon_page_migrate(struct p
 			adjust_managed_page_count(page, 1);
 			adjust_managed_page_count(newpage, -1);
 		}
-		break;
-	case -ENOENT:
-		spin_lock_irqsave(&balloon_pages_lock, flags);
-
+	} else {
 		/* Old page was deflated but new page not inflated. */
 		__count_vm_event(BALLOON_DEFLATE);
 
 		if (b_dev_info->adjust_managed_page_count)
 			adjust_managed_page_count(page, 1);
-		break;
-	default:
-		return rc;
 	}
 
 	b_dev_info->isolated_pages--;
_


