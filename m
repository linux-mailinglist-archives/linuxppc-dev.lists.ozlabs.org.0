Return-Path: <linuxppc-dev+bounces-8181-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D54D5AA4648
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 11:04:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnWTQ3czjz3bn8;
	Wed, 30 Apr 2025 19:04:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746003866;
	cv=none; b=QTB2gEyAq5EN7y0oY5DUl86WOJu1wakwk5xUt0JgT9vHhr5Yvw/vctHjq7Jop88z7oSQIuMzko79g85ZgCxTWitLeSseSwwHF3XYHBKoIOpLJF7AAae7u9kdhzM25Oz9RT0GNkpETQpQkrqQ26+KUdP/yO6Qlw4XYNZzoPIwHetJt+nyx7yEI7lD/QNkeianMX/IAYoPnHQG+0yWuUMoMe82SvwVm+Go8nBUf+Mg9w3r/gIMvFihrKrrh9ZcCO3bVtHDRP2n+dMGoNPTrDQDk+364+h6OeQtHfIjlkEwgO8mPRYCK16I6tXX1K/hhomxcoQPl6YjDxAgDDrHEw9XcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746003866; c=relaxed/relaxed;
	bh=kZmvUAuKXTdsxm2nVPwxC8EqEMZqr7IelCZT3bJXADk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ADkp2UFE+mt3G+SSyd3RLI5AUoM5cWilH5BU9qbh3kLD0pw3fnISwxjh6wuCt4Iiv8CQwuLgfZLdScaUSll9MT0+dNBwNmOlhPA1qJuTcaruTGspLhIqGB5SYSLkjGtQZSoq5neKEHovOSltURS7vBzXRWHMY4tWQXmUZ0IGWTDeNonq6J1/BQopO5EEfxyQN3CEL4J7aAZgC4/IJyYa4RNPdChnpepKOSC67D9Xwf/PRAn6JCPIlEaXTukow/mPHQo8UflOVCLRp7kylDhre8cbKpMvjWoCmJtmdeVUtuWdw/X353Vt3nc65EKL1mHueg+5YGvLUcMxNAYzaasQQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JXA0JVx9; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JXA0JVx9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnWTP2xz2z3bmC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 19:04:25 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TNkg4F028053;
	Wed, 30 Apr 2025 09:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=kZmvUAuKXTdsxm2nV
	PwxC8EqEMZqr7IelCZT3bJXADk=; b=JXA0JVx93qGUJGvtmm/AnnbZX4LED35xe
	paeYvkAN3mYlCKrJWBqDcs74Ycttl4IV2aYrnALji5Y0m37+mepzbpb3wE5vbCla
	NgERwXeFmms25HXhabg2LqcVogVbMDVEQiG1quPW2bivtE8fTsDHt3xeeZ3pcrdZ
	Ouq6TXzTlXUvY7KB18UJr7pWY+un1Ccoa8l6T4ixDseyEqbFNY0KdS0pijhD3Zhe
	TstKGGqUgk2u/cCesNTX5WClVjUY+Frh5pcMEhjTPZq1hunncyfZ77vtxEXkLVor
	12hF2lmGQMFip7x7Wyn+WETU+9oZkny28r6SpeS3yvAnQJtzef4Qg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46b8r0sqmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 09:04:14 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53U941h6020790;
	Wed, 30 Apr 2025 09:04:14 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46b8r0sqmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 09:04:14 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53U7Ugv1031628;
	Wed, 30 Apr 2025 09:04:13 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4699tu79x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 09:04:13 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53U9497N58917316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 09:04:09 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9964820079;
	Wed, 30 Apr 2025 09:04:09 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE65B20065;
	Wed, 30 Apr 2025 09:04:06 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.39.31.221])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Apr 2025 09:04:06 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] integrity/platform_certs: Allow loading of keys in static key management mode
Date: Wed, 30 Apr 2025 14:33:50 +0530
Message-ID: <20250430090350.30023-4-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430090350.30023-1-ssrish@linux.ibm.com>
References: <20250430090350.30023-1-ssrish@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA2MCBTYWx0ZWRfXxkwx/pBELxXi PUkHSRULFE+jO/gPAFl3QyEU+/snpcLYfpHt8hJ9aIlfM2HZk8MGREWd42y5l/df8XxBRX80kXD 4lCF4PAoAUskv9sGZ6yus8rFTfTmQpXqoiPMm2aApe79zfhBGFmlToCGWtKGbleZRMVKyPHUz6m
 7x3d+NqWPhrtmOnZU5fcgGhzqsnc/ppYDBdcLZnJA/tCDeyMKcBJLE89sO2AS8KmuUFlqeyZmjq eN+LzuV+fVSI/NmnYQO0dg9dA0F5ADVTuwsXd8ucBt/IROhmDbPPtWXc6NwivQ2pq3exihsjF7Z xCn8THK1T6nijoo2SFooJqQ5alsFJjTIS9Rrh6LKUpMgRvCqPjT0tI4bFCcfz0ivKxbHskkzdau
 li/xFQg2NeCFik9BNKBmxXD5RTMo3HtiqqKFSmwaNMJE3cJ81UFrDCJHZiyOMMavFi++OO/h
X-Authority-Analysis: v=2.4 cv=OqdPyz/t c=1 sm=1 tr=0 ts=6811e78e cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=AtMIOgTZpS777Q0Lz8kA:9
X-Proofpoint-GUID: YUFNTwMgtxTxrtbS7pwWlX3I7nRR7VGC
X-Proofpoint-ORIG-GUID: DnfyhYWRTC1PWnK5XbqbXaZbp3tDUmfB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300060
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
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


