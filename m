Return-Path: <linuxppc-dev+bounces-12996-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED63FBE7F89
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 12:10:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp0sv0qzyz3d96;
	Fri, 17 Oct 2025 21:09:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760695763;
	cv=none; b=KzDHO1h2pgOrOBqaDVXUJ2ylgH7N6yyDxXPVnIRBGbYyTNlPYzxz+6zt1fegxlPB1STbstAyEufnnzN5NAn1cuQGvbBcHoCh4qdZOY0pskfC6akihkXij8Mzch3H62ntn/RmFftzbnX/kTgkU/1WjsAJXz/biloKNiFLfgJ7NOw2wcsdjgt6nfD1h1OuldYO/nhQpPO4tFwWIXyqjvzIcPC4Alj0NM9MjR9N8EE41qWClsCYn+LpbixMGa9s+Oa0uT1gz83MPtjbaowKJELlcHGvXuPwDXMHlCzRedW/WlYXi+TjMjFVrJsrLUKa9hqgGr/Yhjmnn9EUz1jocPxDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760695763; c=relaxed/relaxed;
	bh=imtHkr/s1EgDhFpHdqDFKeA7fLJRHDRNr716F17Aia0=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=SqFUu62sxPUy6STe0hoHlRpAE18Eecaapg7zoJNJCSiklRcw9K0Xsie33DhnhU6kRTY0wd/GSD6EMc2Pwbih8Y7bnEVmR2I4k58dsYYdmm1eqgBSMZcIWvQ3ZECm4HcTPAJFYCvQ6bvCdlPJM3pJSkaPfSk2mLnm3AHXtS+y1cU0+ctImkkqiK0FTxMEOVsPg2p3ZLG76E8vj1I50Dh3dG9MJ8F9IGxlUyQlPIctDKhuR1OY8aA01bmAffb5ELX3deD25dowJGOEoOSSdu91VyCcYSTC+ohLH7uN9kJgRN5IX9TY7fULq3cQn3G8EkpXu7QTYd5OCtQQG8fp4RUIAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IxmzYTBf; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=tXLovSJd; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IxmzYTBf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=tXLovSJd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp0st3z6Hz3d8G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 21:09:22 +1100 (AEDT)
Message-ID: <20251017093030.506939239@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760695757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=imtHkr/s1EgDhFpHdqDFKeA7fLJRHDRNr716F17Aia0=;
	b=IxmzYTBfKeP9PdlygwW7c3ZP9RsEre+9I9Ey2tCdF2r4gM5hRSxvZOgB2ZLVGOdPGXmKU1
	+c28eI+CQpneZgUdj/lriB9ag5dTOGtuqXD15nxa5UXlpIpMczCKiocdjT0TVrERWiHUyx
	B1W1XHif/HWSLsDJ1nx87OhoXNRPlg8O5YXz2UGSMHh3EdLm4J1Uj7udO1S/MhoJ2JUuwm
	YRwTS4vWjwKj+jetDYmTFxWTdSdvwVOj336LD4FgupH+XPVMUYSslfG3wlPbFb8EhUw/kW
	9X4Sd0io6pZfWY+0dDBIBCP78dmmq/qY+yUiuFO6HoBDI1YBYics9RbbUuLpQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760695757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=imtHkr/s1EgDhFpHdqDFKeA7fLJRHDRNr716F17Aia0=;
	b=tXLovSJd0rwq2r5yozTcKThhOnpAdq0BuaTsusGQM16gqfWgKUw8QGS1yKgXpz/pjSKgCv
	yXO1lDz+ddt6kiAA==
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
Subject: [patch V3 11/12] x86/futex: Convert to scoped masked user access
References: <20251017085938.150569636@linutronix.de>
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
Date: Fri, 17 Oct 2025 12:09:16 +0200 (CEST)
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Replace the open coded implementation with the scoped masked user access
guards

No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: x86@kernel.org
---
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
+	scoped_masked_user_rw_access(uaddr, Efault) {
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
+	scoped_masked_user_rw_access(uaddr, Efault) {
+		asm volatile("\n"
+			     "1:\t" LOCK_PREFIX "cmpxchgl %3, %2\n"
+			     "2:\n"
+			     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_EFAULT_REG, %0) \
+			     : "+r" (ret), "=a" (oldval), "+m" (*uaddr)
+			     : "r" (newval), "1" (oldval)
+			     : "memory");
+		*uval = oldval;
+	}
 	return ret;
+Efault:
+	return -EFAULT;
 }
 
 #endif


