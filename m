Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 029C54D19CB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 14:57:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCcN55DXTz3dy6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 00:57:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GSOKGt8Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GSOKGt8Q; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCcDr08tVz3bb0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 00:51:24 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so2460410pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Mar 2022 05:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W+MErG29vh1uQ6Gl0V9SFDE552YCbARluDrcjjEQKBs=;
 b=GSOKGt8QOD1KSMgS30IH5jObGM4OCLnv1ctWui6l3NQKRJ/85qOEYFqvjKXBCHyfif
 JwaAwRiuc3VoUA/eqrEzL3sNolnfUPqbMAiisn+W+KD90AwUI0scYZUCOY1J4rr9bwyU
 AL/uG6zM47pE5n7SCczh1D+08YRphEQ00kGc1jSV5pw660ETWjEGWe2sV1RJnHiPxbkA
 Hl75aY8lq292FF+Msou2Z9q4S4/Dsr3S6j3PgLBQryEpRof+fcAvc+QPTdacMhK6eIuk
 gnx6TiSGQuQyiSNECgVxkEToJuHcISXifc3orSZdDBqkceKPQipVZWGcKYvMz60jMJRg
 qJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W+MErG29vh1uQ6Gl0V9SFDE552YCbARluDrcjjEQKBs=;
 b=BnnzZo5Y+uLtw2FgGhvo8jVb7pfG+PbGMued7eSYV7AWsxbudoU9HKPJS8oWh6oyH4
 +rgfOjt3b7Rez+kwDRe8ctPNAIovUvNId1lcqoVsHQ3Wvyrys1dAWM/rQ53CB+4wbpJt
 3UkQs19KEFyeT6EI2VTzda8S2DtHp1bi12hl0SbW178piJrX61zh5WY1SLD9JhB43lfR
 3KRSaawiV8Xsxrpp7coGicJpr1++D8oPZBK7/Y0tCxzP+pG+trX+og/+gpnloOXSla53
 c8j05xTLISqFXgectgFIpCW6tWQ06YS7Z0pg8dubLDbNtLG/mMMx9AIzDP3SFjdMyWil
 beQA==
X-Gm-Message-State: AOAM530Zdt03iEoFrydH0XpUmVODzIlzAj3lT1eTD/OnPJ+A4vrBoLNo
 FbJTvAl2Mz1Wdr0ADDMxx2QoxUrc884=
X-Google-Smtp-Source: ABdhPJxs45VkyVmUcS5EGFX+1qlg5t4UzJiMQmHsyhWYsqZnlvjKgyGvDKoSdKNih2SE2InLpPOnFQ==
X-Received: by 2002:a17:902:7296:b0:14b:4bc6:e81 with SMTP id
 d22-20020a170902729600b0014b4bc60e81mr17632443pll.132.1646747483279; 
 Tue, 08 Mar 2022 05:51:23 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm541737pfu.86.2022.03.08.05.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:51:23 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/14] powerpc/rtas: replace rtas_call_unlocked with
 raw_rtas_call
Date: Tue,  8 Mar 2022 23:50:43 +1000
Message-Id: <20220308135047.478297-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220308135047.478297-1-npiggin@gmail.com>
References: <20220308135047.478297-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the same calling and rets return convention with the raw rtas
call rather than requiring callers to load and byteswap return
values out of rtas_args.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/rtas.h              |  4 +-
 arch/powerpc/kernel/rtas.c                   | 53 +++++++++++---------
 arch/powerpc/platforms/pseries/hotplug-cpu.c |  2 +-
 arch/powerpc/platforms/pseries/ras.c         |  7 +--
 arch/powerpc/xmon/xmon.c                     |  2 +-
 5 files changed, 33 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 82e5b055fa2a..1014ff140cf8 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -241,8 +241,8 @@ extern int rtas_token(const char *service);
 extern int rtas_service_present(const char *service);
 extern int rtas_call(int token, int, int, int *, ...);
 int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...);
-void rtas_call_unlocked(struct rtas_args *args, int token, int nargs,
-			int nret, ...);
+int raw_rtas_call(struct rtas_args *args, int token,
+			int nargs, int nret, int *outputs, ...);
 extern void __noreturn rtas_restart(char *cmd);
 extern void rtas_power_off(void);
 extern void __noreturn rtas_halt(void);
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index fece066115f0..751a20669669 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -123,7 +123,7 @@ static void call_rtas_display_status(unsigned char c)
 		return;
 
 	s = lock_rtas();
-	rtas_call_unlocked(&rtas.args, 10, 1, 1, NULL, c);
+	raw_rtas_call(&rtas.args, 10, 1, 1, NULL, c);
 	unlock_rtas(s);
 }
 
@@ -434,10 +434,9 @@ static char *__fetch_rtas_last_error(char *altbuf)
 #define get_errorlog_buffer()		NULL
 #endif
 
