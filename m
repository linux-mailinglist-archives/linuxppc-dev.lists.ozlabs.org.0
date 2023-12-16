Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A2D8159B7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 15:04:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mi1opTUG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ssnrl4trkz3dJZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 01:04:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mi1opTUG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnQQ6h8xz3dH8
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:45:02 +1100 (AEDT)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3ba2e4ff6e1so1297732b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734300; x=1703339100; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIIu4k1XdoD66DJz5iUSnakIVIOcqcRlWNFj942LOXM=;
        b=mi1opTUGvj1aSNrG140NUMminhX7qRF8rD9Ka0bEe6bps3q0spwnYN4GCqcv/RMx7U
         dUGiHyOjWkDPDZjm7VAIjgeDVdw5XiXjlB8tKxWQ32QqQN8yfmQv0EK+7FgwVXM/CKaE
         e+Wy5QNb3YXWnSq6pE3uqORlq5QzPEwW0G2CmTbbtWmjBv4T2DgT8Y61mDbTzqg7nxg/
         fOj6WiXw8nrT2TzUPbOw/gJ8ArhxfDbN5zI03vkrRigeICBmYtOib6eaDwonscERa7aX
         EmCEMvTwKHJnwgIn+Sr3cY7SMvJTGwhbe2jrBs92ZCUoy7QEui3IJOgY62I/lDrNQThI
         4jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734300; x=1703339100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIIu4k1XdoD66DJz5iUSnakIVIOcqcRlWNFj942LOXM=;
        b=s/Q3mwE6iZBkPJxZzlutRY67G7ftNzenV96boa3I6S04nzyTUT4Lcx2lpx5QZxQy1v
         q1t1OAfoZUDxngDEO/4cpi2th3nMakbQetGIN2VuHlY1wyAtahbGqj+kzd2KfOW4NlDS
         zhJ6oNWMy33DODEEXEeG4F/1wiMat5aBsCWsSlPNZCf1RAkWCjbFnwC046U3TPWc3nTN
         XKB+i2SUI36jN8R3/ufegYh+oq0PrHUi7kVP/B6E12gSL5+mqs19m3wyYwUhqkHpixul
         NRrQC/2zF9McKZPixC1LPK5vaTF8UhgkNwgogiqVXiuOEgE/58vflBzTmaZ7F6c0X3KH
         NG+A==
X-Gm-Message-State: AOJu0YyaZZEiF4SeM0oc/dYcstn5P7fVgdOEx1Lkav2vnUef4ZCgTzkG
	rchhxiP/xK4a0aWk8jTe7JodIgoYdi0=
X-Google-Smtp-Source: AGHT+IHJOKiM9Jo+CuiopYhXPeFgP4kPzPOS4kJBDYzhDg7A0gW+rQs7I35NTd6/xn35XZmeFd4Xkg==
X-Received: by 2002:a05:6808:1b0f:b0:3ba:30dc:56c8 with SMTP id bx15-20020a0568081b0f00b003ba30dc56c8mr6512067oib.37.1702734300114;
        Sat, 16 Dec 2023 05:45:00 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:44:59 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 25/29] powerpc: Add rtas stop-self support
Date: Sat, 16 Dec 2023 23:42:52 +1000
Message-ID: <20231216134257.1743345-26-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231216134257.1743345-1-npiggin@gmail.com>
References: <20231216134257.1743345-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for improved SMP support, add stop-self support to the
harness. This is non-trivial because it requires an unlocked rtas
call: a CPU can't be holding a spin lock when it goes offline or it
will deadlock other CPUs. rtas permits stop-self to be called without
serialising all other rtas operations.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/rtas.h |  2 ++
 lib/powerpc/rtas.c     | 78 +++++++++++++++++++++++++++++++++---------
 2 files changed, 64 insertions(+), 16 deletions(-)

diff --git a/lib/powerpc/asm/rtas.h b/lib/powerpc/asm/rtas.h
index 6fb407a1..364bf935 100644
--- a/lib/powerpc/asm/rtas.h
+++ b/lib/powerpc/asm/rtas.h
@@ -23,8 +23,10 @@ struct rtas_args {
 extern void rtas_init(void);
 extern int rtas_token(const char *service, uint32_t *token);
 extern int rtas_call(int token, int nargs, int nret, int *outputs, ...);
+extern int rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret, int *outputs, ...);
 
 extern void rtas_power_off(void);
