Return-Path: <linuxppc-dev+bounces-1594-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DA29867FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2024 23:07:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDTnL2dDYz2yRd;
	Thu, 26 Sep 2024 07:07:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727298422;
	cv=none; b=A+TGcKo58HBFJHRRbZHSH1bOP74wWZazFkCOYEQIBqG9p50QfH8cnfTeek7L8EuL5cF6GKZ84WRSKfP2nSaS/RSwWvcwb3Dm85W/Fd9NUoUsksZoUGag+5dGelG97Sp89ZlLEayx9SaWlx48GNBY+/rdb/nTXhi8//H9bqbkZ7zBJvK88SKbQYSErFzoKFOAeNQpMkVShA95058OJ0hvm37vNPxcbwsW3RyDmvTv+Uavp6wULNh2FCbM8gzwhsbH7Su3Ua2mBffWVlV2SBbYobH31yWgf7G8tEFcqwV4m6IAlvADPF93C02j+6yhlURTbxU0HSIuO4dI1bdGCsDHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727298422; c=relaxed/relaxed;
	bh=LZWgvSs8WYd5k0d0lYjKx0d8XJrjDOoCZi+hv931QmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e32bTr/zGbtX781lDbCX/FU8wXaWsI7svLiPXoKLn5kMLMvl3PPeTui1nCZq4eE/vFx6wtJZE9iAZ9+ipkOdXbs9qXbwx7popignszK+MeI4zzsUH6uZa/BPyMXXdojky6gVW8kfFVpF0/dzLLnEyXzf4yV6Pt3xzinvkF+cFyvmz77cp1txbfpv7rKwRiT9cvZTs/8ulsgaW7uqCtVTJ2B9SkALhCTurI62Hz+hSPsUKXR6MfcweFN33/UvwsO9gjxtLS9dHP5qyD601cNZxiiA/EuDHVOra7zePXPyiEqslVkOwFMjU2sd1ZmawzGmZ/af82SvGiDpjDjsMI2Rvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CRpxihM2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CRpxihM2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDTnK6RBGz2yRM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 07:07:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B3466A44891;
	Wed, 25 Sep 2024 21:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E531C4CED0;
	Wed, 25 Sep 2024 21:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727298417;
	bh=aDTBkkmG/d5Qp4dQ7xLc1aEeqRGIp1tx3y3paI2l9us=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CRpxihM2e75tM0Bh7zwLgE2iWB1Q2C6WpoDxjva8iJOMC6oBQya5HroXk55JEfyL6
	 LhjXW/qeEZjcui5rJxrOXW/tJdtmU5D2uxIw05LxKdH12WAJXUQPIdWZx6zFsptgmp
	 9joJA1ZZdNbpONn+zIm4gbqFyJdy0QZIFDugku4mPLkjRJ25aOdb+/1/nuVpPb4jSK
	 AGPijvaPFQ2Md/TDhVdXCRs4LeLobDmZpuYYLQsHtn19s+mGW9Dy41pZhjWzY8BlhR
	 TOovGap+DgQ3DclxvFnyhOOd29bwhFogwsWqcvNyjLBk8WZgYvncO9pF0QaPo4U+On
	 6ud7LUq7AR7ZA==
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
Subject: [PATCH 2/5] asm-generic: move MAP_* flags from mman-common.h to mman.h
Date: Wed, 25 Sep 2024 21:06:12 +0000
Message-Id: <20240925210615.2572360-3-arnd@kernel.org>
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

powerpc and sparc include asm-generic/mman-common.h to get the MAP_* flags
0x008000 through 0x4000000, but those flags are all different on alpha,
mips, parisc and xtensa.

Add duplicate definitions for these along with the MAP_* flags for 0x100
through 0x4000 that are already different on powerpc and sparc, as a
preparation for actually sharing mman-common.h with all architectures.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/include/uapi/asm/mman.h   | 16 ++++++++++++++++
 arch/sparc/include/uapi/asm/mman.h     | 15 +++++++++++++++
 include/uapi/asm-generic/mman-common.h | 16 ----------------
 include/uapi/asm-generic/mman.h        | 21 +++++++++++++++++++++
 include/uapi/linux/mman.h              |  5 +++++
 5 files changed, 57 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/mman.h b/arch/powerpc/include/uapi/asm/mman.h
