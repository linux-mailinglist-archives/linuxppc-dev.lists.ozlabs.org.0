Return-Path: <linuxppc-dev+bounces-8835-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A002ABF239
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 12:58:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2T1P4gNZz3c5W;
	Wed, 21 May 2025 20:58:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747825113;
	cv=none; b=gKJao4W7+b0xLwkKurUFgmDrlMH0stktS0xYlB2O43e+5GaIQ0Rm2sj0iHya2YFLr5WsFXswIi6Qcus9mG7hXtAH2WqXE3gzFzoX/ZXfZZq/6X6ozOBftMbIICRiM75UHbZ2TfJf17UTKiSIGCTGqEBxWsLGI0KsuoOy8zzGu4+pZ2hQJumK3fLb3QJ7hnapmzM96jQtkj4DoZdtEcSVg31XyLXvu0WmXsuzbc9Zuav3huCMwHMM4Xq2YSRL/m5E4yAAduzMW/3pPiaz8wmw+GqWItavEh7WdUM2SAFUgtSH5I+uVAWY8CU+CFo9VL8A6v8FaqiUQPhUYJ4ywBt6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747825113; c=relaxed/relaxed;
	bh=+iv47Tf1NAy3MKg7JpMt0tSZMZNUHjGtMkJcRX2ZoxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JD+52b0s+v+XhyQcSmX0Fqm2G2lwzaMFjtXbMleeqbNjyyB+4BUmyscLttbdxp9qnydpF7SdMhHk/7G2uzJtGDW55LDGErML9vl6KLF8WaoUD09ndbklqga9TGqT+s/bj6jItYNMLmbo+P5ZnaSHHkxs5cBzMyhellAagYqXXT/C6ot9C7NC7PJrpQ/ZwrSxrgsyQn+ywp8RnhdfY1Bd48LoAdUVKoGr55Ln7NZ3a+XUlIeeWcgqpmnE8L6BvJfEaTkZioq1hYaGKkeXnrRCLpH591R6FWlTXzhuwgsuLjy1AtO4uE0mmAhr9k02iMljNJga9Z3vD0Xf23hoV7ZScw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kzjWMpCI; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kzjWMpCI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2T1N2zdMz3c4M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 20:58:32 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L8phhu014686;
	Wed, 21 May 2025 10:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=+iv47Tf1NAy3MKg7J
	pMt0tSZMZNUHjGtMkJcRX2ZoxQ=; b=kzjWMpCI2yMJnJ2+8F9Q2uOymy+5O4LcM
	dogMhK1cYNMNfdv5VIHHlqxXnTu9vnyz0UrsMMZhsxKoQCsKgmH6rkHNL0pjWSIl
	PlrQmIkUh+l98LHMzwnkIrcSTj+jdOuy90cPR1rkfx2Hk/8qgEHWXSvYl0vhEzvn
	KPette/LmqGZffkdrpbjNq6Bt+EoQDJhVP2oxhcqYG9Cm3UWJkwJfO+goH066omT
	v6xzoeKcZyBxzUZrZukZ5f6VCpwjFCk76v3eBKxHHsIOFiMyXou/33BEgkZmY8dV
	vfV2te0E448moV+2OC2sat//+jtWxkhS6BuodTbCVN4Pkq6fh3IuA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46sbph0j2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 10:58:13 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54LAsMH6025326;
	Wed, 21 May 2025 10:58:13 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46sbph0j2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 10:58:13 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9gx4T010640;
	Wed, 21 May 2025 10:58:11 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46rwnmbt5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 10:58:11 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54LAw7m130147158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 10:58:07 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 938C920043;
	Wed, 21 May 2025 10:58:07 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B88D20040;
	Wed, 21 May 2025 10:58:05 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.in.ibm.com (unknown [9.204.203.112])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 May 2025 10:58:05 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] powerpc/secvar: Expose secvars relevant to the key management mode
Date: Wed, 21 May 2025 16:27:58 +0530
Message-ID: <20250521105759.8408-3-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521105759.8408-1-ssrish@linux.ibm.com>
References: <20250521105759.8408-1-ssrish@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEwNSBTYWx0ZWRfXxj+Kr/SU8DGu 7cCuWAgvM3Wh88Nc9JjXMxjU5hz4F3VBsgjEKA2jQyrfRJFwRqsAsBJ/8SEzmCUi+DyVsOMoA6T ibhivpF6lol5UhjPIDQRNTpFGpb4aF7N8r/CtBHNg/ApAtu9oppIRpsJjKJi2dd8PcMjyeCzMcY
 7QgcG8Y/jrxIEUGcS+2GRCDF71UNHtj70XXyjMJRiNtsZiB/cwnsYZ6LWNfDsnyfvAVqLPfUb2W TFF2ig7rkfHWPPWi8VhoNaXD2B/IKiap+XXxOydwsyCfhAWB5MUQlExMiatXq937BYcrJj4BvWT 3v94iLAS5Kck5RtFHhX6q6rZz+PSEeOlY67NMn4n866ElpK0yIvF/LYnAcJr3mwJTjQgLvZjBhH
 0Vn1sWCmFmUl8SILKBoZryWG3jmVNy+HRIj+RImKLn20sZYXjVuFbgmgpR7DEt8kQrvxh5mI
