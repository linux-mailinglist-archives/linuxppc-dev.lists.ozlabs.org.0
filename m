Return-Path: <linuxppc-dev+bounces-644-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF7B96207C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:16:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtwhG3pqLz2yhM;
	Wed, 28 Aug 2024 17:16:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724824179;
	cv=none; b=UtT4DKz4ygweQOnJPpz6KDzTgC83TertPUE6rf9hfmlAPykRBheflFVvRfcEVWUdtJLo860Q/PscFyMht2XMOnE2bA6Yi7UkerGjZ46Ph9Je+SDG96V8Awdni3+TEVaY1mQhsr9GDe1ydx2O24EuD1E+Fr18MuORVdY766kux1b5JRCB8+S2bh60PgE6gqcoS57RvPK8otx5FDtqcG8pq+b+wBpLM/Ty2VroAwCmHpzCyp4wrQm4df8qRxKfdx2llT/M0KQpP3W7JelL9ASXcgi8GYpTxbWzoTK/9fgfIpjdRKdU4zSXv+fCqbN9YLYzrJBM92koiPyLc+qA6tfbXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724824179; c=relaxed/relaxed;
	bh=TGbwsGUaSgh3SYkS7pHaMfmAZns1s9a6v7xPbD2XVAI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=Alx3EKs+I2X3aBOUWtP47zzCSrVxhacKKHEgaIgpybvXkXVzWhWQ2Unv7xyMlGHkxqdVTunCaOIPjaWUZGjw0JxBgjnDG6cY2KlE1NK1aiL0Jyhd+sdcFfuOFDEFeSiw3LXIADTN1VoidwDalfngUnSSrPBRGWo04sJsuT0HkarFdtYqHvAtJcKw8GhEhOjpWi/VIgK7UKkgSWBpBNmCHhj52ve6O1tKtRnO0plm6Z1ggUFeE4P+WmRvJMtpCdIVcEo+yfsR0YELUtI36X0Rh4XaixKyBwyer/B0j/PlqJPJVdaOK1nrQhliVecooAgq0RJEE2OiL2gpvOEoL+jNDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=AdtJeYP/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=AdtJeYP/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wttll1wQkz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:49:39 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-201fbd0d7c2so52361185ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824177; x=1725428977; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGbwsGUaSgh3SYkS7pHaMfmAZns1s9a6v7xPbD2XVAI=;
        b=AdtJeYP/YxH261zBuONAG+izWdza4W9O1gft4TqV569VeN552GoPluOu/QxO9Cl88o
         og11hL8AzQA84+S8OoRhMDJGO4ZP6TZv04tj1sO+oAxD8npl3siFhXnZIAR6vyY1iQBA
         jMfrAg1Uz0D/PO6UPk6Y10h6iW4kxQm/JXoilqfAw8JAYy2Z+q6ak6v1dbiecscg2my+
         mCzQdC0aAOEKo0InHj7RAZhPeZ/OsiuJRIaijxVYpYZrzfHuGsGjYBbBr6ZWV4eceFSR
         nioZ+Mpu8SAN/P4A1ch9nYvGteE4uMSVBhRGfjCwtxCkFiSla12D//UEzWYEiAsGR0Bl
         0sEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824177; x=1725428977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGbwsGUaSgh3SYkS7pHaMfmAZns1s9a6v7xPbD2XVAI=;
        b=RYy6XSnCpcIaAnOp+0uMLgO0M3xh8saJB4aArguacYOWWCKyIpEOwT/S8XeluI2d2m
         kGDVuL42mgPU3liohcXR5cFQoWxjvcRncZ+dZg2umNVa7s1TtHMLaEO+cZIpstzhAH+u
         8+pKMvnL0SLX+V/AbuyNOuhtQ59u9vrFDwwfYqh53Q83SjIuU0qB3lj/4oQABPiLOBiG
         m9MfGnl3PXuFO5rzUUsnO9b5TZ3CSGgm+nEUTXyKjl+gSk9EK8WveoVLv7eIRRNdQBWv
         hxN3nEYZue37GUwP+eltdAbE3/DIBAskvZzHMDlaqpcCODLg7swnuGTKf5fBvT0d0skH
         GewA==
X-Forwarded-Encrypted: i=1; AJvYcCUFj2iFgLHPWXnXfebCy5dcDJDAq96eREJMKrMMfHtbwZ0Ogt9UJbQv/+ukF45uZRJqwyDeeES4OZB0TG0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz3Ia93xLCAbij3ZEPStjr3UKfUcCZY3TqCrzVebsRZ1LJWOrQP
	sSJlFVWk9DScCvGzBI/YYl7TzuRXh0uXKLu7R69YbN+yg8hplE1hJyw1G2iN6PE=
