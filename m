Return-Path: <linuxppc-dev+bounces-7712-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F96A90D7C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 22:58:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdCzM5qFVz3c0n;
	Thu, 17 Apr 2025 06:58:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744837087;
	cv=none; b=ov8WV9COfw24Ci+cjzSrLYliKdbAL0MUeBJvhQGzeiRmXEtY+8gaY+/L8txzRjV4rnMxYfRSclbxX6gvkxnCwsOuqTftCet9NAQ7t4uLOLZ6hWCVvHlZvEMuvpsdm5t/IF1Ak4epj42U19HYcxjBBsv+0AIrTPYGnTkKE09sOAVNCgDCzNhejyDL+M8/PlY9pVs0u99j/gUr59/DM9eWQWKOQe1t+ot5FDDjdJ7ovPgYqJM2HC28dSyVJ875Rf4k0+CMk5D3H83DFyVBytGnMWpuPYn0qTg9swSCxRX3CSaD98a+C0Zp3ypuIKFf4wTmBIo+sRaYuV1Jcxp4zHvFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744837087; c=relaxed/relaxed;
	bh=kV0hQaWmProlhsKXETMeWh5cXOWX/R2Wb2mnJiZJ5Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G4j6n5tVNKQtWefqbbRxWMJqoXP4ajXvJvk8QKGw8g3cHPbi8N/uut2vLn0EJiTfbg97AVlsteEOXcF63gg4+QipQ6WkUYQscxHi5O1ubnLFKiUGrgclI9f0pi5GD7pq9D1rDL/bHIJe4wX4tzpKABUyFNVCDN6Nm9W38FCjviV0CGbc0H9bewqWRd8bzx0rlnUYTZuCfmXt6vtXNLJO/azlfWwZsICFEvuQE4a9UoYPn7ETS43k1qo4YBQgwLmKm7/eCK4Ps3wvfCMrbUIFn+oCORCvfos0JNaxlXne16G1YLHWVb3WfsDGAOhcA8NbYpAkmDO4JhqxlS+U6EV8Qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iNISd2gT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iNISd2gT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdCzK2m7Lz3bvX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 06:58:04 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GGsq7Y018279;
	Wed, 16 Apr 2025 20:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=kV0hQaWmProlhsKXE
	TMeWh5cXOWX/R2Wb2mnJiZJ5Zo=; b=iNISd2gTisB7UMoYSpGldwrHKqetG1J4B
	H7zKrQE5wZu/73qSl20LdaRhQF/pa4ScnJaZcdfr7MQwkrQ+LAIQRxc0M2JugPDr
	JAxYS0sdIdSkbxYXfuOPlINSz9donXZJFEPen5mi23Ymx69yHy8hytkbsDtBBtA3
	UYJ3TjH1e3dc/u8/Mj1FVrs/oiycU4IcQzHvbAUqbwugvgJTklcfHuv9ghLZ9A/k
	IhpXc0NrVRAvhKtU9jlJ5H3hS+VD4Z2YZX5O5b4esygcBEarujUSRB7PIR83nuWK
	FxmZcXwM9E2orld72TylWpgbTtM5kT+h82bPBa6f6v9yUSILbd+4g==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461y1gease-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 20:58:00 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53GIT2wp017199;
	Wed, 16 Apr 2025 20:57:59 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46040m26kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 20:57:59 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GKvwx328115710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 20:57:58 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE4445805D;
	Wed, 16 Apr 2025 20:57:58 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89A3158059;
	Wed, 16 Apr 2025 20:57:58 +0000 (GMT)
Received: from d.attlocal.net (unknown [9.61.183.42])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 20:57:58 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: michal.swiatkowski@linux.intel.com, horms@kernel.org,
        Dave Marquardt <davemarq@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next v3 3/3] net: ibmveth: added KUnit tests for some buffer pool functions
