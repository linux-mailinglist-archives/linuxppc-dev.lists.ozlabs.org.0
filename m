Return-Path: <linuxppc-dev+bounces-13102-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A95DFBF69D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 15:01:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crXT44krmz3ds7;
	Wed, 22 Oct 2025 00:00:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761051608;
	cv=none; b=e+Y3YHTzesqDSIMnM1qYTWrnjSiTHWll7OdxNZr1TMuQFORYZt4H85aEsaWivSQU38oGklVAXnAqj9k/NLchzhzRC1FD40ZcHlMjs0Ylh0Rvd0NqUlJv97v9DshTNx7qHu0ld4UzlSoPK9MMtXUGZkpWLMbpe0gK9X0mn6n3pknKiNBNkGgn6KderHMi7S94aZUZotpwrA2meh4U1GZMaOekeKnd9NEHP5w0FJ97Emy/l7wPuOJ6vQXPWkrW+n/zq0f+b4bq49fiwfD0cs+lYPeLNPUMF3VcEuwAQRO5wRmYfkUzhc3ILZOduFuInWOjKksI0Z03XEJT5Rn9lp2oeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761051608; c=relaxed/relaxed;
	bh=Mx8PDzlnYvvbZ0yUyMmWAvQGgV0mnv7F+nCFHBKHb98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=RYuSwZaXiWmb6dAG5aUKWXX6H/iR/noPDUUcOs7csioXUPNurjA3CuD2ql8EjoOdyOVwEhJ6qFd+Jaiww7ghlQ8xIJg/SW2IMR8M64rs1UWFcQRP0/uK+wJdKd62tZj7wiEOVFkqcOjyCKiTGriWAbycEpW04HTRE0iMlvH95H0Y5DR19ke5ZMY/0lM80bpdhfaKyypS0SOfgt6xSp/WctAQphXQaDtu3SAPmyBfFnX9+In+l045AadgsGW4uOyVmvWlA2nPuOGNMyDE+CxOS3unkWSqCJoumJ0GsFSHt7QGprBuP64/grejMvmbGQP3D/+4TFk6/ZNSlIs4NtXQyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X2/Qt5Jd; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bDwSLcUy; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X2/Qt5Jd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bDwSLcUy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crXT33Gbqz3dfy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 00:00:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mx8PDzlnYvvbZ0yUyMmWAvQGgV0mnv7F+nCFHBKHb98=;
	b=X2/Qt5Jd3SK/wlavqeFpoXhG9OjgmmbKCd1oR7s1fJ93UBxJFDV9pHDUfnrxWYX/hD5Azg
	GPzVBWUSyEYft58iLLlk8yXdaRLLgqadlg/u9bA9hlZUgh9IFzjeihl3IqLFc+iy+1bGtD
	DfBUeZegGLkhv4PPN+tJNqRx2iNPe6c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mx8PDzlnYvvbZ0yUyMmWAvQGgV0mnv7F+nCFHBKHb98=;
	b=bDwSLcUyT1/w2UOMZmaBAme1t2Zzd660QxdYpNKjSP0fuq9B5H6+vKCR54sB084FzG7zvw
	BoYaU5xRphHzCZJ22NUGTJNqpkRqHy1l+DqCmfPixFzKHcikHqv6st+DSvG5I40kqu1b13
	DPSwRR8kc9dQnExIHj/3lUhyRkjLL9g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-vBYO3MZvMcK-Gv-4UOGoDw-1; Tue, 21 Oct 2025 09:00:03 -0400
X-MC-Unique: vBYO3MZvMcK-Gv-4UOGoDw-1
X-Mimecast-MFC-AGG-ID: vBYO3MZvMcK-Gv-4UOGoDw_1761051602
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-427027a2095so5764868f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 06:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051602; x=1761656402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mx8PDzlnYvvbZ0yUyMmWAvQGgV0mnv7F+nCFHBKHb98=;
        b=JqvYkQshQxK0EcZWXM0lp2eEyR7BT5N83yqIsTpHAtH4cWgL7XRTwibkrKZ5ZAizsp
         7kGITtgd73QTzaTnRxIEJLrOGy2htyghVRhMlkoIrnRP47TMIIOzqV8702qzQb4elw4Y
         7c7muvtt0Q/R4yTyyIGXgmfW69td8oAbfk/PXvbRkzD5nPxZh/CzXCYo87U7w4hWyT5x
         WDwxI0df00sNDKnSxKlcthNjmadJwDyrZWgkdwQyybJrNzWTOp1CbN6nGFAQnlcr+uuO
         zoTr8pSAvjOKMSGhyXvQ3AIyNR16XlvUutT77cynuz2WEedRM/2G0b/Y+8afZULLxEuv
         NiFw==
