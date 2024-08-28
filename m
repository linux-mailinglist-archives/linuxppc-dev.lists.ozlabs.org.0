Return-Path: <linuxppc-dev+bounces-649-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C01962087
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:17:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtwj24z3hz2ynL;
	Wed, 28 Aug 2024 17:17:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724824195;
	cv=none; b=M2td51zCp7p371mYv1dn0YhJIhZo8gSevpLCDtuPiJKg4pXR7g9OprL4avEQ4IEYhHeilUw/mimF5bA5JeIIxTgMpupGbBGx9Ct12mhjhqWQqDxIBD1c4TrDDGdiXOSIm/Rf+5VtalsMJVIieUblS5P58/QwdpKeshikGuBl6qgZIKKLFlqERg/ONc/xHjOJ/aGnbFyb0ucdO3jWqoPrpx+NXAgCZ4VLjfrN8/P8EIs8o2kGvPJ8asTCuvZlyMSFwDpbkbOect6F0ydiDnVTXcEyXZArbskszXUj0XAd0UBceejyI3rBkpxvtDZMPYuOdglpfV6Gx/jIUNSjwNMnzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724824195; c=relaxed/relaxed;
	bh=WPJ0dF9cF6J1lv0FlFvR4vKxUsSQiAia4h2dvI+DMjw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=WwDFAxbJ9N9oNqcBO1Q4cQajSoqAbKPezhBk+cufLueLDVQjZ7RcdU4fiXMtkHsfDkMes/uH8Vsnsk0+Xqp8tD9CjGEaPyrriV2yvFINFa94Uu/utjJzJ3tGs8i7TOIt7vPpIjQ7+o/AGxa5+3NzNC7NC4raBLHa+6P6OeYs/jIcCDBMs+Iqpf5dZ9GrlK16Cu8wIFEcx6BpXZYtDmmSRAm3V2xwhAMorHnshqmcAq4pukc58OKDKdsoOQo+vkKsFi0pDAwFBIUdsViiks+ajVPtYtQUjeWv+hZVOZ0CING5RHu3x1DqsnL+e8AGXuKEVym3XnQhf7ToYOd4dGDGig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Ru4rCAui; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Ru4rCAui;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wttm34XGfz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:49:55 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-201fbd0d7c2so52362895ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824194; x=1725428994; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPJ0dF9cF6J1lv0FlFvR4vKxUsSQiAia4h2dvI+DMjw=;
        b=Ru4rCAuiKL9cQkK8lca/TcKm1dwKCbwpNkgkW30l0GM7T9xPMFV9r0EpKUbcI5MZZ3
         yBkPihu3YQY2w3HsoHaDYStrM3Dl3uKYlmEknyCGSIZAPvXQv+wKT1YQnmMyTZmCo+Cx
         oQp/+3ttmnvN86u/Fiz16jBIS5zLyICdR9Jzlv0p7wY5U6CVN4zPC10OwtyZmfHOF6Kl
         ZrNvspF46pqpYjqHK4CJOerWFRwPx/CBCB6CgLGCQpRh/N44KzUxk7GkzDGBHOWOy3YB
         okjAsonMGLnWaA7e5jJ02mPV3SpHUxq34bjqp9jdvaOY+tdI9LMyN+ST8pgFX2R3OYZa
         +wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824194; x=1725428994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPJ0dF9cF6J1lv0FlFvR4vKxUsSQiAia4h2dvI+DMjw=;
        b=iH0Q29nLAOqMPihBi5er9KKq6uTHqmbVRpmQpCva0J18laMVSbw6ej8aHKpHlD+JN4
         eMXUImu9qKJturtxN/+ytERofKNGTBEnlZU+H2EcjTgRAwVG665q1YstK3PB4pebdcvZ
         D9fbVHkOOHwrPBbFR3q4/epyjbqO+t7GmsEnxh5oPMLIdZ0eMkeFViiPoHHV5HE8HonP
         UcW2gAZi3SlrW2pfbzPEpOFidOrpbGDrPM4poEdg3u8YbRRoJFtiGzdGuBF9rLeDeB54
         1fQye6ITFW9JxCMtIEoFdoLLdsHyaeHcFPLlvwL7r1OybryeXT1eq/L/EzHANGbBQ+MV
         IQSw==
X-Forwarded-Encrypted: i=1; AJvYcCUu2f88ysPj4r79oTDlLRfblvARYa6HkjHgCblY0mYDyt2kh+D9qI4zSRwJXbn7CBTOV57M3ysQ2TtQm4Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyN6N3pcegnVAafSE6/lP5EioopHMlvMKofPTzV+a1VlSuIIs8O
	YeUK8AeM7RXi84+2wP4jWIYohuuox1Crv5GQaKW6iwxUmr+4K3QMarb/cmsuGeM=
