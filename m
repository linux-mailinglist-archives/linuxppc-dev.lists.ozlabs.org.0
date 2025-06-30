Return-Path: <linuxppc-dev+bounces-9885-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C0DAEDDCF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:01:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5qj0n1Mz30HB;
	Mon, 30 Jun 2025 23:00:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288433;
	cv=none; b=QkIdkds0x5K3DAL4ojwrnCKOWy1Jr4E2Xko8y+rpPXw9hiKUTSdKqAD4wh+1w16vn5i6m++hUIuUdBu34y/0PlG6IOLX3KDtUSzutt1IxrSwvwu+XuflUShFdZsg9NaL0LL4y4Cu2S/rx7qsAruLejZCxOeXIqlH0QaXPUmP/TU4yk/65lAVvS8GFHDNYc9c8WL7LGjeFWnrHUQjBI6x6jEzCoOklcRoEg/xJzHizxzEoYlVmqky7bWD5Zbx80nmDwx/2yEvsyaETXvHAQ8lQt1feC/w1v4VMAsOHeEWZs5NitZGw5gNx+fgKmnvCMo2Tt8Gk2JnQMdFbRpfDB8yFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288433; c=relaxed/relaxed;
	bh=/UC4605AtCeOAEiQnGvC6ua/uaOm0pT0/PRnxSFzekI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=SADF4QSI/bGOXcSvnWDan2cAp4ggkGNkvxstpTCqP6RTQm654dRjog5YXPMIDLt2bG/9LuJe2+YaSyCfMn3ke4ruIUdJdo+NnjEb8/0p8FnGZ92SVWEglQuDAH0uI6PxSH8Dgltmho7mt6USD4ksuVJoM1RuHO7GGK+BRYwFI4DUQMY1FqqdSSgAsIgY93MZY/v+hjXdXFtpMo4C48Lede/KBb+kVvNiLa6MrvH788oOwDG2gRPN48vXjUfTef6CEMboCRiVuad4PM/JcMlyuGDx4CIxl97KVsZYvzSUg9Doep8Mg3Oerfq8a24bpFPiznFAu2YEO61BZm1dGijgHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f9dGJ9xl; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RdD9FaDW; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f9dGJ9xl;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RdD9FaDW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5qh1ShMz3069
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:00:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/UC4605AtCeOAEiQnGvC6ua/uaOm0pT0/PRnxSFzekI=;
	b=f9dGJ9xlRzFd2TbrQgEjI6E6dK86LBLjR70T6rQtTGAK7zY7veH1d0vMJPPS2P8I6v/2Ej
	vsRfThoeWm65tmQyZA2OtrlaKjk/mneYDb9OZVqF+AuZVSNfqtX4MPZuLv5H2lVENuhfBA
	zDbisBNdNFCWCPODpSgf5cH08lEH1XQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/UC4605AtCeOAEiQnGvC6ua/uaOm0pT0/PRnxSFzekI=;
	b=RdD9FaDWEupN8NrWnDictv92G6/uQp+Ym1lw205BEHINEPrl+KhgNgJz3C9JabMk6D5EJx
	hnxJPaOz0kTCwzGIBIfVTIjLt+JwUhbdq3irl/JbDJ3cZ3dsEasUeaqM2eIyRWynAcxIFW
	1rECvtRp5d86UmFUc2spvpaVj2lNx+g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-x_vW8GkqMf2yi624_CkzOA-1; Mon, 30 Jun 2025 09:00:25 -0400
X-MC-Unique: x_vW8GkqMf2yi624_CkzOA-1
X-Mimecast-MFC-AGG-ID: x_vW8GkqMf2yi624_CkzOA_1751288424
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso12661225e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288424; x=1751893224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UC4605AtCeOAEiQnGvC6ua/uaOm0pT0/PRnxSFzekI=;
        b=pTXGsUJvpdQszuWqKd1SReWH7i1aJycEqMWHBUypVT4YZhCvNIHn6d6/6rPfpgfHSE
         1q0nYgBKWWYOmuCaEydoNLHF8meIT4qGbvy1Cyxao63y/x/yqPJm+C3f+YuqX58tsD6L
         N7zATL2egMpjB20fMJxE2YLVnsf8Ny7ZU7/DZ8PiPrZ2W8gFcvt/MHw9n+qiVq7KI/QY
         9ATAcLds2yZ8wtEy5VHyVl7UF4Ioesz5M8no1QNKAxPj+mGMlye1Be0VDpHURG9Pv0c8
         a3LBuU8VE/M/JoTrSwcR4msWNzb5S1WobHU6L8IIAgbO5wWqzzu3eHVDO35h6pi2BpFJ
         P7zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN5ixiakUKnJvEmLVW9qabauwt5gH/bflQbY/ZJl5rFem2KbGlCrTqwGVdVqKsl7WLgOBuPCtXOPQlrPQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy7q9uuOY3LHzdAaw2ijfxcxAZv0QrbK7MgPQYCH/cpvp4IFSqf
	7p5zuH+SaLQnttJuS/msE30QcS+a38dOZ1ZiW22wtF2haqSZqpHeUVkd41Bpan4IGjA3zQu8H0C
	Ru/W7TPi4RO7my0QHjbR/t3OGXgK2gOMsEQazBBIAAIVCbkA1EVIhMo95+EQua8ZYnYI=
