Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D431A069B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:34:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xGLd6npNzDqxG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:34:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L/4Vp/zI; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xG0L28tBzDqwr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:18:42 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id z3so256268pjr.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 22:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J2d8SodfVq4cl53g6Zx9CF5p3xN2FuBCQ0uNfWfubMM=;
 b=L/4Vp/zIE7AeF9OycMqvREUm7Pe/6TNoJ59QXlfUkFxS9R+u75qEY0iooPNqIo+mrA
 cG7TtGdgpB6UJmJAKT2m5ca868qiFIrG3zwZuIlXHpwQZusAKjQ2Ne/KAEsWYXuaG/Zf
 IMsmE6fpofmRW82v7aUtgLH+F7Y2ZiQpQsrIQNZHDxQ85N1K2RNqQTKLcq9hO8EsLTh8
 ED+oX67CUHEBGkZZmzBhgF+G6Qmefk8eR+Hgn6jXRKVnQOciD8ePOzUlU6OofGGiaTRU
 FjyhhPuJluyXDnOIMmVGiyhDdz4BwMqOc5UFToS5Cb3NC/iMtokU4SXfffI5oO8XrE5O
 azQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J2d8SodfVq4cl53g6Zx9CF5p3xN2FuBCQ0uNfWfubMM=;
 b=P4TqH4LND7fCfucqWxxjAacJfllvLc1yR71Iamm3pmAuAxW1MaNPTkZYgv5joU8Odl
 kzROYg0m0+EyENb4MKp71Rdd97QABKh5ozJuDhDIeRwJnRUpkRAG8GN9Lk5oMLTgiTx9
 YeAIlP3cfDMmFDhX1/Atb9nn5Dgs0MhhH2JgDMWgu3bM4esgkhfVnq3877H8aZMTmRbr
 gPRLXjWCC2gVbTvGxrzl6hM4OErzBlu/v12ZQWpmkSqLjeyEuwqU/qy1nntb2S8xUJn6
 AqsrXfP49v6bqZRz3aiPQ02vIFLDBnCXUu692HM7zb2fg2RrzgmnymCd4cw5X1WwC7jf
 dqPg==
X-Gm-Message-State: AGi0PuaNdbcyvk39KMTgfSQFtzQ8xmt+/fDAFy/pnICLf5ZT2NRMCmoB
 8LXymTsF6aa/PPMK90oOGt1uFhk/
X-Google-Smtp-Source: APiQypKQBGAvlGWUsdcYgEduAp5IWNK26t01El9DVbFgBtXGcG+DZCexBXH8tSfv2kxTmSrEGnQ5zQ==
X-Received: by 2002:a17:902:b617:: with SMTP id
 b23mr867241pls.194.1586236719229; 
 Mon, 06 Apr 2020 22:18:39 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y17sm12866486pfl.104.2020.04.06.22.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 22:18:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 08/15] powerpc/pseries/ras: fwnmi sreset should not
 interlock
Date: Tue,  7 Apr 2020 15:16:29 +1000
Message-Id: <20200407051636.648369-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200407051636.648369-1-npiggin@gmail.com>
References: <20200407051636.648369-1-npiggin@gmail.com>
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
 arch/powerpc/platforms/pseries/ras.c | 46 +++++++++++++++++++---------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 2c60e2be1bc5..d65bc38bcb8f 100644
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

