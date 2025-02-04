Return-Path: <linuxppc-dev+bounces-5805-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BACDBA270F8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 13:06:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnMXQ4s4jz2ytN;
	Tue,  4 Feb 2025 23:06:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738670774;
	cv=none; b=SwAP5sXpFKkDkUyu9kCQ6BcvLvC127+LgEUWW0E34u4tJMDvwqzfOT0GC/ZrC5f5TRawg30DNPFnPy2iTDLLAmWxzjSA0iTgJcHwmFrRBChotd0dTtr8naFJ/RRHY8J8o9F1sC/W80Rp5Dvgy/q2lXQeFWkCxXIdWJqsHKMWuz+YK2JXrIYsbzXAx0uCrZ9uOhCg7OXsWVXKpmdki5IaUJMWYSO3bt7qiBbXA6QCNwt28uou06Xoko32oh1rhn++8ZNo6IWz+i4i17rqphT1KCM22IYVLgSjOAaFynw/YbAWKanWbitb9XFVLeQgBvng8BYti34NUKrODgmqMqhc/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738670774; c=relaxed/relaxed;
	bh=8tzJ1joMpGHHtzyOpZkkHUWdfelYxBi+wFF4CRWn/mU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EB7l74WueS5eydPRTi23gzT3/pTS+QzBKMeuTA/rUF+1fNUF+2y2hU5Jby8qqinb4tbCX2Vr16tf9Df7AhytuVD6MCXWqBXpOzIpiAIJkOcnqq+RuwjsvHfyQJiafIy1FbdrC9I8IHtGoXEGNvbV/ChhyDaEnqyb5gspxsdVcfOFUhSYu2ALpjZprMcsfO/AQ+5YK/6Bm0/teWTWX7kqyBX7g8HAZbNq2kn0UhiVa2OYCC1De2eAYL6mQMuYmklgGNZ1l4zZmMiT+3N+IdpiTyE1LjE2fwDTtbwYeBO8n1vjqjy7TBFDtTmB1JW+r/oM/EPc20Of+NDCFNanGwc/lw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=V6j2Bzb2; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=iOtKH3os; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=V6j2Bzb2;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=iOtKH3os;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4YnMXN4SWvz2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2025 23:06:12 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738670767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8tzJ1joMpGHHtzyOpZkkHUWdfelYxBi+wFF4CRWn/mU=;
	b=V6j2Bzb2DRgaHKVvoWqEOL27zB3QtKLt4Ore8/SsczLQALyCenL5OFwapQzwhVdu9y3xpS
	cQZ+JuxIu/XEMKB1mzXgFUoT//0mHMJrlQ8TJjZwZo9zlNbx14A2PPb5aJBk1W5j89SAxb
	EVhLcE8hXrCivq28hrHiRQ1xEfuNLDPVNINkY4d9wRgP5UaeYmhW7aAoGtrfytI/i9/+vj
	a3kh1Nt9Zoanzv0bYnYotnou88oNxhxhBN1ygL6Zo1eAoEJkYzwj5+vPuPzCeR89CKaVSs
	SNewuZIe/x5/y5ufhjaVUvNysR6R/QcCwwGobQLPGhS/T8V4NEahAkE7SBq+JA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738670767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8tzJ1joMpGHHtzyOpZkkHUWdfelYxBi+wFF4CRWn/mU=;
	b=iOtKH3oskjcSYbCDgYKpSYB56t2sXU+wplGvT0jFC1YW0MQDUGoJvdNFOaiB4UvAdBeCPc
	PMh3pscdXS1SjCCA==
Date: Tue, 04 Feb 2025 13:05:35 +0100
Subject: [PATCH v3 03/18] vdso: Introduce vdso/align.h
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250204-vdso-store-rng-v3-3-13a4669dfc8c@linutronix.de>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
In-Reply-To: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, 
 Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-csky@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738670761; l=2181;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=pGC6jdjVpB6TSU5BlYOrn0adCU6n5QZjbS9JPsjrItg=;
 b=OW2mHbyRnxefuX9jtydaC4QPubDcM1IK1QS/suztcpEYCSk6R4TQGGJNZXsgYPfuJtL8zaYiV
 Ee44hOKuVaIBGyEHrG4dGlROwx8aYEK2YSDNoaAJcuGYVPNnBTi2GLG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The vDSO implementation can only include headers from the vdso/
namespace. To enable the usage of the ALIGN() macro from the vDSO, move
linux/align.h to vdso/align.h wholly.
As the only dependency linux/const.h is only a wrapper around
vdso/const.h anyways adapt that dependency.

Also provide a compatibility wrapper linux/align.h.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/linux/align.h | 10 +---------
 include/vdso/align.h  | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/include/linux/align.h b/include/linux/align.h
index 2b4acec7b95a27b6768d48f46519abc584c94d5d..55debf105a5d610c592e5c53a4153018ea1ae2c6 100644
--- a/include/linux/align.h
+++ b/include/linux/align.h
@@ -2,14 +2,6 @@
 #ifndef _LINUX_ALIGN_H
 #define _LINUX_ALIGN_H
 
-#include <linux/const.h>
-
-/* @a is a power of 2 value */
-#define ALIGN(x, a)		__ALIGN_KERNEL((x), (a))
-#define ALIGN_DOWN(x, a)	__ALIGN_KERNEL((x) - ((a) - 1), (a))
-#define __ALIGN_MASK(x, mask)	__ALIGN_KERNEL_MASK((x), (mask))
-#define PTR_ALIGN(p, a)		((typeof(p))ALIGN((unsigned long)(p), (a)))
-#define PTR_ALIGN_DOWN(p, a)	((typeof(p))ALIGN_DOWN((unsigned long)(p), (a)))
-#define IS_ALIGNED(x, a)		(((x) & ((typeof(x))(a) - 1)) == 0)
+#include <vdso/align.h>
 
 #endif	/* _LINUX_ALIGN_H */
diff --git a/include/vdso/align.h b/include/vdso/align.h
new file mode 100644
index 0000000000000000000000000000000000000000..02dd8626b5c5aa59d2ee0b15799b6e9adb343f65
--- /dev/null
+++ b/include/vdso/align.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __VDSO_ALIGN_H
+#define __VDSO_ALIGN_H
+
+#include <vdso/const.h>
+
+/* @a is a power of 2 value */
+#define ALIGN(x, a)		__ALIGN_KERNEL((x), (a))
+#define ALIGN_DOWN(x, a)	__ALIGN_KERNEL((x) - ((a) - 1), (a))
+#define __ALIGN_MASK(x, mask)	__ALIGN_KERNEL_MASK((x), (mask))
+#define PTR_ALIGN(p, a)		((typeof(p))ALIGN((unsigned long)(p), (a)))
+#define PTR_ALIGN_DOWN(p, a)	((typeof(p))ALIGN_DOWN((unsigned long)(p), (a)))
+#define IS_ALIGNED(x, a)		(((x) & ((typeof(x))(a) - 1)) == 0)
+
+#endif	/* __VDSO_ALIGN_H */

-- 
2.48.1


