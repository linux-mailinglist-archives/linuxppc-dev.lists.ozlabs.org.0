Return-Path: <linuxppc-dev+bounces-10109-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BF2AF9032
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:28:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVDF1Hdmz3bm3;
	Fri,  4 Jul 2025 20:26:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624797;
	cv=none; b=oxjCLljTsLC6iyJFFUyv5I4HaU5+1oSlv1EMy0yWQQpN3h5ZJtRKhGehLMQBrLfBMIpK6Nj46gdoOmH7mVbQ+fykV5E5sNQrADqgfwHCSauEJrfD4up68Ag04Z/ACRzWLsIZRxR5l6PVViEpa7yiXC03ryifkgbQfyMcdY3b37LW4EAPj6kdvcRoQp+lIM4BjyoyzAjB4Tc+8xpU4xALZKbjDmC3T5uxdG7xqctPtA7GJ0J71XGJX0Z3RKQq6M9lpwY7ijdDjx4oqbziCYcJPbTikOOBYs53B7bZik841tygNa8gFx3Tb04HBSFUnYOYqZ2fC7KEDp55fSznfr9kdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624797; c=relaxed/relaxed;
	bh=Pi83bTeEFwDlpM8pJuM4mqXwpOj3VH8gXnt6oQN+QH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=bJkg8LzB9W4HUzRn3SnpuWgHFf2EV0kF+7SARohVI64gNiZzTUUl44w43lmsGxT6PxRYHoPluI9YoXUymgVhriE31vmL+DWfn92FhWaN3k6lkVLBuuPWMob65Tw2YBDM8nS5HMt984gTryjzXHAcCoHEqFHyvyVlRPs7HaRQflDpREM1TTIZtRiRu3SRNxzWypUrN5mFP5fcH4bcu39Z7QShSyweapjou6M0KkVK0uJvESlhmjYxYQlnAWlELSVy/xDr2Rso8dYs09tDZFK6PgOZB6Kvmdgs991qExzXQDGEEGX0PRx/OBT0y04BuXpohCLTFcZT4dPiv1aYmrcz1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HFvToW0M; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XY+RhU56; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HFvToW0M;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XY+RhU56;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVDD2jM0z30T8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:26:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pi83bTeEFwDlpM8pJuM4mqXwpOj3VH8gXnt6oQN+QH8=;
	b=HFvToW0MPVq/TI2AaVNDGTUiJ0gjBu8TcAk4BNMGoayamYKsuw9vdofxpggkv5JhZPGUmD
	pL4gGMuCBzKARWDd9pAEt872aPAkub2JU0/mv4wz4ZXO+dkp8igOBeRdYh2BAyrNe+m3hd
	xFPRuI0RKz+cH+Z0gQ2F0euVXmWI1rs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pi83bTeEFwDlpM8pJuM4mqXwpOj3VH8gXnt6oQN+QH8=;
	b=XY+RhU56nPrb2Jrd4qBlNkNvsm6WJwcY0CCu6hsTMYdatyi+YarlP5/Rv2tx5dWy9d3IeF
	IDCFmmNjeG4JrYEmK0Gg6owg8M2g1fVcfG38fBoLmwjb47CWu753Mu7Y+bqZ/gxtzpLwlg
	9Y9oeZR9+MgwhWv78sul303yHwxS4G0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-UJUkEAjrNai8diBElaaDFA-1; Fri, 04 Jul 2025 06:26:32 -0400
X-MC-Unique: UJUkEAjrNai8diBElaaDFA-1
X-Mimecast-MFC-AGG-ID: UJUkEAjrNai8diBElaaDFA_1751624792
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3af3c860ed7so332407f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624791; x=1752229591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pi83bTeEFwDlpM8pJuM4mqXwpOj3VH8gXnt6oQN+QH8=;
        b=jDuHp/uD9J5ojLkESkABJFjLC3fEcJtiij0q5PfohNms4R5K/PTqdyey6+pNMpx+Qa
         uh9jIieKeEgo6SW2vssmQoVKDMsbTVzfS0Cwr/oO+RUfCC69X65OpJYK5U+5WRhPL9P6
         x6li4AvCISiYXVZOZaT+AS+9SzhDgTtjPf2D2i4+IixRBiwE0w62bbiUV2UV1pchQGrM
         hLtyuTR/WHgV1+3edNikO6+XemcwQroEDM/u3zWmTiJCz6Wz2uUc98c4H80agRwMsHFu
         lWgXXekMOsApF7ee6RqsYEJ+JkLThVpcata0rRVTp0s4ythRlb/B0RQW92njo7Fa2AAW
         qr5g==
X-Forwarded-Encrypted: i=1; AJvYcCWyoIaI69ndMRAImYLmgjd70wM/5kmu4wNd2FdOKWhtzVObcizHFvFW50kyaV0EiyBhuC5Nx1Drk9QmTjs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyX84ALXZ5YslX1M9S/N7GpEb9exD2HsakaD49xTS+wsV/az6Oc
	5hYzu6LGAm46RwjKKcOdIRmOFkHR2cRho90OdOobOFNhmpst0Yhz0xfUjpPVyf4BTJ+SEL6PsYQ
	bIuQEysKun/aqf9Zet+6OEx3Oxk3jxhSbh7aH3Hplj8q6p29pldw15ZjVIF79mvG0a10=
X-Gm-Gg: ASbGncv3aMHIBbZyjHfW/ao98bcxx2DJvq9Qjv4RrA/uOw9Ksrvm1HephTadbrhYP95
	p9YEJRfWrL+GAHs8OxhfZeomSy1jE01Nb0yf6H1lqbTV2Sm8LK7tjKJLb6WkmpUJGFEmeDy1EwY
	u3fT1DOFfZXSJdd50mInVnOyhpbJ5iHIfKqbBYE/hsQYuitvJqtRj82irT5D6LaownrecnWdwRT
	wNdXXFi2DL9hg8j8haq/6Eg+FHHEbwxdEW3o/V5DSapP/3akJhwe7vumAg6e8bNH+BWvcCrAfJk
	Sc5Sc3NV+uqoLB9WXy8x5gIvP+3hV3tiF+UCCgFcraWWzM7GRRE+SSw74FzeseqhcGYnHJ9afuG
	NN42gkQ==
X-Received: by 2002:a05:6000:420f:b0:3a5:25e0:ab53 with SMTP id ffacd0b85a97d-3b497038f53mr1271093f8f.32.1751624791463;
        Fri, 04 Jul 2025 03:26:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrTbC9DKT0t3aMKhVtx8nltW/QfximYUsOEu1FNJGdEflOepjIkffBp71QlqU0uLEDVp5xtw==
X-Received: by 2002:a05:6000:420f:b0:3a5:25e0:ab53 with SMTP id ffacd0b85a97d-3b497038f53mr1271044f8f.32.1751624790899;
        Fri, 04 Jul 2025 03:26:30 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b471b97732sm2167298f8f.59.2025.07.04.03.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:30 -0700 (PDT)
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
Subject: [PATCH v2 22/29] mm/page-flags: rename PAGE_MAPPING_MOVABLE to PAGE_MAPPING_ANON_KSM
Date: Fri,  4 Jul 2025 12:25:16 +0200
Message-ID: <20250704102524.326966-23-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: CKbarxWBKeY2lZw2Unx-GBOYwW8x3jvoY-XqpEU5jOU_1751624792
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
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 8b0e5c7371e67..094c8605a879e 100644
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


