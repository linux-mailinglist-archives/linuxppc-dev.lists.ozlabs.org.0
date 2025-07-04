Return-Path: <linuxppc-dev+bounces-10111-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E85FAF903D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:28:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVDL4JhXz30VR;
	Fri,  4 Jul 2025 20:26:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624802;
	cv=none; b=DYVaZHFvG4czXRWHsqyC7xpVZJ+DRJZ1YgCfekEQniIfwFk6oZF4PBalhEQENcjLsqQQJjnLnJ80YlIdaDtsiqTXMvh5yYZ3NVKxoQi+otL2H1xHSWzz2DsDdn09O5JORKNSDT/YYag6aQLohUed5X9BgBXJnHh79mt9vDTYMMzDaNuqAIXpF3+Avxqcj2/0yGkR6FejMXMOglNQksA9Ytmx7g/l0bZFno9tMyvEHbmBzkminjwn/dWqtruDKBqOtaFesGT8z+qYbA356rzjId//dVnH9uhqsUEHBZFxqQ4N5CkaQnccNobS0X0SS1vK/VqYxo2Q4B9izy949+0EsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624802; c=relaxed/relaxed;
	bh=NiR5g77+dfB6TjFQFOB3xNqG4FRd5Im1/1G4CsJHDLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=W5zRmLw4C4KEalRSmiEInHYMP/47F2SKkKH69lNx51qwzP8lbBsEHa39li7WS2121VCnw5kQMPgo1wLcq+0LH8K73E+qaa83Ef9FS0ZjOOAuyBW/vuIFNYXllSrP7yvIEsaf++BYL7awYog5qSQ3aHfwSePaAc+aqrFbKZy4Yb1nfe/lMrE14uTYxLCDKGseNgY28rdEdXFDgAQlX+TqXuFeGcMQ8IhYdhf6dBSQYHlMFuAWYoBRMNKX33L0c8/5KyRB1S/wjFRaTR2k9tFJUevsadE02MPT1ex4DUcsiuHOZCJtWkSWgtXUvF5CXpjXHACZ/OERWDNzgtfp6WHUgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O4Kymy0X; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O4Kymy0X; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O4Kymy0X;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O4Kymy0X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVDK6cZhz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:26:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NiR5g77+dfB6TjFQFOB3xNqG4FRd5Im1/1G4CsJHDLI=;
	b=O4Kymy0XvQ+sk/Kw54LMKbb/Ml22GcgZel6t5gejYor+cfYw9uiPd57QfhjJz5pt+tmnbc
	ATWDO+rQ4CH32tgeiGa7deKpHbQz7ioXPfeyh8osMEenc8uKUXxppiCPX44nMpL/zlL6da
	wlVLFkvFMHvTAau04elrVrqHyC5m8i8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NiR5g77+dfB6TjFQFOB3xNqG4FRd5Im1/1G4CsJHDLI=;
	b=O4Kymy0XvQ+sk/Kw54LMKbb/Ml22GcgZel6t5gejYor+cfYw9uiPd57QfhjJz5pt+tmnbc
	ATWDO+rQ4CH32tgeiGa7deKpHbQz7ioXPfeyh8osMEenc8uKUXxppiCPX44nMpL/zlL6da
	wlVLFkvFMHvTAau04elrVrqHyC5m8i8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-Qmdby3JdPPikGjO9DfwUPg-1; Fri, 04 Jul 2025 06:26:38 -0400
X-MC-Unique: Qmdby3JdPPikGjO9DfwUPg-1
X-Mimecast-MFC-AGG-ID: Qmdby3JdPPikGjO9DfwUPg_1751624797
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a50816ccc6so500307f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624797; x=1752229597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NiR5g77+dfB6TjFQFOB3xNqG4FRd5Im1/1G4CsJHDLI=;
        b=pd1iemr8ks182WWpCGkSy+twYG8HAniGkX955Qlndv3z6cDtG5+sp8iHGlHqgKF3Ck
         eEmlm7oTmAa+PF86kKHD5ELMmK5oSmYEMevH0/6g2aky0nt0r+lSy+Ud4Rp6tfN3Sggd
         d3RIvu3MKV+o1kPxZ3q2/MrZAIkoi9VFM3DvkFCTa04DgUfavuqWQCNDGz5jYdpvmxCS
         PMFOeqP/x1rvsk1z3ts1g5qFiVo9MVrougS7zlrqMWUlinm2L++fhAd4VGj2Au+BAJcb
         LdOMBdfUlx+DorAZyaUQEvUH/eKL9aOqpvAeYNRae4YoN3jVoKlzHi5W6JIGTey0iA4h
         OvaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIYrWzkOxLNaPR4WtwBf7US9jvv7jC03XWzEYu91BGkknCbibGfnKtZi03wCFFN1pP8QyIphZ+hmiWZQ4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywtl1FQYjGHvzuAv1Fxomb3n0tnI7ouIcCP+WFJPDrulOIypgqw
	hE2HnB2nh+SFKILJKLpMLcQ96lsSPRMTSkpH3t5Zxet8vWE/90e3GpYmjMEPMubUfRbF4cFHSDp
	L0KhlCIkMPL2XgDIXGtvwTvgXPNRkJqtkF6eq9vBaN6jd1YXJBDLOC5iQ6GilTSO1CUw=
X-Gm-Gg: ASbGnctL7oMJXBBUtrmZc8uziCjDlH1EeHCa5MSCjpMeWaBsrHVtNKv8HPmXNanCBVf
	xQ5MmCJ0lmw2w0vSis5G7SaeK+vXY7t+wkmt5ZuZIxetr4+qjkVSRGUnB0/04d4sH28txnG/8XX
	vqJrob7bLBRWnd5+jUbT9JbjC0wc2uDYKAmEJWNPgh8N74SnPOujpYtV/qQN4MJaZ+lerojMMwG
	O2BBD9pHFPkmT0gjTektpDN8dZnS2tp4Wsb+3ftjR1Cl+TS9pjR+5ftgumIVuKjoZiQmAHzb+m6
	eImC1umnwDJzn3HyGTqWe9mW87yr2wMkFHkW5QTAUxe1+clcJ+sQaCYrWiVkHan+GcSlmVdPCTS
	KsfjVcA==
X-Received: by 2002:a05:6000:2112:b0:3a4:ec23:dba5 with SMTP id ffacd0b85a97d-3b49700c571mr954056f8f.5.1751624796816;
        Fri, 04 Jul 2025 03:26:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtfbiTuj+217pme6OFEkgrGo09w9YBtXxahiaI+UfZ531v1EH5FnBXh5DrYfR2GN/01q/x/g==
X-Received: by 2002:a05:6000:2112:b0:3a4:ec23:dba5 with SMTP id ffacd0b85a97d-3b49700c571mr954008f8f.5.1751624796346;
        Fri, 04 Jul 2025 03:26:36 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47225985csm2148740f8f.69.2025.07.04.03.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:35 -0700 (PDT)
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
Subject: [PATCH v2 24/29] mm/page-flags: remove folio_mapping_flags()
Date: Fri,  4 Jul 2025 12:25:18 +0200
Message-ID: <20250704102524.326966-25-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: azGa0Q3xhrwj-GBfEmTHa6P7Z1RkP64r_djYAHNm-V8_1751624797
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
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index fc159fa945351..e575ecf880e59 100644
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


