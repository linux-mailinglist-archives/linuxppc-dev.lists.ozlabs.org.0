Return-Path: <linuxppc-dev+bounces-3705-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 319FB9E182C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 10:48:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2bRp5wkkz304x;
	Tue,  3 Dec 2024 20:47:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733219270;
	cv=none; b=OfcovJyJpCFjPTl72cmYf9XSc7GcudG1kOU9Dck2Ia01Bnarr5R74OKp72TDQy/HI9M9VVAGNB/dKb8P5IkpjWzkte24bdE5buSvG7RPzzvu55AbUbWQWKwHURdNp89g99nrW/nlHkcP0fYK+fTse9XYZqol+p8zu2EB77/kZnNXeITuFtPhkwRlQG2b0Zan9W+3w3suhmjsib3V7lYCcVo9aNqCeaqt2uXApMucnTMHfJm6LmoNtRk1U8rxrhXURUMCbvoiCvApDo4J80tgQtVJ+72oN2KiZw99NVLHIE6uU4M7B1cuKDTcLHA1QQNAHXZ4mRWI3x+++a2lCKqM6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733219270; c=relaxed/relaxed;
	bh=WPPCObfnf5xw33aPmiPyCg8m61901qLXiqhqw8UMgIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=PvcuIkmKOHicq5AQ3kFiPcibYTcpsG0hBlGycza05PBkfYnTkbIv94qTgE8BJKtXz7wN1zAdrel7WuA4qsI1CSF/E3UOshigIcBVDMk4qxRWuELE5nWeWtOoW21jB2X5Sw9ugP4SpcUBMC2PT1nEVfFxATM16HIYSuEsOkGA41g/H0sfVkbMh5rP0rVCgo0eB6Yoh3YSekf1odpUQPiaMO10wHVDpwGsAX0HixgHBhrfovIK+dFIyYUPzoPnHqTfwW23Np2ycGBTzDoCCICCk1C4PH1zN+q3Yc1wlPu/z0F73gh8hT8B93QrYY1u6/lJ5twAo7MeFxqfRtY3+PtIow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cHEJR49I; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h9LPAP5I; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cHEJR49I;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h9LPAP5I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2bRn6pJRz2xtp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 20:47:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733219264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WPPCObfnf5xw33aPmiPyCg8m61901qLXiqhqw8UMgIQ=;
	b=cHEJR49IR6AOdJxBICHpuQzunEQoI1wqTl9t6u4EQ2tmjr7whKFih1BEvxArYLGB7w+l1r
	neJcO9lqqy63geLyprSM1fzb5AmSSPA5qJZqUFMxl+98zL2oC2xNOpl+WeoeR/iVieVVJL
	Nr8mCRKzpCyR1c7Le5zjw766Ti1wycY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733219265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WPPCObfnf5xw33aPmiPyCg8m61901qLXiqhqw8UMgIQ=;
	b=h9LPAP5IMirDx6OSxgVXSys8xPo9cPLaj6Y7d2OwKDQqoeqkg1cVBwGErZ/8jy1b5pzbKH
	EdpHZJJMJuBZemPnnsNL08B4yYgOtyTyATmvN/uCi1EMW6Q/FlKCYtIp6492VRX/8WCtC5
	GbZVnQQFzpe51dK1QjMBs2iQsZSckCs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-E7G2TzkyNAC0KS5Z_jFnjw-1; Tue, 03 Dec 2024 04:47:43 -0500
X-MC-Unique: E7G2TzkyNAC0KS5Z_jFnjw-1
X-Mimecast-MFC-AGG-ID: E7G2TzkyNAC0KS5Z_jFnjw
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4349e97bfc4so49842885e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2024 01:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733219262; x=1733824062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPPCObfnf5xw33aPmiPyCg8m61901qLXiqhqw8UMgIQ=;
        b=htWobmcibspZEFuR74Y582Lgxx0huXEhohf6720ECjDdbCN12SawfvHjAIMl0vqc2o
         x5pvI2u7qKJjwkRuqqMEC6VLa98DO8YVa1JauLHX0OYI9hiT7qaJZfJ8OzZFqT6Whah2
         DAsOamWNIiU5wGQc0SVnhlDLMrrvvreoUs3Nk/yR2B1SGbfrZQL+hKy3XRj4fUtmecz+
         Q2Ajz+2jB11UznYblzU0zQj2/QBY3nMBTYpGdIo1IxDT6dQFyr6hnxqnRPaDJaeH1nrj
         hg88DoKaBt5dDPdIqTg2DEOnnc5AKF1Xqc/DvUZQ1O+cgJ1FD2quHttG6YgWPUQkCW99
         BqEw==
