Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 924A06A48A4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:53:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSm33Qldz3fWY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:53:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=J6HTSW3i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3uor8ywykdd8tvsfochpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=J6HTSW3i;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSPG20rYz3cLT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:37:22 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-536cb268ab8so154440477b3.17
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r0m7Mx7yExEfpE40BLjkT9H7Bv79s8byLhYJ0wRxTC4=;
        b=J6HTSW3ije3IDV45f4imLJua2F9c9fG/LezyaDIF0k2VV4fuwgH+fku2QXSjWP2auL
         d+6+O+xNSm6Xj7FlWbcn2IucG0PD3/gJW2mH/MURmde3Q+9WMeczT04Csr++aQNQAB4v
         uOclz5rts/w0oMZxgj6JdiddKEJJwswsgJAAZvi48OAzGBi1BuSBhTNF8+d2d3+YbCDm
         fwaoPEsSaG9C8KiMPsrgpeVhqU2cm1pHUxTYDzrWvN6667+vmOEZ293x3rsB2i9qTzir
         LhGya0SRahx81MeDy4vFauftQ8Z+i+VjBO+uhvPnINIKKKPeRWHZkWIWZS9shPaay/sM
         /HGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r0m7Mx7yExEfpE40BLjkT9H7Bv79s8byLhYJ0wRxTC4=;
        b=oHg8KcPsYI5LG0H7I0aiwMHg9DrPpBEyjwgC33DInIToD1B32lrmSXxwnNzZNAX1KW
         3xV+8UK+XsqYZxMNsmUTe/oN0KLFljknfda8XtJbLq3cWrs04kGUIwrRODv928zE78XY
         EnqdSVFDbj14O4hOCtJMaNtacAK5JlyRe6EGZLCBixURmIj48IEoaExigfUQ3FC42u6y
         4CBKM3uuOQKNy6iixGlB8DXpV8K31c1oHXVs4wXuiMjH8EGiaPHYIhFb0GUCPMRq3C9A
         CqWTBwzd3MsvOabyRvchLTWMvjHjKa1VVfEBFbRUlWiZW+kN1T5dkov38IqeJX+BW1+A
         bYcw==
X-Gm-Message-State: AO0yUKVbEYNpIuuAsmWTSHdCd3nDNrf0pF8arNnUmDG8oqba1YscEBZ2
	yX83CmFGgA7nSfE6F6onx1kC/j1fCLo=
X-Google-Smtp-Source: AK7set8EV36Dr/ESiL80fu1d1SaW9bmdiDECZfWEbGGMOjKuqTD7GEuVWa5jynsNqQ2pFS6J79ENwuY0pY0=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a25:938e:0:b0:a60:c167:c056 with SMTP id
 a14-20020a25938e000000b00a60c167c056mr4911453ybm.9.1677519440118; Mon, 27 Feb
 2023 09:37:20 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:17 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-19-surenb@google.com>
Subject: [PATCH v4 18/33] mm: write-lock VMAs before removing them from VMA tree
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
index 1f42b9a52b9b..f7ed357056c4 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2255,6 +2255,7 @@ int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
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
2.39.2.722.g9855ee24e9-goog

