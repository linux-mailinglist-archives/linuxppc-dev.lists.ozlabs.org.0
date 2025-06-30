Return-Path: <linuxppc-dev+bounces-9898-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0268AAEDDF4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:02:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5rS6wDyz3bkg;
	Mon, 30 Jun 2025 23:01:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288472;
	cv=none; b=clbCP13DnQ4VHFPpCRLRatxt2KKUdCw79ZpTUMaejAvtcVFC2VRSCHAaLmw87xSy7GtEPMO/Vx/6iFzrFhzMe9QWFEP42okfpE6XYdIZgm/dqWGlJwchzo6olg+uNCh4Qqocq1tqiNfymBYDFJDqcWSnElyx0PmyPzAeyyE49RUQCXuGT41kPgKqRwN550RSDNoglbKrTkVybA4m4111W+pXI6BYHqLQ/FGWyzOZNpIaYeFaa9iY1mM0FfqGqT74+ZS8hnkqUoRjWHo6Vxi1vD5j9B4fzNbydmkv2sJL5nuwTR90btJsiDdPugb8Fb6Z5s2XOGHRdBaIQ5sgiF5ZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288472; c=relaxed/relaxed;
	bh=IIzDkBhnyPsIOakhHuAsjx3fJM8m9J+HURfbhEZ1A0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=b5wiGmTCLSxLJdNDCH64YJqyWgKp58AxawUyQQ47jiWUZEAdfDkbGr4OHUbkA3p77kKb2+Gvi+P56z/e3wUP3XkFRQUM5NrZO59QeEdI2WmvYsj0zpBw1sEZEkkjvyhlFeEa5zhF6ASBqlBczWlaONU+V5c/qQPrYPj+tf5Ej0U9wspKK3K0Ae0swlxuXHOKiS6iFdwi/AI9X3lkK2CnHJQdGQbEDIdFZ7W8rJ5cB+eg9JqMJKva5HIbRNDYu3yDVGtTLBJq40UcouOhcqoIpAcKXn7NSh0Gwvtmk703WfyBX6E9ukL7hlsWIx+a+mg8j9/XL3VIVVWI2gAsES5dQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YlkILxv1; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YlkILxv1; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YlkILxv1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YlkILxv1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5rR63y2z3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:01:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IIzDkBhnyPsIOakhHuAsjx3fJM8m9J+HURfbhEZ1A0M=;
	b=YlkILxv1TA3S4L9cOKxG5jk6ooVF+9qsFEzXlkkNDbpXGerPQAvdpUnKqXaBa58gpoS3ZB
	++oc7d+7uenv4gjN9ubUSJWDNCesT/6LB2d3J/cLKqLIZPt398j30eLBqSM1GVbBHKQfO7
	/bhkiltkkQLlS1sjJIS+WspOftPsUfQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IIzDkBhnyPsIOakhHuAsjx3fJM8m9J+HURfbhEZ1A0M=;
	b=YlkILxv1TA3S4L9cOKxG5jk6ooVF+9qsFEzXlkkNDbpXGerPQAvdpUnKqXaBa58gpoS3ZB
	++oc7d+7uenv4gjN9ubUSJWDNCesT/6LB2d3J/cLKqLIZPt398j30eLBqSM1GVbBHKQfO7
	/bhkiltkkQLlS1sjJIS+WspOftPsUfQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-ql9365-vMP-PUWtsiqILhg-1; Mon, 30 Jun 2025 09:01:06 -0400
