Return-Path: <linuxppc-dev+bounces-7815-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 114C5A948BB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 20:09:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zgc302vrTz2ySf;
	Mon, 21 Apr 2025 04:09:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745172572;
	cv=none; b=fzzxXvhaBe1m73CCWweES0Yn+RtPWf1RIapPlbuBUm9zrb5MN5na/YRj5W3zGuMjOcOSiF59gd5fY+AwKdSqCmgTwh/oIT18CoRGjAWwSEw168CXHpyZjt3BNy8MHtP4UMCQNTap0A9VhDdf4HWJiXiLIwyWDPkIMn/koaiLUkU/rfaeGGs6jqxBQmCs3/hJUadiEaQc6uclxyhJqIzecuujAL0cUd6dEftm29JshHcbdzTEy+jfkVA/nXMCO2zcGoIRhfxasCP5n7RkFHTpwXpmJr4IWdG/duMUD7o+V0f+D5LGalC+gSVzhnpA3VUDoTeRuVthQuTLg2seXucygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745172572; c=relaxed/relaxed;
	bh=aOAUcL3R6KU8811erJ0QyijGSoeoyivb9OtBIRTgOxY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MngcYkbOLsDG7TN7dHSmGvjAn74cF+MHHXwafXxyw0Uu1+JaZsDCPoUK3bdbb2UgeU7fubJhwVxaKa6PgwaYPNkAX7cy5K6QTV+Vu9dc+kJPMxeDm4s0ueb2d+vDp0dnKB7TovOhMde4LrRUN8Kn5EYvfPVPy7h7Ca/pPtqyyD3e+xBr6gWEFx3SZ5eGzY9e4uhq2iC/z5wngw/h//tjKt2GT64Uk/KUhGs14tHJsY3jHhmm1lP17zhhZTzEAejdSoI9R1A6TXC2z0onaaVwDn44GlsbjDt5M6oS1vZ4LEcUG43Gc2kmFbTnqZ3Q7ePnjsAg5MI+5vdDhrYuJOzzcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f4brkbPV; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f4brkbPV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zgc2z49m1z2yST
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 04:09:31 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KFUTOF025689
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=aOAUcL3R6KU8811er
	J0QyijGSoeoyivb9OtBIRTgOxY=; b=f4brkbPVU187prEkJ1iDktHoC9nQJTfuE
	owosscxLKtYNTVgd1JxKldhihPfcQi+qr/qdvDuJDhi/jBl++RNYQD6cpkKvWE30
	JFzZtRhBuCY4P7a+wGHUpyFuuOQ03MumwrmZlftN6pDA7SXBc/SMgLVETyQoUsFz
	DREH2KQAjzHvGDC5bJA9ELp9UMdJSoMWtX2tLJ9bzsX8kBPD9EzOGKaoJsQET4bQ
	u+jcIF+tw0VJMn30e4jgdXn4YF1wVVadA7cjVbq8aOCj5/vKGTPJXVVX8ldxoVA6
	Ubbg+DlQeaO3uNLSslp7qBlTNKQe5/einbA/nNDmjbbqb73mY8RdA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464ycrgy6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:29 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53KHNW6i015374
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:28 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464qnkarjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:28 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53KI9Ngj51314970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Apr 2025 18:09:23 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C39B20043;
	Sun, 20 Apr 2025 18:09:23 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C85CC20040;
	Sun, 20 Apr 2025 18:09:17 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.246.217])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 20 Apr 2025 18:09:17 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V3 4/9] powerpc/pseries/htmdump: Add htm status support to htmdump module
