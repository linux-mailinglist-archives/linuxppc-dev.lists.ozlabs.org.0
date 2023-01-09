Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 077C0663248
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:09:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRQH6Sf9z3fTm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:09:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kK6VGqQr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3_n68ywykdbmbdax6uz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kK6VGqQr;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR5B4Xv2z2yPY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:22 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id z17-20020a25e311000000b00719e04e59e1so10331576ybd.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N7mRvZOR9OSs0kq6Wz0vbjqUGqop/n2M19/OmQJBzkI=;
        b=kK6VGqQrZF8SG+/SjIkBNYvs6AD0XP75PAW8W4oCooA8s3XRGaAuXa1jS1HIr83jUq
         PfI+R4O3x61YrRtYzJolldiJm8hvHC8SxT9psAXnN9HRUclq2Ip2r4U5z9IkvWwPkq1G
         R8EmUXB5Ci5VhDTGcvMKuR9ocC5TZKh6cUC/3KU3F2jjjEENLe5/WyQt1N1DazjgpxS4
         yljAKeS+kCfpqMArc2lBS+96rZHSjRTZ1IN5B+phw/v3GaAeI+j/XkkH3A++TUlQdWQv
         Z4M4yuHxGDrl8gjpdpiZsATGjMq3MZe3RurXo4cwDj7NtnBXJ6X3cbtci2E7Lsi2JjQl
         1UiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N7mRvZOR9OSs0kq6Wz0vbjqUGqop/n2M19/OmQJBzkI=;
        b=YoYqdRqb3Yn4gUs8F2DPQEC3G0Q8PjXrg38LCX5jzJcRvTTunseYN6nik5K0XnXAVA
         PxeniR4gJhNQFmHnCDI7Z1ysk1ptQeH9lwAzLn9znCHT8woI7EwsNEE3KZKwibzcJRho
         1xYVUy0L+9sUHvCyAvwobLj9Pb89pOTvF8vlF37E3YBAsK8tx/aCM0DUu8td3B9J4f+o
         MoU4IjQLXSFam/XYYDwpNeP+nSXXT/8XZIUiB2N49SL663F079fVlBThpnanjCCnnRem
         OQkZo15KQQXSAek+oarSafPEvEOlVcA7e22s+Qa37adCZXNThXYQaBdKAe3xBPZ9zX2B
         1wWA==
X-Gm-Message-State: AFqh2kqf0/CBku4cYwb8kJc76E1+ARP8jhS6x5zJmgLqubmilQcc6HHI
	8mPuXVN/1zsgG4BhaVv87AmyW54cm8I=
X-Google-Smtp-Source: AMrXdXshiyJrN6EY9CYZGhpA9uWntRCGsbXmXt4bSfqvBPsR2AoGwmZNzha8yCXqkiCEpIRfWXrumcAFYxY=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a81:65d7:0:b0:39a:afeb:f519 with SMTP id
 z206-20020a8165d7000000b0039aafebf519mr799450ywb.146.1673297662050; Mon, 09
 Jan 2023 12:54:22 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:11 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-17-surenb@google.com>
Subject: [PATCH 16/41] mm: replace vma->vm_flags indirect modification in ksm_madvise
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingu
 larity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace indirect modifications to vma->vm_flags with calls to modifier
functions to be able to track flag changes and to keep vma locking
correctness. Add a BUG_ON check in ksm_madvise() to catch indirect
vm_flags modification attempts.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 5 ++++-
 arch/s390/mm/gmap.c                | 5 ++++-
 mm/khugepaged.c                    | 2 ++
 mm/ksm.c                           | 2 ++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 1d67baa5557a..325a7a47d348 100644
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
@@ -409,12 +410,14 @@ static int kvmppc_memslot_page_merge(struct kvm *kvm,
 			ret = H_STATE;
 			break;
 		}
+		vm_flags = vma->vm_flags;
 		ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
-			  merge_flag, &vma->vm_flags);
+			  merge_flag, &vm_flags);
 		if (ret) {
 			ret = H_STATE;
 			break;
 		}
+		reset_vm_flags(vma, vm_flags);
 		start = vma->vm_end;
 	} while (end > vma->vm_end);
 
diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
index 3811d6c86d09..e47387f8be6d 100644
--- a/arch/s390/mm/gmap.c
+++ b/arch/s390/mm/gmap.c
@@ -2587,14 +2587,17 @@ int gmap_mark_unmergeable(void)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
+	unsigned long vm_flags;
 	int ret;
 	VMA_ITERATOR(vmi, mm, 0);
 
 	for_each_vma(vmi, vma) {
+		vm_flags = vma->vm_flags;
 		ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
-				  MADV_UNMERGEABLE, &vma->vm_flags);
+				  MADV_UNMERGEABLE, &vm_flags);
 		if (ret)
 			return ret;
+		reset_vm_flags(vma, vm_flags);
 	}
 	mm->def_flags &= ~VM_MERGEABLE;
 	return 0;
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 5cb401aa2b9d..5376246a3052 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -352,6 +352,8 @@ struct attribute_group khugepaged_attr_group = {
 int hugepage_madvise(struct vm_area_struct *vma,
 		     unsigned long *vm_flags, int advice)
 {
+	/* vma->vm_flags can be changed only using modifier functions */
+	BUG_ON(vm_flags == &vma->vm_flags);
 	switch (advice) {
 	case MADV_HUGEPAGE:
 #ifdef CONFIG_S390
diff --git a/mm/ksm.c b/mm/ksm.c
index dd02780c387f..d05c41b289db 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2471,6 +2471,8 @@ int ksm_madvise(struct vm_area_struct *vma, unsigned long start,
 	struct mm_struct *mm = vma->vm_mm;
 	int err;
 
+	/* vma->vm_flags can be changed only using modifier functions */
+	BUG_ON(vm_flags == &vma->vm_flags);
 	switch (advice) {
 	case MADV_MERGEABLE:
 		/*
-- 
2.39.0

