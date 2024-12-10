Return-Path: <linuxppc-dev+bounces-3885-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1755A9EA574
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 03:42:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6jfp5Q3Vz2ymg;
	Tue, 10 Dec 2024 13:41:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733798498;
	cv=none; b=C2SjP+FlN7Je0Er2uzKF7hxMSawt9sqIeEuTm5kxnqP6CMdZaoxHyCKIv+OqaCxiL+8GQln1pHVls06zgheKkUgRpjyfki2eQrFNt2gdVUK+n+5UE6RnHcjxhL1mC5I6sobYT7pMD1kD7ZNFbaeaind1sxnHl5BVUlYCBQTppg4djDlR5H8QAHFiZwNnKync2EdX1aeP61XfqwtFnxcQJwoZr2wudvT45Sgv64Pi+b03RUxu6utNsjsEYPsd+Xeyega03MO/Eck2PsZbtcd45/Ce37QKhZZy3MK+eEhs24w+KZc1Rmg6NKRrB1D6JbZ+UyXIRSs67hi7NRs8kBFl2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733798498; c=relaxed/relaxed;
	bh=10lySyzZTVvC+S5oM1O6pINxMohBlWGSJurdKiLL+/8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nRH0LsjGSvQlJOjVvvWK6LPS7WNDuT40dO5iWX6CpDmMGhraa9yihg8Od91rBi7cJzHLvtqcN9COhkutDl2iEw2KzArUarW2WN6/qiOXICWcMy8ODfD1xT7W50X9MVnDfOlqXuaHYChGzZ9VUaDGh2bwbqV1hyTyAj+ER/jATEVYFMtkrKcHcrieSdwmpxqek7XepF7608LneexfYVSeP1/zaaK7encWMpOSxQDMS+GAQlalEa1drszKeZF4Wb0obZMLNUYrp950ghukOIy+FfogmqqKwby1mcSlaGR0wG39LfmkHaFqfIAmQZZ41+GmzhoXaLKJku6fW2+NO/+yBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Fv/NQlGf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::c4a; helo=mail-oo1-xc4a.google.com; envelope-from=3xqpxzwskdfm5v6zd2d381219916z.x97638fiaax-yzg63ded.9k6vwd.9c1@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Fv/NQlGf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::c4a; helo=mail-oo1-xc4a.google.com; envelope-from=3xqpxzwskdfm5v6zd2d381219916z.x97638fiaax-yzg63ded.9k6vwd.9c1@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc4a.google.com (mail-oo1-xc4a.google.com [IPv6:2607:f8b0:4864:20::c4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6jfn5cMKz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 13:41:37 +1100 (AEDT)
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-5f2b05e037dso1562981eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2024 18:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798494; x=1734403294; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=10lySyzZTVvC+S5oM1O6pINxMohBlWGSJurdKiLL+/8=;
        b=Fv/NQlGfIMBDBAc8nWnhT/QmAOShHwJtKE3FlB2YStGwvzv4zQQULMtY626C9bpZoX
         /I7AOz/QWVryDTtiRowf9YtDJ/XmTEZjEFhSzo9q3ncLGd/6jZLz80EsdDj9mbiZsJGq
         WiIKTeMXK+mbvFShyQM6zvaXUJu0IBGco9cEdUusnYD38SlmOgZhrtW91yChDyZMkWTh
         83Du2p9gg/0w9qiLSSTSEO4t//50LBHa3gMWnlFM5w4SeMKnxhNv+T4GBW388Fo5lz00
         UqgQNg1G9cER4yXXOPQxJAJJo+lrToRsLasDuMZ6mrVMjKWEcAr9XlhgoElNqTho9UeK
         H7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798494; x=1734403294;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10lySyzZTVvC+S5oM1O6pINxMohBlWGSJurdKiLL+/8=;
        b=tiWDjCJpgH+AYpJq5+6dhqKG2m51Pt2xgeJ0x0irY1g5vA747qdEPY0mcpX+8TYblV
         fsHEwkor2vuQ/OFntAYAIA6IrKRIL4H5F79w554Dj9KjUkjS5L9GsM6i2YUDIdE7JInD
         q78vfSHd6VThu5meRrexXyEmcKRpVMTzSKaLAgr5sUwQAMz/WBQOTL2r/RyBabG3UOWd
         1aiAeILo0ZN/bGsyccYKEpI8u1QXeotUk7ZnaO2BTbjYs2vn8s6OnEF1YF/FMsd6qiBN
         t2eZxI5KorVR51bGn8lorul2lAMgMNe2jhnnW57gx1Te2cUeKOMgDE0FV1jDijm6jEw2
         bFlw==
X-Forwarded-Encrypted: i=1; AJvYcCWLx3Qzs+RqnhwBoMoZi5s8WufnwQc9KLecFQr49r9evw+emLySc9GheT17CBAZ2UcBiYrGr9lGC0jRC6U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxgeYOZJCYH3RUUPPVyZKawguYTev3Jl+9usliGDLz7YLMOKun7
	uQk6esgLPY7ZMMUGIrKmAmmxLkPnp2EhOv+pIx5mQxkKW1m3jZs7UWAJlTDTfouSqF1Ld0JZr97
	yVuWm/eQJhlEJz1S5q7IGLA==
X-Google-Smtp-Source: AGHT+IGrVCmYvgbRZyJY6d84f+llUxgBN0sslSfR3tN174qad1011sAwn0+s/lhjeAWOT5E3i4gR4UE5Ru9TVnP2PA==
X-Received: from oabfu21.prod.google.com ([2002:a05:6870:5d95:b0:29d:c6f7:1bb2])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:5a9c:b0:29f:f4af:dc34 with SMTP id 586e51a60fabf-29ff4b0889emr667703fac.7.1733798494636;
 Mon, 09 Dec 2024 18:41:34 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:08 -0800
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
Message-ID: <20241210024119.2488608-7-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 06/17] mm: csky: Introduce arch_mmap_hint()
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

Introduce csky arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/csky/abiv1/inc/abi/pgtable-bits.h |  1 +
 arch/csky/abiv1/mmap.c                 | 38 ++++++++++++++++++--------
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/arch/csky/abiv1/inc/abi/pgtable-bits.h b/arch/csky/abiv1/inc/abi/pgtable-bits.h
index ae7a2f76dd42..c346a9fcb522 100644
--- a/arch/csky/abiv1/inc/abi/pgtable-bits.h
+++ b/arch/csky/abiv1/inc/abi/pgtable-bits.h
@@ -51,5 +51,6 @@
 					((offset) << 10)})
 
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* __ASM_CSKY_PGTABLE_BITS_H */
diff --git a/arch/csky/abiv1/mmap.c b/arch/csky/abiv1/mmap.c
index 1047865e82a9..184921a73856 100644
--- a/arch/csky/abiv1/mmap.c
+++ b/arch/csky/abiv1/mmap.c
@@ -13,6 +13,29 @@
 	((((addr)+SHMLBA-1)&~(SHMLBA-1)) +	\
 	 (((pgoff)<<PAGE_SHIFT) & (SHMLBA-1)))
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	int do_align = 0;
+
+	if (!addr)
+		return 0;
+
+	/*
+	 * We only need to do colour alignment if either the I or D
+	 * caches alias.
+	 */
+	do_align = filp || (flags & MAP_SHARED);
+
+	if (do_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 /*
  * We need to ensure that shared mappings are correctly aligned to
  * avoid aliasing issues with VIPT caches.  We need to ensure that
@@ -27,7 +50,6 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	int do_align = 0;
 	struct vm_unmapped_area_info info = {
 		.length = len,
@@ -55,17 +77,9 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (len > TASK_SIZE)
 		return -ENOMEM;
 
-	if (addr) {
-		if (do_align)
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
 
 	info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	return vm_unmapped_area(&info);
-- 
2.47.0.338.g60cca15819-goog


