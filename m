Return-Path: <linuxppc-dev+bounces-9094-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1D0ACC3CE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 11:58:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBR3g3Ptkz2y8l;
	Tue,  3 Jun 2025 19:58:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748944687;
	cv=none; b=HWZllLW73AA3RRK+TT73XPBzU8V5+36+in1+Xv6hQ4tNPOPZCiHQvQhcqa6UFCr3s4ECvTlmYJLdWwLAofjx/3XdksqoYKDOsn95n4cP4oQ4EZEvkApXroOjEfzjJBkEzF5fuBen74hWrelZg56RFjUJlD8ciyRps3j7XA9FtnOf4uHCf1Upmdjhmab+VVJ+ZnG1HgB6xv4+LqLZPpHeTtAeK/LCEzqYyjd9CEyBNUPJPDSJz1i29WwFHql5H+YBVFckF8WU1JEmFz0P7lL4ASx/zxs6KcqK4RpZ8KMvrnR4RSIIMM95Nci92MQ0pdvWyQToV0ssbjxHPMtLQQz3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748944687; c=relaxed/relaxed;
	bh=qwvXwgQXJIkG0QGSj4RsHe537NK9WFzkfnyk5v2o2AI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L2QeN9+B5n4rYf9xFXOA0kQDX+7vz7V+ybiS3Nxzic1QQ5X1gnFUeRjt7n4Dnm8vB122fUjq5Ss9hIXGVRaRjwnSVSsaKQIQt0NVSgG2ann8y7fr62gI1v5SKXmJkjOozdPbVDZxfLGP56ypQ7enXQailMj7COwJMaKspm8p0Xdu38eKUerJIDn/J3/Ql+gTvvp8bYwjiV12jdgPAWxU/2PCJ7EWkSnwcnvh0LQ7AYd3eustBxcAy8CSm2OBmsmzYH1Wp64Bw9ym+jgvg87xFXDrd4U4fFiqWza8VGi/2jXAfijfqs6IUnJCL2N0d090anZS4emg+KcJOFyEmQG6lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AEOL+8Qx; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AEOL+8Qx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBR3f5qymz2yft
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 19:58:06 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5534d8Il000689;
	Tue, 3 Jun 2025 09:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=qwvXwgQXJIkG0QGSj
	4RsHe537NK9WFzkfnyk5v2o2AI=; b=AEOL+8QxQt+Zrax5XBMmylvX7mzzYt4LM
	RhE1iXRLzjb//M06WV0Z2HAEFHb6i4DOvQGHS6KusfY9x993HBnYYYDNTmd/8hT1
	UcPSsR1IZtEQEqAnpS12Lsivy4TPBDOzvfXMOOwJniELm3VnKr7NV8TJ41QDAo93
	YNuTw8wbI8dOwtZCyYlrgcXZncE4Bp6oznI0iJijV+WwEha7gX+Balr72mmb4AvE
	skXGV586vsJrs2UcjjG71Pb5TPZFi8MN3h2qKEYvhSsNjscG5Al81hw7aJSWT/WK
	xPp6L1yf5Q7TkP5Uya0rAf3JTxLIn47Pp2Cvo21kkn8JF2094Wdzg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 471gf03hnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 09:57:55 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5539aCUg025256;
	Tue, 3 Jun 2025 09:57:54 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 471gf03hnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 09:57:54 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5535RMEV019873;
	Tue, 3 Jun 2025 09:57:54 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 470d3nt75d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 09:57:53 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5539vnta46662098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Jun 2025 09:57:50 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A5AC2004D;
	Tue,  3 Jun 2025 09:57:49 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB9CE20040;
	Tue,  3 Jun 2025 09:57:46 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.in.ibm.com (unknown [9.204.203.112])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Jun 2025 09:57:46 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, nayna@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] integrity/platform_certs: Allow loading of keys in the static key management mode
Date: Tue,  3 Jun 2025 15:27:36 +0530
Message-ID: <20250603095736.99007-4-ssrish@linux.ibm.com>
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
X-Proofpoint-GUID: k7BGXRP6qLCd5wkz9DgtxlUZ3WpFPrgB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA4MyBTYWx0ZWRfX0Yvv+lOciByz iYBFUyGXkXVUWC35EULbkvkDkoVG+bc9NJt5xT6Ojvf1yQSDbKAiIRmnvPhxT4t7W0ctJNQOnDT 6icjWJqHPw+gWOI4KAODSFjR78AVr3iSaVRNbv5pL3lS5zgwqdosrpoFQc/2tWVHynmwDk7in2s
 wGwPC2K4Znj5d6fg9sm1zO2Na9VmGGgwpnxvKIb16jyrcXQv29NDi6rpOPr1U13btBmRlIHalJo XM4wv8quUfXfi0v0nDj5dje2VovSjnmLFR3JOQPLdF5oRIdfBLFux/4uriXQFWxHmDiYGXSUkOg z6KFx58IJwu5qjbDZPGm8nwW7/3JKlOWV20DXDX8MSSiXJ/gTImXTDCBGCxRiFnrntFj2K5X0UC
 0ZdfoAaD5Ojsj4F7SrraKF+ivEf/7DuAIsM2tw06H4HK8UmRK7jXjVIiuBo3szynFZziEfUz
X-Proofpoint-ORIG-GUID: XRA8SA7UjyBlR1MLEP4gI_GefYfVtAY0
X-Authority-Analysis: v=2.4 cv=c+WrQQ9l c=1 sm=1 tr=0 ts=683ec723 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=AtMIOgTZpS777Q0Lz8kA:9
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

On PLPKS enabled PowerVM LPAR, there is no provision to load signed
third-party kernel modules when the key management mode is static. This
is because keys from secure boot secvars are only loaded when the key
management mode is dynamic.

Allow loading of the trustedcadb and moduledb keys even in the static
key management mode, where the secvar format string takes the form
"ibm,plpks-sb-v0".

Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Nayna Jain <nayna@linux.ibm.com>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 security/integrity/platform_certs/load_powerpc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
index c85febca3343..714c961a00f5 100644
--- a/security/integrity/platform_certs/load_powerpc.c
+++ b/security/integrity/platform_certs/load_powerpc.c
@@ -75,12 +75,13 @@ static int __init load_powerpc_certs(void)
 		return -ENODEV;
 
 	// Check for known secure boot implementations from OPAL or PLPKS
-	if (strcmp("ibm,edk2-compat-v1", buf) && strcmp("ibm,plpks-sb-v1", buf)) {
+	if (strcmp("ibm,edk2-compat-v1", buf) && strcmp("ibm,plpks-sb-v1", buf) &&
+	    strcmp("ibm,plpks-sb-v0", buf)) {
 		pr_err("Unsupported secvar implementation \"%s\", not loading certs\n", buf);
 		return -ENODEV;
 	}
 
-	if (strcmp("ibm,plpks-sb-v1", buf) == 0)
+	if (strcmp("ibm,plpks-sb-v1", buf) == 0 || strcmp("ibm,plpks-sb-v0", buf) == 0)
 		/* PLPKS authenticated variables ESL data is prefixed with 8 bytes of timestamp */
 		offset = 8;
 
-- 
2.47.1


