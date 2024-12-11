Return-Path: <linuxppc-dev+bounces-4015-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E139EDB59
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 00:29:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7sGp0M1Xz30TM;
	Thu, 12 Dec 2024 10:28:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733959698;
	cv=none; b=WS1WoiAyUtbr7DPwePxqRP6Z6keZUXtg0+vVnmsOa/vhZCoOskwCDTvOkCbagZk9ttWAO92MgsAkkhF/UbhK3R84AQT+aOAhe7reQ0zGPLzE+ROJMAIiGAjyKN4BpaUAoVZYIS+0uPxuThe85krqJGD5iH8IjsgxeudaNNq6N/sI22W+lJAAEAf4ZSOl1caRHuOKY8nFyCRfLVWspXsj/+lf0tGa0CDWIKvrLLMWFPOnpl73VvHCkS44nBYwO95z8nYYuiK7szGsuGjAxqetG24UdlzkroxrqX8izfrCL+OxkbpTH3Zk010lqlhOI1fC1Pg6qKNLinM/NcQNzY2O/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733959698; c=relaxed/relaxed;
	bh=wxiw+xEGORRKxhtCLZq/pFo2CvQKmbacY9QkYe3JDdE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QxTxoDnHLmv93k4fGb8DA3EB4JjkpGUyr52GKuZr16Aq+4TkEThbcqArix6nfTjKs3Qhb/sj00looaX38kH764Pi9hTqmZX40u8QRlJd0KHtqKoc0VGfOO0mM3LSvVCX40IaY2RKGdQdmLZEAdIT+GLBQPBG/yjjcFEXCcDHYW4Fdpd1vVVkexwQ2M3cbbyy0RTev9WZAj4b2eL5i5Owu3a+QmS2pcB9x1lSevw9Sg4hUNEouFYirXCpglpWiQ9LWIVwnBemVlHDPyJndT72deLtr/BGpAdeJO+Gxet1fO1ZYBYFecKb1mdr0938bhdIado1ZzEg+tlEvGcyiQb2WQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=L5pSxMq8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3dybazwskdpgpfqjxmxnslmlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=L5pSxMq8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3dybazwskdpgpfqjxmxnslmlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7sGn2Kq0z30WL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 10:28:17 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-725e4bee252so21383b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 15:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959695; x=1734564495; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wxiw+xEGORRKxhtCLZq/pFo2CvQKmbacY9QkYe3JDdE=;
        b=L5pSxMq8QgxceUjaC3CkudWkzcWUBAq1OL8SZgG8DegiaAwJ3NapEyLS0evhk8cziP
         jWGZMGkjbkmyRvr7grC9INgDBBFGbORMSi7iKvnYShk3JiVHPlmdX/+mrTribIfQIgmI
         279+YgkSih4vkVNZwhU+5Shw2BB8HMwUJ/so0W1VbVL6qE3GhQt8nYnFF2GA1asMtN1T
         9MoJkow8qFSwQhnb88qul64hZq2Hs5wpn3lFG1RYXEw4tfmLoY6rEqdKqIzkeNCRpD89
         w46xmwUrrL6aEZYv/PUoEw4VtbxAIXHGTYtRxcps5af0+dp8xie6qwNh5fCQXzQ6fPIE
         kn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959695; x=1734564495;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxiw+xEGORRKxhtCLZq/pFo2CvQKmbacY9QkYe3JDdE=;
        b=A1sPcc54aj2ABJZG+PQAV2SPyQwgWagDfVlOFgtgqMWI7ST789NPjdqC5v1hEHT/D8
         kNmu+TallxfiBM9Rvx4fUH13IimwEaJ3FHAU7ChyAxkZiKil4cJH0puPXzF7a53TxIEq
         S2eMgPSdlU4NI20qg41HHBBmu3aQrfQEA26TLp4wR/+/anv0cP7qqy0hY/k9ZbeVIXzQ
         ZAGUCU+20TDmRlfLKoe9TWoRCpZzzixhfxBZ43fX8Leto+84u+jtkMJayw+Ru62CCtX7
         JAVHlsU507L2l2Xj06T2dVVwuzMJWpWK9920kvhSqMdRUfigdUspi1oRDkp4nYK6KLr/
         rUpw==
