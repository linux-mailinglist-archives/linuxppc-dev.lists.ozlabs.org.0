Return-Path: <linuxppc-dev+bounces-10100-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B33A4AF901A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:27:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVCk6kJcz2xd3;
	Fri,  4 Jul 2025 20:26:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624770;
	cv=none; b=PZHHiKXYfh0Mk3SD1WTIa3ot/OM15LiprU1x0eV2c8BEV4ermdyf16PwAyAUMgm04UDky04BVon4RD8z9Lnn944dvwXMtG5uPb1kw7X/p7St5dNxn1wypftWqk9QiNjv0WabOl3RCKh13a1zbzHF4p00lzLQAA837BdpuRc8rcRxc+samrvugSZNZy9D+GRG/9sct5/b26Ji3jK9xPc9jje/sOLzMZbMRGT5UXdz+WZDUNBpfTZXVICh55Z16JHBmUvPYF6txNrGfVgsftfqWltmKkxe16FrfYSbIJw0doUB6zVNCLInDeTiljFc8fKHGlLkN9iriiMsHBk1a1lLEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624770; c=relaxed/relaxed;
	bh=eEGwdfNaBPNS/8dJw0FmIxAN0KCCoCPylWzGW8IBtSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ZzayQ2MtFqD+vrg6su5XMqy3Q3uSjhfQN+dqwIq/CMRPPPWB0HklWeQwZMoprS4idpO63gz8nPLblIUVMG2wPFi+9Lqfe97JOR5hq/KiYn2uHmXQ9ddgkNYAH958WE2VmBPCtSHeoz3OwNg+rv/hi49XtQw0G5EV1d30Yck4NJvMw/7LJF8rp31mXsModSIQ8PzkmjYWP7ghLCOVrI0KVLseK4BS0BgdVuLTz+tvfg/scadtCFbyvKTCpldKGXYDIZRLJw1B7oRhvmPMAVOKtGcVO6ubZWLtUpfI+EdmipV/WTIaai7AWr6JOtRoYdSfhTGaSauReyRTb6XIDpvrdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HlI7xun0; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a8LgPRb+; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HlI7xun0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a8LgPRb+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVCk12jvz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:26:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eEGwdfNaBPNS/8dJw0FmIxAN0KCCoCPylWzGW8IBtSE=;
	b=HlI7xun0mawzBSNl3QK6T2dwI/1KpawUnQM+0eCf80nB3npenbM1S4JYXiJ5RKmT92Rp57
	NvwKjhGUs2cyXmclA6fueg5rJrV/s4x9m9ptV/qcRoeLnPlRuIPSSOYLeoNl15rw0hg0Ak
	hddWgBRyNMqNNJ6XHFdxnA5TNfp4nFg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eEGwdfNaBPNS/8dJw0FmIxAN0KCCoCPylWzGW8IBtSE=;
	b=a8LgPRb+W/5+LAs3idJMHiyQFqQR2qt9/s4vQAUbWHWUZN7R6VEjic+YVSMHCu5nWFBY4/
	gc5rfIcppG+iIZcYYbyi84OqqdPEoHadqyaIe/CRb0QfIWZzD5VKrm8WjYDItb4BJZIlNw
	rpwIq+Gq9CynulUJVljiJph8dF1Laz4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-HwxAfUmuOLyiKMbcOaiZGQ-1; Fri, 04 Jul 2025 06:26:04 -0400
X-MC-Unique: HwxAfUmuOLyiKMbcOaiZGQ-1
X-Mimecast-MFC-AGG-ID: HwxAfUmuOLyiKMbcOaiZGQ_1751624763
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4530ec2c87cso6378475e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624763; x=1752229563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEGwdfNaBPNS/8dJw0FmIxAN0KCCoCPylWzGW8IBtSE=;
        b=vaYrxuIybruRcI0fgCpEQDKpYjgpMyTtBLHCaoRbH2vNpaT/C2UOaxtdAu6u0dfm6m
         FpbamKfGG1kZGGKswHqNnA45BHmydNqjfOJe74VVQwKrYulWOcX1aM5nQZzZj0NVnllb
         Utn5m3lswV5DZ4vuyAEIdq3XjjR63arlphcDrUkiGJtA6GccR5FLTuHhAy3rW5fw2IEg
         TUVqJ+U6fTkJp7SVIYG2NBjdi25AaG073LAGZSvf6rQA74QZaVjC6jf8xVm+ft3NV2RH
         Cwi57oRHbFd45BeZwi+n/RYxQRGpZkNhlhtedHJBZzYuIMWxSNeF1CNCzAVucH+p2FmK
         9N/w==
