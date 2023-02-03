Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B32076890A6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 08:20:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7Rrn4S14z3f8v
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 18:20:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AHiRLfcf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AHiRLfcf;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Rpt2mLFz3bhW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 18:19:02 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id n13so4386794plf.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Feb 2023 23:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnlBvkqnb+l7IeUx8vg7gSpE5ieSkYXmCCbewvNAOcI=;
        b=AHiRLfcf8eUNQBnlAsruaF06DgmSEYeMrWMiRHEZ9X5oCS8EFKY0D1+uSzk001rKHG
         wM6Q2U10Pn14JQyW+l0O/c8z+fkwxIm/NPitBdfs40sfGlyXsENjatpI1RZhPk232lvA
         zDdUzhnba9x94swlHDb7UkVrJFnMqWpYzmGo4TPTsGtXHfXv9sfrWlf3syDxwLR5ipEX
         dFRmiJAgq8XvaTNIFp5Qu+WClm6+oFC9LekqRQUzG9QfdZgJPNJtJkIdPe1uHKJYpQRj
         YyJEeIrYiO6SEa4xtr2WXCweUe8cAWZ/KQ4ykObFGtMcv3jpBg0TZs/m6RR8iSh/nfe2
         i5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnlBvkqnb+l7IeUx8vg7gSpE5ieSkYXmCCbewvNAOcI=;
        b=ZGm00+azaIg53Zp5boQBFmWY9BYxOUvTl5AXPLc1pWcxnid2tBNU0f5lh4DGRED6n2
         VsBI6K38wiS2jZQ1dRbEM2mOMT+MBnbyjnSHvWSuvRQjWVexXameEMMMWghKFAnbvrEn
         gNG2Fwun0U6dQKWpxs8kDbVV3K+7xwwMqPrXXqHz8u+onrR8MXgS8OIvTp9gRIvRa6lK
         K4LXQ0IKWuz70fqsxanv6GHY+rxx46a7FeMxO1vUWi0KDFOIoIIcfjEgt9bMLlNxz6nJ
         tXZ0MrAGWH4p9jAZ+bojIr/LCSQkH+QvntgJ0I0+ZJfaq3L0T98NTKaHjmuOUjHUW8Za
         3nYA==
X-Gm-Message-State: AO0yUKVK43v+DSLvEpC8dlKhORBE3cnyqIyv7i/c8sKI7r8wlAOEbjLC
	Kp9qFAtezQY/RjO7xnYbU7g=
X-Google-Smtp-Source: AK7set9/19Ishv+YbUs//IpJgvi84ti72zlNw3k1E7pi36wh6xfDzDjNIuz8qP6WMzuLeNCLPjc4Ag==
X-Received: by 2002:a05:6a20:4413:b0:be:cd2f:1951 with SMTP id ce19-20020a056a20441300b000becd2f1951mr12089686pzb.41.1675408740099;
        Thu, 02 Feb 2023 23:19:00 -0800 (PST)
Received: from bobo.ibm.com (193-116-117-77.tpgi.com.au. [193.116.117.77])
        by smtp.gmail.com with ESMTPSA id f20-20020a637554000000b004df4ba1ebfesm877558pgn.66.2023.02.02.23.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 23:18:59 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 1/5] kthread: simplify kthread_use_mm refcounting
Date: Fri,  3 Feb 2023 17:18:33 +1000
Message-Id: <20230203071837.1136453-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203071837.1136453-1-npiggin@gmail.com>
References: <20230203071837.1136453-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Rik van Riel <riel@redhat.com>, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Nadav Amit <nadav.amit@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove the special case avoiding refcounting when the mm to be used is
the same as the kernel thread's active (lazy tlb) mm. kthread_use_mm()
should not be such a performance critical path that this matters much.
This simplifies a later change to lazy tlb mm refcounting.

Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 kernel/kthread.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index f97fd01a2932..7424a1839e9a 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -1410,14 +1410,13 @@ void kthread_use_mm(struct mm_struct *mm)
 	WARN_ON_ONCE(!(tsk->flags & PF_KTHREAD));
 	WARN_ON_ONCE(tsk->mm);
 
+	mmgrab(mm);
+
 	task_lock(tsk);
 	/* Hold off tlb flush IPIs while switching mm's */
 	local_irq_disable();
 	active_mm = tsk->active_mm;
-	if (active_mm != mm) {
-		mmgrab(mm);
-		tsk->active_mm = mm;
-	}
+	tsk->active_mm = mm;
 	tsk->mm = mm;
 	membarrier_update_current_mm(mm);
 	switch_mm_irqs_off(active_mm, mm, tsk);
@@ -1434,12 +1433,9 @@ void kthread_use_mm(struct mm_struct *mm)
 	 * memory barrier after storing to tsk->mm, before accessing
 	 * user-space memory. A full memory barrier for membarrier
 	 * {PRIVATE,GLOBAL}_EXPEDITED is implicitly provided by
-	 * mmdrop(), or explicitly with smp_mb().
+	 * mmdrop().
 	 */
-	if (active_mm != mm)
-		mmdrop(active_mm);
-	else
-		smp_mb();
+	mmdrop(active_mm);
 }
 EXPORT_SYMBOL_GPL(kthread_use_mm);
 
-- 
2.37.2

