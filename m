Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5941D11A173
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 03:38:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Xh2B4lDBzDqLq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 13:38:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cIuZxTR+"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Xh086TMvzDqcX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 13:36:55 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id q8so989446pfh.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 18:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=qiDNDwSYfR3vPTQQGNF7N5PdmcZBPmQFOyuDOOhHoyg=;
 b=cIuZxTR+rBR5lpRabgLxRLPWwR3gE6I9c2tdW/S8l1Q2azS8O7V0B2ObpyxlhsJaM5
 f4w2omVhHPZZ6vLsI8dREmb/l0A3CUVXSni/nEcSzXJLp1/ohyjOG/J0pkUuVgDMHG4P
 jJGgOeVo9AfD3zOfFsnC9sbxLHg9TMCTIFNzEyeFUHcRH1yzqYqUoDRSj17u3N3ZsWht
 Zi5TlQ08oeVzSUny67kwErnbmsQ/szXOYOgpDTurx9IjKqieK5RDNVb/1T14WN1l0J7Q
 CHdDyvn8rt2l57cQG6HBXpsdTi2+ukiyzdneFaC6RgWmx2TXJfUJkQscLaXZGizwuGTM
 KG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qiDNDwSYfR3vPTQQGNF7N5PdmcZBPmQFOyuDOOhHoyg=;
 b=JVV0pDBaDp7oQQWoknSpV75SOQkzWHs5hV/XpWJDadSgudIB8OmrtNr6MeKq6NyONR
 F9VNp8IFWIM7N0SGTMa5O0pN5OFO5A6M+oVQI+nYOJhdbA/eSiY6ssga2VVIEMXamG7i
 rIfdw8hqAif0YJmGScVk+iPxYUGZR92aBIxVy4udx5+QaVMwkL+2dTG7NfnWRjWfIamO
 bqWD3OMTgBiQuoku34SyxNzl2YwvEUWYNDUyJ2H9qTA6oyvp+wqY/VXReKMp9qn27zx3
 /CUxcy3s8JkSMlt+WLMxeeAgZsbA+E1Zro0hIH0xAyeMek6IkDsQq80xBT8EC62fzGdp
 bM1g==
X-Gm-Message-State: APjAAAXQH58fKEGgqpdKW4W9wtYxjbq6BK2zSxuQ1/t+2mnjchgVVim6
 tWwQe1HACKZfmY3TRVoF+5JrVoGO
X-Google-Smtp-Source: APXvYqyQNX6sNvUaeRjW9bEMYI5+fW2qOf1bZH8+ofL11q9JUKgC/7bPkZho/GwNwNx2VLllR7rzJw==
X-Received: by 2002:aa7:9d0e:: with SMTP id k14mr1176887pfp.157.1576031812037; 
 Tue, 10 Dec 2019 18:36:52 -0800 (PST)
Received: from tee480.au.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 23sm298327pjx.29.2019.12.10.18.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 18:36:51 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: Use {SAVE,REST}_NVGPRS macros
Date: Wed, 11 Dec 2019 13:35:52 +1100
Message-Id: <20191211023552.16480-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In entry_64.S there are places that open code saving and restoring the
non-volatile registers. There are already macros for doing this so use
them.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/kernel/entry_64.S | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 6467bdab8d40..457b86c13c19 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -591,8 +591,7 @@ _GLOBAL(_switch)
 	std	r0,16(r1)
 	stdu	r1,-SWITCH_FRAME_SIZE(r1)
 	/* r3-r13 are caller saved -- Cort */
-	SAVE_8GPRS(14, r1)
-	SAVE_10GPRS(22, r1)
+	SAVE_NVGPRS(r1)
 	std	r0,_NIP(r1)	/* Return to switch caller */
 	mfcr	r23
 	std	r23,_CCR(r1)
@@ -716,8 +715,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	mtcrf	0xFF,r6
 
 	/* r3-r13 are destroyed -- Cort */
-	REST_8GPRS(14, r1)
-	REST_10GPRS(22, r1)
+	REST_NVGPRS(r1)
 
 	/* convert old thread to its task_struct for return value */
 	addi	r3,r3,-THREAD
@@ -1149,8 +1147,7 @@ _GLOBAL(enter_rtas)
    	 */
 	SAVE_GPR(2, r1)			/* Save the TOC */
 	SAVE_GPR(13, r1)		/* Save paca */
-	SAVE_8GPRS(14, r1)		/* Save the non-volatiles */
-	SAVE_10GPRS(22, r1)		/* ditto */
+	SAVE_NVGPRS(r1)			/* Save the non-volatiles */
 
 	mfcr	r4
 	std	r4,_CCR(r1)
@@ -1257,8 +1254,7 @@ rtas_restore_regs:
 	/* relocation is on at this point */
 	REST_GPR(2, r1)			/* Restore the TOC */
 	REST_GPR(13, r1)		/* Restore paca */
-	REST_8GPRS(14, r1)		/* Restore the non-volatiles */
-	REST_10GPRS(22, r1)		/* ditto */
+	REST_NVGPRS(r1)			/* Restore the non-volatiles */
 
 	GET_PACA(r13)
 
@@ -1292,8 +1288,7 @@ _GLOBAL(enter_prom)
    	 */
 	SAVE_GPR(2, r1)
 	SAVE_GPR(13, r1)
-	SAVE_8GPRS(14, r1)
-	SAVE_10GPRS(22, r1)
+	SAVE_NVGPRS(r1)
 	mfcr	r10
 	mfmsr	r11
 	std	r10,_CCR(r1)
@@ -1337,8 +1332,7 @@ _GLOBAL(enter_prom)
 	/* Restore other registers */
 	REST_GPR(2, r1)
 	REST_GPR(13, r1)
-	REST_8GPRS(14, r1)
-	REST_10GPRS(22, r1)
+	REST_NVGPRS(r1)
 	ld	r4,_CCR(r1)
 	mtcr	r4
 
-- 
2.17.1

