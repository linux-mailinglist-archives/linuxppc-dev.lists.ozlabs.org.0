Return-Path: <linuxppc-dev+bounces-996-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C57CF96C4B9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 19:04:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzTNd537cz2yZ6;
	Thu,  5 Sep 2024 03:04:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725469441;
	cv=none; b=XeHr8I4Cnuto5uqi69Sso2STv4S2R9eanh6Yr/cKKPxmxhW0AtCEgp0eY5QiQbbNwh7W7LKUUXLGtxRSWgxe7rg54Z7yxT9mqqQd/vwZwl0X5BBYWXF7sQ9t+DPooUwRAIbIFZnalhw6s/eNQtEAjebUO5XuHFIKfKaWXR/F/tzkP+0MzwxBHPsV3WF1d9h3gvksVT4YhUyYEpnJ5vB0oc8VrqoJOk53U7EeA875dh0UO1a1idrgH1tuwx1y2lxL04dbAyGXvqeMfjnGspLH02iD65QDuWcJAICFwhE+kOliMOQ8yKvCBMIYQR7u/hzCtVbkiRRVZtDAHy44qaACJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725469441; c=relaxed/relaxed;
	bh=Ll+URFzBATXo5Ra+5OUB5Z4N3uVyKgZzkCQfYI6cylQ=;
	h=DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc; b=X0eF11bWCPMwAUzFazle0ZuuYc9io0DDBU2V3KqkM1Xbkp7dtpKqmXpx5u1HxQNp9pHfiKt8usPFRpggflt78cdwmPFAByY6dqNocNQ5DfCIwZzju13ifO4NvpC2XWcSiTNR4owcr9X/tmTrIJzmNF9PCsgd4HGx3c1ubgreyRbBPNo/At1e6jOSYqBm4LhyJJ3eOLlgacvWKhtSVlhVB8SDG2y4tWujKkyKeGlOlFp+SyvoHqLU+8jyjmYZaOKvLWFagwY6JIc+CIpPTLV/n9wi5tM0PsgmEbx29THc1W05sepl4w0VGjRVSNxY8OKNvo/X+bOJqYGgShV4IVyJEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m7eodkhq; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m7eodkhq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzTNd1nyKz2xY6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 03:04:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B9AAFA44617;
	Wed,  4 Sep 2024 17:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC5DC4CECA;
	Wed,  4 Sep 2024 17:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725469438;
	bh=iMGpBKLUd3bvO8uaih/7IniDLWm5CRUl+/lD6PfEr9k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m7eodkhq0RErBfervK5Bsmxdg8am7kwijD8ykXbJt8mPkTG9IyB5JRY7WVj18ih1k
	 x6sviigYtUG9BJn7PjimSCYTiJax14dADD7HnpfSm2PAigva7JirSV6S46K6LODPFA
	 KPYwdLsRlVMqKSKMsnPSKatBddYbWpgwAzFq60M4p83BVMbylSayrUNMmj2G9HDevP
	 466po23vnLB/ToM0xSzsiGe+HFmrUtErW7o3cEslbIT6TU3DhI8UDga3dU2IPPdJgp
	 VEudVDz99BKPSf2D0quAP/QZEMNwuVoq5fpiz5tW1oSoZDamdlW82UwAL7TGaXCbgo
	 ZTrsBG1oCizDA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 04 Sep 2024 17:57:59 +0100
