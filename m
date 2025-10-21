Return-Path: <linuxppc-dev+bounces-13090-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1DDBF6961
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 14:59:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crXSZ402jz3069;
	Tue, 21 Oct 2025 23:59:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761051582;
	cv=none; b=gmJg0A1TNJpPGhkrUhTx8g0prEDSQY1DoI+N+uToYjO1638aiX1eu4grjPINgw8Fk2BYCTl6VeWSOu/0GrV65QRf3uVEJOPbZk/y8/mVln4tneVpCITI3y+uJKJ5D24e/p0NV4KUIJgfOjB3xehUHNgu62GFzSgF7mywok5hK42M7qMGRX58WHfE74m8uluQdCec+qYcOwmJSJjHsfla0HzukJ9CpVodIbsGXSZMeblsFa+R3Vh6TXUHhv3wlTYD6IdYW52PQT9C1XsBLtbOdR0XPreK6TFRu14Jh71tMbqMzwVhT2kbAtbnNTgCHoO2wRNNoaof8zYrcjyZ5O4yOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761051582; c=relaxed/relaxed;
	bh=aJ8O3oI3PxPdSYdHMVP+xUJdXO9FbTcv+rg9gD/qHfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=jdTxTvVupPmWNgGv68Mq5EuNmLL6ai/fcfaL6/zn0hiuPR9UNHnhCGL6Nwg5JzgOP5y37VOznlFNt5mmVwkOXQecPHyRRLaPxnlW5seVcx6qEt6K1HEdBvTe++yQSrMIZVan33f/J8oXWtsdc0jp928AaobAFKEJveNWq938UhFG5if7dfcUP26+icfaDSKAoEYeICAKiD68u2zCDewU+0yt7QG8nQxSXmgBLSqrXdpCG8/XNRqFT+FveIOSejE6lr9nTFTbicItaTE3tPstHRUqsPnqxP2hSnIvZDMG17opnOP0yphr4ZH6zjJPSDVkJUNm9OqbuxIap/6pWar7Gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WvCAyCu2; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WvCAyCu2; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WvCAyCu2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WvCAyCu2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crXSY2dFnz2yFq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 23:59:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aJ8O3oI3PxPdSYdHMVP+xUJdXO9FbTcv+rg9gD/qHfE=;
	b=WvCAyCu2B1oAwKJ1eP6FVYWtHDeiVj7d+FCPG5MZDmyglZ1mVAxnJ+fZm2zTpg/opVLIHu
	/gw/4x43FTl0kCVC7ht5JVegOizAL1ZRH7VIfw4X4NHf97TaKuYHKkKfILK71biSO6Tl6G
	D6bOVso8PBOC6mjrdm4q8QKBGldBkBU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aJ8O3oI3PxPdSYdHMVP+xUJdXO9FbTcv+rg9gD/qHfE=;
	b=WvCAyCu2B1oAwKJ1eP6FVYWtHDeiVj7d+FCPG5MZDmyglZ1mVAxnJ+fZm2zTpg/opVLIHu
	/gw/4x43FTl0kCVC7ht5JVegOizAL1ZRH7VIfw4X4NHf97TaKuYHKkKfILK71biSO6Tl6G
	D6bOVso8PBOC6mjrdm4q8QKBGldBkBU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-2K4KM-NTOhyBkjOgBZsEMg-1; Tue, 21 Oct 2025 08:59:36 -0400
X-MC-Unique: 2K4KM-NTOhyBkjOgBZsEMg-1
X-Mimecast-MFC-AGG-ID: 2K4KM-NTOhyBkjOgBZsEMg_1761051575
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46e4cb3e4deso20407385e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 05:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051575; x=1761656375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJ8O3oI3PxPdSYdHMVP+xUJdXO9FbTcv+rg9gD/qHfE=;
        b=iZLQbz3JxpihEVv8Kl1DE9zkx2RxRBc+3hdSrrq0TF60i9OYB8uZHHvGocc+oBfIJn
         qc96/gMQI4AqT9dkq1ntNuYKh2vJfL5es2w4gSg/BFG4uc+IEnc7vSbJoqFdfHlggwy2
         +dGuR45GpuicgPw6rcI3MD2lhfVLxr0drOZpS0w9D4XJMxEqgyleR8D5UcjGLwMxbei/
         D2FUPHywHaRGQGvvbeONPCawpF/Yy0oq4YTwyXHeav/8ML4CVtK6PrCwdj11HgpEvS5w
         YB8DBa1xXNh3QkLCeWhdCnFhZFKkgMDAN7U6gmwD6FBCckSytDYPr1mApXvq3wxl3Bsc
         aj1g==
