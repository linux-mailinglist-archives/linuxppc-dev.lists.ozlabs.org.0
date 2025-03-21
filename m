Return-Path: <linuxppc-dev+bounces-7250-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B75E2A6B4DC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 08:22:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJv674xfFz30NF;
	Fri, 21 Mar 2025 18:22:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742541743;
	cv=none; b=A2MswJpYQA9wjB20omI8OXJXvwmKyJ3KLVGI0RR7Hj5B2KLSRi7Gz/5bA9gmmx41GMUoHwUBQYnuzWxRUT37GtYrduVYQXaGGiXmQZqoe/9j1+Ss87EnIYaExGOYoxEqF+FgolQD0SbtzsmCa0aPMUg8ckKnSJGb/fkVmfKFGOrgB7kwoHD40nGunvLKOyWV8lv6Bk6M+1tvoeqUZCcETsq0ixxfEsCb0Me7CXKLZ80JeyJ7WRZYURusfYHJbWKaTc97WIAs8hhl/Mt6tZ0uZ/jOgK/KQIwnx0E9QXuJgvmoEIrA6ZVtqE/CZkE8w6fpfYO4vBN5WbWiR7iW/Ht6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742541743; c=relaxed/relaxed;
	bh=oDL8yng6bSGY0RTutT4Wq3/E2po7igGLrJNikZ6MQUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TrQ3KMv1xlD2Isttjhj8F6HvTXozR/y7b12bnkAqf/Rc0p1ME9ZCfC9/WFpwROBs9/aOpHewEkk///LUNjPEKZtue8foh/45ShiNCB+AIE2z4qPwCvEGTDp3Sufpw5yUlXyAAsfUp2NyN2mzZ8BaORWShdsvuE/+MVZ3HY+6bhm98q1OULkQ3BcrXnuxiJxVga4aMvmdrQewXWYgnsuDoXCBbtSeAyvrTJuKhsb6B/AtWP7tw+jI+LTfxmOeVQi61zaiAjsi5W7QWMeNnjAy4EPLSiMO3RGINgaOZ8oyoFciY7TCViFAoTpJUuM7Hz2du4I2MlNxPBZ5f3XZ+yp4tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JmfrBkl+; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JmfrBkl+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJv666Q5Vz2yrS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 18:22:22 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KKZrGd027409
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=oDL8yng6bSGY0RTut
	T4Wq3/E2po7igGLrJNikZ6MQUI=; b=JmfrBkl+kvjuNGSU4RsWunpQTnsgCv1Eo
	EQ49B9wrQrHuWN9nwHvbSs1JfWysSdFhPDYmcyTMPhvauKhH1Sxw3oRj5byUfTJK
	MbnBZ1yKIGOo3tJHhvWARhlpJKGMz6DDqBlKQ7MUm8EZdT6zXGIBSTojS3mTfp0S
	K+EGlAdL4hqxDYkoaYLDIOCdapnFko/tIy6pXS2yJFWZGJoCKdY24TqetRUSxE9P
	lgIOqCz3sJWjLtaSlArCWcQdU2fS1DtdLcDvJdUf7v3gnA2zMjgusP2+ToAUaE5c
	3J8t4ua9NJSIVZJi/LRJaynZQDT5bTkNhKJ3wdn+JPn8H0ms7nniQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45gt6q25yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:20 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52L46CUR023226
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:20 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45dp3m4186-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:19 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52L7MFfS30474986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Mar 2025 07:22:15 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E327B20043;
	Fri, 21 Mar 2025 07:22:14 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A08E820040;
	Fri, 21 Mar 2025 07:22:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.255.71])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Mar 2025 07:22:09 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V2 2/9] powerpc/pseries/htmdump: Add htm configure support to htmdump module
Date: Fri, 21 Mar 2025 12:51:45 +0530
Message-Id: <20250321072152.7414-3-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: MSLlAgvpk7atyBJAQT1wzOkYYM16yLjX
X-Proofpoint-ORIG-GUID: MSLlAgvpk7atyBJAQT1wzOkYYM16yLjX
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

Support configuring of Hardware Trace Macro (HTM) function
via debugfs interface. Under debugfs folder
"/sys/kernel/debug/powerpc/htmdump", add file "htmconfigure".
The interface allows configuring of htm via this file
by writing value "1". Allow deconfiguring of htm via this file
by writing value "0".  Any other value returns -EINVAL.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/htmdump.c | 52 ++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
index f13a5570446c..c623836f7054 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -16,6 +16,7 @@ static u32 nodeindex;
 static u32 nodalchipindex;
 static u32 coreindexonchip;
 static u32 htmtype;
+static u32 htmconfigure;
 static struct dentry *htmdump_debugfs_dir;
 
 /*
@@ -106,6 +107,52 @@ static const struct file_operations htmdump_fops = {
 	.open	= simple_open,
 };
 
+static int  htmconfigure_set(void *data, u64 val)
+{
+	long rc, ret;
+
+	/*
+	 * value as 1 : configure HTM.
+	 * value as 0 : deconfigure HTM. Return -EINVAL for
+	 * other values.
+	 */
+	if (val == 1) {
+		/*
+		 * Invoke H_HTM call with:
+		 * - operation as htm configure (H_HTM_OP_CONFIGURE)
+		 * - last three values are unused, hence set to zero
+		 */
+		rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+			   htmtype, H_HTM_OP_CONFIGURE, 0, 0, 0);
+	} else if (val == 0) {
+		/*
+		 * Invoke H_HTM call with:
+		 * - operation as htm deconfigure (H_HTM_OP_DECONFIGURE)
+		 * - last three values are unused, hence set to zero
+		 */
+		rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+				htmtype, H_HTM_OP_DECONFIGURE, 0, 0, 0);
+	} else
+		return -EINVAL;
+
+	ret = htm_return_check(rc);
+	if (ret <= 0)
+		return ret;
+
+	/* Set htmconfigure if operation succeeds */
+	htmconfigure = val;
+
+	return 0;
+}
+
+static int htmconfigure_get(void *data, u64 *val)
+{
+	*val = htmconfigure;
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(htmconfigure_fops, htmconfigure_get, htmconfigure_set, "%llu\n");
+
 static int htmdump_init_debugfs(void)
 {
 	htm_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
@@ -127,6 +174,11 @@ static int htmdump_init_debugfs(void)
 			htmdump_debugfs_dir, &htmtype);
 	debugfs_create_file("trace", 0400, htmdump_debugfs_dir, htm_buf, &htmdump_fops);
 
+	/*
+	 * Debugfs interface files to control HTM operations:
+	 */
+	debugfs_create_file("htmconfigure", 0600, htmdump_debugfs_dir, NULL, &htmconfigure_fops);
+
 	return 0;
 }
 
-- 
2.43.5


