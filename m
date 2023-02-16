Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0851698C23
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:36:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNwF4Cxyz3fjW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:36:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LRD+lTaX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3slztywykdacz1yluinvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LRD+lTaX;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNX272vfz3f4R
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:42 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-4fa63c84621so8403537b3.20
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rL5PSjChr8wFTlKRWTO498bp0kCwADLZZe/SXHes2h8=;
        b=LRD+lTaXr6Pqw8LYMkej56Kfm91pJviFVpFaUDR17WEIFgUKOpU+ogLRfy6oidvw/F
         4mOXwIhPJkh7gxaJzacQ5Q2xpA2MxMudctw4pQKYtuqshuSCMBeCw647b99z6JqUfMYU
         FnWI7aY3RIFvc0EuIZqwF4n5sAACqaxfMc5BUHOhpo7PrLkybX4Nw85DLStMxOu85Den
         S+x5aTXsnUr3Va/T4IBtQXPzTR4iMs6msv64zgKWL87HLYoK/sTJqZLT5fditOnzScG6
         JUQkoM18jflZAeAGFMAkFQi7v0aeD9Evl42tB/J4ec9dW/Jbo4ktb05auTom3OB08iqz
         18AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rL5PSjChr8wFTlKRWTO498bp0kCwADLZZe/SXHes2h8=;
        b=wbgnvg10TUSH/kClmv/Rcyp7bqGQuEY26wpTsEHjC4HCSRaHwJQ728hZN1QHRYDnyx
         JWM0VJ8WOS/BzPNv2QaiV8qXUDqC4HztFCbGhUQpzTV0ADek+6puB8KLSTJyR4CRtwqA
         wiB2b6BrskbnrGdspaP0c8o9Rdxcebj5cFOKYaksVuB3hwsNdtdYNuqTgNtI4kQLn8pp
         xz3b5JWPeXhB4UplZAI0FWwSIl4OTE11/bGyPuXClFPixsiGQnUdoroi/iz+Bn8YhvIu
         s8BwxFVpGyZSDQ6WMR7hlc01lrWa3un/R48OkyxdZmq023HWCEhvreW29Nzp0rM6Pb30
         2t+w==
X-Gm-Message-State: AO0yUKUP9gIjOD6ErqZul7EnKc6CCqE3WvgVjGZc+jom4l9rVcVDFmW4
	5kaM+xZE31Lt506fqBB2Irph27jhukk=
X-Google-Smtp-Source: AK7set+44y5aeQf1zuFNW05XeMWyuIDsdI+r8pPqkHzR/in6WRVQ9dwNjFzyqkfy6m3wNLuusOCyHSVO/GU=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a0d:e506:0:b0:52e:c531:20b3 with SMTP id
 o6-20020a0de506000000b0052ec53120b3mr448676ywe.147.1676524720915; Wed, 15 Feb
 2023 21:18:40 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:34 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-20-surenb@google.com>
Subject: [PATCH v3 19/35] mm: write-lock VMAs before removing them from VMA tree
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
  hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
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
index 0eaa3d1a6cd1..aaa359a147b2 100644
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

