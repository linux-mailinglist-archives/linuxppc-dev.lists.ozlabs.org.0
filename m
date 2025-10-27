Return-Path: <linuxppc-dev+bounces-13321-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A03C0C619
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 09:45:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw6Vx1xFQz3dWv;
	Mon, 27 Oct 2025 19:44:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761554649;
	cv=none; b=mYa8zA3QT+VaJPBYOFYIEoyn/Wfqxt3MWoiIkWGfNXkKr1bU9SiY9Z4wk7fhkuwuVZVAYHZwO+ea57UXoUPl058ApiRpn7HGR8FXCJtGGx9N9GP6LnzPFC+KNS8FWrJ0MBKndKJvIUBzojdi+QHPwelaH9Uw0Xf1P7mf57WfkF4PIi1kvutjaPeUea29lYis8i/tVYAAoPahm50V7nFzZ42Yw5Ro0r2RLSpY2fCFUNPWM0AAhTBkh4k4TmEov9d8EoiJzZIciyEv4vdph2vGMTV0Z97vxmPR7qcVhwTb8k73FrCHa0gKxHsN4ISwd/Dw4o9MmjXHlrhpm0h/TpXzTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761554649; c=relaxed/relaxed;
	bh=uuF1PbflRL7G3epzTRJvFK2AzVPBYAY82eKYUINaU84=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=EDtvcrxlOhgPDMKH2Evvf0KmUwCwrmKY6HjN0/MBvn+0kUjmpaOrh30iScDIaJ583ojOcR16R2CEUFLy4AG0Tf3I+QQmBFSdOMKZ9ZtGK7qC9ofgURhBzSoY0uZPXMSV/zfmlZ8b6EJLk8dFXwVds3CDyG996a/VmLTUqYf3AVhkwxiE4JW5112rJ6ymINhiM6Q2HSVhjFVGg9B+idTEjpl5azvqxfw4TeKqI/ASd1O7PfzO2V3kNEIrp+bmPdiPd9FeeiBdQII76rluPrFgAgqFPMmOXVZQMaPqCCfATbGZUI6A2UyLcnwD3Ht3OheF5LSkGH4S79BcRLK8kGz04g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XJp1D9/T; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7tqLdWfu; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XJp1D9/T;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7tqLdWfu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw6Vw0Wqhz3bcf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 19:44:08 +1100 (AEDT)
Message-ID: <20251027083745.799714344@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761554643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=uuF1PbflRL7G3epzTRJvFK2AzVPBYAY82eKYUINaU84=;
	b=XJp1D9/TPX0ZM7MIHCKed9tqeLgqSv/2F+apqKQDebqYn6NoPuN/KgyUGR7e9+Pb46cv7z
	PidFEGWYLqR5eMMBoAM5oKne2DNQrQtqnhAYM8P3M+C0njz6W7tSAUwWakDK7lkuC7hKUn
	4Y98eyJ1Wf91vEpfGdDB7ST9gnjTrgb4Dolb+fcAOSA9UaxhNkGcCUuLSu7NgE2YXw9Ggr
	8qJdqGMTrUsPkhzNn4k/mS4PBpWTdV/3G4wRCxNvdHKfTDchiv/BOu1s9hjAjN/oy4chY8
	8Zo/NMPt5F0WhtrkrKzONFyzP7XWX1fHqR0zHKeHhoHZXajxla+RO1Z1XiUNIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761554643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=uuF1PbflRL7G3epzTRJvFK2AzVPBYAY82eKYUINaU84=;
	b=7tqLdWfui9Z7ALY3gMC74wCiJZ4FeyGAeXFp+T4tRe0iTRQU/C1aRO5OvfbOePqeBzYzHC
	JnYYqYdj61kHXhBg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
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
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V5 11/12] x86/futex: Convert to scoped user access
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
Date: Mon, 27 Oct 2025 09:44:02 +0100 (CET)
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Replace the open coded implementation with the scoped user access
guards

No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: x86@kernel.org
---
V4: Rename once more
    Use asm_inline - Andrew
