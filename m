Return-Path: <linuxppc-dev+bounces-3892-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A69EA595
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 03:43:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6jg15YJwz2yys;
	Tue, 10 Dec 2024 13:41:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733798509;
	cv=none; b=hF+nVeDeNcTgjXC4vhmimsi7VT6TcvqcVF5teYBw44Irgv8cEIq3+ElIQOORawfHxf1xwi8gVKb3r9RORtdiryai2+e+70R8wNhjfKZPai+SyzW8RHqd3KoYHI5gQO9mz3ZbfETxpJc/P6jlfAsNs3wQtaEIGSWdd1vKXlxjmFphJOJe5cgNwQ7h3/4m19cSS6/y4ZjB4pvJdQ5AOclDglIZyxY+cPgME8dkvNSYKpphFGfP7KqaUQQiIS0JMi2mA4as/OZKTpuVUnDPTCB4oijzvoi4nCcTeQyNvERfKisHr3Qh6iSDhIOZlUHiuYy4piK5G4lFCfexgCtO9NJ7HA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733798509; c=relaxed/relaxed;
	bh=lD1y5M/92bgTaY6KXagZAGAzcvbsf/5mzkOXcooW0ho=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oYpubRpNw3C9D63sTtiM9xBbHo/xWW6oy64DOY2nGY6My8JLkJJqRsBycaKHnabjPBUyWOAvMVoYfj1D1ZG3KhKvoMnFSNv8Xar9ivYjnnSDW4ZZUgoPUzHoCm6n8l6BzcL8AoiQE/3VezLSRhoGDb2W3FuK9wK952Vl5Ng5Gx8ert2bUeTYraZa0To5JTvDiep9f4Ug7IxIo/6BfpXmy2l/gT7YhmnbsNy9CMggldASsT/UHIHJbs9vRZdTkgVTgysKW7xR0UB4pE4yJEg99Az8k8L6XRNaNuAyLgsTvmgNj1Jf2a9OduFWp/v5PZ7tPlOpb1QG2UX4iFp1T557cg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=w03tfZ/4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3a6pxzwskdgai8jcqfqglefemmejc.amkjglsvnna-bctjgqrq.mxj89q.mpe@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=w03tfZ/4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3a6pxzwskdgai8jcqfqglefemmejc.amkjglsvnna-bctjgqrq.mxj89q.mpe@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6jg10PkWz2ysv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 13:41:49 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef909597d9so3594288a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2024 18:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798507; x=1734403307; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lD1y5M/92bgTaY6KXagZAGAzcvbsf/5mzkOXcooW0ho=;
        b=w03tfZ/4Yy48ZWQcjiw5ssY9Ghjsxq5fE2NfEdALFtrJPe6t+YaVlwPbid49swTob+
         S03SR26y3EUYLNXDSKpsE7znKH4v2VhozE1IMEgmNTQzybDPHi9lN/hracrUWAUvqc3t
         puhg0rLBUG4d7KHJ8sBU823j7/loNv2kLW0MZiWlTQUAhhClOymTazqU/+79H7tp6mTp
         BsJTsC+em39ZgCDMdUvxmgzIxBQLZJlXEKaAWZ/sFCHXQhEU5DcjwJzu/T+L6pNS517T
         XOsJ1Dsrfimoeb2lu8S2DXydgj7qqsqLa5+yiYfudKir45TKwQpNXYGJ6o0nmiXG/WU+
         yz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798507; x=1734403307;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lD1y5M/92bgTaY6KXagZAGAzcvbsf/5mzkOXcooW0ho=;
        b=Xc0i2fe+A83O1QBFjdbUD2DcKTZ52j9OpmrKQcbS+52bfjBh/hhOVLXxqVus5ZA4Dh
         iOL2ph+qlvHnHrhlGtjIGXd32hyqMeoJdwc+Yu+6zLhVdmajaAtGlPElyEL2wVHAjBkl
         BzIti/8wVAxSqWPN2pFr16v3DwwRuEGbNPtTnQkjhnwa4P7M5Fi0pBcEi53ffzVR3s1h
         /GVCZhe0giKHGG+PcBRoyPZdL9LvIa76X3y8M3NocrqTrvGM0Z/yohHq5OIGvMJOtzBB
         tqGk3ATTINgnN/rawTd92K9xBZLfa+j/tZiBjCHBuFTY4ihsjuowue/A9S1OHbx7MYCU
         QluQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSGOemjsgw6tCu7y0tNHqz1Vw+Q+8Gjt/Kx1457Zlw+m0Hwp/qlPcseBWsYd+0b+5z7+XN7f/o/+5dD6E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyHIeUe7NxotCcO0Uwn8PONDWAyUH9FmQzAc/Yol7Yw2sSj5ROx
	iZ7Vex2JmAnH3r0buum+hr97eXkB4a0V1ezu07lgjvxJUgyb540OCIAFVuCeE8MxvmoH0xOih67
	T6PYyOxNEDbdAV91II4j6mA==
X-Google-Smtp-Source: AGHT+IEki7Ie5yO93OnRXKQVvZe4Tx9Zhtxszko37jcevo7YJZw67tf4QTtrn4drQ39DwCB2Qw8B/AwA/g2PTJdBkw==
X-Received: from pjg15.prod.google.com ([2002:a17:90b:3f4f:b0:2e0:915d:d594])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a:b0:2ee:f80c:6892 with SMTP id 98e67ed59e1d1-2efcf136579mr4227892a91.3.1733798507341;
 Mon, 09 Dec 2024 18:41:47 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:15 -0800
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
Message-ID: <20241210024119.2488608-14-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 13/17] mm: sparc64: Introduce arch_mmap_hint()
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

Introduce sparc64 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/sparc/include/asm/pgtable_64.h |  1 +
 arch/sparc/kernel/sys_sparc_64.c    | 47 +++++++++++++++++++++--------
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 2b7f358762c1..f24a4eb2777b 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -1148,6 +1148,7 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 /* We provide a special get_unmapped_area for framebuffer mmaps to try and use
  * the largest alignment possible such that larget PTEs can be used.
diff --git a/arch/sparc/kernel/sys_sparc_64.c b/arch/sparc/kernel/sys_sparc_64.c
index c5a284df7b41..a782696e98e0 100644
--- a/arch/sparc/kernel/sys_sparc_64.c
+++ b/arch/sparc/kernel/sys_sparc_64.c
@@ -98,10 +98,39 @@ static unsigned long get_align_mask(struct file *filp, unsigned long flags)
 	return 0;
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	unsigned long task_size = TASK_SIZE;
+	bool file_hugepage = false;
+	int do_color_align = 0;
+
+	if (!addr)
+		return 0;
+
+	if (filp && is_file_hugepages(filp))
+		file_hugepage = true;
+
+	if ((filp || (flags & MAP_SHARED)) && !file_hugepage)
+		do_color_align = 1;
+
+	if (test_thread_flag(TIF_32BIT))
+		task_size = STACK_TOP32;
+
+	if (unlikely(len > task_size || len >= VA_EXCLUDE_START))
+		return 0;
+
+	if (do_color_align)
+		addr = COLOR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct * vma;
 	unsigned long task_size = TASK_SIZE;
 	int do_color_align;
 	struct vm_unmapped_area_info info = {};
@@ -129,17 +158,9 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 	if ((filp || (flags & MAP_SHARED)) && !file_hugepage)
 		do_color_align = 1;
 
-	if (addr) {
-		if (do_color_align)
-			addr = COLOR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (task_size - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
-- 
2.47.0.338.g60cca15819-goog


