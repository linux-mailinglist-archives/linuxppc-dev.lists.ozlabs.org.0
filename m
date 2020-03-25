Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6776B192632
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 11:51:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nQ0S4ftpzDqJC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 21:51:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CyIKswNj; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nPdX562CzDqpM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 21:35:12 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id m1so650927pll.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TUXuizyMsoZnBOI8em+MBd+XmwQZFbfRlwmLQpUkRg=;
 b=CyIKswNj8FxuXvwyc9OaulVJzjVPmUkg73gz0oduQPRLYSpoW5G2xCdhSdGwvmENd4
 xZ077ELYOpq26YZxeuVjBUrFVyseN5lVhsTR62en2ZfW69VRp1euFZbmf2Z7ibu/1WhY
 7HOPo60bjTwsz1I9l1wVUk6CnRNic3iiJn13zuLFsW2RLErxvR97fPA+j95nxj+9AJA9
 dl1HXQPgXdpbRFsQcfn9d5RMOyZ3P0qjNgoSnSK0BNMupEcsUqSPZG6VLBvC1+1VZ4JR
 ET2+/NSfcqTyJgPvUCsVarkVl3KzWsrweumIYtIM+IN8qC0BG3egST950sp4dejR40EL
 bPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4TUXuizyMsoZnBOI8em+MBd+XmwQZFbfRlwmLQpUkRg=;
 b=DcXCo9DPIqhbAroS4p+4LfclXw5i/9zM0PRp0OfAFXMvozmEYtvxf6xscXRyi7Ir7v
 GDXq3gg06xx6KK+rrvrYTw1Pfadw+LFYPckor/p2rJnBLDXhnuwc4/+RXBvPcF0q2wph
 suE5IKU/Bw4nFZ//kke9LXf8T5pbxHXAZMMoRn+lEtuP8kuvXs/79aaUUq3brIi45DZt
 wKp0JFHIvwTYQyyR1WI+uTurwtKDbPWyBq11374MzkyBTwNR42b9oBJlNuMkvlwFnhpf
 gLMzWEgBTuTNuKoG1OEu98AjsYGCWHT1g2FP72v9Jg+GNbK29wRhyyLdtD0Td3kWFZYo
 zsNA==
X-Gm-Message-State: ANhLgQ3wfDE3dAkQfsJ/GpXo0nQklE8ukkFM0n2+lrqYEjuxWcO+Outi
 03s2NmHf11C1yJedvBGKuMWV53Pm
X-Google-Smtp-Source: ADFU+vt43rxaJUPU7cRwfRkERf+nMiTQujq5mn3Y1lmku9yDzMEGh8QSC23bzeMzBKIih9TNzNacrg==
X-Received: by 2002:a17:902:8647:: with SMTP id
 y7mr2635390plt.224.1585132509697; 
 Wed, 25 Mar 2020 03:35:09 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id b9sm16549701pgi.75.2020.03.25.03.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 03:35:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 07/12] powerpc/pseries/ras: fwnmi sreset should not
 interlock
Date: Wed, 25 Mar 2020 20:34:05 +1000
Message-Id: <20200325103410.157573-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200325103410.157573-1-npiggin@gmail.com>
References: <20200325103410.157573-1-npiggin@gmail.com>
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

