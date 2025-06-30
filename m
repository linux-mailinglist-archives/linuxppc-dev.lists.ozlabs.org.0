Return-Path: <linuxppc-dev+bounces-9886-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A400AEDDD3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:01:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5ql2XD5z30Pn;
	Mon, 30 Jun 2025 23:00:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288435;
	cv=none; b=ljaMaMaVmv99s3PKIpI66pMGysTn/1yxsDBLI9jCkEQ04X+Y/+Kgq3gqAEPOwD8+wVsi4RJ3XE8T2t87p275iIen6qxKxoJ+FzUYJXQvtZ3Ayt+L7lZDEireIfuP4L+PhNiyRI5lNIusc6O0tIK5W5DH4Yr8hJInAUBOc5xQeeD0Efgk0LIF2j04uOjq1K8opzDmN2PndojQSR5nB/AWCR7IP5VkGfpRMOR1T0+A/tL4qLK3xmFiV1R6Jo1GZB8t1hMpFu3dTiXINN7U/TRvhvMOxtSJ0N4op6VBkzwTtSvbIKpazlpaaYjFY8GB4Dwz8qlOITcPTW60Nfy6beKvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288435; c=relaxed/relaxed;
	bh=zonaY4DxD0y8MNMLsQ+Z7vSDV1xV1t770zE0DCe01j4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=jgHsfiUlTPkR7VTXh2l0c2ZoPorhOOgNCby7PJWCT2YSrRc4GKOG4oNmj8ZU48PueFNwin2e0MoXVdO+itpzEuPI2ZE8hnMNJi6CR8bHo7zH/fsFwP2oYFRKQoB54CIBH57uXDvLlzSuX+JxlyqzE/SYa1+uFhcm0Z42E9IeHw8TKsjn4dNU/Ybg1BVez5a98DX7rnFTrFU+qR2onKmIblTRWkpwJI7n04bF3TMN74cDdfzGNT/m353xdozet1qzK8c3E0hFE/QpwLfOK4BfU/voCxYK/HwHqS9bh1T45abt1JbmwSCy+FuFuTpnfOprIZceaBhepgAjjy3cQzYfAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IccAVx8H; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IccAVx8H; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IccAVx8H;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IccAVx8H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5qk3QD6z3069
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:00:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zonaY4DxD0y8MNMLsQ+Z7vSDV1xV1t770zE0DCe01j4=;
	b=IccAVx8Hvd7lPQAssut5bBH1P6N9RTbX9YXmF0zfqgkrtCieY0UzCa4pzU+9T/mBsen9Jq
	u0UHKd4WXiy1iJFxYXG/AMd0BwyyydtUxISu5GWApTSTqHYoLL0jtej4zCWxXwobjbX+uP
	AkanK8lbc5DnjpojqpLNNCWA4ggTCog=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zonaY4DxD0y8MNMLsQ+Z7vSDV1xV1t770zE0DCe01j4=;
	b=IccAVx8Hvd7lPQAssut5bBH1P6N9RTbX9YXmF0zfqgkrtCieY0UzCa4pzU+9T/mBsen9Jq
	u0UHKd4WXiy1iJFxYXG/AMd0BwyyydtUxISu5GWApTSTqHYoLL0jtej4zCWxXwobjbX+uP
	AkanK8lbc5DnjpojqpLNNCWA4ggTCog=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-nHDUTyqsOGq9rxI-EEc6gw-1; Mon, 30 Jun 2025 09:00:30 -0400
