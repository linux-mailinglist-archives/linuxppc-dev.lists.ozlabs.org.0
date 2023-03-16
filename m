Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2FB6BC581
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 06:11:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pcb303qMwz3cj6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 16:11:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tsVH5q5c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tsVH5q5c;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pcb230dZbz3c3W
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 16:10:50 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32G4E5UM023769;
	Thu, 16 Mar 2023 05:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gBh+7d1v5a1i2yuAyTGRn8ECStMfSXE34UF0EajWmeA=;
 b=tsVH5q5c1QBsi2kPhap8Wpym6aZ6R98h4PCdg3uL+PqYHaMgOUP8HYXgm0RnOBTN1KqS
 V4qWqWX0EKqjYOQmOp6np71+v9sq18URYMck8uNaGovZZelOgux42bKhehhTlHTGbUUa
 0Wt1x15KAUQdOZgR0r5cX3v3UEMvTBrsFfYWSChI24zBoW+xDr4xNGssq4bV0EQKJL5h
 JnryGR7WntRo992UOwJav4VJi85UUGdaZBkJBdlxv8U81kJYLPECqr9gzWqMlTz1kBdf
 Lgjv1YoID9niaEU5d7YfREZNtZeBy3qCwelSlhXvH9FRDogTWNVYljdIdtDJ8ftO7P01 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbpwbyg7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 05:10:41 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32G577nq026445;
	Thu, 16 Mar 2023 05:10:40 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbpwbyg6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 05:10:40 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32G1SXrD016471;
	Thu, 16 Mar 2023 05:10:38 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pbsf3g6ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 05:10:38 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32G5AYZR17105532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Mar 2023 05:10:34 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5CF92004D;
	Thu, 16 Mar 2023 05:10:34 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC3CA2004B;
	Thu, 16 Mar 2023 05:10:32 +0000 (GMT)
Received: from r223l.aus.stglabs.ibm.com (unknown [9.3.109.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Mar 2023 05:10:32 +0000 (GMT)
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH v3 1/2] arch/powerpc/kvm: kvmppc_hv_entry: remove .global scope
Date: Thu, 16 Mar 2023 01:10:24 -0400
Message-Id: <20230316051025.1424093-2-kconsul@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316051025.1424093-1-kconsul@linux.vnet.ibm.com>
References: <20230316051025.1424093-1-kconsul@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LnL88fGPp73G5UFtoa_PeBCbbzJI0B99
X-Proofpoint-GUID: p-nIySiaNmJYwHauruBPO4-on59gWuHD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_02,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160042
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kautuk Consul <kconsul@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kvmppc_hv_entry isn't called from anywhere other than
book3s_hv_rmhandlers.S itself. Removing .global scope for
this function and annotating it with SYM_INNER_LABEL.

Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index acf80915f406..b81ba4ee0521 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -502,8 +502,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
  *                                                                            *
  *****************************************************************************/
 
-.global kvmppc_hv_entry
-kvmppc_hv_entry:
+SYM_INNER_LABEL(kvmppc_hv_entry, SYM_L_LOCAL)
 
 	/* Required state:
 	 *
-- 
2.39.2

