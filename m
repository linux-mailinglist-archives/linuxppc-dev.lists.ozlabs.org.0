Return-Path: <linuxppc-dev+bounces-13091-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9EFBF6973
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 15:00:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crXSb6t9jz3bfF;
	Tue, 21 Oct 2025 23:59:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761051583;
	cv=none; b=CXl5b1qS/1ev5F9pzuMfh2GCfweeyPy3EshRXYgHKyTjAnzd2Wa9EvM6Y2s1EIzaOQFFwNy03t7Mu8jsqpvcJQzvYWc+pFuZeIikzREDbV9tF6RYgTIM5MSwAFVaOzTNbV//Z1vFxKNAoVcse8YKp5bJ1oEpGKXxR2vKp1dOgXMhnmqj1Pu7fqcQ4ZfP+YvB8daiS4HmfQ1kXp815hbUpEMmC2b3cYLCSNGzLrxJk+TrQbVXuqfeeXpaghc/4DNPTnl+ltGRWQa7UMPICbgOIt0TKgapkc0ez+2DLbrdyFO/CxGVB8eGww9goGk+Y+p8ot1o6F1QcuqVO7JR1hHnig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761051583; c=relaxed/relaxed;
	bh=8R/9+ffq24GRtsamw+sO0Dq3xyN1P0TNXMmPfo3y584=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=QVUJQ4zfU2wknFyDLcjoilgtpgtdr9coyhnGKmde16mjWQGX5/hfc7gMXHjKciwNjZSu7/hUnlCh7QEFMNvbc1sWZVP926/82nxTlWegLlnaFYZ8IBQ1bxZT4MH8J1snyCyNhzmiHPbgz3nB6WU91aA+FzZTz5KZha/1zXAZClWEsBsteF50wLe5lZnBaTs5gEhyhKCt+AlHslqPTeDgJStC6DL6cdbX7BcWciJ7BI7WblI77X94OcDNvhi8Q/r9t49TB7h2ogMlWRW15BpkWvSht3V2TadKeqjxe023eOU9VmdXmUKMBr5hKUUMz/pR8/D/8F3x3UUvS53pMRgwDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L7Vn3Mfw; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L7Vn3Mfw; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L7Vn3Mfw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L7Vn3Mfw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crXSb17GSz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 23:59:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8R/9+ffq24GRtsamw+sO0Dq3xyN1P0TNXMmPfo3y584=;
	b=L7Vn3MfwR7rmQwdUiLf4ndtjX0LRI0Ez9EhYo9in8csnGRbamCL6Xm4QTTWw+dwuM25pR2
	7uE5DNIkH60iCC6gmHd2g+1NFGNzxZSAGvC7R2y5KI7x6SBdICYeg74yPlmFLxqkzv0C1H
	2W0Ekt/y9bl01uUK6Q5lR0JeCkV7Or8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8R/9+ffq24GRtsamw+sO0Dq3xyN1P0TNXMmPfo3y584=;
	b=L7Vn3MfwR7rmQwdUiLf4ndtjX0LRI0Ez9EhYo9in8csnGRbamCL6Xm4QTTWw+dwuM25pR2
	7uE5DNIkH60iCC6gmHd2g+1NFGNzxZSAGvC7R2y5KI7x6SBdICYeg74yPlmFLxqkzv0C1H
	2W0Ekt/y9bl01uUK6Q5lR0JeCkV7Or8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-8-f80vBvPqq_Qw87RVLdHw-1; Tue, 21 Oct 2025 08:59:38 -0400
X-MC-Unique: 8-f80vBvPqq_Qw87RVLdHw-1
X-Mimecast-MFC-AGG-ID: 8-f80vBvPqq_Qw87RVLdHw_1761051577
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-471144baa6bso32645005e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 05:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051577; x=1761656377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8R/9+ffq24GRtsamw+sO0Dq3xyN1P0TNXMmPfo3y584=;
        b=FfPBFqnVk9QgjzTJd02grJsbXHYlbY78t68b6wp9JeMN0yMPDITKbNA/rY7gaqLMgh
         2/iyKS+ywmCohEoU2S8O79f5gE7tLZL8Cpglt4NRgF6Iqtxc2fv+iJo554DSPrpJURLU
         Q/L5YmAdq1+5f4Pmd7uOR2th307thuc93s88+rG1Dl2a5ckvXniP58ugzhIwYuFQR2AB
         /9MfJ4SwH83GEEypEquWbWwtqnky5uGXZ8aPQXpjWpscEP517nYNhpooxg1PeCQxzVuI
         zlwY0ZweC3w9q9T8TA79jtTM63+74d20fHmKfhJOIFLAbWmHJkjoQw1x3CXAIFmxYH9b
         xRng==
