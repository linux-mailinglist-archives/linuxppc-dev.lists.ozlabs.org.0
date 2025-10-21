Return-Path: <linuxppc-dev+bounces-13103-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A985BF69E2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 15:01:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crXT855qcz3f1h;
	Wed, 22 Oct 2025 00:00:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761051612;
	cv=none; b=PDYUPAfhaGPuBl3v3oFx9m5Ie9mGPae5XReK/lJOWksozJsyZLv5j6PO0+fCiRU+MuFNIDHTZZaLgJZ111/WYf8tyoBjg/32RHzMrWTLdxdm9CApA2SeAiLHMkibvZSuIZ6JSjiAouZ4mixtUsMD3TX43qZhi8BoPwZ2u8boJ6YamFSSG9leqEC42Y0Ba40koWZzx4LCO0Q2b3kk7WCgdJnqLYmqGuX/r7+WeyiNae7qbP7xgf+brMv1t4PFp3vVDuPC/VkNj8ExJqMONsN1oRvkhV21NmPX0akyKwKGN+ee84pQ2/b2FUKEXhorgGeCLlfokmhtkCWO1ckt42zXFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761051612; c=relaxed/relaxed;
	bh=qyA8pCV8ZcD9NKgO0LjiJR2j4wGQSpAi/OG88VVUt3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=TaM2SSdeYPOQi8R9hTOeG7g7SMI1XRNtcmVWA6H7d6+GVkSaJN2TAHjNuxxb7sRD8Hwz87PKu/0U9JDJ3etTedoNgAuRJgh9NwBNNo8eEj9N66/Mx4rAVmQz+nvz2QIsFe1lqnysjBfq3oV1wWnmT9x5UWIlqBX4nfSnT3ZvMRhH1uuXlNhfV469s4qduDCSnZD3vwd1+ifLlV1rbu6uN5pYbgv2RXEhHPRpqwxgILauxnyId0ey4KbsHQiKY2Ols2LUNJ9aukrRQCypHc8gaNd2uZxQGDi3P+asyZf304gCQe/OiHoHmPkTJjXQC9fXIE/RtCVcGIc6pq4lfGFq/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UfLuGWHV; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UfLuGWHV; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UfLuGWHV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UfLuGWHV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crXT7613Bz3f1f
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 00:00:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qyA8pCV8ZcD9NKgO0LjiJR2j4wGQSpAi/OG88VVUt3A=;
	b=UfLuGWHVVI4j3OAL4UlOjsi326icFXDrQ+ldKy8FudYW0csDT2nzCRNvH+GCFX6YY81Mxx
	E6YAkfjCtMsaFtlH+QbimJwjKj6BZ/WnrkSgcM8WZWHHMrXptlH/GL2G8/XIYIboddjEBQ
	61ItdreV5H5YLvML7QskmIq/bQVu3tE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qyA8pCV8ZcD9NKgO0LjiJR2j4wGQSpAi/OG88VVUt3A=;
	b=UfLuGWHVVI4j3OAL4UlOjsi326icFXDrQ+ldKy8FudYW0csDT2nzCRNvH+GCFX6YY81Mxx
	E6YAkfjCtMsaFtlH+QbimJwjKj6BZ/WnrkSgcM8WZWHHMrXptlH/GL2G8/XIYIboddjEBQ
	61ItdreV5H5YLvML7QskmIq/bQVu3tE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-mmNcjvoePSGms5_W9fXrug-1; Tue, 21 Oct 2025 09:00:07 -0400
X-MC-Unique: mmNcjvoePSGms5_W9fXrug-1
X-Mimecast-MFC-AGG-ID: mmNcjvoePSGms5_W9fXrug_1761051607
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4710d174c31so56479945e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 06:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051606; x=1761656406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyA8pCV8ZcD9NKgO0LjiJR2j4wGQSpAi/OG88VVUt3A=;
        b=S6eLoxePGqZGrGeFQArnxeKofVbjqXAM4zOEosfpGWx+vEQvljdEl7HLT5fW+yPX1X
         NwRwSTp+JGk8Y2k4vMNfD7yuyl05YkNiOIiQVMb2xbkMm3S4O1wzyyCyMzfEJw972X0Q
         aJQnLYI/Po/IOteQNEBT+1N/0uGUgo0pKxFvLTYuDzFMkiacFF+G99+R5qU4+R+nKNPl
         914ixklo+tA42QPgk2C2j9cqAbETu4ttZV46QYEFranWJ5+wkntwp48e6MKnrcKRQwJ0
         8HPu9PVHvgNHPM0A/zjxrjnzxvHHBY0tMqUKvKZKPVp9imjev+G8Aj7scKjcCzEVTTCy
         Cx3A==
