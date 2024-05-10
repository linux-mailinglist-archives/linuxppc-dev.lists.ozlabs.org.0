Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C38B58C29EE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 20:30:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0APywCZ5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vbcrs2BMBz3d2S
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2024 04:30:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0APywCZ5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--axelrasmussen.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3jmc-zg0kdi8tgx4atb5dbbx6z77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--axelrasmussen.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbcqN3sGpz3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 May 2024 04:29:36 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-de604d35ec0so4033817276.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 11:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715365774; x=1715970574; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=djjgV/EOUSgIiHJsIm8AWGF7ff5q1uXyb7dMjfHKhrI=;
        b=0APywCZ5JLeH/OvoivgRL+PkH6VBHwUwxmuNvo/zRL8CRFEHM12m+IYRNmi7pANk1+
         dmNNM9szioXGaMNtkSuAMVthnza5lnu3vqAopPxV9JYK/cjXr3qKDEO4Fkqt64vsHFav
         Agsi2eTFfEvr9zbrEqCaNBP/Vkw2TU7j7h0rkunduJY+NQv4Yli9kgP6s7FrysDxW9TU
         LOlt+hlkdPpyonD7cIcANd7ZCmn96GheTJy9q+RjsqQ9G4mpNSSUKjItMPYrPi5cGJXP
         K0NQAV3vpsClwsxSQDyT7N089KZyWkecYYQ9mhu4w/k2RGvn6g5zRt4G3LMx7a10G4Xd
         o/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715365774; x=1715970574;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=djjgV/EOUSgIiHJsIm8AWGF7ff5q1uXyb7dMjfHKhrI=;
        b=KccMd605OwBYS8DqSaSsZU/E0DiKwNsFfLFwjRxYp68+23Xst40Q9nF0VID8GpZI8G
         1Eu1xmh28yXK9hGbqn97oN45KgBbPWo+CvDM/WQQLPLSWxDM550FULB/NC39T1PSdr64
         wMmwbiYPq2/ETCicJAXIOJd9NX53tFYHQqnvVIMHB41LsiHvCVmp4j+4C/kr7pz9LiAN
         YIZgYOtQtRqEh14UW7RKUWFktrYmFys0VavCkRXF3XfDlIrmPmm4MNh0A2nK5JuiY+v6
         FbmxMO7uxEgEDMSNiXtP3uP/nIRcFrieYgN75unrEVC5UfXVtuJcuiylRibvoslxahz3
         9hKg==
X-Forwarded-Encrypted: i=1; AJvYcCUUFi1hBXQS1dwuKIFLbQ7ADKPMiOftdi32YfrXNRSKEYNoPfxpc7a6FWqYFN4u00xfVsTtYvNGv74D8nCWiP8HCCn3hXs7jExUzUBOeQ==
X-Gm-Message-State: AOJu0YzZqrW3GYId33oAd5vQVyRsmFKh3RXW66fN1D6jjvLeMndVsHzO
	lyPe78w9oXHTlel0dr4hzYHNZHcsPzq5yW+Y/saFW1I/AbL2WbjuErOkN7UxweAmUD9mhDVRwMD
	HIO/3DuWyRs7fFjuP8XemxElfAfM+LQ==
X-Google-Smtp-Source: AGHT+IFerzf95SQt68BSPyg+4slciMy+Qp5Bl/3q5GPRPhHSBZLEJUwSa5o+N+XqGo0DxsH3At45CJWu36ItLUenUz2D
X-Received: from axel.svl.corp.google.com ([2620:15c:2a3:200:6f94:7fe7:5ca2:5501])
 (user=axelrasmussen job=sendgmr) by 2002:a05:6902:1890:b0:dee:60e9:69f4 with
 SMTP id 3f1490d57ef6-dee60e96aeemr201789276.10.1715365774181; Fri, 10 May
 2024 11:29:34 -0700 (PDT)
Date: Fri, 10 May 2024 11:29:26 -0700
In-Reply-To: <20240510182926.763131-1-axelrasmussen@google.com>
Mime-Version: 1.0
References: <20240510182926.763131-1-axelrasmussen@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510182926.763131-2-axelrasmussen@google.com>
Subject: [PATCH v2 1/1] arch/fault: don't print logs for pte marker poison errors
From: Axel Rasmussen <axelrasmussen@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, 
	Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, John Hubbard <jhubbard@nvidia.com>, 
	Liu Shixin <liushixin2@huawei.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>
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
Cc: linux-parisc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Axel Rasmussen <axelrasmussen@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For real MCEs, various architectures print log messages when poisoned
memory is accessed (which results in a SIGBUS). These messages can be
important for users to understand the issue.

