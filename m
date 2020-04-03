Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E561E19D89F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 16:05:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v1tB6ljczDsXK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 01:05:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=l1AaTpU3; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v11n5PLSzDrgv
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 00:27:09 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id z3so2929452pjr.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 06:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TUXuizyMsoZnBOI8em+MBd+XmwQZFbfRlwmLQpUkRg=;
 b=l1AaTpU3tllOoMUx9oAkNCxXy5S9b71LraEYtKL85ueuWI5W0HOGjKoZxp6tdbyQ61
 g64ZKIpPvRpq2y4QBRmI881AXKHp1zCOkRMModaNFjU9jcc+zPjm99a9u2ZEq2vBRWjp
 Hco3/SaWysxf+TH+5dGzXCTFLJKG3wDOLhjMr5GegOqS4Qcu+dd40bR2VTPV7IgVUU/e
 awhtWlLlhTlhGDqBeiX+/rZ/89S1mj3km6Cs1uCokn1tIZQ30Gc/tkaUS0pV0qP728A5
 05Ozz7xZS3mfuR9UVXLPFW67qCKF2p0O0BOpgF7mUHneG+Oc9Jzfa8PYq/W87WHpyBb+
 oTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4TUXuizyMsoZnBOI8em+MBd+XmwQZFbfRlwmLQpUkRg=;
 b=IktKQiqKQl1opHbq24TTylc/8zMPfjs30kdp8tvrFQ8baaD9bb71b+v8VfnJpnnJyQ
 SkPOk0maN/2N+1UQ5BjbgEY3hoEXo6mTfAstr5JV4LqKW2CZac/U3WKkuy9ZVj71YF8J
 XfTxOmXuXJKUJ3brKF2SqtEmu8jhZoukeCAzvJ1n0w6tdhKMvq/LWImuOS89tP6ktqKg
 ktbqhTItYGJdNTjUybxsVuMRpWLuMgQdyxYazme4rFCIYH4GqvtQolzUReNw1W9ITlWS
 SdYwlJ1YFg7Tt5d5EpTDsM1AJtqqtpPH0LGqhnQ0jcKAbnOf1peT9GoLaIXVmjlZbcEC
 +/EQ==
X-Gm-Message-State: AGi0PubqfYniGmkSDILTzF//CYjw2T8qZFjMylhwegKNT1z4ryMYZnQ5
 dL19xCWJXfQjFDsQibDqFS0PgOHQ
X-Google-Smtp-Source: APiQypK2fJKRZN20D6+PlJOa3Tn623QaQ9vGIV3QYPII7UWmLARuCQzv1lLA/QH5WSCLSHMyexMACA==
X-Received: by 2002:a17:90a:240e:: with SMTP id
 h14mr9716517pje.5.1585920427341; 
 Fri, 03 Apr 2020 06:27:07 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id o65sm5941422pfg.187.2020.04.03.06.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:27:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/14] powerpc/pseries/ras: fwnmi sreset should not
 interlock
Date: Fri,  3 Apr 2020 23:26:16 +1000
Message-Id: <20200403132622.130394-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200403132622.130394-1-npiggin@gmail.com>
References: <20200403132622.130394-1-npiggin@gmail.com>
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