X-Forwarded-Encrypted: i=1; AJvYcCUQSnvYraoqU0lREkUT+cgAwadYJ8DsxF8ifGD/EIhVnCZpZwORHPobN37pj0e+LMn7f4ayE55EIuhsnLc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy0ojWnaqKFvBe1R4X3dYXUdn/MT2OqIBicJ54PiPzDPkundfcl
	oy5OG2k4VFj0jaSGOFuIW5RjkkRV3DCA8uM4hUGah0NYvbuXugPzfNWjbDQqhZlyOAzf53A71Z4
	AiWv8TByF/0MgizsISAJGWBam7ICwkN3WdcPJCIm3qp6yHNpF079BCj9IsnxcsUS/lZU=
X-Gm-Gg: ASbGnctGuVuFXqzat/cul5mLr6mraykNXn8MxbRhonD2osFH+p11YjRUN+10dlA38mV
	wZYHAp05tfh1bqtT+/W5bphJGDXlLY1R/paR9EvkOgnzkKdRLHshmqbHFbj8gGr/Pgk+eljKFc/
	v6ywgsmzgZH/cD/qJX7GgrRZgPORa78qHZ/0QkIAn55dryCsT9mk775ZsaFMz1yQgLXc6wyShYf
	mzkRE3kj1TX+nkYrb5GQiO8M3tyaOMgnxlA5FZDxbwHuo73NC103hrTt2g0M9lMRZi/KNfSAprt
	yxs7PeMQ3rcK4XinC8ZAzqGicQPoBS6IBcUHfkQkPakt0a2u6yxh0ds1nA3JlewawSpUag1muK1
	Qq+GGUXxt6nclwWBO9jSz3qEmeIh1dnS3NQw32PLT6ZCyBYoUzXkcV3qPjBbp
X-Received: by 2002:a05:600c:64cf:b0:46e:3b81:c3f9 with SMTP id 5b1f17b1804b1-471178a80f7mr116647385e9.17.1761051606584;
        Tue, 21 Oct 2025 06:00:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbkCxQxFQj6JOplMg8GsGSdkTVrb2edAU/Gb4AKN0gQYX2xa+Zptcgj0djfMLZWDQvHioQbg==
X-Received: by 2002:a05:600c:64cf:b0:46e:3b81:c3f9 with SMTP id 5b1f17b1804b1-471178a80f7mr116647115e9.17.1761051606167;
        Tue, 21 Oct 2025 06:00:06 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471144d17cdsm278222645e9.18.2025.10.21.06.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:00:05 -0700 (PDT)
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
Subject: [PATCH v1 15/23] mm/balloon_compaction: assert that the balloon_pages_lock is held
Date: Tue, 21 Oct 2025 14:59:20 +0200
Message-ID: <20251021125929.377194-16-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: JtJmu-8fI7vExEgcQ2vT-hcrgpJTUG4fofCy12O05WE_1761051607
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's add some sanity checks for holding the balloon_pages_lock when
we're effectively inflating/deflating a page.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/balloon_compaction.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 717bc43732d09..f6e0582bd7ffe 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -33,6 +33,7 @@ static inline struct balloon_dev_info *balloon_page_device(struct page *page)
 static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 				       struct page *page)
 {
+	lockdep_assert_held(&balloon_pages_lock);
 	__SetPageOffline(page);
 	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
 		SetPageMovableOps(page);
@@ -50,6 +51,7 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
  */
 static inline void balloon_page_finalize(struct page *page)
 {
+	lockdep_assert_held(&balloon_pages_lock);
 	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
 		set_page_private(page, 0);
 	/* PageOffline is sticky until the page is freed to the buddy. */
-- 
2.51.0


