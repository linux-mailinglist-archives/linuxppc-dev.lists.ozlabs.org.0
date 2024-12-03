Return-Path: <linuxppc-dev+bounces-3708-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 804249E1833
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 10:48:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2bRw1mzqz3094;
	Tue,  3 Dec 2024 20:47:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733219276;
	cv=none; b=aT+KuzAzId+0B/9E6kEAOh7Dzo3ExAvPESclH7bdpErcSd1uKBdqbdtkvqEmH7KjfFQkfQl2GgjJQvj1/Xmm8I1qpFFZGzW8rjLKJBcPTxobbmByN4R1FfzQl80ngFonZSCMEFGAOqGGCjcO/H4VFRzUH6w9wz1lD52qyRTqnlMzI7cTd2XOIfYN4TwNFCcLFVDXoLzTMbtpH9almX+kRbH5OkTRnWrKh6guOLchgmLOkkdzmOJjDIrNqFNOOyv6NJfuBzjv0cRLm6ypMbeiZJM5vD5Ik9gTe8aFSlyhNZOHZ4Ks9HO/MxW3wFOVmvRxcjtiQkHH3E2s97sv9yhlVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733219276; c=relaxed/relaxed;
	bh=0fQppTuvH7gihnzA0jS0S7Nrs9VtQXSbfqTsq5GHr48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=l7KkndgwM2qR62lT8/N74ZpiYNXGl+CZ4Nx4PaGppHICobLVnivCD5JHWXIbfspzc011HzrDJIrVpBrxThew7Iy+VHaMgZbvFO98U/FvNFgyfhDVvJjj6eay/5duHBWtDnUtKlO/A0Ab0h6fTR2Z/jCrLTLRvNepU4F2fXqJk7AwMdfvhHfUAqsF92uvme3XsroJeLEQoxs6KC8T8688fEnMW6pf74tYn3kXxZJBymQ+GJ3Ma4awFbqMJh7OSz2sDgAeQfGWWFodCVAyaQ1+HewtiVM9dHwux8HR7iQjh9N+Z7n/f3pvFTbLNi1etLcs1nawKU+XPbYXF5A9sDduJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PsXufix/; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PsXufix/; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PsXufix/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PsXufix/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2bRv2dXlz30Bj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 20:47:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733219272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0fQppTuvH7gihnzA0jS0S7Nrs9VtQXSbfqTsq5GHr48=;
	b=PsXufix/wJaO+Ojtf74uBYDzb8BNmWelq4knTbNu8zxEjzo9syCLKmqd12zi6R5yee+hAH
	PAx5LkLWGuf9Dmgi1KmEz16w7ETmlZ2XwVeyQyqlP1cGyQ2OBhZQJm9j+kJApkYS9CQoXE
	1QWZd47fsFNM863J5youXYz1CJ7130s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733219272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0fQppTuvH7gihnzA0jS0S7Nrs9VtQXSbfqTsq5GHr48=;
	b=PsXufix/wJaO+Ojtf74uBYDzb8BNmWelq4knTbNu8zxEjzo9syCLKmqd12zi6R5yee+hAH
	PAx5LkLWGuf9Dmgi1KmEz16w7ETmlZ2XwVeyQyqlP1cGyQ2OBhZQJm9j+kJApkYS9CQoXE
	1QWZd47fsFNM863J5youXYz1CJ7130s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-5SNhi034OsGXIFaBTGxebg-1; Tue, 03 Dec 2024 04:47:51 -0500
X-MC-Unique: 5SNhi034OsGXIFaBTGxebg-1
X-Mimecast-MFC-AGG-ID: 5SNhi034OsGXIFaBTGxebg
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-434941aa9c2so29955515e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2024 01:47:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733219270; x=1733824070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0fQppTuvH7gihnzA0jS0S7Nrs9VtQXSbfqTsq5GHr48=;
        b=O1neuDo78uDCKP+0DOUK3J7s1kbPbUouZAd3svMsIeEIB8ylt8vU1bRVxGOnL5P87F
         Yl7bJ+iVMWRxusDlSF+aSihOywCDpC1uQybaueCHKRYM+84Bk1Ci1EbGuvq3wqjtpQT2
         aezTE63zZSZOBqgnCsbKjtHxbb1nisemKYtEsVXS7/OoRROtpNWxMSMwfcpj2zZ6kyjy
         XG8qMkvCnOgI4DwPILqVxxmwAStB9szB0l2bwWg9v6Gb8x5kWI3HXJJbq6Zf4zh6sOnP
         Bb95p7UVm26PO33ThalHjJOxyghJd8M+JVBv0R4JVxznTTpck8pHP2Pu0vmh8HqFgDJp
         Q68g==
