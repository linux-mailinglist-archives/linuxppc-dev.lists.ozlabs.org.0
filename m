Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC0D57B4FC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 13:03:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lnt9j2Zhhz3chm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 21:03:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oZZgfFOU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oZZgfFOU;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lnt916KQgz2xjg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 21:03:15 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id f65so16055599pgc.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 04:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OS9YmbIgBAwgeLHvR4rL+gxtjmJopxjNVCtZdsYgwCI=;
        b=oZZgfFOUfvkuPB6a6jHw97HxL9AMcYyNS3yrt4NH7H1xmCbut9nOq1EHrO+XasSvVj
         nIj5fB4ui2w8Js098ZjYC6ERDjckQASpmcAHAvzZmfL/YDENGN5qWZjDBq34h1KJx5Fz
         nNeQHiRMFgj9/sPwn0i+lJkCQmDYo+0rT9XqXAz2TIAiXeyXQXmUjzLQe+nzxULNtIUT
         tvNoiypIufbnougnLMclsuJy7SqLHbOIeJYfhFqlS6kZp5kPzc1ZiAHZ8bWNNRNCdxLu
         nPHINSPUUJAMztbncDvMPjREcYe0A5VjbAJfg9z5bLEm/WRA/DUm3Ij6J1BCYc8MPjJp
         IIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OS9YmbIgBAwgeLHvR4rL+gxtjmJopxjNVCtZdsYgwCI=;
        b=ftwzAXFCN2Gh49fDU7fmm+NXiGQ5lOJRnsSJt0wYgZbMjWC+S0tAmD+Becn3Uz0tNy
         yUHlmQYOkhkK8bXusj4hHZzMzKbT3qQ50/3D0NEBHOnCLu/tuF+2C+x1r1aalR90Ygq+
         LoPB9obF9xBSBf2xL5wcSpKSZcErBQhI7IPZoKxqPMRypb+xs9RYc4Alvr0AldhdcNQi
         zPV0wG2s2P9I+454PGzmq09HqaP7+PXP5rf7K5mOFBkW3zFAHoFvpymm3qpqx4q9Hxbp
         DPAhFk048VToYVTv8KPNS1d8qomkJ7z/SoxiJmLBmkaYcHvSJ3qWH4dpns1/BrQeukkk
         ZMUA==
X-Gm-Message-State: AJIora/gKvTu9RJwjtCIaxvOEKabtKL1W1EmScnv65WujWZx+RMYJxEQ
	WrBH9rKXQJZbls3Gp3BT2pPduGvjpSE=
X-Google-Smtp-Source: AGRyM1uqfwREkhXKh6353Py0ljXpNsFyvKnNmrOY7qqAYW/jvtgx7CBmnps4WAXIaRj87yxNVacXkg==
X-Received: by 2002:a63:87:0:b0:40c:b1f6:a879 with SMTP id 129-20020a630087000000b0040cb1f6a879mr33261947pga.236.1658314992194;
        Wed, 20 Jul 2022 04:03:12 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-33-251-27.static.tpgi.com.au. [27.33.251.27])
        by smtp.gmail.com with ESMTPSA id p9-20020aa79e89000000b00528a097aeffsm13238652pfq.118.2022.07.20.04.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 04:03:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc: add ISA v3.0 / v3.1 wait opcode macro
Date: Wed, 20 Jul 2022 21:03:01 +1000
Message-Id: <20220720110302.684113-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
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

The wait instruction encoding changed between ISA v2.07 and ISA v3.0.
In v3.1 the instruction gained a new field.

Update the PPC_WAIT macro to the current encoding. Rename the older
incompatible one with a _v203 suffix as it was introduced in v2.03
(the WC field was introduced in v2.07 but the kernel only uses WC=0).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
v2: Update naming, patch changelog and title.

 arch/powerpc/include/asm/ppc-opcode.h | 7 +++++--
 arch/powerpc/kernel/idle_book3e.S     | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 89beabf5325c..856555d69d93 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -331,6 +331,7 @@
 #define __PPC_XSP(s)	((((s) & 0x1e) | (((s) >> 5) & 0x1)) << 21)
 #define __PPC_XTP(s)	__PPC_XSP(s)
 #define __PPC_T_TLB(t)	(((t) & 0x3) << 21)
+#define __PPC_PL(p)	(((p) & 0x3) << 16)
 #define __PPC_WC(w)	(((w) & 0x3) << 21)
 #define __PPC_WS(w)	(((w) & 0x1f) << 11)
 #define __PPC_SH(s)	__PPC_WS(s)
@@ -398,7 +399,8 @@
 #define PPC_RAW_RFDI			(0x4c00004e)
 #define PPC_RAW_RFMCI			(0x4c00004c)
 #define PPC_RAW_TLBILX(t, a, b)		(0x7c000024 | __PPC_T_TLB(t) | 	__PPC_RA0(a) | __PPC_RB(b))
-#define PPC_RAW_WAIT(w)			(0x7c00007c | __PPC_WC(w))
+#define PPC_RAW_WAIT_v203		(0x7c00007c)
+#define PPC_RAW_WAIT(w, p)		(0x7c00003c | __PPC_WC(w) | __PPC_PL(p))
 #define PPC_RAW_TLBIE(lp, a)		(0x7c000264 | ___PPC_RB(a) | ___PPC_RS(lp))
 #define PPC_RAW_TLBIE_5(rb, rs, ric, prs, r) \
 	(0x7c000264 | ___PPC_RB(rb) | ___PPC_RS(rs) | ___PPC_RIC(ric) | ___PPC_PRS(prs) | ___PPC_R(r))
@@ -613,7 +615,8 @@
 #define PPC_TLBILX_ALL(a, b)	PPC_TLBILX(0, a, b)
 #define PPC_TLBILX_PID(a, b)	PPC_TLBILX(1, a, b)
 #define PPC_TLBILX_VA(a, b)	PPC_TLBILX(3, a, b)
-#define PPC_WAIT(w)		stringify_in_c(.long PPC_RAW_WAIT(w))
+#define PPC_WAIT_v203(w)	stringify_in_c(.long PPC_RAW_WAIT_v203)
+#define PPC_WAIT(w, p)		stringify_in_c(.long PPC_RAW_WAIT(w, p))
 #define PPC_TLBIE(lp, a) 	stringify_in_c(.long PPC_RAW_TLBIE(lp, a))
 #define	PPC_TLBIE_5(rb, rs, ric, prs, r) \
 				stringify_in_c(.long PPC_RAW_TLBIE_5(rb, rs, ric, prs, r))
diff --git a/arch/powerpc/kernel/idle_book3e.S b/arch/powerpc/kernel/idle_book3e.S
index cc008de58b05..6447de51ea71 100644
--- a/arch/powerpc/kernel/idle_book3e.S
+++ b/arch/powerpc/kernel/idle_book3e.S
@@ -77,7 +77,7 @@ _GLOBAL(\name)
 
 .macro BOOK3E_IDLE_LOOP
 1:
-	PPC_WAIT(0)
+	PPC_WAIT_v203
 	b	1b
 .endm
 
-- 
2.35.1

