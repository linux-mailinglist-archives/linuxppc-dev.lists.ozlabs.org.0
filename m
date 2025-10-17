Return-Path: <linuxppc-dev+bounces-12994-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE399BE7F77
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 12:10:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp0sr5L0Mz3d39;
	Fri, 17 Oct 2025 21:09:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760695760;
	cv=none; b=nE8dE/JkjH4t7rheCTz3Kab0RS9ZjBiJK1c7bL9L8Y98LepoTcOTfqfq1xRqw9S5jlmVrE04lFPzxqmYgTSfzgdfe/TlClgwOEntWBxe4PUsQmOJTFv66CuHKspr+HB/jqtpJIjLzNYa7ra096Wi/zbVUSFBPRDLQAnZ4cINEae3fAjTaQMzBKdD8Kz9XvW6Icz4tDCVaLkm8AI8DNI0XyFw2LXWHvasExLwapBE8TTZ7vt0oZ3kogIHX5FchGHgv7bLuz0OV6nt5TUciisy5YBaxQ0/PN8da0kZNqWMaOR7ll0cAZ6oFbkPJOP+GeWSwLz2/VLKLPrNofnD65LQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760695760; c=relaxed/relaxed;
	bh=kgiZQ2LHnoAuUeU4bAPUZQG9DpHKgtV5g2vXbnxY3WU=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=j0ztXjCVxYi5Q19mEmYUw+d1X/+KUBY9hb64efjo+ruwxXptqiduuaZeieJUnZNqhpIQoSrHIaUO211Oo2UKcESpXv2GMDFXs2mRyJdmDlMZetxem4TpqtlkUMROL9Zn2AAih1apC+6ATSHozL1oQUdZ3Z3esEvhw0a2VYukRM28YmFnsPfv4etx5lj5ljJtY8zPOp1CpfdI1oSvE/4TZyQqwd/t8I8HvmtuLDbaYv/lUFtRuB2bXNRKut1ToOnQe1frl1YhfMh6sXaFE2pyQRXryMMNM1VlDkDHFrEOPDPA1/7xpu+AnWnyFaIBYFDpcNcAv2veKvSGWo/kowvtWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=mpkjILJo; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=tdhXCPyA; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=mpkjILJo;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=tdhXCPyA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp0sr10l4z3cYG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 21:09:20 +1100 (AEDT)
Message-ID: <20251017093030.443142844@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760695755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=kgiZQ2LHnoAuUeU4bAPUZQG9DpHKgtV5g2vXbnxY3WU=;
	b=mpkjILJoMW+NxL7mj7Gkt8KfTdP8hlJpo2Od+7iroOPr22g6zAYrA6yUvqMmBvxNsIgubm
	CvGY3j5HuJ+GKdxHiPMjY9rCQ53bXOmVeodjH//fzeLUVju5Bb6VUVR8AgiWuur7rbvdkV
	gxn/pTETiDGuMBDkvtMVlTJDHVlPeeW33L6tqfdVc7PoE4GjPdtSjlMNaKd52hrDg2+tL7
	wUV768CPkGumlygCkw7AUUe6cdpax17aJuyAMZOir0K0ahKMAwQCDdK6KEUtEhAAp3+WlU
	17Zuy6C9rKn8fIYmyOjnpI4ODlq+tUAt8V9oX846q250RQEpr3Ctvv7+PvRq8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760695755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=kgiZQ2LHnoAuUeU4bAPUZQG9DpHKgtV5g2vXbnxY3WU=;
	b=tdhXCPyA4ZEVvsSHbhYKGj01qPJmkWPTgxxpK9M9rn0Kr9sE2FveZ1mXCHtQvUnuVlAgry
	ZcvdOvRAb0kTDZAw==
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
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V3 10/12] futex: Convert to scoped masked user access
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
Date: Fri, 17 Oct 2025 12:09:14 +0200 (CEST)
X-Spam-Status: No, score=-2.5 required=3.0 tests=CTE_8BIT_MISMATCH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Thomas Gleixner <tglx@linutronix.de>

Replace the open coded implementation with the new get/put_user_masked()
helpers.

No functional change intended

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>
Cc: "André Almeida" <andrealmeid@igalia.com>
---
V3: Adapt to scope changes
V2: Convert to scoped variant
---
 kernel/futex/futex.h |   37 ++-----------------------------------
 1 file changed, 2 insertions(+), 35 deletions(-)
---
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -285,48 +285,15 @@ static inline int futex_cmpxchg_value_lo
  * This does a plain atomic user space read, and the user pointer has
  * already been verified earlier by get_futex_key() to be both aligned
  * and actually in user space, just like futex_atomic_cmpxchg_inatomic().
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
  */
 static __always_inline int futex_get_value(u32 *dest, u32 __user *from)
 {
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
+	return get_user_masked(*dest, from) ? 0 : -EFAULT;
 }
 
 static __always_inline int futex_put_value(u32 val, u32 __user *to)
 {
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
+	return put_user_masked(val, to) ? 0 : -EFAULT;
 }
 
 static inline int futex_get_value_locked(u32 *dest, u32 __user *from)


