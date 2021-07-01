Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 920703B92FF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 16:12:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GG0Xf3qKyz3bXV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 00:12:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cdjrlc.com (client-ip=203.205.250.33; helo=smtpbg506.qq.com;
 envelope-from=wangborong@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 6418 seconds by postgrey-1.36 at boromir;
 Fri, 02 Jul 2021 00:12:12 AEST
Received: from smtpbg506.qq.com (smtpbg506.qq.com [203.205.250.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GG0XD4NHhz2xKS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jul 2021 00:12:05 +1000 (AEST)
X-QQ-mid: bizesmtp54t1625148715t01joxvb
Received: from localhost.localdomain (unknown [182.148.13.55])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 01 Jul 2021 22:11:54 +0800 (CST)
X-QQ-SSF: 0100000000800040B000D00A0000000
X-QQ-FEAT: 9waYh4jnNPyqOv0ygbC1/m0a12KsCMqDbI1aToSne+xL3DjS7+G9rBaosHAWB
 dEe7NJmbOC9e1dhde2jrjIwUlbQUvm7RWjW5/sYo8+unHRDgvcf/ayyTawMlzFSYWlW0C3W
 rQpGomGd9IqITzL7R4yLpOvme4n73ht1Q7lni582decm5Lng+pYfLOT/qqfSgOWU9d8sUAx
 bDCh3JgWv245YQNsBXrfiPnKybpT4J4tbms3SXsZ1H4jdr/8ZFyJUNbEo87J64eQ5q+n3+o
 OSYFPt21WhC0i2uXTijHaYMDGX3PooGpVbiPdzYs7272WJa9vH/gem1ajNqw30UGOawu3MP
 eRebsxwCQ10VfvOdvMhPkQg1wL13DgwWDtSXDl1
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: jk@ozlabs.org
Subject: [PATCH v2] sched: Use BUG_ON
Date: Thu,  1 Jul 2021 22:11:30 +0800
Message-Id: <20210701141130.940-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
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
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
 Jason Wang <wangborong@cdjrlc.com>, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The BUG_ON macro simplifies the if condition followed by BUG, so that
we can use BUG_ON instead of if condition followed by BUG.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/powerpc/platforms/cell/spufs/sched.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/cell/spufs/sched.c b/arch/powerpc/platforms/cell/spufs/sched.c
index 369206489895..0f218d9e5733 100644
--- a/arch/powerpc/platforms/cell/spufs/sched.c
+++ b/arch/powerpc/platforms/cell/spufs/sched.c
@@ -904,8 +904,8 @@ static noinline void spusched_tick(struct spu_context *ctx)
 	struct spu_context *new = NULL;
 	struct spu *spu = NULL;
 
-	if (spu_acquire(ctx))
-		BUG();	/* a kernel thread never has signals pending */
+	/* a kernel thread never has signals pending */
+	BUG_ON(spu_acquire(ctx));
 
 	if (ctx->state != SPU_STATE_RUNNABLE)
 		goto out;
-- 
2.32.0



