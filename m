Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (unknown [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 855F65A56CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:10:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGl3l2t3wz3f3d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:09:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bssUgHF5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=36s4nywykdjomol8h5aiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bssUgHF5;
	dkim-atps=neutral
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk573lDMz3bln
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:26:03 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id ng1-20020a17090b1a8100b001f4f9f69d48so10100584pjb.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=J1u/YkZ7r4U6qP3j3HXey3MGQlv66sCtBUAUQwGtkmo=;
        b=bssUgHF5w47sbr7l7KTrCUB9BNCgN6M5weE9wkVgXyWLQuTUzyGpg0OJvcyz0sW5UD
         jBcbuP4XXvP/J4pS6AqtYRXplk3ioZfRWOizdHfYubwqdaFV7iqu+wCAfN30wOXuSJR5
         rOeSjLAnMTV/UMrEb+PillTsGibQBZHi92r8Zd7PRmmwTLk5upCdMt9/ApQU+Kr/zUNy
         g3HC4+2oFiondWWpmL/CQDHhjiEfoJFEyDpo5hDjW6J9yE1A4zjv6LFdAo5+gh9e4xsA
         3B8ihRdAo9AsX2EZ1zty6Setu8LqB98WdsMEL3dnRqIhFnd/9nqnY8Jcva4fprwPuNko
         5pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=J1u/YkZ7r4U6qP3j3HXey3MGQlv66sCtBUAUQwGtkmo=;
        b=7FojkUL0vmU2u63XmjWKix/wVqiYMFdy645ocMQK2ObLO1mVRX78Oj0A8mRSqIWp2T
         PMe6VFUqbz1LzTInaYSC8J43b0TesSjlbW2HCDI/+YnBeHPc1LqiqLhXxiVneqgaBwJv
         UaYVsFv7TmEE7ZH4b6GfiTEdHVojMJ+dbgpLBS0noZzUZ1nN+VnWIFtUUJqJvaSVoEQD
         pmEC6IOjEjyshycMDe8LYATCjw0Yd00IbKzsW5S0p+1Z8bGN9+4PNLU9BPcc9OIPNOoa
         wntqYmerClf0IX1fPkGzLrGMGaC76LGFDN06EX4BlBehhUzaN0OI1BbABHOczutvtReP
         qemA==
X-Gm-Message-State: ACgBeo1kzLdDwSVP6tLQfc+jt2cCs50VRURG6FqazjDpjasNuryHHtmt
	fPLWREh6mdikDwuWuk9Js4gUG1oocOg=
X-Google-Smtp-Source: AA6agR7FrxHuf3ebSGip6Dsrc2j7pCNXLJVmg+GJ9+F6P4LGjbGDMIiC+XxX5XFr/bvFDyLyzfk2y9GLnRc=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a17:903:248:b0:172:7520:db07 with SMTP id
 j8-20020a170903024800b001727520db07mr18052271plh.76.1661808361566; Mon, 29
 Aug 2022 14:26:01 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:17 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-15-surenb@google.com>
Subject: [RFC PATCH 14/28] mm: mark VMAs as locked before isolating them
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

Mark VMAs as locked before isolating them and clear their tree node so
that isolated VMAs are easily identifiable. In the later patches page
fault handlers will try locking the found VMA and will check whether
the VMA was isolated. Locking VMAs before isolating them ensures that
page fault handlers don't operate on isolated VMAs.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c  | 2 ++
 mm/nommu.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index 094678b4434b..b0d78bdc0de0 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -421,12 +421,14 @@ static inline void vma_rb_insert(struct vm_area_struct *vma,
 
 static void __vma_rb_erase(struct vm_area_struct *vma, struct rb_root *root)
 {
+	vma_mark_locked(vma);
 	/*
 	 * Note rb_erase_augmented is a fairly large inline function,
 	 * so make sure we instantiate it only once with our desired
 	 * augmented rbtree callbacks.
 	 */
 	rb_erase_augmented(&vma->vm_rb, root, &vma_gap_callbacks);
+	RB_CLEAR_NODE(&vma->vm_rb);
 }
 
 static __always_inline void vma_rb_erase_ignore(struct vm_area_struct *vma,
diff --git a/mm/nommu.c b/mm/nommu.c
index e819cbc21b39..ff9933e57501 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -622,6 +622,7 @@ static void delete_vma_from_mm(struct vm_area_struct *vma)
 	struct mm_struct *mm = vma->vm_mm;
 	struct task_struct *curr = current;
 
+	vma_mark_locked(vma);
 	mm->map_count--;
 	for (i = 0; i < VMACACHE_SIZE; i++) {
 		/* if the vma is cached, invalidate the entire cache */
@@ -644,6 +645,7 @@ static void delete_vma_from_mm(struct vm_area_struct *vma)
 
 	/* remove from the MM's tree and list */
 	rb_erase(&vma->vm_rb, &mm->mm_rb);
+	RB_CLEAR_NODE(&vma->vm_rb);
 
 	__vma_unlink_list(mm, vma);
 }
-- 
2.37.2.672.g94769d06f0-goog

