Return-Path: <linuxppc-dev+bounces-1595-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E849867FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2024 23:07:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDTnR3w9Sz2yRM;
	Thu, 26 Sep 2024 07:07:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727298427;
	cv=none; b=FzXAmnDD/Jv2xWQtWAU5cZy1/LWq3+qOW4km0HAQJuxTvT8qmnyDVfqBuVvInKRitZk58iyICoweLobem9N3wXF/Vx462W2NVXaj9CYyqGFHjI8KeAIkY9ASF1arMhBtd/V8645PTrbAyQlTbJPR6jfUbBlg/m23k1qGkEtyNoZl7kfEabF75LG8ZpX0OGhq9tg/KnbOc+1LMc8EuM3i/hPRt3F9+uFH72hi2tIPtCRRzz6raLDr/5mgdoXmx4mkS0a38PQhZk1m6zK33guEvMQjPGf2z9G+/ktvkSzZM9+ZNqZE1+wCYN9jdkfsUMiNjV3OBWvBFJ8vJmzdmlh6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727298427; c=relaxed/relaxed;
	bh=y7lOXiSH2+1Fl6usjy0bDjunaHvstD+IZKLXDTMpzEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OmF8iZP6ggxSffLXjCeBYcCKX2sIjawOVbYE/7pfi7IHualVy0q4O9PIadV3XFLC08kELKF2eAvcuXvVA1ji46JUyH+To+qQSKp97lYazeGcOhoA7i9kr4VrEcr3MQYSzGJ2DnuOn/56nmDVJavtgKC4bCRujAU0N+BxEs9zSwQxOQXa4nHoUEVonM/mJfCFfvkQWBDvJYoXTwy3e2hu0Qp7YYLA0qqkmsVWnG5DLMM+il6DsiDs++o1koWATy1HjOmTu93MPa5xyztH5wSxykOqMkYDnRW45ae8WTAmTOr0XcJC01DrzphdABr3d+iHQEmngivaBfJMAVAbYGuD0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kdrlaTqv; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kdrlaTqv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDTnR0cHhz2yPR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 07:07:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A5038A44897;
	Wed, 25 Sep 2024 21:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7032FC4CEC7;
	Wed, 25 Sep 2024 21:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727298424;
	bh=0EXzYHjw9wueOmuWN8Ox5HAuCn8dFHsgBxy03Mw7iZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kdrlaTqvjNbs0lqNwZ1flSvr94VKx4Bff0mmaUe3SciSLDp7ecrYBocKzzLehfzYA
	 hiEVi+rpMBlv5UNrh+PU7Di6s6tuQr5oMZytGo359lRnjcKbC3W8p8cnP/PjapqluX
	 tT/MmOaT+h19VX2kZOzYP3guT3kfRosV6TVYLBXVAB97k7eIQkFfwU3dH1rBs2Mtmf
	 9iy6hiPNIP63o1kJFvI6b1f40YmdGDguMypPdXeumMIMpgiLA+flbGo5FsdGxj13Xz
	 /WjeFlSScH1pl11mv71fOFMfyJNspQIz96REsaHXkxt3MflXMa0hul4Gw4vqfNv6YY
	 TEe1ufNgcfMOQ==
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
Subject: [PATCH 3/5] asm-generic: use asm-generic/mman-common.h on mips and xtensa
Date: Wed, 25 Sep 2024 21:06:13 +0000
Message-Id: <20240925210615.2572360-4-arnd@kernel.org>
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

mips and xtensa have almost the same asm/mman.h, aside from an
unintentional difference in MAP_UNINITIALIZED that has no effect in
practice.

Now that the MAP_* flags are moved out of asm-generic/mman-common.h,
the only difference from the its contents and the mips/xtensa version
is the PROT_SEM definition that is one bit off from the rest.

Make the generic PROT_SEM definition conditional on it already being
defined and then include that header from both architectures, to
remove the bulk of the contents.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/alpha/include/uapi/asm/mman.h     |  2 +
 arch/mips/include/uapi/asm/mman.h      | 65 +------------------------
 arch/parisc/include/uapi/asm/mman.h    |  3 ++
 arch/xtensa/include/uapi/asm/mman.h    | 66 +-------------------------
 include/uapi/asm-generic/mman-common.h |  2 +
 5 files changed, 9 insertions(+), 129 deletions(-)

diff --git a/arch/alpha/include/uapi/asm/mman.h b/arch/alpha/include/uapi/asm/mman.h
index 8946a13ce858..1f1c03c047ce 100644
--- a/arch/alpha/include/uapi/asm/mman.h
+++ b/arch/alpha/include/uapi/asm/mman.h
@@ -5,7 +5,9 @@
 #define PROT_READ	0x1		/* page can be read */
 #define PROT_WRITE	0x2		/* page can be written */
 #define PROT_EXEC	0x4		/* page can be executed */
+#ifndef PROT_SEM /* different on mips and xtensa */
 #define PROT_SEM	0x8		/* page may be used for atomic ops */
+#endif
 /*			0x10		   reserved for arch-specific use */
 /*			0x20		   reserved for arch-specific use */
 #define PROT_NONE	0x0		/* page can not be accessed */
