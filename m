Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F82B4D0684
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 19:28:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KC6R412kbz3bc4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 05:28:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i2BnqLMd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=i2BnqLMd; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KC6Q85t3Rz3bbG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 05:27:44 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id t5so14858334pfg.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Mar 2022 10:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WlzGmKQkWzi6Qr+WywUOdHqH4PZoISUm1CwL1+MnnnQ=;
 b=i2BnqLMdrRJKcl5wqFruwNd/uPzX3h7Lts9Z0Ne4aqHEcF9FogZGotzwggDmhlI+04
 fi2DCYALFrdM5PjmYVGAzvRkvTN5cD5F6cTkZxvzxUUPzzhJWvhaYyQzzjW6fTdYtZGF
 7SV8HthxX+2qv62AaLI18nL2SFUqj2pWQVYdaYP9XXCVTHEKG7HPdIDaLilgQOZi9Q8C
 lirqN4PnVJZ3Hgr3P9zXDf/+WI0HHwD/9MeXtCLu0yrOjphIJKJU8eQ5K4hDX4V4Taz4
 7BVxJNgYJ9S6jKP34oI4WPUN8bsibZYy8E20mHUYMBpfa0YuzPEW1J9EetIRuZcVI1KF
 9fFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WlzGmKQkWzi6Qr+WywUOdHqH4PZoISUm1CwL1+MnnnQ=;
 b=tQuc6hvZ95RRzOChJd20JHBH0z/b74wVUR3szqqPswOi+zq/n7fLTvuAW4LuibhYBC
 LmZoP+XBCbWSYKA1APRFy5rlUiin1vhFoaXxxGZ2p8LNTIb8/0tPolR0eyRvezBfBsy5
 BFV+6MZ6BP5h/RUa445t2moHeg1CtYqA06qdXN/rGLCO8oJFtb0C1xgSriYd1JvkaLDX
 XhGdryLv07IluGm2w6hgRi1/3n7VPMMO/+sHfdXIVhxuX+aMmQb/Lpo3HAc6P8s0Nz2y
 YZ6g7GIGRsSVyXrTj+z6crZacun4rWlZz0HEyYcBW2pp5FsD+fBPG9jpAGTh4c7XVZM3
 ACfw==
X-Gm-Message-State: AOAM532pe0h0UxWdM+jTMwSKbUFuroCsZUwZt4DfGX4uLy+1pjYLvE+G
 UrSEhMp37d5pnQIPm3+UWplfcLL78QA=
X-Google-Smtp-Source: ABdhPJzAjnTW5FUKRBxdhht054Dd7PpdEbFf69k0eEn2QYLSGkMAyC1mlrSw353a6i4kpo7GIF6gsA==
X-Received: by 2002:a63:8643:0:b0:37c:996c:ecd with SMTP id
 x64-20020a638643000000b0037c996c0ecdmr10849261pgd.416.1646677663087; 
 Mon, 07 Mar 2022 10:27:43 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a17090ad59600b001b7deb42251sm68767pju.15.2022.03.07.10.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:27:42 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/signal: Report minimum signal frame size to
 userspace via AT_MINSIGSTKSZ
Date: Tue,  8 Mar 2022 04:27:34 +1000
Message-Id: <20220307182734.289289-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220307182734.289289-1-npiggin@gmail.com>
References: <20220307182734.289289-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement the AT_MINSIGSTKSZ AUXV entry, allowing userspace to
dynamically size stack allocations in a manner forward-compatible with
new processor state saved in the signal frame

For now these statically find the maximum signal frame size rather than
doing any runtime testing of features to minimise the size.

glibc 2.34 will take advantage of this, as will applications that use
use _SC_MINSIGSTKSZ and _SC_SIGSTKSZ.

Cc: Alan Modra <amodra@gmail.com>
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>
References: 94b07c1f8c39 ("arm64: signal: Report signal frame size to userspace via auxv")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/elf.h         | 14 +++++++++++++-
 arch/powerpc/include/asm/signal.h      |  5 +++++
 arch/powerpc/include/uapi/asm/auxvec.h |  4 +++-
 arch/powerpc/kernel/signal.c           | 15 +++++++++++++++
 arch/powerpc/kernel/signal_32.c        |  6 ++++++
 arch/powerpc/kernel/signal_64.c        |  5 +++++
 6 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/elf.h b/arch/powerpc/include/asm/elf.h
