Return-Path: <linuxppc-dev+bounces-1597-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE79986806
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2024 23:07:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDTnk041Pz2xCW;
	Thu, 26 Sep 2024 07:07:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727298441;
	cv=none; b=AHLSO0WCXtZxOrTfzipIxH1vGNsUnsWzhTB37viOQrymdLagRCrohBZgaX9Ac6jxkvE6yR/8eYAjehuIJIcvizfte6WFldH8W8xpu5kQHrvX0PZNGYSaehjcDj3iKz5KIuu0fwhfFzD5q6QGum4a7DsBeNMxaS0xlIwx/uWMvkghoMsYyO+NSCNgCFFxn5fE10h9hdEWfoaZ4AuN26sib939Wkavx7gBpRfQsBtjXIac/ni4aShzre2axjGuMWi3V5wsm710xvuH57RxO7NSohSrVGvmlR1wd7Varf1hdxq3zyhUxcxJY5YJf9b1tUGCIrkMERq3pQxs5Sq4zwhKXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727298441; c=relaxed/relaxed;
	bh=R2qYtjyBIuz80JpmkuEhL9W0+O6x6xatHtzfGo2zqwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fk0DqBbucdGO+WmqkG5qm08RkmbpdnjgPD4zoWU66xaJNzw6Fa6FdXAFk7BFbTOMFlizCz7OFg/t2SBha15E9JRlmttL62qdUChwAyhOIGakHuMNjOKSVCBy96y5X853vfSk2oJPQcd0GBEqxhMlHmRPCi9YutmEe3ORvgJBc9J9LhyQT2KjBLTi0fUEY4rFORiAmlcPqTyrmJDHDzaQWoDE2VC9CkcBeFqFG45NhyPuWUtFHzmQKBXaNPngjV7uR0s39VgWD2P8srn1PNdSA1Qno8nUU9xiC57d/dPEvCwYuTUTcWciDK9cCESWN8/Ld3S8UNFbIfx6STHK84Oi8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UqUeN44x; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UqUeN44x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDTnj3tSVz2xBm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 07:07:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EB6B4A443AA;
	Wed, 25 Sep 2024 21:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93BAC4CEC3;
	Wed, 25 Sep 2024 21:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727298438;
	bh=ODTKCHXxIZE3eYSHvfpmzYWSeBfhCgyCnxo8sL2fUHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UqUeN44x2CyaBUPaNDkT98k6QN3VewzS7CUSKeQCD7Er05TZWE0qz2tzTPJ5xFD/o
	 SZdsfPJBUcVK4dRlnz8/NqnIbj/TOm7FASPiv+Zps96TFrJjYpEVq4XxK0nqdTGty8
	 cVz2cOJxhyz6vRclrGlh3FDM1KAMq5JWGh1Z3LYFBAgcqBisNYyEg6kxvm+G+h1/34
	 AKFLgqXcNy+hn1N/9l0tNjYChvvNXi0fQ3/AHQvp7aGYCZu8vedTaYrNErzVdPI0aH
	 yTvTayfqA+sFZUYQ+NLii51HXTvqMUHW975iSPHKFjGcwkF95HyatEteJJwpOUEYZt
	 xQwPkqnb9dgXw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Damien Le Moal <dlemoal@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Helge Deller <deller@gmx.de>,
	Kees Cook <kees@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 5/5] [RFC] mm: Remove MAP_UNINITIALIZED support
Date: Wed, 25 Sep 2024 21:06:15 +0000
Message-Id: <20240925210615.2572360-6-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240925210615.2572360-1-arnd@kernel.org>
References: <20240925210615.2572360-1-arnd@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

MAP_UNINITIALIZED was added back in 2009 for NOMMU kernels, specifically
for blackfin, which is long gone. MAP_HUGE_SHIFT/MAP_HUGE_MASK were
added in 2012 for architectures supporting hugepages, which at the time
did not overlap with the ones supporting NOMMU.

Adding the macro under an #ifdef was obviously a mistake, which
Christoph Hellwig tried to address by making it unconditionally defined
to 0x4000000 as part of the series to support RISC-V NOMMU kernels. At
this point linux/mman.h contained two conflicting definitions for bit 26,
though the two are still mutually exclusive at runtime in all supported
configurations.

