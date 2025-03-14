Return-Path: <linuxppc-dev+bounces-7068-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9E0A6132A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 14:56:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDmB61JYZz3cbH;
	Sat, 15 Mar 2025 00:56:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741960590;
	cv=none; b=a/u4uQ+REU/Z437evnEl4KrPc5Ov3mjPjX+7gXDLhJ+vTy5/L3DgD/Ce2Dv28oknMEatmKfuBP0ppjIvGEszmbd9J8xRIiBcUYMB4pTmGplz6SA/cStTAKY4ljGOWP5roG7A3YeVPkrCIt7OpFgg8aSFNo/3kUEBX5WhIRrUPc4beaICF68sVBjg7jxB7HzKWhRSudJbIukVlrtOVe2E9mLTY8oPItRUK8ug3kTTQef9AamvFzy5TN2rxmtfwdiEfuR420jOMR/4HblMrVuOQ002vrBxsFilj+HVPHw1T3SnObCdfwGQAw9RUun91nwi8/E1BX60fR9ufAsOxocQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741960590; c=relaxed/relaxed;
	bh=k2iVUtvAWO8z0Lsg9vUE+waMx11PTQVy20eo1KfCUcM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jMghjMF+qR1KIa+RsLT59R/QECy5tS6D+WCqiyiojCfJr7/pU7YNOEyFZsuIp36m3AQdkAYWJgq6Bw0w0G3VSbgLdUpVLUAXvYPapl3YMMR9J0TVb6pABuns2TQ+Qxd3TNrQ+jF6GY5GcXkjt3DkhVXTXfupjpn+ai8t1dF/Eg9xdwSqpJ+PUdBxenysz042idDgK16vRwQQt9F6vEOmOU1l7m6citnQ380rVZa4tNgh5xawfRjaHTeArAiWZjkUw9FJw1HkEEv3gAPLLAK30E9rUg3HUHa6D4Pj7mCJfSDcRjSD0RX1I5TKF804QdtE008heXzYkIt3QB1w9nYwdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CN86p4Nc; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CN86p4Nc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDmB52kSLz3cZ9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 00:56:29 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EBK3LT032034
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=k2iVUt
	vAWO8z0Lsg9vUE+waMx11PTQVy20eo1KfCUcM=; b=CN86p4Nc2fHOOmxJ16VZ0f
	mJowDjBgD87kzmw1QUiSKG5c5jk+w13S4Wdj1kwXHKQTnHLJqNiFeEADjw+Vj6+p
	RR7mWHGknJOrCddMfQIUZ/Ejy9K4bpVLVONjvwCtLxShT7qy4fLt0KwJbVoeqYYW
	Mj0ys3o8as/6tPxtx6rp+2vOjfYvjaerTT/HBV56fAbUbYS2Cx02i4VpHHpobgFD
	qZD9H/o+U1HFecRSgsMuQUfBWzrvqYWyrrjmhV6lJzNVAJ+1u8xE7Tj5bdBSgJg+
	83ueCMiWN6P7gg+9eiLKx5XHx0Oh6amtvGQqdodlEWJd3ABHeJd04CPjvxSKri8A
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6hpv2r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:26 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52ECN49Y007428
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:26 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45atsrf6fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:26 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52EDuK2Y34013730
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 13:56:20 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30C612004E;
	Fri, 14 Mar 2025 13:56:20 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 025DE20043;
	Fri, 14 Mar 2025 13:56:15 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.242.102])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 13:56:14 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH 5/9] powerpc/pseries/htmdump: Add htm info support to htmdump module
Date: Fri, 14 Mar 2025 19:25:37 +0530
Message-Id: <20250314135541.1831-6-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250314135541.1831-1-atrajeev@linux.ibm.com>
References: <20250314135541.1831-1-atrajeev@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6CqbWo-WP_qxY0wkjOv1PlyHuFRzo0t8
X-Proofpoint-ORIG-GUID: 6CqbWo-WP_qxY0wkjOv1PlyHuFRzo0t8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503140106
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Support dumping system processor configuration from Hardware
Trace Macro (HTM) function via debugfs interface. Under
debugfs folder "/sys/kernel/debug/powerpc/htmdump", add
file "htminfo”.

The interface allows only read of this file which will present the
content of HTM buffer from the hcall. The 16th offset of HTM
buffer has value for the number of entries for array of processors.
Use this information to copy data to the debugfs file

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/htmdump.c | 49 ++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
index 703ad2f8b5f0..8c75248f2682 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -13,6 +13,7 @@
 
 static void *htm_buf;
 static void *htm_status_buf;
+static void *htm_info_buf;
 static u32 nodeindex;
 static u32 nodalchipindex;
 static u32 coreindexonchip;
@@ -243,6 +244,46 @@ static const struct file_operations htmstatus_fops = {
 	.open	= simple_open,
 };
 
+static ssize_t htminfo_read(struct file *filp, char __user *ubuf,
+			     size_t count, loff_t *ppos)
+{
+	void *htm_info_buf = filp->private_data;
+	long rc, ret;
+	u64 *num_entries;
+	u64 to_copy;
+
+	/*
+	 * Invoke H_HTM call with:
+	 * - operation as htm status (H_HTM_OP_STATUS)
+	 * - last three values as addr, size and offset
+	 */
+	rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+				   htmtype, H_HTM_OP_DUMP_SYSPROC_CONF, virt_to_phys(htm_info_buf),
+				   PAGE_SIZE, 0);
+
+	ret = htm_return_check(rc);
+	if (ret <= 0)
+		return ret;
+
+	/*
+	 * HTM status buffer, start of buffer + 0x10 gives the
+	 * number of HTM entries in the buffer. Each entry of processor
+	 * is 16 bytes.
+	 *
+	 * So total count to copy is:
+	 * 32 bytes (for first 5 fields) + (number of HTM entries * entry size)
+	 */
+	num_entries = htm_info_buf + 0x10;
+	to_copy = 32 + (be64_to_cpu(*num_entries) * 16);
+	return simple_read_from_buffer(ubuf, count, ppos, htm_info_buf, to_copy);
+}
+
+static const struct file_operations htminfo_fops = {
+	.llseek = NULL,
+	.read   = htminfo_read,
+	.open   = simple_open,
+};
+
 DEFINE_SIMPLE_ATTRIBUTE(htmconfigure_fops, htmconfigure_get, htmconfigure_set, "%llu\n");
 DEFINE_SIMPLE_ATTRIBUTE(htmstart_fops, htmstart_get, htmstart_set, "%llu\n");
 
@@ -280,7 +321,15 @@ static int htmdump_init_debugfs(void)
 		return -ENOMEM;
 	}
 
+	/* Debugfs interface file to present System Processor Configuration */
+	htm_info_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!htm_info_buf) {
+		pr_err("Failed to allocate htm info buf\n");
+		return -ENOMEM;
+	}
+
 	debugfs_create_file("htmstatus", 0400, htmdump_debugfs_dir, htm_status_buf, &htmstatus_fops);
+	debugfs_create_file("htminfo", 0400, htmdump_debugfs_dir, htm_info_buf, &htminfo_fops);
 
 	return 0;
 }
-- 
2.43.5