Subject: [PATCH v2 1/3] mm: Make arch_get_unmapped_area() take vm_flags by
 default
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
Message-Id: <20240904-mm-generic-shadow-stack-guard-v2-1-a46b8b6dc0ed@kernel.org>
References: <20240904-mm-generic-shadow-stack-guard-v2-0-a46b8b6dc0ed@kernel.org>
In-Reply-To: <20240904-mm-generic-shadow-stack-guard-v2-0-a46b8b6dc0ed@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
 "Liam R. Howlett" <Liam.Howlett@Oracle.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=19799; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iMGpBKLUd3bvO8uaih/7IniDLWm5CRUl+/lD6PfEr9k=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm2JLow6fydDORW8BLsjyWPaeHLJli7+BVdNkzgOZq
 Z3JAMSiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtiS6AAKCRAk1otyXVSH0AY3B/
 4qFpEVm4FBwn/XqLJ5l60W8/mejomvic6kPHt4uTKdPTpx4I1N7T5YHN+J7w8ZXN3E8/qFpLUyR8rN
 Ff/3OgHNcpYONXtLKceT4pSFZod0dq7DmuKBx1ST0uk+jpplwBcfJ0v7TY8TOjcLoEnwVQYmcUH4zt
 dSiK66q0W6W0cHOXTxcM7SKXCewSuJqr26/jCatFCPJ9KkgcnbOsW/RfsqQua0j7Jgu4YfmaUPIQZ4
 oISt6gLd1jWjflRY9CEzE0eJ1zbqwBXxajtrITfd8FRwStGQzQdrlj1em+Cm5XfMGo0bmvc2FttROI
 d7bjiMYWrJ+nP8RsahVq67MRp3QWpe
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

When we introduced arch_get_unmapped_area_vmflags() in 961148704acd
("mm: introduce arch_get_unmapped_area_vmflags()") we did so as part of
properly supporting guard pages for shadow stacks on x86_64, which uses
a custom arch_get_unmapped_area(). Equivalent features are also present
on both arm64 and RISC-V, both of which use the generic implementation
of arch_get_unmapped_area() and will require equivalent modification
there. Rather than continue to deal with having two versions of the
functions let's bite the bullet and have all implementations of
arch_get_unmapped_area() take vm_flags as a parameter.

The new parameter is currently ignored by all implementations other than
x86. The only caller that doesn't have a vm_flags available is
mm_get_unmapped_area(), as for the x86 implementation and the wrapper used
on other architectures this is modified to supply no flags.

No functional changes.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Acked-by: Helge Deller <deller@gmx.de>  # parisc
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/alpha/kernel/osf_sys.c       |  2 +-
 arch/arc/mm/mmap.c                |  3 ++-
 arch/arm/mm/mmap.c                |  7 ++++---
 arch/csky/abiv1/mmap.c            |  3 ++-
 arch/loongarch/mm/mmap.c          |  5 +++--
 arch/mips/mm/mmap.c               |  5 +++--
 arch/parisc/kernel/sys_parisc.c   |  5 +++--
 arch/parisc/mm/hugetlbpage.c      |  2 +-
 arch/powerpc/mm/book3s64/slice.c  |  6 ++++--
 arch/s390/mm/mmap.c               |  4 ++--
 arch/sh/mm/mmap.c                 |  5 +++--
 arch/sparc/kernel/sys_sparc_32.c  |  2 +-
 arch/sparc/kernel/sys_sparc_64.c  |  4 ++--
 arch/x86/include/asm/pgtable_64.h |  1 -
 arch/x86/kernel/sys_x86_64.c      | 21 +++------------------
 arch/xtensa/kernel/syscall.c      |  3 ++-
 include/linux/sched/mm.h          | 23 ++++++++---------------
 mm/mmap.c                         | 31 +++++++------------------------
 18 files changed, 51 insertions(+), 81 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index e5f881bc8288..8886ab539273 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1229,7 +1229,7 @@ arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
 unsigned long
 arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		       unsigned long len, unsigned long pgoff,
