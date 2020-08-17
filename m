Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7719F2464BA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 12:44:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVVzb3VgWzDqDN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 20:44:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CR7Rhsbh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVVjz4Yv9zDqS5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 20:32:55 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07HAVGcF186986; Mon, 17 Aug 2020 06:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4cBjSeC8Nw/iBbV1hcfE6a7JEzSQU+I68TBlKq7hc+U=;
 b=CR7RhsbhxPxU3GPRloR9FwD42Ka2I/AXPyKAyXFmm9q13pbjCTySEMguupceuum7Vbof
 FmRKm3mlB1z9+aNH+e8IL2WAIUNeYNSDsgnSVLWh+Hq1v72tT0GZ99q3WUZ2e88Gx2uB
 r0FwrBDxVHbu4gd+rtRaAy5QoUpTHGrunlrXJlZ9BNMOE/797e5/9rms3gHVpNrX1OKr
 S3nAstOfdTBmZDQNC+Abe0zUWwMdfuf/3X/Grur9D8jufHZZN1Ij476lOzZQU55vXMNL
 reqT92vv9zx887T20W/7o7ApTR5OqFLMl3RW8iQMQeS5zerZqhvcdlMHhBo5cUxMUs9M YQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32y7ngwa2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 06:32:50 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07HAUSg7008815;
 Mon, 17 Aug 2020 10:32:49 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma05wdc.us.ibm.com with ESMTP id 32x7b8r2u4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 10:32:49 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07HAWmGo11600776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 10:32:49 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E01D1112067;
 Mon, 17 Aug 2020 10:32:48 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C3A6112064;
 Mon, 17 Aug 2020 10:32:47 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.2.56])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 17 Aug 2020 10:32:46 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 3/3] powerpc/numa: Move POWER4 restriction to the helper
Date: Mon, 17 Aug 2020 16:02:38 +0530
Message-Id: <20200817103238.158133-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817103238.158133-1-aneesh.kumar@linux.ibm.com>
References: <20200817103238.158133-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_02:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=912 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008170075
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Even though the comment says POWER4 usage, I guess it applies to all
platforms since there is no PVR check there. This patch moves the check
to the helper.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index d29f60e15777..7319084345e1 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -250,7 +250,8 @@ int affinity_domain_to_nid(struct affinity_domain *domain)
 	if (!firmware_has_feature(FW_FEATURE_LPAR))
 		return domain_id;
 
-	if (domain_id ==  -1)
+	/* POWER4 LPAR uses 0xffff as invalid node */
+	if (domain_id ==  -1 || domain_id == 0xffff)
 		return NUMA_NO_NODE;
 
 	nid = __affinity_domain_to_nid(domain_id, last_nid);
@@ -283,10 +284,6 @@ static int associativity_to_nid(const __be32 *associativity)
 	if (of_read_number(associativity, 1) >= min_common_depth)
 		domain.id = of_read_number(&associativity[min_common_depth], 1);
 
-	/* POWER4 LPAR uses 0xffff as invalid node */
-	if (domain.id == 0xffff)
-		domain.id = -1;
-
 	nid = affinity_domain_to_nid(&domain);
 
 	if (nid > 0 &&
@@ -499,9 +496,6 @@ static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 		index = lmb->aa_index * aa.array_sz + min_common_depth - 1;
 		domain.id = of_read_number(&aa.arrays[index], 1);
 
-		if (domain.id == 0xffff)
-			domain.id = -1;
-
 		nid = affinity_domain_to_nid(&domain);
 
 		if (nid > 0) {
-- 
2.26.2