Date: Sun, 20 Apr 2025 23:38:39 +0530
Message-Id: <20250420180844.53128-5-atrajeev@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Jp7xrN4C c=1 sm=1 tr=0 ts=68053859 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=f0wJ99qovdAumIn85fAA:9
X-Proofpoint-GUID: TiIIkBFGNv2pO7D2__rMfTJbK5l3RCvC
X-Proofpoint-ORIG-GUID: TiIIkBFGNv2pO7D2__rMfTJbK5l3RCvC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_08,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504200148
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Support dumping status of Hardware Trace Macro (HTM) function
via debugfs interface. Under debugfs folder
"/sys/kernel/debug/powerpc/htmdump", add file "htmstatus".
The interface allows only read of this file which will present the
content of HTM status buffer from the hcall. The 16th offset of HTM
status buffer has value for the number of HTM entries in the status
buffer. Each nest htm status entry is 0x6 bytes, where as core HTM
status entry is 0x8 bytes. Calculate the number of bytes to read
based on this detail.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/htmdump.c | 57 ++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
index 4dd077cc850b..be28391e6d1f 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -12,6 +12,7 @@
 #include <asm/plpar_wrappers.h>
 
 static void *htm_buf;
+static void *htm_status_buf;
 static u32 nodeindex;
 static u32 nodalchipindex;
 static u32 coreindexonchip;
@@ -205,6 +206,53 @@ static int htmstart_get(void *data, u64 *val)
 	return 0;
 }
 
+static ssize_t htmstatus_read(struct file *filp, char __user *ubuf,
+			     size_t count, loff_t *ppos)
+{
+	void *htm_status_buf = filp->private_data;
+	long rc, ret;
+	u64 *num_entries;
+	u64 to_copy;
+	int htmstatus_flag;
+
+	/*
+	 * Invoke H_HTM call with:
+	 * - operation as htm status (H_HTM_OP_STATUS)
+	 * - last three values as addr, size and offset
+	 */
+	rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+				   htmtype, H_HTM_OP_STATUS, virt_to_phys(htm_status_buf),
+				   PAGE_SIZE, 0);
+
+	ret = htm_return_check(rc);
+	if (ret <= 0) {
+		pr_debug("H_HTM hcall failed for op: H_HTM_OP_STATUS, returning %ld\n", ret);
+		return ret;
+	}
+
+	/*
+	 * HTM status buffer, start of buffer + 0x10 gives the
+	 * number of HTM entries in the buffer. Each nest htm status
+	 * entry is 0x6 bytes where each core htm status entry is
+	 * 0x8 bytes.
+	 * So total count to copy is:
+	 * 32 bytes (for first 7 fields) + (number of HTM entries * entry size)
+	 */
+	num_entries = htm_status_buf + 0x10;
+	if (htmtype == 0x2)
+		htmstatus_flag = 0x8;
+	else
+		htmstatus_flag = 0x6;
+	to_copy = 32 + (be64_to_cpu(*num_entries) * htmstatus_flag);
+	return simple_read_from_buffer(ubuf, count, ppos, htm_status_buf, to_copy);
+}
+
+static const struct file_operations htmstatus_fops = {
+	.llseek = NULL,
+	.read	= htmstatus_read,
+	.open	= simple_open,
+};
+
 DEFINE_SIMPLE_ATTRIBUTE(htmconfigure_fops, htmconfigure_get, htmconfigure_set, "%llu\n");
 DEFINE_SIMPLE_ATTRIBUTE(htmstart_fops, htmstart_get, htmstart_set, "%llu\n");
 
@@ -235,6 +283,15 @@ static int htmdump_init_debugfs(void)
 	debugfs_create_file("htmconfigure", 0600, htmdump_debugfs_dir, NULL, &htmconfigure_fops);
 	debugfs_create_file("htmstart", 0600, htmdump_debugfs_dir, NULL, &htmstart_fops);
 
+	/* Debugfs interface file to present status of HTM */
+	htm_status_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!htm_status_buf) {
+		pr_err("Failed to allocate htmstatus buf\n");
+		return -ENOMEM;
+	}
+
+	debugfs_create_file("htmstatus", 0400, htmdump_debugfs_dir, htm_status_buf, &htmstatus_fops);
+
 	return 0;
 }
 
-- 
2.43.0


