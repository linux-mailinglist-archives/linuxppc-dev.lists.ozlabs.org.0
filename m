Return-Path: <linuxppc-dev+bounces-2180-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB32699BE5C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 05:54:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRjzS46Xhz3bg1;
	Mon, 14 Oct 2024 14:54:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728878084;
	cv=none; b=fhD1kqhnX1qhxDTXHYOCKSevc1tKakYfjJ/AAnhiN1pvBRM5a+lhse/qMSOlB31pkd5G2RA7D6ppEBF6mWCng65yn9kjUaiY8U6QKQ3dc1V2O2W2wLxzAB5JxZ4vyW/v85KjSbaJpwpspkYsblNXeCSwWarBt5Vxpp3WkBe3JkfTJ3oRiKk4m3f8KrdTZ7wJVhdAnBPJkYyttF+wO4pkFk0qsX9MwDRs45rvib506cpA821VfxZ2KBCS4AQxBB8FmXOxOQ7MbI83/w+FCUIuqYPp9Xs54q3WfBkHEsPtesNW2P5V4EwTQVWcaL6OMZ0AtsVIztbStFz4uF/jFh1rLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728878084; c=relaxed/relaxed;
	bh=TW5+eL3qEB7mA0ejStuMk3U64QqRzcmreODrqdl6LDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDjjMo25PavP5sqcPlwT7EFNMo9OhwGrTsUIceV/jrMFL6Lbt/S2FyXsp1p8kZTUH+C4ca+AV01eRB8petUlIn+Fj/ASDmgJsdXo2WSW7JV78PnI5trneFUMPshPFR4oSF4g4X5gB8wTd4CLban3ykCxY0ZQvObEyi4YI4YwHYuWHzFaRttwedH9kEuxI6FLY0sFr6ZCgl8uhfA8m21jcudSpAiCNZkeVEe91/ubGSdUenZ2q7bQig1FXJgpM0oRDsaKueMwnLU9bCUlJSmef529C5dx0CUfRrFlVikclnlu5m0+IRzo5DMQAXD8Ija0syLoCo+GT8dqEoj7y4MYDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TE175B1S; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TE175B1S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRjzR1FxHz3bft
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 14:54:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2348F5C0601;
	Mon, 14 Oct 2024 03:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1B4C4CEC3;
	Mon, 14 Oct 2024 03:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728878080;
	bh=sPWkivVv6tUkMHSu75aQfiP9gLFEpw0I4kh7IXcmqIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TE175B1SxJde/Kbfyx7IpZbnV0C9eZQQEI3ruS3xctbs8WmgbCPwJzuPZTJqfiN7H
	 2Xy3bDvWtzhEETGZnjrVh4dpVuMIpICduM2gXWwtQRox8tFdL1pce4yukOTqZsWIMb
	 2WkFyxy2HGEUFK/AlRyO3nu9csGvnDwmm+p3eHyaaa3yLl3atyuWa7YVEyL+905AVw
	 6SP2c0pyFOfg8fNlHO3CzPkVKPv3MMQL35njEuuObWhfl7MOtrciptqzg2QOER+6fV
	 cQdcP4/RS0miOj6BdRh90VZOV1y7wtyOtY/5J1fignGE7SYfpXq3kNasaizUcDTnFQ
	 e6R4gyKRIcaPw==
Date: Sun, 13 Oct 2024 22:54:36 -0500
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Message-ID: <20241014035436.nsleqolyj3xxysrr@treble>
References: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com>
 <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
 <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com>
 <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Oct 12, 2024 at 06:21:12PM -0700, Linus Torvalds wrote:
> On Sat, 12 Oct 2024 at 17:53, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > So no, the address masking can not depend on things like
> > __VIRTUAL_MASK_SHIFT, it would need to at least take LAM into account
> > too. Not that I know if there are any CPU's out there that actually
> > have LAM enabled.

If I understand correctly, LAM bits are for the benefit of SW and are
ignored by HW?  Can we just mask those bits off?

> And at least judging by the performance of STAC/CLAC on my machines,
> those instructions will likely have stopped any speculation cold.
> 
> So maybe the "what is the actual cycle latency of detecting the
> faulting instruction" really is the core question here.

I think I remember reading that STAC/CLAC can't necessarily be relied on
as a speculation barrier, depending on microarchitectural details.  It
might be safest to assume we can't rely on that.  Masking is relatively
cheap anyway.

It sounds like we may need to go back to a more traditional access_ok()
which masks off the LAM bits (right?) and then compares with
TASK_SIZE_MAX.  While TASK_SIZE_MAX is no longer necessarily a
compile-time constant for the CONFIG_X86_5LEVEL case, it's no worse than
a single "mov" instruction in task_size_max().