On the other hand, we have two other cases: swapin errors and simulated
poisons via UFFDIO_POISON. These cases also result in SIGBUS, but they
aren't "real" hardware memory poisoning events, so we want to avoid
logging MCE error messages to dmesg for these events. This avoids
spamming the kernel log, and possibly drowning out real events with
these other cases.

To identify this situation, add a new VM_FAULT_HWPOISON_SILENT flag.
This is expected to be set *in addition to* one of the existing
VM_FAULT_HWPOISON or VM_FAULT_HWPOISON_LARGE flags (which are mutually
exclusive).

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
---
 arch/parisc/mm/fault.c   |  7 +++++--
 arch/powerpc/mm/fault.c  |  6 ++++--
 arch/x86/mm/fault.c      |  6 ++++--
 include/linux/mm_types.h | 34 ++++++++++++++++++++--------------
 mm/hugetlb.c             |  3 ++-
 mm/memory.c              |  2 +-
 6 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index c39de84e98b0..6c5e8d6498bf 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -400,9 +400,12 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 #ifdef CONFIG_MEMORY_FAILURE
 		if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
 			unsigned int lsb = 0;
-			printk(KERN_ERR
+
+			if (!(fault & VM_FAULT_HWPOISON_SILENT)) {
+				pr_err(
 	"MCE: Killing %s:%d due to hardware memory corruption fault at %08lx\n",
-			tsk->comm, tsk->pid, address);
+				tsk->comm, tsk->pid, address);
+			}
 			/*
 			 * Either small page or large page may be poisoned.
 			 * In other words, VM_FAULT_HWPOISON_LARGE and
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 215690452495..c43bb6193a80 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -147,8 +147,10 @@ static int do_sigbus(struct pt_regs *regs, unsigned long address,
 	if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
 		unsigned int lsb = 0; /* shutup gcc */
 
