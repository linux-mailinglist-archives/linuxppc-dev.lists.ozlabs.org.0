Return-Path: <linuxppc-dev+bounces-1593-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 679579867F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2024 23:06:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDTn908H9z2yQ9;
	Thu, 26 Sep 2024 07:06:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727298412;
	cv=none; b=hs73s0sZl7GTwpkKABA2xrfYaE/30xHnANUM3gDg8rMkT+/+EBVAOjM++Yf7/pLeZ8f71pR8Dt4LIep8Qpqy9L+27I9Vmz1BicWDKWolMmwgq9XWa9aCfSApVpOgXipCYF2WGhRVJjRvQoPlN8itQ35QdhFsmSyQl8V1k/Ah7tdWwo+EFlxW7unk2c7kjiGFcaYVDBW6Byp1g4AG4Yo1PtQI3w4o9AFRtappLD5NdiIUIQubaP3gSVn17W5zB1Z1r5j1B7e7XkyGEkgMMZKYs2Mdi67csma9ARcmvbc+0eGqI0KuKS/0SZeFyuIgcqVRAoZF8bm1IK/oIuc8e4oHbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727298412; c=relaxed/relaxed;
	bh=oI90N2HtP4LsnPw7fkMPMRhusRCyy4fgPy53eeOa4fg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TVC4gT+79VHUeWWA+hFcY2qw/o2c7/WFqTuGZWY4odPciVn2FZ9G+5t4uALnsbk8aT7RZ1XAglqmmwEPP7ad5NgfXs9UPwVsGNFPhyqcW9awfh9+ogNK+NckvXLNsq3Hp12gVLA3mlGMVeZs8ZlLVhjVg8bf+f0IxDYCgD4snfTDs/JzYYasw321hPilY/kuZ17rsHupgpgeMyW17PyKQtzNnHohOmpYBTY5ggJU5GGsZyNTF8eDM6NT6rT6oL9qg7WqP6RRIoP0vwfg4oZw5f4aSSv5H7xTCQTT3gc1k8WWkeYiTf5btsHOwGNhC+45b849445VQH/REW7lP2DRxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rrw0/11n; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rrw0/11n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDTn83yLnz2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 07:06:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 024D7A44883;
	Wed, 25 Sep 2024 21:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5E0C4CECE;
	Wed, 25 Sep 2024 21:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727298409;
	bh=0XCZZU73KUaPUGV94b5Y4vfVQ2GPZcPS56YVImT6S6k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rrw0/11nMatKUr+PrDMd2vXb6R6+ZP+SaYtT6WuW/O6kxUVYeGItzda7ucqqy4+Sf
	 wzTLmbEmZXG/73xtdPH/+gbaOxnorCRudP/1NSYNczPmeNahK26MpnP5VeZ0/1VGjl
	 GFtTRedXkgSlu8Gh5pGFFrawX8+jFjtLfbs7zCFyE3iZAXtK8waEB5iYZHsmW7Rwdz
	 HCXA+nUZa0C1DU48dx1g0bySQzc8Rt73RZgCgzPj8BfKteKKN2U/EG53aBcAPbDDv9
	 V1rZ1EEV8fZI3K4fS2WzlFPirFalsFTj0FFK1nhoyn2PEFNB/ljapvfYoBwpaXaPHA
	 p1BgYSRlQPtKw==
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
Subject: [PATCH 1/5] asm-generic: cosmetic updates to uapi/asm/mman.h
Date: Wed, 25 Sep 2024 21:06:11 +0000
Message-Id: <20240925210615.2572360-2-arnd@kernel.org>
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

