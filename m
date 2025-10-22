Return-Path: <linuxppc-dev+bounces-13157-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7223ABFBEFD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 14:50:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cs8B42VS2z3dKn;
	Wed, 22 Oct 2025 23:49:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761137356;
	cv=none; b=JPZdUE1TtV1iVi04R3f6dElATjxkzLL+3CFfOFW0Q/ofAZYWMwa5VBOrZDYPhBQuuIt2X+jmA2Cz/y1A7Aa8o6xb2B7zokulYUFZ1t7cI/Jztdpu0nbY+UUjeCkcdxcLo2/odkVpQCw9kt9f0JCWoLlUnMmpiUj8vjwVOUIBleTcGJWqYsnuIkIysb+RG6uNPMI2KE4mdmuAlwAhRQP9yqMk1trFPPu0nPcwsitDiTZLsyO/TNxFUGc2kkkZqCJY/RHk08A6zAW5Uz4pB7O6s1ks0wzSLd2JH+83i0xx9Q6Hq3Pdha9aHO8rMSETqlA6ei8eboP6ztagphHwBuKBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761137356; c=relaxed/relaxed;
	bh=QD4vFggFMuOeGOcQhDOiteuemKWf4EcukV9nF7jSRjE=;
	h=Message-ID:From:To:Subject:References:MIME-Version:Content-Type:
	 cc:Date; b=fwFpGHg7p5IMrLIPQ8AL5H65UEluEHbTaw7LM2/mKmUYCjYvDIPNdrkCkREu15iBbOGpjDkDokL+8uFE6VRv3OSsiZ6Uslq4peXVPtVSJlhVQsyo2c16WW7WKHTelo5P3gcDgXWKo7a1mKYejF2T1S5YAoz5ASZB96xlgG5LoBulE7Rv8tQUxCgFdFO9gwyzEWZIYUkwTh8Hdpam5Z1//HDZH4ZiKlcFHm4bHOzS5UPFffUB1yjsLJSJyn4hCDeGKaJ9CwXpxsGGCyDfDsW+BMHstGJcMHfPkfyjEuugfx5V1+UD6bn5i+SSYSehgIvZp3NfPlqvu7kgTN4mOrCi5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=S//Em47h; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jNKXbM8s; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=S//Em47h;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jNKXbM8s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cs8B31mTGz3chF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 23:49:15 +1100 (AEDT)
Message-ID: <20251022103112.358808928@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761137352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=QD4vFggFMuOeGOcQhDOiteuemKWf4EcukV9nF7jSRjE=;
	b=S//Em47hao2SiEu4HhbNJvmg7y21pNf1gaVLrhJjCcmZbZo071nDxTNXRELCYqZoPooIxF
	ySg3zehiSqSGF/Zy/PoAZ0h0eWVHnK7p5NECvAG631LkvrKKpA02NnT8HJhQZpUPjjGdto
	DxLzSxnTExD3XmpQxp/1w9NAA1kCPWdDRNW5/s+Ed7BI6inW+w0EztY5DPaQKDxXkxI25m
	W2VKIMRifCPS/nvbDcv4t+ALLahmQ72ecuN0xD3h7xqOz54s2emMHzywywwyatoR89R+VO
	HWXCuuqWv5QLlnqsJgwt24DUtrnfgD83c17QYqwpHiorT55OZe+4eLnlakdUyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761137352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=QD4vFggFMuOeGOcQhDOiteuemKWf4EcukV9nF7jSRjE=;
	b=jNKXbM8s9KXys2skLRaFhNaomPmHf3yWyLJ+u2hte0dUfgf8E6lPCUahh/LtI3X0E3G6xz
	MQOaMMLQpwzewRAw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V4 08/12] uaccess: Provide put/get_user_scoped()
References: <20251022102427.400699796@linutronix.de>
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
Date: Wed, 22 Oct 2025 14:49:11 +0200 (CEST)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Provide conveniance wrappers around scoped user access similiar to
put/get_user(), which reduce the usage sites to:

       if (!get_user_scoped(val, ptr))
       		return -EFAULT;

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V4: Rename to scoped
---
 include/linux/uaccess.h |   44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -825,6 +825,50 @@ for (bool done = false; !done; done = tr
 #define scoped_user_rw_access(uptr, elbl)				\
 	scoped_user_rw_access_size(uptr, sizeof(*(uptr)), elbl)
 
+/**
+ * get_user_scoped - Read user data with scoped access
+ * @val:	The variable to store the value read from user memory
+ * @usrc:	Pointer to the user space memory to read from
+ *
+ * Return: true if successful, false when faulted
+ */
+#define get_user_scoped(val, usrc)				\
+({								\
+	__label__ efault;					\
+	typeof(usrc) _tmpsrc = usrc;				\
+	bool _ret = true;					\
+								\
+	scoped_user_read_access(_tmpsrc, efault)		\
+		unsafe_get_user(val, _tmpsrc, efault);		\
+	if (0) {						\
+	efault:							\
+		_ret = false;					\
+	}							\
+	_ret;							\
+})
+
+/**
+ * put_user_scoped - Write to user memory with scoped access
+ * @val:	The value to write
+ * @udst:	Pointer to the user space memory to write to
+ *
+ * Return: true if successful, false when faulted
+ */
+#define put_user_scoped(val, udst)				\
+({								\
+	__label__ efault;					\
+	typeof(udst) _tmpdst = udst;				\
+	bool _ret = true;					\
+								\
+	scoped_user_write_access(_tmpdst, efault)		\
+		unsafe_put_user(val, _tmpdst, efault);		\
+	if (0) {						\
+	efault:							\
+		_ret = false;					\
+	}							\
+	_ret;							\
+})
+
 #ifdef CONFIG_HARDENED_USERCOPY
 void __noreturn usercopy_abort(const char *name, const char *detail,
 			       bool to_user, unsigned long offset,


