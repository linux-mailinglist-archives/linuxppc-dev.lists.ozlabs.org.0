Return-Path: <linuxppc-dev+bounces-7814-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4937BA948BA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 20:09:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zgc2t3MGhz30Pl;
	Mon, 21 Apr 2025 04:09:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745172566;
	cv=none; b=Uy1RNQmCH7z2rmFfwsou41vTg59PmTsyGKZg0Al27q564+JxoINzjL/hl3Wqk2/Y0CF5ygWmboPbkjIFzrqIjbbovjOLENUGJ4DRXp1K2FwmCX6KiO39qRkvyeWWz3g2/COQy7PJ/UDoZIByQwmVs2j6H+IY6hTun23JawwQqYnNLQvA3j9Ej7F7vIms2iV7vIyYjUs3eGy6s8i1LnsWWbtOAiHpVCxpTDiZBZtR5tNTDiLNq0RGISS5ymF8HBUf9W7iqGL+M2Fizdu9tJPTmQXF1RwlwaM3eF9C5tiIDDGs+8jZ1St9tZsk7FACg8P9md11BTZNUN89QnNXApcnXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745172566; c=relaxed/relaxed;
	bh=ooAdTqYrtU81zsEaU3bYUlfIJVhb1DDqSiGiJod8QlA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NP4a83DMcqPf4+wnn1q4X+fD704jZKyu7SaS2GGZASaEuMFBLYcpAvZ1uCkVs2vLC5nDPkfDDiqXAyeoF4LL1yuPQGKaGrjrmnu6Dr/HivRhV9AV9mOrm/E0VFt81UvUvX2VeIHXcS5m942cCzMGWZDvHxp74rKVc3OlrdmUDTyf4RLVkxDBBxCKFuH3ibbD02s2GbJrL/JroUsRZwLUC5RRRD3FOyDF5Fx4/lMrn9dKVqq2f+rRfOm2iTVk+KGwi2zq2irQCf0bi6gQ5PYUP2DEIf+Kya9EO+yTjtM+ldK2bKSU5xXyTE6E9HE69rT8gR0saKoX+2ucb7yd7+La2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HPjCqvfx; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HPjCqvfx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zgc2s5bP6z2yST
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 04:09:25 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KBrsAh009416
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ooAdTqYrtU81zsEaU
	3bYUlfIJVhb1DDqSiGiJod8QlA=; b=HPjCqvfx30xR/EmZhxITYE4biTQgl+pVJ
	m9fRmBHriQbKQodhSK+Zlgj0roH6WHuyO5nkY1vsEXpnNEbaAeVaNYyy7vAlE0RT
	KFitXcUoQG1JGR8oylkV+3Z9r9o6qX1LOaoTAcL2cTCjc+mc/v9vARoPJeiwKZsM
	wrJ0hjwY+abEWuHLbmFwmFDgB5tPEefnngnPblMpTwsdQI4rJ6XNBIPfNJth70iq
	epGaVBslZ1OjvnBih1pSbHoeKN50FUXM/31tp/JCLxOfWd0OqS31JM81kpTuknnx
	XGAf9ZdFWHpDga+LN0+pedcWa9fIrTYxlgoro4rWQ8BjKBN2PUsag==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464kdkausn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:23 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53KHGTMI015363
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:22 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464qnkarjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:22 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53KI9Hvw35783406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Apr 2025 18:09:17 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BCD720043;
	Sun, 20 Apr 2025 18:09:17 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9362020040;
	Sun, 20 Apr 2025 18:09:11 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.246.217])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 20 Apr 2025 18:09:11 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V3 3/9] powerpc/pseries/htmdump: Add htm start support to htmdump module
Date: Sun, 20 Apr 2025 23:38:38 +0530
Message-Id: <20250420180844.53128-4-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: P0C8ONLXbGLm50o5tfClwPPpiqyyIWvb
X-Proofpoint-ORIG-GUID: P0C8ONLXbGLm50o5tfClwPPpiqyyIWvb
X-Authority-Analysis: v=2.4 cv=M9lNKzws c=1 sm=1 tr=0 ts=68053853 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=hG8S08i8OhwJmhfzKLIA:9
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

Support starting of Hardware Trace Macro (HTM) function
via debugfs interface. Under debugfs folder
"/sys/kernel/debug/powerpc/htmdump", add file "htmstart".
The interface allows starting of htm via this file by
writing value "1". Also allows stopping of htm tracing by
writing value "0" to this file. Any other value returns
-EINVAL.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/htmdump.c | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
index 5c1eef1b827a..4dd077cc850b 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -17,6 +17,7 @@ static u32 nodalchipindex;
 static u32 coreindexonchip;
 static u32 htmtype;
 static u32 htmconfigure;
+static u32 htmstart;
 static struct dentry *htmdump_debugfs_dir;
 #define	HTM_ENABLE	1
 #define	HTM_DISABLE	0
@@ -157,7 +158,55 @@ static int htmconfigure_get(void *data, u64 *val)
 	return 0;
 }
 
+static int  htmstart_set(void *data, u64 val)
+{
+	long rc, ret;
+
+	/*
+	 * value as 1: start HTM
+	 * value as 0: stop HTM
+	 * Return -EINVAL for other values.
+	 */
+	if (val == HTM_ENABLE) {
+		/*
+		 * Invoke H_HTM call with:
+		 * - operation as htm start (H_HTM_OP_START)
+		 * - last three values are unused, hence set to zero
+		 */
+		rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+			   htmtype, H_HTM_OP_START, 0, 0, 0);
+
+	} else if (val == HTM_DISABLE) {
+		/*
+		 * Invoke H_HTM call with:
+		 * - operation as htm stop (H_HTM_OP_STOP)
+		 * - last three values are unused, hence set to zero
+		 */
+		rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+				htmtype, H_HTM_OP_STOP, 0, 0, 0);
+	} else
+		return -EINVAL;
+
+	ret = htm_return_check(rc);
+	if (ret <= 0) {
+		pr_debug("H_HTM hcall failed, returning %ld\n", ret);
+		return ret;
+	}
+
+	/* Set htmstart if H_HTM_OP_START/H_HTM_OP_STOP operation succeeds */
+	htmstart = val;
+
+	return 0;
+}
+
+static int htmstart_get(void *data, u64 *val)
+{
+	*val = htmstart;
+	return 0;
+}
+
 DEFINE_SIMPLE_ATTRIBUTE(htmconfigure_fops, htmconfigure_get, htmconfigure_set, "%llu\n");
+DEFINE_SIMPLE_ATTRIBUTE(htmstart_fops, htmstart_get, htmstart_set, "%llu\n");
 
 static int htmdump_init_debugfs(void)
 {
@@ -184,6 +233,7 @@ static int htmdump_init_debugfs(void)
 	 * Debugfs interface files to control HTM operations:
 	 */
 	debugfs_create_file("htmconfigure", 0600, htmdump_debugfs_dir, NULL, &htmconfigure_fops);
+	debugfs_create_file("htmstart", 0600, htmdump_debugfs_dir, NULL, &htmstart_fops);
 
 	return 0;
 }
-- 
2.43.0