V3: Adapt to scope changes
V2: Convert to scoped masked access
    Use RW access functions - Christophe
---
 arch/x86/include/asm/futex.h |   75 ++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 42 deletions(-)
---
--- a/arch/x86/include/asm/futex.h
+++ b/arch/x86/include/asm/futex.h
@@ -46,38 +46,31 @@ do {								\
 } while(0)
 
 static __always_inline int arch_futex_atomic_op_inuser(int op, int oparg, int *oval,
-		u32 __user *uaddr)
+						       u32 __user *uaddr)
 {
-	if (can_do_masked_user_access())
-		uaddr = masked_user_access_begin(uaddr);
-	else if (!user_access_begin(uaddr, sizeof(u32)))
-		return -EFAULT;
-
-	switch (op) {
-	case FUTEX_OP_SET:
-		unsafe_atomic_op1("xchgl %0, %2", oval, uaddr, oparg, Efault);
-		break;
-	case FUTEX_OP_ADD:
-		unsafe_atomic_op1(LOCK_PREFIX "xaddl %0, %2", oval,
-				   uaddr, oparg, Efault);
-		break;
-	case FUTEX_OP_OR:
-		unsafe_atomic_op2("orl %4, %3", oval, uaddr, oparg, Efault);
-		break;
-	case FUTEX_OP_ANDN:
-		unsafe_atomic_op2("andl %4, %3", oval, uaddr, ~oparg, Efault);
-		break;
-	case FUTEX_OP_XOR:
-		unsafe_atomic_op2("xorl %4, %3", oval, uaddr, oparg, Efault);
-		break;
-	default:
-		user_access_end();
-		return -ENOSYS;
+	scoped_user_rw_access(uaddr, Efault) {
+		switch (op) {
+		case FUTEX_OP_SET:
+			unsafe_atomic_op1("xchgl %0, %2", oval, uaddr, oparg, Efault);
+			break;
+		case FUTEX_OP_ADD:
+			unsafe_atomic_op1(LOCK_PREFIX "xaddl %0, %2", oval, uaddr, oparg, Efault);
+			break;
+		case FUTEX_OP_OR:
+			unsafe_atomic_op2("orl %4, %3", oval, uaddr, oparg, Efault);
+			break;
+		case FUTEX_OP_ANDN:
+			unsafe_atomic_op2("andl %4, %3", oval, uaddr, ~oparg, Efault);
+			break;
+		case FUTEX_OP_XOR:
+			unsafe_atomic_op2("xorl %4, %3", oval, uaddr, oparg, Efault);
+			break;
+		default:
+			return -ENOSYS;
+		}
 	}
-	user_access_end();
 	return 0;
 Efault:
-	user_access_end();
 	return -EFAULT;
 }
 
@@ -86,21 +79,19 @@ static inline int futex_atomic_cmpxchg_i
 {
 	int ret = 0;
 
-	if (can_do_masked_user_access())
-		uaddr = masked_user_access_begin(uaddr);
-	else if (!user_access_begin(uaddr, sizeof(u32)))
-		return -EFAULT;
-	asm volatile("\n"
-		"1:\t" LOCK_PREFIX "cmpxchgl %3, %2\n"
-		"2:\n"
-		_ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_EFAULT_REG, %0) \
-		: "+r" (ret), "=a" (oldval), "+m" (*uaddr)
-		: "r" (newval), "1" (oldval)
-		: "memory"
-	);
-	user_access_end();
-	*uval = oldval;
+	scoped_user_rw_access(uaddr, Efault) {
+		asm_inline volatile("\n"
+				    "1:\t" LOCK_PREFIX "cmpxchgl %3, %2\n"
+				    "2:\n"
+				    _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_EFAULT_REG, %0)
+				    : "+r" (ret), "=a" (oldval), "+m" (*uaddr)
+				    : "r" (newval), "1" (oldval)
+				    : "memory");
+		*uval = oldval;
+	}
 	return ret;
+Efault:
+	return -EFAULT;
 }
 
 #endif