X-Google-Smtp-Source: AGHT+IGIwf3MFbsmI5L/nn36QcLF0tw2dizRywserImseYHkgoEBii3QkvkJxB3CCAhauX+R+NVkZg==
X-Received: by 2002:a17:903:41cb:b0:1fb:90e1:c8c0 with SMTP id d9443c01a7336-204f9c50d18mr13883795ad.63.1724824193604;
        Tue, 27 Aug 2024 22:49:53 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:52 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:14 -0700
Subject: [PATCH 08/16] x86: mm: Support MAP_BELOW_HINT
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-patches-below_hint_mmap-v1-8-46ff2eb9022d@rivosinc.com>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
In-Reply-To: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Shuah Khan <shuah@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2933; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=/49vITxLNj+RJRh4dWyqxf17jS8h791m43d/wmsbi4g=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XfH5mu/c9Rrzlz8/vq1gj25AnkDItFvB5j/EjQ7d2
 dgpWufVUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwERiehj+Oxm+8In6am8suLjK
 Qbj6ukzK61nfEx9q7X3ecc3HVutSBcP/QCmOFDVPG+uvAsGmtk+sN15sO6WrIvn+0Hvj8ITPYtt
 ZAA==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add support for MAP_BELOW_HINT to mmap by restricting high_limit to
addr when the flag is enabled.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/x86/kernel/sys_x86_64.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/sys_x86_64.c b/arch/x86/kernel/sys_x86_64.c
index 01d7cd85ef97..fa16b38f3702 100644
--- a/arch/x86/kernel/sys_x86_64.c
+++ b/arch/x86/kernel/sys_x86_64.c
@@ -86,7 +86,7 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len,
 	return ksys_mmap_pgoff(addr, len, prot, flags, fd, off >> PAGE_SHIFT);
 }
 
-static void find_start_end(unsigned long addr, unsigned long flags,
+static void find_start_end(unsigned long addr, unsigned long len, unsigned long flags,
 		unsigned long *begin, unsigned long *end)
 {
 	if (!in_32bit_syscall() && (flags & MAP_32BIT)) {
@@ -106,10 +106,14 @@ static void find_start_end(unsigned long addr, unsigned long flags,
 	}
 
 	*begin	= get_mmap_base(1);
+
 	if (in_32bit_syscall())
 		*end = task_size_32bit();
 	else
 		*end = task_size_64bit(addr > DEFAULT_MAP_WINDOW);
+
+	if (flags & MAP_BELOW_HINT)
+		*end = MIN(*end, addr + len);
 }
 
 static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
@@ -132,7 +136,7 @@ arch_get_unmapped_area_vmflags(struct file *filp, unsigned long addr, unsigned l
 	if (flags & MAP_FIXED)
 		return addr;
 
-	find_start_end(addr, flags, &begin, &end);
+	find_start_end(addr, len, flags, &begin, &end);
 
 	if (len > end)
 		return -ENOMEM;
@@ -166,6 +170,7 @@ arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr0,
 	struct mm_struct *mm = current->mm;
 	unsigned long addr = addr0;
 	struct vm_unmapped_area_info info = {};
+	unsigned long task_size, mmap_base;
 
 	/* requested length too big for entire address space */
 	if (len > TASK_SIZE)
@@ -198,7 +203,8 @@ arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr0,
 	else
 		info.low_limit = PAGE_SIZE;
 
-	info.high_limit = get_mmap_base(0);
+	mmap_base = get_mmap_base(0);
+	info.high_limit = mmap_base;
 	info.start_gap = stack_guard_placement(vm_flags);
 
 	/*
@@ -210,6 +216,19 @@ arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr0,
 	 */
 	if (addr > DEFAULT_MAP_WINDOW && !in_32bit_syscall())
 		info.high_limit += TASK_SIZE_MAX - DEFAULT_MAP_WINDOW;
+	if (flags & MAP_BELOW_HINT) {
+#ifdef CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES
+		task_size = task_size_32bit();
+#else
+		task_size = task_size_64bit(0);
+#endif
+		/*
+		 * mmap_base is defined by PAGE_ALIGN(task_size - gap - rnd) so
+		 * subtract out the task_size to isolate the gap + rnd.
+		 */
+		info.high_limit = MIN(info.high_limit,
+				      (addr + len) - (task_size - mmap_base));
+	}
 
 	info.align_offset = pgoff << PAGE_SHIFT;
 	if (filp) {

-- 
2.45.0


