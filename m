Return-Path: <linuxppc-dev+bounces-9904-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7E2AEDE02
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:03:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5rs6B64z3bpx;
	Mon, 30 Jun 2025 23:01:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288493;
	cv=none; b=NnP+8KIVAkzOhkzpt/ofkn7tsOY5RJAig5PBdmQ70oyk/SLbDIoNwdDgASBXdwy373VaLpZUhxvMQqxCjn8RQA3zgnbt9cml5QQZow74e6cDuTYq0YcrByNbRdShxDBKTSNCU3etQK+2Y6Fd4NDOShVrOkZlRC0362JVrL4X4B2FXKPqoGyULsVNXTjVgeHT4bkAgujc1bzDJqU0nCf2Pio/MFi2YNBtht5SQ9tB4YeAx9wwiCknu2zGq2Mq9Mn8PMrbwSjLIcYl92a+AJmiTzuicJySwJvx0gMevmF+XhGKf8at6EeGBpjttjpRsl2JeNhDDb841aIal2ReyeZAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288493; c=relaxed/relaxed;
	bh=olXYTUdhc5G5HcwZfX2j4qOOcGFF0hDyepBOzPt910g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=keeMgO3//nYlydLMqWnzFvoRTEAqzlzZYE1C8MmrlQrRVMpxfopenPGLH5aPcbWX/AvJsE+Q+6E9LYlm/5Kc/UzFiPOEvDAQty9APPWscrkIrAwkiJ+v1wN7mqaSBGeQ1izCNU9cVI13bcxwvq4ywor7jsh6b5iu8m5LhAKa5bfNG5gpF7n3YJC9MovBvjNZb+O51juaX0JBYQsv6kSvi9SyeFQoNM3B4/qIELrm1jnTM1Q8sQyq1ZiAvbBWU+NoAG9tpyGRd9wUS6TK6G8aSqiU8sLwApM7TGGQjiYShtiCOtVcx0xlYVEKMtqUyE5iRf6/weCHqauNn6Lp5YhcIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z9xc7Ylr; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ykpmepkh; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z9xc7Ylr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ykpmepkh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5rr6yDJz3bpP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:01:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olXYTUdhc5G5HcwZfX2j4qOOcGFF0hDyepBOzPt910g=;
	b=Z9xc7YlrCR60D2UP4pwIeyrRPyXWzytejrRr4fZTejLnCjKCB2z/YlmyPPnd3B+WOm+t4a
	eluUsjj6RlsM0uUDutZ8XXQnpLwhM75kKLzwBCt64VyAgVIkPIuUJuuMUzYlMjSu0f+Jvw
	WIGAY6VMFRbnUJyK4soYpSWR/1rmNug=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olXYTUdhc5G5HcwZfX2j4qOOcGFF0hDyepBOzPt910g=;
	b=YkpmepkhLcQ5zB3cNkbC5us+i3rnxX5SBimVrEPh54bcGC9VJxvwRTjxNLRmRzC6/5+Y6w
	z5pEsFFWzJcu49H6WPwNd0SukqoQ4dzakaQ+5sW2WSrrIBKcxJFL7mQ5FbYU/U5Ndw6kCm
	SDBlJEX0Pw9OYz15hG2BgbvMwX24+48=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-bH55MT-dNqisIj3HLp6KBQ-1; Mon, 30 Jun 2025 09:01:28 -0400
X-MC-Unique: bH55MT-dNqisIj3HLp6KBQ-1
X-Mimecast-MFC-AGG-ID: bH55MT-dNqisIj3HLp6KBQ_1751288487
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45320bfc18dso22232005e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288487; x=1751893287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olXYTUdhc5G5HcwZfX2j4qOOcGFF0hDyepBOzPt910g=;
        b=phYW7fmHrvOnUJeIyvUJCLmKgz/3IlhYvDCnflStHNHTnfr0luNxm7ZdfzfFnrVkeo
         44wQv25lP1rgvRJKqsdiPSxNOLyewNI7HOgrz4Si1lrrvsOXTEo6fx8miUlKYW8a21r9
         P7+1yNJC/sneWNqC96+0dF2tFfgBnOP0lr1/rIC6ZEq90XVuktzQQkSG3w1WfaSntlNS
         0VdJ4m7y0XUSHiIvzhGnXluhy1zmhHtIeOxsdfGsj7LqtcLxfVj2xH7Fu/ey7regXC6c
         Cf8xv18fHWG6hjGyeRQXg8gGxf+rw3ffBL5N6HfnKL3XtOBNyJLqnjZ83cWvfISUL3yE
         2YRg==
X-Forwarded-Encrypted: i=1; AJvYcCW9fWQXVKN/vE+A6ItDzg4tkAolxyRvqlo15Rgix4lTBHekttKgANAPZEqXeY7eG2RO16DIigE0tuAvzt8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwKcwGNtZCHJHvFAuN3KFjgG1dMNO40R10I9Tn47IUVtvuOiq4X
	sC0xjriO4CooCkl00C40I/6P6ox0Ua98HMhPRqjgjbpWz8NVkoCFJf3Bth8SkPpDvOPi+zpCG3E
	pyX/xsewG2vblre9wgAQ1pZDa5cjhxy4mFGez2mPPKtc8lPtQtY3+iRxNmbuCH6zelUmsOtuF0r
	cQjA==
X-Gm-Gg: ASbGncvNtkjvnfuef2ais4U8yog9nmLFd10XECgMmGGp9L8179m0jXQDaFraIbQg1xl
	QC9ibSqnLD3RUWmZEnyG3YUcNEiHDNymw4LNeA7/mjiaeNYdc8WHy++cjy3S+cQutFNMkkZgkC6
	J5v9gDjlOAY2NA+yaB5vnMGomDwloZ6XRlicA/ehJV/JYK+EqSzQEphRlM88xAO2LuovO9JtrHo
	OsrMLGWE5Sl4A4SMST9vcWvkmhLtK7eif2cRaRZ9Scr8F1iAdSYsfij5bR967J33iZAAnpsLIQS
	wDs48CKuJ++n0Ulp51Ib/rXW/yXovAeZ4KkHJ/i4hk27WeZAwvXPdlHdGnFpBDMbgbhrmdkDoKj
	DwfhvjP0=
X-Received: by 2002:a05:600c:5306:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-4538f308f2amr124064035e9.13.1751288486003;
        Mon, 30 Jun 2025 06:01:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9JbLrxBujZu2VjgMn1mCOlcQzRUhKdRhzGdc0P5pPEt9jKXPpDvx4Rwh6D/+Yae/APwbOBQ==
X-Received: by 2002:a05:600c:5306:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-4538f308f2amr124062795e9.13.1751288484673;
        Mon, 30 Jun 2025 06:01:24 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823b913esm162071665e9.33.2025.06.30.06.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:24 -0700 (PDT)
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
Subject: [PATCH v1 24/29] mm/page-flags: remove folio_mapping_flags()
Date: Mon, 30 Jun 2025 15:00:05 +0200
Message-ID: <20250630130011.330477-25-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 7I6FyR6ZEJ_2wO18XT0dBNZU7b38dCyWWsMnIBMPcKg_1751288487
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

It's unused and the page counterpart is gone, so let's remove it.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index f539bd5e14200..b42986a578b71 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -718,11 +718,6 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
 #define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
 #define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
 
-static __always_inline bool folio_mapping_flags(const struct folio *folio)
-{
-	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) != 0;
-}
-
 static __always_inline bool folio_test_anon(const struct folio *folio)
 {
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_ANON) != 0;
-- 
2.49.0


