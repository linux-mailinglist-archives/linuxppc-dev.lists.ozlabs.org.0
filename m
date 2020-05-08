Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 280B31CA26D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 06:53:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JHyk4XVnzDqSl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 14:53:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EdBSX39k; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JHYB4y3MzDqxd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 14:34:38 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 18so299977pfx.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 21:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XIISH0R++NGQPDNJIMbZ3ILuQzuIIfNCuCE8WCWA/gU=;
 b=EdBSX39kH+d9lbALS/uvAof0a+bnjS8H7gXNsaxY31WEKsoUCos5fRec621QsgeS+m
 K8Brc11/oh2w2N0K0uwvHOlEndRRUbESqJtQKUResekJ7n5TsMJwyeg2thxzZme8sICn
 qOkCYyFWfGlNV9BfYDwdeqtSo+JCeUOECOnPu8hCnfi7BR6FqWIDePMXHWCo6zL41p2i
 Uhnr4/PaaoqTC3QOybeOOSrFnEu8RZXB/4njGS8vTUp3nfUcIWCHnsGfyPdNKh8QZuG3
 WsxnIyZT243TgtVv5OdxP0Jo9O3dwSCy3ySq0aphDOi8F+a0grKSrxdFG/qJD9UEXS4g
 T5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XIISH0R++NGQPDNJIMbZ3ILuQzuIIfNCuCE8WCWA/gU=;
 b=kZ2RJOaeez/al9iqF4RfShKSC6jjPYBc4nrT47QaXMOe0q66XYQia80hMOYnuKak0q
 fxY7cue88ayZtVt/e+rysXhl7zk+5XrM93xxxLEhQRDl+0/kvKn2JE4LySOBFtyVqJZ6
 pzYVPvQs7b9lvVwY7t8CPN1Vdkrj76/WorqzEJBzkjC/alaI5fM9U2U38wRUEuyL0Oup
 CLqiuN8cVMxU9qBXk5DK7XIQXC7T7sLlFLo1KpVQnJzWtk1rKt0MTnHLFIHQ3NFCjUk9
 /gAls+w8w87MFW9YCaYhRHBKZoyXVGp5YSllUQ1dGTziLitadLCNA2LOpSi62nJeLA4t
 FDZg==
X-Gm-Message-State: AGi0PuZWCxghJy2ZwCQESuj1WA6R09MxgIL3koPGpW3NM3eQiBLJDXtm
 vtO6KZePzXb0fhiVjzV3mCO6RfzT
X-Google-Smtp-Source: APiQypLFFBcnZspkAyb8OvUFAEkOD15V7rQED3NNruD8dMugKaHOUbO3fADeXjg5Se2yLE0NzvP7PQ==
X-Received: by 2002:a63:d501:: with SMTP id c1mr585284pgg.186.1588912475959;
 Thu, 07 May 2020 21:34:35 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id i9sm358813pfk.199.2020.05.07.21.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 21:34:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 08/16] powerpc/pseries/ras: fwnmi sreset should not
 interlock
Date: Fri,  8 May 2020 14:34:00 +1000
Message-Id: <20200508043408.886394-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200508043408.886394-1-npiggin@gmail.com>
References: <20200508043408.886394-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PAPR does not specify that fwnmi sreset should be interlocked, and
PowerVM (and therefore now QEMU) do not require it.

These "ibm,nmi-interlock" calls are ignored by firmware, but there
is a possibility that the sreset could have interrupted a machine
check and release the machine check's interlock too early, corrupting
it if another machine check came in.

This is an extremely rare case, but it should be fixed for clarity
and reducing the code executed in the sreset path. Firmware also
does not provide error information for the sreset case to look at, so
remove that comment.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/ras.c | 46 +++++++++++++++++++---------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index fe14186a8cef..b2adba59f0ff 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -406,6 +406,20 @@ static inline struct rtas_error_log *fwnmi_get_errlog(void)
 	return (struct rtas_error_log *)local_paca->mce_data_buf;
 }
 
+static unsigned long *fwnmi_get_savep(struct pt_regs *regs)
+{
+	unsigned long savep_ra;
+
+	/* Mask top two bits */
+	savep_ra = regs->gpr[3] & ~(0x3UL << 62);
+	if (!VALID_FWNMI_BUFFER(savep_ra)) {
+		printk(KERN_ERR "FWNMI: corrupt r3 0x%016lx\n", regs->gpr[3]);
+		return NULL;
+	}
+
+	return __va(savep_ra);
+}
+
 /*
  * Get the error information for errors coming through the
  * FWNMI vectors.  The pt_regs' r3 will be updated to reflect
@@ -423,20 +437,14 @@ static inline struct rtas_error_log *fwnmi_get_errlog(void)
  */
 static struct rtas_error_log *fwnmi_get_errinfo(struct pt_regs *regs)
 {
-	unsigned long savep_ra;
 	unsigned long *savep;
 	struct rtas_error_log *h;
 
-	/* Mask top two bits */
-	savep_ra = regs->gpr[3] & ~(0x3UL << 62);
-
-	if (!VALID_FWNMI_BUFFER(savep_ra)) {
-		printk(KERN_ERR "FWNMI: corrupt r3 0x%016lx\n", regs->gpr[3]);
+	savep = fwnmi_get_savep(regs);
+	if (!savep)
 		return NULL;
-	}
 
-	savep = __va(savep_ra);
-	regs->gpr[3] = be64_to_cpu(savep[0]);	/* restore original r3 */
+	regs->gpr[3] = be64_to_cpu(savep[0]); /* restore original r3 */
 
 	h = (struct rtas_error_log *)&savep[1];
 	/* Use the per cpu buffer from paca to store rtas error log */
@@ -483,11 +491,21 @@ int pSeries_system_reset_exception(struct pt_regs *regs)
 #endif
 
 	if (fwnmi_active) {
-		struct rtas_error_log *errhdr = fwnmi_get_errinfo(regs);
-		if (errhdr) {
-			/* XXX Should look at FWNMI information */
-		}
-		fwnmi_release_errinfo();
+		unsigned long *savep;
+
+		/*
+		 * Firmware (PowerVM and KVM) saves r3 to a save area like
+		 * machine check, which is not exactly what PAPR (2.9)
+		 * suggests but there is no way to detect otherwise, so this
+		 * is the interface now.
+		 *
+		 * System resets do not save any error log or require an
+		 * "ibm,nmi-interlock" rtas call to release.
+		 */
+
+		savep = fwnmi_get_savep(regs);
+		if (savep)
+			regs->gpr[3] = be64_to_cpu(savep[0]); /* restore original r3 */
 	}
 
 	if (smp_handle_nmi_ipi(regs))
-- 
2.23.0

