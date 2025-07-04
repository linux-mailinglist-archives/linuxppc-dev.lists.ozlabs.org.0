Return-Path: <linuxppc-dev+bounces-10092-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAE0AF9001
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:26:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVCG0ms4z30WF;
	Fri,  4 Jul 2025 20:25:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624746;
	cv=none; b=i3l3k4jODboYgrEy7f3JodFfhFsoaSlVs/qm5DMvIdd5P/8QndJ0CvDobIyZ26t/Kl1+dknJPMasF307GmuoZsT+ZAlR/fbUN9/RhBC+skNTyFcn8vj7hWCjqTs/aNOEUSpCDnKzHwEXJSOb5Qv2vY5gcYpxqd+5pRM2/b5TsVR5keqYx6kkQ3pUL5bJ9Q93+9Ov9y48YbWBE22/7YBWD8LT8LehqpQzw6jzCFe2W/ujkhIVLyprX3k401cCw+GUs2wp1OzQDuDlq+017It4L845qcE791hk3hMhqqMLAM0M9AZUJxgtkNfFRXOwgwBtLZEc7gV56JcReqmPGmwN6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624746; c=relaxed/relaxed;
	bh=CYTSovr6D54lprWegV/WfQaWtrhfAm9Hhj9zhgiC0NY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=T7TZPWWJm9R9gZ+7/90s+/bHU0JTsug4dOjlQNivWJHTrHL2ZlXalExf+P7sRIv3c5eyF+YYhpD2LTFHDyPqwI4E/kR+H52cfALisamW93cCsEf+e5QcOD4bt5f4pGLgvGL1JXA/gcOJPuMeic1I+NJwHIVLx82bK2Ccw+ROnvg5nh8WDVc3QCoG1mqtLH0M6/K/0GWEuy2mz/hG4gUeRt1218AwsOiS8RaoC8YTIQLiIq6OSH+/8o9eMurN4V7pCs0x3JoNe58gAi6Rpq9NDxqc85Ivk4jVZneHJsbUTSu98/caZYuGfcPZc93yt7oa1jOhDLaIA9gKvUoo2dyTHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ePi25SIX; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ePi25SIX; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ePi25SIX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ePi25SIX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVCF1vfnz30Tm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:25:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYTSovr6D54lprWegV/WfQaWtrhfAm9Hhj9zhgiC0NY=;
	b=ePi25SIX07aLObIWf1fHZYHCeJc9JzriuP0qsGznGmfBO8eFlYC2q2i1/MF+qyalUcQs5r
	tmHkBbgsoOrPo791AKnEKX4w9jeBQupdyc7UbK7dfCNXNWoR+FQPMzu1w/Q3db6tRDTxub
	EVyyoFTgPTZ+f8PDpiPH5dkjhMNLXjQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYTSovr6D54lprWegV/WfQaWtrhfAm9Hhj9zhgiC0NY=;
	b=ePi25SIX07aLObIWf1fHZYHCeJc9JzriuP0qsGznGmfBO8eFlYC2q2i1/MF+qyalUcQs5r
	tmHkBbgsoOrPo791AKnEKX4w9jeBQupdyc7UbK7dfCNXNWoR+FQPMzu1w/Q3db6tRDTxub
	EVyyoFTgPTZ+f8PDpiPH5dkjhMNLXjQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-sj81Ixr2NJiybzU4Qxn0_g-1; Fri, 04 Jul 2025 06:25:40 -0400
