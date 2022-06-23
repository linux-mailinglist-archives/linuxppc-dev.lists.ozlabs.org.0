Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4FA558B72
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 00:58:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTbJt6JDHz3f43
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 08:58:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=106.55.201.188; helo=smtpbg.qq.com; envelope-from=jiangjian@cdjrlc.com; receiver=<UNKNOWN>)
Received: from smtpbg.qq.com (smtpbg136.qq.com [106.55.201.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTG2H6JwWz3brF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 19:59:34 +1000 (AEST)
X-QQ-mid: bizesmtp91t1655978228tqb17klu
Received: from ubuntu.localdomain ( [106.117.99.68])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Jun 2022 17:57:03 +0800 (CST)
X-QQ-SSF: 01000000008000B0C000B00A0000000
X-QQ-FEAT: NTY7odTD9S9nCPdv+3vL0Gg+1KjSGIxoPdpjh7t49ebhhJ/8X5zrfgheFucMM
	YIKm4tFSbTqZx2eVWhTj5pKBB9tbWruizozlMjj7HvKiBSm5q1VcZF5bwqFQAsSt5EOO429
	Glhwp7jaTuxSg2Dr1DpxZPtZZsf89OsHuItivqv0cS3ZNSdjieE6IaZDv7NDYydofv+U1uV
	rq3MFsXquO05s4EpYxQ6uwj8+GxP9LM0+b6Yg2hEKEHY790ZELH2JrHorUkgclHVjqDfZi+
	Difawq9PrmCdYkVr8WOhq5Zs6MvGn4L+LfU3YvNB5diTwg0i8T9KHte/01zWYlYACt/vUrH
	J/kjEjdPxTxt4CGNuKZl9Idrkc0bbJE1ThoS/eo
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: ruscur@russell.cc,
	oohall@gmail.com,
	mpe@ellerman.id.au
Subject: [PATCH] powerpc/eeh: drop unexpected word 'for' in comments
Date: Thu, 23 Jun 2022 17:57:01 +0800
Message-Id: <20220623095701.22931-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam7
X-Mailman-Approved-At: Fri, 24 Jun 2022 08:56:56 +1000
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
Cc: Jiang Jian <jiangjian@cdjrlc.com>, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

there is an unexpected word 'for' in the comments that need to be dropped

file - arch/powerpc/kernel/eeh_driver.c
line - 753

* presence state. This might happen for for PCIe slots if the PE containing

changed to:

* presence state. This might happen for PCIe slots if the PE containing

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 arch/powerpc/kernel/eeh_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 260273e56431..f279295179bd 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -750,7 +750,7 @@ static void eeh_pe_cleanup(struct eeh_pe *pe)
  * @pdev: pci_dev to check
  *
  * This function may return a false positive if we can't determine the slot's
- * presence state. This might happen for for PCIe slots if the PE containing
+ * presence state. This might happen for PCIe slots if the PE containing
  * the upstream bridge is also frozen, or the bridge is part of the same PE
  * as the device.
  *
-- 
2.17.1

