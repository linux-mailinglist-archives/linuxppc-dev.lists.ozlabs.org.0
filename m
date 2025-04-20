Return-Path: <linuxppc-dev+bounces-7813-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD026A948B6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 20:09:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zgc2l62cPz30BW;
	Mon, 21 Apr 2025 04:09:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745172559;
	cv=none; b=PbfaC3OuEymz/wnRPMrS9V7miF2GhmBAiDpkzMGNA6QDnZF/kdtdnfjiBI1VsyNy+izmadzMqd2K2Pz8c7HrXa8rjH1MMejeckbCacpH266X4tpY2mUHO0Dgp758Nwh0BEJcTA+38IzXz4YnT0Ec3Lg7JuLuWvJouRJ82sSmCCEC9/gIKNCtImzrJkiGicBeLrhR64Vq0kzuHZUGj5lZq79KPc5bIGLUSKZvi1ga46ZKCBdGJ77yqtth2oigJ4oXK22d0uMoe3Zwx0inDmEMNYesFuY/fUC1XYLujWLq6bx3Pl0foXjseDlZbXe3PgcacqyG9xGNQn1bi4E55yRrug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745172559; c=relaxed/relaxed;
	bh=gzx+PRWwm5/rCK9iDonhvKMAH1fyAyV/7QCLkzwqWkQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iHAxvKscKXWs9kfHgoVrviYWQ9PS+yeSBFXn6j0A3LA4alkUN9ccIf5gCBRgBWyv5rzUGA5NUkNxPHfRn0bbGzXNTsl2vRWjTLYZMexschoFo4SDYSrrNh06TjIElMdusUmHhqOMosJcl7Ug0MwBDNkygWZuxPgPmc5Ogij9oaApX0gHZ9nqknKQCGNP6/J+QWDw7obhdu/ax4ttZspAEpbczJY/2CbDPlGTVu2OKW8rzqIDhuO5SJ8IuyEAEV0zKbNtKsv9TT9XtWbhIJARxixYtbL6/SvnAlZ3F6A1DJjw5s308d6g7AIvM3uRRSUkPF+P7LtKXneLuHrM1MuNlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kDd8WTdK; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kDd8WTdK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zgc2l0prNz2yST
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 04:09:18 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KFLU6x009432
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=gzx+PRWwm5/rCK9iD
	onhvKMAH1fyAyV/7QCLkzwqWkQ=; b=kDd8WTdKcsLmkO9JaSt6hxIkvZThqVTt9
	lI9JZs3DEIvQKQLpJhVHDdwAAr1CZBWNv/R/QpfjgMvBGRdAHqE8fWLM8M5vX/wD
	FV92TW4UpG6/UsfvrLvctP+HFCoXLxpbgZXr3e3WdK/l8t1I91kyxRwo3bgTS8Xz
	XM52lU4I8wfoN6u7lPiWBb5SYzWbCGreSyTsWxTm74ZsZPb7RG31cKVaCpvlxoP4
	5UgpD4MEjZGkNBSReIZZ1KPgw6PEfB2STlIbLhSokhw9AQsFOmIQKL7PnPBYSns7
	pn+zAjZ7MLHihxMEVUaZvODYI9+q5OhzonwitzbhCY3ex79rN4Ibw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464ycrgy67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:16 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53KFXs23012521
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:15 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 464p5su2p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:15 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53KI9AfR22544820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Apr 2025 18:09:11 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D302F20040;
	Sun, 20 Apr 2025 18:09:10 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7595F20043;
	Sun, 20 Apr 2025 18:09:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.246.217])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 20 Apr 2025 18:09:05 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V3 2/9] powerpc/pseries/htmdump: Add htm configure support to htmdump module
Date: Sun, 20 Apr 2025 23:38:37 +0530
Message-Id: <20250420180844.53128-3-atrajeev@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Jp7xrN4C c=1 sm=1 tr=0 ts=6805384c cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=hG8S08i8OhwJmhfzKLIA:9
X-Proofpoint-GUID: Vz8FtQm9vrxo7G2gvpAMMglwsd5u6po7
X-Proofpoint-ORIG-GUID: Vz8FtQm9vrxo7G2gvpAMMglwsd5u6po7
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

Support configuring of Hardware Trace Macro (HTM) function
via debugfs interface. Under debugfs folder
"/sys/kernel/debug/powerpc/htmdump", add file "htmconfigure".
The interface allows configuring of htm via this file
by writing value "1". Allow deconfiguring of htm via this file
by writing value "0".  Any other value returns -EINVAL.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/htmdump.c | 56 ++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
index 604fde6a0559..5c1eef1b827a 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -16,7 +16,10 @@ static u32 nodeindex;
 static u32 nodalchipindex;
 static u32 coreindexonchip;
 static u32 htmtype;
+static u32 htmconfigure;
 static struct dentry *htmdump_debugfs_dir;
+#define	HTM_ENABLE	1
+#define	HTM_DISABLE	0
 
 /*
  * Check the return code for H_HTM hcall.
@@ -108,6 +111,54 @@ static const struct file_operations htmdump_fops = {
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
+	if (val == HTM_ENABLE) {
+		/*
+		 * Invoke H_HTM call with:
+		 * - operation as htm configure (H_HTM_OP_CONFIGURE)
+		 * - last three values are unused, hence set to zero
+		 */
+		rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
+			   htmtype, H_HTM_OP_CONFIGURE, 0, 0, 0);
+	} else if (val == HTM_DISABLE) {
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
+	if (ret <= 0) {
+		pr_debug("H_HTM hcall failed, returning %ld\n", ret);
+		return ret;
+	}
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
@@ -129,6 +180,11 @@ static int htmdump_init_debugfs(void)
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
2.43.0


