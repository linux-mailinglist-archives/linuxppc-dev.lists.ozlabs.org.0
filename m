Return-Path: <linuxppc-dev+bounces-7253-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C97A6B4E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 08:22:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJv6W5rt9z30Ds;
	Fri, 21 Mar 2025 18:22:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742541763;
	cv=none; b=kDMGn22jCFqJmX9E39UMz0Du6ez9ILtccJLF3vli2Cq30i/ri2tlrhSGuQKXqF43xXLWoXDMaTG//48rqKi/Nbp3M41G/y1ONTzs2n7BTDWh/g/n1dvdzRNp4Y7qpS0bX1peV5gKIn8HYUkebCBfVAgGiCgjIqImx6LuN3IAJnH6p8ptw3uV82J1zY18AEC0dHXwr9W3sGhcKLEQFYOlwWCtEGxrKFGS6AhaCkv/nlWpq28cbqDp+Olo3Hnil7X8EIfEfLGlj7xPp3MYeYKyjPEMMWHTFeWUCiC8QSg9F1Ths38Rmbt+MnvG6Wn7RSjZhQguIx7ajZyG+pkJrv0NnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742541763; c=relaxed/relaxed;
	bh=cmN1BmfxuCKMniJkvISSSA4JKIclpcnDTn37U4pv76w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GvYw1HJMOeoNPUqbLumABpqZqY+edyiYRI4FZQyKjzZayBjszr8noJAb9t50oBniGYSnQypiEp55FwbprRrFdCQ+L5f6yRQoji6iOBslrT4qko1c2yDL44QKrKwCvj2DlztKJW0sLpPNBJZmi12KP+Po0y3D9CUa4KKQ7FF5RNkPuC5W3J5ttMrYnRHgD1/odyp0OY1X3gSiSjlTHkC/YdhKQdpX5EHqrJD18rxDg6oCFBTdb1mw2EDw5YU0BWum9zTSkO8GGi/Onxcjz9Abx/fOuFwielomG7npoUehzdjUDrlt+0ZUFVAibmNXQfT1qLdFiWRzE4yqng2bAphsgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G5wMdQ/K; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G5wMdQ/K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJv6V4Dyyz2yrS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 18:22:42 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KJKDqs030263
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cmN1Bm
	fxuCKMniJkvISSSA4JKIclpcnDTn37U4pv76w=; b=G5wMdQ/KdBL8rOFYdYORnF
	lb88MaRJHB40gVfcjqBCiaqVRnbBwBJtVL8JWUfUHG45uip0P/BSgvU+KDEkkXZS
	jZiObiIVShbJ+OyGZTYDCD/iyA+/Nvm00ceZTV6eP69V22tJF9/zoyoyN07QO0At
	wfkyNf9MQNSXWefbUtshq/+IWy7K1n6LCAxa6DyGzdwSIG+mojL0T6+T2Qwno4Lp
	RWwe+/CcT2Ia/7REoRSAQei0Pse2hQAe/BMpWV/nFuqADXh/3rR6WW+IoRP2W+/p
	YQwvXEDdNHtHUnWyM6oGBNAml8DfOzn5qGMoGezYCpEf0wtm5cBAO2FMH6WKoWIw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45gk21w0vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:39 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52L5FpRc005579
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:38 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45dm90cc1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:38 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52L7MX9D31457656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Mar 2025 07:22:33 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CD1420043;
	Fri, 21 Mar 2025 07:22:33 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D837F20040;
	Fri, 21 Mar 2025 07:22:27 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.255.71])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Mar 2025 07:22:27 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V2 5/9] powerpc/pseries/htmdump: Add htm info support to htmdump module
Date: Fri, 21 Mar 2025 12:51:48 +0530
Message-Id: <20250321072152.7414-6-atrajeev@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: NJA2p0pUCYjvUN1LUkYTLNQRqaddHvpO
X-Proofpoint-GUID: NJA2p0pUCYjvUN1LUkYTLNQRqaddHvpO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_02,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210049
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Support dumping system processor configuration from Hardware
Trace Macro (HTM) function via debugfs interface. Under
debugfs folder "/sys/kernel/debug/powerpc/htmdump", add
file "htminfo”.

The interface allows only read of this file which will present the
content of HTM buffer from the hcall. The 16th offset of HTM
buffer has value for the number of entries for array of processors.
Use this information to copy data to the debugfs file

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/htmdump.c | 49 ++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
index ef530c092ae4..b387e46f2b8e 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -13,6 +13,7 @@
 
 static void *htm_buf;
 static void *htm_status_buf;
+static void *htm_info_buf;
 static u32 nodeindex;
 static u32 nodalchipindex;
 static u32 coreindexonchip;
@@ -243,6 +244,46 @@ static const struct file_operations htmstatus_fops = {
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
+	if (ret <= 0)
+		return ret;
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
 
@@ -280,7 +321,15 @@ static int htmdump_init_debugfs(void)
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
2.43.5


