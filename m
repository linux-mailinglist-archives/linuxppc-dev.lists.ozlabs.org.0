Return-Path: <linuxppc-dev+bounces-380-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C0B95B9BD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:14:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRXs5RyHz300g;
	Fri, 23 Aug 2024 01:13:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339597;
	cv=none; b=fVH4h1NCSQrkFqq+MrD0hS1KV2w22frxbVgsXW7U91FmHW1Mq7JkmotaBX//SZr8B1Sq355xojXBRf5ZkMrLcq4VzXdZempdJQwAA8aRmNjYF+bPZjZ5lBWi2rKdRZbGK/anS8JGFIZrsmV2n5pfpBBtHs6j+zKzdys5C0tSgkmWNFCIb/KqPmCdzxOHUlw8Pz4etFNMtgGOGioyCzN6kqrGcaeS7sWSx3C+AvxGeDCkJUdfMpv95jbBw0EMdfx66cLhH9BX7g3lOjazPNQajr6L3U/5UAU87v+X71GO4MS6wSC2JPGgQYPXGGo97lu6uXgFF7T3HMuB8h7tEEpc2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339597; c=relaxed/relaxed;
	bh=yS/wr3Kaj/+ao73MTWL/k678y347e9kidUJfkehZp8w=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=SEUKHPeBPsT1Ay2niqd00LrCNYFz3LeQaDI3tD+GD5GzwEJYZpLqjwlTClOFtJi7eLsjK6udEKeF4E5UzkuHPcsBhic2egl4b6f/IVfRaW9mQSRQjFC0O60XJldL7hit8TKuLxmuimwx7uQHvrcjILgTtcIHwpAXKd+9BD0fjufI/lyWqsghJ4BW+BW1JEyzzjTwi6kDHJTl1jHDCuoC/g9luFHqaVU2uohltkA7bHDMD3vEXNKa+3e/U/RNG+9Y0ELudF4cZFCKDQ+7oVD6jKLEzbAI0N8pq5wIDNq4uKYd6KGb8MMELu9vyTrcF3dnagO6gg9JcTtNu4ebEHCw0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRXs2cDwz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:13:17 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 915F41576;
	Thu, 22 Aug 2024 08:13:12 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 722AE3F58B;
	Thu, 22 Aug 2024 08:12:42 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com,
	akpm@linux-foundation.org,
	aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com,
	anshuman.khandual@arm.com,
	bp@alien8.de,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	maz@kernel.org,
	mingo@redhat.com,
	mpe@ellerman.id.au,
	naveen.n.rao@linux.ibm.com,
	npiggin@gmail.com,
	oliver.upton@linux.dev,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com,
	tglx@linutronix.de,
	will@kernel.org,
	x86@kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 19/30] arm64: add POE signal support
Date: Thu, 22 Aug 2024 16:11:02 +0100
Message-Id: <20240822151113.1479789-20-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822151113.1479789-1-joey.gouly@arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PKEY support to signals, by saving and restoring POR_EL0 from the stackframe.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
Acked-by: Szabolcs Nagy <szabolcs.nagy@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/uapi/asm/sigcontext.h |  7 +++
 arch/arm64/kernel/signal.c               | 62 ++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git arch/arm64/include/uapi/asm/sigcontext.h arch/arm64/include/uapi/asm/sigcontext.h
index 8a45b7a411e0..e4cba8a6c9a2 100644
--- arch/arm64/include/uapi/asm/sigcontext.h
+++ arch/arm64/include/uapi/asm/sigcontext.h
@@ -98,6 +98,13 @@ struct esr_context {
 	__u64 esr;
 };
 