-		       unsigned long flags)
+		       unsigned long flags, vm_flags_t vm_flags)
 {
 	unsigned long limit;
 
diff --git a/arch/arc/mm/mmap.c b/arch/arc/mm/mmap.c
index 69a915297155..2185afe8d59f 100644
--- a/arch/arc/mm/mmap.c
+++ b/arch/arc/mm/mmap.c
@@ -23,7 +23,8 @@
  */
 unsigned long
 arch_get_unmapped_area(struct file *filp, unsigned long addr,
-		unsigned long len, unsigned long pgoff, unsigned long flags)
+		unsigned long len, unsigned long pgoff,
+		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
index d65d0e6ed10a..3dbb383c26d5 100644
--- a/arch/arm/mm/mmap.c
+++ b/arch/arm/mm/mmap.c
@@ -28,7 +28,8 @@
  */
 unsigned long
 arch_get_unmapped_area(struct file *filp, unsigned long addr,
-		unsigned long len, unsigned long pgoff, unsigned long flags)
+		unsigned long len, unsigned long pgoff,
+		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
@@ -78,8 +79,8 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 
 unsigned long
 arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
-			const unsigned long len, const unsigned long pgoff,
-			const unsigned long flags)
+		        const unsigned long len, const unsigned long pgoff,
+		        const unsigned long flags, vm_flags_t vm_flags)
 {
 	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
diff --git a/arch/csky/abiv1/mmap.c b/arch/csky/abiv1/mmap.c
index 7f826331d409..1047865e82a9 100644
--- a/arch/csky/abiv1/mmap.c
+++ b/arch/csky/abiv1/mmap.c
@@ -23,7 +23,8 @@
  */
 unsigned long
 arch_get_unmapped_area(struct file *filp, unsigned long addr,
-		unsigned long len, unsigned long pgoff, unsigned long flags)
+		unsigned long len, unsigned long pgoff,
+		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
diff --git a/arch/loongarch/mm/mmap.c b/arch/loongarch/mm/mmap.c
index 889030985135..914e82ff3f65 100644
--- a/arch/loongarch/mm/mmap.c
+++ b/arch/loongarch/mm/mmap.c
@@ -89,7 +89,8 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 }
 
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr0,
-	unsigned long len, unsigned long pgoff, unsigned long flags)
+	unsigned long len, unsigned long pgoff, unsigned long flags,
+	vm_flags_t vm_flags)
 {
 	return arch_get_unmapped_area_common(filp,
 			addr0, len, pgoff, flags, UP);
@@ -101,7 +102,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr0,
  */
 unsigned long arch_get_unmapped_area_topdown(struct file *filp,
 	unsigned long addr0, unsigned long len, unsigned long pgoff,
-	unsigned long flags)
+	unsigned long flags, vm_flags_t vm_flags)
 {
 	return arch_get_unmapped_area_common(filp,
 			addr0, len, pgoff, flags, DOWN);
diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
index 7e11d7b58761..5d2a1225785b 100644
--- a/arch/mips/mm/mmap.c
+++ b/arch/mips/mm/mmap.c
@@ -98,7 +98,8 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 }
 
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr0,
-	unsigned long len, unsigned long pgoff, unsigned long flags)
+	unsigned long len, unsigned long pgoff, unsigned long flags,
+	vm_flags_t vm_flags)
 {
 	return arch_get_unmapped_area_common(filp,
 			addr0, len, pgoff, flags, UP);
@@ -110,7 +111,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr0,
  */
 unsigned long arch_get_unmapped_area_topdown(struct file *filp,
 	unsigned long addr0, unsigned long len, unsigned long pgoff,
-	unsigned long flags)
+	unsigned long flags, vm_flags_t vm_flags)
 {
 	return arch_get_unmapped_area_common(filp,
 			addr0, len, pgoff, flags, DOWN);
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index f7722451276e..f852fe274abe 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -167,7 +167,8 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 }
 
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
-	unsigned long len, unsigned long pgoff, unsigned long flags)
+	unsigned long len, unsigned long pgoff, unsigned long flags,
+	vm_flags_t vm_flags)
 {
 	return arch_get_unmapped_area_common(filp,
 			addr, len, pgoff, flags, UP);
@@ -175,7 +176,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 
 unsigned long arch_get_unmapped_area_topdown(struct file *filp,
 	unsigned long addr, unsigned long len, unsigned long pgoff,
-	unsigned long flags)
+	unsigned long flags, vm_flags_t vm_flags)
 {
 	return arch_get_unmapped_area_common(filp,
 			addr, len, pgoff, flags, DOWN);
diff --git a/arch/parisc/mm/hugetlbpage.c b/arch/parisc/mm/hugetlbpage.c
index 0356199bd9e7..aa664f7ddb63 100644
--- a/arch/parisc/mm/hugetlbpage.c
+++ b/arch/parisc/mm/hugetlbpage.c
@@ -40,7 +40,7 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 		addr = ALIGN(addr, huge_page_size(h));
 
 	/* we need to make sure the colouring is OK */
-	return arch_get_unmapped_area(file, addr, len, pgoff, flags);
+	return arch_get_unmapped_area(file, addr, len, pgoff, flags, 0);
 }
 
 
diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
index ef3ce37f1bb3..ada6bf896ef8 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -637,7 +637,8 @@ unsigned long arch_get_unmapped_area(struct file *filp,
 				     unsigned long addr,
 				     unsigned long len,
 				     unsigned long pgoff,
-				     unsigned long flags)
+				     unsigned long flags,
+				     vm_flags_t vm_flags)
 {
 	if (radix_enabled())
 		return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
@@ -650,7 +651,8 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp,
 					     const unsigned long addr0,
 					     const unsigned long len,
 					     const unsigned long pgoff,
-					     const unsigned long flags)
+					     const unsigned long flags,
+					     vm_flags_t vm_flags)
 {
 	if (radix_enabled())
 		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags);
diff --git a/arch/s390/mm/mmap.c b/arch/s390/mm/mmap.c
index 206756946589..96efa061ce01 100644
--- a/arch/s390/mm/mmap.c
+++ b/arch/s390/mm/mmap.c
@@ -82,7 +82,7 @@ static int get_align_mask(struct file *filp, unsigned long flags)
 
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 				     unsigned long len, unsigned long pgoff,
-				     unsigned long flags)
+				     unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
@@ -117,7 +117,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 
 unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 					     unsigned long len, unsigned long pgoff,
-					     unsigned long flags)
+					     unsigned long flags, vm_flags_t vm_flags)
 {
 	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
diff --git a/arch/sh/mm/mmap.c b/arch/sh/mm/mmap.c
index bee329d4149a..c442734d9b0c 100644
--- a/arch/sh/mm/mmap.c
+++ b/arch/sh/mm/mmap.c
@@ -52,7 +52,8 @@ static inline unsigned long COLOUR_ALIGN(unsigned long addr,
 }
 
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
-	unsigned long len, unsigned long pgoff, unsigned long flags)
+	unsigned long len, unsigned long pgoff, unsigned long flags,
+	vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
@@ -99,7 +100,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 unsigned long
 arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 			  const unsigned long len, const unsigned long pgoff,
-			  const unsigned long flags)
+			  const unsigned long flags, vm_flags_t vm_flags)
 {
 	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
diff --git a/arch/sparc/kernel/sys_sparc_32.c b/arch/sparc/kernel/sys_sparc_32.c
index 08a19727795c..80822f922e76 100644
--- a/arch/sparc/kernel/sys_sparc_32.c
+++ b/arch/sparc/kernel/sys_sparc_32.c
@@ -39,7 +39,7 @@ SYSCALL_DEFINE0(getpagesize)
 	return PAGE_SIZE; /* Possibly older binaries want 8192 on sun4's? */
 }
 
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags)
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
 {
 	struct vm_unmapped_area_info info = {};
 
diff --git a/arch/sparc/kernel/sys_sparc_64.c b/arch/sparc/kernel/sys_sparc_64.c
index d9c3b34ca744..acade309dc2f 100644
--- a/arch/sparc/kernel/sys_sparc_64.c
+++ b/arch/sparc/kernel/sys_sparc_64.c
@@ -87,7 +87,7 @@ static inline unsigned long COLOR_ALIGN(unsigned long addr,
 	return base + off;
 }
 
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags)
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct * vma;
@@ -146,7 +146,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 unsigned long
 arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 			  const unsigned long len, const unsigned long pgoff,
