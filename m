Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF175BA5A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 06:11:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTLGV6wv8z3cfW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 14:10:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bK/CMhOa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bK/CMhOa;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTLCQ2CcMz3bnH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 14:08:18 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so24389888pjq.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 21:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=8dR4Lohftnx4cWSJ/BDcTN1IRlxOF4hYbEOv5af/wb0=;
        b=bK/CMhOaxVmrlnb0opzsAqelbHDT2HErOS/db00b2DIgyqtG6ddkLQY0t1BjBxLv5W
         3vUDeyju96EwFQgTXeSf4Cdg0dBdHED9c4LCByKzoUVydPPf8kKVj4C7yUPhUsHXdLVx
         odV8hfQvs3wHCj779ww0tLOEwgwVGeeCP+3GyV+V4jLKS4ZRECLBSoRnCxvf89261+eW
         NHrn2fuDEfaZxOhQioT4r9u7D/Vw2nd3fkhS5vyPb5nmw23M78CWiNaOdyYacD77PAqz
         xuvPDFekLH3jsk/DYDp8Fqj6vz08XvF8Z1Yb7NfcgYeVYPGq+sBN7mGjyXbxeS2EEleO
         BY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=8dR4Lohftnx4cWSJ/BDcTN1IRlxOF4hYbEOv5af/wb0=;
        b=WhpRqcWbo6Vh0598wTw93QHO/oB6RzT24cO7iiKFYa+v349vEWCQXEXI2pBGgihRcL
         i8QE/TpCK6LZD4MV6pEK2uZjupa5R+wlM66sWzFYoWWLLjW4Di4PxjU3M9Ugvh8nliKp
         jf3GeA7Vwvrg71u3Ad4ujXHDb1QQdF09VmPWRuOq+lS222q++Bd4kQr8Ged6dO8zafbE
         vjz4wh4Olxwhv92oC30rWXxOuXb23sWecM7IYrU7vVfFbupM65/NiWFCLJNPbkplbMsq
         ao6WJxUo7hVVkBbVyaXyJozCQt70loMCSrDZ0dqI5NG6uu5bluRtr8WcLvTa7yYqZ+R2
         ZDuQ==
X-Gm-Message-State: ACrzQf3bt0EbBk/6FDe0dRh+lZG/Bs5VgxTAW+HMW6LlLd8plSazyAX/
	Rgj0HpE2aQL6p0JBBz1OgRnk/M2U5Jk=
X-Google-Smtp-Source: AMsMyM6ZlXyR9vtRoqIzIwWH2usGHPB+Ll1r18Xu96REuoYXFMy5+EYhHlpfWiRypOkp0IK6xtIDjw==
X-Received: by 2002:a17:90b:4c92:b0:202:fcca:60ae with SMTP id my18-20020a17090b4c9200b00202fcca60aemr14601629pjb.52.1663301297436;
        Thu, 15 Sep 2022 21:08:17 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-127-167.tpgi.com.au. [193.116.127.167])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0017534ffd491sm13696816plb.163.2022.09.15.21.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 21:08:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 4/7] powerpc/build: move .data.rel.ro, .sdata2 to read-only
Date: Fri, 16 Sep 2022 14:07:52 +1000
Message-Id: <20220916040755.2398112-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220916040755.2398112-1-npiggin@gmail.com>
References: <20220916040755.2398112-1-npiggin@gmail.com>
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

.sdata2 is a readonly small data section for ppc32, and .data.rel.ro
is data that needs relocating but is read-only after that so these
can both be moved to the read only memory region.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/vmlinux.lds.S | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 16c4389d498d..ae0814063900 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -131,6 +131,16 @@ SECTIONS
 	/* Read-only data */
 	RO_DATA(PAGE_SIZE)
 
+#ifdef CONFIG_PPC32
+	.sdata2 : AT(ADDR(.sdata2) - LOAD_OFFSET) {
+		*(.sdata2)
+	}
+#endif
+
+	.data.rel.ro : AT(ADDR(.data.rel.ro) - LOAD_OFFSET) {
+		*(.data.rel.ro*)
+	}
+
 	.branch_lt : AT(ADDR(.branch_lt) - LOAD_OFFSET) {
 		*(.branch_lt)
 	}
@@ -348,19 +358,13 @@ SECTIONS
 	. = ALIGN(PAGE_SIZE);
 	_sdata = .;
 
-#ifdef CONFIG_PPC32
 	.data : AT(ADDR(.data) - LOAD_OFFSET) {
 		DATA_DATA
 		*(.data.rel*)
+#ifdef CONFIG_PPC32
 		*(SDATA_MAIN)
-		*(.sdata2)
-	}
-#else
-	.data : AT(ADDR(.data) - LOAD_OFFSET) {
-		DATA_DATA
-		*(.data.rel*)
-	}
 #endif
+	}
 
 	/* The initial task and kernel stack */
 	INIT_TASK_DATA_SECTION(THREAD_ALIGN)
-- 
2.37.2