X-Google-Smtp-Source: AGHT+IETeUynSugovs7+A+AN20czg30Ola2aofBrInbwTCbD60I4EWjQ5oF17Pp044tfVMlW9N70GQ==
X-Received: by 2002:a17:902:f946:b0:1fb:6ea1:6a with SMTP id d9443c01a7336-204f9bf6b4fmr8673095ad.42.1724824176426;
        Tue, 27 Aug 2024 22:49:36 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:35 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:09 -0700
Subject: [PATCH 03/16] mm: Add flag and len param to arch_get_mmap_base()
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
Message-Id: <20240827-patches-below_hint_mmap-v1-3-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3681; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=deEFSUhsRdIX0bdzxWoQYKSiKJBAsZhcTOjbVXT5+ls=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XbEKPQVKN+QOfCnd/vQAx7Mm0aicnIfvMk/aT/p2R
 eLJrUMHOkpZGMQ4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZiI/GeGP5ySTrLnNmwQmXLz
 8w+bnE++e2VFjGTvdAadNPbzvHntw1tGhs53DbPX/utm9fCf+JHzi+Xvmwkm0w5eV/OMyrFcaSf
 ykBcA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

The flag and len param is required in arch_get_mmap_base() to implement
MAP_BELOW_HINT.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/arm64/include/asm/processor.h      | 2 +-
 arch/powerpc/include/asm/task_size_64.h | 2 +-
 arch/riscv/include/asm/processor.h      | 2 +-
 fs/hugetlbfs/inode.c                    | 2 +-
 include/linux/sched/mm.h                | 2 +-
 mm/mmap.c                               | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index f77371232d8c..a67ca119bb91 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -95,7 +95,7 @@
 #define arch_get_mmap_end(addr, len, flags) \
 		(((addr) > DEFAULT_MAP_WINDOW) ? TASK_SIZE : DEFAULT_MAP_WINDOW)
 
-#define arch_get_mmap_base(addr, base) ((addr > DEFAULT_MAP_WINDOW) ? \
+#define arch_get_mmap_base(addr, len, base, flags) ((addr > DEFAULT_MAP_WINDOW) ? \
 					base + TASK_SIZE - DEFAULT_MAP_WINDOW :\
 					base)
 #endif /* CONFIG_ARM64_FORCE_52BIT */
diff --git a/arch/powerpc/include/asm/task_size_64.h b/arch/powerpc/include/asm/task_size_64.h
index 5a709951c901..239b363841aa 100644
--- a/arch/powerpc/include/asm/task_size_64.h
+++ b/arch/powerpc/include/asm/task_size_64.h
@@ -72,7 +72,7 @@
 #define STACK_TOP_MAX TASK_SIZE_USER64
 #define STACK_TOP (is_32bit_task() ? STACK_TOP_USER32 : STACK_TOP_USER64)
 
-#define arch_get_mmap_base(addr, base) \
+#define arch_get_mmap_base(addr, len, base, flags) \
 	(((addr) > DEFAULT_MAP_WINDOW) ? (base) + TASK_SIZE - DEFAULT_MAP_WINDOW : (base))
 
 #define arch_get_mmap_end(addr, len, flags) \
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 1015f2a49917..7ff559bf46f2 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -19,7 +19,7 @@
 	STACK_TOP_MAX;						\
 })
 
-#define arch_get_mmap_base(addr, base, flags)			\
+#define arch_get_mmap_base(addr, len, base, flags)		\
 ({								\
 	base;							\
 })
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 9f6cff356796..05a52f85dba9 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -195,7 +195,7 @@ hugetlb_get_unmapped_area_topdown(struct file *file, unsigned long addr,
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
-	info.high_limit = arch_get_mmap_base(addr, current->mm->mmap_base);
+	info.high_limit = arch_get_mmap_base(addr, len, current->mm->mmap_base, flags);
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
 	addr = vm_unmapped_area(&info);
 
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 91546493c43d..265b43855d0b 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -174,7 +174,7 @@ static inline void mm_update_next_owner(struct mm_struct *mm)
 #endif
 
 #ifndef arch_get_mmap_base
-#define arch_get_mmap_base(addr, base) (base)
+#define arch_get_mmap_base(addr, len, base, flags) (base)
 #endif
 
 extern void arch_pick_mmap_layout(struct mm_struct *mm,
diff --git a/mm/mmap.c b/mm/mmap.c
index d0dfc85b209b..27a7f2be3f68 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1861,7 +1861,7 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
-	info.high_limit = arch_get_mmap_base(addr, mm->mmap_base);
+	info.high_limit = arch_get_mmap_base(addr, len, mm->mmap_base, flags);
 	addr = vm_unmapped_area(&info);
 
 	/*

-- 
2.45.0


