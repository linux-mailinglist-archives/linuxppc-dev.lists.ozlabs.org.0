Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EA08C17B6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 22:40:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=mHUVYhRy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vb3my5B5vz3ckl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 06:40:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=mHUVYhRy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--axelrasmussen.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3ctq9zg0kdagi5mtzi0u200mvowwotm.kwutqv25xxk-lm3tq010.w7tij0.wzo@flex--axelrasmussen.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vb3lT294Rz3cLk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 06:39:16 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-ddaf2f115f2so1954779276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2024 13:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715287154; x=1715891954; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=72EB+jPmMFAxQhDugLcn3MtcnlhS5/KVvKJQ1v/oDoM=;
        b=mHUVYhRyR3BrOaQ6wEpo//INKQ53NsYg71kHh+1bK1bcc9R9cUK8butSVJIg5WCfZ1
         RHmnL2AwdbBmw5n+YeTPN8gcJMpgFBAh0otpIpD5yxNNJIi3Yy/iyQGE9be5OKTIfMtz
         gpwf73xNiKY//enjTrvkRITPZemtWa7GdWT5fauUL4gV0MOyLO/RQ9Yac+FdJPz8ACA7
         O5l8IoZJVREb6kxQ02T4oPdu6Df9KdFUW+faL/NWPqST0vjdeFrjjFA90RvMRgcSEeyk
         Ao7zerHnHzml1MZj5HYp60FMPP4i/a7qKUf1xiNou8xPHWB/s3fKYk4Sge1HI8rDbDRJ
         Tjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715287154; x=1715891954;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72EB+jPmMFAxQhDugLcn3MtcnlhS5/KVvKJQ1v/oDoM=;
        b=JS62ObEpsnxlkSEJFxvbdTNThq6ixaINUiusbH1vigN85AtIYquCBaofo+HtkSgWzU
         ZAGKuRMJTKpreAI27MjRbcAziXZM2gug+ZU1XFQBt9VeuNqitY5bNI5XPpjcdaOWN3oo
         I7LiTZYvmeJqhXH+ikWfUrLLZPjic+yfVQ+3moX45r3EdTAYAv6CeYaKgrvqD0yr70Dp
         ZSFBrlNyIEuHX6OOHiF4KBBHqi9vKrh0yJTJf/Mz15jmoOsbGaRPQ6R0kAIgOHdBmlk4
         Qo802zJR7BwJNwgOPxie1Rd5Uqd4wXJZyZ/Kp1tdNxAhGX2dze+AehYdx9mMRZ9zSeob
         C8kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJzFqq/ScLdXMW3IyPg87QCWhsQI9tI7/V+M/FTgJKhA9eSwEjgwFmryu+MFKyBAbYOx62jfK6yG+DKVVrlZcmok53oEMohojuZek2JQ==
X-Gm-Message-State: AOJu0YwzSXnlWiFhpj1+0RlqRvSvYucKH9Qsz/zqUH/snH0dsRyQ7fVO
	EG/+Cl0ok8B9Wqc/X8ihuBSJbWekCnHrMvkB358arAtMmErkoIj1syO+BkiTf5/eDEp0RSaZQF1
	PoCrIjl03yo1WMsjQ+uqaS/W4hVZ8OQ==
X-Google-Smtp-Source: AGHT+IEc4cDi9d04mUFz7pcyCUYCCTXc24pB4av/QXdROM2NygUWuAhnkvV0KMdhUE3//ZdLw4UfzyQBI3tbL3GiAWOd
X-Received: from axel.svl.corp.google.com ([2620:15c:2a3:200:22b1:9c9e:3544:83b8])
 (user=axelrasmussen job=sendgmr) by 2002:a05:6902:c09:b0:de5:5304:3206 with
 SMTP id 3f1490d57ef6-dee4f52d715mr74188276.11.1715287153666; Thu, 09 May 2024
 13:39:13 -0700 (PDT)
Date: Thu,  9 May 2024 13:39:07 -0700
In-Reply-To: <20240509203907.504891-1-axelrasmussen@google.com>
Mime-Version: 1.0
References: <20240509203907.504891-1-axelrasmussen@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509203907.504891-2-axelrasmussen@google.com>
Subject: [PATCH 1/1] arch/fault: don't print logs for simulated poison errors
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

On the other hand, we have the userfaultfd UFFDIO_POISON operation,
which can "simulate" memory poisoning. That particular process will get
SIGBUS on access to the memory, but this effect is tied to an MM, rather
than being global like a real poison event. So, we don't want to log
about this case to the global kernel log; instead, let the process
itself log or whatever else it wants to do. This avoids spamming the
kernel log, and avoids e.g. drowning out real events with simulated
ones.

To identify this situation, add a new VM_FAULT_HWPOISON_SIM flag. This
is expected to be set *in addition to* one of the existing
VM_FAULT_HWPOISON or VM_FAULT_HWPOISON_LARGE flags (which are mutually
exclusive).

Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
---
 arch/parisc/mm/fault.c   | 7 +++++--
 arch/powerpc/mm/fault.c  | 6 ++++--
 arch/x86/mm/fault.c      | 6 ++++--
 include/linux/mm_types.h | 5 +++++
 mm/hugetlb.c             | 3 ++-
 mm/memory.c              | 2 +-
 6 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index c39de84e98b0..e5370bcadf27 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -400,9 +400,12 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 #ifdef CONFIG_MEMORY_FAILURE
 		if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
 			unsigned int lsb = 0;
