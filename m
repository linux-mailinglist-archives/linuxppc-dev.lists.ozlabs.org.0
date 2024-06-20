Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 373A6910FE1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 20:02:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AE5StWle;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4pGl6jVtz3fpg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 04:02:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AE5StWle;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4pCC3Frfz3d9B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 03:59:03 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7046211e455so847576b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 10:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718906342; x=1719511142; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+W8qrsNzjA5KvK9XemaQbK3hnneV0OURa4QuE2WY6E=;
        b=AE5StWleTuECpSppnUffcNh5QZzzWuVQ6NrP3WA2YzvDkIKrhREMlqgawfKh+gFzAW
         QBkhZUssun/YcRYvKdTc6IwhRLyapNftrYlRsXtngUKUaaRJWupb82a3RLBqUDSP60ub
         v9Cfuob/ixWp6kHdTwNu4l6ydN1j2UBt7jmhjdHwdxdT/omtQxBOMdZ5t8DAvcDHLvIw
         lseLp/M8jeO2YQrHOCOA0/PfXSYDkKqegx4sH3PtlXz87tAWq5Rdz9eN787ulEAs1AaS
         Nv51p/ZJuvUU9cnwlGIUlJwumchh560JCBlCOj44DBKhpnJ4K8F9qp90X449MnycG12B
         pvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906342; x=1719511142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+W8qrsNzjA5KvK9XemaQbK3hnneV0OURa4QuE2WY6E=;
        b=fKnuD8Iringlijoy7X3WQIgCTeV8iOLvK29vK/QZRVkxu9DCrndueZI47nS8F1MNY3
         xeaKMYTWpYNt8Eg8W88oFfsstGNL91UBA8xzZCVyt9DbQCpKl6MnfLxs0L2tfCCpSC6F
         DYSjmLBDxW/sFHIE8jI/o12jWxmWdiogrW9qh9IWDehtaSEmY8wLjXFh+0BI9EtXbhdb
         tbNwb2FKrce5+1aauhItVQ/3fx2YPJXdgMUZKPIimbrQeyMZyZ3iv+gyxBhCDjL0fptw
         hTLxL9r9howFeQPxg/paT2EtPESnDAh4tn1drSWbGLm5XNi0Y0ihHi5Q+tdwuIwRq+8P
         FAOg==
X-Forwarded-Encrypted: i=1; AJvYcCWvpfZr9X7k4sF80isNNCk/WeXVSanOpVlU0mx1SZkmHSZRI8v8qR549AamzplTXSirDQZFzX0dqI+X9nRWsAZtsQBmbRus7tKjaHc0aA==
X-Gm-Message-State: AOJu0Yx22gK0D7Jc9AhvL2dWR4cMjVbLaAODqUFyBZiT1Fr515vw6X//
	zTVi3nVsPavjzBJMLtlH+8QFKdihadwUvp7on84EW45aVDdmw07K
X-Google-Smtp-Source: AGHT+IEbaEr10aoZqMNXkMGuZ5af7kUmWBhANe7UmWWwHg5OCvBD+k/5bSXXGBLZOHAs+1L/wt8fOA==
X-Received: by 2002:aa7:820d:0:b0:704:3491:d74e with SMTP id d2e1a72fcca58-70629cce5b3mr5236265b3a.22.1718906341930;
        Thu, 20 Jun 2024 10:59:01 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb4c621sm12637684b3a.115.2024.06.20.10.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:59:01 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Yury Norov <yury.norov@gmail.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 40/40] powerpc/xive: drop locking around IRQ map
Date: Thu, 20 Jun 2024 10:57:03 -0700
Message-ID: <20240620175703.605111-41-yury.norov@gmail.com>
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
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, Jan Kara <jack@suse.cz>, Bart Van Assche <bvanassche@acm.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Matthew Wilcox <willy@infradead.org>, Alexey Klimov <alexey.klimov@linaro.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The code operates on individual bits of the bitmap, and leveraging
atomic find ops we can drop locking scheme around the map.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/powerpc/sysdev/xive/spapr.c | 34 ++++++--------------------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index e45419264391..2b3b8ad75b42 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -17,6 +17,7 @@
 #include <linux/spinlock.h>
 #include <linux/bitmap.h>
 #include <linux/cpumask.h>
+#include <linux/find_atomic.h>
 #include <linux/mm.h>
 #include <linux/delay.h>
 #include <linux/libfdt.h>
@@ -41,7 +42,6 @@ struct xive_irq_bitmap {
 	unsigned long		*bitmap;
 	unsigned int		base;
 	unsigned int		count;
-	spinlock_t		lock;
 	struct list_head	list;
 };
 
@@ -55,7 +55,6 @@ static int __init xive_irq_bitmap_add(int base, int count)
 	if (!xibm)
 		return -ENOMEM;
 
-	spin_lock_init(&xibm->lock);
 	xibm->base = base;
 	xibm->count = count;
 	xibm->bitmap = bitmap_zalloc(xibm->count, GFP_KERNEL);
@@ -81,47 +80,26 @@ static void xive_irq_bitmap_remove_all(void)
 	}
 }
 
-static int __xive_irq_bitmap_alloc(struct xive_irq_bitmap *xibm)
-{
-	int irq;
-
-	irq = find_first_zero_bit(xibm->bitmap, xibm->count);
-	if (irq != xibm->count) {
-		set_bit(irq, xibm->bitmap);
-		irq += xibm->base;
-	} else {
-		irq = -ENOMEM;
-	}
-
-	return irq;
-}
-
 static int xive_irq_bitmap_alloc(void)
 {
 	struct xive_irq_bitmap *xibm;
-	unsigned long flags;
-	int irq = -ENOENT;
 
 	list_for_each_entry(xibm, &xive_irq_bitmaps, list) {
-		spin_lock_irqsave(&xibm->lock, flags);
-		irq = __xive_irq_bitmap_alloc(xibm);
-		spin_unlock_irqrestore(&xibm->lock, flags);
-		if (irq >= 0)
-			break;
+		int irq = find_and_set_bit(xibm->bitmap, xibm->count);
+
+		if (irq < xibm->count)
+			return irq + xibm->base;
 	}
-	return irq;
+	return -ENOENT;
 }
 
 static void xive_irq_bitmap_free(int irq)
 {
-	unsigned long flags;
 	struct xive_irq_bitmap *xibm;
 
 	list_for_each_entry(xibm, &xive_irq_bitmaps, list) {
 		if ((irq >= xibm->base) && (irq < xibm->base + xibm->count)) {
-			spin_lock_irqsave(&xibm->lock, flags);
 			clear_bit(irq - xibm->base, xibm->bitmap);
-			spin_unlock_irqrestore(&xibm->lock, flags);
 			break;
 		}
 	}
-- 
2.43.0