Date: Wed, 16 Apr 2025 15:57:51 -0500
Message-ID: <20250416205751.66365-4-davemarq@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416205751.66365-1-davemarq@linux.ibm.com>
References: <20250416205751.66365-1-davemarq@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xKsnmu60IicYoaQ5qWz93aI8qKpv5e_M
X-Proofpoint-GUID: xKsnmu60IicYoaQ5qWz93aI8qKpv5e_M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_08,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504160168
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Added KUnit tests for ibmveth_remove_buffer_from_pool and
ibmveth_rxq_get_buffer under new IBMVETH_KUNIT_TEST config option.

Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
---
 drivers/net/ethernet/ibm/Kconfig   |  13 +++
 drivers/net/ethernet/ibm/ibmveth.c | 125 +++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)

diff --git a/drivers/net/ethernet/ibm/Kconfig b/drivers/net/ethernet/ibm/Kconfig
index c0c112d95b89..4f4b23465c47 100644
--- a/drivers/net/ethernet/ibm/Kconfig
+++ b/drivers/net/ethernet/ibm/Kconfig
@@ -27,6 +27,19 @@ config IBMVETH
 	  To compile this driver as a module, choose M here. The module will
 	  be called ibmveth.
 
+config IBMVETH_KUNIT_TEST
+	bool "KUnit test for IBM LAN Virtual Ethernet support" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	depends on KUNIT=y && IBMVETH=y
+	default KUNIT_ALL_TESTS
+	help
+	  This builds unit tests for the IBM LAN Virtual Ethernet driver.
+
+	  For more information on KUnit and unit tests in general, please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
+
 source "drivers/net/ethernet/ibm/emac/Kconfig"
 
 config EHEA
diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 59158284ec43..e56cfc82ddd0 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -2040,3 +2040,128 @@ static void __exit ibmveth_module_exit(void)
 
 module_init(ibmveth_module_init);
 module_exit(ibmveth_module_exit);
