Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F421A910FDC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 20:01:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UpZ7Ybfi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4pFy4g01z3dBy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 04:01:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UpZ7Ybfi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4pC16kmSz3cRY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 03:58:53 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f4a5344ec7so8743795ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 10:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718906333; x=1719511133; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hj1QfKPBw8fFwUqArOqXUFjt0dwMTc6OO+45pzeQpo8=;
        b=UpZ7YbfiPyxokhCZUzBtjDnvleKLpqSlisybI9sanku4rGNCWGxliEQW+t3wd+u9NS
         5AXJRgXx+e7/Hrq6v/WRjmkRTX1cER7Al69BaO2R8YpYVO+/rRiYSIyy2nJTsDLlmCtJ
         kQnldpBp8qtaOGYAIrMRHKrALwbnLFfuHm9qnr5GwCF7T608O1TK9Jcvd5dnS8Zvz97Y
         kGx7NPMpjmODiqUidOSwTlJhZs0jHTWqQqk3TA/bha8j4Sx+9+69s+MdVXRDgp99yefr
         WeQsGFQtzTt9Ae9SflpLx1cgqZH6j8VmqZwOkcHIstllOP4QhYZakq448nRzkbeteAwZ
         TsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906333; x=1719511133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hj1QfKPBw8fFwUqArOqXUFjt0dwMTc6OO+45pzeQpo8=;
        b=N12bQqeuNZAkxK2uNDZlx8kedyoxcmiEDFThLoVZ2MwVacBs3Getil0GJ2Kv4FuQqG
         a+XmVFLhXRm5nyF8wmZwXKt0xmFUrbpY0cnYmr0LqgPrPk8Y7cBgL7yu4XCGEMa2RtUg
         DbpxfXEoTmHlKgb5dIESfWLYHjJ83McWxjHtVaLeFDgf5P40XJMOoL4z0hHIjQR5zzk6
         rOqj1/qnMFErszyfvneIjJwRItf/fKpZUhy3IqhuWWlvsrI8sQCKzYSOF0l4H+I3wjDE
         Vv3oVsBx+V4xYs8Q7r9ReerqS2tz/7W0socrAaKU/GMCCDQ7t6xABsbKr36mLvNUlGTe
         pyLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW0I2IK5hs6JRXQdoWDw4NyjQWit4D/YiAvt/OixnTl4NyjKQ4tQa6F4bB9MjAsMtjPJ+sodxTl+8PlI51LjEWsuSPA2trGhcIVLxZrA==
X-Gm-Message-State: AOJu0Yw7Up2JArfhNANdvcBZzbb/LHx5tu+faBUgceEJEIWX+V5b8u4h
	58Y4u+kMAcaGbnoIFxXdJ/B8erxkuxGaPDQOt8fr9bYx7KLoJMUd
X-Google-Smtp-Source: AGHT+IHv7hZ0hu3tHqs8vQg7dykPKbTq19sg2MZwzPshyGp9XYLFVMvIGQ9OcLfhnMnfvSTxeFX6Ow==
X-Received: by 2002:a17:902:d510:b0:1f6:ee7b:6ecf with SMTP id d9443c01a7336-1f98b28f021mr132320805ad.34.1718906333014;
        Thu, 20 Jun 2024 10:58:53 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9c92ac748sm19063135ad.187.2024.06.20.10.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:58:52 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org
Subject: [PATCH v4 37/40] KVM: PPC: Book3s HV: drop locking around kvmppc_uvmem_bitmap
Date: Thu, 20 Jun 2024 10:57:00 -0700
Message-ID: <20240620175703.605111-38-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240620175703.605111-1-yury.norov@gmail.com>
References: <20240620175703.605111-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, Jan Kara <jack@suse.cz>, Bart Van Assche <bvanassche@acm.org>, Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Matthew Wilcox <willy@infradead.org>, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>, Linus Torvalds <torvalds@linux-foundation.org>, Alexey Klimov <alexey.klimov@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The driver operates on individual bits of the kvmppc_uvmem_bitmap.
Now that we have an atomic search API for bitmaps, we can rely on
it and drop locking around the bitmap entirely.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 33 ++++++++++--------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 92f33115144b..93d09137cb23 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -86,6 +86,7 @@
  * page-sizes, we need to break this assumption.
  */
 
+#include <linux/find_atomic.h>
 #include <linux/pagemap.h>
 #include <linux/migrate.h>
 #include <linux/kvm_host.h>
@@ -99,7 +100,6 @@
 
 static struct dev_pagemap kvmppc_uvmem_pgmap;
 static unsigned long *kvmppc_uvmem_bitmap;
-static DEFINE_SPINLOCK(kvmppc_uvmem_bitmap_lock);
 
 /*
  * States of a GFN
@@ -697,23 +697,20 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
 	struct page *dpage = NULL;
 	unsigned long bit, uvmem_pfn;
 	struct kvmppc_uvmem_page_pvt *pvt;
-	unsigned long pfn_last, pfn_first;
+	unsigned long num_pfns, pfn_first;
 
 	pfn_first = kvmppc_uvmem_pgmap.range.start >> PAGE_SHIFT;
-	pfn_last = pfn_first +
-		   (range_len(&kvmppc_uvmem_pgmap.range) >> PAGE_SHIFT);
+	num_pfns = range_len(&kvmppc_uvmem_pgmap.range) >> PAGE_SHIFT;
 
-	spin_lock(&kvmppc_uvmem_bitmap_lock);
-	bit = find_first_zero_bit(kvmppc_uvmem_bitmap,
-				  pfn_last - pfn_first);
-	if (bit >= (pfn_last - pfn_first))
-		goto out;
-	bitmap_set(kvmppc_uvmem_bitmap, bit, 1);
-	spin_unlock(&kvmppc_uvmem_bitmap_lock);
+	bit = find_and_set_bit(kvmppc_uvmem_bitmap, num_pfns);
+	if (bit >= num_pfns)
+		return NULL;
 
 	pvt = kzalloc(sizeof(*pvt), GFP_KERNEL);
-	if (!pvt)
-		goto out_clear;
+	if (!pvt) {
+		clear_bit(bit, kvmppc_uvmem_bitmap);
+		return NULL;
+	}
 
 	uvmem_pfn = bit + pfn_first;
 	kvmppc_gfn_secure_uvmem_pfn(gpa >> PAGE_SHIFT, uvmem_pfn, kvm);
@@ -725,12 +722,6 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
 	dpage->zone_device_data = pvt;
 	zone_device_page_init(dpage);
 	return dpage;
-out_clear:
-	spin_lock(&kvmppc_uvmem_bitmap_lock);
-	bitmap_clear(kvmppc_uvmem_bitmap, bit, 1);
-out:
-	spin_unlock(&kvmppc_uvmem_bitmap_lock);
-	return NULL;
 }
 
 /*
@@ -1021,9 +1012,7 @@ static void kvmppc_uvmem_page_free(struct page *page)
 			(kvmppc_uvmem_pgmap.range.start >> PAGE_SHIFT);
 	struct kvmppc_uvmem_page_pvt *pvt;
 
-	spin_lock(&kvmppc_uvmem_bitmap_lock);
-	bitmap_clear(kvmppc_uvmem_bitmap, pfn, 1);
-	spin_unlock(&kvmppc_uvmem_bitmap_lock);
+	clear_bit(pfn, kvmppc_uvmem_bitmap);
 
 	pvt = page->zone_device_data;
 	page->zone_device_data = NULL;
-- 
2.43.0

