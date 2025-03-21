Return-Path: <linuxppc-dev+bounces-7251-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC35A6B4DD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 08:22:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJv6F6r41z30LS;
	Fri, 21 Mar 2025 18:22:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742541749;
	cv=none; b=RXG+IDIAx/nMPhUG0G4vdGICyL+8mjMx1CUyJvvvAQDSGgBR7qNwfiQhGCVy4qFF0zaQDdkgC4OVmIL3OKMYrm4ViDcIAGNjPeKT3IPTtssi5q4eVkiQK08wMnHVPiG0Rt5OYOfpL2bAXJyRGtm1o0wJstmvpJFKMP7v0p0u/8UqMdhekjzhJGkZLudaOBkZtrPh+karI3t53FDRQuq5ijS/yquPbGxHurLEJUkxgQZiJg31ORz33WBJTtoLgnwywpHuD3gnoulEIMDQfvzDEe24tG4gfcOW591vTWLY7fSIVCD8YC5jn0IyW+jVwnPev/qaBTgXUb5glCWlJlSVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742541749; c=relaxed/relaxed;
	bh=oH4fWJe4knrUjZ68V8qlg1ih1fEO3X2u3WmWQBu1Lfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YKJ0HJE764S4mYzG0vvSE/LeubyGd+B2u8/vSkTkYonAh/QWuwwkH40Jw41tu88SRwDh2ShLv0h/K7CZVjMekFtRhOTaqGp6r/V5RW0WqET8ePkOl3qgEn1JjxmmuzeSdQsMs1p1VrraDahMxZMg1oN7b2c3vCtBU2nbgoFfEyuswswU9L1JgSmtlxu4XQpnI2HAdINaW+pg/bAmqbnodrmlsP4ph6RW0TScBDZ+HL5pe1vYlNUC8P2GqxNh/5sjQM45/ApYEmYCHif1gIxxZxkN6BoozcqKMCpBNmD8W8WfqptxKltxRhT0zzssvTsBBRIpxXMQ2k6JEf2/7JtpMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KyGCQtjA; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KyGCQtjA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJv6D72rvz2yrS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 18:22:28 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KNcPM0027479
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=oH4fWJe4knrUjZ68V
	8qlg1ih1fEO3X2u3WmWQBu1Lfk=; b=KyGCQtjA5CcM9g7A1K8Zpc26xphr3QUAi
	xNm4AayqieswH1on57dMuK1SNb5HdPpBfNSSjD+8Qasi/OzhbfhZNvotillVKprZ
	r/JwU/azMY6UUlVLdvd/gaUSIDSDIJW3oujBhPGcPfTwWk0OA64cU+rxotP92dlD
	VmVJmR3g+1CSwU5juMk52XOM5rOmZBcK8Gv5lHMnGvwQDfixsSsAyXHGYm4iXz21
	bLb94Njg8aW22tgxCl4+cvxnhTq1SXduqNCunzlaMaRUpoebEgvMyalxNPaJvkp7
	YdqdFBHloUKUjHRVapnhs1LxpP4UGi/QFOlpEY9rkOOTRTtu+0LfQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45gt6q25yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:26 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52L46CUS023226
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:26 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45dp3m418m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:26 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52L7MKAo52494652
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Mar 2025 07:22:21 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8C162004D;
	Fri, 21 Mar 2025 07:22:20 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FE3A20040;
	Fri, 21 Mar 2025 07:22:15 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.255.71])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Mar 2025 07:22:15 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V2 3/9] powerpc/pseries/htmdump: Add htm start support to htmdump module
Date: Fri, 21 Mar 2025 12:51:46 +0530
Message-Id: <20250321072152.7414-4-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250321072152.7414-1-atrajeev@linux.ibm.com>
References: <20250321072152.7414-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: p267LFGfrTXOndJoyNr9g8Cq0j8KStV1
X-Proofpoint-ORIG-GUID: p267LFGfrTXOndJoyNr9g8Cq0j8KStV1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_02,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503210049
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

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
index c623836f7054..9210645ec3d3 100644
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


