Return-Path: <linuxppc-dev+bounces-7066-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 813ABA61326
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 14:56:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDm9s5mKJz3cZB;
	Sat, 15 Mar 2025 00:56:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741960577;
	cv=none; b=lhwXc+JpeUnDQApq5aQ5Y9sXXJIwqXzvIUW5L1SIXkUL1AmsHS+QvJ58Ghy5RoVJ6DMrTqlREbcpH3KduhOoHOqofOlcsl+24Nc5TkqKxZlonwUQJj37WPZlbTBxdlZHPTBr2xdFEzLoHKH7/HxdrmijRRhfENdgwwzFogwUBZhnftYbYO7GygeH7Efs1w0tuYFHL6HLO1nFBE/lqXiKkKzmalXV3ClfzLkslPbLU1Q80/wCPjxwf4L3NfeHwCuRg3Z9ePNbaJXBc8h42/I1g/BCRzJMjqU9hz4LD6dDmcxAaSpBoGYaZrLRut60qxvt6VCIJ3VLyQB+BCncxUH7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741960577; c=relaxed/relaxed;
	bh=tBQpCh4XaIYnv36kAnIS1YvIYUXIKGY9AOF17mwSSJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A261CZXM60kRMG+BU8aBeKc7wZXviBf3S6B6GPEsfqN22wNtf82ahHn5liXV9Vkn9Aj6xqnOd8JWaku60j/c5KuV9VNFEKSdlV1Mp1cU3PJvyPkj2dI4rnNYz69iNn5s7ZiN4sgQl+prtvbeg5MiyedZwKsdMROC3rdIfq4I5QM6pXFXz9DwD91M9BLUZyx1T23ULfXTuwZaN+7If3hOzd89AUK0uaDk2xlF3x4qxChqsfgSuAwVt0TQqa628ZiXv2eZbA9ybB+SxDJMP8YVllbJeGCgL6G6ERvykG/1IfjAWqhnmg5j0f6cZlFhdvr8X7Yhm5UVzz/oSk5w80nAhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E+GGpEQH; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E+GGpEQH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDm9s00jQz3cZ9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 00:56:16 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EABFcp009874
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=tBQpCh4XaIYnv36kA
	nIS1YvIYUXIKGY9AOF17mwSSJQ=; b=E+GGpEQHuGKB7Im/Sir5tGlqz0Gr5a07I
	1wxGu+MLr6OhhIrJ2+EIjbv6ekRufUF0nabWzDmzBFvGVLJlYVy4cPWvKIMqULnr
	v1DHyhIVTqmeGy3sAYO8HL8FQw743+9DBDfOHCoz5A5Q7fv8LZjcPQDRHeHaVMAa
	ng6HxU4/QlhTkeDqoe/T+PqGSF0AtoKIiBWWjdB3ojR2h/X53haq46/QzHCPIarC
	rbkllOoWBkOM9idrhyS969w48nYHmlhLCOxNkg91GUEH8HrVuTIT7aTq17JOpjDh
	Rx5bRZX615GlSm7ku+7OW4STuuO4Y0jNTupcAFRn+NQ+g2ziF4JZw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6s5by6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:14 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52ECRcHv015411
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:13 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atspq751-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:13 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52EDu8u245416836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 13:56:08 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74B492004B;
	Fri, 14 Mar 2025 13:56:08 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8046220043;
	Fri, 14 Mar 2025 13:56:03 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.242.102])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 13:56:03 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH 3/9] powerpc/pseries/htmdump: Add htm start support to htmdump module
Date: Fri, 14 Mar 2025 19:25:35 +0530
Message-Id: <20250314135541.1831-4-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: tgdFnfCgYQnuokNMk5gwRs_E-txJfYND
X-Proofpoint-ORIG-GUID: tgdFnfCgYQnuokNMk5gwRs_E-txJfYND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2503140106
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Support starting of Hardware Trace Macro (HTM) function
via debugfs interface. Under debugfs folder
"/sys/kernel/debug/powerpc/htmdump", add file "htmstart".
The interface allows starting of htm via this file by
writing value "1". Also allows stopping of htm tracing by
writing value "0" to this file. Any other value returns
-EINVAL.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/htmdump.c | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
index c623836f7054..dafbe662fb3d 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -17,6 +17,7 @@ static u32 nodalchipindex;
 static u32 coreindexonchip;
 static u32 htmtype;
 static u32 htmconfigure;
+static u32 htmstart;
 static struct dentry *htmdump_debugfs_dir;
 
 /*
@@ -151,7 +152,53 @@ static int htmconfigure_get(void *data, u64 *val)
 	return 0;
 }
 
+static int  htmstart_set(void *data, u64 val)
+{
+	long rc, ret;
+
+	/*
+	 * value as 1: start HTM
+	 * value as 0: stop HTM
+	 * Return -EINVAL for other values.
+	 */
+	if (val == 1) {
+		/*
+		 * Invoke H_HTM call with:
+		 * - operation as htm start (H_HTM_OP_START)
+		 * - last three values are unused, hence set to zero
+		 */
+		rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+			   htmtype, H_HTM_OP_START, 0, 0, 0);
+
+	} else if (val == 0) {
+		/*
+		 * Invoke H_HTM call with:
+		 * - operation as htm stop (H_HTM_OP_STOP)
+		 * - last three values are unused, hence set to zero
+		 */
+		rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+				htmtype, H_HTM_OP_STOP, 0, 0, 0);
+	} else
+		return -EINVAL;
+
+	ret = htm_return_check(rc);
+	if (ret <= 0)
+		return ret;
+
+	/* Set htmstart if H_HTM_OP_START/H_HTM_OP_STOP operation succeeds */
+	htmstart = val;
+
+	return 0;
+}
+
+static int htmstart_get(void *data, u64 *val)
+{
+	*val = htmstart;
+	return 0;
+}
+
 DEFINE_SIMPLE_ATTRIBUTE(htmconfigure_fops, htmconfigure_get, htmconfigure_set, "%llu\n");
+DEFINE_SIMPLE_ATTRIBUTE(htmstart_fops, htmstart_get, htmstart_set, "%llu\n");
 
 static int htmdump_init_debugfs(void)
 {
@@ -178,6 +225,7 @@ static int htmdump_init_debugfs(void)
 	 * Debugfs interface files to control HTM operations:
 	 */
 	debugfs_create_file("htmconfigure", 0600, htmdump_debugfs_dir, NULL, &htmconfigure_fops);
+	debugfs_create_file("htmstart", 0600, htmdump_debugfs_dir, NULL, &htmstart_fops);
 
 	return 0;
 }
-- 
2.43.5


