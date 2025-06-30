Return-Path: <linuxppc-dev+bounces-9903-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E606AAEDDFF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:03:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5rr2CXrz2yZS;
	Mon, 30 Jun 2025 23:01:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288492;
	cv=none; b=U5w7V053LVJ0GBYHRNZCVuku6/n6OWChiSpXVZzuwmEaRjnmIckkKQQBKEHvjjkO4RtREYDBx/twPPxXUzn92hG0JjhpGi6U7+pdVfvUJaN8zaaYgMjinGUYYtkA/JmXccFlg2gnbOy+w9PmX78fwcrMrJTpSIHUPxIN6tY65JeWy4wUazGXnnaKV/sLZJWuaQhMTnjGOG4ZS4Mukr4FTT1fJ217Rs8/gynvBF8u56wXIzAqsqXkWRR/4cirpBqqgHyTHENwcmddZUk6wG6iilh95ECS/QCD4MUi4aCjkV2t+bgy00POfQymQ/g8V9Se2ZXp0BId4X+H8v6fVCsbrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288492; c=relaxed/relaxed;
	bh=lqdlPSrzqUfx0/Anfl8VFepfeUNo5Gqwl7mCFswBHro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=exwKuuovvB/Gd9TwQYsh/nn6J4ICNKM8eK/bwF2rwDtTX3+jOfoUnDGiTZ3qa1i0FW9sXfk0k/JPvfqhWnrgX1N/Yu3ss+mjKODZg25k3ApnxPjWwWGYAm9WVdZAUM7IxCuHFGo7c3U+sgf9YdCgB5OPnBbymLuprr9aOZ4m00kZLsFCoSxC3wygOAcK4NJnboOKYVMN2VPC9OzgTF3FkIyaqvk6GNOyAhsE44QlAUUJhdHrj+XSBt+8i2Y1aR3YPbw27qhVYau4io0qcbgmfgGD0TrYNPXL1UqRIp9kI3CKGlkmz5GP2fxy3YQLBEpkXaz5WQxNO2CHlZ4Eeazaqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D9iVPSLd; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D9iVPSLd; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D9iVPSLd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D9iVPSLd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5rq39pvz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:01:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lqdlPSrzqUfx0/Anfl8VFepfeUNo5Gqwl7mCFswBHro=;
	b=D9iVPSLd+j06Yd0/t00IkxmGUVjt+vjoa66BjycbvkQcq+jtpBLFrQcXg6jtiEkNx3yGam
	8arpx8/ac1JvYsFdmPye8KF+SfdlkNEcq/LnlNTfuIrcPSoFhoNFJRJrpKhB3ph8j9SFiy
	9XTosxf97F57/IoxsJ7x4xyg5hrmDD8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lqdlPSrzqUfx0/Anfl8VFepfeUNo5Gqwl7mCFswBHro=;
	b=D9iVPSLd+j06Yd0/t00IkxmGUVjt+vjoa66BjycbvkQcq+jtpBLFrQcXg6jtiEkNx3yGam
	8arpx8/ac1JvYsFdmPye8KF+SfdlkNEcq/LnlNTfuIrcPSoFhoNFJRJrpKhB3ph8j9SFiy
	9XTosxf97F57/IoxsJ7x4xyg5hrmDD8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-LIO6ncdUMgCQ-htHt39TMw-1; Mon, 30 Jun 2025 09:01:22 -0400
X-MC-Unique: LIO6ncdUMgCQ-htHt39TMw-1
X-Mimecast-MFC-AGG-ID: LIO6ncdUMgCQ-htHt39TMw_1751288480
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-453691d0a1dso11776605e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288480; x=1751893280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqdlPSrzqUfx0/Anfl8VFepfeUNo5Gqwl7mCFswBHro=;
        b=gziFMfyeKAvTTboksOLm7QGrQd6Rfjm9siFR6uMMaLvWQYAiuxfrU0X1tlrAoe8OzP
         p8lXJtYCqDGSZEIDssGAHiI4CqK95ce4qopb4nVpvyh4+9kteRutq4qhoqp3hc4GubKD
         dh9giMmarKrjAWeAHyf4/byoxsAdo5+hkdnCmXwNpLvLhHqMf2B2P74glDj1oo5r7Uor
         iuz7n0gH6Fya+VaMcb0zobBcWV0XyEdaJgzuM/UpE4DKdw8CTVuHTAogxEnwRQAtfrmM
         QYJa+jMzL7Y9wfmUYUo+EGls9h4zvtOUrjGuN6JerZMFqLKN7HKDsVDHqhINK+e2GiWu
         1TkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfOjpA8kHg9Dl3FhLnH6j4Uq+EaciggcGmpO9ZbxoU1holAWXX1Rt4bohYiZR3Zn6S3bdWHLaj4LIPgOA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxGZaSrj5ndnqwBrpXJ+ZPV0NwLDTreM8s0QsCk3qVizkuKKF03
	wwE4ITF8MnuRwhrW9dH24YfiSWUc5oxkO8Ixk423rDHUE8WdBWZxPU70dilt0opG6x4yp66PgFT
	aD9L6FNI5gZBTzjZSDp7Y7z7Lf8vVrK3ZdATwmBFcGABqr410eTQiukDkFaH9iuAlhOU=