So far I have something like the below which is completely untested and
probably actively wrong in some places.

diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/uaccess_64.h
index 39199eef26be..92c9f2847217 100644
--- a/arch/x86/include/asm/uaccess_64.h
+++ b/arch/x86/include/asm/uaccess_64.h
@@ -50,57 +50,43 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm,
  * The virtual address space space is logically divided into a kernel
  * half and a user half.  When cast to a signed type, user pointers
  * are positive and kernel pointers are negative.
+ *
+ * TODO make sure users are taking AMD non-canonical bit speculation bug into
+ *      account
  */
 #define valid_user_address(x) ((__force long)(x) >= 0)
 
+#ifndef untagged_addr
+#define untagged_addr(addr) (addr)
+#endif
+
+static inline bool __access_ok(const void __user *ptr, unsigned long size)
+{
+	unsigned long addr = (__force unsigned long)untagged_addr(ptr);
+	unsigned long limit = TASK_SIZE_MAX;
+
+	return (size <= limit) && addr <= (limit - size);
+}
+#define __access_ok __access_ok
+
+/*
+ * Called after access_ok(), so architecturally this is a valid user pointer.
+ * Force it that way for the speculative case.
+ */
+#define mask_user_address(x) \
+	((typeof(x))((__force unsigned long)(x) & ((1UL << __VIRTUAL_MASK_SHIFT) - 1)))
+
 /*
  * Masking the user address is an alternative to a conditional
  * user_access_begin that can avoid the fencing. This only works
  * for dense accesses starting at the address.
  */
-#define mask_user_address(x) ((typeof(x))((long)(x)|((long)(x)>>63)))
-#define masked_user_access_begin(x) ({				\
-	__auto_type __masked_ptr = (x);				\
-	__masked_ptr = mask_user_address(__masked_ptr);		\
-	__uaccess_begin(); __masked_ptr; })
-
-/*
- * User pointers can have tag bits on x86-64.  This scheme tolerates
- * arbitrary values in those bits rather then masking them off.
- *
- * Enforce two rules:
- * 1. 'ptr' must be in the user half of the address space
- * 2. 'ptr+size' must not overflow into kernel addresses
- *
- * Note that addresses around the sign change are not valid addresses,
- * and will GP-fault even with LAM enabled if the sign bit is set (see
- * "CR3.LAM_SUP" that can narrow the canonicality check if we ever
- * enable it, but not remove it entirely).
- *
- * So the "overflow into kernel addresses" does not imply some sudden
- * exact boundary at the sign bit, and we can allow a lot of slop on the
- * size check.
- *
- * In fact, we could probably remove the size check entirely, since
- * any kernel accesses will be in increasing address order starting
- * at 'ptr', and even if the end might be in kernel space, we'll
- * hit the GP faults for non-canonical accesses before we ever get
- * there.
- *
- * That's a separate optimization, for now just handle the small
- * constant case.
- */
-static inline bool __access_ok(const void __user *ptr, unsigned long size)
+static __must_check __always_inline void __user *masked_user_access_begin(void __user *ptr, size_t len)
 {
-	if (__builtin_constant_p(size <= PAGE_SIZE) && size <= PAGE_SIZE) {
-		return valid_user_address(ptr);
-	} else {
-		unsigned long sum = size + (__force unsigned long)ptr;
-
-		return valid_user_address(sum) && sum >= (__force unsigned long)ptr;
-	}
+	if (unlikely(!__access_ok(ptr,len)))
+		return (__force void __user *)NULL;
+	return mask_user_address(ptr);
 }
-#define __access_ok __access_ok
 
 /*
  * Copy To/From Userspace
diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
index 094224ec9dca..7e09708642e2 100644
--- a/arch/x86/lib/getuser.S
+++ b/arch/x86/lib/getuser.S
@@ -35,14 +35,16 @@
 #include <asm/asm.h>
 #include <asm/smap.h>
 
-#define ASM_BARRIER_NOSPEC ALTERNATIVE "", "lfence", X86_FEATURE_LFENCE_RDTSC
-
-.macro check_range size:req
+.macro check_range size:req check=1
 .if IS_ENABLED(CONFIG_X86_64)
-	mov %rax, %rdx		/* mask_user_address() */
-	sar $63, %rdx
-	or %rdx, %rax
-.else
+	// FIXME take size into account?
+	ALTERNATIVE "movq $0x7fffffffffff, %rdx", "movq $0xffffffffffffff, %rdx", X86_FEATURE_LA57
+.if \check == 1
+	cmp %rdx, %rax		/* access_ok() */
+	ja .Lbad_get_user
+.endif
+	and %rdx, %rax		/* mask_user_address() */
+.else	/* 32 bit */
 	cmp $TASK_SIZE_MAX-\size+1, %eax
 	jae .Lbad_get_user
 	sbb %edx, %edx		/* array_index_mask_nospec() */
