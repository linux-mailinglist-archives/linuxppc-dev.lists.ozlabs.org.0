Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 020D464EB29
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 13:04:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYSSF5mHMz3fBR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 23:03:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kzPbNopU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kzPbNopU;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYSMT1WZTz3bXL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 22:59:48 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d7so2065034pll.9
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 03:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFdtN6Twm/Q4+OPS0op+uuJ+Ke3EoqZ59eFa8lp8vg8=;
        b=kzPbNopUo66h5349XieMml0MHtHLSr2gUNysz4KZzRCVuqVFDewHZeLyGG35w6r5Ba
         lRXg0SzBOtimlbNMc2lscMmDfhrwheCZ5AVK1JnTN/6NMLh0RGSiNFRxeOD11EmLiocH
         hPB1TJHVIEm5y6GzQ4+Vjpfw1ujv4N8A3XOTEmjs/JRIWZt7+MJVRquoD7pqjUTYNaMb
         xlGHSQQDUlW8kXNFu/gVCZeHGYwrYRerA/VtLOR5q0U5d7Z82JNl5+sUH8pXdVKCv48h
         t4LleNsLt1rwPyJlJlnRA4d32NMHKHMdynujCPW0mm7wxxltFm+U10FhGolWgecqY7Ki
         pFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFdtN6Twm/Q4+OPS0op+uuJ+Ke3EoqZ59eFa8lp8vg8=;
        b=VUJ6g8zH8Yhteyr86lqRVQOfxSLyZfHA0Kx/O5D5qbo7eIiuzSZ7YZ6Xuwz3nciyCY
         bFUPBNEJP4C8FVBrN9wZNQzHUZl3LIJzvfTvxlxTvbPwWQQREGU++FPJLwPYrcRkxybi
         Lh7U/sq019Ute1NJStNbJupwxo7fC/n+YnZ4O+QQshZmO5LkM7Upo+FkcYUcxScQOEaq
         35au/jrpNQB/jcClql+YcpucLawXTUFjE/bs9hGuLkJY1M3s0zwanjeaUdSM/+ukpW6n
         GPreTTyeymfaMwZeLPIC9Ht7f1nx9Kfop5qz0aSOyjsPZ+mvFqWR0pCScHcAM4KxTbFa
         CWPQ==
X-Gm-Message-State: ANoB5pms3OsFrRTj6uyeg1PFxmaQRLkhyVZdDpkXrVoosdEL/ESwLlOW
	5IXtrL9Qrt2CQ098MSA6BDEbuN74bHUKfQ==
X-Google-Smtp-Source: AA0mqf5BKYE9FM+XiurZWsY8i49rG4DwhuZdJYP8GMKlLdDijFkR3vQGY9O/CEUPOTfgOMeN/q2kcw==
X-Received: by 2002:a05:6a20:441e:b0:ac:16ae:1082 with SMTP id ce30-20020a056a20441e00b000ac16ae1082mr56647442pzb.32.1671191986408;
        Fri, 16 Dec 2022 03:59:46 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-236-36.tpgi.com.au. [115.64.236.36])
        by smtp.gmail.com with ESMTPSA id g22-20020a625216000000b0057ef155103asm1289438pfb.155.2022.12.16.03.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 03:59:45 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] powerpc: Skip stack validation checking alternate stacks if they are not allocated
Date: Fri, 16 Dec 2022 21:59:30 +1000
Message-Id: <20221216115930.2667772-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221216115930.2667772-1-npiggin@gmail.com>
References: <20221216115930.2667772-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stack validation in early boot can just bail out of checking alternate
stacks if they are not validated yet. Checking against a NULL stack
could cause NULLish pointer values to be considered valid.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/process.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index edb46d0806ef..95d605bdff85 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2118,6 +2118,9 @@ static inline int valid_irq_stack(unsigned long sp, struct task_struct *p,
 	unsigned long stack_page;
 	unsigned long cpu = task_cpu(p);
 
+	if (!hardirq_ctx[cpu] || !softirq_ctx[cpu])
+		return 0;
+
 	stack_page = (unsigned long)hardirq_ctx[cpu];
 	if (sp >= stack_page && sp <= stack_page + THREAD_SIZE - nbytes)
 		return 1;
@@ -2139,6 +2142,14 @@ static inline int valid_emergency_stack(unsigned long sp, struct task_struct *p,
 	if (!paca_ptrs)
 		return 0;
 
+	if (!paca_ptrs[cpu]->emergency_sp)
+		return 0;
+
+# ifdef CONFIG_PPC_BOOK3S_64
+	if (!paca_ptrs[cpu]->nmi_emergency_sp || !paca_ptrs[cpu]->mc_emergency_sp)
+		return 0;
+#endif
+
 	stack_page = (unsigned long)paca_ptrs[cpu]->emergency_sp - THREAD_SIZE;
 	if (sp >= stack_page && sp <= stack_page + THREAD_SIZE - nbytes)
 		return 1;
-- 
2.37.2