According to the commit 854e9ed09ded ("mm: support madvise(MADV_FREE)")
description, it was previously used internally by facebook, which
would have resulted in MAP_HUGE_1MB turning into MAP_HUGE_2MB
with MAP_UNINITIALIZED enabled, and every other page size implying
MAP_UNINITIALIZED. I assume there are no remaining out of tree users
on MMU-enabled kernels today.

I do not see any sensible way to redefine the macros for the ABI in
a way avoids breaking something. The only ideas so far are:

 - do nothing, try to document the bug, hope for the best

 - remove the kernel implementation and redefine MAP_UNINITIALIZED to
   zero in the header to silently turn it off for everyone. There are
   few NOMMU users left, and the ones that do use NOMMU usually turn
   off MMAP_ALLOW_UNINITIALIZED, as it still has the potential to cause
   bugs and even security issues on systems with a memory protection
   unit.

 - remove both the implementation and the macro to force a build
   failure for anyone trying to use the feature. This way we can
   see who complains and whether we need to put it back in some
   form or change the userspace sources to no longer pass the flag.

Implement the third option here for the sake of discussion.

Link: https://git.uclibc.org/uClibc/commit/libc/stdlib/malloc/malloc.c?id=00673f93826bf1f
Link: https://lore.kernel.org/lkml/20190610221621.10938-4-hch@lst.de/
Link: https://lore.kernel.org/lkml/1352157848-29473-1-git-send-email-andi@firstfloor.org/
Link: https://lore.kernel.org/lkml/1448865583-2446-2-git-send-email-minchan@kernel.org/
Cc: Christoph Hellwig <hch@lst.de>
Cc: Damien Le Moal <dlemoal@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: Greg Ungerer <gerg@linux-m68k.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/admin-guide/mm/nommu-mmap.rst | 10 ++--------
 arch/alpha/include/uapi/asm/mman.h          |  2 --
 arch/mips/include/uapi/asm/mman.h           |  2 --
 arch/parisc/include/uapi/asm/mman.h         |  2 --
 arch/powerpc/include/uapi/asm/mman.h        |  5 -----
 arch/sh/configs/rsk7264_defconfig           |  1 -
 arch/sparc/include/uapi/asm/mman.h          |  3 ---
 arch/xtensa/include/uapi/asm/mman.h         |  3 ---
 fs/binfmt_elf_fdpic.c                       |  3 +--
 include/linux/mman.h                        |  4 ----
 include/uapi/asm-generic/mman.h             |  4 ----
 mm/Kconfig                                  | 22 ---------------------
 mm/nommu.c                                  |  4 +---
 13 files changed, 4 insertions(+), 61 deletions(-)

diff --git a/Documentation/admin-guide/mm/nommu-mmap.rst b/Documentation/admin-guide/mm/nommu-mmap.rst
index 530fed08de2c..9434c2fa99ae 100644
--- a/Documentation/admin-guide/mm/nommu-mmap.rst
+++ b/Documentation/admin-guide/mm/nommu-mmap.rst
@@ -135,14 +135,8 @@ Further notes on no-MMU MMAP
      significant delays during a userspace malloc() as the C library does an
      anonymous mapping and the kernel then does a memset for the entire map.
 
