Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 276267A79D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 12:58:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=desHKqgb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrFqx6NVDz3cHT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 20:58:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=desHKqgb;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrFq26wcRz2ysB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 20:57:18 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RrFq16QWJz4xP9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 20:57:17 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RrFq166wVz4xLy; Wed, 20 Sep 2023 20:57:17 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=desHKqgb;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=name@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RrFq12t2Mz4wxd;
	Wed, 20 Sep 2023 20:57:17 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38KAcudp014140;
	Wed, 20 Sep 2023 10:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IL4FGjj0ehfriwcVdGHNwQjLEl0otDJYeQ9ZwC5HPR4=;
 b=desHKqgbo0Q3hcTwbDuT3aZl0/oOvNuQ3ddNEK5oLUjo8LxVc/K4AomRjp6S8xm+SaWW
 RqlZsMtkk45/txlPPCx5Ucu2Xpt6hO35+Pa7tCmMtsT7XCJt3gtCc5tIz33wWgQvtEzn
 BwqMdVR+jDYpbubTl8ukx7Dq+XnBqFhvLp9YacNo7+kyKS3zhIFJdZ026xPwM6ef5OeW
 JHX4l++Xz2GgRPaPn+Ux4iBMxags7g39azkvHB/EmgAW8XC3zIDYOM+8o/rsJs/I76bi
 GY9b80k8gMhEGYU2JecSCq9psOq3htVJv619jM7F2oksg8Y0An/OGBp2VvusYv5ixT4J HQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t7xhg9k8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 10:57:15 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38KAGxoE005533;
	Wed, 20 Sep 2023 10:57:14 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t5q2yw9k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 10:57:13 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38KAvAdH14680612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Sep 2023 10:57:10 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDCE62004B;
	Wed, 20 Sep 2023 10:57:10 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6826820040;
	Wed, 20 Sep 2023 10:57:09 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.in.ibm.com (unknown [9.109.199.72])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 20 Sep 2023 10:57:09 +0000 (GMT)
From: Aditya Gupta <adityag@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 2/2] powerpc: add cpu_spec.cpu_features to vmcoreinfo
Date: Wed, 20 Sep 2023 16:27:06 +0530
Message-ID: <20230920105706.853626-2-adityag@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920105706.853626-1-adityag@linux.ibm.com>
References: <20230920105706.853626-1-adityag@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: o_7wWOrEBYY541lKXmVNsN3b6pMfchG6
X-Proofpoint-GUID: o_7wWOrEBYY541lKXmVNsN3b6pMfchG6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_05,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxlogscore=616 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309200084
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
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CPU features can be determined in makedumpfile, using
'cur_cpu_spec.cpu_features'.

This provides more data to makedumpfile about the crashed system, and
can help in filtering the vmcore accordingly.

Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
---
 arch/powerpc/kexec/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index 369b8334a4f0..0d70c7ea820c 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -64,6 +64,7 @@ void arch_crash_save_vmcoreinfo(void)
 	VMCOREINFO_SYMBOL(contig_page_data);
 #endif
 	VMCOREINFO_SYMBOL(cur_cpu_spec);
+	VMCOREINFO_OFFSET(cpu_spec, cpu_features);
 	VMCOREINFO_OFFSET(cpu_spec, mmu_features);
 #if defined(CONFIG_PPC64) && defined(CONFIG_SPARSEMEM_VMEMMAP)
 	VMCOREINFO_SYMBOL(vmemmap_list);
-- 
2.41.0