+extern void rtas_stop_self(void);
 #endif /* __ASSEMBLY__ */
 
 #define RTAS_MSR_MASK 0xfffffffffffffffe
diff --git a/lib/powerpc/rtas.c b/lib/powerpc/rtas.c
index 41c0a243..b77a60b0 100644
--- a/lib/powerpc/rtas.c
+++ b/lib/powerpc/rtas.c
@@ -87,40 +87,86 @@ int rtas_token(const char *service, uint32_t *token)
 	return 0;
 }
 
-int rtas_call(int token, int nargs, int nret, int *outputs, ...)
+static void __rtas_call(struct rtas_args *args)
 {
-	va_list list;
-	int ret, i;
+	enter_rtas(__pa(args));
+}
 
-	spin_lock(&rtas_lock);
+static int rtas_call_unlocked_va(struct rtas_args *args,
+			  int token, int nargs, int nret, int *outputs,
+			  va_list list)
+{
+	int ret, i;
 
-	rtas_args.token = cpu_to_be32(token);
-	rtas_args.nargs = cpu_to_be32(nargs);
-	rtas_args.nret = cpu_to_be32(nret);
-	rtas_args.rets = &rtas_args.args[nargs];
+	args->token = cpu_to_be32(token);
+	args->nargs = cpu_to_be32(nargs);
+	args->nret = cpu_to_be32(nret);
+	args->rets = &args->args[nargs];
 
-	va_start(list, outputs);
 	for (i = 0; i < nargs; ++i)
-		rtas_args.args[i] = cpu_to_be32(va_arg(list, u32));
-	va_end(list);
+		args->args[i] = cpu_to_be32(va_arg(list, u32));
 
 	for (i = 0; i < nret; ++i)
-		rtas_args.rets[i] = 0;
+		args->rets[i] = 0;
 
-	enter_rtas(__pa(&rtas_args));
+	__rtas_call(args);
 
 	if (nret > 1 && outputs != NULL)
 		for (i = 0; i < nret - 1; ++i)
-			outputs[i] = be32_to_cpu(rtas_args.rets[i + 1]);
+			outputs[i] = be32_to_cpu(args->rets[i + 1]);
+
+	ret = nret > 0 ? be32_to_cpu(args->rets[0]) : 0;
+
+	return ret;
+}
+
+int rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret, int *outputs, ...)
+{
+	va_list list;
+	int ret;
 
-	ret = nret > 0 ? be32_to_cpu(rtas_args.rets[0]) : 0;
+	va_start(list, outputs);
+	ret = rtas_call_unlocked_va(args, token, nargs, nret, outputs, list);
+	va_end(list);
+
+	return ret;
+}
+
+int rtas_call(int token, int nargs, int nret, int *outputs, ...)
+{
+	va_list list;
+	int ret;
+
+	spin_lock(&rtas_lock);
+
+	va_start(list, outputs);
+	ret = rtas_call_unlocked_va(&rtas_args, token, nargs, nret, outputs, list);
+	va_end(list);
 
 	spin_unlock(&rtas_lock);
+
 	return ret;
 }
 
+void rtas_stop_self(void)
+{
+	struct rtas_args args;
+	uint32_t token;
+	int ret;
+
+	ret = rtas_token("stop-self", &token);
+	if (ret) {
+		puts("RTAS stop-self not available\n");
+		return;
+	}
+
+	ret = rtas_call_unlocked(&args, token, 0, 1, NULL);
+	printf("RTAS stop-self returnd %d\n", ret);
+}
+
 void rtas_power_off(void)
 {
+	struct rtas_args args;
 	uint32_t token;
 	int ret;
 
@@ -130,6 +176,6 @@ void rtas_power_off(void)
 		return;
 	}
 
-	ret = rtas_call(token, 2, 1, NULL, -1, -1);
+	ret = rtas_call_unlocked(&args, token, 2, 1, NULL, -1, -1);
 	printf("RTAS power-off returned %d\n", ret);
 }
-- 
2.42.0

