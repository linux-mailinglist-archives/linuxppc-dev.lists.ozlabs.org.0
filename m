Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 785CC1BB415
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:43:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B5Y24s5QzDqw9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:43:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XPWWR/Bh; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4d50kqRzDqJ3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 12:01:28 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id d17so9583507pgo.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 19:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zeLgJT+sAAigXMuyQIfueT5Re1c3paKjdeV+/EjkPt8=;
 b=XPWWR/Bh/3IvI319zv4lFoyTyekcEnrMdQp0UK5HTFaAI8NcIbpnElCwW4Gz83SL4E
 TfvzSCFLYLI/ZJE4A5Hgec7dBqqtt/B/cIE94IhICLO3Gdh4M+vNq9ykxEA0l45j+ZP1
 obLdH8OhBe3GJ9XJVGiwX/S4KmxhJIDN6g6/80AJHLUNne+gzQyvJi+ddWxeaL5S5t4J
 vUp7JiLWLYlkHemRuDvYXn6MmEr/LgrvUT27BAENsLqoQ+OX0/N8t0GgttzP4GUgFGyz
 02Uh1AWwpPfYq583vf3uFHuzCwoxbv/kkBrfCiPC/LZxYAnBmBRbCkSQ/Wa1AInlWgAY
 xMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zeLgJT+sAAigXMuyQIfueT5Re1c3paKjdeV+/EjkPt8=;
 b=dauIdsEHDE1Kr1NZs2rKdm0RkT01v47YhERnX1lUrUc3XNJlLkNVwcNdhDmF7n++/x
 iFJhC2300cthmBQZXPmqYHPolsj6CHzsV8RoUELwltpxev4IPhcE2EZ2bBXcXegryPKt
 yVesXW4u38Pt+0wQ+A3yZNXqwEOJAGkVobVmjzHi+eHZAh3YXI7DFITYyhdEGNUNPG8f
 ira/QytdF/zCJ+wXoaPnysPyPWATIzoaRWVbhrJcmdVmt/37U+gQdGETwVf6GXljYALy
 vvz5xu2yA/xcnYkTe1sse1kBNoxa56Sb9cRyBlHg/1q7sFlg1MJj/fOEEuNKEPlpWHPp
 CzoQ==
X-Gm-Message-State: AGi0PuarEZ9tr2ha7mWyZNAVaCmP3OnCGfzQhTFuCme/C1CXOt/alpMt
 jSQmEtY0dtk+TQWdadt5A1cpbJo96us=
X-Google-Smtp-Source: APiQypIsMys+yl5Oy5bCstbdfMl9pj/ZdvOJlue4TZ2NUwrQFcVVt+nmBhVb9GlwgERJn/uopEi8BQ==
X-Received: by 2002:a62:a113:: with SMTP id b19mr9812314pff.249.1588039285439; 
 Mon, 27 Apr 2020 19:01:25 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id o68sm13666642pfb.206.2020.04.27.19.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 19:01:25 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 21/28] powerpc: Enable Prefixed Instructions
Date: Tue, 28 Apr 2020 11:58:07 +1000
Message-Id: <20200428015814.15380-22-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428015814.15380-1-jniethe5@gmail.com>
References: <20200428015814.15380-1-jniethe5@gmail.com>
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

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
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

