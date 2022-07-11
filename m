Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F26A56D345
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:16:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh8D30PR8z3fqF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:16:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GXvr/oFy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GXvr/oFy;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh86y5MQgz3fRN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:11:37 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id 89-20020a17090a09e200b001ef7638e536so7047470pjo.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4N9oGGPXIwAQoo3p717AYr+cs2j4Erumbnjvcj0XNIs=;
        b=GXvr/oFyI3sRV/gRbLdQJWgFRjSElpZ5SN68q7nOBz2taBzUpbv7CXoFl90IIxL9Jo
         ICfRWOAK+1ZF1fghKF/ElYFo1UKUbl7LsLqzajYccqlvT/p3x5rkRviOG1GfN8xfkIw7
         StOT7UMfr9XEaJVFg1AsrzaM5IxyMuSS8UljaRLmIdvRhY9W1zm5GGC12V/J6YNCsCeJ
         O3ETc81ePg9v3mVk7VCtBEAXLe91xjFYxYKZ7a5Vdc7e++BkeBUU703jUrexIF0QoKj4
         Zb0g4eydthrX6+oke3rFhegqtN1mD4n7RPi0z29KexagjIBYjRO668o97mmcBug3bD/H
         S8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4N9oGGPXIwAQoo3p717AYr+cs2j4Erumbnjvcj0XNIs=;
        b=dCOwmoH2ML0DQmRYPjd/E5XWn8BNpnC2ubZqeTLlwbIWJQ2hLYmJmxuJjEagvIOcos
         8+SiQLHn41fDx3L0BR1nPw1giCrMuN1im99EgQBO1P9sodjuFzmWwTlegDSO+9iEhzYC
         Rrijnka7j2JaMy6EUqNG4dn41nSs42C5CBQ4tM3dhc0+qFLhi26C9bWfP8MVSj7SjMph
         BmYMrDt6WN4AcqIdPGj8BG+Oj7aPxKxbroi7yvn8bxn5pC7y/rykzm4z1wtsy/DOezN/
         AEL6JmDAlfG1OsVRHzbNSKThu2xWZs8ziYcg3etszmAbLLkpCKPz9h4BkjkvQKeFrpW+
         k70A==
X-Gm-Message-State: AJIora8zEGyRnvoSIDpr/3TI7AVK5AUNe3TgG5g3JpKA64NPai/z+6B2
	HvZ5PVFoJxPqaFzrvSrC8lIwfqhKHaM=
X-Google-Smtp-Source: AGRyM1t7zW8ywe+ydIJAyvbvgDsHo1IXlHSA9Jzk4OmGuKIdj0ivUA3GnMFfo8HLOyC1Ls7nYzxnXA==
X-Received: by 2002:a17:902:e494:b0:16b:dd0e:e11e with SMTP id i20-20020a170902e49400b0016bdd0ee11emr16669143ple.7.1657509095129;
        Sun, 10 Jul 2022 20:11:35 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id s17-20020a632151000000b0041264dec901sm3063236pgm.21.2022.07.10.20.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:11:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc: add BookS wait opcode macro
Date: Mon, 11 Jul 2022 13:11:27 +1000
Message-Id: <20220711031128.151437-1-npiggin@gmail.com>
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

The wait instruction has a different encoding between BookE and BookS.
Add the BookS variant.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ppc-opcode.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 89beabf5325c..46fca27e8101 100644
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
@@ -399,6 +400,7 @@
 #define PPC_RAW_RFMCI			(0x4c00004c)
 #define PPC_RAW_TLBILX(t, a, b)		(0x7c000024 | __PPC_T_TLB(t) | 	__PPC_RA0(a) | __PPC_RB(b))
 #define PPC_RAW_WAIT(w)			(0x7c00007c | __PPC_WC(w))
+#define PPC_RAW_WAIT_BOOKS(w, p)	(0x7c00003c | __PPC_WC(w) | __PPC_PL(p))
 #define PPC_RAW_TLBIE(lp, a)		(0x7c000264 | ___PPC_RB(a) | ___PPC_RS(lp))
 #define PPC_RAW_TLBIE_5(rb, rs, ric, prs, r) \
 	(0x7c000264 | ___PPC_RB(rb) | ___PPC_RS(rs) | ___PPC_RIC(ric) | ___PPC_PRS(prs) | ___PPC_R(r))
@@ -614,6 +616,7 @@
 #define PPC_TLBILX_PID(a, b)	PPC_TLBILX(1, a, b)
 #define PPC_TLBILX_VA(a, b)	PPC_TLBILX(3, a, b)
 #define PPC_WAIT(w)		stringify_in_c(.long PPC_RAW_WAIT(w))
+#define PPC_WAIT_BOOKS(w, p)	stringify_in_c(.long PPC_RAW_WAIT_BOOKS(w, p))
 #define PPC_TLBIE(lp, a) 	stringify_in_c(.long PPC_RAW_TLBIE(lp, a))
 #define	PPC_TLBIE_5(rb, rs, ric, prs, r) \
 				stringify_in_c(.long PPC_RAW_TLBIE_5(rb, rs, ric, prs, r))
-- 
2.35.1

