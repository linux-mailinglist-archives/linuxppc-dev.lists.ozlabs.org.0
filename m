Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC91B67EEF4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:58:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3T0Q4BSyz3fHW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:58:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=iI2a7Mep;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3bsnuywykdmwac9w5ty66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=iI2a7Mep;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3SdK6DDQz3fKk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:41:57 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id a62-20020a25ca41000000b0080b838a5199so6344390ybg.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vIuOo+WD7hhMM8dbfJD4mGHBD08/Cqf6l0kIi97gWpI=;
        b=iI2a7MepfOBNDqB7wu+/83gKbYOOOUW8grtwa3CiYxFM9JfwE6yM70Ne3Bb3nWcBVw
         Yu75uY4jTmGekedOn8ngeIwpB83dCuwgdGAmo3PP8/5H9WQZ6zUPSiR4iOLBbFN7215j
         t5fY8PD6baQLdLtkjh6u6ca2lGsT7fHu5oxzuRWhyEjLoCc6wJIYtxHPj4OPz1R/r154
         +v9JTIHiwr1S1nQG1EzjVKOQzPqMVCb1Q8Qi6vYQuYU/8I9rd1kQnHGC5kdzCbnlOWk7
         FPBIbkrQ5+p0qEBCYmhl8CWtOia+KC/VA/z2TgOLyA8KXzLYreAkUsa906GcFZG1qYyr
         SCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vIuOo+WD7hhMM8dbfJD4mGHBD08/Cqf6l0kIi97gWpI=;
        b=pB9xcxhHICEg1GN7qhnl6uCOwFDVwQUlSzH/SoQpVxxtkMU3vlfSbp2yz7hySiapIi
         IB7r14jm+c6j5G51tw/gbqlUM4BVaufN68E6skZn3oW+sR9850BY9GnjiJsU1EKaaf0E
         fE5tLFqAAiIbetE/TmWJZ2YdfiqjuJd6Up+M+BRmzFVs8C45gcoB9+cH+pqnyAp4Rjhf
         w0fOfJT+4uvox+hEYjXcV9/PYvbix/1r+HzC5l3NYy2D841sxb5MMQZ1QO71275nJyHz
         zkPlP0zHorwp2eUeSz9XosiNnuMWW6H99icRxXAhtHV5CYnF05L1O1myB6dGVmoeiYAI
         Dt1g==
X-Gm-Message-State: AO0yUKVgbYjnqpX+Wfb19s6KJ+wVbk2FOr7weFD0LreZ1fGKB37ctWg6
	e5jmTf/Ruw8P5/nhC9ApphmNKatq00Y=
X-Google-Smtp-Source: AK7set91XCOXqw0Dg5UJpzZX/mqq3ueYFNiPcfvNNp2V4Tl7t8riuyYgZdoB/8yFEdiYxfiOzkRBBcWpyqU=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a81:3e15:0:b0:506:653c:db97 with SMTP id
 l21-20020a813e15000000b00506653cdb97mr1675918ywa.201.1674848517274; Fri, 27
 Jan 2023 11:41:57 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:55 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-19-surenb@google.com>
Subject: [PATCH v2 18/33] mm: write-lock VMAs before removing them from VMA tree
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rp
 pt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Write-locking VMAs before isolating them ensures that page fault
handlers don't operate on isolated VMAs.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c  | 1 +
 mm/nommu.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index b3c247073aa0..5bdfd087b632 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2261,6 +2261,7 @@ int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
 static inline int munmap_sidetree(struct vm_area_struct *vma,
 				   struct ma_state *mas_detach)
 {
+	vma_start_write(vma);
 	mas_set_range(mas_detach, vma->vm_start, vma->vm_end - 1);
 	if (mas_store_gfp(mas_detach, vma, GFP_KERNEL))
 		return -ENOMEM;
diff --git a/mm/nommu.c b/mm/nommu.c
index 57ba243c6a37..2ab162d773e2 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -588,6 +588,7 @@ static int delete_vma_from_mm(struct vm_area_struct *vma)
 		       current->pid);
 		return -ENOMEM;
 	}
+	vma_start_write(vma);
 	cleanup_vma_from_mm(vma);
 
 	/* remove from the MM's tree and list */
@@ -1519,6 +1520,10 @@ void exit_mmap(struct mm_struct *mm)
 	 */
 	mmap_write_lock(mm);
 	for_each_vma(vmi, vma) {
+		/*
+		 * No need to lock VMA because this is the only mm user and no
+		 * page fault handled can race with it.
+		 */
 		cleanup_vma_from_mm(vma);
 		delete_vma(mm, vma);
 		cond_resched();
-- 
2.39.1

