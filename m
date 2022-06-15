Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B28E154D7AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 03:59:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNlj23t4Mz3fBC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 11:59:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=cOcgvf8F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.111; helo=m15111.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=cOcgvf8F;
	dkim-atps=neutral
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNScL68dHz2y7V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 00:39:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=hq6nR
	WglAhr8vPBtxEwx7KGRHjG1FojbJfx83gxT5cs=; b=cOcgvf8FsunlcPHnMZEVf
	B6oZq7JtwSMRZgNmRtwc1RMzQZHIcPozdoHgVF3S5iLozU9zbrIGK25BcB84/H1I
	wQQjGRIRexqv/K+I1WwijbMmeIPdigbqZjJGKVxJWsVMa/Trtq2+VAGiTrKIXqWF
	Y/dzmVdJ+Chm9Ut20SrCKY=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp1 (Coremail) with SMTP id C8mowADHzCiP7qlinPC3EQ--.44190S2;
	Wed, 15 Jun 2022 22:37:03 +0800 (CST)
From: Liang He <windhl@126.com>
To: agust@denx.de,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	ulia.Lawall@inria.fr,
	nick.child@ibm.com
Subject: [PATCH] arch: powerpc: platforms: 512x: Add missing of_node_put()
Date: Wed, 15 Jun 2022 22:37:03 +0800
Message-Id: <20220615143703.3968898-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowADHzCiP7qlinPC3EQ--.44190S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF4xWFy7Kr4rZF4ftw17GFg_yoWfCrXEya
	yIqa1jkrWkJrsayr1DZr1Y9ryak3sxCa98X340q3WxJw15Xw43JrnFqrsFv3WUWFW2k39x
	JFWDGw1aya4akjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREPl1tUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7RAhF1pEAND77wAAsR
X-Mailman-Approved-At: Thu, 16 Jun 2022 11:54:30 +1000
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
Cc: windhl@126.com, linuxppc-dev@lists.ozlabs.org, joel@jms.id.au, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In mpc5121_clk_init(), of_find_compatible_node() will return a
node pointer with refcount incremented. We should use of_node_put()
when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/512x/clock-commonclk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/512x/clock-commonclk.c b/arch/powerpc/platforms/512x/clock-commonclk.c
index 0652c7e69225..ca475462e95b 100644
--- a/arch/powerpc/platforms/512x/clock-commonclk.c
+++ b/arch/powerpc/platforms/512x/clock-commonclk.c
@@ -1208,6 +1208,8 @@ int __init mpc5121_clk_init(void)
 	/* register as an OF clock provider */
 	mpc5121_clk_register_of_provider(clk_np);
 
+	of_node_put(clk_np);
+
 	/*
 	 * unbreak not yet adjusted peripheral drivers during migration
 	 * towards fully operational common clock support, and allow
-- 
2.25.1

