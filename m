Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADC0613013
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 07:00:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12Yp6fMPz3dv8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 17:00:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=H1bNLcrO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=H1bNLcrO;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12Rp5tP8z3cFR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:55:02 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id m6so9850660pfb.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaMSApG8+EDtUBVXLKNvHkV7HiYMo2GGOlzaPkIren8=;
        b=H1bNLcrOkyQX/AJ43uo7YGZa0XBleTpW82UrFFHvypdTWjuJO6/ZDh/y/r1M7T9l5r
         1Ibp5prfuQiSNeMxiWGqptL363BUmrCiQDAQgfdmtSnylkJbnehQly2mnejnXtgtnjMm
         1Ux6DYrVQ9HFtj5owB2O4G2OE79w+p4mxtKWvudjJD8Ns9C3QQLRqWs0aZ7P+SNMxAMB
         BRtmrHE9u253O0oDk2FhW9uI6R37QDV2cuH93H08j49KGv668BMglmrrPAhRnm1CH1xN
         fTEdIr3ff7tv+J7RCogzaxkh1/4Wf9dJeWK8sMNIVpanazHinR3H9qhg8pSgKrBv0BMk
         BAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KaMSApG8+EDtUBVXLKNvHkV7HiYMo2GGOlzaPkIren8=;
        b=XnTxbO7mco+i0q5iEmEiTG75gfLCFUtSnh1rrI8vJbQn20Zimndr6L6l2+o4mEVfYQ
         /U8MIwCQ+gQkZ/3oS1Pb1KbeFKk2cfY6+DUYkYFRwX/RjXLo9M7EMe49KWsv3O+ALbif
         7gMh6x+gj4s/hisnSakLcxVGr61912Q3nHpX8w9y9mzVFk8BIy9D5xKzyqjxoj/Upi2p
         MVlj9Xjsflj6jklYfDRuelA92r7MV4eia2XZOqcqn+ZRyHAYohoQl15nG2WnIKsnxIe0
         7/ZvwipOfVoe1Ih6f1EYqfDbGb5uI6CPorVBE+TnVecaDAVducmgp8oWtqplk7d32CMv
         y+Xw==
X-Gm-Message-State: ACrzQf18qVeTpgURRXoBrIYF0zLADfqVjhlJMRywm86lsr9LUcV7wHYO
	fg+I4BKe13b8v5vmF3CBD6x/wpHRQWI=
X-Google-Smtp-Source: AMsMyM79pZ2t8GoBMdXgsK4We3iGFDDSabn3nAWJxX9/RRMmq++rgITRBQyx5Zxf2JIvEQP4XPerdQ==
X-Received: by 2002:a65:53c6:0:b0:46f:cbcb:7402 with SMTP id z6-20020a6553c6000000b0046fcbcb7402mr2166317pgr.366.1667195699824;
        Sun, 30 Oct 2022 22:54:59 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:54:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 05/19] powerpc/32: Use load and store multiple in GPR save/restore macros
Date: Mon, 31 Oct 2022 15:54:26 +1000
Message-Id: <20221031055440.3594315-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221031055440.3594315-1-npiggin@gmail.com>
References: <20221031055440.3594315-1-npiggin@gmail.com>
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

---
 arch/powerpc/include/asm/ppc_asm.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 753a2757bcd4..ac44383d350a 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -57,8 +57,22 @@
 #define SAVE_NVGPRS(base)		SAVE_GPRS(14, 31, base)
 #define REST_NVGPRS(base)		REST_GPRS(14, 31, base)
 #else
-#define SAVE_GPRS(start, end, base)	OP_REGS stw, 4, start, end, base, GPR0
-#define REST_GPRS(start, end, base)	OP_REGS lwz, 4, start, end, base, GPR0
+.macro __SAVE_GPRS start, end, base, offset
+	.if \end == 31
+		stmw	\start,\offset(\base)
+	.else
+		OP_REGS stw, 4, \start, \end, \base, \offset
+	.endif
+.endm
+.macro __REST_GPRS start, end, base, offset
+	.if \end == 31
+		lmw	\start,\offset(\base)
+	.else
+		OP_REGS lwz, 4, \start, \end, \base, \offset
+	.endif
+.endm
+#define SAVE_GPRS(start, end, base)	__SAVE_GPRS start, end, base, GPR0
+#define REST_GPRS(start, end, base)	__REST_GPRS start, end, base, GPR0
 #define SAVE_NVGPRS(base)		SAVE_GPRS(13, 31, base)
 #define REST_NVGPRS(base)		REST_GPRS(13, 31, base)
 #endif
-- 
2.37.2

