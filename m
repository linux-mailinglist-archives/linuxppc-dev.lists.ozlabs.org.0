Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE5A89987C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:51:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nVKE5WOX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sdw6Hbbz3wPh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:51:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nVKE5WOX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sL23rZ4z3vfM
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:37:14 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3c5dc2fa2d4so119676b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306231; x=1712911031; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4yJRII8fMy/F3bi6dE4gOA3IVVXz2IcrfhDD/wKV2o=;
        b=nVKE5WOXac7GdOU28OVwODbhnHwmJMCc0Uk0h8V7tHES7ZE5z444ZZ7Bck/inkCFIi
         jY8HCSnljY7gqoOdyOqDVbyqTavjzwTB5uCp+UPPaDunOw1eORONwJ+gM+JdSnQazXjL
         SzWKdKsZQo1NAdcy2bdDHZ/d2O8UIuMUeFwsZCQHj2Jg8Mcxm2lCbSoUF0SJCkyHJUYO
         xQ20w70uuKcF+tSxOCb/qvhIqZoXT78gUhD42o9YWbiProSsY/ycBiROCgV/WxCaUIuD
         KrhBPxmIt3KvnvjMzd1nPVH2NSQ8W3SOzxr8H19Kcna/zwA6J5ONAt6aO178YrFrTFXs
         YZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306231; x=1712911031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4yJRII8fMy/F3bi6dE4gOA3IVVXz2IcrfhDD/wKV2o=;
        b=oKuOY6qCKx3mhE/5QjPUlofAbqh2YAlViVg8ooFNNl0ThVj3u71vaGDr7ybvDVo8J/
         gbbEpj0KfcxweJpo9HxVLJxXqHFV87AjMrz7MBL1orwiQyWaj4Rj77rWMH9c1RisUOv7
         meRjGE7dApR7zXeDoiV7JyRWesfpKsV8U3NNqlOB21cwkefDDsWiU/r2kSzKaTfjHyFc
         i+dESP75+OYuCrhNLCHho2jYZJUzJGcM/2Z8ZJIU3nHr4eA7EWcBQSnAahl/j6mGf0LD
         3caiWQKv3DPs6O273vi0gklvdpGnbNTOJH2bzIs3AKcPOmD/ivuSOkI+nzgv9VgVR+LD
         ZZsg==
X-Forwarded-Encrypted: i=1; AJvYcCW7XfrDmzsi6Bhewm7TKj1Bi1zeTPh0IVWlN2Lz3UnkAC/cvAh5iEUbAU4MUyWG8918jmblpEow30yM8HiOeUQxcfalmUlszaclnFZBLw==
X-Gm-Message-State: AOJu0YwZrWJky94nEp7iAEts2pxdbzQ27NdFmJnmzDsDNY82N3yPoO+o
	SArYiMGPufs95m8tpS3kz9VXNtnpWjOntfbUWmLIlrtRllZCLnnY
X-Google-Smtp-Source: AGHT+IHWk4PAG8vMEvtXvT6Gf7/v++jLBVRs7XzHWrQhnPduk3qJmIL7Ajo2FU0nBAvkX13v3rrtVA==
X-Received: by 2002:a05:6808:2a62:b0:3c4:eaa2:2610 with SMTP id fu2-20020a0568082a6200b003c4eaa22610mr751804oib.46.1712306231582;
        Fri, 05 Apr 2024 01:37:11 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:37:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 20/35] powerpc: Add rtas stop-self support
Date: Fri,  5 Apr 2024 18:35:21 +1000
Message-ID: <20240405083539.374995-21-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405083539.374995-1-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for improved SMP support, add stop-self support to the
harness. This is non-trivial because it requires an unlocked rtas
call: a CPU can't be holding a spin lock when it goes offline or it
will deadlock other CPUs. rtas permits stop-self to be called without
serialising all other rtas operations.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/rtas.h |  2 ++
 lib/powerpc/rtas.c     | 78 +++++++++++++++++++++++++++++++++---------
 2 files changed, 64 insertions(+), 16 deletions(-)

diff --git a/lib/powerpc/asm/rtas.h b/lib/powerpc/asm/rtas.h
index 6fb407a18..364bf9355 100644
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
index 41c0a243e..b477a38e0 100644
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
+	printf("RTAS stop-self returned %d\n", ret);
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
2.43.0

