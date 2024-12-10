Return-Path: <linuxppc-dev+bounces-3893-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F8A9EA59C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 03:43:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6jg35BTPz301B;
	Tue, 10 Dec 2024 13:41:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733798511;
	cv=none; b=M17dQTBBFyqsmUTyokXmZVCieIDEwY0IEV5q18GLzRK0RJUM8Q9wzotApO3PMtWEaIkokY95NBuVGLqjla3lc1uz1RFEymyEZciQA3N44EHudNts569VG8WEj20yTOQK9i9Qqu+q1Vh4e/wIA4l+5NBNjGS7eelUvFjWogQoUV3ZYchkIScSTzYqj4/CpLAEmxLh88dhxRTWE/inJ68HfQX9n9w3kWC/KRDsWEfioSZkOsbRheZnfNszUxhV5MObqRpd81I7gqiYnhoDetyAHCTuWi3XC5dBD2ToEYJQ3NXuPGl/PrskLC4/fFzwoZ16OHmMafEO0mmttFMBAQCK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733798511; c=relaxed/relaxed;
	bh=8RBi4d94aA8fGJb29BjAVbVAiuWgJzs9FAFEoE/Tcq4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aEaArxIHs6ebM4C7aI/WWFQPYj+eICEWPG4zufL/vgevbG3T/Ll4LhDBeZJb9JZLQHyurWh/rhu2ju4Cz7fcEDCR1jPOuNN1q654ULy6JqIHt+wNS+X6DG2ddNaGnES3rVSCZ/5GtKSVJPdh+IJM+GGy1EeGnC0BSbzCUDCCGyBHuoMFEbpu4VvSycEafYt7PzDPSy19v/f4OjR0hNjCzA0wKKEPgxmnXjHgMU+wzvGn75BpM7tv7fubMom8z8Q/DWleZ9alytj3123Xn1p5I0E5xInHPt73EueN2kzPuScODa9jMN7CgVZEqF7tkzIMefmaF/rnY8JCymbUqQaEgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SsR/bxOf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3bkpxzwskdgej9kdrgrhmfgfnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SsR/bxOf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3bkpxzwskdgej9kdrgrhmfgfnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6jg25SRZz2ysv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 13:41:50 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ef79d9c692so4105028a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2024 18:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798509; x=1734403309; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8RBi4d94aA8fGJb29BjAVbVAiuWgJzs9FAFEoE/Tcq4=;
        b=SsR/bxOfnSBsFregb3nfn0FSCIuzk1faYQ0nOndbpi228w6h26J5PBZaSeoXC6neSy
         H3ZNsKalOKt2U+UQLdKwczYJob2TcepCUXVur4jiOzX3ADX8yA6xREMHDb0n0ZG404Xj
         vwt5C6Ty3yhYThCBbiN0O/jCkv2YzCzykqywU83ET2f4yhTpIEbu2nVFyh5v+3wBT98e
         kaBssD5D0tqJRn0/7ZQ7Kj2xjsxt11+c2th0H+mf2eQBvggUp2QNdBaEZYISa+q01PGj
         DOSnGtsgTxeiFq9ck9Ke2xpBOimpr/0/qu0LZxhVKOLMCpN5TqX/aoh8ggIY5OFZP7vx
         rOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798509; x=1734403309;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8RBi4d94aA8fGJb29BjAVbVAiuWgJzs9FAFEoE/Tcq4=;
        b=PGu8TJU/0tmeTzzLoVbE/8oiXNEcjfOSqNMrWkyFyxonadt8nQsD6Uud9RpeEn1Xil
         fRk8or6UfSifL18HqclIUahXktvhbkrl/obg9LjMbYHtALmpZaDZxFHK4w5llCb1yjtE
         9jJdRH/QXccJqZy3W+55tlsKCSOjSd3l7DVyZ/vElpX0omE9uaQv5jEuJQSAE/p+V3tu
         TxZ+1Omjc65+cQcfRzVF/NvnoegSQDGFSKGvXJCjbV+Pz6unNawsFHlea73aRxBZQYwB
         rw1kuALJU6zmHx1K8IWqry6HiELIf3ya1RBmUZ17ZqrHwCKhGiQ382qw3D5KZzbF4K1+
         c4Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUMX7vlKdZ/psayVIJtNwRHvMUnJdAYR+JxoLXbWK+YfDU64mhv5Jy5qi+17h63kpI1Ou8UNmxkAaioRR4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzAvf2/MDEBvVZDzg8ZwyjQUinOW/fYoi21Jz0Sa+OPkdeJi2Bv
	SiOda9N9bjVp1quzuzRbc876CVCQOmYC3ZAwIN2OrokMT71cVlEZDgOJV2TfzUovga+r2tPVq93
	OMayMu+AIPoZsBTXPlVTxOg==
X-Google-Smtp-Source: AGHT+IEWnrN6kZ7CMoj0XPEY5LyEzTzu31G9SE2ukZ22eBNhBZBZVrxzEpEONDIVdXz8wv9Xu2tYcLSnTTgrFqyRgw==
X-Received: from pjbsq5.prod.google.com ([2002:a17:90b:5305:b0:2ef:9866:6155])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2544:b0:2ee:c918:cd42 with SMTP id 98e67ed59e1d1-2ef6a6c11b1mr19145935a91.22.1733798508962;
 Mon, 09 Dec 2024 18:41:48 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:16 -0800
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
Message-ID: <20241210024119.2488608-15-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 14/17] mm: xtensa: Introduce arch_mmap_hint()
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

Introduce xtensa arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.

If a sufficiently sized hole doesn't exist at the hint address,
fallback to searching the entire valid VA space instead of only
the VA space above the hint address.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/xtensa/include/asm/pgtable.h |  1 +
 arch/xtensa/kernel/syscall.c      | 26 ++++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index 1647a7cc3fbf..31b7da0805ec 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -425,5 +425,6 @@ void update_mmu_tlb_range(struct vm_area_struct *vma,
  * SHM area cache aliasing for userland.
  */
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* _XTENSA_PGTABLE_H */
diff --git a/arch/xtensa/kernel/syscall.c b/arch/xtensa/kernel/syscall.c
index dc54f854c2f5..353cce1ac9f1 100644
--- a/arch/xtensa/kernel/syscall.c
+++ b/arch/xtensa/kernel/syscall.c
@@ -54,6 +54,24 @@ asmlinkage long xtensa_fadvise64_64(int fd, int advice,
 }
 
 #ifdef CONFIG_MMU
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	if (!addr)
+		return 0;
+
+	if (len > TASK_SIZE)
+		return 0;
+
+	if (flags & MAP_SHARED)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags,
 		vm_flags_t vm_flags)
@@ -73,8 +91,12 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 
 	if (len > TASK_SIZE)
 		return -ENOMEM;
-	if (!addr)
-		addr = TASK_UNMAPPED_BASE;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	addr = TASK_UNMAPPED_BASE;
 
 	if (flags & MAP_SHARED)
 		addr = COLOUR_ALIGN(addr, pgoff);
-- 
2.47.0.338.g60cca15819-goog