All but four architectures use asm-generic/mman-common.h, and the
differences between these are mostly accidental. Rearrange them
slightly to make it possible to 'vimdiff' them to see the actual
relevant differences:

 - Move MADV_HWPOISON/MADV_SOFT_OFFLINE to the end of the list
   and ensure that all architectures include definitions

 - Use the exact same amount of whitespace and leading digits
   in each architecture

 - Synchronize comments, replacing historic defines that were
   never used with appropriate comments

 - explicitly point out MAP_SYNC and MAP_UNINITIALIZED as
   unsupported

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/alpha/include/uapi/asm/mman.h     | 53 ++++++++++++-------
 arch/mips/include/uapi/asm/mman.h      | 72 ++++++++++++--------------
 arch/parisc/include/uapi/asm/mman.h    | 50 +++++++++++-------
 arch/xtensa/include/uapi/asm/mman.h    | 61 ++++++++++------------
 include/uapi/asm-generic/mman-common.h |  8 ++-
 5 files changed, 129 insertions(+), 115 deletions(-)

diff --git a/arch/alpha/include/uapi/asm/mman.h b/arch/alpha/include/uapi/asm/mman.h
index 763929e814e9..8946a13ce858 100644
--- a/arch/alpha/include/uapi/asm/mman.h
+++ b/arch/alpha/include/uapi/asm/mman.h
@@ -6,6 +6,8 @@
 #define PROT_WRITE	0x2		/* page can be written */
 #define PROT_EXEC	0x4		/* page can be executed */
 #define PROT_SEM	0x8		/* page may be used for atomic ops */
+/*			0x10		   reserved for arch-specific use */
+/*			0x20		   reserved for arch-specific use */
 #define PROT_NONE	0x0		/* page can not be accessed */
 #define PROT_GROWSDOWN	0x01000000	/* mprotect flag: extend change to start of growsdown vma */
 #define PROT_GROWSUP	0x02000000	/* mprotect flag: extend change to end of growsup vma */
@@ -15,41 +17,49 @@
 #define MAP_FIXED	0x100		/* Interpret addr exactly */
 #define MAP_ANONYMOUS	0x10		/* don't use a file */
 
-/* not used by linux, but here to make sure we don't clash with OSF/1 defines */
-#define _MAP_HASSEMAPHORE 0x0200
-#define _MAP_INHERIT	0x0400
-#define _MAP_UNALIGNED	0x0800
-
-/* These are linux-specific */
-#define MAP_GROWSDOWN	0x01000		/* stack-like segment */
-#define MAP_DENYWRITE	0x02000		/* ETXTBSY */
-#define MAP_EXECUTABLE	0x04000		/* mark it as an executable */
-#define MAP_LOCKED	0x08000		/* lock the mapping */
+/* 0x200 through 0x800 originally for OSF-1 compat */
+#define MAP_GROWSDOWN	0x1000		/* stack-like segment */
+#define MAP_DENYWRITE	0x2000		/* ETXTBSY */
+#define MAP_EXECUTABLE	0x4000		/* mark it as an executable */
+#define MAP_LOCKED	0x8000		/* pages are locked */
 #define MAP_NORESERVE	0x10000		/* don't check for reservations */
-#define MAP_POPULATE	0x20000		/* populate (prefault) pagetables */
-#define MAP_NONBLOCK	0x40000		/* do not block on IO */
-#define MAP_STACK	0x80000		/* give out an address that is best suited for process/thread stacks */
-#define MAP_HUGETLB	0x100000	/* create a huge page mapping */
+
+#define MAP_POPULATE		0x020000	/* populate (prefault) pagetables */
+#define MAP_NONBLOCK		0x040000	/* do not block on IO */
+#define MAP_STACK		0x080000	/* give out an address that is best suited for process/thread stacks */
+#define MAP_HUGETLB		0x100000	/* create a huge page mapping */
+/* MAP_SYNC not supported */
 #define MAP_FIXED_NOREPLACE	0x200000/* MAP_FIXED which doesn't unmap underlying mapping */
 
-#define MS_ASYNC	1		/* sync memory asynchronously */
-#define MS_SYNC		2		/* synchronous memory sync */
-#define MS_INVALIDATE	4		/* invalidate the caches */
+/* MAP_UNINITIALIZED not supported */
 
+/*
+ * Flags for mlockall
+ */
 #define MCL_CURRENT	 8192		/* lock all currently mapped pages */
 #define MCL_FUTURE	16384		/* lock all additions to address space */
 #define MCL_ONFAULT	32768		/* lock all pages that are faulted in */
 
