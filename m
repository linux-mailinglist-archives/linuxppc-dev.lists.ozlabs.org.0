Return-Path: <linuxppc-dev+bounces-7817-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A90F0A948BD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 20:09:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zgc3D4Xbzz3c2V;
	Mon, 21 Apr 2025 04:09:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745172584;
	cv=none; b=YkuJ+PmXiiVkOgkbxIls3NXihXjwjsUTeWmJpqVp7rcKq3CC10bTkINFSgfc65qjVeakuU5Zv+MUv7rpS8Ytpxe0eVNBDmZvePrHPPXpzn1s7y4MQ5hvlZTnUVVHsX7KgAUJCGo4ATFtil+9Feu5Nm7czkLCfjnqyOjTWO/61WdMu4l29OvSzsvro+xlxZrXf+zLKjkZCt5j94unl4LRZUqE8Fcb3PxnXMLj0niTk6yphxis5R7K5gOe0CSGe90P8FIYHj7uQU0pyP9LYsFFARD/B51+j/5w5Y5laywUJ+FgbiKH1Eo8LMR0327nx2w3KRG3rXyJ8yuDlwJnJiYAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745172584; c=relaxed/relaxed;
	bh=0nNMg8ZyZO/ZIXO5uv85kSx39O1yfefG6I0NpuziP2w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QvLzZ+p3Xret9FU7v4XMEZ3+QQlE9QPpzBx+z2TMNV03cZRjpaaTGiH18+GwOfCxO/tDUsOHqtewOgB9m6O7VmK4RNE8bmAJXa8VFKdzuBhYPU5CvdAr46ceawx499yaF4O6e8Fb9nnVQ1sEWJkigD2ulk+mU+eIwwPyzyLrukEY6C6uRwJ1u2XTEaHsZptY3KyojzTZl3pp2bRCbx5wnXsO8LA4OH2gmltfQnhBpsqBI+wPy007dm3JRxuGHeh7/cItdfPlcm6KSI7gnXWcpPTkCueLhA7jTHT0X7b4tc6ZOhiwjB5krTJ1uWMJnUU8KpRlKjyv4iHaB5S8G1pMQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QJNk2zyo; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QJNk2zyo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zgc3C68Whz3c2P
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 04:09:43 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53K8qkLE005080
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=0nNMg8ZyZO/ZIXO5u
	v85kSx39O1yfefG6I0NpuziP2w=; b=QJNk2zyoYp6xNQHee8IiAJNfy0R9AgHEa
	r/j5Yq1Zjvi2AF7QnYM+2HTQL8SuevY4h5WxXSepyakNxh2OvcWa5janJv3omEwk
	5DJTAmRrOcpY4GwPD1u9pPiWE5QpAnJ/gGz6KjBwkxJwoEHS/w1ZeUSLbBF3sY4L
	yYBuXSYRkyKCF6UgVJnxyEU5UY7VlbA/ZcUIniWYZ5WwMV4w4bl/xGQbN8N1cgHd
	Y/U9zzbruIatCeEKEKQFqqUNwGaUrVBGXtqYix1Wi/BEoh6+Ys9VKwQjDJVQhliY
	4Q9AvoGQxMQ3ZywB5mIXUcLLITZNJuGBzA5bn6ZsrAKJNAAqx8zAw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464kyv2nbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:41 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53KFTAHC012355
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:40 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 464p5su2qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:40 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53KI9aWM39584108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Apr 2025 18:09:36 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F374D20043;
	Sun, 20 Apr 2025 18:09:35 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6402F20040;
	Sun, 20 Apr 2025 18:09:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.246.217])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 20 Apr 2025 18:09:29 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V3 6/9] powerpc/pseries/htmdump: Add htm setup support to htmdump module
Date: Sun, 20 Apr 2025 23:38:41 +0530
Message-Id: <20250420180844.53128-7-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250420180844.53128-1-atrajeev@linux.ibm.com>
References: <20250420180844.53128-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: eGk1fiJJhWTDzc6plj86x5RgrZ5yB6F7
X-Proofpoint-ORIG-GUID: eGk1fiJJhWTDzc6plj86x5RgrZ5yB6F7
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=68053865 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=hG8S08i8OhwJmhfzKLIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_08,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504200148
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add htm setup support to htmdump module. To use the
HTM (Hardware Trace Macro), HTM buffer has to be allocated.
Support setup of HTM buffers via debugfs interface. Under
debugfs folder, "/sys/kernel/debug/powerpc/htmdump", add file
"htmsetup". The interface allows setup of HTM buffer by writing
size of HTM buffer in power of 2 to the "htmsetup" file

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/htmdump.c | 38 ++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
index 3ba1114d3d19..39657e8655cb 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -20,6 +20,8 @@ static u32 coreindexonchip;
 static u32 htmtype;
 static u32 htmconfigure;
 static u32 htmstart;
+static u32 htmsetup;
+
 static struct dentry *htmdump_debugfs_dir;
 #define	HTM_ENABLE	1
 #define	HTM_DISABLE	0
@@ -296,8 +298,43 @@ static const struct file_operations htminfo_fops = {
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
+	if (ret <= 0) {
+		pr_debug("H_HTM hcall failed for op: H_HTM_OP_SETUP, returning %ld\n", ret);
+		return ret;
+	}
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
@@ -325,6 +362,7 @@ static int htmdump_init_debugfs(void)
 	 */
 	debugfs_create_file("htmconfigure", 0600, htmdump_debugfs_dir, NULL, &htmconfigure_fops);
 	debugfs_create_file("htmstart", 0600, htmdump_debugfs_dir, NULL, &htmstart_fops);
+	debugfs_create_file("htmsetup", 0600, htmdump_debugfs_dir, NULL, &htmsetup_fops);
 
 	/* Debugfs interface file to present status of HTM */
 	htm_status_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
-- 
2.43.0


