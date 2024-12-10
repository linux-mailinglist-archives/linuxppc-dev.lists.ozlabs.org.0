Return-Path: <linuxppc-dev+bounces-3886-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B371B9EA579
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 03:42:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6jfq4tBVz2yk3;
	Tue, 10 Dec 2024 13:41:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733798499;
	cv=none; b=GWSWy/qO974+Xwx4RoOQrrnTo7BE9Yf7Zu/xcEApWSuAdBP2PRK8mXoD2WyGlqgXRpo9t4ulZ8ciAb/pNcf8RNvyvyC7heHzChOctRcKOa4yIrmNUN59YFdXeeSEEo/vzLGKfPoXC/R8deS6NSMA/pAvCbzgLA3yorguuDggTgZpiyu2AFGM1kLe1jrHqLjejIYHRhI0jMaAeFaZflxno25CTBQq5+6VL7Y97+2IvAKkck6KODvTKuwP30UUWzQ+6SHjjUD9Cm80DPdM0abwR+UkeMpjRHmLfz4FF+XvNPII6L0B+xVHGpor+Mgm44wJLbzGaQW1oIwY+jnTVs2JZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733798499; c=relaxed/relaxed;
	bh=S88A34UwW99gwo3FHZNSbMidEba+jodHLuTGE22Alms=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c0ep8Q+Tpq7+P7ZOpO4ujOMWAFAizenrV5YmMh3RSna/+fKVEFtT7+sQnIBFPTIRI+KuFIkcA6PavhmNwkaeRRt4hqNy/R5aJ8YE+lAp111Lg0VcKKOwZ4xQWnHnWVqi3U9HiIPCL5N0ETaynKIs4nSsC+yF2erhbecV4AwH2ErT7IkFx+eYna9YelGpJqBTlSPRyKBkQWfA5aYwhQsIuxqRQ8UYbN6metc+/Kfe00Bz7chGSuf4ZrnEoMiup3aK5EjZ7Js+SA+BuULjcwij/J80in2FtZuumQ8l3XcTGsqN3iQDIdu3tQMwXSlIPkJr6rJGDWn/32QRY44RQFLxMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=AZMirraF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3ykpxzwskdfu7x81f4f5a343bb381.zb985ahkccz-01i85fgf.bm8xyf.be3@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=AZMirraF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3ykpxzwskdfu7x81f4f5a343bb381.zb985ahkccz-01i85fgf.bm8xyf.be3@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6jfp5cGSz2yng
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 13:41:38 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2e5efb04da7so5292441a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2024 18:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798496; x=1734403296; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S88A34UwW99gwo3FHZNSbMidEba+jodHLuTGE22Alms=;
        b=AZMirraFvvqXsbBzUdx+CRnOFYXhnPjPq5+a5rOuDq6tDvYIujAxKNzHMJiRXmoKDh
         AUtzYBc8rOKCis7bK32tWMnDmip2qWvulJ00lqcrJhjfKBJFI1fSVOx+1cHUSCGr7ch0
         ScdxgR+i2TW4R9vvXYaTNuOqDG3dCjG8U9kNZm30KpOxgbxzoundbSQD9awBP4gHD5kb
         B9AOf9y9kZ8oCz0lJN9IYi9xS2K09C22oIN/rd5g3yCqQeZfwHu4D9ud9elDZN/MJM4T
         kxaFLrEk4kp11msiIXS5sany4Iomt6qWnex9+FUE0+NfFJQwPfLm1ua8zDR6Hjy/orvf
         PI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798496; x=1734403296;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S88A34UwW99gwo3FHZNSbMidEba+jodHLuTGE22Alms=;
        b=xJlkLUSuvMkb8utclZzMydoyotzVZ/laWWUT1W/m1V0zn5sZcnmuA2XCPVkU8QijYD
         9bPldyDXK6PFOk34xWv4W8jd3Y6Yw6d+0rZy2m/zanzEWZSg5B49VzMi9Pg7DCA/z5by
         hos5d2rNZqqKHYka/0VXeds90AWx9HqyQfH2WNvrgxpn0drh51LFj+ldyHPSY0VRQXsn
         nA+XX7ChkCC3PAeBIm6qHFlEdVivHRMT6VEoBpT5kYhs8ZsJ6w67PKy99q9gUM0br4Y0
         4H7B59k5OCH1h4kLbZRB/DKyCdoMava6tt3+X1pRGe+tyBrUH8bQTSmBt1TrX7g/Z18Z
         xQAg==
X-Forwarded-Encrypted: i=1; AJvYcCWdUeS3MNXuXw283LqEfTBdI1DrSvsLIebNrNVCLgn6SJ/MXef/y/hXhSbs6hv2RvCMNAUHxIOmp00J5Bk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwXlty0kBaQJ0UnA9NL4A04cgXWa1CtuSYNojxZ2mOQiG5NxG2z
	uXz9hnFzVDjBas8Fxp+ci8sEhl/Wc8RhYKmrp4W/NcOZkOhnCN4TzR6R2mMkyKlaAUA/N2+BGmN
	oWNAjavgCtjw3J3TA8Q4QgQ==
X-Google-Smtp-Source: AGHT+IGKFXSWCJqlNS2qFXMxzoG4Xb3NRDnkhhqp5lhhsQRnzkIpBXQqaaHYQ40OzOD6Dmlpa/x+DpWxNJUXLfVq7w==
X-Received: from pjvb11.prod.google.com ([2002:a17:90a:d88b:b0:2ea:7d73:294e])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1d0c:b0:2ee:ed07:d6d2 with SMTP id 98e67ed59e1d1-2ef6ab2888cmr21797074a91.37.1733798496370;
 Mon, 09 Dec 2024 18:41:36 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:09 -0800
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
Message-ID: <20241210024119.2488608-8-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 07/17] mm: loongarch: Introduce arch_mmap_hint()
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

Introduce loongarch arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/loongarch/include/asm/pgtable.h |  1 +
 arch/loongarch/mm/mmap.c             | 40 ++++++++++++++++++----------
 2 files changed, 27 insertions(+), 14 deletions(-)

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
index 914e82ff3f65..b7db43fabca1 100644
--- a/arch/loongarch/mm/mmap.c
+++ b/arch/loongarch/mm/mmap.c
@@ -17,12 +17,32 @@
 
 enum mmap_allocation_direction {UP, DOWN};
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	int do_color_align = 0;
+
+	if (!addr)
+		return 0;
+
+	if (filp || (flags & MAP_SHARED))
+		do_color_align = 1;
+
+	if (do_color_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+
 static unsigned long arch_get_unmapped_area_common(struct file *filp,
 	unsigned long addr0, unsigned long len, unsigned long pgoff,
 	unsigned long flags, enum mmap_allocation_direction dir)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	unsigned long addr = addr0;
 	int do_color_align;
 	struct vm_unmapped_area_info info = {};
@@ -45,23 +65,15 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		return addr;
 	}
 
+	/* requesting a specific address */
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
 	do_color_align = 0;
 	if (filp || (flags & MAP_SHARED))
 		do_color_align = 1;
 
-	/* requesting a specific address */
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
-
 	info.length = len;
 	info.align_mask = do_color_align ? (PAGE_MASK & SHM_ALIGN_MASK) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
-- 
2.47.0.338.g60cca15819-goog