+/*
+ * Flags for mlock
+ */
 #define MLOCK_ONFAULT	0x01		/* Lock pages in range after they are faulted in, do not prefault */
 
+/*
+ * Flags for msync
+ */
+#define MS_ASYNC	1		/* sync memory asynchronously */
+#define MS_SYNC		2		/* synchronous memory sync */
+#define MS_INVALIDATE	4		/* invalidate the caches */
+
 #define MADV_NORMAL	0		/* no further special treatment */
 #define MADV_RANDOM	1		/* expect random page references */
 #define MADV_SEQUENTIAL	2		/* expect sequential page references */
 #define MADV_WILLNEED	3		/* will need these pages */
-#define	MADV_SPACEAVAIL	5		/* ensure resources are available */
 #define MADV_DONTNEED	6		/* don't need these pages */
+/* originally MADV_SPACEAVAIL 5 */
 
-/* common/generic parameters */
+/* common parameters: try to keep these consistent across architectures */
 #define MADV_FREE	8		/* free pages only if memory pressure */
 #define MADV_REMOVE	9		/* remove these pages & resources */
 #define MADV_DONTFORK	10		/* don't inherit across fork */
@@ -63,7 +73,7 @@
 
 #define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
 					   overrides the coredump filter bits */
-#define MADV_DODUMP	17		/* Clear the MADV_NODUMP flag */
+#define MADV_DODUMP	17		/* Clear the MADV_DONTDUMP flag */
 
 #define MADV_WIPEONFORK 18		/* Zero memory on fork, child only */
 #define MADV_KEEPONFORK 19		/* Undo MADV_WIPEONFORK */
@@ -78,6 +88,9 @@
 
 #define MADV_COLLAPSE	25		/* Synchronous hugepage collapse */
 
+#define MADV_HWPOISON	100		/* poison a page for testing */
+#define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */
+
 /* compatibility flags */
 #define MAP_FILE	0
 
diff --git a/arch/mips/include/uapi/asm/mman.h b/arch/mips/include/uapi/asm/mman.h
index 9c48d9a21aa0..399937cefaa6 100644
--- a/arch/mips/include/uapi/asm/mman.h
+++ b/arch/mips/include/uapi/asm/mman.h
@@ -9,53 +9,36 @@
 #ifndef _ASM_MMAN_H
 #define _ASM_MMAN_H
 
-/*
- * Protections are chosen from these bits, OR'd together.  The
- * implementation does not necessarily support PROT_EXEC or PROT_WRITE
- * without PROT_READ.  The only guarantees are that no writing will be
- * allowed without PROT_WRITE and no access will be allowed for PROT_NONE.
- */
-#define PROT_NONE	0x00		/* page can not be accessed */
-#define PROT_READ	0x01		/* page can be read */
-#define PROT_WRITE	0x02		/* page can be written */
-#define PROT_EXEC	0x04		/* page can be executed */
-/*			0x08		   reserved for PROT_EXEC_NOFLUSH */
+#define PROT_READ	0x1		/* page can be read */
+#define PROT_WRITE	0x2		/* page can be written */
+#define PROT_EXEC	0x4		/* page can be executed */
+/*			0x8		   reserved for PROT_EXEC_NOFLUSH */
 #define PROT_SEM	0x10		/* page may be used for atomic ops */
+/*			0x20		   reserved for arch-specific use */
+#define PROT_NONE	0x0		/* page can not be accessed */
 #define PROT_GROWSDOWN	0x01000000	/* mprotect flag: extend change to start of growsdown vma */
 #define PROT_GROWSUP	0x02000000	/* mprotect flag: extend change to end of growsup vma */
 
-/*
- * Flags for mmap
- */
 /* 0x01 - 0x03 are defined in linux/mman.h */
-#define MAP_TYPE	0x00f		/* Mask for type of mapping */
-#define MAP_FIXED	0x010		/* Interpret addr exactly */
+#define MAP_TYPE	0x0f		/* Mask for type of mapping */
+#define MAP_FIXED	0x10		/* Interpret addr exactly */
 