X-Gm-Gg: ASbGncvMFsjatyn1Nn19+8sSezcVwZH3qUvNoq73O1ngzh+OPfT3if9D+woALsVT3zm
	L+Z7nkv+NtncyJ4kumQMBWR3IWEocrsSC5LNU7Nn+Ya/qNa3cUm35dgyVNEAJTt6+TFrnxo7J+0
	SMb1CXkcCSgTBSW4h7xatEFwysevJ9xe60qhwXcBO0Esm2uLLqe22zq+/y8qkWWBAO4euJpfUMz
	ccJu87maCIe46vaMNdoSZeAzaXwrixV5OZ+rBhd5ypT2kDWoYL8q142Qrp1C7D11LV7LoNmjPh4
	mwZDls8X8rZ5xVflGybdKnh05v4w1h1o/KEewYPlAvlDQ/QBZF4flIFJmqM9S6jdGcDcyz2+BFv
	jWZIaQDo=
X-Received: by 2002:a05:600c:190b:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-4538ee4fd6cmr142842345e9.4.1751288478992;
        Mon, 30 Jun 2025 06:01:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIe1HafHWQMdBGxTE/8gmXCwDECQtvb4nkW8MYtHAgLmX5UxDUSKKTFebF7rirr8hhXGCxDA==
X-Received: by 2002:a05:600c:190b:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-4538ee4fd6cmr142840675e9.4.1751288477814;
        Mon, 30 Jun 2025 06:01:17 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e528a9sm10541491f8f.60.2025.06.30.06.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:17 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH v1 22/29] mm/page-flags: rename PAGE_MAPPING_MOVABLE to PAGE_MAPPING_ANON_KSM
Date: Mon, 30 Jun 2025 15:00:03 +0200
Message-ID: <20250630130011.330477-23-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630130011.330477-1-david@redhat.com>
References: <20250630130011.330477-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: DvNLul8rFpW0avbgjdub4TMub92ozd2B-HUWvQCpQoA_1751288480
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

KSM is the only remaining user, let's rename the flag. While at it,
adjust to remaining page -> folio in the doc.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index aa48b05536bca..abed972e902e1 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -697,10 +697,10 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
  * folio->mapping points to its anon_vma, not to a struct address_space;
  * with the PAGE_MAPPING_ANON bit set to distinguish it.  See rmap.h.
  *
- * On an anonymous page in a VM_MERGEABLE area, if CONFIG_KSM is enabled,
- * the PAGE_MAPPING_MOVABLE bit may be set along with the PAGE_MAPPING_ANON
+ * On an anonymous folio in a VM_MERGEABLE area, if CONFIG_KSM is enabled,
+ * the PAGE_MAPPING_ANON_KSM bit may be set along with the PAGE_MAPPING_ANON
  * bit; and then folio->mapping points, not to an anon_vma, but to a private
- * structure which KSM associates with that merged page.  See ksm.h.
+ * structure which KSM associates with that merged folio.  See ksm.h.
  *
  * Please note that, confusingly, "folio_mapping" refers to the inode
  * address_space which maps the folio from disk; whereas "folio_mapped"
@@ -714,9 +714,9 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
  * See mm/slab.h.
  */
 #define PAGE_MAPPING_ANON	0x1
-#define PAGE_MAPPING_MOVABLE	0x2
-#define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
-#define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
+#define PAGE_MAPPING_ANON_KSM	0x2
+#define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
+#define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
 
 static __always_inline bool folio_mapping_flags(const struct folio *folio)
 {
-- 
2.49.0


