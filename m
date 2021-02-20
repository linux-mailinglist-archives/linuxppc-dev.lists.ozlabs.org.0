Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAAD320482
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 09:58:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DjMmR2Xgnz3cGR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 19:58:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.133;
 helo=out30-133.freemail.mail.aliyun.com;
 envelope-from=yang.lee@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DjMm54g4Xz30N7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 19:57:53 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0UP0IAvR_1613811457; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UP0IAvR_1613811457) by smtp.aliyun-inc.com(127.0.0.1);
 Sat, 20 Feb 2021 16:57:37 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/sstep: Use bitwise instead of arithmetic operator for
 flags
Date: Sat, 20 Feb 2021 16:57:35 +0800
Message-Id: <1613811455-2457-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix the following coccinelle warnings:
./arch/powerpc/lib/sstep.c:1090:20-21: WARNING: sum of probable
bitmasks, consider |
./arch/powerpc/lib/sstep.c:1115:20-21: WARNING: sum of probable
bitmasks, consider |
./arch/powerpc/lib/sstep.c:1134:20-21: WARNING: sum of probable
bitmasks, consider |

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/powerpc/lib/sstep.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index ede093e..e568cc5 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1087,7 +1087,7 @@ static nokprobe_inline void add_with_carry(const struct pt_regs *regs,
 
 	if (carry_in)
 		++val;
-	op->type = COMPUTE + SETREG + SETXER;
+	op->type = COMPUTE | SETREG | SETXER;
 	op->reg = rd;
 	op->val = val;
 #ifdef __powerpc64__
@@ -1112,7 +1112,7 @@ static nokprobe_inline void do_cmp_signed(const struct pt_regs *regs,
 {
 	unsigned int crval, shift;
 
-	op->type = COMPUTE + SETCC;
+	op->type = COMPUTE | SETCC;
 	crval = (regs->xer >> 31) & 1;		/* get SO bit */
 	if (v1 < v2)
 		crval |= 8;
@@ -1131,7 +1131,7 @@ static nokprobe_inline void do_cmp_unsigned(const struct pt_regs *regs,
 {
 	unsigned int crval, shift;
 
-	op->type = COMPUTE + SETCC;
+	op->type = COMPUTE | SETCC;
 	crval = (regs->xer >> 31) & 1;		/* get SO bit */
 	if (v1 < v2)
 		crval |= 8;
-- 
1.8.3.1