-			  const unsigned long flags)
+			  const unsigned long flags, vm_flags_t vm_flags)
 {
 	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
index 3c4407271d08..7e9db77231ac 100644
--- a/arch/x86/include/asm/pgtable_64.h
+++ b/arch/x86/include/asm/pgtable_64.h
@@ -245,7 +245,6 @@ extern void cleanup_highmap(void);
 
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
-#define HAVE_ARCH_UNMAPPED_AREA_VMFLAGS
 
 #define PAGE_AGP    PAGE_KERNEL_NOCACHE
 #define HAVE_PAGE_AGP 1
diff --git a/arch/x86/kernel/sys_x86_64.c b/arch/x86/kernel/sys_x86_64.c
index 01d7cd85ef97..87f8c9a71c49 100644
--- a/arch/x86/kernel/sys_x86_64.c
+++ b/arch/x86/kernel/sys_x86_64.c
@@ -121,7 +121,7 @@ static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
 }
 
 unsigned long
-arch_get_unmapped_area_vmflags(struct file *filp, unsigned long addr, unsigned long len,
+arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len,
 		       unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
@@ -158,7 +158,7 @@ arch_get_unmapped_area_vmflags(struct file *filp, unsigned long addr, unsigned l
 }
 
 unsigned long
-arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr0,
+arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr0,
 			  unsigned long len, unsigned long pgoff,
 			  unsigned long flags, vm_flags_t vm_flags)
 {
@@ -228,20 +228,5 @@ arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr0,
 	 * can happen with large stack limits and large mmap()
 	 * allocations.
 	 */
-	return arch_get_unmapped_area(filp, addr0, len, pgoff, flags);
-}
-
-unsigned long
-arch_get_unmapped_area(struct file *filp, unsigned long addr,
-		unsigned long len, unsigned long pgoff, unsigned long flags)
-{
-	return arch_get_unmapped_area_vmflags(filp, addr, len, pgoff, flags, 0);
-}
-
-unsigned long
-arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr,
-			  const unsigned long len, const unsigned long pgoff,
-			  const unsigned long flags)
-{
-	return arch_get_unmapped_area_topdown_vmflags(filp, addr, len, pgoff, flags, 0);
+	return arch_get_unmapped_area(filp, addr0, len, pgoff, flags, 0);
 }
diff --git a/arch/xtensa/kernel/syscall.c b/arch/xtensa/kernel/syscall.c
index b3c2450d6f23..dc54f854c2f5 100644
--- a/arch/xtensa/kernel/syscall.c
+++ b/arch/xtensa/kernel/syscall.c
@@ -55,7 +55,8 @@ asmlinkage long xtensa_fadvise64_64(int fd, int advice,
 
 #ifdef CONFIG_MMU
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
-		unsigned long len, unsigned long pgoff, unsigned long flags)
+		unsigned long len, unsigned long pgoff, unsigned long flags,
+		vm_flags_t vm_flags)
 {
 	struct vm_area_struct *vmm;
 	struct vma_iterator vmi;
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 91546493c43d..c4d34abc45d4 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -179,27 +179,20 @@ static inline void mm_update_next_owner(struct mm_struct *mm)
 
 extern void arch_pick_mmap_layout(struct mm_struct *mm,
 				  struct rlimit *rlim_stack);
-extern unsigned long
-arch_get_unmapped_area(struct file *, unsigned long, unsigned long,
-		       unsigned long, unsigned long);
-extern unsigned long
+
+unsigned long
+arch_get_unmapped_area(struct file *filp, unsigned long addr,
+		       unsigned long len, unsigned long pgoff,
+		       unsigned long flags, vm_flags_t vm_flags);
+unsigned long
 arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
-			  unsigned long len, unsigned long pgoff,
-			  unsigned long flags);
+			       unsigned long len, unsigned long pgoff,
+			       unsigned long flags, vm_flags_t);
 
 unsigned long mm_get_unmapped_area(struct mm_struct *mm, struct file *filp,
 				   unsigned long addr, unsigned long len,
 				   unsigned long pgoff, unsigned long flags);
 