-/* not used by linux, but here to make sure we don't clash with ABI defines */
-#define MAP_RENAME	0x020		/* Assign page to file */
-#define MAP_AUTOGROW	0x040		/* File may grow by writing */
-#define MAP_LOCAL	0x080		/* Copy on fork/sproc */
-#define MAP_AUTORSRV	0x100		/* Logical swap reserved on demand */
-
-/* These are linux-specific */
+/* 0x20 through 0x100 originally reserved for other unix compat */
 #define MAP_NORESERVE	0x0400		/* don't check for reservations */
 #define MAP_ANONYMOUS	0x0800		/* don't use a file */
 #define MAP_GROWSDOWN	0x1000		/* stack-like segment */
 #define MAP_DENYWRITE	0x2000		/* ETXTBSY */
 #define MAP_EXECUTABLE	0x4000		/* mark it as an executable */
 #define MAP_LOCKED	0x8000		/* pages are locked */
-#define MAP_POPULATE	0x10000		/* populate (prefault) pagetables */
-#define MAP_NONBLOCK	0x20000		/* do not block on IO */
-#define MAP_STACK	0x40000		/* give out an address that is best suited for process/thread stacks */
-#define MAP_HUGETLB	0x80000		/* create a huge page mapping */
-#define MAP_FIXED_NOREPLACE 0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
 
-/*
- * Flags for msync
- */
-#define MS_ASYNC	0x0001		/* sync memory asynchronously */
-#define MS_INVALIDATE	0x0002		/* invalidate mappings & caches */
-#define MS_SYNC		0x0004		/* synchronous memory sync */
+#define MAP_POPULATE		0x010000	/* populate (prefault) pagetables */
+#define MAP_NONBLOCK		0x020000	/* do not block on IO */
+#define MAP_STACK		0x040000	/* give out an address that is best suited for process/thread stacks */
+#define MAP_HUGETLB		0x080000	/* create a huge page mapping */
+/* MAP_SYNC not supported */
+#define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
+
+/* MAP_UNINITIALIZED not supported */
 
 /*
  * Flags for mlockall
@@ -69,9 +52,16 @@
  */
 #define MLOCK_ONFAULT	0x01		/* Lock pages in range after they are faulted in, do not prefault */
 
+/*
+ * Flags for msync
+ */
+#define MS_ASYNC	1		/* sync memory asynchronously */
+#define MS_INVALIDATE	2		/* invalidate the caches */
+#define MS_SYNC		4		/* synchronous memory sync */
+
 #define MADV_NORMAL	0		/* no further special treatment */
 #define MADV_RANDOM	1		/* expect random page references */
-#define MADV_SEQUENTIAL 2		/* expect sequential page references */
+#define MADV_SEQUENTIAL	2		/* expect sequential page references */
 #define MADV_WILLNEED	3		/* will need these pages */
 #define MADV_DONTNEED	4		/* don't need these pages */
 
@@ -81,16 +71,15 @@
 #define MADV_DONTFORK	10		/* don't inherit across fork */
 #define MADV_DOFORK	11		/* do inherit across fork */
 
-#define MADV_MERGEABLE	 12		/* KSM may merge identical pages */
+#define MADV_MERGEABLE   12		/* KSM may merge identical pages */
 #define MADV_UNMERGEABLE 13		/* KSM may not merge identical pages */
-#define MADV_HWPOISON	 100		/* poison a page for testing */
 
 #define MADV_HUGEPAGE	14		/* Worth backing with hugepages */
-#define MADV_NOHUGEPAGE 15		/* Not worth backing with hugepages */
+#define MADV_NOHUGEPAGE	15		/* Not worth backing with hugepages */
 
-#define MADV_DONTDUMP	16		/* Explicitly exclude from core dump,
+#define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
 					   overrides the coredump filter bits */
-#define MADV_DODUMP	17		/* Clear the MADV_NODUMP flag */
+#define MADV_DODUMP	17		/* Clear the MADV_DONTDUMP flag */
 
 #define MADV_WIPEONFORK 18		/* Zero memory on fork, child only */
 #define MADV_KEEPONFORK 19		/* Undo MADV_WIPEONFORK */
