Return-Path: <linuxppc-dev+bounces-3706-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B92D59E182D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 10:48:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2bRs27Fyz309d;
	Tue,  3 Dec 2024 20:47:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733219273;
	cv=none; b=nFEae8kgmVqdq40O2b3gQKrCmXz8T3cwH1I5yfjp9PphG8UxQJUu6G/fEU1JmiH0pCHQZdiJ3QsCVRYHXInOMoC7EQeWv0wPt/PWLraSs7FBV7CGEWRYIGd463wnkDdHgewrKPSbl1ZHM1Es99gwND1tCRHdwu53tNZXA+XTfXa0A6bRLjmuUsMBGXtr/BrNb/RMSgiJoYESOoSFNWLHmkw1354m4fxcEFfD+mhPrDUdNgzQOo5qoePZCXSf4KOuhJvIKNRDKpSLeswDnGJnqFBXlwTQq88H+Xr4rosYgxDlrWb70zQSwlVAXUeuAsbUvYl4vhVlMgoorCWGBr2W1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733219273; c=relaxed/relaxed;
	bh=LU3Y8BABokL9EuVXZz3YTSIe3emDP78aZncO4AsTCRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=XAMoJyRIo1IrcfeWKKO4RDKo7FjvuKHxO6aPjjoCrxhDRDaFcCeuc7UpUt2z7kQHbizd4aKCOkzNLqGsmpdYZY0YAPTpEf00IcF+ccGXnpJi6dqPLDateKZTfrewfEiwZkTf2lewqrqbI5SN8D8DDfLK8r4SIWq7OTTIjauKedmgl6dCzSGP4vLxMXVYQbpUgP6ytd/lfy30JCvi2Gal3UW+VkfzD4R2FPns7GATZAL6J5KyYEPtz2pJEVWPXZJ+gPADVpsaYqZWbYlu8AbGEQW1FByyJcq8B42tXObtbaQYcteVJFLPJVeoEbtYewpouAXeIrtcaA5E3K32wiCllA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NfPHVZTQ; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NfPHVZTQ; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NfPHVZTQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NfPHVZTQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2bRq48PQz2xtp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 20:47:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733219268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LU3Y8BABokL9EuVXZz3YTSIe3emDP78aZncO4AsTCRE=;
	b=NfPHVZTQL8l0TfT69VK+rlIByB9CtUDQKlkJcw0An7kAN48OMm2QoW+z+DE0JGvqFybegE
	Vbs6NSMIfPqTEEfdYeICO3N8yYCzLzJ4XsTNvYGDhqT3gA9X6R34/LPiQkS+YtwMrfAN9E
	Pxuz7l98pBHERcLpjuFTWQ61259d14o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733219268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LU3Y8BABokL9EuVXZz3YTSIe3emDP78aZncO4AsTCRE=;
	b=NfPHVZTQL8l0TfT69VK+rlIByB9CtUDQKlkJcw0An7kAN48OMm2QoW+z+DE0JGvqFybegE
	Vbs6NSMIfPqTEEfdYeICO3N8yYCzLzJ4XsTNvYGDhqT3gA9X6R34/LPiQkS+YtwMrfAN9E
	Pxuz7l98pBHERcLpjuFTWQ61259d14o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-jkKROsPGMuSFeo1fyWuXzg-1; Tue, 03 Dec 2024 04:47:46 -0500
X-MC-Unique: jkKROsPGMuSFeo1fyWuXzg-1
X-Mimecast-MFC-AGG-ID: jkKROsPGMuSFeo1fyWuXzg
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43499c1342aso37401545e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2024 01:47:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733219264; x=1733824064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LU3Y8BABokL9EuVXZz3YTSIe3emDP78aZncO4AsTCRE=;
        b=h/WSJnyTdlh1qyi6n0xzJQZQ1tmrfRF3fwLeeLjETpoUtJ/ZSxkAb7jE+qbaUMBP6m
         ctNJwxuY3jIK2QW2VNH3wlY5Z1lVDZU84Y4YOosgmmMdUJHQF7htFDk7Y1aJZTdC3+SM
         1Myr6ewMCgPwIi4EgpIC9APkCbThbADpU+1+Ay2cQo0yntYDfikV5t40rx3Xm/fjMX24
         Pvd0zWiuTQvALaY97C24gDwKyUz1z5lerQkKqa3Nnn68zRnC+4ZUqCu5CM3bUtE+jrV0
         z9LDC33U0B+eTST/VKP+p5Q1gBQRcYqo+A0qCvDSJ1xlKwGv0zspWSGXOTfG8tApl/0+
         Etiw==
