Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2105A56BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:07:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGl0W0QsWz3c4N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:07:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=c5Ge838G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=33y4nywykdjaceby7v08805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=c5Ge838G;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk4x3Pscz3bkQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:25:53 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id f1-20020a170902ce8100b001731029cd6bso6735740plg.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=tMRmbcwOZDIFaTPxLY27tBFqvxpOSXiDeb2XTcL9iTc=;
        b=c5Ge838GLG1Fn9WCiifxSW0yY2J286Z3nb7CHVsgQeKl819oavnaneDjs0pHM1pBgc
         6/VXxA27srsSSYsH3q/5JQwqbG7gvhz/dxlqpfYYnChp/oSAOK1144eGZRxL5H4xfU4+
         gXjPirwbsBHls6abdkbd/Ru5neoY+5POLJLE67tmQyRoTq3+UExyJwB4xZoCc8lFIPHT
         1JLKkVoSr3hMYFs+x98zjjRcyw2xrS1rGfAXHEq+RyZfpGyhDpyGAbYsGbpBS3qHA7OY
         gUezPbUinXA9UrR8RhJyAbOsAhf2VqCoI/O3T8n1+HeqEuYCNoxrQ8z3jvR4TT/rnWyA
         atPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=tMRmbcwOZDIFaTPxLY27tBFqvxpOSXiDeb2XTcL9iTc=;
        b=bXvxjEyNcUoNP9I/gSvDPw8Ovh5vLmDuEhmGhYlO/SkaRgtDgRePjKatV8R9vgmmBF
         NICnuDF7SGGBnO0XlxMQZIhHoDfGnrdPjtlyY1UAxfHAlBTzkcm0thVtCZpdqV4XleKR
         b/Ls5mDCCjpB9ckMOma5HVBIwDLAcNXCU3gQrQAw2a43pTEsCOxcMrNgLuND/u6eMjTD
         PvvyehKhltpYRTDr+DmrQO4x/B/3/lXqNebKDE7TlSqlJkb0Q/cSxXFIB56Y/dhN3m9I
         J8zPwuJPIhsUS1tpFBNUucKkqBGlHpsBX74sjM0ATebBhJsMVSoemEDLsFW9LtEhECnH
         lpqg==
X-Gm-Message-State: ACgBeo0xVpKtlpecu67aTSe6lddEqpW5EoTkozhIuvq1n+nL9eug/xUC
	jvqzCbIgcdTJgpMNBswfyu63jDwuZ3o=
X-Google-Smtp-Source: AA6agR6WFXWG6lBERn8fKgbng4pdY7+dFZ275Tti+4gL6MGpsob4z29fC0owAPSMM8vQ0mXhvHK4dQ+aJ1U=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a17:902:ab08:b0:173:320e:3316 with SMTP id
 ik8-20020a170902ab0800b00173320e3316mr17541232plb.38.1661808351535; Mon, 29
 Aug 2022 14:25:51 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:12 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-10-surenb@google.com>
Subject: [RFC PATCH 09/28] mm/mempolicy: mark VMA as locked when changing
 protection policy
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 30 Aug 2022 08:01:45 +1000
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, riel@surriel.com, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Protect VMA from concurrent page fault handler while performing VMA
protection policy changes.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mempolicy.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index b73d3248d976..6be1e5c75556 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -383,8 +383,10 @@ void mpol_rebind_mm(struct mm_struct *mm, nodemask_t *new)
 	struct vm_area_struct *vma;
 
 	mmap_write_lock(mm);
-	for (vma = mm->mmap; vma; vma = vma->vm_next)
+	for (vma = mm->mmap; vma; vma = vma->vm_next) {
+		vma_mark_locked(vma);
 		mpol_rebind_policy(vma->vm_policy, new);
+	}
 	mmap_write_unlock(mm);
 }
 
@@ -632,6 +634,7 @@ unsigned long change_prot_numa(struct vm_area_struct *vma,
 	struct mmu_gather tlb;
 	int nr_updated;
 
+	vma_mark_locked(vma);
 	tlb_gather_mmu(&tlb, vma->vm_mm);
 
 	nr_updated = change_protection(&tlb, vma, addr, end, PAGE_NONE,
@@ -765,6 +768,7 @@ static int vma_replace_policy(struct vm_area_struct *vma,
 	if (IS_ERR(new))
 		return PTR_ERR(new);
 
+	vma_mark_locked(vma);
 	if (vma->vm_ops && vma->vm_ops->set_policy) {
 		err = vma->vm_ops->set_policy(vma, new);
 		if (err)
-- 
2.37.2.672.g94769d06f0-goog