X-MC-Unique: ql9365-vMP-PUWtsiqILhg-1
X-Mimecast-MFC-AGG-ID: ql9365-vMP-PUWtsiqILhg_1751288464
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451deff247cso25982525e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288464; x=1751893264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIzDkBhnyPsIOakhHuAsjx3fJM8m9J+HURfbhEZ1A0M=;
        b=jUxMioE7egtAzY7VU+nKQTaSO4OKe/0zQo0Z4RnTfMPSwrzdSQY9owDIhBoJt9yVxo
         iBmCNIzwClsGqcY2Qjdt6kojBgE/IGutdjIo+GxpIWT0dDdE2qaeiLrw1BwsJka+iJlq
         W1gdSw1WBljS/OigmzdsSamoXIv3MA6P+p4mzGFzZs2YBXimDHPG0w/v62AsBE+/vCPa
         IofgoORL72rgZYatxjlvFz6cmSliifC7UjOS8zV/TVEDoPXetBvf6hIVMXw+tYzl07CF
         TbAw9Nu2CcWY1ZbwwCLxH+w5/CxvmaEbw2tKXv1qHrXXV+IKVUc5qisAvnWVNUVES68z
         2Rog==
X-Forwarded-Encrypted: i=1; AJvYcCXkleMUXcEdqfLAqwZ5PXASjXcwAU1QYUY4c5rtIo5R5BUeVuGn2Ks+trXpPNTtveJLYxFd0d+o+ZjiuXg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzIo05yCZXo3r2cVQj2l5RkLi+0oM8Ey0By6gpWhDasIBQ2HWH3
	RJSlR0r/NfW/N/9KMsm0mzzmhrg+PhXfEhISiCFd/Lgb7DXq5H2vvAV03utnZ/5ga/7xgqGHuWO
	tivDQJq6P3prknwXp2zqrDhYmpHPdohMP8QxeRVhBtA1nhtg2Mqb+pkGnnUN46bV5ioHyRWs8a1
	hHIA==
X-Gm-Gg: ASbGncs2QezW/luUlonWr3Vt6cn0DtnzRWs6u/UP9vehSaaOE1d84BlH89X4ylVLrBD
	VCliRU3jSMcAw9G4M1K6+CDqBXk01hozKzFBTMrMS7HzYm+NiDARGwantqfsixRNjaxJy8M8vg/
	Nnz7UFB0EDnUlNgQmJBzVqvwGV2D/EwmQr5XCOZi2vk3mY/uV+PtltAvt8/04JN+fTcDbM3CfA3
	3KGvLgu5da0ZQEB4xq0WxwKl5kZyGleb/0HsWv9ngw8VMvyXqjo2GaeevgDXQQyPok4q6jWWFwG
	gTCgb68dP7LlORK3cL/QPxVDU6bgPw+Bg8zoAp1freS8POoAhFcO6ld1aRfN3Z9v/gDXH+B6t0R
	xqyetYvQ=
X-Received: by 2002:a05:600c:1994:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-4538f309394mr135240625e9.14.1751288463659;
        Mon, 30 Jun 2025 06:01:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7zExQWNaFUjIE00JTRK6K+i5BO8qjO8BpI1TRkHw1kVlVhDi4cL0K0LNLq7UFrw8vD2WvGA==
X-Received: by 2002:a05:600c:1994:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-4538f309394mr135239205e9.14.1751288462959;
        Mon, 30 Jun 2025 06:01:02 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823ad247sm170241515e9.26.2025.06.30.06.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:02 -0700 (PDT)
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
Subject: [PATCH v1 17/29] mm/page_isolation: drop __folio_test_movable() check for large folios
Date: Mon, 30 Jun 2025 14:59:58 +0200
Message-ID: <20250630130011.330477-18-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: -gD-V7Cv_MZgvquR2QVy5_7lwpI5jVTXMcTlTphYUrk_1751288464
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Currently, we only support migration of individual movable_ops pages, so
we can not run into that.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_isolation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index b97b965b3ed01..f72b6cd38b958 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -92,7 +92,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 				h = size_to_hstate(folio_size(folio));
 				if (h && !hugepage_migration_supported(h))
 					return page;
-			} else if (!folio_test_lru(folio) && !__folio_test_movable(folio)) {
+			} else if (!folio_test_lru(folio)) {
 				return page;
 			}
 
-- 
2.49.0


