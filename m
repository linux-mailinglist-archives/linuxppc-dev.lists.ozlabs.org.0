Return-Path: <linuxppc-dev+bounces-10101-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8849AF901C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:27:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVCn3bWYz3bb2;
	Fri,  4 Jul 2025 20:26:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624773;
	cv=none; b=EzKEw1M9EjmpshmQMNJ7pDw7n1op7S0mW06mPi+qztwYaz14s4yxRmISh/zoBx7LgYSHpAwWeoWiedFFqn4xcLGTtRLYwkvoa7l2QoarjEIaOetSq7lAcEQLaDqte38yp/0jChDuhEnMHiV/OMxFf0KoAJNE5u13Kpso4QIvZwyxk/uRZGsB+4OGn7JsK6CAgRc6SkRTsTBcn/P6sm9glAjLKqlNuOVHP/BQpUYPn4xlh6d3H4Ed5/GDFcOL2ckm0ZuOrAJxwDJv/O9oEXUwIQs32Qo1/wCpidIcqgB87aucy04OftL+NbTD68dXIRHi9B41ALmyoP7g9OSarRdXDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624773; c=relaxed/relaxed;
	bh=NMn47cTQVrdLq38vaZj//jvNYLvXfWrM/D4yqUNgXk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=KYaNH+JZEVLtWzHysjBKhJhUr1Q26SiJ8oTEJ94/oaEzdavhs0H5HpHQjWTjdM3yaBZhLIjGBLZsfqmlcb/zzs2VSZwZlf6agnBAi8Td+R+xei6uG08lgJ/H1n118toh4JytWkgIr24YSjjeTSXVwsVuiq7FLidXK+x3Lii/cZPXsiQdGoxEMASgDJQ0GIjWr+i+i9wjggZMFcG620A/1vFJXLMq16Sz5VMlXMNLgqCxG+lKPJHD0hbGbBoiKBUCtVJoFhfTCPm9haDKtAp+oZwPyXetpff3eGVlmWQ6vtpdEFMlROu873XYG1JtFzDdYqp1uhljkh9OIttmr736ug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aBmRLpkp; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aBmRLpkp; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aBmRLpkp;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aBmRLpkp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVCm5dfkz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:26:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NMn47cTQVrdLq38vaZj//jvNYLvXfWrM/D4yqUNgXk8=;
	b=aBmRLpkpqpQ3nZH2BwqHlXEn6Jagu2vAetOtTcqRLix2+OoLWmreQ495trFVLSE8JDMcBP
	aYzdxyrUU/Jki45j4WlRE/xgYY3E5hdetxpFSktXW/161Lc1CXyf41CT7d2qcWA4R8N+xF
	Ssd3GSE+NSJK6uG9DfP83ShPifoMP00=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NMn47cTQVrdLq38vaZj//jvNYLvXfWrM/D4yqUNgXk8=;
	b=aBmRLpkpqpQ3nZH2BwqHlXEn6Jagu2vAetOtTcqRLix2+OoLWmreQ495trFVLSE8JDMcBP
	aYzdxyrUU/Jki45j4WlRE/xgYY3E5hdetxpFSktXW/161Lc1CXyf41CT7d2qcWA4R8N+xF
	Ssd3GSE+NSJK6uG9DfP83ShPifoMP00=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-Z_b4G07xMR-icBceoVNwqw-1; Fri, 04 Jul 2025 06:26:07 -0400
X-MC-Unique: Z_b4G07xMR-icBceoVNwqw-1
X-Mimecast-MFC-AGG-ID: Z_b4G07xMR-icBceoVNwqw_1751624766
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4535ee06160so6599125e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624766; x=1752229566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMn47cTQVrdLq38vaZj//jvNYLvXfWrM/D4yqUNgXk8=;
        b=BH+UO8gVh+N4M5U3E/g5obaf7WRBE2ub4+LSMI1C1RstjthRRa4Ycg2kJmI6XSN22D
         LyR+TFADPiDI18mNjWkkK75WZeRIqAwb7zshSb2kbGFdCN1EfAFHHgO4lfFuBPFN+aYN
         wjPwPCC0aSaMLq5emorTvBOnJ/rJA3nySlvH2iWO12F+Seqmt43XoeIVGJrjKcUkxTj3
         BPmyFXjobXoBXYTQuUjVLD5mKaKusDjY8oj2xFztzCRicUsDwnY6U99ZDEyFBXS2pGtb
         NJ5xlk+q12SJF4RY027tS+Ec9SR8dhSP/agkrOxJwUwL5DAJMipy3Z2z6QE5/9U9tzXu
         r28w==
