Return-Path: <linuxppc-dev+bounces-7072-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED534A61331
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 14:57:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDmBj5FmXz3cYw;
	Sat, 15 Mar 2025 00:57:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741960621;
	cv=none; b=W4hJvfVUuFeR+Wm6oqlHWREwXARNTm6IFMIlp5V+oWnb8jXMAyfZWdfeFkt4qTG9xPGkvAKyZ+ZyKRqfjVspLmfr6yWpXTYirIyi0Iki987+JiiKXakeA6gAGZgLxJt5mjXZ0xWKhnXMRn/qdQVbV7eUPGJmRB34wC38OF89oXpIub9iWEnG4OjwTGBUwoEy7QE2DOaHAtFlb+ZLc29CcQSeaKbY7C80UUjlD1fY05p4BicqiaKnEVBgXl0GOYfTzWsMM6xTdnhrcZDyONAynG3wt443dne1QQ4joKSxdC6/CDYunBLTUkWwfemKISdqUa9FGgsAG0aAjn/4oSgP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741960621; c=relaxed/relaxed;
	bh=Wi8LpVc9osOyh8vEUW3JIyNyySeOw3MourdN2/z8Yj4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eG2+9lN4OdAvuKI31Tfl4UqeTKWZsR5kRtzcymXAzOlSAAOE3+i42+1zTYNyAt0EcS6sIK0NNNA3n772ytXeghnqrSSOxRqvlFaJ0oviX+WOko7OnunhFmp5GZdytIoeq7lJCFYhe2JXZ0SNXQQc3zyBaj/AJHu9KuXIGg6KMlFp96nG3k2HD2Xi/ou/8JbZF/j1dN9lWoUz8z1e8WJq9CLO8YtRhIqn222IHAqWLb1UGspHhXHp1FVsBy4n8HXBNND9XW8saSFqkL9Kxp76WXGkHdFbYZh79/FojM6zAqV3BNhTrSzFCg8hrH4UwCh/5FL5fRLbXRD4HvncKuA/OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hc4mqaLh; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hc4mqaLh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDmBh3748z3ccF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 00:57:00 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E8XNYc032039
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Wi8LpV
	c9osOyh8vEUW3JIyNyySeOw3MourdN2/z8Yj4=; b=hc4mqaLhBDRfONieyL4oI0
	xHhRcwGIl34LJvHwZR/qQUE0fVhVAaK7GVl75Vb3K0i+We4LKVOBILzB2Sboe9pj
	EOiJVFhxP2uoubbsMx9pTUtHVbJW8nn2hSXyXdWsieV3fhbDs5/s3wqWm5DiQ6Qj
	keoNtWDDwHxzc1xy/zVkHS6cQLKNmejyvhNTxdqsD7c+3JGDAJjLU/4wToKnsxNn
	X8lsov/6wOlcKnWwzUkBoC4is1I8RkA86n1Lofq+nBJHlNlvWCpaJ/9UaGQKNcTH
	pUXd2UzEWTyvsq7NrFriXYqFX09VGjYg1as6CR85IRZxH5nPEIbp/mX8yUhT1Cmw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6hpv2s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:58 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52ECRwUF027167
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:43 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45atsr75re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:43 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52EDubg758917272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 13:56:37 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C078420043;
	Fri, 14 Mar 2025 13:56:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9066220040;
	Fri, 14 Mar 2025 13:56:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.242.102])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 13:56:32 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH 8/9] powerpc/pseries/htmdump: Add htm capabilities support to htmdump module
Date: Fri, 14 Mar 2025 19:25:40 +0530
Message-Id: <20250314135541.1831-9-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: dYMgMJoAs7sY6tr_9OhTB1XWGVRDbfyZ
X-Proofpoint-ORIG-GUID: dYMgMJoAs7sY6tr_9OhTB1XWGVRDbfyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503140110
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Support dumping HTM capabilities information from Hardware
Trace Macro (HTM) function via debugfs interface. Under
debugfs folder "/sys/kernel/debug/powerpc/htmdump", add
file "htmcaps”.

The interface allows only read of this file which will present the
content of HTM buffer from the hcall.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/htmdump.c | 38 ++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
index 0b3bed738db5..3d30af0304d6 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -14,6 +14,7 @@
 static void *htm_buf;
 static void *htm_status_buf;
 static void *htm_info_buf;
+static void *htm_caps_buf;
 static u32 nodeindex;
 static u32 nodalchipindex;
 static u32 coreindexonchip;
@@ -290,12 +291,41 @@ static ssize_t htminfo_read(struct file *filp, char __user *ubuf,
 	return simple_read_from_buffer(ubuf, count, ppos, htm_info_buf, to_copy);
 }
 
+static ssize_t htmcaps_read(struct file *filp, char __user *ubuf,
+			     size_t count, loff_t *ppos)
+{
+	void *htm_caps_buf = filp->private_data;
+	long rc, ret;
+
+	/*
+	 * Invoke H_HTM call with:
+	 * - operation as htm capabilities (H_HTM_OP_CAPABILITIES)
+	 * - last three values as addr, size (0x80 for Capabilities Output Buffer
+	 *   and zero
+	 */
+	rc = htm_hcall_wrapper(htmflags, nodeindex, nodalchipindex, coreindexonchip,
+				   htmtype, H_HTM_OP_CAPABILITIES, virt_to_phys(htm_caps_buf),
+				   0x80, 0);
+
+	ret = htm_return_check(rc);
+	if (ret <= 0)
+		return ret;
+
+	return simple_read_from_buffer(ubuf, count, ppos, htm_caps_buf, 0x80);
+}
+
 static const struct file_operations htminfo_fops = {
 	.llseek = NULL,
 	.read   = htminfo_read,
 	.open   = simple_open,
 };
 
+static const struct file_operations htmcaps_fops = {
+	.llseek = NULL,
+	.read   = htmcaps_read,
+	.open   = simple_open,
+};
+
 static int  htmsetup_set(void *data, u64 val)
 {
 	long rc, ret;
@@ -401,8 +431,16 @@ static int htmdump_init_debugfs(void)
 		return -ENOMEM;
 	}
 
+	/* Debugfs interface file to present HTM capabilities */
+	htm_caps_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!htm_caps_buf) {
+		pr_err("Failed to allocate htm caps buf\n");
+		return -ENOMEM;
+	}
+
 	debugfs_create_file("htmstatus", 0400, htmdump_debugfs_dir, htm_status_buf, &htmstatus_fops);
 	debugfs_create_file("htminfo", 0400, htmdump_debugfs_dir, htm_info_buf, &htminfo_fops);
+	debugfs_create_file("htmcaps", 0400, htmdump_debugfs_dir, htm_caps_buf, &htmcaps_fops);
 
 	return 0;
 }
-- 
2.43.5