-unsigned long
-arch_get_unmapped_area_vmflags(struct file *filp, unsigned long addr,
-			       unsigned long len, unsigned long pgoff,
-			       unsigned long flags, vm_flags_t vm_flags);
-unsigned long
-arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr,
-				       unsigned long len, unsigned long pgoff,
-				       unsigned long flags, vm_flags_t);
-
 unsigned long mm_get_unmapped_area_vmflags(struct mm_struct *mm,
 					   struct file *filp,
 					   unsigned long addr,
diff --git a/mm/mmap.c b/mm/mmap.c
index d0dfc85b209b..7528146f886f 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1821,7 +1821,7 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 unsigned long
 arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		       unsigned long len, unsigned long pgoff,
-		       unsigned long flags)
+		       unsigned long flags, vm_flags_t vm_flags)
 {
 	return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
 }
@@ -1885,38 +1885,21 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 unsigned long
 arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 			       unsigned long len, unsigned long pgoff,
-			       unsigned long flags)
+			       unsigned long flags, vm_flags_t vm_flags)
 {
 	return generic_get_unmapped_area_topdown(filp, addr, len, pgoff, flags);
 }
 #endif
 
-#ifndef HAVE_ARCH_UNMAPPED_AREA_VMFLAGS
-unsigned long
-arch_get_unmapped_area_vmflags(struct file *filp, unsigned long addr, unsigned long len,
-			       unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
-{
-	return arch_get_unmapped_area(filp, addr, len, pgoff, flags);
-}
-
-unsigned long
-arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr,
-				       unsigned long len, unsigned long pgoff,
-				       unsigned long flags, vm_flags_t vm_flags)
-{
-	return arch_get_unmapped_area_topdown(filp, addr, len, pgoff, flags);
-}
-#endif
-
 unsigned long mm_get_unmapped_area_vmflags(struct mm_struct *mm, struct file *filp,
 					   unsigned long addr, unsigned long len,
 					   unsigned long pgoff, unsigned long flags,
 					   vm_flags_t vm_flags)
 {
 	if (test_bit(MMF_TOPDOWN, &mm->flags))
-		return arch_get_unmapped_area_topdown_vmflags(filp, addr, len, pgoff,
-							      flags, vm_flags);
-	return arch_get_unmapped_area_vmflags(filp, addr, len, pgoff, flags, vm_flags);
+		return arch_get_unmapped_area_topdown(filp, addr, len, pgoff,
+						      flags, vm_flags);
+	return arch_get_unmapped_area(filp, addr, len, pgoff, flags, vm_flags);
 }
 
 unsigned long
@@ -1978,8 +1961,8 @@ mm_get_unmapped_area(struct mm_struct *mm, struct file *file,
 		     unsigned long pgoff, unsigned long flags)
 {
 	if (test_bit(MMF_TOPDOWN, &mm->flags))
-		return arch_get_unmapped_area_topdown(file, addr, len, pgoff, flags);
-	return arch_get_unmapped_area(file, addr, len, pgoff, flags);
+		return arch_get_unmapped_area_topdown(file, addr, len, pgoff, flags, 0);
+	return arch_get_unmapped_area(file, addr, len, pgoff, flags, 0);
 }
 EXPORT_SYMBOL(mm_get_unmapped_area);
 

-- 
2.39.2


