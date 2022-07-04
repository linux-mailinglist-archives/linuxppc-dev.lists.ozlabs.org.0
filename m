Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC41565007
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 10:49:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LbzyM2YMJz3bqR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 18:49:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=VPkQ8OxP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.114; helo=m15114.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=VPkQ8OxP;
	dkim-atps=neutral
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lbzxh14RSz3062
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 18:49:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=+sTBm
	45qb9tY8Tvoanhh3f/+xnzFQuBTY8zMr/2jRvw=; b=VPkQ8OxPdiuN2m53j+aEs
	h/OBV2pqtXJzFEFirZBQx/S0RzfI39kv3dUO3Tnm4morr/SxC11eHZzsX8b284co
	ALTiWgdMrjxkXGl1MPGbCIQ2tAt2/nRe/wMR1LHLLbj9OL4ZeDlGCCnjBK9HmVan
	QIvlWcUQskRfPEeEvIIbD8=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp7 (Coremail) with SMTP id DsmowAC3hfFzqcJi_IadEQ--.18572S2;
	Mon, 04 Jul 2022 16:48:52 +0800 (CST)
From: Liang He <windhl@126.com>
To: leoyang.li@nxp.com,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com,
	linmq006@gmail.com
Subject: [PATCH] soc: fsl: qbman: Fix missing of_node_put() in qbman_init_private_mem()
Date: Mon,  4 Jul 2022 16:48:50 +0800
Message-Id: <20220704084850.277122-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowAC3hfFzqcJi_IadEQ--.18572S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFW3XrWfJr4fGr18Jr4xJFb_yoW8ur47pF
	4rA3yYk348tr47Wr12ya1DZa4Yyw48tay8K3Z2k3W09r13Jw1vqw4aqryFqasaqryku3WU
	JayUJF15Ca15X3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRbBMiUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBQ0F2JVkLyLEgAAsN
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We should call of_node_put() for the reference returned by
of_parse_phandle() which will increase the refcount.

Fixes: 42d0349784c7 ("soc/fsl/qbman: Add common routine for QBMan private allocations")
Co-authored-by: Miaoqian Lin <linmq006@gmail.com>
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/soc/fsl/qbman/dpaa_sys.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/fsl/qbman/dpaa_sys.c b/drivers/soc/fsl/qbman/dpaa_sys.c
index 9dd8bb571dbc..6138a68ea699 100644
--- a/drivers/soc/fsl/qbman/dpaa_sys.c
+++ b/drivers/soc/fsl/qbman/dpaa_sys.c
@@ -52,7 +52,8 @@ int qbman_init_private_mem(struct device *dev, int idx, dma_addr_t *addr,
 	rmem = of_reserved_mem_lookup(mem_node);
 	if (!rmem) {
 		dev_err(dev, "of_reserved_mem_lookup() returned NULL\n");
-		return -ENODEV;
+		err = -ENODEV;
+		goto out_of_put;
 	}
 	*addr = rmem->base;
 	*size = rmem->size;
@@ -66,24 +67,35 @@ int qbman_init_private_mem(struct device *dev, int idx, dma_addr_t *addr,
 	prop = of_find_property(mem_node, "reg", &len);
 	if (!prop) {
 		prop = devm_kzalloc(dev, sizeof(*prop), GFP_KERNEL);
-		if (!prop)
-			return -ENOMEM;
+		if (!prop) {
+			err = -ENOMEM;
+			goto out_of_put;
+		}
 		prop->value = res_array = devm_kzalloc(dev, sizeof(__be32) * 4,
 						       GFP_KERNEL);
-		if (!prop->value)
-			return -ENOMEM;
+		if (!prop->value) {
+			err = -ENOMEM;
+			goto out_of_put;
+		}
 		res_array[0] = cpu_to_be32(upper_32_bits(*addr));
 		res_array[1] = cpu_to_be32(lower_32_bits(*addr));
 		res_array[2] = cpu_to_be32(upper_32_bits(*size));
 		res_array[3] = cpu_to_be32(lower_32_bits(*size));
 		prop->length = sizeof(__be32) * 4;
 		prop->name = devm_kstrdup(dev, "reg", GFP_KERNEL);
-		if (!prop->name)
-			return -ENOMEM;
+		if (!prop->name) {
+			err = -ENOMEM;
+			goto out_of_put;
+		}
 		err = of_add_property(mem_node, prop);
 		if (err)
-			return err;
+			goto out_of_put;
 	}
+	of_node_put(mem_node);
 
 	return 0;
+
+out_of_put:
+	of_node_put(mem_node);
+	return err;
 }
-- 
2.25.1

