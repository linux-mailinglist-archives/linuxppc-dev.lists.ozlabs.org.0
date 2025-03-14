Return-Path: <linuxppc-dev+bounces-7067-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C19A61327
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 14:56:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDm9y51VFz3cZQ;
	Sat, 15 Mar 2025 00:56:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741960582;
	cv=none; b=YtzgbiihDk2XbbwlC9I/kaxBGIdUEvdL5XI3tJxoANUDDUFMXsvY/GjU7pIxC3awGffTxifxRGeRDTMDwcrMRy3jwevUqbz096JiqFiaG877IIV5DueShgsZ52ZCJ5qxguJFYltFzhsfvPdgTvLOfL4qFJ9oiGXADCo1Qi0BP+z/Vt+Isu832onoW5D6q1+veO2PEhmpcfHayUHkvwP6Xilw1iEBOsMP+sHfc0jvxdq1LdoGv9m0kLjcYruZzK7vxpOEm5V0L59d3JegcGxYlRq//C64rVvtZITPboosx/inP5a3lx39P7bpwzkUf0G8omirHVTG320ebCAM9KlCyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741960582; c=relaxed/relaxed;
	bh=loQ64pJh7NHAhJmS6mkh8nxPuqv/R2C9b8HqKlYwHZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DelfFWtc8i/64XokMbtUGTD9wGVRZ7994k3/ZsuBcG589qd+h9qWasSatnscl64oDdZ4OlY9PnnuoYJQ4+/CdRHFq5UPXAf9CKewOSMhyNGT0tWVNw/ujRDqHizp+IHze1FMTfCE9UiVhRhITYjMGRXp/qBJh4Y6NiBXeBEr+SYMBsBhj3g8hIHivEdxmnLCX+6XkvzpqH0dleJw0u/QZldyRCwVjkiMhHiTZu2fVOoCsclOZucrkSOOf3IvyzMiXHTg3KN6tVM68SIiMumv1LoYT7nZALdF0jqLDw4Xj0Cw0WyASipYKtNJR91C0oI8ugWk9NPE4HOk2FTAhc2gGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O9PcpkTK; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O9PcpkTK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDm9y05Jdz3cZ9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 00:56:21 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ECSPU9011395
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=loQ64p
	Jh7NHAhJmS6mkh8nxPuqv/R2C9b8HqKlYwHZ4=; b=O9PcpkTKRQN0U2Izgk4zqu
	4wdsLcIY7NL9itwLl/pgUSQCLk5rvSwHI2G60n6uiF6FbMpvxzhyzyQUkZFYLdPI
	6sieiTV/VdTzgMlLwG3uvpf29pFy+qu1s+r5GGE96xSxlGMNx9PWNJrPUFuuLGN3
	xSDkilF58deV8UliC8FXit82/WADQUGhI89IJQQYX3uQaqFhFeiJvfVGjkbmoNEe
	gU/QxHO5el5tV499lSdmeBavvRN4mUQzhXTA/+sDvb5t3lEP5hNWut8AuCAU8fhq
	zNyNqTIRxVWaxfYB6ixjRLCM6IAUNimoqCAx1MoSA2FL9qE1K7+kSxzhwFX+GWPQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45cmg3rdy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:19 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52ED1EWa026064
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:19 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atspq8n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:19 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52EDuEwW50856270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 13:56:14 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C0BC2004B;
	Fri, 14 Mar 2025 13:56:14 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 364D420043;
	Fri, 14 Mar 2025 13:56:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.242.102])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 13:56:08 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH 4/9] powerpc/pseries/htmdump: Add htm status support to htmdump module
Date: Fri, 14 Mar 2025 19:25:36 +0530
Message-Id: <20250314135541.1831-5-atrajeev@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -wtBFOpMPFKpNbYTUQcKgLVzlIsrEO2n
X-Proofpoint-ORIG-GUID: -wtBFOpMPFKpNbYTUQcKgLVzlIsrEO2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503140106
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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
index dafbe662fb3d..703ad2f8b5f0 100644
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