@@ -105,10 +107,10 @@ SYM_FUNC_START(__get_user_8)
 SYM_FUNC_END(__get_user_8)
 EXPORT_SYMBOL(__get_user_8)
 
-/* .. and the same for __get_user, just without the range checks */
+/* .. and the same for __get_user, just without the access_ok() checks */
 SYM_FUNC_START(__get_user_nocheck_1)
+	check_range size=1 check=0
 	ASM_STAC
-	ASM_BARRIER_NOSPEC
 	UACCESS movzbl (%_ASM_AX),%edx
 	xor %eax,%eax
 	ASM_CLAC
@@ -117,8 +119,8 @@ SYM_FUNC_END(__get_user_nocheck_1)
 EXPORT_SYMBOL(__get_user_nocheck_1)
 
 SYM_FUNC_START(__get_user_nocheck_2)
+	check_range size=2 check=0
 	ASM_STAC
-	ASM_BARRIER_NOSPEC
 	UACCESS movzwl (%_ASM_AX),%edx
 	xor %eax,%eax
 	ASM_CLAC
@@ -127,8 +129,8 @@ SYM_FUNC_END(__get_user_nocheck_2)
 EXPORT_SYMBOL(__get_user_nocheck_2)
 
 SYM_FUNC_START(__get_user_nocheck_4)
+	check_range size=4 check=0
 	ASM_STAC
-	ASM_BARRIER_NOSPEC
 	UACCESS movl (%_ASM_AX),%edx
 	xor %eax,%eax
 	ASM_CLAC
@@ -137,8 +139,8 @@ SYM_FUNC_END(__get_user_nocheck_4)
 EXPORT_SYMBOL(__get_user_nocheck_4)
 
 SYM_FUNC_START(__get_user_nocheck_8)
+	check_range size=8 check=0
 	ASM_STAC
-	ASM_BARRIER_NOSPEC
 #ifdef CONFIG_X86_64
 	UACCESS movq (%_ASM_AX),%rdx
 #else
diff --git a/arch/x86/lib/putuser.S b/arch/x86/lib/putuser.S
index 09b7e37934ab..dde3b7825717 100644
--- a/arch/x86/lib/putuser.S
+++ b/arch/x86/lib/putuser.S
@@ -32,12 +32,15 @@
  * as they get called from within inline assembly.
  */
 
-.macro check_range size:req
+.macro check_range size:req check=1
 .if IS_ENABLED(CONFIG_X86_64)
-	mov %rcx, %rbx		/* mask_user_address() */
-	sar $63, %rbx
-	or %rbx, %rcx
-.else
+	ALTERNATIVE "movq $0x7fffffffffff, %rdx", "movq $0xffffffffffffff, %rdx", X86_FEATURE_LA57
+.if \check == 1
+	cmp %rdx, %rax		/* access_ok() */
+	ja .Lbad_put_user
+.endif
+	and %rdx, %rax		/* mask_user_address() */
+.else	/* 32 bit */
 	cmp $TASK_SIZE_MAX-\size+1, %ecx
 	jae .Lbad_put_user
 .endif
@@ -55,6 +58,7 @@ SYM_FUNC_END(__put_user_1)
 EXPORT_SYMBOL(__put_user_1)
 
 SYM_FUNC_START(__put_user_nocheck_1)
+	check_range size=1 check=0
 	ASM_STAC
 2:	movb %al,(%_ASM_CX)
 	xor %ecx,%ecx
@@ -74,6 +78,7 @@ SYM_FUNC_END(__put_user_2)
 EXPORT_SYMBOL(__put_user_2)
 
 SYM_FUNC_START(__put_user_nocheck_2)
+	check_range size=2 check=0
 	ASM_STAC
 4:	movw %ax,(%_ASM_CX)
 	xor %ecx,%ecx
@@ -93,6 +98,7 @@ SYM_FUNC_END(__put_user_4)
 EXPORT_SYMBOL(__put_user_4)
 
 SYM_FUNC_START(__put_user_nocheck_4)
+	check_range size=4 check=0
 	ASM_STAC
 6:	movl %eax,(%_ASM_CX)
 	xor %ecx,%ecx
