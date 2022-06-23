Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 094C3557C3F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 14:56:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTKyY6HB1z3cDF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 22:56:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RplvLkMb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RplvLkMb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTKxs11DDz304J
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 22:56:16 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NCkAH7027821;
	Thu, 23 Jun 2022 12:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7sIyFuOtHOpvmFw81UmfalRVnGpe0SvxZAHJL0J7x9k=;
 b=RplvLkMbN1F3TVCYsnPSvHDnTKauRq15he8CL+XfvgUfeK0Y+Mejy+LEW24xVMGcFiva
 1VYH/wwoRYFeId24zMU9LO0zgOD0EOWhgSrNAcQ97d5ADcgsToBtUR/HXb0WS2CsJrKr
 i4EF7Dt8+aJS8cCG3xPfySlZz7pRIAEm98wDQ7+IeFILHa6cPw5g5OKxm5xoo/p+fjTm
 guVRcdrAuOd/PIfUMnnWiFUdNoxv2Yf0QhbBSkfRa7h+OD2HI2cEUMYwrMDTjofgk8LD
 T4S5B269rgYsLr9GgcdQ9mwGmb+PLohewO4kfg4udlXzULZcfKwJjsxFrVEaji7N+Hk6 Ow== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gvpu83dfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jun 2022 12:56:11 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25NCpVUP024879;
	Thu, 23 Jun 2022 12:56:11 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma03wdc.us.ibm.com with ESMTP id 3gs6bashc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jun 2022 12:56:11 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25NCstGh19202518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jun 2022 12:54:56 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D80B96A047;
	Thu, 23 Jun 2022 12:54:55 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B27456A054;
	Thu, 23 Jun 2022 12:54:53 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.18.68])
	by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jun 2022 12:54:53 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 2/2] powerpc/numa: Return the first online node if device tree mapping returns a not online node
Date: Thu, 23 Jun 2022 18:24:42 +0530
Message-Id: <20220623125442.645240-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623125442.645240-1-aneesh.kumar@linux.ibm.com>
References: <20220623125442.645240-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5G7RwQFsYN6emERL_jGBNf659gwmoUoX
X-Proofpoint-ORIG-GUID: 5G7RwQFsYN6emERL_jGBNf659gwmoUoX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_05,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206230050
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While building the cpu_to_node map make sure we always use the online node
to build the mapping table. In general this should not be an issue
because the kernel use similar lookup mechanism (vphn_get_nid()) to mark
nodes online (setup_node_data()). Hence NUMA nodes we find during
lookup in numa_setup_cpu() will always be found online.

To keep logic simpler/correct, make sure that if the hypervisor
or device tree returned a not online node, don't use that to build
the map table. Instead, use the first_online_node.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 0801b2ce9b7d..f387b9eb9dc9 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -741,7 +741,7 @@ static int numa_setup_cpu(unsigned long lcpu)
 	of_node_put(cpu);
 
 out_present:
-	if (nid < 0 || !node_possible(nid))
+	if (nid < 0 || !node_online(nid))
 		nid = first_online_node;
 
 	/*
-- 
2.36.1

