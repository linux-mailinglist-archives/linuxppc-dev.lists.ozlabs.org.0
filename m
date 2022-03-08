Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 635664D19EA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 15:00:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCcR723DSz3bqt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 01:00:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=T/69Wjn6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=T/69Wjn6; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCcF22md9z3bbN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 00:51:34 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id o8so16523507pgf.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Mar 2022 05:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+JzjzlDXucMUsZydIfb9gQWfLZXovxyiwNBQFRBZaHU=;
 b=T/69Wjn6Bd89L62zMAaSZkiR/9SJhGHDJoq85bPKd9Z5N9b1S0wQe5S1naonuwcNs3
 hy7tMUrI88wPRUyD5+Hf0MUiUtWA3RPgJLgE+9HLA95ZJ//Mej/xAm+F1X179J9dv2jc
 EQgH/90eRJ7Y2iaVR3BDV6o37/i1NKaRE5PllV3VZefGe62x9rh20bp68aWup7nvYqRm
 AfB4r7P+BoGx9mgYt1L56M+QAO5yDugbCbTtScw0CM5unoudC2zrkVU31EpJBWUSOVrY
 /MfeIdwSm/QIhbiLY0IH2pW4X0Prx+/dNbS8H28CnZO8iNr9+OPpiMP6OaKwRmpEtpTe
 XRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+JzjzlDXucMUsZydIfb9gQWfLZXovxyiwNBQFRBZaHU=;
 b=aSf2g07vm+31lzKpaxQoXrLu3WXecMIAcA/xD09OyfiPVhhSP7HjlPw1HVL+TbGzOq
 sh3F4Gm6TcGL0mtgLsLhCehMywKWyOMbtoq+kzeG1XxXggox6K2fB2ymHbF2LirM8Y4G
 jRfGWS0bxGWIdZ7uaylDBqhZtQEuHh5HHK0jgzXy3TN9JeSEn8yFxD2LlNZDXDrvkDNh
 SkE/UahOAM2FNSSPjXPlKL6aEPlT+ZJfwiGi5txKQ73y1SEye3CXxEX26W+qSXYohjWp
 B92SWq26ffAuIvvy/EbOImJBcUaM2w+CK84agKYbGxOkLNWzsMW9OXln6IxASvzrvXWz
 pZjQ==
X-Gm-Message-State: AOAM531ClfnEYYXFk3NLhE+iQdz2j+GSW3LW/fAObWdQLRdJme1cl5LR
 NQPdQYnxrVwdP/hIIaXSYER+fZMKrU0=
X-Google-Smtp-Source: ABdhPJzU1B0X1dxWBUY9A/TJiEp9REqU5lCN+ZqMvCtSmoKigMHxte5R0gHV2qxyVPm0YujS4nLkow==
X-Received: by 2002:a65:5307:0:b0:374:315a:bc32 with SMTP id
 m7-20020a655307000000b00374315abc32mr14327989pgq.342.1646747493319; 
 Tue, 08 Mar 2022 05:51:33 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm541737pfu.86.2022.03.08.05.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:51:33 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 14/14] powerpc/rtas: Consolidate and improve checking for rtas
 callers
Date: Tue,  8 Mar 2022 23:50:47 +1000
Message-Id: <20220308135047.478297-15-npiggin@gmail.com>
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

Add range checking from the rtas syscall, and other error checks
and warnings to kernel callers, so problems can be found and
fixed.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/rtas.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index adf4892aeecd..7f8a3fd685f9 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -428,6 +428,23 @@ static int notrace va_raw_rtas_call(struct rtas_args *args, int token,
 {
 	int i;
 
+	if (!irqs_disabled()) {
+		WARN_ON_ONCE(1);
+		return -1;
+	}
+
+	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE) {
+		WARN_ON_ONCE(1);
+		return -1;
+	}
+
+	if (nargs >= ARRAY_SIZE(args->args)
+	    || nret > ARRAY_SIZE(args->args)
+	    || nargs + nret > ARRAY_SIZE(args->args)) {
+		WARN_ON_ONCE(1);
+		return -1;
+	}
+
 	args->token = cpu_to_be32(token);
 	args->nargs = cpu_to_be32(nargs);
 	args->nret  = cpu_to_be32(nret);
@@ -476,9 +493,6 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 	char *buff_copy = NULL;
 	int ret;
 
-	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
-		return -1;
-
 	if ((mfmsr() & (MSR_IR|MSR_DR)) != (MSR_IR|MSR_DR)) {
 		WARN_ON_ONCE(1);
 		return -1;
@@ -955,9 +969,6 @@ int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...)
 	unsigned long flags;
 	int ret;
 
-	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
-		return -1;
-
 	local_irq_save(flags);
 	preempt_disable();
 
-- 
2.23.0