X-Forwarded-Encrypted: i=1; AJvYcCUJhJN/dAcosz978Z/yC0FCGQgnQ4G/HaDmKJrl6j31R3hETp+A18WT0UJtqQBVA69PQbCVrztDsV1ou1I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzakF/plYFvIn/yKk07OvjeupP+I9/GHU4vpvZJy1QpOVmMHXPS
	ReWIhyUTh3BkaPMBEbI1/TrPZ3R6wAFZqtZ2a2AOrrTraWBOLJWBxkTvnS2FL5aDiVzwWTGruw1
	bLx+HvZhJKBu+ZX18TL4f8wrnJR2cIPu4GvKgXQ+BAjnDlZ5wMih7EJsnti8edVVv1A8=
X-Gm-Gg: ASbGnctgNnLlWFAGDlHNHgCdUJJGHXPeBAeJHtlBwuvOlUj0g9b22w03yIKhU/QMUdi
	hj0gwSaiK6nXFcJc9YPUVgpxSNpJJ3HGb4NbGBFZTVo0Au2inhXzWosz/F+wKOsJ3fKxrdBf2Xm
	aV9yqeHp6DUrJJW0oGIK/bMwzdKOKFrso9g6CIyO0nvAxBHFXvTdKE4QeLtJckkTmdTw+Hg0RKj
	ccWDt4g6kXNcJk2K3Y3tFpQG8YAePDSP/cszJlS9VHFvZZikxlBUvoI7b3CScDXiV5ridA/ZL+6
	/JhAgaJrM48ofKnrYeKjLREMn7t4EeIC+PmjhgGoDGINRdL6lGV+LyO3op0aVTLVVTyYYcugy6p
	qPBMx2DzmDxhupr3SKtm0MS4QGk6mIn69UwZ/sB/yLl06fu5NxirmMhmZaIRU
X-Received: by 2002:a05:600c:444d:b0:45b:79fd:cb3d with SMTP id 5b1f17b1804b1-471179202famr118678475e9.36.1761051576993;
        Tue, 21 Oct 2025 05:59:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEokGBhUzCRsmptihAjBHDZlL2+6LwM1McdhB6sS9tCAS0C96fTIUzPBBNJE//85lgKmaBsaA==
X-Received: by 2002:a05:600c:444d:b0:45b:79fd:cb3d with SMTP id 5b1f17b1804b1-471179202famr118678045e9.36.1761051576500;
        Tue, 21 Oct 2025 05:59:36 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47496be2eb6sm16562465e9.2.2025.10.21.05.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:36 -0700 (PDT)
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
Subject: [PATCH v1 02/23] vmw_balloon: remove vmballoon_compaction_init()
Date: Tue, 21 Oct 2025 14:59:07 +0200
Message-ID: <20251021125929.377194-3-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: aBspAuY-t1MPNVp3ZxfB0fXpFKOUZEqR_VZRa8xrNPU_1761051577
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Now that there is not a lot of logic left, let's just inline setting up
the migration function and drop all these excessive comments that are
not really required (or true) anymore.

To avoid #ifdef in the caller we can instead use IS_ENABLED() and make
the compiler happy by only providing the function declaration.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/misc/vmw_balloon.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index 2cc34c4968fac..07e60a4b846aa 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -1833,27 +1833,10 @@ static int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
 	up_read(&b->conf_sem);
 	return ret;
 }
-
-/**
- * vmballoon_compaction_init() - initialized compaction for the balloon.
- *
- * @b: pointer to the balloon.
- *
- * If during the initialization a failure occurred, this function does not
- * perform cleanup. The caller must call vmballoon_compaction_deinit() in this
- * case.
- *
- * Return: zero on success or error code on failure.
- */
-static __init void vmballoon_compaction_init(struct vmballoon *b)
-{
-	b->b_dev_info.migratepage = vmballoon_migratepage;
-}
-
 #else /* CONFIG_BALLOON_COMPACTION */
-static inline void vmballoon_compaction_init(struct vmballoon *b)
-{
-}
+int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
+			  struct page *newpage, struct page *page,
+			  enum migrate_mode mode);
 #endif /* CONFIG_BALLOON_COMPACTION */
 
 static int __init vmballoon_init(void)
@@ -1873,12 +1856,9 @@ static int __init vmballoon_init(void)
 	if (error)
 		return error;
 
-	/*
-	 * Initialization of compaction must be done after the call to
-	 * balloon_devinfo_init() .
-	 */
 	balloon_devinfo_init(&balloon.b_dev_info);
-	vmballoon_compaction_init(&balloon);
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
+		balloon.b_dev_info.migratepage = vmballoon_migratepage;
 
 	INIT_LIST_HEAD(&balloon.huge_pages);
 	spin_lock_init(&balloon.comm_lock);
-- 
2.51.0


