Return-Path: <linuxppc-dev+bounces-3822-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBCB9E5308
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 11:54:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3rqW17t1z2yNs;
	Thu,  5 Dec 2024 21:54:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733393500;
	cv=none; b=HAu3Sn1wKet7rlm6Tx+kfHhyaOdK65SudgDrdP5L1YjtO8Wei8D4WXcexpcOAH/raq70YYMGxD+xlvMNwtImb5DYurxD4FDmxVGmKhKcyS7LTAeNwc+5gcd0L5pJSBoLX0EVqG6xy7cjhAMUDVizbHbtz0vR1cjAOvPh4OauC7H907sPdRMDBjZiTe+Jt5AszEW4rBQ1VnPDlbHUqiezG/Gk8IfqpKx7l8Cb9XVTAQv2/XdQIkSli1AEG8nkwLvmKy40NrykDio8c0BWF11QcBKCn1P/dotez9Uom/YYpRWsdoKO4Td7Wl/Ub/yfPfQuJMgt0T79IOn1F892Eq1hHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733393500; c=relaxed/relaxed;
	bh=0fGKn3URg7dNQUHHzyhwhgiGOLjZAj+7+Ns9W3X6Ndg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oN+zb58xL2hzgPCVKOBtKMUCibiKHPlycb5/ie0DJB++uwiGHVSoGNmMf4VAzu0W5TIdXUPrp1d9UFdwSoCcj88AomPv/lYZsaCvCXocLZuJOYeMaVKSTfNFyQXSh+Dvp9L7aY1Bzk4MoIGjdUAl0Iv9XwrpbKChmZUzDCyazh0oHx7wn99F4uLkniQjWMru/VRCF4nM/MCDxYOVDRgpwOBEH/lhFzcb0QL/85YOG1TisHEsQsLu/A67pXfQfUKKtVLVyLXjpV9ZftiTkYqpd+0ntDdvXH3zB7lb8ySF4ZqG7SbgfNom7GpUgfYpIqTM4bvYEYI6E8O1AxnMmbOlgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m4jrmHAq; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=avnish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m4jrmHAq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=avnish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3qtL1fcsz2yFB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 21:11:37 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B59O1cC028221;
	Thu, 5 Dec 2024 10:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=0fGKn3URg7dNQUHHzyhwhgiGOLjZAj+7+Ns9W3X6N
	dg=; b=m4jrmHAqW4Vf+WWf847f112N3gI0gDvU6WDIxxJFqlHyyswhRCry60TqZ
	jB+vfrhPle+FuSdWF850i9ufQ7P/AL8AQJ63/z0vdP2dXgQxvfWt0p1wGkWOEV+E
	3brat+eVZH+whBmPHFnCkdJfxgwjdWaeKiXhPEGnXl+Ws0aNs8wWu7Wan5QZ0k92
	9O5tOu5o+VWfR+IZXDXsXT/MHwujLmaGjV3C8hL5VvLX96MHj30aytp6QRBqx9Fw
	0KF/xgpqKjHbvJDnGQFOc+kdEdPL3Em8cD2m56x6XGop3iHNED2OtxouKOYpKRIs
	2RjAJsPN3wTjCDTn6VrhR+ol8W78A==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ax65u50h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 10:11:29 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B59uMJ8020564;
	Thu, 5 Dec 2024 10:11:28 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 438d1shdmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 10:11:28 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B5ABKN931392066
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2024 10:11:21 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5852120065;
	Thu,  5 Dec 2024 10:11:20 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E784920073;
	Thu,  5 Dec 2024 10:11:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.152.67])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Dec 2024 10:11:18 +0000 (GMT)
From: Avnish Chouhan <avnish@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, brking@linux.ibm.com, meghanaprakash@in.ibm.com,
        sourabhjain@linux.ibm.com, maddy@linux.ibm.com,
        Avnish Chouhan <avnish@linux.ibm.com>
Subject: [PATCH] powerpc: increase MIN RMA size for CAS negotiation
Date: Thu,  5 Dec 2024 15:40:45 +0530
Message-ID: <20241205101045.27069-1-avnish@linux.ibm.com>
X-Mailer: git-send-email 2.46.0
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0jdc-wj4s_GfqhAy4FWJ7WOFOkoX9b1g
X-Proofpoint-GUID: 0jdc-wj4s_GfqhAy4FWJ7WOFOkoX9b1g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=743 malwarescore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0
 bulkscore=0 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412050070
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Change RMA size from 512 MB to 768 MB which will result 
in more RMA at boot time for PowerPC. When PowerPC LPAR use/uses vTPM,
Secure Boot or FADump, the 512 MB RMA memory is not sufficient for 
booting. With this 512 MB RMA, GRUB2 run out of memory and unable to 
load the necessary. Sometimes even usage of CDROM which requires more
memory for installation along with the options mentioned above troubles
the boot memory and result in boot failures. Increasing the RMA size 
will resolves multiple out of memory issues observed in PowerPC. 


Signed-off-by: Avnish Chouhan <avnish@linux.ibm.com>
---
 arch/powerpc/kernel/prom_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index fbb68fc28ed3..c42fd5a826c0 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -1061,7 +1061,7 @@ static const struct ibm_arch_vec ibm_architecture_vec_template __initconst = {
 		.virt_base = cpu_to_be32(0xffffffff),
 		.virt_size = cpu_to_be32(0xffffffff),
 		.load_base = cpu_to_be32(0xffffffff),
-		.min_rma = cpu_to_be32(512),		/* 512MB min RMA */
+		.min_rma = cpu_to_be32(768),		/* 768MB min RMA */
 		.min_load = cpu_to_be32(0xffffffff),	/* full client load */
 		.min_rma_percent = 0,	/* min RMA percentage of total RAM */
 		.max_pft_size = 48,	/* max log_2(hash table size) */
-- 
2.43.5