-		pr_err("MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
-			current->comm, current->pid, address);
+		if (!(fault & VM_FAULT_HWPOISON_SILENT)) {
+			pr_err("MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
+				current->comm, current->pid, address);
+		}
 
 		if (fault & VM_FAULT_HWPOISON_LARGE)
 			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 67b18adc75dd..9ae5cc6bd933 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -964,9 +964,11 @@ do_sigbus(struct pt_regs *regs, unsigned long error_code, unsigned long address,
 		struct task_struct *tsk = current;
 		unsigned lsb = 0;
 
-		pr_err(
+		if (!(fault & VM_FAULT_HWPOISON_SILENT)) {
+			pr_err(
 	"MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
-			tsk->comm, tsk->pid, address);
+				tsk->comm, tsk->pid, address);
+		}
 		if (fault & VM_FAULT_HWPOISON_LARGE)
 			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
 		if (fault & VM_FAULT_HWPOISON)
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 24323c7d0bd4..7663a2725341 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1224,6 +1224,10 @@ typedef __bitwise unsigned int vm_fault_t;
  * @VM_FAULT_HWPOISON_LARGE:	Hit poisoned large page. Index encoded
  *				in upper bits
  * @VM_FAULT_SIGSEGV:		segmentation fault
+ * @VM_FAULT_HWPOISON_SILENT	Hit a poisoned pte marker, which should not be
+ *				logged to dmesg since it's something besides a
+ *				real hardware memory error (swapin error,
+ *				simulated poison via UFFDIO_POISON, etc.).
  * @VM_FAULT_NOPAGE:		->fault installed the pte, not return page
  * @VM_FAULT_LOCKED:		->fault locked the returned page
  * @VM_FAULT_RETRY:		->fault blocked, must retry
@@ -1237,20 +1241,21 @@ typedef __bitwise unsigned int vm_fault_t;
  *
  */
 enum vm_fault_reason {
-	VM_FAULT_OOM            = (__force vm_fault_t)0x000001,
-	VM_FAULT_SIGBUS         = (__force vm_fault_t)0x000002,
-	VM_FAULT_MAJOR          = (__force vm_fault_t)0x000004,
-	VM_FAULT_HWPOISON       = (__force vm_fault_t)0x000010,
-	VM_FAULT_HWPOISON_LARGE = (__force vm_fault_t)0x000020,
-	VM_FAULT_SIGSEGV        = (__force vm_fault_t)0x000040,
-	VM_FAULT_NOPAGE         = (__force vm_fault_t)0x000100,
-	VM_FAULT_LOCKED         = (__force vm_fault_t)0x000200,
-	VM_FAULT_RETRY          = (__force vm_fault_t)0x000400,
-	VM_FAULT_FALLBACK       = (__force vm_fault_t)0x000800,
-	VM_FAULT_DONE_COW       = (__force vm_fault_t)0x001000,
-	VM_FAULT_NEEDDSYNC      = (__force vm_fault_t)0x002000,
-	VM_FAULT_COMPLETED      = (__force vm_fault_t)0x004000,
-	VM_FAULT_HINDEX_MASK    = (__force vm_fault_t)0x0f0000,
+	VM_FAULT_OOM             = (__force vm_fault_t)0x000001,
+	VM_FAULT_SIGBUS          = (__force vm_fault_t)0x000002,
+	VM_FAULT_MAJOR           = (__force vm_fault_t)0x000004,
+	VM_FAULT_HWPOISON        = (__force vm_fault_t)0x000010,
+	VM_FAULT_HWPOISON_LARGE  = (__force vm_fault_t)0x000020,
+	VM_FAULT_SIGSEGV         = (__force vm_fault_t)0x000040,
+	VM_FAULT_HWPOISON_SILENT = (__force vm_fault_t)0x000080,
+	VM_FAULT_NOPAGE          = (__force vm_fault_t)0x000100,
+	VM_FAULT_LOCKED          = (__force vm_fault_t)0x000200,
+	VM_FAULT_RETRY           = (__force vm_fault_t)0x000400,
+	VM_FAULT_FALLBACK        = (__force vm_fault_t)0x000800,
+	VM_FAULT_DONE_COW        = (__force vm_fault_t)0x001000,
+	VM_FAULT_NEEDDSYNC       = (__force vm_fault_t)0x002000,
+	VM_FAULT_COMPLETED       = (__force vm_fault_t)0x004000,
+	VM_FAULT_HINDEX_MASK     = (__force vm_fault_t)0x0f0000,
 };
 
 /* Encode hstate index for a hwpoisoned large page */
@@ -1268,6 +1273,7 @@ enum vm_fault_reason {
 	{ VM_FAULT_HWPOISON,            "HWPOISON" },	\
 	{ VM_FAULT_HWPOISON_LARGE,      "HWPOISON_LARGE" },	\
 	{ VM_FAULT_SIGSEGV,             "SIGSEGV" },	\
+	{ VM_FAULT_HWPOISON_SILENT,	"HWPOISON_SILENT" },	\
 	{ VM_FAULT_NOPAGE,              "NOPAGE" },	\
 	{ VM_FAULT_LOCKED,              "LOCKED" },	\
 	{ VM_FAULT_RETRY,               "RETRY" },	\
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6be78e7d4f6e..91517cd7f44c 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6485,7 +6485,8 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 				pte_marker_get(pte_to_swp_entry(vmf.orig_pte));
 
 			if (marker & PTE_MARKER_POISONED) {
-				ret = VM_FAULT_HWPOISON_LARGE |
+				ret = VM_FAULT_HWPOISON_SILENT |
+				      VM_FAULT_HWPOISON_LARGE |
 				      VM_FAULT_SET_HINDEX(hstate_index(h));
 				goto out_mutex;
 			}
diff --git a/mm/memory.c b/mm/memory.c
index eea6e4984eae..721c0731cef2 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3938,7 +3938,7 @@ static vm_fault_t handle_pte_marker(struct vm_fault *vmf)
 
 	/* Higher priority than uffd-wp when data corrupted */
 	if (marker & PTE_MARKER_POISONED)
-		return VM_FAULT_HWPOISON;
+		return VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_SILENT;
 
 	if (pte_marker_entry_uffd_wp(entry))
 		return pte_marker_handle_uffd_wp(vmf);
-- 
2.45.0.118.g7fe29c98d7-goog

