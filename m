Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 786445BE5A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 14:23:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MX1152FKnz3c4Y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 22:23:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WPp+AVat;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WPp+AVat;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MX10Z2j5bz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 22:23:09 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id x1so2184659plv.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 05:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=0uo5dcFQbM9W2H5bm3V9IIMNYQYIlI/Bef8iVMezzP0=;
        b=WPp+AVatmd5j6+HtitX7zTI4WFH9b57OEp51yufZBZx1ph+3nPHL8ZibnPHdO4SdqD
         Byy8klJM0adSy2P5aPtn3RYc4WhaZha8aijqT5VaPHCituLeQCXeYIF6TqmPZk6Kw8HQ
         2EdP2zSzRSV4Bram82g6K9HzSUOP88CRYXTvAgmVUO4FUrtucSc+B/Rgx8iCDj6vKR4p
         6BuA2D20y8HY1lQ7HWsJrynhI0pLz36H7Ns14ihhl4YWsPmQMXkWzlSxjcthvBy25Gy8
         DstJwVg9Zptn+Er/7QJUqpdUe5P3+e9WtYuVEDoO8oKDnzPXKJDmRGxtUqBDoxuKSVUs
         H+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=0uo5dcFQbM9W2H5bm3V9IIMNYQYIlI/Bef8iVMezzP0=;
        b=SUtGxjFd8MtG9q34IkCid4VLsC2n7ZfgYdvBHCsx7EaxvYHVMUcLD1Y2q4K3yq4GPk
         igEay0bLpzu0i4g2m8IZyLGdBODUV1ow5RMBW15S5+AgeerJlFMbbFoRymAFMqLA3YwG
         uu5Lcg955+V7knsNm6WRYTSparFpoeeAtjT9UdCcLuxAvrX7Q94NLXRUf8ulpkBR8Hp/
         QvqsU3lnrHZfZwuaVQWSc3ariaDYrhSxLFMt5forfjcOqT6AW9uPZw0QHyM/AUoaTfhI
         3RIFhHrXQMi2qwfYrouFNILtGbBTYNdhal3njQXdA7XbPnIsAoDw1gB2o0R7cyyMPxvg
         Kd5A==
X-Gm-Message-State: ACrzQf036Di9rGzTGSmiIw5Wzl+PQOfvVVqyoqB4sjuszhVQ5EyCIixe
	XoUWVDrPsw0iAmDP7GsQOXyalnoFpqI=
X-Google-Smtp-Source: AMsMyM721abONoG0+n17TeEM2i7CCsmujRCmcTuUb3pKmETtL5uY7x+sm+NVw9HLHdbNP1wqav8tXw==
X-Received: by 2002:a17:902:b20a:b0:178:6f5b:f903 with SMTP id t10-20020a170902b20a00b001786f5bf903mr4694010plr.39.1663676586044;
        Tue, 20 Sep 2022 05:23:06 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.219.227.147])
        by smtp.gmail.com with ESMTPSA id t17-20020a170902e1d100b001708c4ebbaesm1246569pla.309.2022.09.20.05.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 05:23:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 1/2] powerpc: add ISA v3.0 / v3.1 wait opcode macro
Date: Tue, 20 Sep 2022 22:22:58 +1000
Message-Id: <20220920122259.363092-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
v2: Update naming, patch changelog and title.
v3: v2 sent incorrect patches, sorry. 
v4: Rebase.

 arch/powerpc/include/asm/ppc-opcode.h | 7 +++++--
 arch/powerpc/kernel/idle_book3e.S     | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index c6d724104ed1..21e33e46f4b8 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -330,6 +330,7 @@
 #define __PPC_XSP(s)	((((s) & 0x1e) | (((s) >> 5) & 0x1)) << 21)
 #define __PPC_XTP(s)	__PPC_XSP(s)
 #define __PPC_T_TLB(t)	(((t) & 0x3) << 21)
+#define __PPC_PL(p)	(((p) & 0x3) << 16)
 #define __PPC_WC(w)	(((w) & 0x3) << 21)
 #define __PPC_WS(w)	(((w) & 0x1f) << 11)
 #define __PPC_SH(s)	__PPC_WS(s)
@@ -388,7 +389,8 @@
 #define PPC_RAW_RFDI			(0x4c00004e)
 #define PPC_RAW_RFMCI			(0x4c00004c)
 #define PPC_RAW_TLBILX(t, a, b)		(0x7c000024 | __PPC_T_TLB(t) | 	__PPC_RA0(a) | __PPC_RB(b))
-#define PPC_RAW_WAIT(w)			(0x7c00007c | __PPC_WC(w))
+#define PPC_RAW_WAIT_v203		(0x7c00007c)
+#define PPC_RAW_WAIT(w, p)		(0x7c00003c | __PPC_WC(w) | __PPC_PL(p))
 #define PPC_RAW_TLBIE(lp, a)		(0x7c000264 | ___PPC_RB(a) | ___PPC_RS(lp))
 #define PPC_RAW_TLBIE_5(rb, rs, ric, prs, r) \
 	(0x7c000264 | ___PPC_RB(rb) | ___PPC_RS(rs) | ___PPC_RIC(ric) | ___PPC_PRS(prs) | ___PPC_R(r))
@@ -606,7 +608,8 @@
 #define PPC_TLBILX_ALL(a, b)	PPC_TLBILX(0, a, b)
 #define PPC_TLBILX_PID(a, b)	PPC_TLBILX(1, a, b)
 #define PPC_TLBILX_VA(a, b)	PPC_TLBILX(3, a, b)
-#define PPC_WAIT(w)		stringify_in_c(.long PPC_RAW_WAIT(w))
+#define PPC_WAIT_v203		stringify_in_c(.long PPC_RAW_WAIT_v203)
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
2.37.2

