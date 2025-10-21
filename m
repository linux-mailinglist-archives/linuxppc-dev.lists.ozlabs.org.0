Return-Path: <linuxppc-dev+bounces-13100-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3488BF69C7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 15:01:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crXT10Gy0z3dX7;
	Wed, 22 Oct 2025 00:00:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761051604;
	cv=none; b=aJq+y4Unal/fxVWtqQjvalPrI21GHp0kAuSn3OneTQWAoC9KN85ai48IPcF40QCiZAUDRC1mJAw2qnQ8n6b64UNZMouQZB0wlKCYcaTjgNXGSk7Yn6XSOhr/qv0kGb0R77pwipzHHyKwKNSPIHPfzOGYQwzoIdqPysAv/3K4OMlY6fIY+JvQ1fOTzjEqlIi0s/7HuZ4qmao0VAsgypKvuehmPV3/PTwJFNkttkjggumHclsoFSMQIEXZz6FFKQZ672eMWRjVsdVhzXDsaFxO9wnTBB203aSfZzXw8IpewL5yKH4pMuL4cpZVxmfnTrlxKJQnmV4DP2Oj1eBx3a/Zww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761051604; c=relaxed/relaxed;
	bh=sGRFD+OUXBdzIHwpdd8L6KTTXumWjBTMpIxo57Gp8oE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=htAdRhXbNiHs+Xnn4J7Yth4F8n9AkuYRotMuZr4YfisKVeZGXAQPgVk58E3I9XMp8pcfoW0xtAXyrfGTbRqMip0atKz2DYRnRG5KvE+ekyIgxZvh/wUP0vcRe4YQi54RrsUWQ2e/I6IdNfwmoVz1nPHpNeVfedYDsR7mPwIJFd2fmAyAA4JWuEppWypWbJGGgzbO2cFGPUHzphw27+YxjPWPmzT37Ccdolep9YUmaKcDYgk78+dvTGytlwSx1pIOqrUtnDQXDBk3e476sNlO9rvqcrpdBD8nLjYNG3pEZNFcVgCRjoTYIARfc6UvhU29jhr0vH7drpxnnSe+JeIF9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xv9tgXv0; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xv9tgXv0; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xv9tgXv0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xv9tgXv0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crXSz1khPz3dWH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 00:00:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sGRFD+OUXBdzIHwpdd8L6KTTXumWjBTMpIxo57Gp8oE=;
	b=Xv9tgXv0bKhxvmHzMaf0KXZEHa9zNbxsKxxEPxPePrlHzm+LqcJn/WAz+DMKZPdhtyGv1i
	ejB/rkUWc6YokU8UfyxaxuciNQDmvGN8Rcko08LzPwCwv/l78awpckoabB8VIr+241JlXD
	j9uG0yVU1f/1lOK5qqJl9PhhRytpMfM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sGRFD+OUXBdzIHwpdd8L6KTTXumWjBTMpIxo57Gp8oE=;
	b=Xv9tgXv0bKhxvmHzMaf0KXZEHa9zNbxsKxxEPxPePrlHzm+LqcJn/WAz+DMKZPdhtyGv1i
	ejB/rkUWc6YokU8UfyxaxuciNQDmvGN8Rcko08LzPwCwv/l78awpckoabB8VIr+241JlXD
	j9uG0yVU1f/1lOK5qqJl9PhhRytpMfM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-o14HIUszPlWDvVM1q4z6hA-1; Tue, 21 Oct 2025 08:59:58 -0400
