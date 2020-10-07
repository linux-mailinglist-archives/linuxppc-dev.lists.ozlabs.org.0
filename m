Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7742859B1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 09:41:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5mVz0RsPzDqJ8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 18:41:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=jannh@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ruoXB4q0; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5mSr1s7tzDqMb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 18:39:47 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id n15so967140wrq.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Oct 2020 00:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RYwEGS7gOxFlwuQRTr7QM+pg66rzdyTCfIUfekhpUBo=;
 b=ruoXB4q0W4dOYr0HkGK3Qg2MUNaxXi9Tfm5XoN+wJuao1gaRUueT0KcnNUVdAc6i7R
 ad7CYmcCeYVK++bMrK+3TtUU+XRMTKATzz4A0NJN3o7RmWQUbCtCU/k7VX8UmjxZCcLx
 90FV/U6rqDEoHznYihJVKIjTp59Cgm6dxLKO0y4kB8P9aqgDO09c+9jYYxfNjQeQwLeT
 0iJgvI4hvfuLW4QF6oH+DgdLqWEER3NlD8sgZ8ZestVegmAZlB3/yPVxiKvaoeSu1NTg
 gTBMILXz/Q4NZ/g/+Fxx+UK5QvpWKKFVUDzwBk6TTlfiUYgu85IgWeCGYmrwbyzcKAGT
 TBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RYwEGS7gOxFlwuQRTr7QM+pg66rzdyTCfIUfekhpUBo=;
 b=RmF5rlA0a/WfYS/5Uccqw8UXBlc6iJIzHwmAspUXLSx+g/nGCfVcXPJ3TNR9Hn6gPq
 GSXFpscXbbWunL+/QWBH7XnOnRMXS2bgzLj7JDPKAXRO0NMaq4E9XVsiM/ErM/h9Uj34
 EcI57BIs5Iteel9rCtKTLbwl4h2xHOwl4PG10PjgB5NH1YhTe1lKD9oszB22ImCh7f0w
 Zm2PDiIsFyNDX6KW78qAlkyesK0i/6kCJcbrVY/bmcrC3XfI3dqMof5zUMvKpmPNW64c
 fURTtocqfAKLffekDzU3vk5aTCiRdy97LXV/kbEw5xLIF+Ew46hQIT/Iy14MHRwxd+SI
 AcLA==
X-Gm-Message-State: AOAM531As+i8fYEeYrPYUQMArUNaHp1tFEkTPP7tAaneheRgQuFErXuP
 HP3FX+z7+ziPQW01KLhTR5cXNg==
X-Google-Smtp-Source: ABdhPJx+7ke9fEecAqH/fAr9lPYggeTnVTs2kZ4YZOSai+UmsGlcT1A4NpyX9005g+lQnoEoGseTpw==
X-Received: by 2002:adf:e88a:: with SMTP id d10mr2072440wrm.247.1602056382670; 
 Wed, 07 Oct 2020 00:39:42 -0700 (PDT)
Received: from localhost ([2a02:168:96c5:1:55ed:514f:6ad7:5bcc])
 by smtp.gmail.com with ESMTPSA id r3sm1639024wrm.51.2020.10.07.00.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 00:39:41 -0700 (PDT)
From: Jann Horn <jannh@google.com>
To: "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: [PATCH 1/2] mm/mprotect: Call arch_validate_prot under mmap_lock and
 with length
Date: Wed,  7 Oct 2020 09:39:31 +0200
Message-Id: <20201007073932.865218-1-jannh@google.com>
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Khalid Aziz <khalid.aziz@oracle.com>, Paul Mackerras <paulus@samba.org>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

arch_validate_prot() is a hook that can validate whether a given set of
protection flags is valid in an mprotect() operation. It is given the set
of protection flags and the address being modified.

However, the address being modified can currently not actually be used in
a meaningful way because:

1. Only the address is given, but not the length, and the operation can
   span multiple VMAs. Therefore, the callee can't actually tell which
   virtual address range, or which VMAs, are being targeted.
2. The mmap_lock is not held, meaning that if the callee were to check
   the VMA at @addr, that VMA would be unrelated to the one the
   operation is performed on.

Currently, custom arch_validate_prot() handlers are defined by
arm64, powerpc and sparc.
arm64 and powerpc don't care about the address range, they just check the
flags against CPU support masks.
sparc's arch_validate_prot() attempts to look at the VMA, but doesn't take
the mmap_lock.

Change the function signature to also take a length, and move the
arch_validate_prot() call in mm/mprotect.c down into the locked region.

