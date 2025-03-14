Return-Path: <linuxppc-dev+bounces-7065-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CCEA61323
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 14:56:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDm9l2q4Pz3cZR;
	Sat, 15 Mar 2025 00:56:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741960571;
	cv=none; b=Ub0bAA8ROn1VXgywHjF7CiV6jrV3yxVTSFn2SbA7b05wNxjP6iMzyQL3DPgXzeZeYoCTJP6If8hjyIOq4QTcwSRX5UJFQKQYmA6MOkxU9tzfWD6N5s+4SY0S3e+nTQKPu0hgUXa4Y8Dzzc5sCQvoyce8X9x6SXcLbkhKwIB16t93Xa9UZ7Np6W82800Xx/4lEzkVgyBNebFX/KDClw+gapipOxKuPeoILX5xGL47mN3Vb/E2NI/tdEqeWBEaZWifVzQdwiXkcW/UB/il1nD7WmiMdAjQIlocOrsYIuRQAICRcncOmIQMzASnhiZOYLQiXfjlDrL/T1UkC4wDaHCLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741960571; c=relaxed/relaxed;
	bh=oDL8yng6bSGY0RTutT4Wq3/E2po7igGLrJNikZ6MQUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lX7htjb0Xli51A+ckuAQ/oJSDGdBLP7/eSvCe2wYC4M3+kCRIMQB68OfqCbqQxZ8KDccV+hprumTBFpZGetzB4v9aDx2jBeQhmaDr78sXnLqnOuHRlh9qPLmIJ27xQOemALhFaYtVYxwWjEzWRc+F8a/YSaWBRZibiii1c8yPyVOSBQXxFJ48gCBE6uOxITQ83ob65eGOl2NDdaRoIl0GDen33sC3ET6hQvpTDV7O+ZoQc5ceagTw5F5vOwgmfro1Q+W/bFFI+SEcESdJlMip02np3qey5fjhaMqLgsg0GrD/pxa3GkNrmSL69GkHo3/jqP+8YVpA8EuihQWLtRaOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LyZUzNX0; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LyZUzNX0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDm9k4jvWz3cZB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 00:56:10 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EB2bHd018878
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=oDL8yng6bSGY0RTut
	T4Wq3/E2po7igGLrJNikZ6MQUI=; b=LyZUzNX02jHN42QO91Dbvp1zBZBDQH9Tb
	YjDygPFuw41xqcQKrwn4tj2Apw2aEp138+gxz1oxv4Yb35zBPlbnuYt8/YpAjdLk
	FUVcZRiW97wdYjaI7BejSA1XAxRQV2ptuSgXERMBDfxppVCN65FX9gB4qpre24Gi
	MrspKc8fVODKPBXZFqgtudnE0bl5JCC1NJ080KM8YJ0nrdgsR1qWyWsGOkgZouM6
	xqYpLBG1fvimAX58iktVOL4HVP8NWuuXQ07bsoK3UEithFogQFOoLS2V7zsNDy7d
	5ni1Gdbn+sZKR7ABIBOSitnhCI2wX0d7XaoK4fLpHehEG+GIHkH/w==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c0sre504-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:08 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52ECp2Ev003127
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:07 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atsty773-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:56:07 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52EDu2vG58130884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 13:56:02 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCBE02004B;
	Fri, 14 Mar 2025 13:56:02 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D577D20043;
	Fri, 14 Mar 2025 13:55:57 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.242.102])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 13:55:57 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH 2/9] powerpc/pseries/htmdump: Add htm configure support to htmdump module
Date: Fri, 14 Mar 2025 19:25:34 +0530
Message-Id: <20250314135541.1831-3-atrajeev@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WtG6rY5aOQOItj_cB62BhmlQEFuHLj5K
X-Proofpoint-GUID: WtG6rY5aOQOItj_cB62BhmlQEFuHLj5K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503140106
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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


