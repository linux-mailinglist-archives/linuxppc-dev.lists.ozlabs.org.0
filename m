Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B294967D598
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 20:43:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2rjT3jltz3fKs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 06:43:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Pfx+wzAh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3onbsywykdl0vxuhqejrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Pfx+wzAh;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2rbR12grz3fFq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 06:38:10 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id k15-20020a5b0a0f000000b007eba3f8e3baso2943982ybq.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 11:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7SychSIO4sUWIo6QruxirbFjx5CbYNnUeHZ00ltQsQk=;
        b=Pfx+wzAhZ6kKsJzDDedQ8LJwSdqFciZXcllolwp4vBQ+2oIO3zY1GANQzoJfCZWzvE
         CQPh21a5oWziH93KMEhfcmcYLI66KcWMq+wv9dH36RAXDaWDj3mhxF37O3hO+Nm3j333
         DQpz5N93q63IgXjq4N824biP5tt/Btbtpk79Xp1oY2XkCbJniy2hm75eubONJlrUyJHz
         4nhnfw5vwu2MM7c8JHS86kwr5IkxCGiAvk+B0fbplC2co4C0HnFTpw4esf89gAkAXtE3
         btQ+U4BHBe8XCXeuy8OqZ9E2kM4KncMQmpjGCBcfb2U1tiWjIaGyYCULw+IAQrOfXIUP
         +Htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7SychSIO4sUWIo6QruxirbFjx5CbYNnUeHZ00ltQsQk=;
        b=vvHFFXEU9ShPlJNRfDEhpEHTc+/2vU99x1ySOVZZuR/PSOt534Ua25LvoCeRlYeHPo
         G5l9hJM2QzS9xiy48bc26mxV9v5oGDEyyB93qo0b4Awpjcn94xgELwv3bmjJ3QTyemVy
         /lW+5FDldbYJGjEu/sBk9wkwbeyLQ5GVrhKKWSippIMG2jmS5iORfCFIPuAtl6YbJc+m
         aOTffemU1JbDK9KdDSeIGRxubhemxNKxAwWjqm7jVxD3wJqx3eqcXwoZ/QRfSZQ6mnWL
         vxsrzEnA53Demc+0h9BvJxV7IrENKTIlTIQn/6GGfHhOyoIftBeBRt1Ypv424PhsQPMF
         Mgpg==
X-Gm-Message-State: AFqh2krkxdbAK+CcqGedZQKg34UQ7z2BmmWgdeqkk5HlDhzK+I8XL4Mz
	JOzWimJZu7cb5756FqhfFnxG4AJZMP0=
X-Google-Smtp-Source: AMrXdXsXS6jvs2FLo8wLjzpNR7510A/NF2577gEg88y5p+yBM43aas9S20uDvZYfhxK8qIb0YJZmeRS9JA0=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:d774:88af:bab3:648d])
 (user=surenb job=sendgmr) by 2002:a5b:2ca:0:b0:7d2:d238:42b4 with SMTP id
 h10-20020a5b02ca000000b007d2d23842b4mr3963873ybp.526.1674761888262; Thu, 26
 Jan 2023 11:38:08 -0800 (PST)
Date: Thu, 26 Jan 2023 11:37:50 -0800
In-Reply-To: <20230126193752.297968-1-surenb@google.com>
Mime-Version: 1.0
References: <20230126193752.297968-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230126193752.297968-6-surenb@google.com>
Subject: [PATCH v4 5/7] mm: replace vma->vm_flags indirect modification in ksm_madvise
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

Replace indirect modifications to vma->vm_flags with calls to modifier
functions to be able to track flag changes and to keep vma locking
correctness.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Acked-by: Michal Hocko <mhocko@suse.com>
Acked-by: Mel Gorman <mgorman@techsingularity.net>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 6 +++++-
 arch/s390/mm/gmap.c                | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 1d67baa5557a..709ebd578394 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -393,6 +393,7 @@ static int kvmppc_memslot_page_merge(struct kvm *kvm,
 {
 	unsigned long gfn = memslot->base_gfn;
 	unsigned long end, start = gfn_to_hva(kvm, gfn);
+	unsigned long vm_flags;
 	int ret = 0;
 	struct vm_area_struct *vma;
 	int merge_flag = (merge) ? MADV_MERGEABLE : MADV_UNMERGEABLE;
@@ -409,12 +410,15 @@ static int kvmppc_memslot_page_merge(struct kvm *kvm,
 			ret = H_STATE;
 			break;
 		}
+		/* Copy vm_flags to avoid partial modifications in ksm_madvise */
+		vm_flags = vma->vm_flags;
 		ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
-			  merge_flag, &vma->vm_flags);
+			  merge_flag, &vm_flags);
 		if (ret) {
 			ret = H_STATE;
 			break;
 		}
+		vm_flags_reset(vma, vm_flags);
 		start = vma->vm_end;
 	} while (end > vma->vm_end);
 
diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
index ab836597419d..5a716bdcba05 100644
--- a/arch/s390/mm/gmap.c
+++ b/arch/s390/mm/gmap.c
@@ -2587,14 +2587,18 @@ int gmap_mark_unmergeable(void)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
+	unsigned long vm_flags;
 	int ret;
 	VMA_ITERATOR(vmi, mm, 0);
 
 	for_each_vma(vmi, vma) {
+		/* Copy vm_flags to avoid partial modifications in ksm_madvise */
+		vm_flags = vma->vm_flags;
 		ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
-				  MADV_UNMERGEABLE, &vma->vm_flags);
+				  MADV_UNMERGEABLE, &vm_flags);
 		if (ret)
 			return ret;
+		vm_flags_reset(vma, vm_flags);
 	}
 	mm->def_flags &= ~VM_MERGEABLE;
 	return 0;
-- 
2.39.1