X-MC-Unique: nHDUTyqsOGq9rxI-EEc6gw-1
X-Mimecast-MFC-AGG-ID: nHDUTyqsOGq9rxI-EEc6gw_1751288429
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45311704d1fso12780385e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288429; x=1751893229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zonaY4DxD0y8MNMLsQ+Z7vSDV1xV1t770zE0DCe01j4=;
        b=GUqC/hy/YkswREP5LvIcK4HXuqoJ/UjaPyxTlYG+q2cB5G1KqTDy0PR8UC0WdxbW+u
         b8EoZViKF+2VHx2qnCdVu9KXrftGqUihQCxV3JBSGJkP1qH0YYm4WNOBS9oDZh8TdInH
         HGsCFUMsAvHTz9whxi3MNW/8LtfEPVlUlDbAMHawVGDiXlaWosMf1Tlfj+iGuUL21LvU
         3qp4jOrmmkxrei394kitow6KT0H2rBOu8dDhW7ZMfy8muCVNZMRrO4FYKWGJfURpi00d
         j+J6WFvO6lur4DVHCc4H5X8xTiTrIiPgPySsMS+0XIgRaiyBiXkOHqBBpNUkM9/VRpxG
         jCNA==
X-Forwarded-Encrypted: i=1; AJvYcCUWdSMDbq9W0w2UBjE8cDLHw4RI+oKPi71yUcF14B8okVdYpyv+2Rxa/4fus3OqNHQ6PysqGfGL0u/f6Io=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzAOjNqRG+19s+SOf24nJztXzymV/0j0dcMjObF214f4chvaKTg
	mMdvLO82yRH8YYR+UhSlOdWJhacxzHQf4ovwv0BwaaWwXqIYm92Wl2Kwi0NoRCY/coEOlfwOuPN
	UN+V24/PHaArj5m0W2iKVLov0ByYg9OuoO0lOxF8Zc8c80QjwgHg7Dc/kwgZIJOdeGPM=
X-Gm-Gg: ASbGnctcKDsbxBtB4w55dSGvL1whRnslT73sXpf2/yLBTM/K3ztzPINtQWGgOuJbIMO
	amnJES0fDP4NrphPzmi34MFMVaCTuHAghpB+MA8Qxy1d2Yi4jX59FyFnl9TZwLBdlaJ2M62f0Hz
	1IEQgrUo1cXQ1j0DiqCNbRhMjUwF+z0QyOJyrpIWOsxAVlTJKrWj+t4GX8aUnpA3AeGXOfCOwnq
	cAczc1VBO31yvjF7nMOy1pN2NAlwxjBlmugCexq4whck/lVcs8wNWojwJOQvKJEzCACgRswT2NO
	keomowPavDAn/WLpipetZJpR4vDp8ArojVH8CUiG88lD6lpW+STAalg/gwtCguGfWQY1dpu75VV
	f6plee2E=
X-Received: by 2002:a05:600c:3b8e:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-453913c5a63mr120766755e9.14.1751288428788;
        Mon, 30 Jun 2025 06:00:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQsOsTnGBejCVgyOLl0Qh2EVLJQ4G+kbMgNeqpJuJaGM9Kh9Xe41tPUK3+55dbuJ7ci0FJ3Q==
X-Received: by 2002:a05:600c:3b8e:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-453913c5a63mr120766035e9.14.1751288428255;
        Mon, 30 Jun 2025 06:00:28 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823ad0fesm169262535e9.25.2025.06.30.06.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:27 -0700 (PDT)
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
Subject: [PATCH v1 05/29] mm/balloon_compaction: make PageOffline sticky until the page is freed
Date: Mon, 30 Jun 2025 14:59:46 +0200
Message-ID: <20250630130011.330477-6-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: h1lTXQWz1nsDmIEfqsR2jwe794uCDxirFWBEz9NhMOI_1751288429
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let the page freeing code handle clearing the page type.

Acked-by: Zi Yan <ziy@nvidia.com>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index b9f19da37b089..bfc6e50bd004b 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -140,7 +140,7 @@ static inline void balloon_page_finalize(struct page *page)
 		__ClearPageMovable(page);
 		set_page_private(page, 0);
 	}
-	__ClearPageOffline(page);
+	/* PageOffline is sticky until the page is freed to the buddy. */
 }
 
 /*
-- 
2.49.0