X-Forwarded-Encrypted: i=1; AJvYcCWGqkG5dTbVKEtgloiVWR0vsSIH4twDWATpmTDNfOlhhQBYYMjAd4hfTv03rm/ot75QOjn7Ht/OtaBlXBo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyRyzgzP5f65UoMKm3G/Pus4xjPdNFn/FfQLUwHqKi5bz91njmA
	IVAZ0uhuoDMzzVj0oYmC/YxDt9JByDos7LdZhrGYGCv8rC+lyq30oBryLcRsi4Aj8Os5r2ZotdR
	4+TonNFs9mQ/nv/v/OouXXd+JAXriv6HkghHwbO8FNnLTGOlIbFERex4rv43tA7Y=
X-Gm-Gg: ASbGncuXdmtEWH5MvYSiy9Xc2TvD+gaBOHqtrmDeJlIyWaHyuezLRXlx8ID2JjhKlD0
	KwSImUMZmYQcsnQJ9olI3Vj0XQwCKqjulBQUUvG1C1SB/cFwBOY4qFwuOGOqpyPcdemY7U+lWvC
	1eibq39cmgYwAVB9IQRhsf8zKo7C8ezIs0J3oS3JY8cjvrhYYr+YyfFk6ktUZLCW/2jD8aRKjtq
	Xgzx+QWyTJ7BO7h9loQJFOx6gW8dP+cCgBs9pjSi90n+B11whbHyU2h0JH9QX5gGogL1bQ06ppf
	pjx3CkM+D99PYnelnffoVGFToun5UsoI/tA=
X-Received: by 2002:a05:600c:1ca2:b0:434:9e1d:7626 with SMTP id 5b1f17b1804b1-434d0a03d92mr14496255e9.25.1733219264339;
        Tue, 03 Dec 2024 01:47:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3m9gr407PRBCaVgPUBaqcArqFbwV0w48JRDx7WvhZgMUXfRC/MZaf7nSG/r3cgNlikqmXCw==
X-Received: by 2002:a05:600c:1ca2:b0:434:9e1d:7626 with SMTP id 5b1f17b1804b1-434d0a03d92mr14496015e9.25.1733219263982;
        Tue, 03 Dec 2024 01:47:43 -0800 (PST)
Received: from localhost (p200300cbc7461b00fd9ec26cc5521de7.dip0.t-ipconnect.de. [2003:cb:c746:1b00:fd9e:c26c:c552:1de7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-434aa7e5e59sm218218545e9.44.2024.12.03.01.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 01:47:43 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Zi Yan <ziy@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH RESEND v2 3/6] mm/page_alloc: make __alloc_contig_migrate_range() static
Date: Tue,  3 Dec 2024 10:47:29 +0100
Message-ID: <20241203094732.200195-4-david@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203094732.200195-1-david@redhat.com>
References: <20241203094732.200195-1-david@redhat.com>
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
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pcgnJnN2BpdwKhDXgCjWtJZIVf1kMceZiwo2YsINVw4_1733219264
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The single user is in page_alloc.c.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/internal.h   | 4 ----
 mm/page_alloc.c | 5 ++---
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 74713b44bedb..4bd3685c33ef 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -839,10 +839,6 @@ int
 isolate_migratepages_range(struct compact_control *cc,
 			   unsigned long low_pfn, unsigned long end_pfn);
 
-int __alloc_contig_migrate_range(struct compact_control *cc,
-					unsigned long start, unsigned long end,
-					int migratetype);
-
 /* Free whole pageblock and set its migration type to MIGRATE_CMA. */
 void init_cma_reserved_pageblock(struct page *page);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index f371fbf2145b..ce7589a4ec01 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6284,9 +6284,8 @@ static void alloc_contig_dump_pages(struct list_head *page_list)
  * @migratetype: using migratetype to filter the type of migration in
  *		trace_mm_alloc_contig_migrate_range_info.
  */
-int __alloc_contig_migrate_range(struct compact_control *cc,
-					unsigned long start, unsigned long end,
-					int migratetype)
+static int __alloc_contig_migrate_range(struct compact_control *cc,
+		unsigned long start, unsigned long end, int migratetype)
 {
 	/* This function is based on compact_zone() from compaction.c. */
 	unsigned int nr_reclaimed;
-- 
2.47.1


