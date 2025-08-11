Return-Path: <linuxppc-dev+bounces-10798-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B00CCB207A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 13:27:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0sm86zS1z3cnR;
	Mon, 11 Aug 2025 21:26:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754911608;
	cv=none; b=gCH135H9wrQQUK1xPuSivDpXbzXQEQ11LHwtkRMlW980oHMyLo73Vro+NF9ICTxjCJNqo0yElhOdzXxoLdbd5NHNU7g5e8ZONL46dF/bzs2gkzxoeMRgqdVsxw9C0te0+C1RX3PJ0+bCT6Le6Mzzc7ELyghNZQhUClxk9k+OK8xPZQa5TlU4zVr3IQ1GCTVj9+PGDHjTXaZTvRt5AS0GAAzpQnMSSQoOx0jqtdIGmOqRjnf3CAfjeNatbRk+AsgBYEKGG97k1JUMl1Onc+MxMTThqSq87CrRbC3zNG/+PNtHuMSK8AzrYxb2ttJtmEBDUrVsdq2Bx06Jkr8rsKgUdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754911608; c=relaxed/relaxed;
	bh=OPzS7A0H2JYY/4bVoDqq5vs7hjaSrgBmC9jJDJzHOMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=d8WqPgQoY2BLBRnFpj3HfYNGz4p2ldrU5YKF5X99iDtRSLpVWam5J4HbaurPRO532PACO8GYjTB+HJdZ+ffJKvaQG0KHg5C+zC8g5C0nAxWWKIEuVr0LekyG5/KHMQV376vlpkeuYhp+nBKI3IssF4ZU1k0LLLGb9tUEeAEDnBQYiyP2SXHTU0FR5Z0C9NjLj3f+vZN6OKmTKxQ4qM42XmRHTSr0Y1O5XjU7oOYC+Q5ztDiQUGDCqef/E838uOxP5VIu3UB/DbK4N1lJdGMGLrzkiOfpHms7XMaeBoRCmrAD5hiZ9dgwqiP1Y/8OhoV4Ql5Gqdb3T7teHgIIIkDYuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MHIgDDer; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MHIgDDer; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MHIgDDer;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MHIgDDer;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0sm824JPz3cnN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 21:26:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OPzS7A0H2JYY/4bVoDqq5vs7hjaSrgBmC9jJDJzHOMU=;
	b=MHIgDDercPLuz7pteul5tWFHjneuoapL5+LHdKKsGx/LVYDv8WWTlu0eatfgXf8yOiFYi9
	fubb/gj2MmuibpOIlWSpHbJqsNH/zWt97BArdZXWX8psJpsCOWalF4ZtFzOyVvTZ6TNn+2
	QXLLtrj5s8q5WQ5dfYehsejmXfWo0iQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OPzS7A0H2JYY/4bVoDqq5vs7hjaSrgBmC9jJDJzHOMU=;
	b=MHIgDDercPLuz7pteul5tWFHjneuoapL5+LHdKKsGx/LVYDv8WWTlu0eatfgXf8yOiFYi9
	fubb/gj2MmuibpOIlWSpHbJqsNH/zWt97BArdZXWX8psJpsCOWalF4ZtFzOyVvTZ6TNn+2
	QXLLtrj5s8q5WQ5dfYehsejmXfWo0iQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-j713KvXKN7ikxhmLG45rLg-1; Mon, 11 Aug 2025 07:26:43 -0400
X-MC-Unique: j713KvXKN7ikxhmLG45rLg-1
X-Mimecast-MFC-AGG-ID: j713KvXKN7ikxhmLG45rLg_1754911603
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-459d8020b7bso21422305e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 04:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911602; x=1755516402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPzS7A0H2JYY/4bVoDqq5vs7hjaSrgBmC9jJDJzHOMU=;
        b=OFbSFdzdFbbdlf7a3fV2H+0WttDfFVqwRLPDPbUN+pm5sEc1NsVKTQDX853IboEDSc
         UF9w/D2qeTd4RFMnvbPq5AdbLtqmje3qCvf7IzBC2nId4f8tFqoHNYAFsyKtvh+/TCqg
         z/tMMdPbaFqrXyP0KEISab48Lmr0LVNsTwyngym0Mct8p4DNiAf2zr87ad531Y4c9hFk
         1I/acwMCFqM4pWbZL1DGdyJBWbSeUtuFceL1uWgBm3fpeoKVNp3YnYO40y09bDp+R2mY
         vpbGdtbT95rxXO43CZNVJALGdPK8kilzBCxGBgVnJ4+LarYQaq4+MMoXOg3CuBeKnueR
         qHZA==
