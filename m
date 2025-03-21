Return-Path: <linuxppc-dev+bounces-7254-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B09FA6B4E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 08:22:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJv6b5bMtz30T9;
	Fri, 21 Mar 2025 18:22:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742541767;
	cv=none; b=j7gVAzLeIAnF1WOHyj04VzoDa+A8txvHHjDBc3nFvUdYzGznGVs4pdVLe8Aeqe+T+kmrvaDBznMpuHOXpz48TgdH0hoqG32n1gnrj3TEd6k+83JuZKYrjXtccWddKIi5urU75z2XorvNWUaexnciUb5VjJe01wqyH4HBklzblTKqPMOLawJU3GO23b0YqiiJ13sez3b5//B3reLC3vGyJLS2DzXuiXNvKdpmIzB3P67cyQfgQE1p364lln5Qpgj4csDaAD91iJUZ3PSLhY943RNjSc+CMp/PIo157OhIcRH5AibL8SUsgqSsNsEvVtoKkfCqVPRjqoG0lHchjN/8cg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742541767; c=relaxed/relaxed;
	bh=BJneT5zlaDOKa9MkyrpMjwy7GQbIbDGEqzzFCuEoxK8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h/GwLxBm5TCVdqNrkQy6p9qouaB+NibXJgk5C/cMlwgcNMKqEaZkEjZTACBIXDhuF9ylzzlZunAfxVUUViL9LHdfsSo59HRs6eA9OD6petEwTwypicdW8QkZZd4M4ncm+pcyt1fxvi3WMP5Udb9+zpIH3KKOCY7mXlNMnekwLk7fNdaGV4ea3iDHBGLOtHistXdavpJG4oM9RbDLrsDM2GLnBTad28zJ84EbzQunf+cE8tqpETKIsVUcun2urQ9eM3MyUb4+S73WogFJHOTL1yKhVmN79IGuYJcNwvms8+aJu8bC6GsMWbZj2PY7GDzSthmua+Bh5aANcD1eq4rk7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V/XdWWBk; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V/XdWWBk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJv6b1WtWz2yrS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 18:22:47 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KJKDqt030263
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=BJneT5zlaDOKa9Mky
	rpMjwy7GQbIbDGEqzzFCuEoxK8=; b=V/XdWWBkEhIcfjgymUqfNhiQrLoPaPzVX
	uz4Jwm88oSrxQecvG3fjd6iLu+yq3C7EVr5zIKWZBljpWUyuKLoSDrvIOy0r+n1q
	jqfdh4+Luz2trcoP/rF9d/o82vJPnNp268TL1zmTPUeR4/sLHE1C7ssltl0NU8Ki
	lTQNOKoweBuFayH/bz23MVRvjheACfNWYs0sHmOVOwupkNtrPbqp6nM96AKpiAFn
	FEkLDVLt69EMmBNLyrRsOMz9bWnXpFCYiHFhyYouOOV4AOzR08bvQFyUu6Wywpra
	Rn/2ZilcJkqxQNb/eyS8evPrnNmozgHSLhCwXSx9EhLyCl6Be/sMw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45gk21w0vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:45 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52L4JSvX023211
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:44 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45dp3m419p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:44 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52L7MdpY55378290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Mar 2025 07:22:39 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97BB320040;
	Fri, 21 Mar 2025 07:22:39 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15E2820043;
	Fri, 21 Mar 2025 07:22:34 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.255.71])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Mar 2025 07:22:33 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V2 6/9] powerpc/pseries/htmdump: Add htm setup support to htmdump module
Date: Fri, 21 Mar 2025 12:51:49 +0530
Message-Id: <20250321072152.7414-7-atrajeev@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: s6bOOa0YFqmL-Ekoa997gNgHmFuk5xiJ
X-Proofpoint-GUID: s6bOOa0YFqmL-Ekoa997gNgHmFuk5xiJ
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

Add htm setup support to htmdump module. To use the
HTM (Hardware Trace Macro), HTM buffer has to be allocated.
Support setup of HTM buffers via debugfs interface. Under
debugfs folder, "/sys/kernel/debug/powerpc/htmdump", add file
"htmsetup". The interface allows setup of HTM buffer by writing
size of HTM buffer in power of 2 to the "htmsetup" file

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/htmdump.c | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
index b387e46f2b8e..24e597fb85d8 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -20,6 +20,8 @@ static u32 coreindexonchip;
 static u32 htmtype;
 static u32 htmconfigure;
 static u32 htmstart;
+static u32 htmsetup;
+
 static struct dentry *htmdump_debugfs_dir;
 
 /*
@@ -284,8 +286,41 @@ static const struct file_operations htminfo_fops = {
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
+	if (ret <= 0)
+		return ret;
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
@@ -313,6 +348,7 @@ static int htmdump_init_debugfs(void)
 	 */
 	debugfs_create_file("htmconfigure", 0600, htmdump_debugfs_dir, NULL, &htmconfigure_fops);
 	debugfs_create_file("htmstart", 0600, htmdump_debugfs_dir, NULL, &htmstart_fops);
+	debugfs_create_file("htmsetup", 0600, htmdump_debugfs_dir, NULL, &htmsetup_fops);
 
 	/* Debugfs interface file to present status of HTM */
 	htm_status_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
-- 
2.43.5


