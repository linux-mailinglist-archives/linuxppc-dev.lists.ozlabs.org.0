Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D22540B46D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 18:20:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H87pt3q4vz305j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 02:19:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kSQFla5g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com;
 envelope-from=3estayqwkdcuoeftbvmojfsthpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=kSQFla5g; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H87p92wXtz2xg3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 02:19:11 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 j9-20020a2581490000b02905897d81c63fso17956296ybm.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 09:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Ruv7ezEWWdUTVVZLqSe78q272b/bMY/ySC1JyxSYFiY=;
 b=kSQFla5goeALrlJJglGShYI58OnYi8n8lNeZAQmsyOVFVcov0bfzPiR4j7C7zcM7Xw
 yF4vcfBZIj4YlKKiz0Hw8BAS0s7Aw82FbD2l7aicpd9Z9Xn4w+Rf7jz//DiZNgyQ+sgc
 ultxKeOLXVO/N6+ptCKiVQZQ7oFt/xiGP45U58XxuOp/yeCVMldlIzrFjmTfuoMhSdid
 bxGeZicGy2KfLRgi3u/cs8umaU5WfRH3SS8G7vy8Odqm3X+LkM697vxJXc0PVbxl2E3A
 ggv9l1lSvl2CRvTa1l6vH0h0iYrnO52Y1T8A8e77o6taqG1n5XS23SNvNMXGHBPk4n2b
 dp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Ruv7ezEWWdUTVVZLqSe78q272b/bMY/ySC1JyxSYFiY=;
 b=bkULAJbxZvRZ4iadtk6o2wLAFJu1Qa+E16oWN3LE5IzhTz5dI3+kL8TLvX5B4vUMhW
 VIU/C9Dqvxtpd1JtPb8hvUy4tJy56B/eczg8/T+ZlqxqiqB2Fgp+iqamnqiUdg3vgrHC
 OOzT+t00Oe/oIYdCuaCIlGcnsmREW41BIcSYzhJcciQc3pzJTEzKh7v4BIBB50zIpO4H
 UmXRdXAIuSxKou1Xq2qd1jVz3Zukx27Nx+oZ9wnTwJ0e9vQAbVHu6N3Pg4B/XTz6bMfz
 p5AZkwJFlG1WViJka8a9EqnbMgafmUIVQM0uG5Uo1x/nI4XrbEfl3G2ghnMixxPvAq9z
 IGrg==
X-Gm-Message-State: AOAM533MYuwOoqDg6taERfyTxwODqcqPAL1DoyNlfam4fg7TzBkXmz8e
 QoFwjoFJTjERlkL7eBT7cTPwsFIz9v2u/EjXEd4=
X-Google-Smtp-Source: ABdhPJw9RLm32EL4GnbLXlA33WVRSTqrf7sM0HxL6TI8e7GhDqbjh06RFLuyVaPPTR3C85JrmG1m7RxSH+8qBqmTWRo=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:15c:211:202:4780:ab8c:bb56:31d6])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6902:1002:: with SMTP id
 w2mr21614613ybt.183.1631636346725; Tue, 14 Sep 2021 09:19:06 -0700 (PDT)
Date: Tue, 14 Sep 2021 09:17:04 -0700
Message-Id: <20210914161712.2463458-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH] powerpc: clean up UPD_CONSTR
From: Nick Desaulniers <ndesaulniers@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org,
 "Christopher M. Riedl" <cmr@codefail.de>,
 Nathan Chancellor <nathan@kernel.org>, Paul Mackerras <paulus@samba.org>,
 kvm-ppc@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

UPD_CONSTR was previously a preprocessor define for an old GCC 4.9 inline
asm bug with m<> constraints.

Fixes: 6563139d90ad ("powerpc: remove GCC version check for UPD_CONSTR")
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/powerpc/include/asm/asm-const.h | 2 --
 arch/powerpc/include/asm/atomic.h    | 8 ++++----
 arch/powerpc/include/asm/io.h        | 4 ++--
 arch/powerpc/include/asm/uaccess.h   | 6 +++---
 arch/powerpc/kvm/powerpc.c           | 4 ++--
 5 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-const.h b/arch/powerpc/include/asm/asm-const.h
index dbfa5e1e3198..bfb3c3534877 100644
--- a/arch/powerpc/include/asm/asm-const.h
+++ b/arch/powerpc/include/asm/asm-const.h
@@ -12,6 +12,4 @@
 #  define ASM_CONST(x)		__ASM_CONST(x)
 #endif
 
-#define UPD_CONSTR "<>"
-
 #endif /* _ASM_POWERPC_ASM_CONST_H */
diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
index 6a53ef178bfd..fd594fdbd84d 100644
--- a/arch/powerpc/include/asm/atomic.h
+++ b/arch/powerpc/include/asm/atomic.h
@@ -27,14 +27,14 @@ static __inline__ int arch_atomic_read(const atomic_t *v)
 {
 	int t;
 
-	__asm__ __volatile__("lwz%U1%X1 %0,%1" : "=r"(t) : "m"UPD_CONSTR(v->counter));
+	__asm__ __volatile__("lwz%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
 
 	return t;
 }
 
 static __inline__ void arch_atomic_set(atomic_t *v, int i)
 {
-	__asm__ __volatile__("stw%U0%X0 %1,%0" : "=m"UPD_CONSTR(v->counter) : "r"(i));
+	__asm__ __volatile__("stw%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
 }
 
 #define ATOMIC_OP(op, asm_op)						\
@@ -320,14 +320,14 @@ static __inline__ s64 arch_atomic64_read(const atomic64_t *v)
 {
 	s64 t;
 
-	__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m"UPD_CONSTR(v->counter));
+	__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
 
 	return t;
 }
 
 static __inline__ void arch_atomic64_set(atomic64_t *v, s64 i)
 {
-	__asm__ __volatile__("std%U0%X0 %1,%0" : "=m"UPD_CONSTR(v->counter) : "r"(i));
+	__asm__ __volatile__("std%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
 }
 
 #define ATOMIC64_OP(op, asm_op)						\
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index f130783c8301..beba4979bff9 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -122,7 +122,7 @@ static inline u##size name(const volatile u##size __iomem *addr)	\
 {									\
 	u##size ret;							\
 	__asm__ __volatile__("sync;"#insn"%U1%X1 %0,%1;twi 0,%0,0;isync"\
-		: "=r" (ret) : "m"UPD_CONSTR (*addr) : "memory");	\
+		: "=r" (ret) : "m<>" (*addr) : "memory");	\
 	return ret;							\
 }
 
@@ -130,7 +130,7 @@ static inline u##size name(const volatile u##size __iomem *addr)	\
 static inline void name(volatile u##size __iomem *addr, u##size val)	\
 {									\
 	__asm__ __volatile__("sync;"#insn"%U0%X0 %1,%0"			\
-		: "=m"UPD_CONSTR (*addr) : "r" (val) : "memory");	\
+		: "=m<>" (*addr) : "r" (val) : "memory");	\
 	mmiowb_set_pending();						\
 }
 
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 22c79ab40006..63316100080c 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -86,7 +86,7 @@ __pu_failed:							\
 		"1:	" op "%U1%X1 %0,%1	# put_user\n"	\
 		EX_TABLE(1b, %l2)				\
 		:						\
-		: "r" (x), "m"UPD_CONSTR (*addr)		\
+		: "r" (x), "m<>" (*addr)		\
 		:						\
 		: label)
 
@@ -143,7 +143,7 @@ do {								\
 		"1:	"op"%U1%X1 %0, %1	# get_user\n"	\
 		EX_TABLE(1b, %l2)				\
 		: "=r" (x)					\
-		: "m"UPD_CONSTR (*addr)				\
+		: "m<>" (*addr)				\
 		:						\
 		: label)
 
@@ -200,7 +200,7 @@ __gus_failed:								\
 		".previous\n"				\
 		EX_TABLE(1b, 3b)			\
 		: "=r" (err), "=r" (x)			\
-		: "m"UPD_CONSTR (*addr), "i" (-EFAULT), "0" (err))
+		: "m<>" (*addr), "i" (-EFAULT), "0" (err))
 
 #ifdef __powerpc64__
 #define __get_user_asm2(x, addr, err)			\
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index b4e6f70b97b9..3fd037d36afb 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1094,7 +1094,7 @@ static inline u64 sp_to_dp(u32 fprs)
 
 	preempt_disable();
 	enable_kernel_fp();
-	asm ("lfs%U1%X1 0,%1; stfd%U0%X0 0,%0" : "=m"UPD_CONSTR (fprd) : "m"UPD_CONSTR (fprs)
+	asm ("lfs%U1%X1 0,%1; stfd%U0%X0 0,%0" : "=m<>" (fprd) : "m<>" (fprs)
 	     : "fr0");
 	preempt_enable();
 	return fprd;
@@ -1106,7 +1106,7 @@ static inline u32 dp_to_sp(u64 fprd)
 
 	preempt_disable();
 	enable_kernel_fp();
-	asm ("lfd%U1%X1 0,%1; stfs%U0%X0 0,%0" : "=m"UPD_CONSTR (fprs) : "m"UPD_CONSTR (fprd)
+	asm ("lfd%U1%X1 0,%1; stfs%U0%X0 0,%0" : "=m<>" (fprs) : "m<>" (fprd)
 	     : "fr0");
 	preempt_enable();
 	return fprs;
-- 
2.33.0.309.g3052b89438-goog