+#define POE_MAGIC	0x504f4530
+
+struct poe_context {
+	struct _aarch64_ctx head;
+	__u64 por_el0;
+};
+
 /*
  * extra_context: describes extra space in the signal frame for
  * additional structures that don't fit in sigcontext.__reserved[].
diff --git arch/arm64/kernel/signal.c arch/arm64/kernel/signal.c
index 4a77f4976e11..561986947530 100644
--- arch/arm64/kernel/signal.c
+++ arch/arm64/kernel/signal.c
@@ -61,6 +61,7 @@ struct rt_sigframe_user_layout {
 	unsigned long za_offset;
 	unsigned long zt_offset;
 	unsigned long fpmr_offset;
+	unsigned long poe_offset;
 	unsigned long extra_offset;
 	unsigned long end_offset;
 };
@@ -185,6 +186,8 @@ struct user_ctxs {
 	u32 zt_size;
 	struct fpmr_context __user *fpmr;
 	u32 fpmr_size;
+	struct poe_context __user *poe;
+	u32 poe_size;
 };
 
 static int preserve_fpsimd_context(struct fpsimd_context __user *ctx)
@@ -258,6 +261,32 @@ static int restore_fpmr_context(struct user_ctxs *user)
 	return err;
 }
 
+static int preserve_poe_context(struct poe_context __user *ctx)
+{
+	int err = 0;
+
+	__put_user_error(POE_MAGIC, &ctx->head.magic, err);
+	__put_user_error(sizeof(*ctx), &ctx->head.size, err);
+	__put_user_error(read_sysreg_s(SYS_POR_EL0), &ctx->por_el0, err);
+
+	return err;
+}
+
+static int restore_poe_context(struct user_ctxs *user)
+{
+	u64 por_el0;
+	int err = 0;
+
+	if (user->poe_size != sizeof(*user->poe))
+		return -EINVAL;
+
+	__get_user_error(por_el0, &(user->poe->por_el0), err);
+	if (!err)
+		write_sysreg_s(por_el0, SYS_POR_EL0);
+
+	return err;
+}
+
 #ifdef CONFIG_ARM64_SVE
 
 static int preserve_sve_context(struct sve_context __user *ctx)
@@ -621,6 +650,7 @@ static int parse_user_sigframe(struct user_ctxs *user,
 	user->za = NULL;
 	user->zt = NULL;
 	user->fpmr = NULL;
+	user->poe = NULL;
 
 	if (!IS_ALIGNED((unsigned long)base, 16))
 		goto invalid;
@@ -671,6 +701,17 @@ static int parse_user_sigframe(struct user_ctxs *user,
 			/* ignore */
 			break;
 
+		case POE_MAGIC:
+			if (!system_supports_poe())
+				goto invalid;
+
+			if (user->poe)
+				goto invalid;
+
+			user->poe = (struct poe_context __user *)head;
+			user->poe_size = size;
+			break;
+
 		case SVE_MAGIC:
 			if (!system_supports_sve() && !system_supports_sme())
 				goto invalid;
@@ -857,6 +898,9 @@ static int restore_sigframe(struct pt_regs *regs,
 	if (err == 0 && system_supports_sme2() && user.zt)
 		err = restore_zt_context(&user);
 
+	if (err == 0 && system_supports_poe() && user.poe)
+		err = restore_poe_context(&user);
+
 	return err;
 }
 
@@ -980,6 +1024,13 @@ static int setup_sigframe_layout(struct rt_sigframe_user_layout *user,
 			return err;
 	}
 
+	if (system_supports_poe()) {
+		err = sigframe_alloc(user, &user->poe_offset,
+				     sizeof(struct poe_context));
+		if (err)
+			return err;
+	}
+
 	return sigframe_alloc_end(user);
 }
 
@@ -1042,6 +1093,14 @@ static int setup_sigframe(struct rt_sigframe_user_layout *user,
 		err |= preserve_fpmr_context(fpmr_ctx);
 	}
 
+	if (system_supports_poe() && err == 0 && user->poe_offset) {
+		struct poe_context __user *poe_ctx =
+			apply_user_offset(user, user->poe_offset);
+
+		err |= preserve_poe_context(poe_ctx);
+	}
+
+
 	/* ZA state if present */
 	if (system_supports_sme() && err == 0 && user->za_offset) {
 		struct za_context __user *za_ctx =
@@ -1178,6 +1237,9 @@ static void setup_return(struct pt_regs *regs, struct k_sigaction *ka,
 		sme_smstop();
 	}
 
+	if (system_supports_poe())
+		write_sysreg_s(POR_EL0_INIT, SYS_POR_EL0);
+
 	if (ka->sa.sa_flags & SA_RESTORER)
 		sigtramp = ka->sa.sa_restorer;
 	else
-- 
2.25.1