X-Forwarded-Encrypted: i=1; AJvYcCWhQgKfBVTKk8jUP9Luqn/73PDR3ZPNAUc1T2IXTRgrwEg624zuXElMBW9Heje4scA9OqhiiNSd/tYWC8w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw8LM7oY0kXACSgEZNtLecPspOyhecktkHsbBFrJOcVMdKEVDU/
	wS9P6jg4irGuEjFmoZ4+BbF9JbPX8Y+OfqfDcR6GhPIKPgCp++GXpA5pThUMXbxYkYy3AsQG8EL
	1Fp9kAv+cYpWWV8v4ry0GnTtZa6cckof3D3ZYK4Uc4tGWCEBN1LxkBYb/boamEsqo+lY=
X-Gm-Gg: ASbGnct00CHASTaHcGIvozzDaARooi/b3GBAQw7Kaz46iq8ja3LSY6rYuKyhsAF2272
	wr5+BIxl8+sBY17irGtapJWSbQAGPnvlRQgpVdawFpd6dTUwUOoxShvaWCyv8k4WS8RvAlfEe76
	Ckra/E2+HSCsG+kOcjboNHbeMbekHWacduqQgGT9I3ptIT6AnIEAT0lo552MxTRd5ZxMR2mjQkq
	swnvsGD7ay4l6k46cpSt7Uk+PVkgrUqiZt+L9hnAZUTieDFVyqsaawmcI/Rj4F6sEko0cBUxITb
	f+jiYkMGJBIbwhfQ1Kow06ge3bvq3yv6kjXaar6zqO0qB3WRM7RHnt3DwTbbtD54iMElFdxaY2e
	kQrMW0w==
X-Received: by 2002:a05:600c:6488:b0:441:d437:e3b8 with SMTP id 5b1f17b1804b1-454b30fd93dmr18454785e9.23.1751624763361;
        Fri, 04 Jul 2025 03:26:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaIuaoI26pT9FgBV1ege1h6FCnLUNFU1vB3jXtS4mgBNx0jG0s+pACxWtozwax9rYlgVZB5g==
X-Received: by 2002:a05:600c:6488:b0:441:d437:e3b8 with SMTP id 5b1f17b1804b1-454b30fd93dmr18454285e9.23.1751624762724;
        Fri, 04 Jul 2025 03:26:02 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a9bde3b9sm52654415e9.28.2025.07.04.03.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:02 -0700 (PDT)
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
Subject: [PATCH v2 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Date: Fri,  4 Jul 2025 12:25:06 +0200
Message-ID: <20250704102524.326966-13-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 24VI7aZJhohTgeylayAUXHRb30IWRd7SI7OFKLBMb-0_1751624763
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Instead, let's check in the callbacks if the page was already destroyed,
which can be checked by looking at zpdesc->zspage (see reset_zpdesc()).

If we detect that the page was destroyed:

(1) Fail isolation, just like the migration core would

(2) Fake migration success just like the migration core would

In the putback case there is nothing to do, as we don't do anything just
like the migration core would do.

In the future, we should look into not letting these pages get destroyed
while they are isolated -- and instead delaying that to the
putback/migration call. Add a TODO for that.

Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/zsmalloc.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 626f09fb27138..b12250e219bb7 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -877,7 +877,6 @@ static void reset_zpdesc(struct zpdesc *zpdesc)
 {
 	struct page *page = zpdesc_page(zpdesc);
 
-	__ClearPageMovable(page);
 	ClearPagePrivate(page);
 	zpdesc->zspage = NULL;
 	zpdesc->next = NULL;
@@ -1716,10 +1715,11 @@ static void replace_sub_page(struct size_class *class, struct zspage *zspage,
 static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
 {
 	/*
-	 * Page is locked so zspage couldn't be destroyed. For detail, look at
-	 * lock_zspage in free_zspage.
+	 * Page is locked so zspage can't be destroyed concurrently
+	 * (see free_zspage()). But if the page was already destroyed
+	 * (see reset_zpdesc()), refuse isolation here.
 	 */
-	return true;
+	return page_zpdesc(page)->zspage;
 }
 
 static int zs_page_migrate(struct page *newpage, struct page *page,
@@ -1737,6 +1737,16 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	unsigned long old_obj, new_obj;
 	unsigned int obj_idx;
 
+	/*
+	 * TODO: nothing prevents a zspage from getting destroyed while
+	 * it is isolated for migration, as the page lock is temporarily
+	 * dropped after zs_page_isolate() succeeded: we should rework that
+	 * and defer destroying such pages once they are un-isolated (putback)
+	 * instead.
+	 */
+	if (!zpdesc->zspage)
+		return MIGRATEPAGE_SUCCESS;
+
 	/* The page is locked, so this pointer must remain valid */
 	zspage = get_zspage(zpdesc);
 	pool = zspage->pool;
-- 
2.49.0


