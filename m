Return-Path: <linuxppc-dev+bounces-7252-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA334A6B4DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 08:22:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJv6M34Sgz30MZ;
	Fri, 21 Mar 2025 18:22:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742541755;
	cv=none; b=YU8LRAgxcnHhmshI9u8jS/Cyf6C/fAhPZAYsxppdLylFdnMrtmC/RGlfSAisr6bqKBi4lrKoXOLZb1Tqxkg+RvQHGjodxBfKubxFkhQTkUp7UOsw0xDZBAbQB9BGezPYFQZTI5F8dsdz0NUukavkk49dWu6jAl5prrja9PFjDKot0K680eJU6Ul+tr7yoi6cf2uSjBXNn5KWz+AjOPFHt9iLbhV2KBauB9U2MQbdX/zPo6M1OfttzJjrkY0pO9TNA1u+FPpEMcFpbFt9QwUDhbriL/A879HU8C6tsJWwV9AF6HgaHmij+lNmbKBVRWKgsPdmvYmzy535uqPEwd11uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742541755; c=relaxed/relaxed;
	bh=dKc32esvgwQJzwDj5XbfK7gFfD6cJvOJfcot9LWByL0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LyU+S6hvl+EQe+W0g5+qYZmd2rcrVFWqDBvxon0CgvImZQRCtTH+bew9r1B9KRzAY+xnguUYPHkkc9KCvdUN8jy6nU5eHGWkgUqt/1ekRifR2Knws8VpNQfgrakIGlIn8uMlYjFjgQoGDbcRvq9R0bNxcuLaBW/v/XJfS24JwLw2aEAdjs2JOavvqOaUk++EgqJqgPXSRploLKCDLnrigR5bkAq9/xnqUWxIL/eIWfrRTHUT8QKWWx31DaMolnP8DitYVyRJEcQ8aDxZEJR0h95+W8DLT/LKyYVsL/SZ77c0PDKkPAggIeCMSQ5yjUaOWhvXBmhPmfUdfjJrsrdTlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mqwzGuSG; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mqwzGuSG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJv6L4Znsz2yrS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 18:22:34 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KKaFwh027682
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dKc32e
	svgwQJzwDj5XbfK7gFfD6cJvOJfcot9LWByL0=; b=mqwzGuSGRk1xaK7HNt3RcC
	VSUhApXV2SmZs/Mh5JojcoVHifVQyhXpWKSieFhKrxsUq4y48J9fEURXWWa6ibq5
	cxgHos2yksChc3HFkcgipk/i7Dj/zqigVmprDYAEKV7BtH52TujdMqWrhRrGRmcz
	E0l5afTMIHbTC1tuFjJbhh+8E4hUtH7h7KTsvtfhrcgAsmSmlAtbnwO5lrMbFpny
	wigUbEEzTnwfkK3ZNK2JeI0RPWZpwMLPZvaphYNGau05eLmDivr6RX79//kIwrAL
	ZL2NkL1zxyqwKGP41CTmhYBY0abEjqmOD31e95Jolc6123i6P24M9fMVOozlK4LA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45gt6q2601-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:32 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52L6RJ7E025857
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:31 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45dpk2uuut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:31 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52L7MRFU27263396
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Mar 2025 07:22:27 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 122E22004B;
	Fri, 21 Mar 2025 07:22:27 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86B4220040;
	Fri, 21 Mar 2025 07:22:21 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.255.71])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Mar 2025 07:22:21 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V2 4/9] powerpc/pseries/htmdump: Add htm status support to htmdump module
Date: Fri, 21 Mar 2025 12:51:47 +0530
Message-Id: <20250321072152.7414-5-atrajeev@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FofWebqpFvwRRBRuSlIJKajOaplrOhjg
X-Proofpoint-ORIG-GUID: FofWebqpFvwRRBRuSlIJKajOaplrOhjg
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

Support dumping status of Hardware Trace Macro (HTM) function
via debugfs interface. Under debugfs folder
"/sys/kernel/debug/powerpc/htmdump", add file "htmstatus”.
The interface allows only read of this file which will present the
content of HTM status buffer from the hcall. The 16th offset of HTM
status buffer has value for the number of HTM entries in the status
buffer. Each nest htm status entry is 0x6 bytes, where as core HTM
status entry is 0x8 bytes. Calculate the number of bytes to read
based on this detail.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/htmdump.c | 55 ++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
index 9210645ec3d3..ef530c092ae4 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -12,6 +12,7 @@
 #include <asm/plpar_wrappers.h>
 
 static void *htm_buf;
+static void *htm_status_buf;
 static u32 nodeindex;
 static u32 nodalchipindex;
 static u32 coreindexonchip;
@@ -197,6 +198,51 @@ static int htmstart_get(void *data, u64 *val)
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
+	if (ret <= 0)
+		return ret;
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
 
@@ -227,6 +273,15 @@ static int htmdump_init_debugfs(void)
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
2.43.5


