Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6596715D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 09:05:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxdcH1sLDz3fMf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 19:05:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WcdwzEYp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WcdwzEYp;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxdVN3ls8z3cgm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 19:00:44 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id z1-20020a17090a66c100b00226f05b9595so1396962pjl.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 00:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cadyF8CD/E3oK1yfSJSphX1/cZjS+kj7x9tW6+ar6sc=;
        b=WcdwzEYpRynxGJWgQlKjA9zr5Ugl+tLrV/aeoKmaEyWm5I+eofmuFjC8v+O5CZJC8w
         tOZB+tAJR4+wiFQ1iaQWMCDXko5KxSau59i0CeKJSVmyvX/0i6O5Zr39SstJW0Z3rE1B
         Fyu5ijjz/jR31RZrsNZLyh0clWoOshZNgMIiETyrsUXvb3eq/iyNx1mkClYVLAY7+64k
         zYOIM7lzO4YVQSlFFkESwH80wBohrcEE2EqtboWnWa9tbyNk7GkZ4n+1ZHeUM7FQ71rU
         UAR97RL8R4zHQ490YhXWXkQbBJPh185TldI1Fz1/+yE5zazmCzPESNz0kF9nXmNoebc3
         uPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cadyF8CD/E3oK1yfSJSphX1/cZjS+kj7x9tW6+ar6sc=;
        b=qWcfZ3597hWjkq6k7DW5q7e7K20JI+wJ7fy2eAtaT1+f1wEPMxzE0oy04Mj5bgB8Ym
         Scrauz5t8w2Xa1dqpr6SgS8fZpXuvhfmXZtFF4P3OTtOf8O15dkJEYS/WhIzdrastX+J
         wf/5X3ZSuKXacwmYBqE0wHVM3Dzh7iBVTzg5uw+Z00PEa12FS/fEKaQFXv7Dd3GNze20
         /5F93jAty7Ox3barm2NNL/XSwREzKiUxl4KqIhzwE/kp0I7EYSbA6LaUF5OUsym8t9gF
         JwYUOytjgvcGkmN6LKy8wXZmonK5ZTNw+MnCkDdkLN9Zn21gsh7YykKr4zbJPxK9r67F
         kp0w==
X-Gm-Message-State: AFqh2kowic7WTU5M7sAAC+GVzH/uZPa3687SeKp29nqD2HmaDge5+CaV
	OAZTmqxQVHGjqjIH/m1cDT0=
X-Google-Smtp-Source: AMrXdXvru18rhSMREurCixBPKsRCor9uxoV61Ex5rHoJVQ7gmSRE7YHzcemWD4ARplQOcaVlqvp+VQ==
X-Received: by 2002:a17:90a:3fca:b0:227:161a:6318 with SMTP id u10-20020a17090a3fca00b00227161a6318mr6162197pjm.47.1674028842208;
        Wed, 18 Jan 2023 00:00:42 -0800 (PST)
Received: from bobo.ibm.com (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090a16c200b002272616d3e1sm738462pje.40.2023.01.18.00.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:00:41 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v6 5/5] powerpc/64s/radix: combine final TLB flush and lazy tlb mm shootdown IPIs
Date: Wed, 18 Jan 2023 18:00:11 +1000
Message-Id: <20230118080011.2258375-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230118080011.2258375-1-npiggin@gmail.com>
References: <20230118080011.2258375-1-npiggin@gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Nicholas Piggin <npiggin@gmail.com>, linux-mm <linux-mm@kvack.org>, Andy Lutomirski <luto@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

** Not for merge **

CONFIG_MMU_LAZY_TLB_SHOOTDOWN that requires IPIs to clear the "lazy tlb"
references to an mm that is being freed. With the radix MMU, the final
userspace exit TLB flush can be performed with IPIs, and those IPIs can
also clear lazy tlb mm references, which mostly eliminates the final
IPIs required by MMU_LAZY_TLB_SHOOTDOWN.

This does mean the final TLB flush is not done with TLBIE, which can be
faster than IPI+TLBIEL, but we would have to do those IPIs for lazy
shootdown so using TLBIEL should be a win.

The final cpumask test and possible IPIs are still needed to clean up
some rare race cases. We could prevent those entirely (e.g., prevent new
lazy tlb mm references if userspace has gone away, or move the final
TLB flush later), but I'd have to see actual numbers that matter before
adding any more complexity for it. I can't imagine it would ever be
worthwhile.

This takes lazy tlb mm shootdown IPI interrupts from 314 to 3 on a 144
CPU system doing a kernel compile. It also takes care of the one
potential problem workload which is a short-lived process with multiple
CPU-bound threads that want to be spread to other CPUs, because the mm
exit happens after the process is back to single-threaded.

---
 arch/powerpc/mm/book3s64/radix_tlb.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 282359ab525b..f34b78cb4c7d 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1303,7 +1303,31 @@ void radix__tlb_flush(struct mmu_gather *tlb)
 	 * See the comment for radix in arch_exit_mmap().
 	 */
 	if (tlb->fullmm || tlb->need_flush_all) {
-		__flush_all_mm(mm, true);
+		if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_SHOOTDOWN)) {
+			/*
+			 * Shootdown based lazy tlb mm refcounting means we
+			 * have to IPI everyone in the mm_cpumask anyway soon
+			 * when the mm goes away, so might as well do it as
+			 * part of the final flush now.
+			 *
+			 * If lazy shootdown was improved to reduce IPIs (e.g.,
+			 * by batching), then it may end up being better to use
+			 * tlbies here instead.
+			 */
+			smp_mb(); /* see radix__flush_tlb_mm */
+			exit_flush_lazy_tlbs(mm);
+			_tlbiel_pid(mm->context.id, RIC_FLUSH_ALL);
+
+			/*
+			 * It should not be possible to have coprocessors still
+			 * attached here.
+			 */
+			if (WARN_ON_ONCE(atomic_read(&mm->context.copros) > 0))
+				__flush_all_mm(mm, true);
+		} else {
+			__flush_all_mm(mm, true);
+		}
+
 	} else if ( (psize = radix_get_mmu_psize(page_size)) == -1) {
 		if (!tlb->freed_tables)
 			radix__flush_tlb_mm(mm);
-- 
2.37.2

