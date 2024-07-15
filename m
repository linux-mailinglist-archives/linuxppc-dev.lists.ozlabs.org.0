Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CEE931AC9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 21:23:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXILu6E5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J8Z9o01c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNBtk4vdjz3d9G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 05:23:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXILu6E5;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J8Z9o01c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNBsG4p4Sz3cTQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 05:21:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721071311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrFUBbcc9D0ORnx0qoNz81Y3Ewmb+xGo+hBykZs/BiM=;
	b=IXILu6E5x3wA5zsonL8tx+nw5zAbj/4h66MD4lGDFIENTvebrBRz4jjQzyKFKuaNNLLP4t
	z0F5r9JRnur8+KOJJGg1UX6SZ89Ye4sazvhEy6fj7WEhtvR/qzErXuvK1hyaL/lMyRV4Df
	svhn6r90gjDiG8R9lfd07sa4gH0grXc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721071312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrFUBbcc9D0ORnx0qoNz81Y3Ewmb+xGo+hBykZs/BiM=;
	b=J8Z9o01cfQb8XK6xOM3dh5J1L3rbLv0hfnWkmaen02CATa8CSeuU1OKRoSIrP89Wj7VW3i
	tt1e9XiDJADXZR5Gmy92KvkoZ1z0ZSc5kp2RiuBfGz6IuLQM3Kn2spiTcxHwtam+mnZyym
	ybES5L60lKkCsyFeZWmjyofmEpYFBw4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-1POi026XOzOcx440-vUmGw-1; Mon, 15 Jul 2024 15:21:48 -0400
X-MC-Unique: 1POi026XOzOcx440-vUmGw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6b5e99c06efso9781266d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 12:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721071308; x=1721676108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrFUBbcc9D0ORnx0qoNz81Y3Ewmb+xGo+hBykZs/BiM=;
        b=mkJwfCMFHH+lPdBWd1w26bdRAtrxhaJ22jeebZ+b/8MsqQpaHxEMiRMOywYNPt2Qrm
         0LnUejeo32D+87mlLSjn+j+qjjigCFXEZruZkUIZLMB0MR86kcE5GA2OU7NjsmI8UC8g
         WvIQTuN7GpVxLBKOGX067wFgzChtgwtkJz2Y84ES0lLdh9U7KQwXDcpGHWchWylPsx3x
         HEi5qGuFpGACVI28AgX5YbKA7woBDCHVF6WnuZl3wykywuj7tg2/Xy4X01xDukrGDjnc
         gfxj9ZHw0TTL0PkK1JPL6DdyPGL5WZ6vlAJy2NLPXJVbEXRh/rfvY7aFcG0AySG6qpvj
         VgEg==
X-Forwarded-Encrypted: i=1; AJvYcCW+JloE09UqC8O3gUfu/bUYTkdaIZqdNTcdcI4nugnsg7PMXZv/pV0i6oqhAY8UJ13EbfyJo4N548OOUUCJ/ivqlK4slZe6SZRI1QGVhQ==
X-Gm-Message-State: AOJu0Yzx92WrFSFvLKoLWgLs8I+FwrB4aOtjJs0xnwpDgX3ZBjMyxwdf
	USSmCD9s4jVCE4nVzrYQMPnQeo7nvrOYaKQ0FtkIaGPzkyeIy6jwpbqyzw87uWH43L6aLhugNpd
	zSKBsby0FMpvqsaqF+oMChrVerdV73i5lEX5w8bgtOTZW8JO0Adk8b6CsHcByPhM=
X-Received: by 2002:a05:6214:3209:b0:6b7:64a2:3189 with SMTP id 6a1803df08f44-6b77e17f47fmr4877846d6.8.1721071308374;
        Mon, 15 Jul 2024 12:21:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFchV1JB+E55nHTPY9KJJNPGb9+S7LV2RfQetOl80mLgqA/kra292Zxs5L4jIR6tRho3Ee1yQ==
X-Received: by 2002:a05:6214:3209:b0:6b7:64a2:3189 with SMTP id 6a1803df08f44-6b77e17f47fmr4877546d6.8.1721071308060;
        Mon, 15 Jul 2024 12:21:48 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b761978d30sm24039356d6.31.2024.07.15.12.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 12:21:47 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/8] mm/dax: Dump start address in fault handler
Date: Mon, 15 Jul 2024 15:21:35 -0400
Message-ID: <20240715192142.3241557-2-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240715192142.3241557-1-peterx@redhat.com>
References: <20240715192142.3241557-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the dax fault handler dumps the vma range when dynamic debugging
enabled.  That's mostly not useful.  Dump the (aligned) address instead
with the order info.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 drivers/dax/device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dax/device.c b/drivers/dax/device.c
index eb61598247a9..714174844ca5 100644
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