-
-static void
-va_rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
-		      va_list list)
+static int notrace va_raw_rtas_call(struct rtas_args *args, int token,
+				int nargs, int nret, int *outputs,
+				va_list list)
 {
 	int i;
 
@@ -453,21 +452,37 @@ va_rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
 		args->rets[i] = 0;
 
 	do_enter_rtas(__pa(args));
+
+	if (nret > 1 && outputs != NULL) {
+		for (i = 0; i < nret-1; ++i)
+			outputs[i] = be32_to_cpu(args->rets[i+1]);
+	}
+
+	return (nret > 0) ? be32_to_cpu(args->rets[0]) : 0;
 }
 
-void rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret, ...)
+/*
+ * Like rtas_call but no kmalloc or printk etc in error handling, so
+ * error won't go through log_error. No tracing, may be called in real mode.
+ * rtas_args must be supplied, and appropriate synchronization for the rtas
+ * call being made has to be performed by the caller.
+ */
+int notrace raw_rtas_call(struct rtas_args *args, int token,
+			int nargs, int nret, int *outputs, ...)
 {
 	va_list list;
+	int ret;
 
-	va_start(list, nret);
-	va_rtas_call_unlocked(args, token, nargs, nret, list);
+	va_start(list, outputs);
+	ret = va_raw_rtas_call(args, token, nargs, nret, outputs, list);
 	va_end(list);
+
+	return ret;
 }
 
 int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 {
 	va_list list;
-	int i;
 	unsigned long s;
 	struct rtas_args *rtas_args;
 	char *buff_copy = NULL;
@@ -482,19 +497,14 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 	rtas_args = &rtas.args;
 
 	va_start(list, outputs);
-	va_rtas_call_unlocked(rtas_args, token, nargs, nret, list);
+	ret = va_raw_rtas_call(rtas_args, token, nargs, nret, outputs, list);
 	va_end(list);
 
 	/* A -1 return code indicates that the last command couldn't
 	   be completed due to a hardware error. */
-	if (be32_to_cpu(rtas_args->rets[0]) == -1)
+	if (ret == -1)
 		buff_copy = __fetch_rtas_last_error(NULL);
 
-	if (nret > 1 && outputs != NULL)
-		for (i = 0; i < nret-1; ++i)
-			outputs[i] = be32_to_cpu(rtas_args->rets[i+1]);
-	ret = (nret > 0)? be32_to_cpu(rtas_args->rets[0]): 0;
-
 	unlock_rtas(s);
 
 	if (buff_copy) {
@@ -950,7 +960,7 @@ int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...)
 	va_list list;
 	struct rtas_args *args;
 	unsigned long flags;
-	int i, ret = 0;
+	int ret;
 
 	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
 		return -1;
@@ -962,16 +972,9 @@ int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...)
 	args = local_paca->rtas_args_reentrant;
 
 	va_start(list, outputs);
-	va_rtas_call_unlocked(args, token, nargs, nret, list);
+	ret = va_raw_rtas_call(args, token, nargs, nret, outputs, list);
 	va_end(list);
 
-	if (nret > 1 && outputs)
-		for (i = 0; i < nret - 1; ++i)
-			outputs[i] = be32_to_cpu(args->rets[i + 1]);
-
-	if (nret > 0)
-		ret = be32_to_cpu(args->rets[0]);
-
 	local_irq_restore(flags);
 	preempt_enable();
 
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index b81fc846d99c..17c05650b6b9 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -53,7 +53,7 @@ static void rtas_stop_self(void)
 
 	BUG_ON(rtas_stop_self_token == RTAS_UNKNOWN_SERVICE);
 
-	rtas_call_unlocked(&args, rtas_stop_self_token, 0, 1, NULL);
+	raw_rtas_call(&args, rtas_stop_self_token, 0, 1, NULL);
 
 	panic("Alas, I survived.\n");
 }
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 74c9b1b5bc66..b009ed7de1ee 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -465,12 +465,7 @@ static void fwnmi_release_errinfo(void)
 	struct rtas_args rtas_args;
 	int ret;
 
-	/*
-	 * On pseries, the machine check stack is limited to under 4GB, so
-	 * args can be on-stack.
-	 */
-	rtas_call_unlocked(&rtas_args, ibm_nmi_interlock_token, 0, 1, NULL);
-	ret = be32_to_cpu(rtas_args.rets[0]);
+	ret = raw_rtas_call(&rtas_args, ibm_nmi_interlock_token, 0, 1, NULL);
 	if (ret != 0)
 		printk(KERN_ERR "FWNMI: nmi-interlock failed: %d\n", ret);
 }
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index fd72753e8ad5..6f53e8bccc33 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -410,7 +410,7 @@ static inline void disable_surveillance(void)
 	if (set_indicator_token == RTAS_UNKNOWN_SERVICE)
 		return;
 
-	rtas_call_unlocked(&args, set_indicator_token, 3, 1, NULL,
+	raw_rtas_call(&args, set_indicator_token, 3, 1, NULL,
 			   SURVEILLANCE_TOKEN, 0, 0);
 
 #endif /* CONFIG_PPC_PSERIES */
-- 
2.23.0

