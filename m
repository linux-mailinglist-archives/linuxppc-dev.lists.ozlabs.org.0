Return-Path: <linuxppc-dev+bounces-13312-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E812DC0C5D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 09:44:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw6VZ6zdCz3cZL;
	Mon, 27 Oct 2025 19:43:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761554630;
	cv=none; b=OEYA7QldoHTOBrOYXzR/i82puJVVrIATIDdCgXC9LbtAGx8f0H6cJXovmt3spqU0YGr6hkUQhK45IY4jqiG6HcQLkukigTOpo2RhUWvHXNpwJjnNyf/w7u+VzZqdffplfZxJZJGTzWeXbgZk05bcDmlFFOb6hIf67trf8yqjmHHKWti5hE7L8Gkc+PAf8QNkwgHeSZYg8RLU3IB4rxOvfaXqNjWQkq6zgRmPLDvrYgZht8eS2rmUaBF9jg+PcWVqJ1J/br3UyZBPP4h3NxMi+P9vP+81xc3WorEkVfrXL9z625BVLrB3QOKys42WXd9pLNm03/i/ebVCGkI6AJgLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761554630; c=relaxed/relaxed;
	bh=riOmJf9FiDkmu6m5dlKP9M/8U5xAklSgvZrcN3Urpuk=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=B4jmP/4C2FKv4y8ClCi1DlGcc4zBgqc4u8Cwe6lzR9zNXj0wVPM1yulmQGHE1FlXr9pD6oYwWX7TN18xwdA8W+3CkVd2aa5Kv9RfcKpexU0nXPVvXB42MxWcjPPAcq/GK0tR1ttF6SayB/s/onszafN5RTVJMSNE/dbidM+xMuRivVhCdkBpUZP1VOfqC/KZcgXsHsvkmUkqe/xZaeHv3hhUPc4mqZxV5cKdzYFof/exAafm0CdU6rvpVZHttgHv+Q3X0YwsQlVc6R/vmlCOMAbVJZEhxXiVEbMbOpiu17KM7PBJpGq9nuaz/tb41o+oklgRilXfghAfrbenjIvXAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wrLk8rRx; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=omM8YhRj; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wrLk8rRx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=omM8YhRj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw6VZ1c3Wz3btd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 19:43:50 +1100 (AEDT)
Message-ID: <20251027083745.231716098@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761554625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=riOmJf9FiDkmu6m5dlKP9M/8U5xAklSgvZrcN3Urpuk=;
	b=wrLk8rRx2bNeKAaJl6WBftKZnkNPcrFYqCMAl/zJy/hCrLw0x4DaPvmCayDcz0lHmx2HzE
	vzo0Zk3NxXNDZ6q2pC7iPNy2ntJvVw9OShkKgFAMiaNFfiCpU2DI8tiJAxdVklCw/H28hY
	IRDQziyxREpuwwjEJt9/NN2o3FuavrClAWQ8fitEzUtuARFM4JA7jaV0zYBxtI4BkNeuv/
	hntSLtuLS8qszH8MmXznbM8THCI0y/kh9d1/xBWPLPQ5czT8xNYyc1imvf9Ien7pWVfG5I
	o9zMNLE/7GnlxahxsbHdlOZBYn4UkgRuQFELWLGxhsYKL9xg2HCU0f0wPWuRiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761554625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=riOmJf9FiDkmu6m5dlKP9M/8U5xAklSgvZrcN3Urpuk=;
	b=omM8YhRjGxfqHtY5RmR87E1nFdkMmoyTAWgP/CpURp6JaA/IJWtXzYJdgCjHkZcEYt0qvv
	qNJRCwuFncCHLMDA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
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
Subject: [patch V5 02/12] uaccess: Provide ASM GOTO safe wrappers for
 unsafe_*_user()
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
Date: Mon, 27 Oct 2025 09:43:44 +0100 (CET)
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

ASM GOTO is miscompiled by GCC when it is used inside a auto cleanup scope:

bool foo(u32 __user *p, u32 val)
{
	scoped_guard(pagefault)
		unsafe_put_user(val, p, efault);
	return true;
efault:
	return false;
}

 e80:	e8 00 00 00 00       	call   e85 <foo+0x5>
 e85:	65 48 8b 05 00 00 00 00 mov    %gs:0x0(%rip),%rax
 e8d:	83 80 04 14 00 00 01 	addl   $0x1,0x1404(%rax)   // pf_disable++
 e94:	89 37                	mov    %esi,(%rdi)
 e96:	83 a8 04 14 00 00 01 	subl   $0x1,0x1404(%rax)   // pf_disable--
 e9d:	b8 01 00 00 00       	mov    $0x1,%eax           // success
 ea2:	e9 00 00 00 00       	jmp    ea7 <foo+0x27>      // ret
 ea7:	31 c0                	xor    %eax,%eax           // fail
 ea9:	e9 00 00 00 00       	jmp    eae <foo+0x2e>      // ret

which is broken as it leaks the pagefault disable counter on failure.

Clang at least fails the build.

