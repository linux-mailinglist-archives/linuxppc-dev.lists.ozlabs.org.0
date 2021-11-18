Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9C4456458
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 21:36:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwBRK0rxvz3bhj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 07:36:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PPEK73Yj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=PPEK73Yj; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwBQd6jGLz2yng
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 07:36:09 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id h24so6123109pjq.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 12:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lVkmmvG/j7pAxwD3ZkAKM2VobhK3Up8KSyZejtIse54=;
 b=PPEK73YjIZ+zZ041dY75YBSx5UtWt6K5MgviG4QHxEGeyCZYxwFP/0FoKTcDhNwWHC
 DjxZfKR0TwBk1ezwU++Gp3NdN8T4UpAE1jftPiLiojqArr4Bk4saT/OECZiSBnn9rMX+
 5YllHgwKvZv6KkYUv+yIEa5C6M5sCoUb0pPY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lVkmmvG/j7pAxwD3ZkAKM2VobhK3Up8KSyZejtIse54=;
 b=LG3MWtSmUxei+NOoTGVa36lpKCNc04Mo2TJzyG9r2XRMq4kKC+AVPPgmsWnKjazTNe
 hIG6KyJjMp7M6e99RtiO3tTQyrkdlsTO9vQ0w+1EG9ybhdGsOygIbwpXH/8pilbxikZ3
 NaNRwPren3NnL3vepYNOXmdY1XhUUgos7+uc6q5uUeY31pVddc8sIR4eZuXDE681d9bP
 /fgxcb1er3jUenf0MxWWPuzLkQJk13aiUkK4fyV9A4eJr+dg7wPLTwi1Ighkdmy7zPHa
 miAeEVO7ib8u2C9UvfU8gw7/nDW5jKISxrklCxi5jx61mB6cCgR7Nld/Th0kBgPo0Gze
 71xw==
X-Gm-Message-State: AOAM530xiaP/E3Pp+XS0IQiBdEUJFRchIgn2n4m+/YYfzYqteWudO2PB
 UMHmBX0DGE4IS4xNosRoYmh67Q==
X-Google-Smtp-Source: ABdhPJxMwU1fSwD50NTL/ixCZzNZiTT9wK+rF5Dat8y+lnVThvSBnIvaT6qSQYGBMA8U9DmIJMZ29A==
X-Received: by 2002:a17:90a:7ac8:: with SMTP id
 b8mr13874273pjl.206.1637267766535; 
 Thu, 18 Nov 2021 12:36:06 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id gc22sm8900753pjb.57.2021.11.18.12.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 12:36:06 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/signal32: Use struct_group() to zero spe regs
Date: Thu, 18 Nov 2021 12:36:04 -0800
Message-Id: <20211118203604.1288379-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3131; h=from:subject;
 bh=Nd4ePfUzckpA23dYadFOEde2uR/aV7RLm1vyTElA6rM=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhlrkzlK5F2t3ltvzRwjCkTmaKG7QFHzINoff+dGs2
 EAsb07CJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYZa5MwAKCRCJcvTf3G3AJsaxEA
 CdO3ZJYc4b0R3BTvkb66wG6EJaEgsRZ85XsSStLG9iLH8wNFFNYQaU2QY37x0PV8Hld/mIQjl0s24m
 OamYw0ox0n67RvD21GiL6V6fBuzBIqLl//8XKH1HuXVmUR5KP8FpuugmilDvAaXHyVkHmaI9Ft+d2G
 W5tB+zXf3G5PwWLJBU6dt7fAJYGjJUkGXZE8TdBUdRcS5yXKd5VkLYvB6wr+eN79xCZPzW2jhCqPH8
 w7E0lW9r+wt4BjmCQ1q4pp/mHYkJcQFkSdzoiBWWIOnZoGQSDhfaROvr7cNOL2ampq9sNvcrsV15Yt
 +FD1hU5ZmX8dzFDk2iAqhMxTYIaHHxhFm+yeyZd8CKrZReuCECztiTNoUTpfnMiwcZd5pkrJjjnGAU
 2EKQLvWqqK1LVKzR3rcm6MnyNhVduUwF3hqkS632N8ZvuQ1+IsXctxfBiN4icsN9LnYmigrZ2Ojuh8
 uuq6hpntjT9q1kqSJMVZkFCOo97YS1i+J0QhIOlCOqR4eabzITemH7qSirg0sm5QIMiR8/Bpfk8i2h
 Ds5O48/TYaLwyz9TCCGtYCSbAYZTl7LXFpl3ShVhl9+RoYqbxQ9f2LTVI7TRBMk6W6BfzDylb8Skvj
 T9oPd1+dRKTkj2RX7oH+CzFt3t98ieoJmtPy2h+SXNBcrI7KOfnOvuhfLadA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Nicholas Piggin <npiggin@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>,
 linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Add a struct_group() for the spe registers so that memset() can correctly reason
about the size:

   In function 'fortify_memset_chk',
       inlined from 'restore_user_regs.part.0' at arch/powerpc/kernel/signal_32.c:539:3:
   >> include/linux/fortify-string.h:195:4: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
     195 |    __write_overflow_field();
         |    ^~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/include/asm/processor.h |  6 ++++--
 arch/powerpc/kernel/signal_32.c      | 14 +++++++++-----
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index e39bd0ff69f3..978a80308466 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -191,8 +191,10 @@ struct thread_struct {
 	int		used_vsr;	/* set if process has used VSX */
 #endif /* CONFIG_VSX */
 #ifdef CONFIG_SPE
-	unsigned long	evr[32];	/* upper 32-bits of SPE regs */
-	u64		acc;		/* Accumulator */
+	struct_group(spe,
+		unsigned long	evr[32];	/* upper 32-bits of SPE regs */
+		u64		acc;		/* Accumulator */
+	);
 	unsigned long	spefscr;	/* SPE & eFP status */
 	unsigned long	spefscr_last;	/* SPEFSCR value on last prctl
 					   call or trap return */
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 00a9c9cd6d42..5e1664b501e4 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -527,16 +527,20 @@ static long restore_user_regs(struct pt_regs *regs,
 	regs_set_return_msr(regs, regs->msr & ~(MSR_FP | MSR_FE0 | MSR_FE1));
 
 #ifdef CONFIG_SPE
-	/* force the process to reload the spe registers from
-	   current->thread when it next does spe instructions */
+	/*
+	 * Force the process to reload the spe registers from
+	 * current->thread when it next does spe instructions.
+	 * Since this is user ABI, we must enforce the sizing.
+	 */
+	BUILD_BUG_ON(sizeof(current->thread.spe) != ELF_NEVRREG * sizeof(u32));
 	regs_set_return_msr(regs, regs->msr & ~MSR_SPE);
 	if (msr & MSR_SPE) {
 		/* restore spe registers from the stack */
-		unsafe_copy_from_user(current->thread.evr, &sr->mc_vregs,
-				      ELF_NEVRREG * sizeof(u32), failed);
+		unsafe_copy_from_user(&current->thread.spe, &sr->mc_vregs,
+				      sizeof(current->thread.spe), failed);
 		current->thread.used_spe = true;
 	} else if (current->thread.used_spe)
-		memset(current->thread.evr, 0, ELF_NEVRREG * sizeof(u32));
+		memset(&current->thread.spe, 0, sizeof(current->thread.spe));
 
 	/* Always get SPEFSCR back */
 	unsafe_get_user(current->thread.spefscr, (u32 __user *)&sr->mc_vregs + ELF_NEVRREG, failed);
-- 
2.30.2

