Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFDA324949
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 04:12:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmHrw5dMlz3dm1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:12:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=knw68kx0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=knw68kx0; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmHps11f5z3cxc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 14:10:28 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id a4so2834971pgc.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 19:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ydvBmQuT5IBWs8m0kK5hfr/cAJ7yvAd4RsRPvbptl7g=;
 b=knw68kx0cbAuE9zd6AP7YJUER3HYVGP0UY+cXX3cnMwBo4Oz3KoHADh2P5IpgHqZnF
 565OXf0wgVmY3QlrY0xXA8xJ+c8TFyiGhhLfiG31EuHTJw9lPdeqM26XPfXlAMvfwCLk
 1bvfJx2IEQb+NzoHAsIldEMlBbi29zmhatXK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ydvBmQuT5IBWs8m0kK5hfr/cAJ7yvAd4RsRPvbptl7g=;
 b=Cdy60lOveE1E6SJqH9Ywd/GuzijBTgtdpd9pxkmNCUlFnKxhssM2VLnke+U/YAAk8z
 nthOlV87WvVTMz03RFRcPTuVX6SGiWEto8xhyHHaF6joxgplwZ7V9Jo8xW4js2g9hrTe
 APgbYIiG2IUAmth202bZIqWeIxcIdEZ/iJnrKUdj4SV0GwiFHTETN5FN1iCwdnOcNO8r
 xNvVV7SKPWcEny77uuQEDGjdPsmb9V3djwP6vlZPT9rVLCw2cfFDZMhL4mHh/SPr6nM6
 Pe2E2qMdLDZYnxSlkJwnByAPD9ywrjl6lTwPeuQSW4OoHXy7orP6auY+qDzHSy+0cLSZ
 JICA==
X-Gm-Message-State: AOAM532C7ml6zYYK4iGCfXq7/irPPjUGWYyZyoSRXWoz8iZ+ccrXi4gj
 I2GIqIwgsXjhNGplxGZMcy0QfG6fayM2NA1D
X-Google-Smtp-Source: ABdhPJwG/YL8B+zUkmJA8Lxv1EQNLaMEvd40Ef4mxLqg/EpTy8j+2Vuk8g+SL7Bln9iTp8MTJnV5oA==
X-Received: by 2002:a62:fc12:0:b029:1ed:b7b0:db6e with SMTP id
 e18-20020a62fc120000b02901edb7b0db6emr1090464pfh.45.1614222627006; 
 Wed, 24 Feb 2021 19:10:27 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-6e65-7e50-8dac-f7ef.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:6e65:7e50:8dac:f7ef])
 by smtp.gmail.com with ESMTPSA id t189sm3937258pgt.39.2021.02.24.19.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 19:10:26 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: llvmlinux@lists.linuxfoundation.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 4/8] powerpc/ppc_asm: use plain numbers for registers
Date: Thu, 25 Feb 2021 14:10:02 +1100
Message-Id: <20210225031006.1204774-5-dja@axtens.net>
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

This is dumb but makes the llvm integrated assembler happy.
https://github.com/ClangBuiltLinux/linux/issues/764

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/include/asm/ppc_asm.h | 64 +++++++++++++++---------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 3dceb64fc9af..49da2cf4c2d5 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -509,38 +509,38 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
  * Use R0-31 only when really nessesary.
  */
 
-#define	r0	%r0
-#define	r1	%r1
-#define	r2	%r2
-#define	r3	%r3
-#define	r4	%r4
-#define	r5	%r5
-#define	r6	%r6
-#define	r7	%r7
-#define	r8	%r8
-#define	r9	%r9
-#define	r10	%r10
-#define	r11	%r11
-#define	r12	%r12
-#define	r13	%r13
-#define	r14	%r14
-#define	r15	%r15
-#define	r16	%r16
-#define	r17	%r17
-#define	r18	%r18
-#define	r19	%r19
-#define	r20	%r20
-#define	r21	%r21
-#define	r22	%r22
-#define	r23	%r23
-#define	r24	%r24
-#define	r25	%r25
-#define	r26	%r26
-#define	r27	%r27
-#define	r28	%r28
-#define	r29	%r29
-#define	r30	%r30
-#define	r31	%r31
+#define	r0	0
+#define	r1	1
+#define	r2	2
+#define	r3	3
+#define	r4	4
+#define	r5	5
+#define	r6	6
+#define	r7	7
+#define	r8	8
+#define	r9	9
+#define	r10	10
+#define	r11	11
+#define	r12	12
+#define	r13	13
+#define	r14	14
+#define	r15	15
+#define	r16	16
+#define	r17	17
+#define	r18	18
+#define	r19	19
+#define	r20	20
+#define	r21	21
+#define	r22	22
+#define	r23	23
+#define	r24	24
+#define	r25	25
+#define	r26	26
+#define	r27	27
+#define	r28	28
+#define	r29	29
+#define	r30	30
+#define	r31	31
 
 
 /* Floating Point Registers (FPRs) */
-- 
2.27.0

