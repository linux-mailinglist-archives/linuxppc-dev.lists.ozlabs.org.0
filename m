Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9F957F768
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 00:47:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrdc53Njkz3bnP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 08:47:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.155.67.158; helo=smtpbg.qq.com; envelope-from=wangjianli@cdjrlc.com; receiver=<UNKNOWN>)
Received: from smtpbg.qq.com (unknown [43.155.67.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrD3q1F3yz2xt3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jul 2022 16:36:54 +1000 (AEST)
X-QQ-mid: bizesmtp67t1658644601tkl5cgze
Received: from localhost.localdomain ( [125.70.163.183])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 24 Jul 2022 14:36:39 +0800 (CST)
X-QQ-SSF: 01000000002000007000B00A0000000
X-QQ-FEAT: pMuUV8CkajyAwxb04UR3teIl64cORv4dI27JtmKUzGBNHrZxAwSQdtHocO9Rz
	g7ICb4BEKkgo0J9uxL0Qbi1rImRGnmz0t7S0VlDrg7g5JGYnmLqGulkr5OW0LEau2wDBjfY
	Bz4Ji+Onp0E+lUDCXdNsSfKiPFLlRA+0MJLEDi4oyRb7WsJLGdKjRPKpP1/qJz9DI/pRdB2
	J/X52hzmykvV/g8UYMQsi2RSAk448IGQztjeJnOB4mw7ilN96BROndtbBWLEJoFfJYz8nCy
	cQEtpu6DZcvsARV1IHmvfc5F+epzBmyVOIMvrI9hA0evitptnGpCj1Yyo0Y01OZ9U0rFk84
	4K7ViZ2ZsvI8YDyedYioN9pVk0qZPdAJ1r+NMaH
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] powerpc/mm: fix repeated words in comments
Date: Sun, 24 Jul 2022 14:36:22 +0800
Message-Id: <20220724063622.3205-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Mon, 25 Jul 2022 08:46:47 +1000
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
Cc: wangjianli <wangjianli@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

 Delete the redundant word 'so'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 arch/powerpc/mm/init-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index 119ef491f797..acf5d7ba79d1 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -130,7 +130,7 @@ void pgtable_cache_add(unsigned int shift)
 
 	/* It would be nice if this was a BUILD_BUG_ON(), but at the
 	 * moment, gcc doesn't seem to recognize is_power_of_2 as a
-	 * constant expression, so so much for that. */
+	 * constant expression, so much for that. */
 	BUG_ON(!is_power_of_2(minalign));
 	BUG_ON(shift > MAX_PGTABLE_INDEX_SIZE);
 
-- 
2.36.1

