Return-Path: <linuxppc-dev+bounces-13318-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61232C0C604
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 09:44:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw6Vp5PTKz3dW0;
	Mon, 27 Oct 2025 19:44:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761554642;
	cv=none; b=cWqiux6FZd0Q2k5GlUtIQp+T+Rr4kItqqbeVPTr1WJ2FUw0fiURc96ncg1hGCLWzfHwqRW1eLl2x+r4+qVETRh2vEFISEKHNn915b9jBs1maT+U8KgFZjj6E9A8MUfPmc8N1mWCPnst+E44HzfZVVWdelBS1XR5TRTKH5B9ykwZWNhJ0xvJPddPrPB4N5rlAMOqb9rkX/dNYFt8H4iXRVkWbf3YZ1u+rsAPaAX3lYlSaOqTkIo/h1Zps1J43Qqu3yinYIvFNoh+LT1678alBHY2wzP6KcSWOebx6aX0iipOXSbLx9RK+JpECjanpT30FDCh86m3ktjUN4RgxzQ8Jfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761554642; c=relaxed/relaxed;
	bh=as4pbOCxyeTzYGzifOoPeMiju/LrgMig7nFy3Mj05oM=;
	h=Message-ID:From:To:Subject:References:MIME-Version:Content-Type:
	 cc:Date; b=oVwXdH51vTlOqt30Hhhurr/Y1ZD9s86yITfifCllIuPkOdKspO1L7bfIdkrKlH7DpMsyv+MnfOG4+4wS5Z61vTTcS04GRVDJuwDk+q+w9KNpAh3p4v7n0bOJveI7etSDyiG7CWVXO9k+LfegsBxaYvhw7znHBZfUofaeOAVa/qWOih0fCAaNMgJarvti3emLbZhq4wwpXO/6JMeGYxvkreYBU5mRvOnayIjsyQIJc3k0JRKJT+IYkh5Fj39ysY3WnHn66VbNaB+1BbjFmx9fJvTEG/m5UTB4VtXX0UZj6q9rN18/z5h4myKG02RWE/yx7+Qs/frdaSH8ymdR0iArNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZVzA63Zc; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wry6l0Yw; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZVzA63Zc;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wry6l0Yw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw6Vp0ZwYz3dV4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 19:44:02 +1100 (AEDT)
Message-ID: <20251027083745.609031602@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761554638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=as4pbOCxyeTzYGzifOoPeMiju/LrgMig7nFy3Mj05oM=;
	b=ZVzA63ZcU5mloVrwo8+Jfcyohj0YpcWp8iDv0uosSTIGcM45Tl8yQXKTF3WdtzlsM1z+mJ
	f8TA9NOrPnTyPyVmugWaX5MxqCnytrkuKrBuLV26iaNZqxMEtBr6xJ45WTbOR/vB+3gzzV
	0jNCxcRcapxFnr3bWoJY97mTfcv5YEKGvo7Tq4oSQsHCMrQ6FBCAcYDG+ifbE9gMHosLHb
	zkzf0SDgTCLBEJJbQ1BEUmbtn9GjOI9CG6cUmFHccokGfgEJjy/2JkinfGlDNP8ioNLaW0
	dnn85SIAnHnJayOM5hUUKyanxcds+OjyyMzirFKdQw9EW1wOg2U3qD+4JnQUmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761554638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=as4pbOCxyeTzYGzifOoPeMiju/LrgMig7nFy3Mj05oM=;
	b=wry6l0YwTe1mHwd3wZkgxRkSddPV4gTf1dO6fAnvsK4rZdyFD/mI82Mc3upvCPaozRA33y
	FSBO9vnYcONdE5Dw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V5 08/12] uaccess: Provide put/get_user_inline()
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
cc: kernel test robot <lkp@intel.com>,
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
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Date: Mon, 27 Oct 2025 09:43:56 +0100 (CET)
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Provide conveniance wrappers around scoped user access similiar to
put/get_user(), which reduce the usage sites to:

       if (!get_user_inline(val, ptr))
       		return -EFAULT;

Should only be used if there is a demonstrable performance benefit.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V5: Rename to inline
V4: Rename to scoped
---
 include/linux/uaccess.h |   50 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -825,6 +825,56 @@ for (bool done = false; !done; done = tr
 #define scoped_user_rw_access(uptr, elbl)				\
 	scoped_user_rw_access_size(uptr, sizeof(*(uptr)), elbl)
 
+/**
+ * get_user_inline - Read user data inlined
+ * @val:	The variable to store the value read from user memory
+ * @usrc:	Pointer to the user space memory to read from
+ *
+ * Return: 0 if successful, -EFAULT when faulted
+ *
+ * Inlined variant of get_user(). Only use when there is a demonstrable
+ * performance reason.
+ */
+#define get_user_inline(val, usrc)				\
+({								\
+	__label__ efault;					\
+	typeof(usrc) _tmpsrc = usrc;				\
+	int _ret = 0;						\
+								\
+	scoped_user_read_access(_tmpsrc, efault)		\
+		unsafe_get_user(val, _tmpsrc, efault);		\
+	if (0) {						\
+	efault:							\
+		_ret = -EFAULT;					\
+	}							\
+	_ret;							\
+})
+
+/**
+ * put_user_inline - Write to user memory inlined
+ * @val:	The value to write
+ * @udst:	Pointer to the user space memory to write to
+ *
+ * Return: 0 if successful, -EFAULT when faulted
+ *
+ * Inlined variant of put_user(). Only use when there is a demonstrable
+ * performance reason.
+ */
+#define put_user_inline(val, udst)				\
+({								\
+	__label__ efault;					\
+	typeof(udst) _tmpdst = udst;				\
+	int _ret = 0;						\
+								\
+	scoped_user_write_access(_tmpdst, efault)		\
+		unsafe_put_user(val, _tmpdst, efault);		\
+	if (0) {						\
+	efault:							\
+		_ret = -EFAULT;					\
+	}							\
+	_ret;							\
+})
+
 #ifdef CONFIG_HARDENED_USERCOPY
 void __noreturn usercopy_abort(const char *name, const char *detail,
 			       bool to_user, unsigned long offset,


