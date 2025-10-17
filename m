Return-Path: <linuxppc-dev+bounces-12992-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38260BE7F6E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 12:10:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp0sk4FWCz3cnZ;
	Fri, 17 Oct 2025 21:09:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760695754;
	cv=none; b=RKsNG+AnO5EszYiTkEvfe2Y5RNWNP7N6uY3BWkddWra0jvl1xG1j7ntQMQ8ogHPDvmp18U5p6MPYr9YHCh8dHIg79GiZg9whBnXu0xzlSNaSqNL+H9EQt7KGu0z68zKJCWKscHxpHPygBLll1Ny+NCa6CzJdLSJ7pWC4F1GkHYyzr8Qqy8wbMNcvZ5EFxUF8z/wE/vW+I1x9aQmtNTXkxH1PtXcqBz8UhTJGR3gHZjS/2Is/pjXITQNvGtgOuU/5yQ5dkpa9s038QqjedLPcPxR3ucavICobrE9Y8CqXWd5HQwyVjR/tJn4sdsc/16mRueLr32l/Qdt8hI/fZWIiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760695754; c=relaxed/relaxed;
	bh=vd38qmen6NqGKwpBNmxeBxrmUMKgHzuu9w3FhQnzP9o=;
	h=Message-ID:From:To:Subject:References:MIME-Version:Content-Type:
	 cc:Date; b=XJpeTaItoKpaF9VqLnuVyWFQm31ymf7KdUHtW1EqiRhFpna7rns0FwRagWAbkwWzlhkI2XWOkcpyzyXlutijJp6EmGJPKZ0FCf8sC7zHrIibpk9BFB1tSQnv3bv8ZR2B+bbl5F2d3DaoajuEeXXWMHqNXUA9iTUV1PjPan0rPuDZH31fQI/n+mMuYEa6RBQaZaa4OO3J9FLRcndPfTjSdqDjZUulB4PlYMadPUVua9LHtd5AnHB8ymO7olL5YlM1YVLCx4qpj+vBsmuy6dtEKwKk15EdCrf8eS7Nm7TsSsZx7Xlh1ENTO97o/WjpK5IasIVxJ5QA8G2SZXlZPKjxmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JcAYfksQ; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=DnX8ZWmy; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JcAYfksQ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=DnX8ZWmy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp0sk0M10z3cl3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 21:09:14 +1100 (AEDT)
Message-ID: <20251017093030.315578108@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760695751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=vd38qmen6NqGKwpBNmxeBxrmUMKgHzuu9w3FhQnzP9o=;
	b=JcAYfksQjgseU6JQSYgkc8FtMvPTo+BADwor0oMs+Wk9DC39l2Coe+sbE7+SDOueo3i1gw
	JGzB712onYnG/ENdPxx83uMwA8j+HjvyScQpX1fYKd5Q17dKeeWxIiTfCL3yaPBBgYtJnH
	uxT5lmG/p6AnqJZto66uFkr03ODvm2yhfKyWqXt4x/QbgkX5jLrhxBYu7qGphXY5iJzhff
	zoDMEx2yQkwcNlf4yDJTV9VYxcYYVa3jqYOXQiu4upVIB8qxSdV6X4By3AdGKSX5BQaMpF
	xroG39Z+EO5YYcDq2HlRO5gltDwITYHsE485kHCPtUjH9mUI9sjTeWv64gY1Ng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760695751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=vd38qmen6NqGKwpBNmxeBxrmUMKgHzuu9w3FhQnzP9o=;
	b=DnX8ZWmywsPakWjMIvDYYLxa0MyU0uYz7SqZaZDlR9T/Fn9DUAXcsl7O4z6oJS67E42bZ8
	CqhlmgxJxTHEi3Cg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 08/12] uaccess: Provide put/get_user_masked()
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
Date: Fri, 17 Oct 2025 12:09:10 +0200 (CEST)
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Provide conveniance wrappers around scoped masked user access similiar to
put/get_user(), which reduce the usage sites to:

       if (!get_user_masked(val, ptr))
       		return -EFAULT;

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/uaccess.h |   44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -830,6 +830,50 @@ for (bool ____stop = false; !____stop; _
 #define scoped_masked_user_rw_access(_uptr, _elbl)				\
 	scoped_masked_user_rw_access_size((_uptr), sizeof(*(_uptr)), _elbl)
 
+/**
+ * get_user_masked - Read user data with masked access
+ * @_val:	The variable to store the value read from user memory
+ * @_usrc:	Pointer to the user space memory to read from
+ *
+ * Return: true if successful, false when faulted
+ */
+#define get_user_masked(_val, _usrc)				\
+({								\
+	__label__ efault;					\
+	typeof((_usrc)) _tmpsrc	= (_usrc);			\
+	bool ____ret = true;					\
+								\
+	scoped_masked_user_read_access(_tmpsrc, efault)		\
+		unsafe_get_user(_val, _tmpsrc, efault);		\
+	if (0) {						\
+	efault:							\
+		____ret = false;				\
+	}							\
+	____ret;						\
+})
+
+/**
+ * put_user_masked - Write to user memory with masked access
+ * @_val:	The value to write
+ * @_udst:	Pointer to the user space memory to write to
+ *
+ * Return: true if successful, false when faulted
+ */
+#define put_user_masked(_val, _udst)				\
+({								\
+	__label__ efault;					\
+	typeof((_udst)) _tmpdst	= (_udst);			\
+	bool ____ret = true;					\
+								\
+	scoped_masked_user_write_access(_tmpdst, efault)	\
+		unsafe_put_user(_val, _tmpdst, efault);		\
+	if (0) {						\
+	efault:							\
+		____ret = false;				\
+	}							\
+	____ret;						\
+})
+
 #ifdef CONFIG_HARDENED_USERCOPY
 void __noreturn usercopy_abort(const char *name, const char *detail,
 			       bool to_user, unsigned long offset,