-			printk(KERN_ERR
+
+			if (!(fault & VM_FAULT_HWPOISON_SIM)) {
+				pr_err(
 	"MCE: Killing %s:%d due to hardware memory corruption fault at %08lx\n",
-			tsk->comm, tsk->pid, address);
+				tsk->comm, tsk->pid, address);
+			}
 			/*
 			 * Either small page or large page may be poisoned.
 			 * In other words, VM_FAULT_HWPOISON_LARGE and
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 53335ae21a40..ac5e8a3c7fba 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -140,8 +140,10 @@ static int do_sigbus(struct pt_regs *regs, unsigned long address,
 	if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
 		unsigned int lsb = 0; /* shutup gcc */
 
-		pr_err("MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
-			current->comm, current->pid, address);
+		if (!(fault & VM_FAULT_HWPOISON_SIM)) {
+			pr_err("MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
+				current->comm, current->pid, address);
+		}
 
 		if (fault & VM_FAULT_HWPOISON_LARGE)
 			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index e4f3c7721f45..16d077a3ad14 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -928,9 +928,11 @@ do_sigbus(struct pt_regs *regs, unsigned long error_code, unsigned long address,
 		struct task_struct *tsk = current;
 		unsigned lsb = 0;
 
-		pr_err_ratelimited(
+		if (!(fault & VM_FAULT_HWPOISON_SIM)) {
+			pr_err_ratelimited(
 	"MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
-			tsk->comm, tsk->pid, address);
+				tsk->comm, tsk->pid, address);
+		}
 		if (fault & VM_FAULT_HWPOISON_LARGE)
 			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
 		if (fault & VM_FAULT_HWPOISON)
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 5240bd7bca33..7f8fc3efc5b2 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1226,6 +1226,9 @@ typedef __bitwise unsigned int vm_fault_t;
  * @VM_FAULT_HWPOISON_LARGE:	Hit poisoned large page. Index encoded
  *				in upper bits
  * @VM_FAULT_SIGSEGV:		segmentation fault
+ * @VM_FAULT_HWPOISON_SIM	Hit poisoned, PTE marker; this indicates a
+ *				simulated poison (e.g. via usefaultfd's
+ *                              UFFDIO_POISON), not a "real" hwerror.
  * @VM_FAULT_NOPAGE:		->fault installed the pte, not return page
  * @VM_FAULT_LOCKED:		->fault locked the returned page
  * @VM_FAULT_RETRY:		->fault blocked, must retry
@@ -1245,6 +1248,7 @@ enum vm_fault_reason {
 	VM_FAULT_HWPOISON       = (__force vm_fault_t)0x000010,
 	VM_FAULT_HWPOISON_LARGE = (__force vm_fault_t)0x000020,
 	VM_FAULT_SIGSEGV        = (__force vm_fault_t)0x000040,
+	VM_FAULT_HWPOISON_SIM   = (__force vm_fault_t)0x000080,
 	VM_FAULT_NOPAGE         = (__force vm_fault_t)0x000100,
 	VM_FAULT_LOCKED         = (__force vm_fault_t)0x000200,
 	VM_FAULT_RETRY          = (__force vm_fault_t)0x000400,
@@ -1270,6 +1274,7 @@ enum vm_fault_reason {
 	{ VM_FAULT_HWPOISON,            "HWPOISON" },	\
 	{ VM_FAULT_HWPOISON_LARGE,      "HWPOISON_LARGE" },	\
 	{ VM_FAULT_SIGSEGV,             "SIGSEGV" },	\
+	{ VM_FAULT_HWPOISON_SIM,	"HWPOISON_SIM" },	\
 	{ VM_FAULT_NOPAGE,              "NOPAGE" },	\
 	{ VM_FAULT_LOCKED,              "LOCKED" },	\
 	{ VM_FAULT_RETRY,               "RETRY" },	\
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 65456230cc71..2b4e0173e806 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6485,7 +6485,8 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 				pte_marker_get(pte_to_swp_entry(entry));
 
 			if (marker & PTE_MARKER_POISONED) {
-				ret = VM_FAULT_HWPOISON_LARGE |
+				ret = VM_FAULT_HWPOISON_SIM |
+				      VM_FAULT_HWPOISON_LARGE |
 				      VM_FAULT_SET_HINDEX(hstate_index(h));
 				goto out_mutex;
 			}
diff --git a/mm/memory.c b/mm/memory.c
index d2155ced45f8..29a833b996ae 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3910,7 +3910,7 @@ static vm_fault_t handle_pte_marker(struct vm_fault *vmf)
 
 	/* Higher priority than uffd-wp when data corrupted */
 	if (marker & PTE_MARKER_POISONED)
-		return VM_FAULT_HWPOISON;
+		return VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_SIM;
 
 	if (pte_marker_entry_uffd_wp(entry))
 		return pte_marker_handle_uffd_wp(vmf);
-- 
2.45.0.118.g7fe29c98d7-goog

