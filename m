Return-Path: <linuxppc-dev+bounces-10272-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71580B073E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jul 2025 12:47:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bht6k6V62z30VV;
	Wed, 16 Jul 2025 20:47:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752662846;
	cv=none; b=T26lUo7cdklmp4aImhKWGXwBLQAiyeW6NH0zVF2aBd+yX1hgCBbLbpCS3pDmfCctgQcRGK04TGy08F1Vf8iyKKv1RPN7YnaN2l5eg/8WvJjTbuf7Ba97tvnOhhz4BZjCRPIIgYmUv6rfgbAc8VVJW7N+L3umjpSkjZaTCi+3lgfdUxsTBd2HBpfGTmkK3wDKydDG1qraKBaf7nSdpyQgWjZrUKlWx64E+U2JMCzdy00h5y0oSZw5IshUhQO8S6IoyCaFEVFKUh8ooHG4bLhRB7o9b/0tkjc1f3Pf/8esLWzm3NchB0P6yt7pqs9SoQoGl9I3pqLI1ayfMVhFKKJqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752662846; c=relaxed/relaxed;
	bh=gTLtMIRnm3xKdTc7YIn7pSNPhtbixs4uEBIQM0PQafQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EqgUSAPwC4TXPA1EPxtGlVie1I8rJpqkWY1cUgf73alxxmOzrx8wVayIvKIi4n3T00f2lN1mr2IZ8nfMl5qzBWTAD2TGDVQOG4lAsmvQo1ifFcexoPKLvuU8TmCYorCpH+vuEvb45WSpXQxT+iuFLNPqLZU1Eiex5B44zsRN7kVQk4uLX1wXhS2B/uhWgWY/+2wTuDHjPGEoRlr5OVbTOv+iiNIhiWy3fvFSCUJlEL0Yr/4BiiFAJzZpsTI5EXfM/4Hut+nzWkBVPsiqGXlGBd+kxhFiQU8Z1z9W/UCOtQiNoFOa1TqeZkLhuMB2/cRF6cKmuCwtUnmYOJLV7K7SPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HWZ4n1he; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HWZ4n1he;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bht6j4wXYz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jul 2025 20:47:25 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G8Gi8U028287;
	Wed, 16 Jul 2025 10:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=gTLtMIRnm3xKdTc7YIn7pSNPhtbi
	xs4uEBIQM0PQafQ=; b=HWZ4n1heLluAYo3G48ZQGlm0hER4Ns3fGu/JhzthKmeN
	Fk5vgh6ZfXCEX1QnPXchebD3ElaRgL/OqmxNf/VL+3ihWPjHQdeK88hSLIqV5qQT
	5SQl/c/zCSJ3EkdqrB6vX73r+vfZocJlYfH8RMx7yYlic74sl+IsP3oNr0lsLpdY
	M56sZcr9XItLzWepGTOcNAViNmCWXraqWTTplNJJWVmBwznuXFnWOoA7fnCOIigu
	/f+jANhD7W3RZVsxL5tFr7hZqfTpobtBEFXJj1fdiqpqHdTMethhgFm80PRC5m0B
	qLVQBQPPyeJpcWmxwTe80ZewvDp8swMu0zNG30pjdA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47vamtyund-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 10:46:46 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 56GAb9Nv029275;
	Wed, 16 Jul 2025 10:46:45 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47vamtyun8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 10:46:45 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56G85IN6032758;
	Wed, 16 Jul 2025 10:46:44 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 47v48m6qm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 10:46:44 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56GAkfkM56033622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Jul 2025 10:46:41 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0802520040;
	Wed, 16 Jul 2025 10:46:41 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9ACAF2004F;
	Wed, 16 Jul 2025 10:46:28 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.124.218.71])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Jul 2025 10:46:28 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>
Cc: Srikar Dronamraju <srikar@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Tyrel Datwyler <tyreld@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] pseries/lparcfg: Add resource group monitoring
Date: Wed, 16 Jul 2025 16:15:56 +0530
Message-ID: <20250716104600.59102-1-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SU0_NJGuHiCeTmK2NL1oRzJx4xm1-C_1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA5NyBTYWx0ZWRfX4VqNS/585M8m g81yN2OLm+9NEUAKsakJQCVOayG7HLeVmfVEJBj96JA1j6VinKRULrftA/kqk/EGm/UIKipUaFR FVu2vEVG/N3ZW2XKCCHmrYPz+NPXBmDHglLX7a3OfHWqHmdRhZWIKK9OSgLN1uMhsY7Raswp6TY
 IzHPqDFp+01SQidxLuiAXSsAArgChT4U9GjWLAdaTyMrPvgwmWcvEFF79npJgpdgXOmnurpfkuh a3qMcVmJQRWgwChzRPHzLdEpXAB0rO0CbYhfVMHQY8FMmAS0ds4TKZVjfXX8L5qltFLwoBRYFMP 9LcyxXUZr0zxDZsclOjKQUERS9xzVXKHvxqidd6CeaH3GAAslS83wvADJGida/CQBWWtgpNtUGC
 TLTG1tTZ0C+jPXIAY39VoVCaubDltarJ1zTSwyNyM8VaO+WKmDVU0/u7jHlk8QSJVbqA37sb
