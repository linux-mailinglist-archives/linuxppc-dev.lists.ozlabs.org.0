Return-Path: <linuxppc-dev+bounces-28-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A9494F968
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 00:12:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QOVdmOce;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QOVdmOce;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjTKd09Zbz2xYk;
	Tue, 13 Aug 2024 08:12:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QOVdmOce;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QOVdmOce;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjN0R70mdz2xQG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 04:12:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723486353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Kq72BfB1Q9PD26Udwsuz2Gt7rCvKvwunl3vkpU7op8=;
	b=QOVdmOce2ZaDIdP/Ry9Xt6G9PauDrffoP6DVk56imp6RchXFBqE6v0n0VbjggQ4ThUB482
	A2lEvxPMn/8u4PPf1qTlLWCbAxMLA/mdV4i9WqMy0c9GLuoPHUo8RRMFBMdosJJgPd4RNN
	ugKfTugLE4mf2evWkHqvh8pgZnkBTLY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723486353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Kq72BfB1Q9PD26Udwsuz2Gt7rCvKvwunl3vkpU7op8=;
	b=QOVdmOce2ZaDIdP/Ry9Xt6G9PauDrffoP6DVk56imp6RchXFBqE6v0n0VbjggQ4ThUB482
	A2lEvxPMn/8u4PPf1qTlLWCbAxMLA/mdV4i9WqMy0c9GLuoPHUo8RRMFBMdosJJgPd4RNN
	ugKfTugLE4mf2evWkHqvh8pgZnkBTLY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-k_GnZvFCPtKYm7D3Y0poHg-1; Mon, 12 Aug 2024 14:12:31 -0400
X-MC-Unique: k_GnZvFCPtKYm7D3Y0poHg-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-44fe28cd027so6865231cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 11:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723486351; x=1724091151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Kq72BfB1Q9PD26Udwsuz2Gt7rCvKvwunl3vkpU7op8=;
        b=pGUCHUQbzYagXB3hVdmAggZGCn1oONvAuC6mqvypwQF1SliSekEVVUAksCBJnTsds9
         /7Ti6B0W56VRTK5wB+fXGz/UuRoWzDYwXvXiMoQgKBDbVrYoEYF+qtpmI9Kc1TFzYWto
         JijfO3FQOpRabdzf4RsUcoFqtmxrKedVEGZTWRrAOMW9jw7vcVqGg0vKFdwoSVxI+rl3
         wUdZ1FJQ+QmgLpfnB8f+Fu/Fupa+Rr0wtooj3GgwHtP6qj21gazOdeZiC4tl1F2HaHws
         dgKyPohZQwiAU2WvdQSCgXNIPXPOmu46tIOcdob3wD1mu5S8rXxTRiVU0B+U5s2CQlFO
         T0jA==
X-Forwarded-Encrypted: i=1; AJvYcCU0GG/Y1UevakM0KgLhIJOIN/+FGyZzMzO3XYYpwChEDmtqUn2WJ/jHMjSGG98hYZ+4YcjyIiQaRrN5RDM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxk8KU5lGSOAeTJXux8KVdKB/8bd6FiBHyIvuZrWuSs7LaAR6Ft
	pwEtw3LgCy9q9bhtlNAUqcfGB7oENe0d/5GXo1zAcGw0tmy2t0bsmPWG1rZvHmXwrrqyT4YZDFY
	jfKkpgZK87QXQG17J4ZfRl/1q4jQcWl6cXFVEXNvXAYJsl692FVHqDpigXOCBzyo=
X-Received: by 2002:a05:620a:4005:b0:7a3:49e2:d5 with SMTP id af79cd13be357-7a4e15b7f45mr75248285a.5.1723486351141;
        Mon, 12 Aug 2024 11:12:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGINV1er94KHea7itgcrlskkFbFJC5xxX91ZMY2mT7mbgIaqz9jLoR0x5JTp0pkA3b+65JpVA==
X-Received: by 2002:a05:620a:4005:b0:7a3:49e2:d5 with SMTP id af79cd13be357-7a4e15b7f45mr75245485a.5.1723486350655;
        Mon, 12 Aug 2024 11:12:30 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7dee013sm268663985a.84.2024.08.12.11.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 11:12:30 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: "Kirill A . Shutemov" <kirill@shutemov.name>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	Huang Ying <ying.huang@intel.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	peterx@redhat.com,
	Vlastimil Babka <vbabka@suse.cz>,
	Rick P Edgecombe <rick.p.edgecombe@intel.com>,
	Hugh Dickins <hughd@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Rik van Riel <riel@surriel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linuxppc-dev@lists.ozlabs.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Oscar Salvador <osalvador@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v5 1/7] mm/dax: Dump start address in fault handler
Date: Mon, 12 Aug 2024 14:12:19 -0400
Message-ID: <20240812181225.1360970-2-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240812181225.1360970-1-peterx@redhat.com>
References: <20240812181225.1360970-1-peterx@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Currently the dax fault handler dumps the vma range when dynamic debugging
enabled.  That's mostly not useful.  Dump the (aligned) address instead
with the order info.

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 drivers/dax/device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dax/device.c b/drivers/dax/device.c
index 2051e4f73c8a..9c1a729cd77e 100644
--- a/drivers/dax/device.c
+++ b/drivers/dax/device.c
@@ -235,9 +235,9 @@ static vm_fault_t dev_dax_huge_fault(struct vm_fault *vmf, unsigned int order)
 	int id;
 	struct dev_dax *dev_dax = filp->private_data;
 
-	dev_dbg(&dev_dax->dev, "%s: %s (%#lx - %#lx) order:%d\n", current->comm,
-			(vmf->flags & FAULT_FLAG_WRITE) ? "write" : "read",
-			vmf->vma->vm_start, vmf->vma->vm_end, order);
+	dev_dbg(&dev_dax->dev, "%s: op=%s addr=%#lx order=%d\n", current->comm,
+		(vmf->flags & FAULT_FLAG_WRITE) ? "write" : "read",
+		vmf->address & ~((1UL << (order + PAGE_SHIFT)) - 1), order);
 
 	id = dax_read_lock();
 	if (order == 0)
-- 
2.45.0


