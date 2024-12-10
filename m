Return-Path: <linuxppc-dev+bounces-3882-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C3E9EA561
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 03:41:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6jfh5x7Tz2yh2;
	Tue, 10 Dec 2024 13:41:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733798492;
	cv=none; b=MTBaLVwDe2xxDi0nPd61Vv/cVh7R2Wo1cv5pR/RgyqX8vvcPMdlCLmuOdNu2ll3ID1Rk72Exsy7shegjUVz5c9I56CWUGP1ZpX9fMRBHzsKDeHz0IO+CaXpgiuuT+voU9TtAST+OjWTqhG9VtBR3BQfQYNUPmS8lFukNeqaVDkMd8FbtL6ghODrUoBiRePC6NEYinCZkToCWjYXYS2p6VEqQFqIbd6vRrPeldpj/Tyc0D1Ab0OqgwyU78CwYp+zP78h1lV/m+VGaK99fZOK+ADD0M6W7asMRhWz48tSMMUqQyYBsSEyxC2zvtZhzySmkgPf0ukFUB6/TP5EuXwhJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733798492; c=relaxed/relaxed;
	bh=2BgI/2JSXOfwO1cJ/ZJEscy7eN8JKVXEE4s6V/DqQoM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wh4iCv4MkiMlRjIcLyagY8S/93S/9mwX6uwBHotjRU4E3+styztr87YB6blSVNnz5swhZgtFGIcPVvkq4SC8B9weYd7jXB7xy46PrtQmrNrLdAQvflpv05wNWX33b60QgIZ50WrGC8ygmS7r/NM0UOF8dTezPd5YLCYeAnHiWdKpdOpCnq0YubxBt0qNKL6v6XWoXv+950CbE7pzNskUjEMm+Q7UxuS6DoSrWj81RWDtzZ08PwW1qQc9ajjc5ZV4+D2hVOxwWaz+uCn/bMQ5D8iwVZhAwr7dmZdmXEk7bZJ2Kf7WnUEVvT/daifMkhu/WjbmEnWs8OclBd6ujc3m6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3gYopdaX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3v6pxzwskdewyozs6v6w1uvu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3gYopdaX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3v6pxzwskdewyozs6v6w1uvu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6jff21r6z2xst
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 13:41:30 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef9da03117so2624283a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2024 18:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798487; x=1734403287; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2BgI/2JSXOfwO1cJ/ZJEscy7eN8JKVXEE4s6V/DqQoM=;
        b=3gYopdaXq4V1i0gSO1LFWBHL7bD5B5UYcvoHaE0RkL+Haiy0JH2eXzxFThe6ZWpGr3
         AIZs4yyCsmAibAJnldVIygwZc0re75KQW6fHEEREDj+ajV8DXCoUs58jnEG0Tsawf9Us
         oe+ftso4bX68xVvdNkLJTJAknTah6r4RuSS4clnobbyuyZ7gAZVbss1+Gldv5vuoZDkW
         wJFvAL12/OoNd6D74BdidX0cH6MZXX9HwPC8DB40Xpu3EdXMtvfacsn7M97do/SG86J0
         zNlSEZ+jz0OMApXEmtd5s4bwW8KHLKibnh5EdTok5Sw3dpqQklVZ4L+04Aj7rUJlbx2A
         cfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798487; x=1734403287;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2BgI/2JSXOfwO1cJ/ZJEscy7eN8JKVXEE4s6V/DqQoM=;
        b=Msb5aZOhGs2Dk0wiJzSOejQhM6DF94NGRlLkh35Q/GMfwaEMJf0QLl+6OPHOfaZvDx
         JjSreiHoUHyHRrgd3ndu34BZuj5G9/eNBIZGiLTnu2vH9dm0I6bhfX1W7V3lGqrtga77
         UMjd1vF4Hjbr5oTEdwN34r8oTn6BjXZ6MjSUJ5TjRc0PqsY8Ii7cnxr3RYUtJT/NmBi6
         bKPQLxe5gqcM6GWor1PWdMw3hrPNxAXngWd8JwOCZt8cSiOca/2LWVvjwPZEi91wNK6y
         im6EquPAAguZW2jqloPmlwFGLm9eiu3sMDw8H4rLbBo5zFrFcHvk+PxWyfJ+YNMY9+Av
         pRRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC8zH4YFCkZfYt6Eom/JXiy78AzLtfrnEIts3LbjlLT8ZZ6waE8ou0IJJhgS0YYDICAqFbzgpBvWy/PkA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxta2/9Izboa/BkObixRoh4MgQTsm3KhmAx8kXIQOp8Gy+W0Qeq
	5E6x06qEPVXMPz/rT5SSiFs6NJEuoQFvj1d8pNPVEtuFbIkD2z4qhx8RgCmWPLzy7qtIy96XE0G
	krL5a4Nv+3upcXVlg6GuxHg==