X-MC-Unique: sj81Ixr2NJiybzU4Qxn0_g-1
X-Mimecast-MFC-AGG-ID: sj81Ixr2NJiybzU4Qxn0_g_1751624739
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450eaae2934so6575405e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624739; x=1752229539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYTSovr6D54lprWegV/WfQaWtrhfAm9Hhj9zhgiC0NY=;
        b=I91TbIZWmm4V6o1TN75ah1pjRB5KUTGrw9tZ1Y9Kf40f3doBqjuBdg++10B5ay3iug
         coCviCKaDAQrf7+DFeCpaEoMPMUsjz54qMF/1L4RzZIJhusYyf2S25TGQwoeHssLPmsm
         Mqlgmo+ja1YkeUCZh1FCXnZLwITjdOKl5ee16DqhKxEG6PSgQadpbTpYWs5KoXrC4Mtj
         Lt9ooo4rTKQEpm9VCJJBozNy8NweXvqsOaVjBcNstYZ2DlYB/NutIF9P5RWRxMWCGGAO
         oZMQqIS1UO/AN/gcNSiiCnx9Iow/0fxTezwQW1QsqpA/s7ewYeI+zm7jsvp0TsBSejn1
         08/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyUNdq+uX6PDhfOaMBNfcFvbXAkiWtdggABd1XK02wTDRr66zE1dTXsB5V9/du/9vQ0T1ReC0wsKTsHyI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwyMwXmSC7RwnYkOh0tPch4m+ls8TPUnlw/RAzQYUf8wVTXZutn
	1USEKxk2WnF7nR5t82FjhjKDdT7vPvxHU8j+amVgGqMardrqNR+Z1lLOPD94b8h+nU0qz5rhwC8
	B96gjlfDewS71+q30VUbbGKPSmtd7rZxc9ipnD5AjcjAL25IoCRHIYcquUyTb64+FtHg=
X-Gm-Gg: ASbGncsUtXoXsAtGsrMuiKtTK574PZ1f1qfYv1eQkyecJWF7YMRr1fo0bO1E8nzTZwR
	oM7y3JnkZuNGW6DctjAkoYculhc1Fu8ZAgIodoQ7p/3wHcCgwh0cTnWRdJIV6prZWRRnrHCYcPV
	xKbEDHNSLCsoLgWbeSY3E06awEFWWdtFxVzDPIqkBlSzfAP+uFGllhOjF1qLC+L5jKGmuVCrVHS
	Euqbj4KDWZS51LjOZ7jGeilEyPWOaUOCc6HGUdVzghDFma/kf5cfSsb6N0qpvyuw3tqQO+y0sFm
	lh2nWQBms4t7roBh/LSKvzeMnKDZiuKy13eGrMOwXFo64R4jS1US9pXIOhBIMAUH8OthIv0cgZ4
	ulABm8w==
X-Received: by 2002:a05:600c:3e1a:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-454b30aff3dmr25066425e9.15.1751624739248;
        Fri, 04 Jul 2025 03:25:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEabPcFPa9J30O6qNf8/Kx6cfnBeZR0NWqXc94Uy+RT4akZprmrg4imDnBXRg/gEanMTx6ZJQ==
X-Received: by 2002:a05:600c:3e1a:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-454b30aff3dmr25065735e9.15.1751624738758;
        Fri, 04 Jul 2025 03:25:38 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47285d3c6sm2121167f8f.95.2025.07.04.03.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:38 -0700 (PDT)
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
Subject: [PATCH v2 04/29] mm/page_alloc: let page freeing clear any set page type
Date: Fri,  4 Jul 2025 12:24:58 +0200
Message-ID: <20250704102524.326966-5-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 5_Gnxlm8Jha9hmfs75RVg7YPBNRuYs6kAk1T9i4R_3o_1751624739
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Currently, any user of page types must clear that type before freeing
a page back to the buddy, otherwise we'll run into mapcount related
sanity checks (because the page type currently overlays the page
mapcount).

Let's allow for not clearing the page type by page type users by letting
the buddy handle it instead.

We'll focus on having a page type set on the first page of a larger
allocation only.

With this change, we can reliably identify typed folios even though
they might be in the process of getting freed, which will come in handy
in migration code (at least in the transition phase).

In the future we might want to warn on some page types. Instead of
having an "allow list", let's rather wait until we know about once that
should go on such a "disallow list".

Reviewed-by: Zi Yan <ziy@nvidia.com>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_alloc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 858bc17653af9..b825f224af01f 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1380,6 +1380,10 @@ __always_inline bool free_pages_prepare(struct page *page,
 			mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
 		page->mapping = NULL;
 	}
+	if (unlikely(page_has_type(page)))
+		/* Reset the page_type (which overlays _mapcount) */
+		page->page_type = UINT_MAX;
+
 	if (is_check_pages_enabled()) {
 		if (free_page_is_bad(page))
 			bad++;
-- 
2.49.0