diff --git a/arch/mips/include/uapi/asm/mman.h b/arch/mips/include/uapi/asm/mman.h
index 399937cefaa6..6deb62db90de 100644
--- a/arch/mips/include/uapi/asm/mman.h
+++ b/arch/mips/include/uapi/asm/mman.h
@@ -9,15 +9,8 @@
 #ifndef _ASM_MMAN_H
 #define _ASM_MMAN_H
 
-#define PROT_READ	0x1		/* page can be read */
-#define PROT_WRITE	0x2		/* page can be written */
-#define PROT_EXEC	0x4		/* page can be executed */
 /*			0x8		   reserved for PROT_EXEC_NOFLUSH */
 #define PROT_SEM	0x10		/* page may be used for atomic ops */
-/*			0x20		   reserved for arch-specific use */
-#define PROT_NONE	0x0		/* page can not be accessed */
-#define PROT_GROWSDOWN	0x01000000	/* mprotect flag: extend change to start of growsdown vma */
-#define PROT_GROWSUP	0x02000000	/* mprotect flag: extend change to end of growsup vma */
 
 /* 0x01 - 0x03 are defined in linux/mman.h */
 #define MAP_TYPE	0x0f		/* Mask for type of mapping */
@@ -47,62 +40,6 @@
 #define MCL_FUTURE	2		/* lock all future mappings */
 #define MCL_ONFAULT	4		/* lock all pages that are faulted in */
 
-/*
- * Flags for mlock
- */
-#define MLOCK_ONFAULT	0x01		/* Lock pages in range after they are faulted in, do not prefault */
-
-/*
- * Flags for msync
- */
-#define MS_ASYNC	1		/* sync memory asynchronously */
-#define MS_INVALIDATE	2		/* invalidate the caches */
-#define MS_SYNC		4		/* synchronous memory sync */
-
-#define MADV_NORMAL	0		/* no further special treatment */
-#define MADV_RANDOM	1		/* expect random page references */
-#define MADV_SEQUENTIAL	2		/* expect sequential page references */
-#define MADV_WILLNEED	3		/* will need these pages */
-#define MADV_DONTNEED	4		/* don't need these pages */
-
-/* common parameters: try to keep these consistent across architectures */
-#define MADV_FREE	8		/* free pages only if memory pressure */
-#define MADV_REMOVE	9		/* remove these pages & resources */
-#define MADV_DONTFORK	10		/* don't inherit across fork */
-#define MADV_DOFORK	11		/* do inherit across fork */
-
-#define MADV_MERGEABLE   12		/* KSM may merge identical pages */
-#define MADV_UNMERGEABLE 13		/* KSM may not merge identical pages */
-
-#define MADV_HUGEPAGE	14		/* Worth backing with hugepages */
-#define MADV_NOHUGEPAGE	15		/* Not worth backing with hugepages */
-
-#define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
-					   overrides the coredump filter bits */
-#define MADV_DODUMP	17		/* Clear the MADV_DONTDUMP flag */
-
-#define MADV_WIPEONFORK 18		/* Zero memory on fork, child only */
-#define MADV_KEEPONFORK 19		/* Undo MADV_WIPEONFORK */
-
-#define MADV_COLD	20		/* deactivate these pages */
-#define MADV_PAGEOUT	21		/* reclaim these pages */
-
-#define MADV_POPULATE_READ	22	/* populate (prefault) page tables readable */
-#define MADV_POPULATE_WRITE	23	/* populate (prefault) page tables writable */
-
-#define MADV_DONTNEED_LOCKED	24	/* like DONTNEED, but drop locked pages too */
-
-#define MADV_COLLAPSE	25		/* Synchronous hugepage collapse */
-
-#define MADV_HWPOISON	100		/* poison a page for testing */
-#define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */
-
-/* compatibility flags */
-#define MAP_FILE	0
-
-#define PKEY_DISABLE_ACCESS	0x1
-#define PKEY_DISABLE_WRITE	0x2
-#define PKEY_ACCESS_MASK	(PKEY_DISABLE_ACCESS |\
-				 PKEY_DISABLE_WRITE)
+#include <asm-generic/mman-common.h>
 
 #endif /* _ASM_MMAN_H */
diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
index 80f4a55763a0..1cd5d816d4cf 100644
--- a/arch/parisc/include/uapi/asm/mman.h
+++ b/arch/parisc/include/uapi/asm/mman.h
@@ -2,10 +2,13 @@
 #ifndef __PARISC_MMAN_H__
 #define __PARISC_MMAN_H__
 
+
 #define PROT_READ	0x1		/* page can be read */
 #define PROT_WRITE	0x2		/* page can be written */
 #define PROT_EXEC	0x4		/* page can be executed */
+#ifndef PROT_SEM /* different on mips and xtensa */
 #define PROT_SEM	0x8		/* page may be used for atomic ops */
+#endif
 /*			0x10		   reserved for arch-specific use */
 /*			0x20		   reserved for arch-specific use */
 #define PROT_NONE	0x0		/* page can not be accessed */