-     However, for memory that isn't required to be precleared - such as that
-     returned by malloc() - mmap() can take a MAP_UNINITIALIZED flag to
-     indicate to the kernel that it shouldn't bother clearing the memory before
-     returning it.  Note that CONFIG_MMAP_ALLOW_UNINITIALIZED must be enabled
-     to permit this, otherwise the flag will be ignored.
-
-     uClibc uses this to speed up malloc(), and the ELF-FDPIC binfmt uses this
-     to allocate the brk and stack region.
+     Previously, Linux also supported a MAP_UNINITIALIZED flag to allocate
+     memory without clearing it, this is no longer support.
 
  (#) A list of all the private copy and anonymous mappings on the system is
      visible through /proc/maps in no-MMU mode.
diff --git a/arch/alpha/include/uapi/asm/mman.h b/arch/alpha/include/uapi/asm/mman.h
index fc8b74aa3f89..1099b17a4003 100644
--- a/arch/alpha/include/uapi/asm/mman.h
+++ b/arch/alpha/include/uapi/asm/mman.h
@@ -21,8 +21,6 @@
 /* MAP_SYNC not supported */
 #define MAP_FIXED_NOREPLACE	0x200000/* MAP_FIXED which doesn't unmap underlying mapping */
 
-/* MAP_UNINITIALIZED not supported */
-
 /*
  * Flags for mlockall
  */
diff --git a/arch/mips/include/uapi/asm/mman.h b/arch/mips/include/uapi/asm/mman.h
index 6deb62db90de..9463c9071268 100644
--- a/arch/mips/include/uapi/asm/mman.h
+++ b/arch/mips/include/uapi/asm/mman.h
@@ -31,8 +31,6 @@
 /* MAP_SYNC not supported */
 #define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
 
-/* MAP_UNINITIALIZED not supported */
-
 /*
  * Flags for mlockall
  */
diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
index 3732950a5cd8..8d7f3a8912b3 100644
--- a/arch/parisc/include/uapi/asm/mman.h
+++ b/arch/parisc/include/uapi/asm/mman.h
@@ -20,8 +20,6 @@
 /* MAP_SYNC not supported */
 #define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
 
-/* MAP_UNINITIALIZED not supported */
-
 /*
  * Flags for mlockall
  */
diff --git a/arch/powerpc/include/uapi/asm/mman.h b/arch/powerpc/include/uapi/asm/mman.h
index d57b347c37fe..48c734b4d201 100644
--- a/arch/powerpc/include/uapi/asm/mman.h
+++ b/arch/powerpc/include/uapi/asm/mman.h
@@ -33,11 +33,6 @@
 #define MAP_SYNC		0x080000 /* perform synchronous page faults for the mapping */
 #define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
 
-#define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
-					 * uninitialized */
-
-
-
 #define MCL_CURRENT     0x2000          /* lock all currently mapped pages */
 #define MCL_FUTURE      0x4000          /* lock all additions to address space */
 #define MCL_ONFAULT	0x8000		/* lock all pages that are faulted in */
diff --git a/arch/sh/configs/rsk7264_defconfig b/arch/sh/configs/rsk7264_defconfig
index e4ef259425c4..86421e2fec10 100644
--- a/arch/sh/configs/rsk7264_defconfig
+++ b/arch/sh/configs/rsk7264_defconfig
@@ -12,7 +12,6 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_EXPERT=y
 CONFIG_PERF_COUNTERS=y
 # CONFIG_VM_EVENT_COUNTERS is not set
-CONFIG_MMAP_ALLOW_UNINITIALIZED=y
 CONFIG_PROFILING=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
diff --git a/arch/sparc/include/uapi/asm/mman.h b/arch/sparc/include/uapi/asm/mman.h
index afb86698cdb1..e05ac492f9a8 100644
--- a/arch/sparc/include/uapi/asm/mman.h
+++ b/arch/sparc/include/uapi/asm/mman.h
@@ -30,9 +30,6 @@
 #define MAP_SYNC		0x080000 /* perform synchronous page faults for the mapping */
 #define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
 
-#define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
-					 * uninitialized */
-
 #define MCL_CURRENT     0x2000          /* lock all currently mapped pages */
 #define MCL_FUTURE      0x4000          /* lock all additions to address space */
 #define MCL_ONFAULT	0x8000		/* lock all pages that are faulted in */
diff --git a/arch/xtensa/include/uapi/asm/mman.h b/arch/xtensa/include/uapi/asm/mman.h
index e713b8dc8587..6fdf9f3e587a 100644
--- a/arch/xtensa/include/uapi/asm/mman.h
+++ b/arch/xtensa/include/uapi/asm/mman.h
@@ -36,9 +36,6 @@
 /* MAP_SYNC not supported */
 #define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
 
-#define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
-					 * uninitialized */
-
 /*
  * Flags for mlockall
  */
diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
index 4fe5bb9f1b1f..82ba92d28ddf 100644
--- a/fs/binfmt_elf_fdpic.c
+++ b/fs/binfmt_elf_fdpic.c
@@ -418,8 +418,7 @@ static int load_elf_fdpic_binary(struct linux_binprm *bprm)
 
 	current->mm->start_brk = vm_mmap(NULL, 0, stack_size, stack_prot,
 					 MAP_PRIVATE | MAP_ANONYMOUS |
-					 MAP_UNINITIALIZED | MAP_GROWSDOWN,
-					 0);
+					 MAP_GROWSDOWN, 0);
 
 	if (IS_ERR_VALUE(current->mm->start_brk)) {
 		retval = current->mm->start_brk;
diff --git a/include/linux/mman.h b/include/linux/mman.h
index bcb201ab7a41..f606b2264cc0 100644
--- a/include/linux/mman.h
+++ b/include/linux/mman.h
@@ -24,9 +24,6 @@
 #ifndef MAP_HUGE_1GB
 #define MAP_HUGE_1GB 0
 #endif
-#ifndef MAP_UNINITIALIZED
-#define MAP_UNINITIALIZED 0
-#endif
 #ifndef MAP_SYNC
 #define MAP_SYNC 0
 #endif
@@ -44,7 +41,6 @@
 		| MAP_ANONYMOUS \
 		| MAP_DENYWRITE \
 		| MAP_EXECUTABLE \
-		| MAP_UNINITIALIZED \
 		| MAP_GROWSDOWN \
 		| MAP_LOCKED \
 		| MAP_NORESERVE \
diff --git a/include/uapi/asm-generic/mman.h b/include/uapi/asm-generic/mman.h
index f26f9b4c03e1..541be26ad947 100644
--- a/include/uapi/asm-generic/mman.h
+++ b/include/uapi/asm-generic/mman.h
@@ -27,10 +27,6 @@
 #define MAP_SYNC		0x080000 /* perform synchronous page faults for the mapping */
 #define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
 
-#define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
-					 * uninitialized */
-
-
 /*
  * Bits [26:31] are reserved, see asm-generic/hugetlb_encode.h
  * for MAP_HUGETLB usage
diff --git a/mm/Kconfig b/mm/Kconfig
index 09aebca1cae3..7326820ba200 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -381,28 +381,6 @@ config COMPAT_BRK
 
 	  On non-ancient distros (post-2000 ones) N is usually a safe choice.
 
-config MMAP_ALLOW_UNINITIALIZED
-	bool "Allow mmapped anonymous memory to be uninitialized"
-	depends on EXPERT && !MMU
-	default n
-	help
-	  Normally, and according to the Linux spec, anonymous memory obtained
-	  from mmap() has its contents cleared before it is passed to
-	  userspace.  Enabling this config option allows you to request that
-	  mmap() skip that if it is given an MAP_UNINITIALIZED flag, thus
-	  providing a huge performance boost.  If this option is not enabled,
-	  then the flag will be ignored.
-
-	  This is taken advantage of by uClibc's malloc(), and also by
-	  ELF-FDPIC binfmt's brk and stack allocator.
-
-	  Because of the obvious security issues, this option should only be
-	  enabled on embedded devices where you control what is run in
-	  userspace.  Since that isn't generally a problem on no-MMU systems,
-	  it is normally safe to say Y here.
-
-	  See Documentation/admin-guide/mm/nommu-mmap.rst for more information.
-
 config SELECT_MEMORY_MODEL
 	def_bool y
 	depends on ARCH_SELECT_MEMORY_MODEL
diff --git a/mm/nommu.c b/mm/nommu.c
index 385b0c15add8..793fa7303065 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -1172,9 +1172,7 @@ unsigned long do_mmap(struct file *file,
 	add_nommu_region(region);
 
 	/* clear anonymous mappings that don't ask for uninitialized data */
-	if (!vma->vm_file &&
-	    (!IS_ENABLED(CONFIG_MMAP_ALLOW_UNINITIALIZED) ||
-	     !(flags & MAP_UNINITIALIZED)))
+	if (!vma->vm_file)
 		memset((void *)region->vm_start, 0,
 		       region->vm_end - region->vm_start);
 
-- 
2.39.2