index c0c737215b00..d57b347c37fe 100644
--- a/arch/powerpc/include/uapi/asm/mman.h
+++ b/arch/powerpc/include/uapi/asm/mman.h
@@ -13,6 +13,11 @@
 
 #define PROT_SAO	0x10		/* Strong Access Ordering */
 
+/* 0x01 - 0x03 are defined in linux/mman.h */
+#define MAP_TYPE	0x0f		/* Mask for type of mapping */
+#define MAP_FIXED	0x10		/* Interpret addr exactly */
+#define MAP_ANONYMOUS	0x20		/* don't use a file */
+
 #define MAP_RENAME      MAP_ANONYMOUS   /* In SunOS terminology */
 #define MAP_NORESERVE   0x40            /* don't reserve swap pages */
 #define MAP_LOCKED	0x80
@@ -21,6 +26,17 @@
 #define MAP_DENYWRITE	0x0800		/* ETXTBSY */
 #define MAP_EXECUTABLE	0x1000		/* mark it as an executable */
 
+#define MAP_POPULATE		0x008000	/* populate (prefault) pagetables */
+#define MAP_NONBLOCK		0x010000	/* do not block on IO */
+#define MAP_STACK		0x020000	/* give out an address that is best suited for process/thread stacks */
+#define MAP_HUGETLB		0x040000	/* create a huge page mapping */
+#define MAP_SYNC		0x080000 /* perform synchronous page faults for the mapping */
+#define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
+
+#define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
+					 * uninitialized */
+
+
 
 #define MCL_CURRENT     0x2000          /* lock all currently mapped pages */
 #define MCL_FUTURE      0x4000          /* lock all additions to address space */
diff --git a/arch/sparc/include/uapi/asm/mman.h b/arch/sparc/include/uapi/asm/mman.h
index cec9f4109687..afb86698cdb1 100644
--- a/arch/sparc/include/uapi/asm/mman.h
+++ b/arch/sparc/include/uapi/asm/mman.h
@@ -8,6 +8,11 @@
 
 #define PROT_ADI	0x10		/* ADI enabled */
 
+/* 0x01 - 0x03 are defined in linux/mman.h */
+#define MAP_TYPE	0x0f		/* Mask for type of mapping */
+#define MAP_FIXED	0x10		/* Interpret addr exactly */
+#define MAP_ANONYMOUS	0x20		/* don't use a file */
+
 #define MAP_RENAME      MAP_ANONYMOUS   /* In SunOS terminology */
 #define MAP_NORESERVE   0x40            /* don't reserve swap pages */
 #define MAP_INHERIT     0x80            /* SunOS doesn't do this, but... */
@@ -18,6 +23,16 @@
 #define MAP_DENYWRITE	0x0800		/* ETXTBSY */
 #define MAP_EXECUTABLE	0x1000		/* mark it as an executable */
 
+#define MAP_POPULATE		0x008000	/* populate (prefault) pagetables */
+#define MAP_NONBLOCK		0x010000	/* do not block on IO */
+#define MAP_STACK		0x020000	/* give out an address that is best suited for process/thread stacks */
+#define MAP_HUGETLB		0x040000	/* create a huge page mapping */
+#define MAP_SYNC		0x080000 /* perform synchronous page faults for the mapping */
+#define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
+
+#define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
+					 * uninitialized */
+
 #define MCL_CURRENT     0x2000          /* lock all currently mapped pages */
 #define MCL_FUTURE      0x4000          /* lock all additions to address space */
 #define MCL_ONFAULT	0x8000		/* lock all pages that are faulted in */
diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
index 792ad5599d9c..8d66d2dabaa8 100644
--- a/include/uapi/asm-generic/mman-common.h
+++ b/include/uapi/asm-generic/mman-common.h
@@ -17,22 +17,6 @@
 #define PROT_GROWSDOWN	0x01000000	/* mprotect flag: extend change to start of growsdown vma */
 #define PROT_GROWSUP	0x02000000	/* mprotect flag: extend change to end of growsup vma */
 
-/* 0x01 - 0x03 are defined in linux/mman.h */
-#define MAP_TYPE	0x0f		/* Mask for type of mapping */
-#define MAP_FIXED	0x10		/* Interpret addr exactly */
-#define MAP_ANONYMOUS	0x20		/* don't use a file */
-
-/* 0x0100 - 0x4000 flags are defined in asm-generic/mman.h */
-#define MAP_POPULATE		0x008000	/* populate (prefault) pagetables */
-#define MAP_NONBLOCK		0x010000	/* do not block on IO */
-#define MAP_STACK		0x020000	/* give out an address that is best suited for process/thread stacks */
-#define MAP_HUGETLB		0x040000	/* create a huge page mapping */
-#define MAP_SYNC		0x080000 /* perform synchronous page faults for the mapping */
-#define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
-
-#define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
-					 * uninitialized */
-
 /*
  * Flags for mlock
  */
diff --git a/include/uapi/asm-generic/mman.h b/include/uapi/asm-generic/mman.h
index 57e8195d0b53..f26f9b4c03e1 100644
--- a/include/uapi/asm-generic/mman.h
+++ b/include/uapi/asm-generic/mman.h
@@ -4,12 +4,33 @@
 
 #include <asm-generic/mman-common.h>
 
+/*
+ * 0x01 - 0x03 are defined in linux/mman.h
+ * 0x04 - 0x200000 are architecture specific
+ * 0x200000 - 0x2000000 are available for common assignments in linux/mman.h
+ * 0x4000000 - 0x80000000 are used for hugepage encodings
+ */
+#define MAP_TYPE	0x0f		/* Mask for type of mapping */
+#define MAP_FIXED	0x10		/* Interpret addr exactly */
+#define MAP_ANONYMOUS	0x20		/* don't use a file */
+
 #define MAP_GROWSDOWN	0x0100		/* stack-like segment */
 #define MAP_DENYWRITE	0x0800		/* ETXTBSY */
 #define MAP_EXECUTABLE	0x1000		/* mark it as an executable */
 #define MAP_LOCKED	0x2000		/* pages are locked */
 #define MAP_NORESERVE	0x4000		/* don't check for reservations */
 
+#define MAP_POPULATE		0x008000	/* populate (prefault) pagetables */
+#define MAP_NONBLOCK		0x010000	/* do not block on IO */
+#define MAP_STACK		0x020000	/* give out an address that is best suited for process/thread stacks */
+#define MAP_HUGETLB		0x040000	/* create a huge page mapping */
+#define MAP_SYNC		0x080000 /* perform synchronous page faults for the mapping */
+#define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
+
+#define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
+					 * uninitialized */
+
+
 /*
  * Bits [26:31] are reserved, see asm-generic/hugetlb_encode.h
  * for MAP_HUGETLB usage
diff --git a/include/uapi/linux/mman.h b/include/uapi/linux/mman.h
index e89d00528f2f..b70cb06dd7ef 100644
--- a/include/uapi/linux/mman.h
+++ b/include/uapi/linux/mman.h
@@ -18,6 +18,11 @@
 #define MAP_PRIVATE	0x02		/* Changes are private */
 #define MAP_SHARED_VALIDATE 0x03	/* share + validate extension flags */
 #define MAP_DROPPABLE	0x08		/* Zero memory under memory pressure. */
+/*
+ * 0x10 through 0x200000 are used for architecture specific definitions
+ * in asm/mman.h, numbers 0x400000 through 0x2000000 are currently
+ * available on all architectures.
+ */
 
 /*
  * Huge page size encoding when MAP_HUGETLB is specified, and a huge page
-- 
2.39.2