@@ -115,6 +121,7 @@ SYM_FUNC_END(__put_user_8)
 EXPORT_SYMBOL(__put_user_8)
 
 SYM_FUNC_START(__put_user_nocheck_8)
+	check_range size=8 check=0
 	ASM_STAC
 9:	mov %_ASM_AX,(%_ASM_CX)
 #ifdef CONFIG_X86_32
diff --git a/fs/select.c b/fs/select.c
index a77907faf2b4..2ca7ad555342 100644
--- a/fs/select.c
+++ b/fs/select.c
@@ -777,9 +777,11 @@ static inline int get_sigset_argpack(struct sigset_argpack *to,
 {
 	// the path is hot enough for overhead of copy_from_user() to matter
 	if (from) {
-		if (can_do_masked_user_access())
-			from = masked_user_access_begin(from);
-		else if (!user_read_access_begin(from, sizeof(*from)))
+		if (can_do_masked_user_access()) {
+			from = masked_user_access_begin(from, sizeof(*from));
+			if (!from)
+				return -EFAULT;
+		} else if (!user_read_access_begin(from, sizeof(*from)))
 			return -EFAULT;
 		unsafe_get_user(to->p, &from->p, Efault);
 		unsafe_get_user(to->size, &from->size, Efault);
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index dda9725a9559..fe11b3fb755a 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -37,7 +37,7 @@
  #define can_do_masked_user_access() 1
 #else
  #define can_do_masked_user_access() 0
- #define masked_user_access_begin(src) NULL
+ #define masked_user_access_begin(ptr, len) NULL
 #endif
 
 /*
diff --git a/lib/strncpy_from_user.c b/lib/strncpy_from_user.c
index 989a12a67872..ce5eaaed2365 100644
--- a/lib/strncpy_from_user.c
+++ b/lib/strncpy_from_user.c
@@ -120,15 +120,6 @@ long strncpy_from_user(char *dst, const char __user *src, long count)
 	if (unlikely(count <= 0))
 		return 0;
 
-	if (can_do_masked_user_access()) {
-		long retval;
-
-		src = masked_user_access_begin(src);
-		retval = do_strncpy_from_user(dst, src, count, count);
-		user_read_access_end();
-		return retval;
-	}
-
 	max_addr = TASK_SIZE_MAX;
 	src_addr = (unsigned long)untagged_addr(src);
 	if (likely(src_addr < max_addr)) {
@@ -144,11 +135,17 @@ long strncpy_from_user(char *dst, const char __user *src, long count)
 
 		kasan_check_write(dst, count);
 		check_object_size(dst, count, false);
-		if (user_read_access_begin(src, max)) {
-			retval = do_strncpy_from_user(dst, src, count, max);
-			user_read_access_end();
-			return retval;
+		if (can_do_masked_user_access()) {
+			src = masked_user_access_begin(src, max);
+			if (!src)
+				return -EFAULT;
+		} else if (!user_read_access_begin(src, max)) {
+			return -EFAULT;
 		}
+
+		retval = do_strncpy_from_user(dst, src, count, max);
+		user_read_access_end();
+		return retval;
 	}
 	return -EFAULT;
 }
diff --git a/lib/strnlen_user.c b/lib/strnlen_user.c
index 6e489f9e90f1..c6066906704a 100644
--- a/lib/strnlen_user.c
+++ b/lib/strnlen_user.c
@@ -96,15 +96,6 @@ long strnlen_user(const char __user *str, long count)
 	if (unlikely(count <= 0))
 		return 0;
 
-	if (can_do_masked_user_access()) {
-		long retval;
-
-		str = masked_user_access_begin(str);
-		retval = do_strnlen_user(str, count, count);
-		user_read_access_end();
-		return retval;
-	}
-
 	max_addr = TASK_SIZE_MAX;
 	src_addr = (unsigned long)untagged_addr(str);
 	if (likely(src_addr < max_addr)) {
@@ -118,11 +109,17 @@ long strnlen_user(const char __user *str, long count)
 		if (max > count)
 			max = count;
 
-		if (user_read_access_begin(str, max)) {
-			retval = do_strnlen_user(str, count, max);
-			user_read_access_end();
-			return retval;
+		if (can_do_masked_user_access()) {
+			str = masked_user_access_begin(str, max);
+			if (!str)
+				return 0;
+		} else if (!user_read_access_begin(str, max)) {
+			   return 0;
 		}
+
+		retval = do_strnlen_user(str, count, max);
+		user_read_access_end();
+		return retval;
 	}
 	return 0;
 }

