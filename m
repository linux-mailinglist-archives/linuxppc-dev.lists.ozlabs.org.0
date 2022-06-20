Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4825510F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 09:05:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRLJd2YzLz3dyS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 17:05:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TVt7vfFp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRLD32hsDz3bxt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 17:01:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TVt7vfFp;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LRLD32Zqrz4xZG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 17:01:39 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4LRLD32XGZz4xZZ; Mon, 20 Jun 2022 17:01:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TVt7vfFp;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4LRLD26dFgz4xZG
	for <linuxppc-dev@ozlabs.org>; Mon, 20 Jun 2022 17:01:38 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25K51ogI022738;
	Mon, 20 Jun 2022 07:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=CvWZ3PajcfKopraRcXPzIMHbKK7uQcUw2xmW8pvp/uc=;
 b=TVt7vfFpu6BxgGmbELCBah9J+boehgy5Celn+JN8a8E6TgF3OUfAZz+AUTGDAmbHzwMU
 jZWG5DQ8dI8C2sXpSqUmIbmLhItQGh9Hq3qbB8/Sc2a7KImNxXoBDo8EXlQbBMPidhEN
 zV3FZNGIeo5lyA/yYmiyXqLqMUqatgD7Tax+/cgtUWC+JusherW2L8XzZfvuHXnLVi0L
 TVzKM8aY7+G1ZnDyZO7mURliDHFxsiWWUP2zq/KwfieDrhjNqESgZi3l+ndPIQHr7+fA
 0li4V1OgKZJ7L1/2UfiU4rcIK4d8wES9sgUoXNU6D4gtfIOCqJoN81FqEUaXO6p6hWto nw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gsrs78hwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jun 2022 07:01:30 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25K6J0Op012619;
	Mon, 20 Jun 2022 07:01:30 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gsrs78hvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jun 2022 07:01:30 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25K6pgfO015474;
	Mon, 20 Jun 2022 07:01:28 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3gs6b92213-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jun 2022 07:01:28 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25K71PXk21758282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jun 2022 07:01:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EED6A4040;
	Mon, 20 Jun 2022 07:01:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AD98A4051;
	Mon, 20 Jun 2022 07:01:23 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.109.136])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 20 Jun 2022 07:01:22 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 5/5] powerpc/crash hp: add crash page helper functions
Date: Mon, 20 Jun 2022 12:31:06 +0530
Message-Id: <20220620070106.93141-6-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620070106.93141-1-sourabhjain@linux.ibm.com>
References: <20220620070106.93141-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nukIKnCn3mNVHLBsmtRKzcEA84kDLeoN
X-Proofpoint-ORIG-GUID: gtPalnjuF1zQAaVygnwnHvw6Emg0ScDv
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_04,2022-06-17_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206200030
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
Cc: eric.devolder@oracle.com, bhe@redhat.com, mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, ldufour@linux.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Define arch_[un]map_crash_pages functions to avoid build issues due to
undefined arch specific function to access crash memory pages.

A temporary patch to avoid build issues may need some changes in
generic code to avoid this.

The issue is under discussion:
https://lkml.org/lkml/2022/6/20/22

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kexec/core_64.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 373cb46bcc0e..d833fa96dcfa 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -492,6 +492,13 @@ int update_cpus_node(void *fdt)
 
 #if defined(CONFIG_HOTPLUG_CPU)
 
+void *arch_map_crash_pages(unsigned long paddr, unsigned long size)
+{
+	return __va(paddr);
+}
+
+void arch_unmap_crash_pages(void **ptr) { }
+
 int crash_hotplug_support(void) { return 1; }
 
 /**
-- 
2.36.1