X-Proofpoint-ORIG-GUID: Vww7UlYtzeEycHD7TKb6YTyr59h6E1Iq
X-Authority-Analysis: v=2.4 cv=L5kdQ/T8 c=1 sm=1 tr=0 ts=682db1c5 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=tLxTvSBFvjwC67ZwczkA:9
X-Proofpoint-GUID: GHnn0WbiKF2p2z2DrVtQ5F2IFlZ2RgHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210105
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The PLPKS enabled PowerVM LPAR sysfs exposes all of the secure boot
secvars irrespective of the key management mode.

The PowerVM LPAR supports static and dynamic key management for secure
boot. The key management option can be updated in the management
console. Only in the dynamic key mode can the user modify the secure
boot secvars db, dbx, grubdb, grubdbx, and sbat, which are exposed via
the sysfs interface. But the sysfs interface exposes these secvars even
in the static key mode. This could lead to errors when reading them or
writing to them in the static key mode.

Expose only PK, trustedcadb, and moduledb in the static key mode to
enable loading of signed third-party kernel modules.

Co-developed-by: Souradeep <soura@imap.linux.ibm.com>
Signed-off-by: Souradeep <soura@imap.linux.ibm.com>
Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Nayna Jain <nayna@linux.ibm.com>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-secvar        |  6 ++++
 arch/powerpc/platforms/pseries/plpks-secvar.c | 28 ++++++++++++++++---
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
index 45281888e520..948df3446a03 100644
--- a/Documentation/ABI/testing/sysfs-secvar
+++ b/Documentation/ABI/testing/sysfs-secvar
@@ -37,6 +37,12 @@ Description:	Each secure variable is represented as a directory named as
 		representation. The data and size can be determined by reading
 		their respective attribute files.
 
+		Only secvars relevant to the key management mode are exposed.
+		Only in the dynamic key mode can the user modify the secure boot
+		secvars db, dbx, grubdb, grubdbx, and sbat. PK, trustedcadb and
+		moduledb are the secvars common to both static and dynamic key
+		management modes.
+
 What:		/sys/firmware/secvar/vars/<variable_name>/size
 Date:		August 2019
 Contact:	Nayna Jain <nayna@linux.ibm.com>
diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c b/arch/powerpc/platforms/pseries/plpks-secvar.c
index 767e5e8c6990..f9e9cc40c9d0 100644
--- a/arch/powerpc/platforms/pseries/plpks-secvar.c
+++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
@@ -59,7 +59,14 @@ static u32 get_policy(const char *name)
 		return PLPKS_SIGNEDUPDATE;
 }
 
-static const char * const plpks_var_names[] = {
+static const char * const plpks_var_names_static[] = {
+	"PK",
+	"moduledb",
+	"trustedcadb",
+	NULL,
+};
+
+static const char * const plpks_var_names_dynamic[] = {
 	"PK",
 	"KEK",
 	"db",
@@ -213,21 +220,34 @@ static int plpks_max_size(u64 *max_size)
 	return 0;
 }
 
+static const struct secvar_operations plpks_secvar_ops_static = {
+	.get = plpks_get_variable,
+	.set = plpks_set_variable,
+	.format = plpks_secvar_format,
+	.max_size = plpks_max_size,
+	.config_attrs = config_attrs,
+	.var_names = plpks_var_names_static,
+};
 
-static const struct secvar_operations plpks_secvar_ops = {
+static const struct secvar_operations plpks_secvar_ops_dynamic = {
 	.get = plpks_get_variable,
 	.set = plpks_set_variable,
 	.format = plpks_secvar_format,
 	.max_size = plpks_max_size,
 	.config_attrs = config_attrs,
-	.var_names = plpks_var_names,
+	.var_names = plpks_var_names_dynamic,
 };
 
 static int plpks_secvar_init(void)
 {
+	u8 mode;
+
 	if (!plpks_is_available())
 		return -ENODEV;
 
-	return set_secvar_ops(&plpks_secvar_ops);
+	mode = plpks_get_sb_keymgmt_mode();
+	if (mode)
+		return set_secvar_ops(&plpks_secvar_ops_dynamic);
+	return set_secvar_ops(&plpks_secvar_ops_static);
 }
 machine_device_initcall(pseries, plpks_secvar_init);
-- 
2.47.1