diff --git a/arch/xtensa/include/uapi/asm/mman.h b/arch/xtensa/include/uapi/asm/mman.h
index ad6bc56a7aef..e713b8dc8587 100644
--- a/arch/xtensa/include/uapi/asm/mman.h
+++ b/arch/xtensa/include/uapi/asm/mman.h
@@ -11,19 +11,11 @@
  * Copyright (C) 1995 by Ralf Baechle
  * Copyright (C) 2001 - 2005 Tensilica Inc.
  */
-
 #ifndef _XTENSA_MMAN_H
 #define _XTENSA_MMAN_H
 
-#define PROT_READ	0x1		/* page can be read */
-#define PROT_WRITE	0x2		/* page can be written */
-#define PROT_EXEC	0x4		/* page can be executed */
 /*			0x8		   reserved for arch-specific use */
 #define PROT_SEM	0x10		/* page may be used for atomic ops */
-/*			0x20		   reserved for arch-specific use */
-#define PROT_NONE	0x0		/* page can not be accessed */
-#define PROT_GROWSDOWN	0x01000000	/* mprotect flag: extend change to start of growsdown vma */
-#define PROT_GROWSUP	0x02000000	/* mprotect flag: extend change to end of growsup vma */
 
 /* 0x01 - 0x03 are defined in linux/mman.h */
 #define MAP_TYPE	0x0f		/* Mask for type of mapping */
@@ -54,62 +46,6 @@
 #define MCL_FUTURE	2		/* lock all future mappings */
 #define MCL_ONFAULT	4		/* lock all pages that are faulted in */
 
-/*
- * Flags for mlock
- */
-#define MLOCK_ONFAULT	0x01		/* Lock pages in range after they are faulted in, do not prefault */
-
-/*
- * Flags for msync
- */
-#define MS_ASYNC	1		/* sync memory asynchronously */
-#define MS_INVALIDATE	2		/* invalidate the caches */
-#define MS_SYNC		4		/* synchronous memory sync */
-
-#define MADV_NORMAL	0		/* no further special treatment */
-#define MADV_RANDOM	1		/* expect random page references */
-#define MADV_SEQUENTIAL	2		/* expect sequential page references */
-#define MADV_WILLNEED	3		/* will need these pages */
-#define MADV_DONTNEED	4		/* don't need these pages */
-
-/* common parameters: try to keep these consistent across architectures */
-#define MADV_FREE	8		/* free pages only if memory pressure */
-#define MADV_REMOVE	9		/* remove these pages & resources */
-#define MADV_DONTFORK	10		/* don't inherit across fork */
-#define MADV_DOFORK	11		/* do inherit across fork */
-
-#define MADV_MERGEABLE   12		/* KSM may merge identical pages */
-#define MADV_UNMERGEABLE 13		/* KSM may not merge identical pages */
-
-#define MADV_HUGEPAGE	14		/* Worth backing with hugepages */
-#define MADV_NOHUGEPAGE	15		/* Not worth backing with hugepages */
-
-#define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
-					   overrides the coredump filter bits */
-#define MADV_DODUMP	17		/* Clear the MADV_DONTDUMP flag */
-
-#define MADV_WIPEONFORK 18		/* Zero memory on fork, child only */
-#define MADV_KEEPONFORK 19		/* Undo MADV_WIPEONFORK */
-
-#define MADV_COLD	20		/* deactivate these pages */
-#define MADV_PAGEOUT	21		/* reclaim these pages */
-
-#define MADV_POPULATE_READ	22	/* populate (prefault) page tables readable */
-#define MADV_POPULATE_WRITE	23	/* populate (prefault) page tables writable */
-
-#define MADV_DONTNEED_LOCKED	24	/* like DONTNEED, but drop locked pages too */
-
-#define MADV_COLLAPSE	25		/* Synchronous hugepage collapse */
-
-#define MADV_HWPOISON	100		/* poison a page for testing */
-#define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */
-
-/* compatibility flags */
-#define MAP_FILE	0
-
-#define PKEY_DISABLE_ACCESS	0x1
-#define PKEY_DISABLE_WRITE	0x2
-#define PKEY_ACCESS_MASK	(PKEY_DISABLE_ACCESS |\
-				 PKEY_DISABLE_WRITE)
+#include <asm-generic/mman-common.h>
 
 #endif /* _XTENSA_MMAN_H */
diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
index 8d66d2dabaa8..2911dd14ef2a 100644
--- a/include/uapi/asm-generic/mman-common.h
+++ b/include/uapi/asm-generic/mman-common.h
@@ -10,7 +10,9 @@
 #define PROT_READ	0x1		/* page can be read */
 #define PROT_WRITE	0x2		/* page can be written */
 #define PROT_EXEC	0x4		/* page can be executed */
+#ifndef PROT_SEM /* different on mips and xtensa */
 #define PROT_SEM	0x8		/* page may be used for atomic ops */
+#endif
 /*			0x10		   reserved for arch-specific use */
 /*			0x20		   reserved for arch-specific use */
 #define PROT_NONE	0x0		/* page can not be accessed */
-- 
2.39.2


