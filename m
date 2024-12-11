Return-Path: <linuxppc-dev+bounces-4013-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAFB9EDB50
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 00:28:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7sGj6Qszz30W4;
	Thu, 12 Dec 2024 10:28:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733959693;
	cv=none; b=KfZ6jggJQ4MS7hGjW27DPADHopkRearofUIwcsf69EhTFs5dfyHOuZoWShuQmZMzHZtYRxzWheorZCUrXP1r0cinbVRwveSZuZPwyTcSVdT++SV25NorL8o3u5JTgmKu7UuGkGCAcmH7a6FgDpmQcHDkxezRHeXROFU3Lp/V2tbEKl4G2rIwh4zykxZ+UKXepRMU6ptHHdlll21kCZa1DYcoQc0pWy0DLmQxEz2MK3qHsk+cPNt/BrbCpjqsYutI8l8fuy+EZBq8NXGZasP1P7BjdcIUIkg5/oOfevs9ACDi+5I03zdY0E3XBazBgE1tGGsEOh+C3sXp/4KPfH3x2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733959693; c=relaxed/relaxed;
	bh=SCptMPgkqno2A/YzE5Va18QE7zdNUHtEUd5zzpUozKw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HGZawAQc+WEu8y6s812PuvUJIRdvmJ0A9JQGTUzb+2CVxkvivTt4WQBlELtjdgLYJ/gQD43iqnLJiawRx6zyWZQCe9nayoKje3c1K4PkxfikgXZQQVRxVpTsnWkbH7dp0EyoymyTmgbDqcEdo7I8s6DQxQ+RflPtNZU7sHoEUG065QqQE+Dz8ncQGVsitrwfVKPdueIV+c3dbyz1C2LkHhUNAXTc5h8LcpslWTG//VteFLfzDGPfpwRAKbBgJFu2Mm34TkuW6jCm1Dm4T4ojV43FzXcMCGzu6q6DM8R2FdEiV8ngn79qfWgEtn6kjhvswhwxq3LVEVKY+ltqYFHWLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=D6m+xtV1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3cybazwskdpqgwhaodoejcdckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=D6m+xtV1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3cybazwskdpqgwhaodoejcdckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7sGj00X5z30TM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 10:28:12 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7f71e2fc065so38259a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 15:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959691; x=1734564491; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SCptMPgkqno2A/YzE5Va18QE7zdNUHtEUd5zzpUozKw=;
        b=D6m+xtV1AAG3kNs464ytQA7dvvXe2+DtFjrYt/UTkLpuQuV8R4JgPSJ6NEu/GXLT3M
         rwXso7r+107lCa8AzFHfoMpqcJ1nPHS8vjnzLfojQ/Ia1gwfRPaQTiKWBk+93eWJNr9f
         T0IbD/0z2ZRHERbo+SHShZGm67vE9Z/rAEGLFlsauMKOgU+2roK8kWtbu/exAv5peB91
         EcRoeJQsV1GQTP+Jgg5x1PACHPNJ7l40gEODDSKhDiJsyzFGOsoC2v0gxUxtfRy7LNxT
         SkT8LANxRj81TdvRgnws+nkNjCPE663t7KkgCjdn4aOSM00i2jnbwYSvoDYmCn8Z3V7B
         Hy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959691; x=1734564491;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SCptMPgkqno2A/YzE5Va18QE7zdNUHtEUd5zzpUozKw=;
        b=nqNUIv5RWZpBC0WW1ICadzosyKkNqXNb1kuWKwwATSNf/WlSBWsjHly0YPUDnRfq4I
         i6K82rtlunOKqjigxDmrnH5PtW7GyUjn7mSwVu22X36LBBZatGIEGg+2GD5YHecptDIF
         Ola33jHanqIzwqu4KwV6ETmCmrAvKhVx488iECkX2w4szunkn6JngfGoesK5MuQAbcdS
         qEzifYm/N+fqqFYzMfgYSHbzBDVJkQNsI6HwKUnHqhwalCH0W7AQ5NxcEewnUr1/NIg5
         SCDTPzJkrDRoVcsMkRePogx5svC+e0bJ7o1RNSJ2C56rxZ5aEdpSSQ5ahfV+v5JSd3J+
         UPfg==
X-Forwarded-Encrypted: i=1; AJvYcCU/yyxD0UYrOvklld8CchmMh1Wpr0soyEFVAZmB37884RRo19Ij2beZ9fIQqnAZ0jG485FhWmNy0vQgMhg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyg7w0FwrC/P3ujNN/8S/PzP517cexE3erqAPkkbaxDuOC3I7V7
	EDccgQ1IvR7INAq2KQwhVAA5zgnN0FyeWUGJcfElNppC+s3XoIwPuKMXgQYdnaY4EJoEAEbikRc
	rAwSBumhxM/kVArxyoGo4cA==
X-Google-Smtp-Source: AGHT+IFbvN9gPDak20G0G+YmM9pMBv8oAuiEUiRl+GFZxjvR/H2lZBtc+wP+WVSCEq90xAWHwKXzIcf2MC+rzJKWTA==
X-Received: from pfxa2.prod.google.com ([2002:a05:6a00:1d02:b0:725:c7de:e052])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:e306:b0:1db:e922:9eaf with SMTP id adf61e73a8af0-1e1ceb2e4dfmr1374719637.27.1733959691453;
 Wed, 11 Dec 2024 15:28:11 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:45 -0800
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
Message-ID: <20241211232754.1583023-8-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 07/16] mm: loongarch: Introduce arch_mmap_hint()
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

Introduce loongarch arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/loongarch/include/asm/pgtable.h |  1 +
 arch/loongarch/mm/mmap.c             | 49 +++++++++++++++-------------
 2 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index da346733a1da..326a6c4b7488 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -624,6 +624,7 @@ static inline long pmd_protnone(pmd_t pmd)
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/loongarch/mm/mmap.c b/arch/loongarch/mm/mmap.c
index 914e82ff3f65..9e57bb27642f 100644
--- a/arch/loongarch/mm/mmap.c
+++ b/arch/loongarch/mm/mmap.c
@@ -17,15 +17,11 @@
 
 enum mmap_allocation_direction {UP, DOWN};
 
-static unsigned long arch_get_unmapped_area_common(struct file *filp,
-	unsigned long addr0, unsigned long len, unsigned long pgoff,
-	unsigned long flags, enum mmap_allocation_direction dir)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
-	unsigned long addr = addr0;
-	int do_color_align;
-	struct vm_unmapped_area_info info = {};
+	bool do_color_align;
 
 	if (unlikely(len > TASK_SIZE))
 		return -ENOMEM;
@@ -45,22 +41,31 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		return addr;
 	}
 
-	do_color_align = 0;
-	if (filp || (flags & MAP_SHARED))
-		do_color_align = 1;
+	do_color_align = filp || (flags & MAP_SHARED);
+
+	if (do_color_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+static unsigned long arch_get_unmapped_area_common(struct file *filp,
+	unsigned long addr0, unsigned long len, unsigned long pgoff,
+	unsigned long flags, enum mmap_allocation_direction dir)
+{
+	struct mm_struct *mm = current->mm;
+	unsigned long addr = addr0;
+	bool do_color_align;
+	struct vm_unmapped_area_info info = {};
 
 	/* requesting a specific address */
-	if (addr) {
-		if (do_color_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	do_color_align = filp || (flags & MAP_SHARED);
 
 	info.length = len;
 	info.align_mask = do_color_align ? (PAGE_MASK & SHM_ALIGN_MASK) : 0;
-- 
2.47.0.338.g60cca15819-goog