X-Forwarded-Encrypted: i=1; AJvYcCWLOyAx2jwdDX8P+fPGRdya6a3tSOMpJliOusWwPDQ7cP+YYD2cZZTsOdiAFgkygJy80tzWCHEd8yansSw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx8ckTLluWmbNVZegm4rtL1k8yrZ6EFf7QJJW00CpNYyMDxNfx/
	BHp3O5gz9FwZTDNGmzKPEVXC55WuMsMS+fGk+3Ds1IktYvXALHd4E/TPcmgRibT9cdSnXb/Qr50
	sYdQOlaElTwqtdHj8rDIkvdlvyNU9m8NLs/0e04vRje7Qu2NT4fJLIMeHzNYAdhfmc7Y=
X-Gm-Gg: ASbGnctWDnRkoie8urrJeRwmsIfD80q1PvB3e4RioAPIMAHJWXwM9vscMSW4AJU0Yhz
	Ymz4mg6YG70b7qXrMBhGWAIAzNBFjc0z7cc2nTD5brwo1abO0kCXoeGl3EMIxpvpwhjVp1MZg2D
	MtaEUhB2kQco5wsz5EVsknDOd+Ygd7BjX19/cs3/3Fl3G7CIkVC3QPphVAMXPyCxL9OF/IsibZl
	mAjz8MgNwOyp26vyiZILkkuX6diSSrlKCRziiQiJCI4ALqEIzRkDtb2pUrWw8ogR3xZvrgeI6T5
	1+y/Opn+t8tMA4G/wzLEuU7e7ebKWi6eMub5YbMMTI917g6nw3VNqEFe0Zb3RCORm8jUbO/MIxs
	IAVq9IVGjS61y53D7e5FZQG3FDzQUDXE72Im5uyBQu1Nz6ok2j7AXF4Cd3jss
X-Received: by 2002:a05:6000:2287:b0:425:7e33:b4a9 with SMTP id ffacd0b85a97d-42704a62705mr14069860f8f.0.1761051574826;
        Tue, 21 Oct 2025 05:59:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECa0A/SeCpIiHVmJluGV/YpnUcjGB4T+0tmg/6h2iDdcNEnR83hKR+rxH2jY97xv4J3P/Z8A==
X-Received: by 2002:a05:6000:2287:b0:425:7e33:b4a9 with SMTP id ffacd0b85a97d-42704a62705mr14069824f8f.0.1761051574412;
        Tue, 21 Oct 2025 05:59:34 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00ba01bsm19979250f8f.41.2025.10.21.05.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:33 -0700 (PDT)
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
Subject: [PATCH v1 01/23] vmw_balloon: adjust BALLOON_DEFLATE when deflating while migrating
Date: Tue, 21 Oct 2025 14:59:06 +0200
Message-ID: <20251021125929.377194-2-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: sjnt2Hpded_mVNHsM5z1CvtLG-LUpTkcmdBc2jz70Rk_1761051575
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When we're effectively deflating the balloon while migrating a page
because inflating the new page failed, we're not adjusting
BALLOON_DEFLATE.

Let's do that. This is a preparation for factoring out this handling to
the core code, making it work in a similar way first.

As this (deflating while migrating because of inflation error) is a
corner case that I don't really expect to happen in practice
and the stats are not that crucial, this likely doesn't classify as a fix.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/misc/vmw_balloon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index cc1d18b3df5ca..2cc34c4968fac 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -1818,6 +1818,8 @@ static int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
 	if (status == VMW_BALLOON_SUCCESS) {
 		balloon_page_insert(&b->b_dev_info, newpage);
 		__count_vm_event(BALLOON_MIGRATE);
+	} else {
+		__count_vm_event(BALLOON_DEFLATE);
 	}
 
 	/*
-- 
2.51.0