@@ -105,6 +94,9 @@
 
 #define MADV_COLLAPSE	25		/* Synchronous hugepage collapse */
 
+#define MADV_HWPOISON	100		/* poison a page for testing */
+#define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */
+
 /* compatibility flags */
 #define MAP_FILE	0
 
diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
index 68c44f99bc93..80f4a55763a0 100644
--- a/arch/parisc/include/uapi/asm/mman.h
+++ b/arch/parisc/include/uapi/asm/mman.h
@@ -6,6 +6,8 @@
 #define PROT_WRITE	0x2		/* page can be written */
 #define PROT_EXEC	0x4		/* page can be executed */
 #define PROT_SEM	0x8		/* page may be used for atomic ops */
+/*			0x10		   reserved for arch-specific use */
+/*			0x20		   reserved for arch-specific use */
 #define PROT_NONE	0x0		/* page can not be accessed */
 #define PROT_GROWSDOWN	0x01000000	/* mprotect flag: extend change to start of growsdown vma */
 #define PROT_GROWSUP	0x02000000	/* mprotect flag: extend change to end of growsup vma */
@@ -20,30 +22,42 @@
 #define MAP_LOCKED	0x2000		/* pages are locked */
 #define MAP_NORESERVE	0x4000		/* don't check for reservations */
 #define MAP_GROWSDOWN	0x8000		/* stack-like segment */
-#define MAP_POPULATE	0x10000		/* populate (prefault) pagetables */
-#define MAP_NONBLOCK	0x20000		/* do not block on IO */
-#define MAP_STACK	0x40000		/* give out an address that is best suited for process/thread stacks */
-#define MAP_HUGETLB	0x80000		/* create a huge page mapping */
-#define MAP_FIXED_NOREPLACE 0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
-#define MAP_UNINITIALIZED 0		/* uninitialized anonymous mmap */
 
-#define MS_SYNC		1		/* synchronous memory sync */
-#define MS_ASYNC	2		/* sync memory asynchronously */
-#define MS_INVALIDATE	4		/* invalidate the caches */
+#define MAP_POPULATE		0x010000	/* populate (prefault) pagetables */
+#define MAP_NONBLOCK		0x020000	/* do not block on IO */
+#define MAP_STACK		0x040000	/* give out an address that is best suited for process/thread stacks */
+#define MAP_HUGETLB		0x080000	/* create a huge page mapping */
+/* MAP_SYNC not supported */
+#define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
+
+/* MAP_UNINITIALIZED not supported */
 
+/*
+ * Flags for mlockall
+ */
 #define MCL_CURRENT	1		/* lock all current mappings */
 #define MCL_FUTURE	2		/* lock all future mappings */
 #define MCL_ONFAULT	4		/* lock all pages that are faulted in */
 
+/*
+ * Flags for mlock
+ */
 #define MLOCK_ONFAULT	0x01		/* Lock pages in range after they are faulted in, do not prefault */
 
-#define MADV_NORMAL     0               /* no further special treatment */
-#define MADV_RANDOM     1               /* expect random page references */
-#define MADV_SEQUENTIAL 2               /* expect sequential page references */
-#define MADV_WILLNEED   3               /* will need these pages */
-#define MADV_DONTNEED   4               /* don't need these pages */
+/*
+ * Flags for msync
+ */
+#define MS_SYNC		1		/* synchronous memory sync */
+#define MS_ASYNC	2		/* sync memory asynchronously */
+#define MS_INVALIDATE	4		/* invalidate the caches */
+
+#define MADV_NORMAL	0		/* no further special treatment */
+#define MADV_RANDOM	1		/* expect random page references */
+#define MADV_SEQUENTIAL	2		/* expect sequential page references */
+#define MADV_WILLNEED	3		/* will need these pages */
+#define MADV_DONTNEED	4		/* don't need these pages */
 
