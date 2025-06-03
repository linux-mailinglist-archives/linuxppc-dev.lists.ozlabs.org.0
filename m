Return-Path: <linuxppc-dev+bounces-9093-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B919BACC3CD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 11:58:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBR3f44bsz2yZS;
	Tue,  3 Jun 2025 19:58:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748944686;
	cv=none; b=jSPRi7XXNQbk3kM8qj/MBylGjayfseY83emk4w1jaNnq6GTmMT3Hivfa99BELxr+9RNor/4PPZ5cRKcBCyrBESIV0mDR6NY2Rvc6yPQXtCWbdKCWCOqqOzQU8+a7pR5KZJqIold8GdiNLilyWonz22Z4BGmV331olI0UAND186Pgtjs3IzQi7xoCgO6AKFL45dG1Z0FL0jsQxekfM1y/OzJcLBWS/GNjCrmcVL2HJEw3ZW8/K/ReCHl2J4T9XrqdYjl0JwcGFGiqJrrMVNVnAVjCN5CN82xU/uR7FWFM4RcCmi/haCHY6YzFD1TCfL++qCrirW8+GYerUvYAc2JTVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748944686; c=relaxed/relaxed;
	bh=aN2L+QD9iiyXLrjHzdhll0BOIFPz9sA1t35IhWtYHiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=czyZ0KwUcQBqLRmRRceO4tlGwXLf5iE1bfwRTbhJNjoQ3SUtnNYUbpCPLsZ4fBWbxZs3WbwFFlEZStH/nH1s3tq41xKeqv4Nt9z1qp4xa9nrFjphi4axeyESVkZlV/w1G3hFtIBSzJEpgW6iGawvCBh+BXqOXOuNlQ4QSrjzlJrkekVu+JnYsUWoaQirunrBy8gXeFQ9/Ip1OrE4Gn/sMTGcDjZD7X2+Ixc21TvSbyKT9Z2mXhRnulNsg1OZmLHhfLAwbUSCN8cjDSeAv3ja/Dxkzs9EeIzqcirNsAGv4UpoqPxRqva/b1Cfc2ybk7z/FewzTuMdJCy5mqPDbOa68Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H0kS8rzk; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H0kS8rzk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBR3d5Q7lz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 19:58:05 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5535FLGY031521;
	Tue, 3 Jun 2025 09:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=aN2L+QD9iiyXLrjHz
	dhll0BOIFPz9sA1t35IhWtYHiU=; b=H0kS8rzkMb/XrjkqCp1zpxPQZawglJuMR
	iqMydBLtHzwhqT037sZx7yOFOheQNde+jwmML0mlggAiB+mjkNEvm6/oLLvnLXy5
	q3f20PdmcM78GJ4iIwse3x+WSvwDyWvKkK86vIwgEikjjscp5Xd56/p1+tZ/driH
	jxKwHrAeKnRZ8jvR9wgyugX6qvUyDM+ycR+M4UxzBr6rX4w0GvQL2/aH/Itzzf3H
	D65v9vXJ2/nR8cwJnVIdYYyTSE0hAqXDt36azhhyVWe1NaAPOOh8vZioQwfmbw6F
	3TqN0FpP2XmXvhBg/L3oglx0KZBr3OhIOd0n2rDPUH4ljMLbd9syQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 471gf03hns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 09:57:54 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5539vr2g007835;
	Tue, 3 Jun 2025 09:57:53 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 471gf03hnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 09:57:53 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5535duuv024899;
	Tue, 3 Jun 2025 09:57:53 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 470dkma3r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 09:57:52 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5539vlsg46596464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Jun 2025 09:57:47 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 705A72004D;
	Tue,  3 Jun 2025 09:57:46 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5C5F20040;
	Tue,  3 Jun 2025 09:57:43 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.in.ibm.com (unknown [9.204.203.112])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Jun 2025 09:57:43 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, nayna@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] powerpc/secvar: Expose secvars relevant to the key management mode
Date: Tue,  3 Jun 2025 15:27:35 +0530
Message-ID: <20250603095736.99007-3-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603095736.99007-1-ssrish@linux.ibm.com>
References: <20250603095736.99007-1-ssrish@linux.ibm.com>
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
X-Proofpoint-GUID: tJICFi2K2wvm58jh31xqfv7FsTSDc0Uz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA4MyBTYWx0ZWRfX/asJThoifncl XIIUHXHOmAz2rw4REXK58OFYlBYHZukuvxs7mNzhK27XjNoihvv0HLVfLKJwomJ9zlRbiDHlNGO UVCVmUVy/GccoZUxujXhxBP4XF6zeEqQM/5fbFDmkzjppa4/NY6BvS1jE37DKErukOwIE91KbMt
 GUxLbm7Kf0ZyE+RB4cE0nrr9KGusTj+p0hF2CSCTh1UGsNsY91RioENWbYGsKFPR9ayqosOL/Pw KXVj9gPcRQ4Isyb0RHHyDlxDdPvk3khCINOVOHxwuw0+q9NNEDLCgJS43C+/L2gBLwtWstgj+C+ BlJJmsdh85VzN+eAYE0F2V8rt1c9/NNDyr/nBFFKOu17YQ67uBOD9CvxPY2YEbbOkMVk+1WJ1YB
 D3a2X2/2yGnlE8FsXe9qpUO/dF3qwHywFLLRDTteZX9yCOGIGT6McRs0V88fyRekeGM6Gfpu
X-Proofpoint-ORIG-GUID: CtHEvqjboBysUFxb-c28F7Jty0ws_Vy9
X-Authority-Analysis: v=2.4 cv=c+WrQQ9l c=1 sm=1 tr=0 ts=683ec722 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=tLxTvSBFvjwC67ZwczkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030083
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
index f001a4f4bd2e..0df2979e27f8 100644
--- a/Documentation/ABI/testing/sysfs-secvar
+++ b/Documentation/ABI/testing/sysfs-secvar
@@ -38,6 +38,12 @@ Description:	Each secure variable is represented as a directory named as
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


