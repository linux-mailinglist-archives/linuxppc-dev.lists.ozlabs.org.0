Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5D55A7305
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 02:53:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHQdQ03kQz3cD8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 10:52:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.155.67.158; helo=bg4.exmail.qq.com; envelope-from=yuanjilin@cdjrlc.com; receiver=<UNKNOWN>)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.67.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHQd15Lm9z2xJJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 10:52:37 +1000 (AEST)
X-QQ-mid: bizesmtp83t1661906833t48eao95
Received: from localhost.localdomain ( [182.148.13.26])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 31 Aug 2022 08:47:11 +0800 (CST)
X-QQ-SSF: 01000000000000D0E000000A0000000
X-QQ-FEAT: hJ5650VbgwA8/tjv62vCT0tHLOwxMXc1psePX3XsSQrANH5abwqNW+o2xQi1S
	4iV/5l6erMyETcWRD4hdmei4oTdmru4UwKRL9K2fyUgBKYgkQN5ttBNJZPdMoC/XPFUHC72
	eUxFpcBOa4I6szeNIFyFJ9FjLP50m0UFqegvQuYih3GJciFyvqR2ZUtQif/bLxyrFzlquYP
	LATU9Iqn2+N5pohDqSzcibRfCELeR3zlfqC0IumikXSJyeyuOJRVPAnN1yJk4+FU5+dyjeh
	lxUmXf110J76JV5ha+RFtms1y3fgdfBLGY/WZq39fPDCdBkm4j7gkrF+Bp/SGsF7lc4q40X
	tlN9gSgJJdxXyEACm+WnZkFoWQLGay1O0ogioq3wPjAdP8jddw=
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc/xive: fix repeated words in comments
Date: Wed, 31 Aug 2022 08:47:06 +0800
Message-Id: <20220831004706.35280-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
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
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Delete the redundant word 'set'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 arch/powerpc/sysdev/xive/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 61b9f98dfd4a..a289cb97c1d7 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -783,7 +783,7 @@ static int xive_irq_set_type(struct irq_data *d, unsigned int flow_type)
 	 * the corresponding descriptor bits mind you but those will in turn
 	 * affect the resend function when re-enabling an edge interrupt.
 	 *
-	 * Set set the default to edge as explained in map().
+	 * Set the default to edge as explained in map().
 	 */
 	if (flow_type == IRQ_TYPE_DEFAULT || flow_type == IRQ_TYPE_NONE)
 		flow_type = IRQ_TYPE_EDGE_RISING;
-- 
2.36.1

