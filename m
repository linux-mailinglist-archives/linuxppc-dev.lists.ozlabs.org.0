Return-Path: <linuxppc-dev+bounces-13094-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 819E5BF6985
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 15:00:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crXSm11mbz3bf8;
	Tue, 21 Oct 2025 23:59:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761051592;
	cv=none; b=NYGoFce92k3OJ+3YA14vkZTksQYe1I9x5LZpW3K7mVuQ551FShPfolrdKEKHlNfDG1Uk5amEP5OsITtwoBcq8zNWiMh2aZDjq/UWenBC6vU5xjhF8fGOmj0X3hzuPGCOQbB3uM9X/tUx/PDZTj1Na0veZZ8SMJ+kHsErj8ewXYIhXEcKGKxsox+Wc/mDvGAhnZDO9NSCrSBWcx2aKGNIqPJSqmq9SkEYHN3RVM8JRQRrYqN6isVqlz3wvLJtbxKrIm6Dvxit44M/hv8y6q5O+agMkZKpM5loKlhajGBujGRVay0+w2mSFTMXjuaIj0AUdpS+qiJhO9ogSgUIvDpmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761051592; c=relaxed/relaxed;
	bh=cxQnhgSm0DzB03k3ShvGshMJPsSCnBiKfz0W3WaQRCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=BDNf0p9TbNh2Gj/jcDFMjtjAEcU2uj47wH3v+MaF7XpXCnaAn4rxLMSul9C+pVBcG/3aF0EDNggiYcOT6VIQONb78VVbJLCl8M9krtf5XjnEV1z+oPGzURr7a+Pz1y6/qkHFdyEdRBTMKq7r2whDPwxMBlE8TDOXORLlc2XG/Fxopit/Yo5fghk2dnRvnaBUFROgfTKeXqKUeIbS49KSTdlvFzdajtVSvnygU+xCAuC/GtX8vtaRPBuq3whBzbe/c9ya/5v/g/AmicE7+NgvMpQdTRRIrzKsNEMSBgbGMGv+AIkrz7l8UNPI3hdwRu/617ONJWFNbIVhHyJL1wLy7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H6Fm2KWU; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H6Fm2KWU; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H6Fm2KWU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H6Fm2KWU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crXSl1skvz3bs7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 23:59:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cxQnhgSm0DzB03k3ShvGshMJPsSCnBiKfz0W3WaQRCE=;
	b=H6Fm2KWUkxzGRk0WbCBYDGnDoL/4J6O2EWKmscYlEJ+x9BEdoYwYYCd3crId34Ve9zbbfb
	2/bGi3/TxgxFnmr3DdebT5GZv5kMX5EL1+V+lBiHPYGiv6jd86N1SolH8wD/x3HIYMvHYc
	k7UAmAJanB9MwRAieHJTru0q0417Fiw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cxQnhgSm0DzB03k3ShvGshMJPsSCnBiKfz0W3WaQRCE=;
	b=H6Fm2KWUkxzGRk0WbCBYDGnDoL/4J6O2EWKmscYlEJ+x9BEdoYwYYCd3crId34Ve9zbbfb
	2/bGi3/TxgxFnmr3DdebT5GZv5kMX5EL1+V+lBiHPYGiv6jd86N1SolH8wD/x3HIYMvHYc
	k7UAmAJanB9MwRAieHJTru0q0417Fiw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-54H4uJn8PnKZSXv09Q6v2g-1; Tue, 21 Oct 2025 08:59:47 -0400
