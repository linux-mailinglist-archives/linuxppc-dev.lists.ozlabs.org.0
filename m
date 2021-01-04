Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F772E94DE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 13:31:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8Zjv5TDkzDqLM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 23:31:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8Zdz4CDwzDqB2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jan 2021 23:27:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=LU8GC11/; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4D8Zdz2nF0z9sTv; Mon,  4 Jan 2021 23:27:51 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4D8Zdz0LkCz9sVs; Mon,  4 Jan 2021 23:27:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1609763271;
 bh=v8wG597noNfuWICjVdBWzSu8L6bYdzednOXuYaV8Bmo=;
 h=From:To:Cc:Subject:Date:From;
 b=LU8GC11/wUmEVJMoE/TpTt42hD46k3xmSL2ev+vxfx4xhmkw/xSKDNjqj0F1i7YFe
 +e/Yp6p3hgJQASNp6cj66Cw8smUR5t8KpbJiiEIJELBPZfzC4KXmf58xIkcFDJnpVe
 LnQd2wpMDbAzr/x3m7pUAtkszdFhOqt8QxFPHyXxI95TTxnIKQUFITP7RMbunZKFW2
 I8H/ALbVUopEtdMrkdtYHnY2rNSiao3FnS6UhzGQhltClXoJ+hOpEFyJINBz7pF6Lt
 17gtXMNy9WvBjDoJB6PP3ujxSxLXLpltGiwsDFk6wJiIwPBn16FLz6wGyb0Prtn6d4
 WD7GPXYvpvVtA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: acme@redhat.com
Subject: [PATCH] tools headers UAPI: Sync linux/types.h with the kernel sources
Date: Mon,  4 Jan 2021 23:27:44 +1100
Message-Id: <20210104122744.4095768-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: daniel@iogearbox.net, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org,
 ast@kernel.org, vt@altlinux.org, andrii@kernel.org, yhs@fb.com, kafai@fb.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Unlike the other headers in tools/include/uapi/linux, types.h has
never been synced from the exported headers, instead it's been hand
written over time. This means it doesn't match the exported headers
which can cause build errors on some architectures.

For example on powerpc, tools/bpf doesn't build:

  $ make O=/build -C tools/bpf/
  make: Entering directory '/linux/tools/bpf'

  Auto-detecting system features:
  ...                        libbfd: [ on  ]
  ...        disassembler-four-args: [ on  ]

    CC       /build/bpf_jit_disasm.o
    LINK     /build/bpf_jit_disasm
    CC       /build/bpf_dbg.o
  In file included from /usr/include/powerpc64le-linux-gnu/asm/sigcontext.h:14,
                   from /usr/include/powerpc64le-linux-gnu/bits/sigcontext.h:30,
                   from /usr/include/signal.h:288,
                   from /linux/tools/bpf/bpf_dbg.c:51:
  /usr/include/powerpc64le-linux-gnu/asm/elf.h:160:9: error: unknown type name '__vector128'
    160 | typedef __vector128 elf_vrreg_t;
        |         ^~~~~~~~~~~
  make: *** [Makefile:67: /build/bpf_dbg.o] Error 1

This is because tools/include/uapi/linux/types.h doesn't include
asm/types.h, where __vector128 is defined in the powerpc headers.

We can fix it by syncing the tools header with the exported kernel
header, as is done for the other headers in tools/include/uapi/linux.

Reported-by: Vitaly Chikunov <vt@altlinux.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---

Earlier discussion: https://lore.kernel.org/netdev/20201024203040.4cjxnxrdy6qx557c@altlinux.org/

Build tested on powerpc and x86.
---
 tools/include/uapi/linux/types.h | 41 ++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/tools/include/uapi/linux/types.h b/tools/include/uapi/linux/types.h
index 91fa51a9c31d..999cb0fa88eb 100644
--- a/tools/include/uapi/linux/types.h
+++ b/tools/include/uapi/linux/types.h
@@ -1,11 +1,26 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _UAPI_LINUX_TYPES_H
-#define _UAPI_LINUX_TYPES_H
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _LINUX_TYPES_H
+#define _LINUX_TYPES_H
 
-#include <asm-generic/int-ll64.h>
+#include <asm/types.h>
+
+#ifndef __ASSEMBLY__
+
+#include <linux/posix_types.h>
+
+
+/*
+ * Below are truly Linux-specific types that should never collide with
+ * any application/library that wants linux/types.h.
+ */
+
+#ifdef __CHECKER__
+#define __bitwise__ __attribute__((bitwise))
+#else
+#define __bitwise__
+#endif
+#define __bitwise __bitwise__
 
-/* copied from linux:include/uapi/linux/types.h */
-#define __bitwise
 typedef __u16 __bitwise __le16;
 typedef __u16 __bitwise __be16;
 typedef __u32 __bitwise __le32;
@@ -16,8 +31,20 @@ typedef __u64 __bitwise __be64;
 typedef __u16 __bitwise __sum16;
 typedef __u32 __bitwise __wsum;
 
+/*
+ * aligned_u64 should be used in defining kernel<->userspace ABIs to avoid
+ * common 32/64-bit compat problems.
+ * 64-bit values align to 4-byte boundaries on x86_32 (and possibly other
+ * architectures) and to 8-byte boundaries on 64-bit architectures.  The new
+ * aligned_64 type enforces 8-byte alignment so that structs containing
+ * aligned_64 values have the same alignment on 32-bit and 64-bit architectures.
+ * No conversions are necessary between 32-bit user-space and a 64-bit kernel.
+ */
 #define __aligned_u64 __u64 __attribute__((aligned(8)))
 #define __aligned_be64 __be64 __attribute__((aligned(8)))
 #define __aligned_le64 __le64 __attribute__((aligned(8)))
 
-#endif /* _UAPI_LINUX_TYPES_H */
+typedef unsigned __bitwise __poll_t;
+
+#endif /*  __ASSEMBLY__ */
+#endif /* _LINUX_TYPES_H */
-- 
2.25.1

