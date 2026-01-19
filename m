Return-Path: <linuxppc-dev+bounces-16023-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAEDD3BACF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 23:22:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw4hF0kJNz2xm5;
	Tue, 20 Jan 2026 09:22:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768861340;
	cv=none; b=K7xNHaZiVDfF+zGGjTQI40A81DxYwZizZXut2rA164CLpKYumloCIt+JR9I3pPVTdsIBhmyPtreN7ccxep9TZECrr9x6RbGf5yfiPrD+FBqq0+PIOOC0PUO2oY+gb0b2jK7AwqN+D++G1G5e8ls9p354NtShrDyrYWMuIZbo5bEbhYeHmy74veb1FCHj7MOfT+zhf7/mERIBobpF4MhV0/Vz+TTuUIVpt6QSQqdvh2UKUV7sYrSMMOer/9//iYEf939JwbnYc+5vqcWgScykAKiLnVNXhg7QNpG2j45AkMGUXbjkwtuE186ljijkXt5AfEprSXXnWSYUnDqKW8xeLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768861340; c=relaxed/relaxed;
	bh=yTc9X387fVd0+pI9KgornW7pZFZxfDT8ej9fI2UPs1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyHI9BXr6BtRP+wNtV9df1Q+I6UPyO9C0vHlVLOb3iqOC4rnzub9DSr2BhXONTd3Goa9i2bKzgcidnWdh+HsyXiD1JQZfam/CPHuLriz5XAg5hdEaTa90yhFSrqGVZq+HiPFCPGEB7EOQUyyTrHwsXzCrMTf6KjNxmXCxqyBwywh7gFxvT6h1NYYf/3UiFzYvhcn7n11IsoyA22W6FdC9UzmiTrMkRY8Yixvxp9eC2CMSA+SE4G2Q/S/jFvsd5rU4MjLue9oE6D8VxAbm/XALvYUFbqPw6hNSDkwFfY6B9LurKd52leZ/H59y1OjiXJJ9QF1vR4F/r7FCz6EqO4CWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NyDwwFuy; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NyDwwFuy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw4hD1BJLz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 09:22:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A13CB6014A;
	Mon, 19 Jan 2026 22:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D88FC116C6;
	Mon, 19 Jan 2026 22:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768861337;
	bh=PSAX+ibtrxSZ0sZ9PO1JFriJ7cqe4buDvYhzubMRIgY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NyDwwFuyD3RiW+jvlXOeCC8Y931wHEnIExpF99aiyYqCL/dFYBR0eXuM1hgSVC8ZX
	 dV7Ci7euBrjp8mM58FN81Ju81Fdby/UqtW7bsSr+wSuChvelcSkcpzm3Askr5Ji+8b
	 zTGqcx6ojNzjZWvZkeFrthAhbbOqQVCgTKFin0OIW82NsY+2rIJttSWW25MavsR1Ar
	 nEEVlzo7uw1QEKLA/BTg0pMF91wUNDoOki1EZoyW+wzHSv2jPML2uQxgOcIbHyzb92
	 g5LBoPU5xe2ff2Y8JGdoMv9ujG7qMWHb7+mHX4Dqx1u2SdCUxIiFJRT79qP7DHdo44
	 7u8us4s0Tkwkw==
Message-ID: <ca9e4ebb-e6b5-475b-8a21-a261e27c3ca7@kernel.org>
Date: Mon, 19 Jan 2026 23:22:08 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/23] mm/balloon_compaction: centralize basic page
 migration handling
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-doc@vger.kernel.org,
 virtualization@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Zi Yan <ziy@nvidia.com>
References: <20260115092015.3928975-1-david@kernel.org>
 <20260115092015.3928975-5-david@kernel.org>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
In-Reply-To: <20260115092015.3928975-5-david@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/15/26 10:19, David Hildenbrand (Red Hat) wrote:
> Let's update the balloon page references, the balloon page list, the
> BALLOON_MIGRATE counter and the isolated-pages counter in
> balloon_page_migrate(), after letting the balloon->migratepage()
> callback deal with the actual inflation+deflation.
> 
> Note that we now perform the balloon list modifications outside of any
> implementation-specific locks: which is fine, there is nothing special
> about these page actions that the lock would be protecting.
> 
> The old page is already no longer in the list (isolated) and the new page
> is not yet in the list.
> 
> Let's use -ENOENT to communicate the special "inflation of new page
> failed after already deflating the old page" to balloon_page_migrate() so
> it can handle it accordingly.
> 
> While at it, rename balloon->b_dev_info to make it match the other
> functions. Also, drop the comment above balloon_page_migrate(), which
> seems unnecessary.
> 
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
> ---

Andrew, the following on top:

 From 4c8b4f0aba5859a4ec71c7449a98b10e0547237f Mon Sep 17 00:00:00 2001
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Date: Mon, 19 Jan 2026 23:20:41 +0100
Subject: [PATCH] fixup: mm/balloon_compaction: centralize basic page migration
  handling

Remove newline, talk about "page" instead of "old page" and avoid the
switch.

Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
  mm/balloon_compaction.c | 22 +++++++---------------
  1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 5444c61bb9e76..b859411811d0b 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -247,29 +247,21 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
  		return -EAGAIN;
  
  	rc = b_dev_info->migratepage(b_dev_info, newpage, page, mode);
-	switch (rc) {
-	case 0:
-		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+	if (rc < 0 && rc != -ENOENT)
+		return rc;
  
+	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+	if (!rc) {
  		/* Insert the new page into the balloon list. */
  		get_page(newpage);
-
  		balloon_page_insert(b_dev_info, newpage);
-		__count_vm_event(BALLOON_MIGRATE);
-		break;
-	case -ENOENT:
-		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
-
-		/* Old page was deflated but new page not inflated. */
-		__count_vm_event(BALLOON_DEFLATE);
-		break;
-	default:
-		return rc;
  	}
-
  	b_dev_info->isolated_pages--;
  	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
  
+	/* If -ENOENT, page was deflated but new page not inflated. */
+	__count_vm_event(rc ? BALLOON_DEFLATE : BALLOON_MIGRATE);
+
  	/* Free the now-deflated page we isolated in balloon_page_isolate(). */
  	balloon_page_finalize(page);
  	put_page(page);
-- 
2.52.0


-- 
Cheers

David

