Return-Path: <linuxppc-dev+bounces-8834-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB717ABF237
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 12:58:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2T1P4DD6z3c5J;
	Wed, 21 May 2025 20:58:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747825113;
	cv=none; b=aDRJHxE3E32y4BllVNX6Ch4uOFjT3ZnQh7ThnfpxjLT09mZBhdpIyjXd0ju+TkaJyiKWPhUV0ZwCSxeA+LQU3q/xVzd/23zI5KS0q59z8glE5h5o7u9HgJh8qoy7srSdX9MgUC0G1xjdCXMfgKx9iUjl8J4QJj2d+FcPEw8lkFZ2YTvt49qUgLF3D5OV/3vzaR+DsfE5/Nu6MqtqF17xbxpAnId6wfuQG5cQWDd0qdBnWguBhiXsxQN+snR8tH9Gr1LZCiclNzXV3+jK/w+jk/tUtGF1on4roDeLGwtGMnnyq148UAzKSyB6NORRqSjZ3NHr4o1HznmOMP7f15Tm0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747825113; c=relaxed/relaxed;
	bh=qwvXwgQXJIkG0QGSj4RsHe537NK9WFzkfnyk5v2o2AI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=STj2nScA13EDxC8J5f5PDAaBSAX+96wZDgOYcyxwFQ1HJqxK9CNWnUiuGvfpga7g2znirApvRPSFWDC/UdbQ8/HPvHlKqbCfII6wySJP2jvL1uAUQzOaegcw2cE7tmlFzPrjfDJx4jNa7aQHzmr7bg0Wsi2WRkpQMATKqB2XnXO1DCELUrLUXBTPPtEted7ul9453m5K/jfzRj7WoLbSaowhn5OQvYor7GKsTEuEjhF6tLIopSOtdnLrpa/zs4jMIcvn+eOhI0Q3MviB8/RtaVcUJHGbSdq7z9hAEXbdHKgzfc77/0HLGdd59AF00rld+tA6tuS46X4gW6KZd+ZSYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ft9qK69F; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ft9qK69F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2T1N3RnVz3c56
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 20:58:32 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L8pRJE014308;
	Wed, 21 May 2025 10:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=qwvXwgQXJIkG0QGSj
	4RsHe537NK9WFzkfnyk5v2o2AI=; b=Ft9qK69Fuso5iibjRn/GxJn8vISX62iBk
	fuS9F+p1k9VAxxn06YI2lW8xzYpu0tan/+A9O4fkuX2+Azc9p9/Wt8jXcc2cDgyt
	J0j0/mLHL7UNhcPyr168gLDkZjurfV/BJ/iOadPFqSM+AWJcsanRFH5htPnjmZ0N
	jfNbrZlbHYYGWmogsgbTtvook0WotKBhl/3mdVUdaU77Uq5Bj7rxMs4hssR2/n3u
	WfYoMJ31PguNwnO0zgMkdX2l4LOSB8lE6qif7McX62hPEB+7/RgKoRLyh+Z1qf7T
	snGO6WUdblhTe7tJl5dRtunAJHZ2Arf+E7Kw4vdOfLJoRWrhX4ySg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46sbph0j2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 10:58:16 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54LArXmJ023166;
	Wed, 21 May 2025 10:58:15 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46sbph0j2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 10:58:15 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9d7a5031996;
	Wed, 21 May 2025 10:58:14 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46rwmq3t9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 10:58:14 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54LAwA6P54460686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 10:58:10 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5978520043;
	Wed, 21 May 2025 10:58:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDEDC20040;
	Wed, 21 May 2025 10:58:07 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.in.ibm.com (unknown [9.204.203.112])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 May 2025 10:58:07 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] integrity/platform_certs: Allow loading of keys in the static key management mode
Date: Wed, 21 May 2025 16:27:59 +0530
Message-ID: <20250521105759.8408-4-ssrish@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEwNSBTYWx0ZWRfX3GkG9UUHZUy9 livt8OcJDQIVDJMd/MNG3TiU2jLdlkx4oKtyR98xTsZPuEJJcnbUK+hUVW4bbIrAdauk6TrtVr2 TKfCYyqGw8Iw1JIaRf5Aj8vyhN3zu3y2skpU/1+yn+zYR0FkomTc/M3Xkw8ByX1mGUCVqLOAUYo
 +ZXyi8P0bO62OISNuYgyCBKaEQ43i3C4l9Ejad9HRFAs0oMYVRNTSSxlcQyce7DmmEs335017TK bOo4QOmmGu+tuarqxNm+qNIu2sotwo2gRjNBhOKio9+5pZb5U9/L7DSKkjIXJx/YKgFUPinUY/T 2VCQ4riJV0BvsXZT5S7CXKKyu3FpKpX6lXnMLmYpj+xV2HKCrfOMpfz6kLxKZltthkoo4x/xXSv
 t1WGhcCqofAQWpL5OiwgWw68sZue9gpwkq8x16QxLGEYyS9+Je9SY8n27fuT6F+5PQUb3zbP
X-Proofpoint-ORIG-GUID: ZEowoLJegkq3_yvN2FQDjrR4hOkpLnUy
X-Authority-Analysis: v=2.4 cv=L5kdQ/T8 c=1 sm=1 tr=0 ts=682db1c8 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=AtMIOgTZpS777Q0Lz8kA:9
X-Proofpoint-GUID: 2iT4jmr_S-xxe10ezReX3mPakJehOwXr
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


