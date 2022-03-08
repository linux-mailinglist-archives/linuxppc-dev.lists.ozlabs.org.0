Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DA34D19C3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 14:57:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCcMQ01h4z3dvV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 00:57:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HECTdVXb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HECTdVXb; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCcDn6LwLz3bYF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 00:51:21 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id e6so16517160pgn.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Mar 2022 05:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qXb9IHo1asDPkqZNu9p0vzq4rW+WxWDBHIR59qtpnt4=;
 b=HECTdVXbPOWnf63k3n+gPMBXwRZVQXCRz3g/tkWRfibzLq1gNqjrMXtdY5gQuuJi4T
 Ug44erU2RZLC9MHamMTDNZngozmlNiyd/W2cVJ1ZzpgcZghlt14R6uNUgL8V2XfajT+f
 ihrWLXiInsUz4NyZE5Be3f/SEwxNzSdQFgmBtDn+JTHp//CDdpy32r2x8Yjhv1Bn/Vdo
 U0DxSqauP3a1wSpjXgKsd8KYvP+Bt7Dnz8m2va/+RmL1CVzLdi9YkytL4vOq6uBRyqgg
 v6BnW5hc0Aa7GMojdQZ/FmA1le1VysT4XiGtMb7fTP/vfA+YJOEoZrIBkIfHiL1G1Usn
 DO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qXb9IHo1asDPkqZNu9p0vzq4rW+WxWDBHIR59qtpnt4=;
 b=Ilv5PCai9Qu8dNP0l+LUMg+dV2N/gcKqfhu1tiwLN+kXzeZq7m2cgHsEPduPShdb5P
 n01p/ZdXG6M9np3dEIgL91B2JyNlg8HRI3z85TYI3LhwMT9XNrnBJX14RjaCcIp25ySz
 nWOUD5A3wIL0AFOBCSWa/kLOEvn7hyLATw0t50B7okfWr2TyYY+EyYfCFnypKIJopIRp
 R+wQYr6tAE1F3MFDUHFL0dmpn0/q/J0zicuU7RZbNS6IXUsx8cQzaz7ecCUG6Egdy67a
 IpGS/TCzyxogaYHI+uWI5pLNljUz/v2YDtaaJQY2xgtMbqVL26xrSlfP8hCBuawfIycJ
 AFaQ==
X-Gm-Message-State: AOAM531rvKoHCciMpSQkxK55wIWcKxzxT2SsDvNVddRcNvu8iyPm7RzF
 03JBtSZkmq0EGeWguLwowhsS61ucDds=
X-Google-Smtp-Source: ABdhPJwzcN8JMSJKvAzmKZHLxlLAgzUa2b/X2laCmsd4b7sDQLhzb8kLiFVFF0JmCL39nuBfpf4reA==
X-Received: by 2002:a05:6a00:14d6:b0:4f6:f496:c1e2 with SMTP id
 w22-20020a056a0014d600b004f6f496c1e2mr11939895pfu.45.1646747480722; 
 Tue, 08 Mar 2022 05:51:20 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm541737pfu.86.2022.03.08.05.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:51:20 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/14] powerpc/rtas: Leave MSR[RI] enabled over RTAS call
Date: Tue,  8 Mar 2022 23:50:42 +1000
Message-Id: <20220308135047.478297-10-npiggin@gmail.com>
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

PAPR specifies that RTAS may be called with MSR[RI] enabled if the
calling context is recoverable, and RTAS will manage RI as necessary.
Call the rtas entry point with RI enabled, and add a check to ensure
the caller has RI enabled.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/rtas.c       |  1 +
 arch/powerpc/kernel/rtas_entry.S | 13 +++----------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 87ede1877816..fece066115f0 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -57,6 +57,7 @@ static noinline void do_enter_rtas(unsigned long args)
 		hard_irq_disable();
 
 		msr = mfmsr();
+		BUG_ON(!(msr & MSR_RI));
 		mtmsr(msr & ~(MSR_IR|MSR_DR));
 		enter_rtas(args);
 		mtmsr(msr);
diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
index 292551684bbd..72b27b14ccc9 100644
--- a/arch/powerpc/kernel/rtas_entry.S
+++ b/arch/powerpc/kernel/rtas_entry.S
@@ -95,7 +95,7 @@ _GLOBAL(enter_rtas)
 	clrldi	r4,r4,2			/* convert to realmode address */
 	mtlr	r4
 
-	LOAD_REG_IMMEDIATE(r6, MSR_ME)
+	LOAD_REG_IMMEDIATE(r6, MSR_ME|MSR_RI)
 
 	LOAD_REG_ADDR(r4, rtas)
 	ld	r5,RTASENTRY(r4)	/* get the rtas->entry value */
@@ -113,15 +113,8 @@ _ASM_NOKPROBE_SYMBOL(enter_rtas)
 rtas_return_loc:
 	FIXUP_ENDIAN
 
-	/*
-	 * Clear RI and set SF before anything.
-	 */
-	mfmsr	r6
-	li	r0,MSR_RI
-	andc	r6,r6,r0
-	sldi	r0,r0,(MSR_SF_LG - MSR_RI_LG)
-	or	r6,r6,r0
-	sync
+	/* Set SF before anything. */
+	LOAD_REG_IMMEDIATE(r6, MSR_KERNEL & ~(MSR_IR|MSR_DR))
 	mtmsrd	r6
 
 	GET_PACA(r13)
-- 
2.23.0