-/* common/generic parameters */
+/* common parameters: try to keep these consistent across architectures */
 #define MADV_FREE	8		/* free pages only if memory pressure */
 #define MADV_REMOVE	9		/* remove these pages & resources */
 #define MADV_DONTFORK	10		/* don't inherit across fork */
@@ -53,11 +67,11 @@
 #define MADV_UNMERGEABLE 13		/* KSM may not merge identical pages */
 
 #define MADV_HUGEPAGE	14		/* Worth backing with hugepages */
-#define MADV_NOHUGEPAGE 15		/* Not worth backing with hugepages */
+#define MADV_NOHUGEPAGE	15		/* Not worth backing with hugepages */
 
 #define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
 					   overrides the coredump filter bits */
-#define MADV_DODUMP	17		/* Clear the MADV_NODUMP flag */
+#define MADV_DODUMP	17		/* Clear the MADV_DONTDUMP flag */
 
 #define MADV_WIPEONFORK 18		/* Zero memory on fork, child only */
 #define MADV_KEEPONFORK 19		/* Undo MADV_WIPEONFORK */
@@ -72,7 +86,7 @@
 
 #define MADV_COLLAPSE	25		/* Synchronous hugepage collapse */
 
-#define MADV_HWPOISON     100		/* poison a page for testing */
+#define MADV_HWPOISON	100		/* poison a page for testing */
 #define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */
 
 /* compatibility flags */
diff --git a/arch/xtensa/include/uapi/asm/mman.h b/arch/xtensa/include/uapi/asm/mman.h
index 1ff0c858544f..ad6bc56a7aef 100644
--- a/arch/xtensa/include/uapi/asm/mman.h
+++ b/arch/xtensa/include/uapi/asm/mman.h
@@ -15,57 +15,38 @@
 #ifndef _XTENSA_MMAN_H
 #define _XTENSA_MMAN_H
 
-/*
- * Protections are chosen from these bits, OR'd together.  The
- * implementation does not necessarily support PROT_EXEC or PROT_WRITE
- * without PROT_READ.  The only guarantees are that no writing will be
- * allowed without PROT_WRITE and no access will be allowed for PROT_NONE.
- */
-
-#define PROT_NONE	0x0		/* page can not be accessed */
 #define PROT_READ	0x1		/* page can be read */
 #define PROT_WRITE	0x2		/* page can be written */
 #define PROT_EXEC	0x4		/* page can be executed */
-
+/*			0x8		   reserved for arch-specific use */
 #define PROT_SEM	0x10		/* page may be used for atomic ops */
+/*			0x20		   reserved for arch-specific use */
+#define PROT_NONE	0x0		/* page can not be accessed */
 #define PROT_GROWSDOWN	0x01000000	/* mprotect flag: extend change to start of growsdown vma */
-#define PROT_GROWSUP	0x02000000	/* mprotect flag: extend change to end fo growsup vma */
+#define PROT_GROWSUP	0x02000000	/* mprotect flag: extend change to end of growsup vma */
 
-/*
- * Flags for mmap
- */
 /* 0x01 - 0x03 are defined in linux/mman.h */
-#define MAP_TYPE	0x00f		/* Mask for type of mapping */
-#define MAP_FIXED	0x010		/* Interpret addr exactly */
+#define MAP_TYPE	0x0f		/* Mask for type of mapping */
+#define MAP_FIXED	0x10		/* Interpret addr exactly */
 
-/* not used by linux, but here to make sure we don't clash with ABI defines */
-#define MAP_RENAME	0x020		/* Assign page to file */
-#define MAP_AUTOGROW	0x040		/* File may grow by writing */
-#define MAP_LOCAL	0x080		/* Copy on fork/sproc */
-#define MAP_AUTORSRV	0x100		/* Logical swap reserved on demand */
-
-/* These are linux-specific */
+/* 0x20 through 0x100 originally reserved for other unix compat */
 #define MAP_NORESERVE	0x0400		/* don't check for reservations */
 #define MAP_ANONYMOUS	0x0800		/* don't use a file */
 #define MAP_GROWSDOWN	0x1000		/* stack-like segment */
 #define MAP_DENYWRITE	0x2000		/* ETXTBSY */
 #define MAP_EXECUTABLE	0x4000		/* mark it as an executable */
 #define MAP_LOCKED	0x8000		/* pages are locked */
