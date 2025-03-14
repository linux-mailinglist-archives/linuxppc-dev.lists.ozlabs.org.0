Return-Path: <linuxppc-dev+bounces-7073-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D6CA61332
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 14:57:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDmBj5q7zz3cdD;
	Sat, 15 Mar 2025 00:57:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741960621;
	cv=none; b=iCjhEZl0rqgWj/DfHGIoa0NwDRuMH51VqjLmQOmIt6ycj2d+xAX0rDWQoy+tFQP/HRzBQI/7VhyHVdc0fGcilD8uQaqAD/HkMwFD5Bff0yzesETbH1a4UrfBdWhNV8gl13YFbijGCBqcf/0BqmQgISx56iAq09Ps+zI3sfNjMe7FmVC03iQtHKh69iCojNpmd3+qZ5xAe5Fkg/o/wfIpYSMebZF9CqN4KOtmZkwNw9y4JM3/wqJXaBSxYrUPhqDiR2snLYoHt8xWigymM75KnNGUiet3APHy4LOGIaLXP1FQjRcvvuj1E5RoelOEkfmzRtIdozvx1JiPiEukY+7G/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741960621; c=relaxed/relaxed;
	bh=GP1C891gRUDmIZJZxmIcn2d7DaqxKBuMNf///X+ZPYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cMz5pK01RwALaQkxmuHtkvfnG3fQnYsKhmj5sRS9FKLxBqE2ymvNZz1Gp4R2n/8R25ZOC0kCwW/+tp6451fqcBRfezKOj4mWIRaeUbhV2GCoGCe5KOJUtgAfIts5Tuja5D+cAhxRNLUZB5y9kAeb+1YZrQekn8S9K3nAvaEC+urmSpRlQ12H3MghoS+XD23c8wAQnBaT3YcMs6k3WQwhUZhHGA3Fdssak2VZnPAZ9Xo4Pu9+ttg0MhTrPL6zOU5l3FtKS8cSjUz40KohdkVa2EXAeBY+jUX3nFfdSf9uvPuNavvbEuaFvOH/vBv54U2XfJRA1/QpO5aCJqqQuXpfFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LrL3VVKZ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LrL3VVKZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDmBh2RKXz3cbX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 00:57:00 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EB14wo005820
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=GP1C891gRUDmIZJZx
	mIcn2d7DaqxKBuMNf///X+ZPYU=; b=LrL3VVKZLKIM7x9iJDpGHE5HqgL+O2ace
	Y8WqyHl2udIvkjvKdHhUV1BWjdWkY3LCWPrc0fKGqkP+7IJepp8Y8qFD1VpfckVu
	qsSxBBh7REqxyPMbmy89sFTm07j0FSPYACArBDhytETjH3Z9e/dBW+wLuOgtrIBO
	LknXMQnPRBQJyPqzFfDe6+1m5uzwYjgCct4UZ2PXUV3sc4hf+hfcM/ynegJEAuAi
	qT9Hv+Y5TeUfpwuUrUwRm6ZxFZEISF+KB9+Ua7tqdotKkg8QlKRfLZuXmxKjaQYY
	kHxVnDm2DuaDP6O/3pkIxcBYPMK0zpk4zl94xnqTisF18FILMiufA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6s5by7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:57 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52ECuhnx015405
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:30 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atspq76t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:30 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52EDuPnJ33423832
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 13:56:26 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC3A120043;
	Fri, 14 Mar 2025 13:56:25 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E68E720040;
	Fri, 14 Mar 2025 13:56:20 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.242.102])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 13:56:20 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH 6/9] powerpc/pseries/htmdump: Add htm setup support to htmdump module
Date: Fri, 14 Mar 2025 19:25:38 +0530
Message-Id: <20250314135541.1831-7-atrajeev@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1fuYVdLkLrqEM8uJqz-EXmKDZpJRzp8c
X-Proofpoint-ORIG-GUID: 1fuYVdLkLrqEM8uJqz-EXmKDZpJRzp8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2503140110
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add htm setup support to htmdump module. To use the
HTM (Hardware Trace Macro), HTM buffer has to be allocated.
Support setup of HTM buffers via debugfs interface. Under
debugfs folder, "/sys/kernel/debug/powerpc/htmdump", add file
"htmsetup". The interface allows setup of HTM buffer by writing
size of HTM buffer in power of 2 to the "htmsetup" file

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/htmdump.c | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
index 8c75248f2682..cadb0ad6ba31 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -20,6 +20,8 @@ static u32 coreindexonchip;
 static u32 htmtype;
 static u32 htmconfigure;
 static u32 htmstart;
+static u32 htmsetup;
+
 static struct dentry *htmdump_debugfs_dir;
 
 /*
@@ -284,8 +286,41 @@ static const struct file_operations htminfo_fops = {
 	.open   = simple_open,
 };
 
+static int  htmsetup_set(void *data, u64 val)
+{
+	long rc, ret;
+
+	/*
+	 * Input value: HTM buffer size in the power of 2
+	 * example: hex value 0x21 ( decimal: 33 ) is for
+	 * 8GB
+	 * Invoke H_HTM call with:
+	 * - operation as htm start (H_HTM_OP_SETUP)
+	 * - parameter 1 set to input value.
+	 * - last two values are unused, hence set to zero
+	 */
+	rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+			htmtype, H_HTM_OP_SETUP, val, 0, 0);
+
+	ret = htm_return_check(rc);
+	if (ret <= 0)
+		return ret;
+
+	/* Set htmsetup if H_HTM_OP_SETUP operation succeeds */
+	htmsetup = val;
+
+	return 0;
+}
+
+static int htmsetup_get(void *data, u64 *val)
+{
+	*val = htmsetup;
+	return 0;
+}
+
 DEFINE_SIMPLE_ATTRIBUTE(htmconfigure_fops, htmconfigure_get, htmconfigure_set, "%llu\n");
 DEFINE_SIMPLE_ATTRIBUTE(htmstart_fops, htmstart_get, htmstart_set, "%llu\n");
+DEFINE_SIMPLE_ATTRIBUTE(htmsetup_fops, htmsetup_get, htmsetup_set, "%llu\n");
 
 static int htmdump_init_debugfs(void)
 {
@@ -313,6 +348,7 @@ static int htmdump_init_debugfs(void)
 	 */
 	debugfs_create_file("htmconfigure", 0600, htmdump_debugfs_dir, NULL, &htmconfigure_fops);
 	debugfs_create_file("htmstart", 0600, htmdump_debugfs_dir, NULL, &htmstart_fops);
+	debugfs_create_file("htmsetup", 0600, htmdump_debugfs_dir, NULL, &htmsetup_fops);
 
 	/* Debugfs interface file to present status of HTM */
 	htm_status_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
-- 
2.43.5


