Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EB8187BF6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 10:22:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hSP95rlMzDqsw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 20:22:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TKNkazcE; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hS7g4jVBzDqWK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 20:10:39 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id m5so11386026pgg.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TUXuizyMsoZnBOI8em+MBd+XmwQZFbfRlwmLQpUkRg=;
 b=TKNkazcEs/BFtzBq8Z5xDytGYqQEc4lojQJ+8+tRbeB/YelHWUgPD0YaAdNOwwpzRr
 tuR/GdWtPWjZ4i0DvGFH1I/TYFAXjNFhAl8Hox9XpxmBtQCsbMKMwpmQ0m3t41zo+tRe
 L5fm+vIl3hyU6VvwhVBgXC/0UFzyCRH76ebQCKJkTaqUzaoXgeXVAzcjXLqnMoaMLp6q
 XtjEMAbIgeTl1PK1OrI3MR0ooffTXwScixHdXRzeThK1AmRFRZ8IZ9+GuCZTSZJpvYfG
 H6fE34pDa6ucV9YvVUKhvxtuk/fcPkwxgU2cMYhejVJ7QGiXbh+QhZgPdP6ebln/T5kW
 OUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4TUXuizyMsoZnBOI8em+MBd+XmwQZFbfRlwmLQpUkRg=;
 b=pkNPSj7n7Yt7e5q0GC57oHRt9dmrdqOSWmdk4hVdnV6slfywUx36Qih3Fs3b/nd0Iu
 FcCigShnDeEKdKVm85a4ZKJk0xdb2drI/R/bvavOwLKODNNfZaSUFe13Y5RxF4nGLVRg
 GjdadeNKo2378ArEyy2HRdOeTIerJXAa/D75BgsPp/ogjHVAsqrFSlCoIoTaSlWD/4Hx
 n3xI+kuf/09wDRTJnrjcwY0FRjP66DXjm/WcqSnPOacEoBZoD7wfjFvhfIb+BFIy3skh
 KB5UtSxvY71NJgt3EN94teCx5ONknTM0zhuKRWe92uqPqNO9LEfecNQStasgOOqLGwFY
 hRyg==
X-Gm-Message-State: ANhLgQ2IWJl+cbcY1Ccl98lCBvir47mKT0NWMXbfvCbDhUzpIjruwwJt
 p7mR8WTf0DDWHyUraAPxFmS4xvw3
X-Google-Smtp-Source: ADFU+vuC9g4umkULYDS7FuR374W43UsQdsUmgrqqGHp+7rtTC/xtOhT74lV4kRBWkvD6C19QnnoGtg==
X-Received: by 2002:a63:5f43:: with SMTP id t64mr4121566pgb.207.1584436236936; 
 Tue, 17 Mar 2020 02:10:36 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-202-190-183.tpgi.com.au.
 [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id i13sm2463745pfd.180.2020.03.17.02.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 02:10:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 7/7] powerpc/pseries/ras: fwnmi sreset should not interlock
Date: Tue, 17 Mar 2020 19:09:13 +1000
Message-Id: <20200317090913.343097-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200317090913.343097-1-npiggin@gmail.com>
References: <20200317090913.343097-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
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
 arch/powerpc/platforms/pseries/ras.c | 48 ++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index a40598e6e525..833ae34b7fec 100644
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
@@ -423,20 +437,15 @@ static inline struct rtas_error_log *fwnmi_get_errlog(void)
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
+	/* restore original r3 */
+	regs->gpr[3] = be64_to_cpu(savep[0]);
 
 	h = (struct rtas_error_log *)&savep[1];
 	/* Use the per cpu buffer from paca to store rtas error log */
@@ -483,11 +492,22 @@ int pSeries_system_reset_exception(struct pt_regs *regs)
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
+		/* restore original r3 */
+		if (savep)
+			regs->gpr[3] = be64_to_cpu(savep[0]);
 	}
 
 	if (smp_handle_nmi_ipi(regs))
-- 
2.23.0