X-Forwarded-Encrypted: i=1; AJvYcCWpZ57s7WyaBLgLT1A43jBvvAZv2CyxwuBxLVlDNyVuubFmO63yn/LShkuYs/3PREePtw4sumE+KS+cUDw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw0uIWYHskzfEIVsAj4N0do2OrG2RzZ45VS16xovH2YBZqI2e79
	vwzHCFI5X6t8ZUPef/lUY3Fz6f3YAj/LCB/GbtRKILTnaQyDLSljDmz7FASiyU968w4NOS0KhMS
	C6XnYOiTQxGnU5G3vuH3etqqGfWSvA4CEJkn8S5ou/m8bJnpv4dNZ4iu9RUa0zxE=
X-Gm-Gg: ASbGncs7PiFs8Bl5HJr/dWwWA9ihhOoW2ItqBhpq34N5HTWhLsVX+bKTR7EBy69TIB3
	UlS4+9P6avd+k6EW4Z4h+uvox0ABRLPcLsDiFt8NXStG2qV2JqJW5iOMSXzRLDAZjftzttJbWCD
	bndpSrUrGYpa1xnPt+GdqhWZqVR6mXBht7bVfrFt9Wr3Tx+5ucOkVMH5GK9mfuNAcoe8R1GmY/J
	pp9REN33cLDhly4Os1nWZaxZA3ValL0/XAt53dH/J5r8Yg03reOdSvdBQ9xFZ4s7UbrpVMoYF7i
	K/zSnMpl7AdeSQiGc8G+tjqZWehODyw/2lI=
X-Received: by 2002:a05:600c:5491:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-434d0a0e312mr13336225e9.21.1733219262417;
        Tue, 03 Dec 2024 01:47:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNQApWxNUm3SxdrUec7I7codm1+2ABsn7OxpSKkkoTEG3/Y5H+HiqJe5tT8Yop4NW8Dk8lkg==
X-Received: by 2002:a05:600c:5491:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-434d0a0e312mr13336025e9.21.1733219262074;
        Tue, 03 Dec 2024 01:47:42 -0800 (PST)
Received: from localhost (p200300cbc7461b00fd9ec26cc5521de7.dip0.t-ipconnect.de. [2003:cb:c746:1b00:fd9e:c26c:c552:1de7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-434b0dbe2e7sm183143505e9.11.2024.12.03.01.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 01:47:40 -0800 (PST)
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
Subject: [PATCH RESEND v2 2/6] mm/page_isolation: don't pass gfp flags to start_isolate_page_range()
Date: Tue,  3 Dec 2024 10:47:28 +0100
Message-ID: <20241203094732.200195-3-david@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203094732.200195-1-david@redhat.com>
References: <20241203094732.200195-1-david@redhat.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZBcGuT6fDOnBRqGtMomfTCO0zFeZJovpBdPrgc8c0x4_1733219262
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The parameter is unused, so let's stop passing it.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-isolation.h | 2 +-
 mm/memory_hotplug.c            | 3 +--
 mm/page_alloc.c                | 2 +-
 mm/page_isolation.c            | 4 +---
 4 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 73dc2c1841ec..898bb788243b 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -31,7 +31,7 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 				  int migratetype);
 
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype, int flags, gfp_t gfp_flags);
+			     int migratetype, int flags);
 
 void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 			     int migratetype);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index c43b4e7fb298..9b184ba064a0 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1992,8 +1992,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 	/* set above range as isolated */
 	ret = start_isolate_page_range(start_pfn, end_pfn,
 				       MIGRATE_MOVABLE,
-				       MEMORY_OFFLINE | REPORT_FAILURE,
-				       GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL);
+				       MEMORY_OFFLINE | REPORT_FAILURE);
 	if (ret) {
 		reason = "failure to isolate range";
 		goto failed_removal_pcplists_disabled;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index cc3296cf8c95..f371fbf2145b 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6451,7 +6451,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * put back to page allocator so that buddy can use them.
 	 */
 
-	ret = start_isolate_page_range(start, end, migratetype, 0, gfp_mask);
+	ret = start_isolate_page_range(start, end, migratetype, 0);
 	if (ret)
 		goto done;
 
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index e680d40d96de..c608e9d72865 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -442,8 +442,6 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
  *					 and PageOffline() pages.
  *			REPORT_FAILURE - report details about the failure to
  *			isolate the range
- * @gfp_flags:		GFP flags used for migrating pages that sit across the
- *			range boundaries.
  *
  * Making page-allocation-type to be MIGRATE_ISOLATE means free pages in
  * the range will never be allocated. Any free pages and pages freed in the
@@ -476,7 +474,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
  * Return: 0 on success and -EBUSY if any part of range cannot be isolated.
  */
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype, int flags, gfp_t gfp_flags)
+			     int migratetype, int flags)
 {
 	unsigned long pfn;
 	struct page *page;
-- 
2.47.1