X-Forwarded-Encrypted: i=1; AJvYcCWY+ghONnu8wYm0Ysd1iajz2O0AnXD9N0UvZop09LtxFHSJ6ckjUHGxnWXgKpwAGoY6dkg9kB1GYIyRp48=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyhjZ+OzNhd4ftBrV96GMHkpr3XwrYoLm5oHbVvO2ktTIkdtnrN
	1iICoo9iTFc4EdqfJ1N2k4ournMLPpL3NpKSoK/lrFyWvPpXJtkjtFpAysu+raBmk3FDAP92F4A
	wcP7WdZ9oDGQ9bPtY/X1XXkIDb7sPm7mqyUrZqIK0WEDSTkqSb4sqOqID49w88vo=
X-Gm-Gg: ASbGncsId+4Cywu4LeHQmZ04NThHvmn7MPG/ucWvxtKhUxeVOuQHBZSMv3namUP37u4
	K++TOhZj6ku9/WcVA9F62gN+XoFbl1ivIlUACw8uawCQWcAfny9jwOCus7M4z/nqBLAMxaVYFYa
	r/tOrOJaY++0MUQE2w0UaikV3/EwbLXhRu1izEFLKvT59yC0FGPcq+sSOZYkVS2NN90Zj7yOw6i
	yqftHvUO+4zVatiK5wSUKnMBPyT2iCd+Ac/nhrLwzz977d61rH6tHg/d9fUjPS+YVWyzk311ATe
	cntQR5Y8Y/3Omeit1OBejIB9tLGWTdeO4Vg=
X-Received: by 2002:a05:600c:4fc9:b0:431:6153:a258 with SMTP id 5b1f17b1804b1-434d09bf4b7mr16320855e9.13.1733219270400;
        Tue, 03 Dec 2024 01:47:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGScK9nYDBCgbazhX5KZLpi1/ltXaWURuwLWZA1yYPBlDObPA+UiToZ3Fi0RuyRTQ0aGN5NvQ==
X-Received: by 2002:a05:600c:4fc9:b0:431:6153:a258 with SMTP id 5b1f17b1804b1-434d09bf4b7mr16320445e9.13.1733219269891;
        Tue, 03 Dec 2024 01:47:49 -0800 (PST)
Received: from localhost (p200300cbc7461b00fd9ec26cc5521de7.dip0.t-ipconnect.de. [2003:cb:c746:1b00:fd9e:c26c:c552:1de7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-434b0dbe2e7sm183147395e9.11.2024.12.03.01.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 01:47:48 -0800 (PST)
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
Subject: [PATCH RESEND v2 5/6] mm/page_alloc: forward the gfp flags from alloc_contig_range() to post_alloc_hook()
Date: Tue,  3 Dec 2024 10:47:31 +0100
Message-ID: <20241203094732.200195-6-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: -trekd62UsRmxPpjNveWVvKeUww2UopP1azc_BrBZr0_1733219270
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

In the __GFP_COMP case, we already pass the gfp_flags to
prep_new_page()->post_alloc_hook(). However, in the !__GFP_COMP case, we
essentially pass only hardcoded __GFP_MOVABLE to post_alloc_hook(),
preventing some action modifiers from being effective..

Let's pass our now properly adjusted gfp flags there as well.

This way, we can now support __GFP_ZERO for alloc_contig_*().

As a side effect, we now also support __GFP_SKIP_ZERO and__GFP_ZEROTAGS;
but we'll keep the more special stuff (KASAN, NOLOCKDEP) disabled for
now.

It's worth noting that with __GFP_ZERO, we might unnecessarily zero pages
when we have to release part of our range using free_contig_range() again.
This can be optimized in the future, if ever required; the caller we'll
be converting (powernv/memtrace) next won't trigger this.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_alloc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 54594cc4f650..71d70bc0ad79 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6364,7 +6364,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 	return (ret < 0) ? ret : 0;
 }
 
-static void split_free_pages(struct list_head *list)
+static void split_free_pages(struct list_head *list, gfp_t gfp_mask)
 {
 	int order;
 
@@ -6375,7 +6375,7 @@ static void split_free_pages(struct list_head *list)
 		list_for_each_entry_safe(page, next, &list[order], lru) {
 			int i;
 
-			post_alloc_hook(page, order, __GFP_MOVABLE);
+			post_alloc_hook(page, order, gfp_mask);
 			set_page_refcounted(page);
 			if (!order)
 				continue;
@@ -6393,7 +6393,8 @@ static void split_free_pages(struct list_head *list)
 static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
 {
 	const gfp_t reclaim_mask = __GFP_IO | __GFP_FS | __GFP_RECLAIM;
-	const gfp_t action_mask = __GFP_COMP | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
+	const gfp_t action_mask = __GFP_COMP | __GFP_RETRY_MAYFAIL | __GFP_NOWARN |
+				  __GFP_ZERO | __GFP_ZEROTAGS | __GFP_SKIP_ZERO;
 	const gfp_t cc_action_mask = __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
 
 	/*
@@ -6541,7 +6542,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	}
 
 	if (!(gfp_mask & __GFP_COMP)) {
-		split_free_pages(cc.freepages);
+		split_free_pages(cc.freepages, gfp_mask);
 
 		/* Free head and tail (if any) */
 		if (start != outer_start)
-- 
2.47.1