Cc: stable@vger.kernel.org
Fixes: 9035cf9a97e4 ("mm: Add address parameter to arch_validate_prot()")
Suggested-by: Khalid Aziz <khalid.aziz@oracle.com>
Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Jann Horn <jannh@google.com>
---
 arch/arm64/include/asm/mman.h   | 4 ++--
 arch/powerpc/include/asm/mman.h | 3 ++-
 arch/powerpc/kernel/syscalls.c  | 2 +-
 arch/sparc/include/asm/mman.h   | 6 ++++--
 include/linux/mman.h            | 3 ++-
 mm/mprotect.c                   | 6 ++++--
 6 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/mman.h b/arch/arm64/include/asm/mman.h
index 081ec8de9ea6..0876a87986dc 100644
--- a/arch/arm64/include/asm/mman.h
+++ b/arch/arm64/include/asm/mman.h
@@ -23,7 +23,7 @@ static inline pgprot_t arch_vm_get_page_prot(unsigned long vm_flags)
 #define arch_vm_get_page_prot(vm_flags) arch_vm_get_page_prot(vm_flags)
 
 static inline bool arch_validate_prot(unsigned long prot,
-	unsigned long addr __always_unused)
+	unsigned long addr __always_unused, unsigned long len __always_unused)
 {
 	unsigned long supported = PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM;
 
@@ -32,6 +32,6 @@ static inline bool arch_validate_prot(unsigned long prot,
 
 	return (prot & ~supported) == 0;
 }
-#define arch_validate_prot(prot, addr) arch_validate_prot(prot, addr)
+#define arch_validate_prot(prot, addr, len) arch_validate_prot(prot, addr, len)
 
 #endif /* ! __ASM_MMAN_H__ */
diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm/mman.h
index 7cb6d18f5cd6..65dd9b594985 100644
--- a/arch/powerpc/include/asm/mman.h
+++ b/arch/powerpc/include/asm/mman.h
@@ -36,7 +36,8 @@ static inline pgprot_t arch_vm_get_page_prot(unsigned long vm_flags)
 }
 #define arch_vm_get_page_prot(vm_flags) arch_vm_get_page_prot(vm_flags)
 
-static inline bool arch_validate_prot(unsigned long prot, unsigned long addr)
+static inline bool arch_validate_prot(unsigned long prot, unsigned long addr,
+				      unsigned long len)
 {
 	if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_SAO))
 		return false;
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index 078608ec2e92..b1fabb97d138 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -43,7 +43,7 @@ static inline long do_mmap2(unsigned long addr, size_t len,
 {
 	long ret = -EINVAL;
 
-	if (!arch_validate_prot(prot, addr))
+	if (!arch_validate_prot(prot, addr, len))
 		goto out;
 
 	if (shift) {
diff --git a/arch/sparc/include/asm/mman.h b/arch/sparc/include/asm/mman.h
index f94532f25db1..e85222c76585 100644
--- a/arch/sparc/include/asm/mman.h
+++ b/arch/sparc/include/asm/mman.h
@@ -52,9 +52,11 @@ static inline pgprot_t sparc_vm_get_page_prot(unsigned long vm_flags)
 	return (vm_flags & VM_SPARC_ADI) ? __pgprot(_PAGE_MCD_4V) : __pgprot(0);
 }
 
-#define arch_validate_prot(prot, addr) sparc_validate_prot(prot, addr)
-static inline int sparc_validate_prot(unsigned long prot, unsigned long addr)
+#define arch_validate_prot(prot, addr, len) sparc_validate_prot(prot, addr, len)
+static inline int sparc_validate_prot(unsigned long prot, unsigned long addr,
+				      unsigned long len)
 {
+	mmap_assert_write_locked(current->mm);
 	if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_ADI))
 		return 0;
 	if (prot & PROT_ADI) {
diff --git a/include/linux/mman.h b/include/linux/mman.h
index 6f34c33075f9..5b4d554d3189 100644
--- a/include/linux/mman.h
+++ b/include/linux/mman.h
@@ -96,7 +96,8 @@ static inline void vm_unacct_memory(long pages)
  *
  * Returns true if the prot flags are valid
  */
-static inline bool arch_validate_prot(unsigned long prot, unsigned long addr)
+static inline bool arch_validate_prot(unsigned long prot, unsigned long addr,
+				      unsigned long len)
 {
 	return (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM)) == 0;
 }
diff --git a/mm/mprotect.c b/mm/mprotect.c
index ce8b8a5eacbb..e2d6b51acbf8 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -533,14 +533,16 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
 	end = start + len;
 	if (end <= start)
 		return -ENOMEM;
-	if (!arch_validate_prot(prot, start))
-		return -EINVAL;
 
 	reqprot = prot;
 
 	if (mmap_write_lock_killable(current->mm))
 		return -EINTR;
 
+	error = -EINVAL;
+	if (!arch_validate_prot(prot, start, len))
+		goto out;
+
 	/*
 	 * If userspace did not allocate the pkey, do not let
 	 * them use it here.

base-commit: c85fb28b6f999db9928b841f63f1beeb3074eeca
-- 
2.28.0.806.g8561365e88-goog

