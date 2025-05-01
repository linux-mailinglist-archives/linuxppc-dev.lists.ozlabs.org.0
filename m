Return-Path: <linuxppc-dev+bounces-8228-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96134AA6450
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 May 2025 21:50:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZpPm318Q6z2yPS;
	Fri,  2 May 2025 05:50:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746129008;
	cv=none; b=bDRb1IjIJ1YI3iXjS0YDgcczDgiYc8Qw4FyF9wHWiq+hOo1biiYsVsHpJFphAdVBXVlmCEZzTftMge2g3gFL1qCNOcc4qMMNI7NnhKwUsbxst2noxn2Dj1BLjVcw84dNt8mC+HuEsxkXPHbgDH/t68pG05cmmu1G1XsOJAj0qHDi/M7DbHQGfX1+GidWOJeo4z1GW8QQHv0o1EuOJFgWaH/NGECWWR5dnmslXCK7OTB5nKuogv4vIxNJ44F4ygihJvoeIqPRjimwNwX3MoHCHBSbwm1wVE3fm//wM1BCgt0bRNaGQjbWoEoW+ujWhMojiaxdbc+X8OO4L1kqhjwLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746129008; c=relaxed/relaxed;
	bh=OTTDi8Z7dNRjnG/C7i/NSfctVJgzkH0Y4uKB4qsAlKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oTJonGvcEM4VXNzuvkeO8Un4oDDy/sux1HBDL19M22EmPnzle+sKy5Ri15kfueTE4KnrhFEB4asqWDd9EvQvwxjo8X3uhZJ7ItMLTfzqR7CjOdhkp98ChxMK9UlsxZapq4r8h97LFvzSOrw1//28UaeCKu+E4pgp9JJqW+1x8c7edoaT933xoelCcJ9lZUwe7mgfQ7BAp3yNQsh6O2E5nL1ZLUz5uN5uv0T3TXqXRAF17QrtU2SYh5mVR6O9eEQSbDl9kQ27KZ9yxIQH5BP5184W1SXlRPskD3xo9GLTNoh6uhHPIhKK3fzr5SZHjpES78jSJ3jt2Ybl4SIa2KmQDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sf3GKD0K; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sf3GKD0K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZpPlz0yCHz2yWK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 05:50:06 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541BowoI027369;
	Thu, 1 May 2025 19:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=OTTDi8Z7dNRjnG/C7
	i/NSfctVJgzkH0Y4uKB4qsAlKw=; b=sf3GKD0KpToRqXkhTQJkRqqowiK2F434I
	qSUi3wphjaOxDwxxLAEWLdQALZ3m0RY88eZ7MKaf67kTVvusI9gcqsJC8gJBfUec
	NRmxk3sUfmSK1qk609nOLFUOsOaGs1VOjWuXskAWb3qq0sdjh5HacNfGxq2QcXg1
	UT2tNA3mYeHocTCh09k9BhXeFQeQpcI+91yMce8DyY/iTQYIXdzeWUo9GytF3oK2
	J3PVtwFLxVBAaqFOPpy0Gwltm3HwGHokXPmURWWaLoNIFumit8eD+mffKOgqrh1R
	YuVnVHr/J6VzTtYwHTluoyEoRWLEcud72G73m/w+AqwKaA+SSKP4g==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46buy950jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:50:02 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 541G3o40031617;
	Thu, 1 May 2025 19:50:01 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4699tueu40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:50:01 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 541Jo0I714156420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 19:50:00 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C4225805D;
	Thu,  1 May 2025 19:50:00 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E743758043;
	Thu,  1 May 2025 19:49:59 +0000 (GMT)
Received: from d.austin.ibm.com (unknown [9.41.102.181])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 May 2025 19:49:59 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, michal.swiatkowski@linux.intel.com,
        horms@kernel.org, kuba@kernel.org,
        Dave Marquardt <davemarq@linux.ibm.com>
Subject: [PATCH v4 3/3] net: ibmveth: added KUnit tests for some buffer pool functions
Date: Thu,  1 May 2025 14:49:44 -0500
Message-ID: <20250501194944.283729-4-davemarq@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250501194944.283729-1-davemarq@linux.ibm.com>
References: <20250501194944.283729-1-davemarq@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE1MCBTYWx0ZWRfXy5VURqZZyJbk c73O4S0B2KVWq/3tMhKq9MyxRlSTblDPxu6WA8vaAcToIYsbY5DrvBKHI/uXCMUM2JnuWw2cJHS dH5eTEN7Ho/XxvuATJDwKv2z9tkJne6LvcM8pV9BKDCMAA2xw9Ur2WcsQGNa8Cd9FHyk5tGhBgF
 /qB1lUmrsRO5y6Ee1FrIOMal6txCj6k0tQuIVDBEVTk1HtjT+I40qy8msG+c0Ct5mY9MfC08p/C AsK6xxnFdB8g1PHe/5L3v9r3+0ykdkzY8YCJX+zyK1VVp76tSTRuxOPaOU4Fz1BBgDujPi2I+Pe E3CxPXs8ymsJkZc4ScltY9fmva+5W01YhYlfjR/IgS94X4jl9LbJHLg46a12wzt7FgS9wMpknbx
 ONc3P+kKJL5QoYhsRMlSjjXrSYJu+M/b3yG7aIESBT9xW5/5DU8iwr0GGnf8IkVXRmUsXmwv
X-Authority-Analysis: v=2.4 cv=FOYbx/os c=1 sm=1 tr=0 ts=6813d06a cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=I7YlqU3avA6il8a57_sA:9
X-Proofpoint-ORIG-GUID: K6c2G5bmvBXW84onfuzar1tdOju4fRx4
X-Proofpoint-GUID: K6c2G5bmvBXW84onfuzar1tdOju4fRx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010150
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Added KUnit tests for ibmveth_remove_buffer_from_pool and
ibmveth_rxq_get_buffer under new IBMVETH_KUNIT_TEST config option.

Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/ibm/Kconfig   |  13 +++
 drivers/net/ethernet/ibm/ibmveth.c | 129 +++++++++++++++++++++++++++++
 2 files changed, 142 insertions(+)

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
index cff494739bc9..45143467286e 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -2042,3 +2042,132 @@ static void __exit ibmveth_module_exit(void)
 
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
+
+	flush_work(&adapter->work);
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
+
+	flush_work(&adapter->work);
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


