Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8280550930
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 09:42:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQl9C6wGxz3cfv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 17:42:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=cVdd7eIZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.111; helo=m15111.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=cVdd7eIZ;
	dkim-atps=neutral
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQl8b11X7z3bZc
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 17:41:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=P1us3
	0mesPrayRc25Bx0vszGtgzMujZgmQhpV81mVlI=; b=cVdd7eIZQVJiMvv7wIkUA
	6Gy3SXFUpBigcMSSDe40WqS7gtshD3bAkRSvp8V+kLVA8z7iqoDbC+Gqe/qqpHAg
	StSoeqCOJ7pDam9zMppzP+M8eAVY7qbW0bvs2WAMcF6nEIUtpJGoMCOzAGxNF1dF
	54usUgi7yjXlMGL+uSCuNU=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp1 (Coremail) with SMTP id C8mowADXs9zg0q5in0zTEw--.21014S2;
	Sun, 19 Jun 2022 15:40:18 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	dan.j.williams@intel.com,
	t.scherer@eckelmann.de,
	vilhelm.gray@gmail.com,
	rafael@kernel.org
Subject: [PATCH] powerpc: pseries: Fix refcount bug in ibmebus
Date: Sun, 19 Jun 2022 15:40:16 +0800
Message-Id: <20220619074016.4068105-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowADXs9zg0q5in0zTEw--.21014S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrW5ur1DCFyUCw4xtry7ZFb_yoWfKrc_Aw
	18uF9rCr4rJF4vva9F9r1rCF1xt34DGr4rt3Wvqayftw15Xw1Uurs8ZrZ7GayUXrW0yrW5
	Grs0qws8AaySgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjb_-JUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2gIlF1uwMPEOogAAss
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
Cc: linuxppc-dev@lists.ozlabs.org, windhl@126.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In ibmebus_match_path(), we should use of_node_put() to keep
refcount balance.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/pseries/ibmebus.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/ibmebus.c b/arch/powerpc/platforms/pseries/ibmebus.c
index 7ee3ed7d6cc2..a870cada7acd 100644
--- a/arch/powerpc/platforms/pseries/ibmebus.c
+++ b/arch/powerpc/platforms/pseries/ibmebus.c
@@ -152,7 +152,11 @@ static const struct dma_map_ops ibmebus_dma_ops = {
 static int ibmebus_match_path(struct device *dev, const void *data)
 {
 	struct device_node *dn = to_platform_device(dev)->dev.of_node;
-	return (of_find_node_by_path(data) == dn);
+	struct device_node *tn = of_find_node_by_path(data);
+
+	of_node_put(tn);
+
+	return (tn == dn);
 }
 
 static int ibmebus_match_node(struct device *dev, const void *data)
-- 
2.25.1

