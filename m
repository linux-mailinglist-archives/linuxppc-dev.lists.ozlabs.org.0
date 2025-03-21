Return-Path: <linuxppc-dev+bounces-7256-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8019A6B4E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 08:23:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJv6s1gDKz30Kg;
	Fri, 21 Mar 2025 18:23:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742541781;
	cv=none; b=NfUXhU55j4XAED19IkkY16suhzYs9Hi/Ej57/mneBH53pFNajiFC/h2nmA2SdZ+MXVcuKzzWeIOIJp6rs5d9BfAcCswv0LDvi+W7TTcdsl6BxWdsG2kb+OgyRhIVTQIMwovJN+to1+c8lksIgdm4FfRmIWrzr0j/B+4TaN2O0Aqwz0aqjU0XVXMMOugW0OgJNfJdzzwNS/08OPwOMe05UL8xiotIxhq8J5pz7Znl+UxdPW7yxe1pitBL2d2SVUtCpZvrHHMlmxLY8Hu842wTVs9Ber0puacdWjmDr5O3OfJU3z34qkRbrUWlz3FeMhxWJ2N88T6j7Bvu/vngSpeCTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742541781; c=relaxed/relaxed;
	bh=3ReOXnSpr10nlEkn/CUf2WJpvYj5ekFfHWb5HjSi73k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k/gT9/SkUxxCOkbLG6NRoG3ExFs6Q1XXSjPlx+8KcSw6hV3bOu6lEEkTCoC6yRlt0LFwNU6x4eYMO6FCzNGzNPveVSBZmxIHEx31YJvCqiev22U7B+qr9D7BOlcJFk/Q1Od/kWME/vWwK/2UMfFKijlHEAXXyMOqkPee7f5HYQK6lWQXbp8wVWsI0hPckXzM4BWQsewqZP/m0vN4r7v/NXbp+O8Suu6a2oFWAEeAxW1dgBA9yHT10Qg9f7o6dZvh+gffZ+JBcJTJczOkEDAmM2i6cKHdqe9IyrVUVPFNtGFbvcHXRny6mTmHrUqlmu2TAt1j7p9HJGSWx9MZgqaLhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fzpVZFAt; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fzpVZFAt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJv6r2w49z2yrS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 18:23:00 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KKdCcl016344
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3ReOXn
	Spr10nlEkn/CUf2WJpvYj5ekFfHWb5HjSi73k=; b=fzpVZFAtV5lw/rJ0xAKVBD
	q1mExjcjqbOhrdvKcT/HLe34Mkr8uJZBhjauZskDfI8upp8ln2ynvxeCnb9hncuU
	qgj/rszv9Y3iP1Upy+tOIpgOrOqj7pqMrLU497G89mm6hqt6KSJwcBnC4vQg3iGA
	CRzh1E3Vk8ldQbiIKlhptb2QlYhTlJB53yBsiskQl5ykZCgw9Q+AEeBs5NnIiFOT
	ccYg29d3vR1QlXLR4h7iZq7fVOzKfBdXZvht59zbArLMGTPrFX0wU24d0SEblmOE
	vd5dEm+exnBzyTEQCkIpBvkFzuZSSa+np6yAfU1gwHQoUlhv0oNGxpbD/6lC/GTw
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45gt80t5g6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:57 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52L6LAaA004646
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:57 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45dkvtvg45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:57 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52L7Mq3M32047830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Mar 2025 07:22:52 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBB8820043;
	Fri, 21 Mar 2025 07:22:51 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8193620040;
	Fri, 21 Mar 2025 07:22:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.255.71])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Mar 2025 07:22:46 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V2 8/9] powerpc/pseries/htmdump: Add htm capabilities support to htmdump module
Date: Fri, 21 Mar 2025 12:51:51 +0530
Message-Id: <20250321072152.7414-9-atrajeev@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: N91eiKPB-5JfjRI7G7E5MHIr262TxM5e
X-Proofpoint-GUID: N91eiKPB-5JfjRI7G7E5MHIr262TxM5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_02,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2503210049
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

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
index 45f8254fe322..f21d738ddecb 100644
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


