Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 598A094B0A8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 21:50:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YRhbpR9/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YRhbpR9/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfLPR1tQXz3dFL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 05:50:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YRhbpR9/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YRhbpR9/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfLMD550Rz3d96
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 05:48:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723060099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Kq72BfB1Q9PD26Udwsuz2Gt7rCvKvwunl3vkpU7op8=;
	b=YRhbpR9/bEBQ8FUkOxax6RVR0ouj58Zp+y5gK9iyFahINpBqNP8GnN5ZpwUHd4OH997LhK
	/b6YVpDcM9UIEtnJB0OX1GAk/Z9bxN+vLq+sohBtKQA8Ez7UPrgh3UHuZDuDGkSOw3Ay1X
	UkdnqvIku3b/RUybWhHrb51jgftYABk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723060099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Kq72BfB1Q9PD26Udwsuz2Gt7rCvKvwunl3vkpU7op8=;
	b=YRhbpR9/bEBQ8FUkOxax6RVR0ouj58Zp+y5gK9iyFahINpBqNP8GnN5ZpwUHd4OH997LhK
	/b6YVpDcM9UIEtnJB0OX1GAk/Z9bxN+vLq+sohBtKQA8Ez7UPrgh3UHuZDuDGkSOw3Ay1X
	UkdnqvIku3b/RUybWhHrb51jgftYABk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-nczqYeA1PGCtz_hvbNZ4Lw-1; Wed, 07 Aug 2024 15:48:18 -0400
X-MC-Unique: nczqYeA1PGCtz_hvbNZ4Lw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6b7a0e7b823so476426d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 12:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723060097; x=1723664897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Kq72BfB1Q9PD26Udwsuz2Gt7rCvKvwunl3vkpU7op8=;
        b=Qa/ZTkEeaSWU0dT410edeOrWMnZB90pupl/3H/sI+THnLD1AfUV9iRk18SeHSi660w
         Hy7kHIffiWhNy5hffQXub0NLxANzTGdhg80PJUKJwAO02PLtkT2Oop4A7im9+X/gSCHq
         eP5Vu5g7XaBU4cyIPuN7g9RA3A+7yiFdS+XGn2lzGufOFBfzZoSSAGiEmWTjvR0bwpb6
         81nChzP1/MqJw9B7TiVcM0PU3Ar5cHqXqX6MeEVOOZRMLvJECdT0zT7vDsz5xe/SxBZI
         +5f6db6ptAkaINaWSXaaN8T7bRnfqo+tbPhTLPKdHQ6jywNhc2FInf/SZpuckcSXUTqv
         yL0w==
X-Forwarded-Encrypted: i=1; AJvYcCV03ILoiKUklJKs1X4cxFwsER71XarvIz4JZHsvKYC/MEwO4bfZncqX99bfnRLjzQwzUQ3hkG+MTufQAU8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yym5BKXX9nn95ukTYsIXG10OVgfuwFGPpLKrrczPIbLSXxJFKYd
	PaWuoIBrGHCrSCLKHWaFkUH2mFjXkNgIqeTe5ChDKpIOqlFaDXSNpHKIeC9ICKrpSjd9bFwaKZ9
	KVUxckMhRS+rLu/xE7D0DZ28Q2kKbLcF3jN6RJoI/PTLdJuwBD5ysVQvPH1pGE7M=
X-Received: by 2002:ad4:5f89:0:b0:6b2:b5b5:124e with SMTP id 6a1803df08f44-6bb98201fe5mr130641396d6.0.1723060097407;
        Wed, 07 Aug 2024 12:48:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2kwiMDYWwjAOmnvJrXFpiL3DqhuBYXy1c4XYYU13it34Yz8NGLRxRmyIIbMBrd7nnJuhzgA==
X-Received: by 2002:ad4:5f89:0:b0:6b2:b5b5:124e with SMTP id 6a1803df08f44-6bb98201fe5mr130641186d6.0.1723060096990;
        Wed, 07 Aug 2024 12:48:16 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c78ae4asm59853256d6.33.2024.08.07.12.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 12:48:16 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v4 1/7] mm/dax: Dump start address in fault handler
Date: Wed,  7 Aug 2024 15:48:05 -0400
Message-ID: <20240807194812.819412-2-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240807194812.819412-1-peterx@redhat.com>
References: <20240807194812.819412-1-peterx@redhat.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

