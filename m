Return-Path: <linuxppc-dev+bounces-7816-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CECAEA948BC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 20:09:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zgc365Crvz3c2v;
	Mon, 21 Apr 2025 04:09:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745172578;
	cv=none; b=AezThqIn17ZmXZ9Zk7ZmKqSH/W3J8uhxFOOzZrG5xScyXeuetiO1ISHPiJkxIbr02/nCaYCx7rc5TF3phNNx7QQJ13EAtXt9e+864ikucYK7bt9OfbLErPnDLOwgxmexkubuOLu5LR40y8QdYD2XUrh6KIs+rZQsUDRkhq396Z99fL9F8WmWL3pBDRaVzbF5PW2dG2F8US8gGwobwpaxIRXjivKlGbV4uiHKI8chrohwvVnHlzsu5P24w09oVTub+d+XMoz6wLzAldB4KQDxGY7VAYRN/FsYmHgBbqkxCtyniu6VK/Ni8+2hI/BWwUJs3zQ4dpcpyZQvLFoKhNOFfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745172578; c=relaxed/relaxed;
	bh=FBPteZDjez1pznjNrCyyy24tmWkIKo7NTv7Eka7PesM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QKB2/0q94VDKOXUMM8EJyS1ozPUCkBHPnDR8aev1AJ2a4KJOjzhHpXm8MFbNxRMBnuKjsV4B3GijaqnkYlwsYnytB7Ts728ouGPQrEmT1AU8DQKBa1Orghw/FhOOg2rvk3P3r/kNhJegq7H4G89wf5NmP08tdpnfG6VB+t83GfZ/g8wftJaFHbRgB8/oJx8kG8TEYOCrn9o5TVsFJYc9dsICwOqRmUXU4UmmuRgBFzjHQdKCG4Hm4kG9PSIrLX1NlETZ23qnMIyBcjTGj9K+AJNeanvlSul3nsBBP23GnZmixjShdwK304faVv94u+LElwtc268VM5ryf6nIlRtc9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JzuZP8t9; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JzuZP8t9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zgc356V4Vz3c2P
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 04:09:37 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KETUSp007912
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=FBPteZDjez1pznjNr
	Cyyy24tmWkIKo7NTv7Eka7PesM=; b=JzuZP8t9MrAN1MF2nNrcT42UN1dizav4k
	VRHKWWthC0IyHTj+Q14FJ42KVr3AgMnurQj+4Jakz/JuE+P5a1/AHIHhHLZB55lD
	TBTblgUMJCV/oGKI0xmiyZbS/vl+9MqOKhuOKfrmB7q7sIuStU61a24YJuP3u+sP
	XbZipGoGbfG8xXKJZ0N/KgcXTzzVVtdzQEv77vxXWA5Z6mKWYE0WExgyAKvC1LbI
	bQOZEbIshctu2fnaFLukLyEv+NVYPl+sI9wtNtMnnffIK3y+JDvWlYE/dsPHLTOb
	NAsiJuy+fW2qEmimtAunrmEUw/clH+e7NTTN5bCEBzgFOgErVvQjw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464kdkausv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:36 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53KG5BWn032541
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:34 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464phyb176-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:34 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53KI9TnO39584088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Apr 2025 18:09:29 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2E6E20043;
	Sun, 20 Apr 2025 18:09:29 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D94420040;
	Sun, 20 Apr 2025 18:09:24 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.246.217])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 20 Apr 2025 18:09:23 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V3 5/9] powerpc/pseries/htmdump: Add htm info support to htmdump module
Date: Sun, 20 Apr 2025 23:38:40 +0530
Message-Id: <20250420180844.53128-6-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: SZ9k7eK9fYbt8dTeDDbTTzAoRXreQrIO
X-Proofpoint-ORIG-GUID: SZ9k7eK9fYbt8dTeDDbTTzAoRXreQrIO
X-Authority-Analysis: v=2.4 cv=M9lNKzws c=1 sm=1 tr=0 ts=68053860 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=f0wJ99qovdAumIn85fAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_08,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504200148
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Support dumping system processor configuration from Hardware
Trace Macro (HTM) function via debugfs interface. Under
debugfs folder "/sys/kernel/debug/powerpc/htmdump", add
file "htminfo".

The interface allows only read of this file which will present the
content of HTM buffer from the hcall. The 16th offset of HTM
buffer has value for the number of entries for array of processors.
Use this information to copy data to the debugfs file

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/htmdump.c | 51 ++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
index be28391e6d1f..3ba1114d3d19 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -13,6 +13,7 @@
 
 static void *htm_buf;
 static void *htm_status_buf;
+static void *htm_info_buf;
 static u32 nodeindex;
 static u32 nodalchipindex;
 static u32 coreindexonchip;
@@ -253,6 +254,48 @@ static const struct file_operations htmstatus_fops = {
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
+	if (ret <= 0) {
+		pr_debug("H_HTM hcall failed for op: H_HTM_OP_DUMP_SYSPROC_CONF, returning %ld\n", ret);
+		return ret;
+	}
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
 
@@ -290,7 +333,15 @@ static int htmdump_init_debugfs(void)
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
2.43.0


