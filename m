Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CBF32494B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 04:12:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmHsV2q1mz3drm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:12:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=IYUJC0kq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=IYUJC0kq; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmHpw2rHxz3cbw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 14:10:32 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id b21so2853385pgk.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 19:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kzkxy84AZO440EdjAvf8D1GUWNTIW8/8tXHKTWHs58w=;
 b=IYUJC0kqNfVKiaXoQ02Qa6Z6Tf8Gbfy8UgmcQWNCZ9rRlVveWttq7BZO8Op0FTWo5a
 Ny2gC3a60hKX11KTLObI1IEHv8NihHV5gwz79M3jucaBH3Vsxf+y0YRJUU5kyUzZbySw
 jK7xMW/tI3k3xU8fW2VS0m1rk23jfCtuJXgdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kzkxy84AZO440EdjAvf8D1GUWNTIW8/8tXHKTWHs58w=;
 b=bxhOYINR0/eEq0GkRwXmprwidNgDlSriqlFEufepywlDs35nWswHz1PGHxplT4J3KC
 ztg9ZVRT0pon+q0jfcfa37DyfyT3EHbIYh2ydIqB5xZwB9MYEGswhpJEdrdt3VvuWMb6
 CTKP2ljAU0rRSRpNMI/WufBEw0RK6PJ7uXB2oq3UOYH4BcZqk22he0PwE55O+c4AQaGO
 8VOEyb6RxR0pNUzbu7Yun4Xmigw4koLOJ9MK4u5KWs+O/3CoQeC0K0WyI6MdaaWw5n5X
 GxaiIf/VD1BHMtqO82PQZfc+q358vxuxq/0/wUi59QgoQoe57xjMcjY+jdTf5XPItUzb
 dgJA==
X-Gm-Message-State: AOAM531vB4yT1hQ7C8unMSYvWtUdshR7T6XqgbzqaHE6fGNmbpylcYQ+
 f3dIb7FGHMOXTMJiCzT6PGO2o8PS3AffRL2o
X-Google-Smtp-Source: ABdhPJyPNvXAgPwLGzn0kvb5rkzbzwWrdZCg1nhwELp1TPCoQtHFWxrLsFhQpxWJwFMVK8uTZ6gk9g==
X-Received: by 2002:a05:6a00:1756:b029:1de:b761:92ae with SMTP id
 j22-20020a056a001756b02901deb76192aemr1134938pfc.29.1614222630621; 
 Wed, 24 Feb 2021 19:10:30 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-6e65-7e50-8dac-f7ef.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:6e65:7e50:8dac:f7ef])
 by smtp.gmail.com with ESMTPSA id i2sm3993736pgk.79.2021.02.24.19.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 19:10:30 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: llvmlinux@lists.linuxfoundation.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 5/8] poweprc/lib/quad: Provide macros for lq/stq
Date: Thu, 25 Feb 2021 14:10:03 +1100
Message-Id: <20210225031006.1204774-6-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210225031006.1204774-1-dja@axtens.net>
References: <20210225031006.1204774-1-dja@axtens.net>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For some reason the integrated assembler in clang-11 doesn't recognise
them. Eventually we should fix it there too.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/include/asm/ppc-opcode.h | 4 ++++
 arch/powerpc/lib/quad.S               | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index ed161ef2b3ca..a5249631cb83 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -339,11 +339,13 @@
 #define PPC_RAW_DARN(t, l)		(0x7c0005e6 | ___PPC_RT(t) | (((l) & 0x3) << 16))
 #define PPC_RAW_DCBAL(a, b)		(0x7c2005ec | __PPC_RA(a) | __PPC_RB(b))
 #define PPC_RAW_DCBZL(a, b)		(0x7c2007ec | __PPC_RA(a) | __PPC_RB(b))
+#define PPC_RAW_LQ(t, a, dq)		(0xe0000000 | ___PPC_RT(t) | ___PPC_RA(a) | (((dq) & 0xfff) << 3))
 #define PPC_RAW_LQARX(t, a, b, eh)	(0x7c000228 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | __PPC_EH(eh))
 #define PPC_RAW_LDARX(t, a, b, eh)	(0x7c0000a8 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | __PPC_EH(eh))
 #define PPC_RAW_LWARX(t, a, b, eh)	(0x7c000028 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | __PPC_EH(eh))
 #define PPC_RAW_PHWSYNC			(0x7c8004ac)
 #define PPC_RAW_PLWSYNC			(0x7ca004ac)
+#define PPC_RAW_STQ(t, a, ds)		(0xf8000002 | ___PPC_RT(t) | ___PPC_RA(a) | (((ds) & 0xfff) << 3))
 #define PPC_RAW_STQCX(t, a, b)		(0x7c00016d | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_MADDHD(t, a, b, c)	(0x10000030 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | ___PPC_RC(c))
 #define PPC_RAW_MADDHDU(t, a, b, c)	(0x10000031 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | ___PPC_RC(c))
@@ -530,9 +532,11 @@
 #define	PPC_DCBZL(a, b)		stringify_in_c(.long PPC_RAW_DCBZL(a, b))
 #define	PPC_DIVDE(t, a, b)	stringify_in_c(.long PPC_RAW_DIVDE(t, a, b))
 #define	PPC_DIVDEU(t, a, b)	stringify_in_c(.long PPC_RAW_DIVDEU(t, a, b))
+#define PPC_LQ(t, a, dq)	stringify_in_c(.long PPC_RAW_LQ(t, a, dq))
 #define PPC_LQARX(t, a, b, eh)	stringify_in_c(.long PPC_RAW_LQARX(t, a, b, eh))
 #define PPC_LDARX(t, a, b, eh)	stringify_in_c(.long PPC_RAW_LDARX(t, a, b, eh))
 #define PPC_LWARX(t, a, b, eh)	stringify_in_c(.long PPC_RAW_LWARX(t, a, b, eh))
+#define PPC_STQ(t, a, ds)	stringify_in_c(.long PPC_RAW_STQ(t, a, ds))
 #define PPC_STQCX(t, a, b)	stringify_in_c(.long PPC_RAW_STQCX(t, a, b))
 #define PPC_MADDHD(t, a, b, c)	stringify_in_c(.long PPC_RAW_MADDHD(t, a, b, c))
 #define PPC_MADDHDU(t, a, b, c)	stringify_in_c(.long PPC_RAW_MADDHDU(t, a, b, c))
diff --git a/arch/powerpc/lib/quad.S b/arch/powerpc/lib/quad.S
index da71760e50b5..de802a817992 100644
--- a/arch/powerpc/lib/quad.S
+++ b/arch/powerpc/lib/quad.S
@@ -15,7 +15,7 @@
 
 /* do_lq(unsigned long ea, unsigned long *regs) */
 _GLOBAL(do_lq)
-1:	lq	r6, 0(r3)
+1:	PPC_LQ(6, 3, 0)
 	std	r6, 0(r4)
 	std	r7, 8(r4)
 	li	r3, 0
@@ -26,7 +26,7 @@ _GLOBAL(do_lq)
 
 /* do_stq(unsigned long ea, unsigned long val0, unsigned long val1) */
 _GLOBAL(do_stq)
-1:	stq	r4, 0(r3)
+1:	PPC_STQ(4, 3, 0)
 	li	r3, 0
 	blr
 2:	li	r3, -EFAULT
-- 
2.27.0