X-Proofpoint-ORIG-GUID: TN-bvG1558SMrA6g5EhXibK3QgUoh9Iy
X-Authority-Analysis: v=2.4 cv=dNSmmPZb c=1 sm=1 tr=0 ts=68778316 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=1UX6Do5GAAAA:8 a=voM4FWlXAAAA:8 a=VwQbUJbxAAAA:8
 a=RM_-vzHYNNEx3VRC2tQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Et2XPkok5AAZYJIKzHr1:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1011 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160097
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Systems can now be partitioned into resource groups. By default all
systems will be part of default resource group. Once a resource group is
created, and resources allocated to the resource group, those resources
will be removed from the default resource group. If a LPAR moved to a
resource group, then it can only use resources in the resource group.

So maximum processors that can be allocated to a LPAR can be equal or
smaller than the resources in the resource group.

lparcfg can now exposes the resource group id to which this LPAR belongs
to. It also exposes the number of processors in the current resource
group. The default resource group id happens to be 0. These would be
documented in the upcoming PAPR update.

Example of an LPAR in a default resource group
root@ltcp11-lp3 $ grep resource_group /proc/powerpc/lparcfg
resource_group_number=0
resource_group_active_processors=50
root@ltcp11-lp3 $

Example of an LPAR in a non-default resource group
root@ltcp11-lp5 $ grep resource_group /proc/powerpc/lparcfg
resource_group_number=1
resource_group_active_processors=30
root@ltcp11-lp5 $

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: "Thomas Weißschuh" <thomas.weissschuh@linutronix.de>
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index cc22924f159f..6554537984fb 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -78,6 +78,8 @@ struct hvcall_ppp_data {
 	u8	capped;
 	u8	weight;
 	u8	unallocated_weight;
+	u8      resource_group_index;
+	u16     active_procs_in_resource_group;
 	u16	active_procs_in_pool;
 	u16	active_system_procs;
 	u16	phys_platform_procs;
@@ -86,7 +88,7 @@ struct hvcall_ppp_data {
 };
 
 /*
- * H_GET_PPP hcall returns info in 4 parms.
+ * H_GET_PPP hcall returns info in 5 parms.
  *  entitled_capacity,unallocated_capacity,
  *  aggregation, resource_capability).
  *
@@ -94,11 +96,11 @@ struct hvcall_ppp_data {
  *  R5 = Unallocated Processor Capacity Percentage.
  *  R6 (AABBCCDDEEFFGGHH).
  *      XXXX - reserved (0)
- *          XXXX - reserved (0)
+ *          XXXX - Active Cores in Resource Group
  *              XXXX - Group Number
  *                  XXXX - Pool Number.
  *  R7 (IIJJKKLLMMNNOOPP).
- *      XX - reserved. (0)
+ *      XX - Resource group Number
  *        XX - bit 0-6 reserved (0).   bit 7 is Capped indicator.
  *          XX - variable processor Capacity Weight
  *            XX - Unallocated Variable Processor Capacity Weight.
@@ -120,9 +122,11 @@ static unsigned int h_get_ppp(struct hvcall_ppp_data *ppp_data)
 	ppp_data->entitlement = retbuf[0];
 	ppp_data->unallocated_entitlement = retbuf[1];
 
+	ppp_data->active_procs_in_resource_group = (retbuf[2] >> 4 * 8) & 0xffff;
 	ppp_data->group_num = (retbuf[2] >> 2 * 8) & 0xffff;
 	ppp_data->pool_num = retbuf[2] & 0xffff;
 
+	ppp_data->resource_group_index = (retbuf[3] >> 7 *  8) & 0xff;
 	ppp_data->capped = (retbuf[3] >> 6 * 8) & 0x01;
 	ppp_data->weight = (retbuf[3] >> 5 * 8) & 0xff;
 	ppp_data->unallocated_weight = (retbuf[3] >> 4 * 8) & 0xff;
@@ -236,6 +240,13 @@ static void parse_ppp_data(struct seq_file *m)
 	seq_printf(m, "unallocated_capacity=%lld\n",
 		   ppp_data.unallocated_entitlement);
 
+	if (ppp_data.active_procs_in_resource_group)  {
+		seq_printf(m, "resource_group_number=%d\n",
+				ppp_data.resource_group_index);
+		seq_printf(m, "resource_group_active_processors=%d\n",
+				ppp_data.active_procs_in_resource_group);
+	}
+
 	/* The last bits of information returned from h_get_ppp are only
 	 * valid if the ibm,partition-performance-parameters-level
 	 * property is >= 1.
-- 
2.43.0