X-Forwarded-Encrypted: i=1; AJvYcCWmpeOGIHQCq2iivx4GyjN8co++zphS3C/jeiBTLRFgwQ9RMSEHYTSG6k7zVUfA4DN9CV6xdS9irnxn1Ao=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywm10AcyIG+Z6Led3ek7uyKcShDGdLTj502R18ucGDZPLxRsr+d
	MJbktANsfTo+jlGrrRGdRlEjJ5ex0reYwJPy6dZnhmoHcC+VKByG61Y9Kk/JX7hOcN0MKQhh0iw
	Q1sUzIrpLHNrzMnTSZ3sbtw==
X-Google-Smtp-Source: AGHT+IF4fNavDkLG8tRoFUmw2gnTJz71oU9t6WKhM2RNFmEQvjdeJ2dIL8s2CnxPdes2eHu66I58PC2AE4yum4CFsw==
X-Received: from pgbdp11.prod.google.com ([2002:a05:6a02:f0b:b0:7fd:4c8f:e6a1])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:258a:b0:1e1:a829:bfb6 with SMTP id adf61e73a8af0-1e1cea52239mr1772079637.3.1733959695421;
 Wed, 11 Dec 2024 15:28:15 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:47 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
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
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-10-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 09/16] mm: parisc: Introduce arch_align_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
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

Introduce parisc arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/parisc/include/asm/pgtable.h |  1 +
 arch/parisc/kernel/sys_parisc.c   | 53 +++++++++++++++++--------------
 2 files changed, 31 insertions(+), 23 deletions(-)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index babf65751e81..73987357c78e 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -505,6 +505,7 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index f852fe274abe..c1702d481e33 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -96,24 +96,16 @@ unsigned long mmap_upper_limit(struct rlimit *rlim_stack)
 
 enum mmap_allocation_direction {UP, DOWN};
 
-static unsigned long arch_get_unmapped_area_common(struct file *filp,
-	unsigned long addr, unsigned long len, unsigned long pgoff,
-	unsigned long flags, enum mmap_allocation_direction dir)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma, *prev;
 	unsigned long filp_pgoff;
-	int do_color_align;
-	struct vm_unmapped_area_info info = {
-		.length = len
-	};
+	bool do_color_align;
 
 	if (unlikely(len > TASK_SIZE))
 		return -ENOMEM;
 
-	do_color_align = 0;
-	if (filp || (flags & MAP_SHARED))
-		do_color_align = 1;
 	filp_pgoff = GET_FILP_PGOFF(filp);
 
 	if (flags & MAP_FIXED) {
@@ -128,18 +120,33 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		return addr;
 	}
 
-	if (addr) {
-		if (do_color_align)
-			addr = COLOR_ALIGN(addr, filp_pgoff, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
+	do_color_align = filp || (flags & MAP_SHARED);
 
-		vma = find_vma_prev(mm, addr, &prev);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)) &&
-		    (!prev || addr >= vm_end_gap(prev)))
-			return addr;
-	}
+	if (do_color_align)
+		addr = COLOR_ALIGN(addr, filp_pgoff, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+static unsigned long arch_get_unmapped_area_common(struct file *filp,
+	unsigned long addr, unsigned long len, unsigned long pgoff,
+	unsigned long flags, enum mmap_allocation_direction dir)
+{
+	struct mm_struct *mm = current->mm;
+	unsigned long filp_pgoff;
+	bool do_color_align;
+	struct vm_unmapped_area_info info = {
+		.length = len
+	};
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	filp_pgoff = GET_FILP_PGOFF(filp);
+	do_color_align = filp || (flags & MAP_SHARED);
 
 	info.align_mask = do_color_align ? (PAGE_MASK & (SHM_COLOUR - 1)) : 0;
 	info.align_offset = shared_align_offset(filp_pgoff, pgoff);
-- 
2.47.0.338.g60cca15819-goog