X-Google-Smtp-Source: AGHT+IHGMMlno4Vk4yfFbORjSDqS/i277l7+d9BxYohAoyJsB+e3g5dCRC4WlkbDRxt5bsVXivF+KHNj2TLxNR/xQA==
X-Received: from pjbpd17.prod.google.com ([2002:a17:90b:1dd1:b0:2ef:d283:5089])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2e43:b0:2ee:6d04:9dac with SMTP id 98e67ed59e1d1-2ef6ab27c90mr19454039a91.32.1733798487472;
 Mon, 09 Dec 2024 18:41:27 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:04 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-3-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 02/17] mm: x86: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Introduce x86 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/x86/include/asm/pgtable_64.h |  1 +
 arch/x86/kernel/sys_x86_64.c      | 49 ++++++++++++++++++-------------
 include/linux/sched/mm.h          |  4 +++
 3 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
index d1426b64c1b9..4472fd0040c3 100644
--- a/arch/x86/include/asm/pgtable_64.h
+++ b/arch/x86/include/asm/pgtable_64.h
@@ -245,6 +245,7 @@ extern void cleanup_highmap(void);
 
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #define PAGE_AGP    PAGE_KERNEL_NOCACHE
 #define HAVE_PAGE_AGP 1
diff --git a/arch/x86/kernel/sys_x86_64.c b/arch/x86/kernel/sys_x86_64.c
index 776ae6fa7f2d..95a39ef915b7 100644
--- a/arch/x86/kernel/sys_x86_64.c
+++ b/arch/x86/kernel/sys_x86_64.c
@@ -123,12 +123,32 @@ static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
 	return 0;
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	unsigned long begin, end;
+
+	if (!addr)
+		return 0;
+
+	find_start_end(addr, flags, &begin, &end);
+
+	addr = PAGE_ALIGN(addr);
+
+	if (!mmap_address_hint_valid(addr, len))
+		return 0;
+
+	if (len > end)
+		return 0;
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long
 arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len,
 		       unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 	unsigned long begin, end;
 
@@ -140,13 +160,9 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len,
 	if (len > end)
 		return -ENOMEM;
 
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (end - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.length = len;
 	info.low_limit = begin;
@@ -168,8 +184,6 @@ arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr0,
 			  unsigned long len, unsigned long pgoff,
 			  unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
-	struct mm_struct *mm = current->mm;
 	unsigned long addr = addr0;
 	struct vm_unmapped_area_info info = {};
 
@@ -186,16 +200,9 @@ arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr0,
 		goto bottomup;
 
 	/* requesting a specific address */
-	if (addr) {
-		addr &= PAGE_MASK;
-		if (!mmap_address_hint_valid(addr, len))
-			goto get_unmapped_area;
-
-		vma = find_vma(mm, addr);
-		if (!vma || addr + len <= vm_start_gap(vma))
-			return addr;
-	}
-get_unmapped_area:
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index edeec19d1708..f12d094649f7 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -205,6 +205,10 @@ unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
 				unsigned long len, unsigned long pgoff,
 				unsigned long flags);
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags);
+
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
-- 
2.47.0.338.g60cca15819-goog


