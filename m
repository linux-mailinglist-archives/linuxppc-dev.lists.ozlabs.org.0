Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A46FD18C723
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 06:39:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kCJz6mRxzDrfR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:39:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iPMj33YC; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kBsd5SQDzDrVL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 16:19:33 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id m1so2022159pll.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 22:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kZ1o4WX6hAPN7c5dpLC+hTxSEBgkXrrxIKkJV1CSAqE=;
 b=iPMj33YCLbH/hb8UjtbhwFJepPTw6PBfzkRE2nGpojvqJHLXp/tj9EhXgWPNgngmF3
 qpcKX8niSnWUYvw8cX8GxK6HT+wf1TueBGycLLk8s9xj3HsJZklD+Z2DjMjJf252vs/1
 aZFqNm8rwg0RdFvKUQtQK8z5vAUYn51QJkfm9v5APn8no/KkvfM2uVP5ur5FPYOsgT8y
 JJxgzm/sFksXd4H1EzgeIoNUP6hx4rL9RmQkzRg5EktniegBfzfnFpEiBlsCvGQ9ZDCn
 PS70w7EOM2KlMeSxX45aOYcMClCOzXKliEqgq04u9Xb2gAbtxJFHPR4MblYRkBTjOcuk
 2tjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kZ1o4WX6hAPN7c5dpLC+hTxSEBgkXrrxIKkJV1CSAqE=;
 b=KZhrTDQPQ9iQmcCIbee4+PdPBq0mH5ND4NTYFvAJZ5HqOrBvVEhKY50MzluZOZ6Lqv
 TUXkKnuVVi8/QgggNhqMGuzF1kuZTu4FZtoRdfFN5ftNpxnt6P1fVXvFu9Yhiab/U2eV
 yPiBCnhAGKx6jeSOuBKSzVe1A34lc4HE2NYf9qiVskv/2A5nQPSMU71TTMLjeCxVRxDR
 eyWpk2GQajPMV3VF8lsdOK2dYRoX9S/Fe+hoN0vF2aerxwLhPYc80fA22smlGvYyvcdA
 +VkUwHcaVE4UfxLJ6UxKKlc+Iv3EarPc695KgfUzpicV6vkm71LHyz/1+OJZJn7Cpn+T
 zsdA==
X-Gm-Message-State: ANhLgQ3aGZAewzv+83ZNG/0suBiFm0TLuBTMxcfd4GijtiaRd8SD0Sk7
 Z6Kta61jqwTMQEXYUMqNSrYq+NVQPqY=
X-Google-Smtp-Source: ADFU+vtxfjRB37I/KhZn37JhqFZzTHOki4eFRHevbZj1X0EXPqIVn/7eopzGVwzKUvwSDvcF2oqW+w==
X-Received: by 2002:a17:90b:d8d:: with SMTP id
 bg13mr7647818pjb.29.1584681570874; 
 Thu, 19 Mar 2020 22:19:30 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id c207sm3988716pfb.47.2020.03.19.22.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 22:19:30 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 11/16] powerpc: Enable Prefixed Instructions
Date: Fri, 20 Mar 2020 16:18:04 +1100
Message-Id: <20200320051809.24332-12-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200320051809.24332-1-jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alistair Popple <alistair@popple.id.au>

Prefix instructions have their own FSCR bit which needs to enabled via
a CPU feature. The kernel will save the FSCR for problem state but it
needs to be enabled initially.

If prefixed instructions are made unavailable by the [H]FSCR, attempting
to use them will cause a facility unavailable exception. Add "PREFIX" to
the facility_strings[].

Currently there are no prefixed instructions that are actually emulated
by emulate_instruction() within facility_unavailable_exception().
However, when caused by a prefixed instructions the SRR1 PREFIXED bit is
set. Prepare for dealing with emulated prefixed instructions by checking
for this bit.

Signed-off-by: Alistair Popple <alistair@popple.id.au>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4:
    - Squash "Check for prefixed instructions in
      facility_unavailable_exception()" here
    - Remove dt parts for now
---
 arch/powerpc/include/asm/reg.h | 3 +++
 arch/powerpc/kernel/traps.c    | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 1aa46dff0957..c7758c2ccc5f 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -397,6 +397,7 @@
 #define SPRN_RWMR	0x375	/* Region-Weighting Mode Register */
 
 /* HFSCR and FSCR bit numbers are the same */
+#define FSCR_PREFIX_LG	13	/* Enable Prefix Instructions */
 #define FSCR_SCV_LG	12	/* Enable System Call Vectored */
 #define FSCR_MSGP_LG	10	/* Enable MSGP */
 #define FSCR_TAR_LG	8	/* Enable Target Address Register */
@@ -408,11 +409,13 @@
 #define FSCR_VECVSX_LG	1	/* Enable VMX/VSX  */
 #define FSCR_FP_LG	0	/* Enable Floating Point */
 #define SPRN_FSCR	0x099	/* Facility Status & Control Register */
+#define   FSCR_PREFIX	__MASK(FSCR_PREFIX_LG)
 #define   FSCR_SCV	__MASK(FSCR_SCV_LG)
 #define   FSCR_TAR	__MASK(FSCR_TAR_LG)
 #define   FSCR_EBB	__MASK(FSCR_EBB_LG)
 #define   FSCR_DSCR	__MASK(FSCR_DSCR_LG)
 #define SPRN_HFSCR	0xbe	/* HV=1 Facility Status & Control Register */
+#define   HFSCR_PREFIX	__MASK(FSCR_PREFIX_LG)
 #define   HFSCR_MSGP	__MASK(FSCR_MSGP_LG)
 #define   HFSCR_TAR	__MASK(FSCR_TAR_LG)
 #define   HFSCR_EBB	__MASK(FSCR_EBB_LG)
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 82a3438300fd..a4764b039749 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1720,6 +1720,7 @@ void facility_unavailable_exception(struct pt_regs *regs)
 		[FSCR_TAR_LG] = "TAR",
 		[FSCR_MSGP_LG] = "MSGP",
 		[FSCR_SCV_LG] = "SCV",
+		[FSCR_PREFIX_LG] = "PREFIX",
 	};
 	char *facility = "unknown";
 	u64 value;
-- 
2.17.1