X-Forwarded-Encrypted: i=1; AJvYcCX4nfTCYm9Ftg/Setq842XU+pUt9b/izEy349dnudoBk9ZHg6lEx0ZtE51zy5aqd0w8osk+d2J27thjbPA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzlYtBVXTfEEa66CySTJ6NE8RdvOI4hP8EYcdoLaxWStSrJmAj9
	elvQhoVokIdGhBDHVnnnTxOlKWPkpQjRjSiiuibR57K/igy9bVvgeYBhCcrJwH5/hAQ5xJ7ZVEW
	QS2rf9g3TFLULHg7Jg241RpjNZMGdjrRmK/SNU+tZsSZnxYBLx4PrdDw1NrvZ/u9LMcg=
X-Gm-Gg: ASbGncsC8BOBfvKYyF3zyJnBvd4HFMf7rGiQE15ZugTdtFb+cqhkjtB7pynIY7H2hNA
	DRVKf3d8b7/pt9ewPYEi0YBLib0IMnkBTfuAZplz6YRZtMkhuGECpPBy5gYxoR5Aq4FeSZ+ULtl
	gGCRP7eT5X/bHFZjNbhsZUtuj+oG83AjjQ5qWAB4hPYWrtFhFb8412VGhKMGtlDobHxQCGLSpBf
	CQZU7AdLKTQiqHGJexexxMElCsX7JdgOrbLSuvz91a5VeTFkYo06UvHhBpVvoJBGVENXyjOQvEM
	3YDRbIlLCadL8LHMvrrqDqjHyxhwk/NP845Op4rarkbcINdIge1Giabq1s+tylldOa3FrO00ELv
	qZyoB12bwBUZZkUqwfbQbob++
X-Received: by 2002:a05:600c:4ec7:b0:459:e398:ed89 with SMTP id 5b1f17b1804b1-459f4ea2167mr89525805e9.1.1754911602521;
        Mon, 11 Aug 2025 04:26:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2VXT8eja0G/6oYjAzMox3Wj/YsLa0WXg9I30LI+rqq9mj5h9Avu9edvonRgK7PI+OIDYPVA==
X-Received: by 2002:a05:600c:4ec7:b0:459:e398:ed89 with SMTP id 5b1f17b1804b1-459f4ea2167mr89525255e9.1.1754911602063;
        Mon, 11 Aug 2025 04:26:42 -0700 (PDT)
Received: from localhost (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de. [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459e6dcdbbbsm122068765e9.7.2025.08.11.04.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:26:41 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Hugh Dickins <hughd@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Lance Yang <lance.yang@linux.dev>,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [PATCH v3 03/11] mm/huge_memory: support huge zero folio in vmf_insert_folio_pmd()
Date: Mon, 11 Aug 2025 13:26:23 +0200
Message-ID: <20250811112631.759341-4-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811112631.759341-1-david@redhat.com>
References: <20250811112631.759341-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: Ln4rxPAeP5rSNMer8-P-pgV8gySMKtA5jA-IvM9_oqc_1754911603
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Just like we do for vmf_insert_page_mkwrite() -> ... ->
insert_page_into_pte_locked() with the shared zeropage, support the
huge zero folio in vmf_insert_folio_pmd().

When (un)mapping the huge zero folio in page tables, we neither
adjust the refcount nor the mapcount, just like for the shared zeropage.

For now, the huge zero folio is not marked as special yet, although
vm_normal_page_pmd() really wants to treat it as special. We'll change
that next.

Reviewed-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 7933791b75f4d..ec89e0607424e 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1418,9 +1418,11 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 	if (fop.is_folio) {
 		entry = folio_mk_pmd(fop.folio, vma->vm_page_prot);
 
-		folio_get(fop.folio);
-		folio_add_file_rmap_pmd(fop.folio, &fop.folio->page, vma);
-		add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
+		if (!is_huge_zero_folio(fop.folio)) {
+			folio_get(fop.folio);
+			folio_add_file_rmap_pmd(fop.folio, &fop.folio->page, vma);
+			add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
+		}
 	} else {
 		entry = pmd_mkhuge(pfn_pmd(fop.pfn, prot));
 		entry = pmd_mkspecial(entry);
-- 
2.50.1