X-MC-Unique: 54H4uJn8PnKZSXv09Q6v2g-1
X-Mimecast-MFC-AGG-ID: 54H4uJn8PnKZSXv09Q6v2g_1761051586
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4256fae4b46so4171103f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 05:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051586; x=1761656386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxQnhgSm0DzB03k3ShvGshMJPsSCnBiKfz0W3WaQRCE=;
        b=k2STKO197N05oCpB+Iv1AjFqeypO6kYQVaMqt02USS4pvRp57yE4uKGCx/LJlkH+4X
         ITRaoCxfNmu4oAggHYdpK2YldcGnz7FBNOPbDuVhAGqZTLh7qX5vUUiphb82QJVGF87O
         ZCL3C5Kb8jeoPCUa+SSmFVlGDb7pg8FDpzGI6PXAwQSenuSx3WCkTWzEwawcmy8RUeMT
         EdhzHYOoxYWST8ndsm1PdecO4TS6NKYaqBgmg8WhkZb9EOLccAWi8qCbZqabgvD0+bcj
         2/xQB9WtxFbvmfxKG16kMKdPsXm1+WdirEIiildOuTSVT0VH5yYm+DT0Hc1MILb2TqTQ
         fydQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2tdh/VIO8OWalTvxv/ZsoEt4K4iZC96YKLO4oYhILCXhHX5H9m23g7egVmpzw7GFG7l6G8hGW6X2iJCk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywz/vyvE/x0AH8IeYQNZu5ikrXH3u0tMgaqUvRpx61OA40KSe+w
	ZmC40EpAMs/UKc5390ZVpABjoaPhEJHy/7Ir7wG/BWNHsKDvTtUPr9rTurSqpFEZpNcbnsEhLsE
	LotSdpGVd+yEPWnoTl53HXHt82qWN5dsFOXpNv4/KzCwaeJtU29m13wRfHwS6y9xwQX4=
X-Gm-Gg: ASbGncuzLycVoqPRVjSycRac/QQeeb5ns8h+COHAo1pQ7hXNBeKv7iPNRmM4ndkE0X3
	fX6tpryIvE0DfyVUtd6B6pPUJltTYCnfGb5KTZhPuFpSbI5sJ9sPA5yffm0Pss2vs3jQ9xXgtdj
	ghZx9+MSA8Ml6+1xJKQbjiluSRdb9A7J09f7jTnFc1xiwZ3akGX4cwiHG/e/AJ/2zE0676wCAyH
	SGD/oUgXI57Bt2XMv2KrPNfEm5pehDh1G/mBm6CReUT10NFfVwqHhsRGPSeObPR3CTqDvx3cjRR
	5E85bkddzy6Y980hffYuz9vGJlhRqGZLSXkewRCaTVn8HqB/bgpDr5YGh7JANGjbDm4XZBr7zVH
	DOPuMFgp0Pd05ZQ3/R9TK6Kosafnyo4xuqjgsCo0n8TuJX/2W7l8VMRX9DBoR
X-Received: by 2002:a05:6000:26d1:b0:408:d453:e40c with SMTP id ffacd0b85a97d-42704d8efa0mr12411531f8f.25.1761051585875;
        Tue, 21 Oct 2025 05:59:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEOtDIfhDIzkXczwnOUGV3QbWhaE/6kTj9DtjKKHbsfSDizDdGlR5kALx8VAPeRCrHUv5bhA==
X-Received: by 2002:a05:6000:26d1:b0:408:d453:e40c with SMTP id ffacd0b85a97d-42704d8efa0mr12411489f8f.25.1761051585441;
        Tue, 21 Oct 2025 05:59:45 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00ba070sm20517572f8f.42.2025.10.21.05.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:44 -0700 (PDT)
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
Subject: [PATCH v1 06/23] vmw_balloon: stop using the balloon_dev_info lock
Date: Tue, 21 Oct 2025 14:59:11 +0200
Message-ID: <20251021125929.377194-7-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: N4MXey0uR-3e7xURnNvpsoh9mi4yeoI43CcsoNVv7FU_1761051586
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's not piggy-back on the existing lock and use a separate lock for the
huge page list.

This is a preparation for changing the locking used to protect
balloon_dev_info.

While at it, talk about "page migration" instead of "page compaction".
We'll change that in core code soon as well.

Signed-off-by: David Hildenbrand <david@redhat.com>
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
2.51.0


