Return-Path: <linuxppc-dev+bounces-3695-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAF89E15F0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 09:38:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2Yvc4XLkz300B;
	Tue,  3 Dec 2024 19:38:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733215100;
	cv=none; b=brSTJWpziWm7fRAXe1qxORbrPw0oCieXRb2rXlbz2fmwGZFIbMjIm3CyFQR7CPFPAGDzGtyO5iqRqyOmlJtFI49XFPxQYDSe9FS5+LzxJlwtHweLzy4gQmVfxkMdtrBJb3Td6wanLodF0eh1Kvno1z2X2U84DjcBsUQm9A1UGswo1oxx40JUqvX/W9rDM6Lz68FaXYqsLmo+kQrRmSQXAavZ7hzn6sEwRywZLWuPn3P8FQI9cFmtkOPPLcjUF9TFAo4o7sNYIe2QMnRzqEvIwo/SC22qnz9O8ZKRHkIecWSSi9scLjUuUBdbE214b38Ze3EJ/ZShA6rlL4rQCMfeDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733215100; c=relaxed/relaxed;
	bh=adHjUEuwXA+ANkdOzZ/yc4IEWn5pdw/yGiEpqds38YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HfQBLRwi7l8hcfR708tRnia1MPHm4TfC5dxzV1Z87HODgAvZerO9JFthk1VgJmc5OHQtnQyxUklXlxJt90Da2VREo03pHjGxXew9AnM0lll5OF9EyuMyB1eilPIYEbzPVKeWnN5r9I2vyv3GuzBu9wZOxK2zzqwyO3luT29x6N7BdNt32DlL6YNHLqbOtyVbyhzjADebtW0fkI/T92wGA+DTPMbxtbZ/CerE62mz+oBErDN543qjdYJSZo6Po4L+OZRV1f1DEvvB8g+slsyXIyz0g9UjmLklQLb4fjTIDHnjKkKCTMC90QFYCjHfi4yDzC93sivIV8m2o6JiDJQYNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bcZe97WE; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bcZe97WE; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bcZe97WE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bcZe97WE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2Yvb46x3z2yMX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 19:38:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733215096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=adHjUEuwXA+ANkdOzZ/yc4IEWn5pdw/yGiEpqds38YQ=;
	b=bcZe97WEPp4749hu/ovQjEDr04UQE0qodevCJK1QFLjTaBn3Az3vLBKS08wsjTD0KZGRvB
	DJgYuC5M6hBHRX8LoNadSJi+m8rg7olYCKJnePomPWhLrgo9fmvNKPHPd3CtcYT2ufYLKB
	dhCdWZ59okEWmjB8JPGmUiN5yzqvBxs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733215096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=adHjUEuwXA+ANkdOzZ/yc4IEWn5pdw/yGiEpqds38YQ=;
	b=bcZe97WEPp4749hu/ovQjEDr04UQE0qodevCJK1QFLjTaBn3Az3vLBKS08wsjTD0KZGRvB
	DJgYuC5M6hBHRX8LoNadSJi+m8rg7olYCKJnePomPWhLrgo9fmvNKPHPd3CtcYT2ufYLKB
	dhCdWZ59okEWmjB8JPGmUiN5yzqvBxs=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-266-XLLS1IlrMmade3IZ0UMyDg-1; Tue,
 03 Dec 2024 03:38:10 -0500
X-MC-Unique: XLLS1IlrMmade3IZ0UMyDg-1
X-Mimecast-MFC-AGG-ID: XLLS1IlrMmade3IZ0UMyDg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2ED881944DC4;
	Tue,  3 Dec 2024 08:38:08 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.22.88.109])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 870B530000DF;
	Tue,  3 Dec 2024 08:38:03 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Zi Yan <ziy@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v2 1/6] mm/page_isolation: don't pass gfp flags to isolate_single_pageblock()
Date: Tue,  3 Dec 2024 09:37:51 +0100
Message-ID: <20241203083756.112975-2-david@redhat.com>
In-Reply-To: <20241203083756.112975-1-david@redhat.com>
References: <20241203083756.112975-1-david@redhat.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The flags are no longer used, we can stop passing them to
isolate_single_pageblock().

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_isolation.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 7e04047977cf..e680d40d96de 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -286,7 +286,6 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * within a free or in-use page.
  * @boundary_pfn:		pageblock-aligned pfn that a page might cross
  * @flags:			isolation flags
- * @gfp_flags:			GFP flags used for migrating pages
  * @isolate_before:	isolate the pageblock before the boundary_pfn
  * @skip_isolation:	the flag to skip the pageblock isolation in second
  *			isolate_single_pageblock()
@@ -306,8 +305,7 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * the in-use page then splitting the free page.
  */
 static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
-			gfp_t gfp_flags, bool isolate_before, bool skip_isolation,
-			int migratetype)
+		bool isolate_before, bool skip_isolation, int migratetype)
 {
 	unsigned long start_pfn;
 	unsigned long isolate_pageblock;
@@ -489,7 +487,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	bool skip_isolation = false;
 
 	/* isolate [isolate_start, isolate_start + pageblock_nr_pages) pageblock */
-	ret = isolate_single_pageblock(isolate_start, flags, gfp_flags, false,
+	ret = isolate_single_pageblock(isolate_start, flags, false,
 			skip_isolation, migratetype);
 	if (ret)
 		return ret;
@@ -498,7 +496,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 		skip_isolation = true;
 
 	/* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblock */
-	ret = isolate_single_pageblock(isolate_end, flags, gfp_flags, true,
+	ret = isolate_single_pageblock(isolate_end, flags, true,
 			skip_isolation, migratetype);
 	if (ret) {
 		unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);
-- 
2.47.1