X-Forwarded-Encrypted: i=1; AJvYcCXRTubO1Jg2knsPWq9WRoQmQtmwmpapqBkbzy7Lf5rZH9dut+VaDbPJ6/tSra9p+7ud6b9GRhw6KhKVUJ0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YysIbWsnPCbTY8f1NtKGO1HlVh6Jct3iklJK5Dg4AIdFdLOEA/y
	OJQhj5I9IbLhAMYFugOnrM3p9xTeQ+GzMy4vl7fQsxpZqb3CWwGQXT5XJHn3Buhz7sGy7ngAT/j
	KfC1/RD1OSr0BvQuWeoinSfnUkZHAuzJ4EV6MumIKJYLAH9Wkm/B//cHtbsjygGsy370=
X-Gm-Gg: ASbGncvK4PJFvEBkIdjVFOqA3R3K3vblQHpn19Ue0zLCsHzR+1DO6n6Fz0zhfbAB9vk
	DdIpI0k1AmuVz2bgSl0n8Tn2w+tNunhmlMO9dOCHwhm/NEyU5hoH6Ymv3nZl1kEuygeP19buOyO
	zXOZjqgR1sEtNBKeC9K34IGWoCimi0yYaWHEcR5tivHh2z5w2jjVChmGOcvheC7cUIgIZksnyQO
	OMm09YBBW1+/lVBLQVYhDINZk83UxRTCj0xxnIbkVhZ6q6TzPvSnsBC7oGyaXDJvsVdbrpwoqqm
	lt0GktSvBlot7j0zr/AZlKs6lQDQOMGbwGgroprBMBwPeiNYsQu9tHRvdvGlYwFjZ2nANoQOBXf
	ZpOg5u24e51Y5afSV8EhUgP61c1/Dhsy2bbOZ21e9vj/HvtTk0Dr0V/1U3AFV
X-Received: by 2002:a05:6000:2010:b0:426:ff7c:86e4 with SMTP id ffacd0b85a97d-42704d8df97mr11013367f8f.19.1761051601983;
        Tue, 21 Oct 2025 06:00:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQe2AF3cxcaLPsgMe+jA1+DvC9OUXEqv94FS7Gua6OqWlPAIEXZjpDAmImXhD8jvhjJ6PszQ==
X-Received: by 2002:a05:6000:2010:b0:426:ff7c:86e4 with SMTP id ffacd0b85a97d-42704d8df97mr11013339f8f.19.1761051601543;
        Tue, 21 Oct 2025 06:00:01 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00b985esm20896549f8f.34.2025.10.21.06.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:00:01 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
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
Subject: [PATCH v1 13/23] mm/balloon_compaction: fold balloon_mapping_gfp_mask() into balloon_page_alloc()
Date: Tue, 21 Oct 2025 14:59:18 +0200
Message-ID: <20251021125929.377194-14-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021125929.377194-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xzFwlL1rZvrNTRjVp43qAk6xmOYMZtGTi7R0EIM1b-Y_1761051602
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's just remove balloon_mapping_gfp_mask().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h |  7 -------
 mm/balloon_compaction.c            | 12 ++++++++----
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index e5451cf1f6589..d1d4739398978 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -106,13 +106,6 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 	list_add(&page->lru, &balloon->pages);
 }
 
-static inline gfp_t balloon_mapping_gfp_mask(void)
-{
-	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
-		return GFP_HIGHUSER_MOVABLE;
-	return GFP_HIGHUSER;
-}
-
 /*
  * balloon_page_finalize - prepare a balloon page that was removed from the
  *			   balloon list for release to the page allocator
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 90b2d61a593b7..709c57c00b481 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -112,10 +112,14 @@ EXPORT_SYMBOL_GPL(balloon_page_list_dequeue);
  */
 struct page *balloon_page_alloc(void)
 {
-	struct page *page = alloc_page(balloon_mapping_gfp_mask() |
-				       __GFP_NOMEMALLOC | __GFP_NORETRY |
-				       __GFP_NOWARN);
-	return page;
+	gfp_t gfp_flags = __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN;
+
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
+		gfp_flags |= GFP_HIGHUSER_MOVABLE;
+	else
+		gfp_flags |= GFP_HIGHUSER;
+
+	return alloc_page(gfp_flags);
 }
 EXPORT_SYMBOL_GPL(balloon_page_alloc);
 
-- 
2.51.0