X-Gm-Gg: ASbGncvgjrlS0bIWUvJZtReBGOJ/VLOPdPFYwmaVIWMLI6C9ugey03wB0kykNXkF7nc
	IdK6M6VvQy849XE4QTW4sAxK8+0684BjV07rQcU/o1DM///CsPsHlrETObjkmuBpAWiXwZTt0/M
	QzppmYYj5nfDA9nsKtT9ekYASP7zEWTfvHHQPD5P81IlvS1x2MbGFhi0HZLz19qAdoTA0b/eKeV
	Dlykm5+jFEG0WZbByhHBcIum+Y2x9+l+eO+T4jwoR24zNOCOWfgyw6GFzwOe8i9RhWd0YtpmcTJ
	ajZQqV/j8y15hx+hJE/f6ZsYLrMB/k0/TpchuzzPQaZlbTDo//ydpm+YO3g08u4lzisUSj8Gyvw
	3ty8C0YA=
X-Received: by 2002:a05:6000:1786:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3a8f577fdf7mr11727512f8f.1.1751288423726;
        Mon, 30 Jun 2025 06:00:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLO9PGgybCCYgBv54Fac4lQzN8FKYTlkGjVWntSI86PNTFg8laDwfPxXxOTUUP76xSqnQLIw==
X-Received: by 2002:a05:6000:1786:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3a8f577fdf7mr11727461f8f.1.1751288423060;
        Mon, 30 Jun 2025 06:00:23 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e595c6sm10642847f8f.66.2025.06.30.06.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:22 -0700 (PDT)
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
Subject: [PATCH v1 03/29] mm/zsmalloc: drop PageIsolated() related VM_BUG_ONs
Date: Mon, 30 Jun 2025 14:59:44 +0200
Message-ID: <20250630130011.330477-4-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 2kP9VZfTRhsdD8VSqUofwzz2NfTBEefwYA8aRTKlm54_1751288424
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's drop these checks; these are conditions the core migration code
must make sure will hold either way, no need to double check.

Acked-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/zpdesc.h   | 5 -----
 mm/zsmalloc.c | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/mm/zpdesc.h b/mm/zpdesc.h
index d3df316e5bb7b..5cb7e3de43952 100644
--- a/mm/zpdesc.h
+++ b/mm/zpdesc.h
@@ -168,11 +168,6 @@ static inline void __zpdesc_clear_zsmalloc(struct zpdesc *zpdesc)
 	__ClearPageZsmalloc(zpdesc_page(zpdesc));
 }
 
-static inline bool zpdesc_is_isolated(struct zpdesc *zpdesc)
-{
-	return PageIsolated(zpdesc_page(zpdesc));
-}
-
 static inline struct zone *zpdesc_zone(struct zpdesc *zpdesc)
 {
 	return page_zone(zpdesc_page(zpdesc));
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 999b513c7fdff..7f1431f2be98f 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1719,8 +1719,6 @@ static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
 	 * Page is locked so zspage couldn't be destroyed. For detail, look at
 	 * lock_zspage in free_zspage.
 	 */
-	VM_BUG_ON_PAGE(PageIsolated(page), page);
-
 	return true;
 }
 
@@ -1739,8 +1737,6 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	unsigned long old_obj, new_obj;
 	unsigned int obj_idx;
 
-	VM_BUG_ON_PAGE(!zpdesc_is_isolated(zpdesc), zpdesc_page(zpdesc));
-
 	/* The page is locked, so this pointer must remain valid */
 	zspage = get_zspage(zpdesc);
 	pool = zspage->pool;
@@ -1811,7 +1807,6 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 
 static void zs_page_putback(struct page *page)
 {
-	VM_BUG_ON_PAGE(!PageIsolated(page), page);
 }
 
 static const struct movable_operations zsmalloc_mops = {
-- 
2.49.0