X-Forwarded-Encrypted: i=1; AJvYcCUk/guaZxEPHQX6Ugus6hE1I6lyantrtcyWuV5DKvy3yAxrOmE22uITbaa3mgIbfyVG9XjH6wt89qGJf5E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwSYhtdYnOLqzujnPSrquEisu2clZihvirIsWbJtEXu0IhZBUns
	VvP7NVQsBhz/blcfbdFO4lZkVfyiGMobkH0JVtict+82RdJZiwqRkDs9VxUW5k/icJZnJE2z0o+
	o2CcL8Vrh/vH14edUiStgvimDhLUgk5ST7/kfgsc/uBy9//Hy0Cv3ZVtpb3Yq+y10fEg=
X-Gm-Gg: ASbGncs/2qXUKFtZJ12gnrR9plHZpjXC8rusD2zhTsqDhxtpxs+LiSS++iGb4hK1NA3
	DKUdufo4kKp20uYcdxPJyGeHyLOoRxo1vuXKvKwKGk7VNDjDYftRvaQDFbfdF0pRVopN8fxa+fZ
	HEl5FAj90PjjJH12H73XMJiC2cbJlT3JckDZwcaSBPR47Z8CNUsEASHg8v+WCVAR5ubjYFpMECY
	G6T7wG0Jb5Cj1zgsapQDcFDAsYRWM0xcVy3A0qv2kvI70NJRRE+y1V9aZx/KMAL7Z6mV3vZjCwb
	3QuMB9GIs5vyMq7e/khbuT/7wF8J8QLVNGoj/0hGfFyorbCeGCAKRFFL/4yIsPmK7eE3q8T9ULg
	jDgKHiw==
X-Received: by 2002:a05:600c:34d2:b0:441:b3eb:574e with SMTP id 5b1f17b1804b1-454b306a0efmr19575555e9.5.1751624765948;
        Fri, 04 Jul 2025 03:26:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOOTyF2MeOIC1dyzcwecIwxCxQh4QIfn5IAcyJ3Cqp147OZBgMH5DYs267rEpv1i04qDIM8Q==
X-Received: by 2002:a05:600c:34d2:b0:441:b3eb:574e with SMTP id 5b1f17b1804b1-454b306a0efmr19575125e9.5.1751624765503;
        Fri, 04 Jul 2025 03:26:05 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454b1628ff9sm22617005e9.11.2025.07.04.03.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:05 -0700 (PDT)
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
Subject: [PATCH v2 13/29] mm/balloon_compaction: stop using __ClearPageMovable()
Date: Fri,  4 Jul 2025 12:25:07 +0200
Message-ID: <20250704102524.326966-14-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704102524.326966-1-david@redhat.com>
References: <20250704102524.326966-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 9xw-0I4LKmqJ6zwjFHOqSnu2titFd3GMZH7sw8BoypU_1751624766
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

We can just look at the balloon device (stored in page->private), to see
if the page is still part of the balloon.

As isolated balloon pages cannot get released (they are taken off the
balloon list while isolated), we don't have to worry about this case in
the putback and migration callback. Add a WARN_ON_ONCE for now.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h |  4 +---
 mm/balloon_compaction.c            | 11 +++++++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index bfc6e50bd004b..9bce8e9f5018c 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -136,10 +136,8 @@ static inline gfp_t balloon_mapping_gfp_mask(void)
  */
 static inline void balloon_page_finalize(struct page *page)
 {
-	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
-		__ClearPageMovable(page);
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
 		set_page_private(page, 0);
-	}
 	/* PageOffline is sticky until the page is freed to the buddy. */
 }
 
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index ec176bdb8a78b..e4f1a122d786b 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -206,6 +206,9 @@ static bool balloon_page_isolate(struct page *page, isolate_mode_t mode)
 	struct balloon_dev_info *b_dev_info = balloon_page_device(page);
 	unsigned long flags;
 
+	if (!b_dev_info)
+		return false;
+
 	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
 	list_del(&page->lru);
 	b_dev_info->isolated_pages++;
@@ -219,6 +222,10 @@ static void balloon_page_putback(struct page *page)
 	struct balloon_dev_info *b_dev_info = balloon_page_device(page);
 	unsigned long flags;
 
+	/* Isolated balloon pages cannot get deflated. */
+	if (WARN_ON_ONCE(!b_dev_info))
+		return;
+
 	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
 	list_add(&page->lru, &b_dev_info->pages);
 	b_dev_info->isolated_pages--;
@@ -234,6 +241,10 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
 	VM_BUG_ON_PAGE(!PageLocked(newpage), newpage);
 
+	/* Isolated balloon pages cannot get deflated. */
+	if (WARN_ON_ONCE(!balloon))
+		return -EAGAIN;
+
 	return balloon->migratepage(balloon, newpage, page, mode);
 }
 
-- 
2.49.0