-#define MAP_POPULATE	0x10000		/* populate (prefault) pagetables */
-#define MAP_NONBLOCK	0x20000		/* do not block on IO */
-#define MAP_STACK	0x40000		/* give out an address that is best suited for process/thread stacks */
-#define MAP_HUGETLB	0x80000		/* create a huge page mapping */
-#define MAP_FIXED_NOREPLACE 0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
+
+#define MAP_POPULATE		0x010000	/* populate (prefault) pagetables */
+#define MAP_NONBLOCK		0x020000	/* do not block on IO */
+#define MAP_STACK		0x040000	/* give out an address that is best suited for process/thread stacks */
+#define MAP_HUGETLB		0x080000	/* create a huge page mapping */
+/* MAP_SYNC not supported */
+#define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
+
 #define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
 					 * uninitialized */
 
-/*
- * Flags for msync
- */
-#define MS_ASYNC	0x0001		/* sync memory asynchronously */
-#define MS_INVALIDATE	0x0002		/* invalidate mappings & caches */
-#define MS_SYNC		0x0004		/* synchronous memory sync */
-
 /*
  * Flags for mlockall
  */
@@ -78,6 +59,13 @@
  */
 #define MLOCK_ONFAULT	0x01		/* Lock pages in range after they are faulted in, do not prefault */
 
+/*
+ * Flags for msync
+ */
+#define MS_ASYNC	1		/* sync memory asynchronously */
+#define MS_INVALIDATE	2		/* invalidate the caches */
+#define MS_SYNC		4		/* synchronous memory sync */
+
 #define MADV_NORMAL	0		/* no further special treatment */
 #define MADV_RANDOM	1		/* expect random page references */
 #define MADV_SEQUENTIAL	2		/* expect sequential page references */
@@ -98,7 +86,7 @@
 
 #define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
 					   overrides the coredump filter bits */
-#define MADV_DODUMP	17		/* Clear the MADV_NODUMP flag */
+#define MADV_DODUMP	17		/* Clear the MADV_DONTDUMP flag */
 
 #define MADV_WIPEONFORK 18		/* Zero memory on fork, child only */
 #define MADV_KEEPONFORK 19		/* Undo MADV_WIPEONFORK */
@@ -113,6 +101,9 @@
 
 #define MADV_COLLAPSE	25		/* Synchronous hugepage collapse */
 
+#define MADV_HWPOISON	100		/* poison a page for testing */
+#define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */
+
 /* compatibility flags */
 #define MAP_FILE	0
 
diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
index 6ce1f1ceb432..792ad5599d9c 100644
--- a/include/uapi/asm-generic/mman-common.h
+++ b/include/uapi/asm-generic/mman-common.h
@@ -38,6 +38,9 @@
  */
 #define MLOCK_ONFAULT	0x01		/* Lock pages in range after they are faulted in, do not prefault */
 
+/*
+ * Flags for msync
+ */
 #define MS_ASYNC	1		/* sync memory asynchronously */
 #define MS_INVALIDATE	2		/* invalidate the caches */
 #define MS_SYNC		4		/* synchronous memory sync */
@@ -53,8 +56,6 @@
 #define MADV_REMOVE	9		/* remove these pages & resources */
 #define MADV_DONTFORK	10		/* don't inherit across fork */
 #define MADV_DOFORK	11		/* do inherit across fork */
-#define MADV_HWPOISON	100		/* poison a page for testing */
-#define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */
 
 #define MADV_MERGEABLE   12		/* KSM may merge identical pages */
 #define MADV_UNMERGEABLE 13		/* KSM may not merge identical pages */
@@ -79,6 +80,9 @@
 
 #define MADV_COLLAPSE	25		/* Synchronous hugepage collapse */
 
+#define MADV_HWPOISON	100		/* poison a page for testing */
+#define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */
+
 /* compatibility flags */
 #define MAP_FILE	0
 
-- 
2.39.2


