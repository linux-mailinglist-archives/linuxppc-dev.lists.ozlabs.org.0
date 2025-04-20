Return-Path: <linuxppc-dev+bounces-7819-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF50A948BF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 20:10:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zgc3W712cz3c2P;
	Mon, 21 Apr 2025 04:09:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745172599;
	cv=none; b=UEVEIoQ0UU5D5u2PiEG+LqfZ5i+34B+z0NFwMxnlaXChKOHt7gS3RoLbp7Jf6V8/1MeIzTttFTvb6np9lHj8k9CjLsFM6uTPXb2tWxjTfwVgInIZSP3/Ro8tJoC1IK5pfauHny/EFN25PCFkRX/zr5+A5L3t9BMXwxO9xOZUfY+m/es5EPelI3duo+COejNJoXZC+hzERbNjRHXjzWsO54qpNmt4MHl0qbr4h5ZCb9YqL5Ve1ijI2s5ciWAeInUEjoarpFOS+svAB+a+KjFJ7EZp8XCfbdC4oZ1ns/EIwGTxkeLD5t3i534hAUySFut6C+eRQZ5ddLc2lwQz+6IN/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745172599; c=relaxed/relaxed;
	bh=Z8DOAHDqL7yUVvOdRSk87/brdZI0ykVx7ZFs5medij0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LexfrJWwSI5mFp4ycAgdHYYYhD2j8O/9lJ8qVvrMvtqylEast9esDbl1RpR6HYSn+doLCeK8Uvf5nEx6YVXzKPQz18wTqGaDuIUWqrJAI4yCryVqJcY4pHuSPVX27yCPu20OmUTTYqhTpoF/DhHAoTrK/owwh/EqOfUwVIGIVvgwBlO9zhpTwga3mvRBvqLhP+HIOH/LBFv/7GOxwKqG48fKO9fSjLzkRx0OsGU2vqd0LV1kIPBepv61Qips521y3T76wXiQDIhOD5d3R7B85b5wcjiWUVuiwcGgcQHyLuGlKVfEpecGyq6Mhn4+wfdcIjhbF9rQ/1tVIeMEtzVw2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iw5OgqY6; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iw5OgqY6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zgc3W16chz2ySp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 04:09:58 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KG06TW005273
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Z8DOAHDqL7yUVvOdR
	Sk87/brdZI0ykVx7ZFs5medij0=; b=iw5OgqY6hMmVqBfqf5hNqHFXr4ALGMcsN
	OjR14xYj6irAoJaDp4qGjqlSMDKILUQDNKamb7LSbAzCXgC0ij7Tdtiw2pMM/kZn
	DdrL265fP5EvYsTS2qPSh4c3+ZQU2WW10Ynf2YE+bWjHEAMcf8vFPSpuHYPqssrW
	RWYA1I6bp8tgEGuHFhNdMtNy15Pv0l4yXXlpI66Fv5UhBHgwvI9N3fbQA6cS4AxG
	M1/vnkj6HbZSIR9S46hsrY9CqvsGmjrSNtsOQFGH9ZWtgw3s++pKyXCf2gcbtfk5
	lJOnN9rSzB8NdknmJgTETOEZ1R9EgyHOB7uAMZiHZYUwXlLc5sbGg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464kyv2nc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:57 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53KGp3xk002965
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:56 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464q5nav5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:56 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53KI9m7v56885506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Apr 2025 18:09:48 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FA0420040;
	Sun, 20 Apr 2025 18:09:48 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F295420043;
	Sun, 20 Apr 2025 18:09:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.246.217])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 20 Apr 2025 18:09:42 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V3 8/9] powerpc/pseries/htmdump: Add htm capabilities support to htmdump module
Date: Sun, 20 Apr 2025 23:38:43 +0530
Message-Id: <20250420180844.53128-9-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: 9uKcLot4b6Ph0JAt6MCm8Ep4sCxE6OXS
X-Proofpoint-ORIG-GUID: 9uKcLot4b6Ph0JAt6MCm8Ep4sCxE6OXS
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=68053875 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=_FxiH9CCeDqqzt_ZjvwA:9
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

Support dumping HTM capabilities information from Hardware
Trace Macro (HTM) function via debugfs interface. Under
debugfs folder "/sys/kernel/debug/powerpc/htmdump", add
file "htmcaps".

The interface allows only read of this file which will present the
content of HTM buffer from the hcall.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/htmdump.c | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
index dc5cdcd8c3c3..af15d50c924b 100644
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
@@ -304,12 +305,43 @@ static ssize_t htminfo_read(struct file *filp, char __user *ubuf,
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
+	if (ret <= 0) {
+		pr_debug("H_HTM hcall failed for op: H_HTM_OP_CAPABILITIES, returning %ld\n", ret);
+		return ret;
+	}
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
@@ -417,8 +449,16 @@ static int htmdump_init_debugfs(void)
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
2.43.0


