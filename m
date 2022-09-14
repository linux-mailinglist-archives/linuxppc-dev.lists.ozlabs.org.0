Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED945B8C40
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 17:51:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSPv10LqFz3bZg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 01:50:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RQ5XmGOx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RQ5XmGOx;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSPqp19Mkz3bkk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 01:48:05 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so19426457pjq.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=+zJ8nX2IX+io5aGu0truM/QRksMLBevbICF/yO92C/g=;
        b=RQ5XmGOxkhuH5PPVLglLmqAtKcc0YeXVI7zcttWZB6PWb7KXq0oLCJ3jw++0abJQ4n
         inzn56Ml4qTBaZamAmn5eHOdgD6vJkMfxQRvqepJUoY4blPzGbHYQKjQqcFV7bfLB3+X
         5VL/9LerLxZHVX8QD6hGSrC8S8V0AQV9pB3l2NJRPOnONP/3Adh6IieQzxvlvtcVg8/p
         xThLRdFL1kGoLqGaIRtO8kmbRaAomiglXyctvILa9Wj21NdsefkJzFQzHLaOd9+OGOZR
         D/spnfyEbL4bdnEdFTFDkTkV60FaZj08tqhqamvckCVbaTJZ28nH3Ygn6/EBB44nAULI
         SXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+zJ8nX2IX+io5aGu0truM/QRksMLBevbICF/yO92C/g=;
        b=3r9ZooNEde0S3iCY6Y4TW/ohIRUAKgqqw/rdVPECZe74dKgzBUCxhtw9IM6MtZIZ7f
         XYfgYKSLdzdcsTi6dJ8xGw6NcmPaPIYL2HAWuGt5ZSa3ZOC4SsIK5NMAya1TI+77skZ6
         OqKEVbG9iPJ3KMqkt6QPq18dihH6cKX1Rhw1NPJ7X32vzXuQZ0VZOdPu9pmorkNm/ESs
         eXq128wW5ajKJMoLqDXhVwn+h4LLX+d5bDiOTlvyKg4vE3PuQvAX3BFt/13FC41srLtI
         BJ74eE7D+OfWYmpS0EuV134yyYQTC2sF9iPFY9HH8sqNt1jwX7d1d+VlmWa9Q0I6y4iC
         vVnA==
X-Gm-Message-State: ACgBeo3JL06i5bi1HiHRS73Jfp94iA81PO6raFsXhiz30rn64XXGeCgo
	HdDIDcWDwlCeJpWRhLHghYF+nErLlts=
X-Google-Smtp-Source: AA6agR5QdSBbbTOpClluors5kqk4M1lmNbQO4bOo9j1HfAP6Ba/sR+P2PVb3bengN6H+3WS5AHHc7A==
X-Received: by 2002:a17:902:e88b:b0:176:c37f:511c with SMTP id w11-20020a170902e88b00b00176c37f511cmr37911997plg.2.1663170483438;
        Wed, 14 Sep 2022 08:48:03 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090332c700b00177e263303dsm9919892plr.183.2022.09.14.08.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 08:48:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/7] powerpc/build: move got, toc, plt, branch_lt sections to read-only
Date: Thu, 15 Sep 2022 01:47:43 +1000
Message-Id: <20220914154746.1122482-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220914154746.1122482-1-npiggin@gmail.com>
References: <20220914154746.1122482-1-npiggin@gmail.com>
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

This moves linker related tables from .data to read-only area.
Relocations are performed at early boot time before memory is protected,
after which there should be no modifications required.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/vmlinux.lds.S | 42 ++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 341ac79f49a9..716fff86c3fd 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -131,6 +131,10 @@ SECTIONS
 	/* Read-only data */
 	RO_DATA(PAGE_SIZE)
 
+	.branch_lt : AT(ADDR(.branch_lt) - LOAD_OFFSET) {
+		*(.branch_lt)
+	}
+
 #ifdef CONFIG_PPC32
 	.got1 : AT(ADDR(.got1) - LOAD_OFFSET) {
 		*(.got1)
@@ -140,7 +144,30 @@ SECTIONS
 		*(.got2)
 		__got2_end = .;
 	}
+	.got : AT(ADDR(.got) - LOAD_OFFSET) SPECIAL {
+		*(.got)
+		*(.got.plt)
+	}
+	.plt : AT(ADDR(.plt) - LOAD_OFFSET) SPECIAL {
+		/* XXX: is .plt (and .got.plt) required? */
+		*(.plt)
+	}
+
 #else /* CONFIG_PPC32 */
+	.toc1 : AT(ADDR(.toc1) - LOAD_OFFSET) {
+		*(.toc1)
+	}
+
+	.got : AT(ADDR(.got) - LOAD_OFFSET) ALIGN(256) {
+		*(.got)
+#ifndef CONFIG_RELOCATABLE
+		__prom_init_toc_start = .;
+		arch/powerpc/kernel/prom_init.o*(.toc)
+		__prom_init_toc_end = .;
+#endif
+		*(.toc)
+	}
+
 	SOFT_MASK_TABLE(8)
 	RESTART_TABLE(8)
 
@@ -327,26 +354,11 @@ SECTIONS
 		*(.data.rel*)
 		*(SDATA_MAIN)
 		*(.sdata2)
-		*(.got.plt) *(.got)
-		*(.plt)
-		*(.branch_lt)
 	}
 #else
 	.data : AT(ADDR(.data) - LOAD_OFFSET) {
 		DATA_DATA
 		*(.data.rel*)
-		*(.toc1)
-		*(.branch_lt)
-	}
-
-	.got : AT(ADDR(.got) - LOAD_OFFSET) ALIGN(256) {
-		*(.got)
-#ifndef CONFIG_RELOCATABLE
-		__prom_init_toc_start = .;
-		arch/powerpc/kernel/prom_init.o*(.toc)
-		__prom_init_toc_end = .;
-#endif
-		*(.toc)
 	}
 #endif
 
-- 
2.37.2