+
+#ifdef CONFIG_IBMVETH_KUNIT_TEST
+#include <kunit/test.h>
+
+/**
+ * ibmveth_reset_kunit - reset routine for running in KUnit environment
+ *
+ * @w: pointer to work_struct embedded in adapter structure
+ *
+ * Context: Called in the KUnit environment. Does nothing.
+ *
+ * Return: void
+ */
+static void ibmveth_reset_kunit(struct work_struct *w)
+{
+	netdev_dbg(NULL, "reset_kunit starting\n");
+	netdev_dbg(NULL, "reset_kunit complete\n");
+}
+
+/**
+ * ibmveth_remove_buffer_from_pool_test - unit test for some of
+ *                                        ibmveth_remove_buffer_from_pool
+ * @test: pointer to kunit structure
+ *
+ * Tests the error returns from ibmveth_remove_buffer_from_pool.
+ * ibmveth_remove_buffer_from_pool also calls WARN_ON, so dmesg should be
+ * checked to see that these warnings happened.
+ *
+ * Return: void
+ */
+static void ibmveth_remove_buffer_from_pool_test(struct kunit *test)
+{
+	struct ibmveth_adapter *adapter = kunit_kzalloc(test, sizeof(*adapter), GFP_KERNEL);
+	struct ibmveth_buff_pool *pool;
+	u64 correlator;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adapter);
+
+	INIT_WORK(&adapter->work, ibmveth_reset_kunit);
+
+	/* Set sane values for buffer pools */
+	for (int i = 0; i < IBMVETH_NUM_BUFF_POOLS; i++)
+		ibmveth_init_buffer_pool(&adapter->rx_buff_pool[i], i,
+					 pool_count[i], pool_size[i],
+					 pool_active[i]);
+
+	pool = &adapter->rx_buff_pool[0];
+	pool->skbuff = kunit_kcalloc(test, pool->size, sizeof(void *), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pool->skbuff);
+
+	correlator = ((u64)IBMVETH_NUM_BUFF_POOLS << 32) | 0;
+	KUNIT_EXPECT_EQ(test, -EINVAL, ibmveth_remove_buffer_from_pool(adapter, correlator, false));
+	KUNIT_EXPECT_EQ(test, -EINVAL, ibmveth_remove_buffer_from_pool(adapter, correlator, true));
+
+	correlator = ((u64)0 << 32) | adapter->rx_buff_pool[0].size;
+	KUNIT_EXPECT_EQ(test, -EINVAL, ibmveth_remove_buffer_from_pool(adapter, correlator, false));
+	KUNIT_EXPECT_EQ(test, -EINVAL, ibmveth_remove_buffer_from_pool(adapter, correlator, true));
+
+	correlator = (u64)0 | 0;
+	pool->skbuff[0] = NULL;
+	KUNIT_EXPECT_EQ(test, -EFAULT, ibmveth_remove_buffer_from_pool(adapter, correlator, false));
+	KUNIT_EXPECT_EQ(test, -EFAULT, ibmveth_remove_buffer_from_pool(adapter, correlator, true));
+}
+
+/**
+ * ibmveth_rxq_get_buffer_test - unit test for ibmveth_rxq_get_buffer
+ * @test: pointer to kunit structure
+ *
+ * Tests ibmveth_rxq_get_buffer. ibmveth_rxq_get_buffer also calls WARN_ON for
+ * the NULL returns, so dmesg should be checked to see that these warnings
+ * happened.
+ *
+ * Return: void
+ */
+static void ibmveth_rxq_get_buffer_test(struct kunit *test)
+{
+	struct ibmveth_adapter *adapter = kunit_kzalloc(test, sizeof(*adapter), GFP_KERNEL);
+	struct sk_buff *skb = kunit_kzalloc(test, sizeof(*skb), GFP_KERNEL);
+	struct ibmveth_buff_pool *pool;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adapter);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, skb);
+
+	INIT_WORK(&adapter->work, ibmveth_reset_kunit);
+
+	adapter->rx_queue.queue_len = 1;
+	adapter->rx_queue.index = 0;
+	adapter->rx_queue.queue_addr = kunit_kzalloc(test, sizeof(struct ibmveth_rx_q_entry),
+						     GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adapter->rx_queue.queue_addr);
+
+	/* Set sane values for buffer pools */
+	for (int i = 0; i < IBMVETH_NUM_BUFF_POOLS; i++)
+		ibmveth_init_buffer_pool(&adapter->rx_buff_pool[i], i,
+					 pool_count[i], pool_size[i],
+					 pool_active[i]);
+
+	pool = &adapter->rx_buff_pool[0];
+	pool->skbuff = kunit_kcalloc(test, pool->size, sizeof(void *), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pool->skbuff);
+
+	adapter->rx_queue.queue_addr[0].correlator = (u64)IBMVETH_NUM_BUFF_POOLS << 32 | 0;
+	KUNIT_EXPECT_PTR_EQ(test, NULL, ibmveth_rxq_get_buffer(adapter));
+
+	adapter->rx_queue.queue_addr[0].correlator = (u64)0 << 32 | adapter->rx_buff_pool[0].size;
+	KUNIT_EXPECT_PTR_EQ(test, NULL, ibmveth_rxq_get_buffer(adapter));
+
+	pool->skbuff[0] = skb;
+	adapter->rx_queue.queue_addr[0].correlator = (u64)0 << 32 | 0;
+	KUNIT_EXPECT_PTR_EQ(test, skb, ibmveth_rxq_get_buffer(adapter));
+}
+
+static struct kunit_case ibmveth_test_cases[] = {
+	KUNIT_CASE(ibmveth_remove_buffer_from_pool_test),
+	KUNIT_CASE(ibmveth_rxq_get_buffer_test),
+	{}
+};
+
+static struct kunit_suite ibmveth_test_suite = {
+	.name = "ibmveth-kunit-test",
+	.test_cases = ibmveth_test_cases,
+};
+
+kunit_test_suite(ibmveth_test_suite);
+#endif
-- 
2.49.0


