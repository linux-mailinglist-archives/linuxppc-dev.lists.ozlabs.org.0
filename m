Return-Path: <linuxppc-dev+bounces-13319-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAF6C0C607
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 09:45:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw6Vr6BfSz3dWx;
	Mon, 27 Oct 2025 19:44:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761554644;
	cv=none; b=af+BMk4RRNFBeAwH2Xlq0/7i3ji/R7vVSvsAQqkAsRwWuf33tfJ0AfQoZql/pyPq+r2pA5jwcUYfXoixe/apHQR7HCcXzyskVQHc66h1LungxWL2ierwTjzNZYXNxS4vxol8TBeh5989B06nBTR+mBSZQUkjtevhDANXdEsVERKS3c2UTWdfUI5qT0EEfEGlTYP5lUbTzW341SJibJ4wKwI3dC5PiuJzLNOwo4IwAPR69kBvF2oY0FIp99pmhrnScijpegWhs63yNzfjb2Ga0v/Mp5ICnNymf89EQMVK1ECAizDfsd+Dy+VLzlnElHVtrUJxj3fc8FOcabGNv3MRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761554644; c=relaxed/relaxed;
	bh=435+37KhAU0mhng1XnAbeS2nHoeU+rxEjwbVMsKftxA=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=PUcOEokFe4/zChqR0ubmrdZFPPd8o5lz2PWkXDJ7UlRy7k86Y/g1ppkmZmPLyHM0VMCNZXLef6D7Mi6wJQJS8s1Tdv6RGqZKVupLtftklFh7sLj8AF5fL7/3OL/x83pTFxSUzZ7FXECByWDqWQ115GHI2A3lSOFjaMDpHsTm3Ae1V75F2LHi3RJUn543704oB/7rKS4ecaI015h8TMl/ok6q/wL21WqQbmQKZICb1MSxpYTjEhUyeiYGtEbocCib51ojp6wvd+MoEWv8IRKYrpY8f8jgO7QGJQE6PscC4NOh+fAOdGad5PfZbCn0Uyugh/6sdz3Kv2gvhwousXJdSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=I4Kw5Ywe; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5fUpbazZ; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=I4Kw5Ywe;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5fUpbazZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw6Vr1RlBz3dV4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 19:44:04 +1100 (AEDT)
Message-ID: <20251027083745.736737934@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761554641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=435+37KhAU0mhng1XnAbeS2nHoeU+rxEjwbVMsKftxA=;
	b=I4Kw5Ywek/IX9WMSt/JXEa6snrzGFocVq/IjZtkNm1ANMjiG+drhyzT6KMpNFoZ81+hpq6
	7eExgfokt10EBfmMcQQqV3fHS7o+tZ1wKnuLPw3dhoCmS+7DNc4GlQebCPGHmHeHNEXGGv
	dHUpqGVUsaIl7lhAhzePlzvZ9TZmCnQJkRaIhw6kSszp+Oe3T28gR/NmuCpMOdRMmdbgWK
	49R4Iz46M9aRnw8O5tqYDlJeRDC1t10xoiAaSTGN43wU0DwX72QRSrd7bLWPPaoJLnpDRt
	WsrcrnhgR+2dkKcsStXQmlVjHMHAgmZ8OHZztJdfAQhnJWROQZ2fWyeT4rsVLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761554641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=435+37KhAU0mhng1XnAbeS2nHoeU+rxEjwbVMsKftxA=;
	b=5fUpbazZrmkMXN7jn9+9G33jFnKwKg6Vab+X7NXNyTTxhdWjb/TPTSoWsl2TtGRcijzTye
	9yPo5IrGwO3RP/DA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V5 10/12] futex: Convert to get/put_user_inline()
References: <20251027083700.573016505@linutronix.de>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 09:44:00 +0100 (CET)
X-Spam-Status: No, score=-1.8 required=3.0 tests=CTE_8BIT_MISMATCH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Thomas Gleixner <tglx@linutronix.de>

Replace the open coded implementation with the new get/put_user_inline()
helpers. This might be replaced by a regular get/put_user(), but that needs
a proper performance evaluation.

No functional change intended

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>
Cc: "André Almeida" <andrealmeid@igalia.com>
---
V5: Rename again and remove the helpers
V4: Rename once moar
V3: Adapt to scope changes
V2: Convert to scoped variant
---
 kernel/futex/core.c  |    4 +--
 kernel/futex/futex.h |   58 ++-------------------------------------------------
 2 files changed, 5 insertions(+), 57 deletions(-)
---
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -581,7 +581,7 @@ int get_futex_key(u32 __user *uaddr, uns
 	if (flags & FLAGS_NUMA) {
 		u32 __user *naddr = (void *)uaddr + size / 2;
 
-		if (futex_get_value(&node, naddr))
+		if (get_user_inline(node, naddr))
 			return -EFAULT;
 
 		if ((node != FUTEX_NO_NODE) &&
@@ -601,7 +601,7 @@ int get_futex_key(u32 __user *uaddr, uns
 			node = numa_node_id();
 			node_updated = true;
 		}
-		if (node_updated && futex_put_value(node, naddr))
+		if (node_updated && put_user_inline(node, naddr))
 			return -EFAULT;
 	}
 
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -281,63 +281,11 @@ static inline int futex_cmpxchg_value_lo
 	return ret;
 }
 
-/*
- * This does a plain atomic user space read, and the user pointer has
- * already been verified earlier by get_futex_key() to be both aligned
- * and actually in user space, just like futex_atomic_cmpxchg_inatomic().
- *
- * We still want to avoid any speculation, and while __get_user() is
- * the traditional model for this, it's actually slower than doing
- * this manually these days.
- *
- * We could just have a per-architecture special function for it,
- * the same way we do futex_atomic_cmpxchg_inatomic(), but rather
- * than force everybody to do that, write it out long-hand using
- * the low-level user-access infrastructure.
- *
- * This looks a bit overkill, but generally just results in a couple
- * of instructions.
- */
-static __always_inline int futex_get_value(u32 *dest, u32 __user *from)
-{
-	u32 val;
-
-	if (can_do_masked_user_access())
-		from = masked_user_access_begin(from);
-	else if (!user_read_access_begin(from, sizeof(*from)))
-		return -EFAULT;
-	unsafe_get_user(val, from, Efault);
-	user_read_access_end();
-	*dest = val;
-	return 0;
-Efault:
-	user_read_access_end();
-	return -EFAULT;
-}
-
-static __always_inline int futex_put_value(u32 val, u32 __user *to)
-{
-	if (can_do_masked_user_access())
-		to = masked_user_access_begin(to);
-	else if (!user_write_access_begin(to, sizeof(*to)))
-		return -EFAULT;
-	unsafe_put_user(val, to, Efault);
-	user_write_access_end();
-	return 0;
-Efault:
-	user_write_access_end();
-	return -EFAULT;
-}
-
+/* Read from user memory with pagefaults disabled */
 static inline int futex_get_value_locked(u32 *dest, u32 __user *from)
 {
-	int ret;
-
-	pagefault_disable();
-	ret = futex_get_value(dest, from);
-	pagefault_enable();
-
-	return ret;
+	guard(pagefault)();
+	return get_user_inline(*dest, from);
 }
 
 extern void __futex_unqueue(struct futex_q *q);