index b8425e3cfd81..19d5c798c566 100644
--- a/arch/powerpc/include/asm/elf.h
+++ b/arch/powerpc/include/asm/elf.h
@@ -160,7 +160,7 @@ extern int arch_setup_additional_pages(struct linux_binprm *bprm,
  *   even if DLINFO_ARCH_ITEMS goes to zero or is undefined.
  * update AT_VECTOR_SIZE_ARCH if the number of NEW_AUX_ENT entries changes
  */
-#define ARCH_DLINFO							\
+#define COMMON_ARCH_DLINFO						\
 do {									\
 	/* Handle glibc compatibility. */				\
 	NEW_AUX_ENT(AT_IGNOREPPC, AT_IGNOREPPC);			\
@@ -173,6 +173,18 @@ do {									\
 	ARCH_DLINFO_CACHE_GEOMETRY;					\
 } while (0)
 
+#define ARCH_DLINFO							\
+do {									\
+	COMMON_ARCH_DLINFO;						\
+	NEW_AUX_ENT(AT_MINSIGSTKSZ, get_min_sigframe_size());		\
+} while (0)
+
+#define COMPAT_ARCH_DLINFO						\
+do {									\
+	COMMON_ARCH_DLINFO;						\
+	NEW_AUX_ENT(AT_MINSIGSTKSZ, get_min_sigframe_size_compat());	\
+} while (0)
+
 /* Relocate the kernel image to @final_address */
 void relocate(unsigned long final_address);
 
diff --git a/arch/powerpc/include/asm/signal.h b/arch/powerpc/include/asm/signal.h
index 99e1c6de27bc..922d43700fb4 100644
--- a/arch/powerpc/include/asm/signal.h
+++ b/arch/powerpc/include/asm/signal.h
@@ -9,4 +9,9 @@
 struct pt_regs;
 void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags);
 
+unsigned long get_min_sigframe_size_32(void);
+unsigned long get_min_sigframe_size_64(void);
+unsigned long get_min_sigframe_size(void);
+unsigned long get_min_sigframe_size_compat(void);
+
 #endif /* _ASM_POWERPC_SIGNAL_H */
diff --git a/arch/powerpc/include/uapi/asm/auxvec.h b/arch/powerpc/include/uapi/asm/auxvec.h
index 7af21dc0e320..aa7c16215453 100644
--- a/arch/powerpc/include/uapi/asm/auxvec.h
+++ b/arch/powerpc/include/uapi/asm/auxvec.h
@@ -48,6 +48,8 @@
 #define AT_L3_CACHESIZE		46
 #define AT_L3_CACHEGEOMETRY	47
 
-#define AT_VECTOR_SIZE_ARCH	14 /* entries in ARCH_DLINFO */
+#define AT_MINSIGSTKSZ		51      /* stack needed for signal delivery */
+
+#define AT_VECTOR_SIZE_ARCH	15 /* entries in ARCH_DLINFO */
 
 #endif
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index b93b87df499d..b3c458db2b8d 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -141,6 +141,21 @@ unsigned long copy_ckvsx_from_user(struct task_struct *task,
 
 int show_unhandled_signals = 1;
 
+unsigned long get_min_sigframe_size(void)
+{
+	if (IS_ENABLED(CONFIG_PPC64))
+		return get_min_sigframe_size_64();
+	else
+		return get_min_sigframe_size_32();
+}
+
+#ifdef CONFIG_COMPAT
+unsigned long get_min_sigframe_size_compat(void)
+{
+	return get_min_sigframe_size_32();
+}
+#endif
+
 /*
  * Allocate space for the signal frame
  */
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index d84c434b2b78..157a7403e3eb 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -233,6 +233,12 @@ struct rt_sigframe {
 	int			abigap[56];
 };
 
+unsigned long get_min_sigframe_size_32(void)
+{
+	return max(sizeof(struct rt_sigframe) + __SIGNAL_FRAMESIZE + 16,
+		   sizeof(struct sigframe) + __SIGNAL_FRAMESIZE);
+}
+
 /*
  * Save the current user registers on the user stack.
  * We only save the altivec/spe registers if the process has used
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index d1e1fc0acbea..7c5317e07169 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -66,6 +66,11 @@ struct rt_sigframe {
 	char abigap[USER_REDZONE_SIZE];
 } __attribute__ ((aligned (16)));
 
+unsigned long get_min_sigframe_size_64(void)
+{
+	return sizeof(struct rt_sigframe) + __SIGNAL_FRAMESIZE;
+}
+
 /*
  * This computes a quad word aligned pointer inside the vmx_reserve array
  * element. For historical reasons sigcontext might not be quad word aligned,
-- 
2.23.0