Linus suggested to add a local label into the macro scope and let that
jump to the actual caller supplied error label.

       	__label__ local_label;                                  \
        arch_unsafe_get_user(x, ptr, local_label);              \
	if (0) {                                                \
	local_label:                                            \
		goto label;                                     \

That works for both GCC and clang.

clang:

 c80:	0f 1f 44 00 00       	   nopl   0x0(%rax,%rax,1)	
 c85:	65 48 8b 0c 25 00 00 00 00 mov    %gs:0x0,%rcx
 c8e:	ff 81 04 14 00 00    	   incl   0x1404(%rcx)	   // pf_disable++
 c94:	31 c0                	   xor    %eax,%eax        // set retval to false
 c96:	89 37                      mov    %esi,(%rdi)      // write
 c98:	b0 01                	   mov    $0x1,%al         // set retval to true
 c9a:	ff 89 04 14 00 00    	   decl   0x1404(%rcx)     // pf_disable--
 ca0:	2e e9 00 00 00 00    	   cs jmp ca6 <foo+0x26>   // ret

The exception table entry points correctly to c9a

GCC:

 f70:   e8 00 00 00 00          call   f75 <baz+0x5>
 f75:   65 48 8b 05 00 00 00 00 mov    %gs:0x0(%rip),%rax
 f7d:   83 80 04 14 00 00 01    addl   $0x1,0x1404(%rax)  // pf_disable++
 f84:   8b 17                   mov    (%rdi),%edx
 f86:   89 16                   mov    %edx,(%rsi)
 f88:   83 a8 04 14 00 00 01    subl   $0x1,0x1404(%rax) // pf_disable--
 f8f:   b8 01 00 00 00          mov    $0x1,%eax         // success
 f94:   e9 00 00 00 00          jmp    f99 <baz+0x29>    // ret
 f99:   83 a8 04 14 00 00 01    subl   $0x1,0x1404(%rax) // pf_disable--
 fa0:   31 c0                   xor    %eax,%eax         // fail
 fa2:   e9 00 00 00 00          jmp    fa7 <baz+0x37>    // ret

The exception table entry points correctly to f99

So both compilers optimize out the extra goto and emit correct and
efficient code.

Provide a generic wrapper to do that to avoid modifying all the affected
architecture specific implementation with that workaround.

The only change required for architectures is to rename unsafe_*_user() to
arch_unsafe_*_user(). That's done in subsequent changes.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/uaccess.h |   72 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 4 deletions(-)

--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -518,7 +518,34 @@ long strncpy_from_user_nofault(char *dst
 		long count);
 long strnlen_user_nofault(const void __user *unsafe_addr, long count);
 
-#ifndef __get_kernel_nofault
+#ifdef arch_get_kernel_nofault
+/*
+ * Wrap the architecture implementation so that @label can be outside of a
+ * cleanup() scope. A regular C goto works correctly, but ASM goto does
+ * not. Clang rejects such an attempt, but GCC silently emits buggy code.
+ */
+#define __get_kernel_nofault(dst, src, type, label)		\
+do {								\
+	__label__ local_label;					\
+	arch_get_kernel_nofault(dst, src, type, local_label);	\
+	if (0) {						\
+	local_label:						\
+		goto label;					\
+	}							\
+} while (0)
+
+#define __put_kernel_nofault(dst, src, type, label)		\
+do {								\
+	__label__ local_label;					\
+	arch_get_kernel_nofault(dst, src, type, local_label);	\
+	if (0) {						\
+	local_label:						\
+		goto label;					\
+	}							\
+} while (0)
+
+#elif !defined(__get_kernel_nofault) /* arch_get_kernel_nofault */
+
 #define __get_kernel_nofault(dst, src, type, label)	\
 do {							\
 	type __user *p = (type __force __user *)(src);	\
@@ -535,7 +562,8 @@ do {							\
 	if (__put_user(data, p))			\
 		goto label;				\
 } while (0)
-#endif
+
+#endif  /* !__get_kernel_nofault */
 
 /**
  * get_kernel_nofault(): safely attempt to read from a location
@@ -549,7 +577,42 @@ do {							\
 	copy_from_kernel_nofault(&(val), __gk_ptr, sizeof(val));\
 })
 
-#ifndef user_access_begin
+#ifdef user_access_begin
+
+#ifdef arch_unsafe_get_user
+/*
+ * Wrap the architecture implementation so that @label can be outside of a
+ * cleanup() scope. A regular C goto works correctly, but ASM goto does
+ * not. Clang rejects such an attempt, but GCC silently emits buggy code.
+ *
+ * Some architectures use internal local labels already, but this extra
+ * indirection here is harmless because the compiler optimizes it out
+ * completely in any case. This construct just ensures that the ASM GOTO
+ * target is always in the local scope. The C goto 'label' works correct
+ * when leaving a cleanup() scope.
+ */
+#define unsafe_get_user(x, ptr, label)			\
+do {							\
+	__label__ local_label;				\
+	arch_unsafe_get_user(x, ptr, local_label);	\
+	if (0) {					\
+	local_label:					\
+		goto label;				\
+	}						\
+} while (0)
+
+#define unsafe_put_user(x, ptr, label)			\
+do {							\
+	__label__ local_label;				\
+	arch_unsafe_put_user(x, ptr, local_label);	\
+	if (0) {					\
+	local_label:					\
+		goto label;				\
+	}						\
+} while (0)
+#endif /* arch_unsafe_get_user */
+
+#else /* user_access_begin */
 #define user_access_begin(ptr,len) access_ok(ptr, len)
 #define user_access_end() do { } while (0)
 #define unsafe_op_wrap(op, err) do { if (unlikely(op)) goto err; } while (0)
@@ -559,7 +622,8 @@ do {							\
 #define unsafe_copy_from_user(d,s,l,e) unsafe_op_wrap(__copy_from_user(d,s,l),e)
 static inline unsigned long user_access_save(void) { return 0UL; }
 static inline void user_access_restore(unsigned long flags) { }
-#endif
+#endif /* !user_access_begin */
+
 #ifndef user_write_access_begin
 #define user_write_access_begin user_access_begin
 #define user_write_access_end user_access_end