X-MC-Unique: o14HIUszPlWDvVM1q4z6hA-1
X-Mimecast-MFC-AGG-ID: o14HIUszPlWDvVM1q4z6hA_1761051597
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3ee888281c3so9987238f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 05:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051597; x=1761656397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGRFD+OUXBdzIHwpdd8L6KTTXumWjBTMpIxo57Gp8oE=;
        b=vxNG4Cl/n9XphqXbDWoNcWM067fiHV30q2+dAo5N8/CF1BxltMT9KXwV5fRDCOn5/e
         WKrsJPUxHMlhS2nQEpHdBU1o8gFp+iubs2n/RK8ra9v1RdElBJZU6JFu90Y+1MdWfYtM
         y1qDfCOI7Nozcz++f065MrRTzkzPp9Rxs9u4cIcb9cx3zEm2YfWjZb17PqKyyR3BArv2
         6TCQeP/S++fVPungiDLCjTKXCLzNQaLoe5nFQRbehGsyM2NIW1froPR6+FI5Fkgn40Qr
         41mr5miBIqT0gIckPzqrnrpVhOwRD7Ii6HQxhC11bhBqgVcEMf+xT3uSIbOrFhIrlQYy
         7y9g==
X-Forwarded-Encrypted: i=1; AJvYcCXL4mQW2ljAZfib+4v3ottc29QFC3vCcLYkyJrYsqR6o35EmRih7ZY0jiE+oqJu28a3BiwCYw6n7WM30ac=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzIFmRD2AR48/ardzOTH4vsPumSIDIzlkRn9ORkvBGlEDL1eEWA
	LPN2AEdYXlLHVlKgtHp3aPgdf1/4oY31opQI3NyTtjIrYbwM0nzaNRh09xTkKtUhpIC5i7nnPwf
	r7KyRslckSLyqTfJA2RP8wZjWDGgnqQ3DKDC1s5hTGb2mwFJ+HbBGoEb1rAnckw/i/hE=
X-Gm-Gg: ASbGnctF5JHI+SsWLndGF4jeJcfdv9xZTIYo1JfGbBhbOyqZNVVZtULUHQ1ByW6bL1s
	8u3xrgAcoWAwR8UHw/d+wvBR5XOmqfjNhruMX9uPJ5Re8maOuOI/14OfuWdu4O0iBfGPs9sjlq/
	aNSgIsmiuWzLdkDHvzQbPROgH5CzVv0wEuVP5tIgLf6o7R5B4tRCFtxi7WeONe4ypAX++90rVvk
	03Z4jguIyGozyf5ek0k32WJwF/E1+61Wzeol1cTOqMSpRb+5I1qL0lg2yuLOLZZ9yXQFFP1hBYW
	04T85owqwWb6Nab0kylm8gT/gprqqXI9n7X/YgvnJTc2paX6ty5ugXgPzUQV3ob6HCNq+sGGvsv
	z9g3rLaxNmBCbPGNpQw0r2JIoqmq3e/H1nOqE4+qLZZ16OYXyvZYCPBFrHYvA
X-Received: by 2002:a05:6000:2284:b0:400:7e60:7ee0 with SMTP id ffacd0b85a97d-42704c8848cmr11160765f8f.0.1761051597340;
        Tue, 21 Oct 2025 05:59:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1yccRPZwAQwYfj1DMBRFBsRJJ5k0BROkzwajkMvCNAUgq3lYo09LUN84ZfbVlOv9dAfW2Ig==
X-Received: by 2002:a05:6000:2284:b0:400:7e60:7ee0 with SMTP id ffacd0b85a97d-42704c8848cmr11160739f8f.0.1761051596931;
        Tue, 21 Oct 2025 05:59:56 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00b9f9dsm20357223f8f.39.2025.10.21.05.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:56 -0700 (PDT)
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
Subject: [PATCH v1 11/23] drivers/virtio/virtio_balloon: stop using balloon_page_push/pop()
Date: Tue, 21 Oct 2025 14:59:16 +0200
Message-ID: <20251021125929.377194-12-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: x5whs6FwJCuHEEF5XLCsIk4G4iQi8kh8Oq9V7DaqiM0_1761051597
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's stop using these function so we can remove them. They look like
belonging to the balloon API for managing the device balloon list when
really they are just simple helpers only used by virtio-balloon.

Let's just inline them and switch to a proper
list_for_each_entry_safe().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_balloon.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index f7d6a4a6e54f5..4b22de6a5f845 100644
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
2.51.0


