Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CA95B68D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 09:42:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRb620bYzz3c8C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 17:42:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UmemFSud;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UmemFSud;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRb3w0JmLz2xkn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 17:40:43 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28D6oLMD027346;
	Tue, 13 Sep 2022 07:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=e7efDCTLlElnxE9vWG3Kl7X0HfBBw+jWSWtVn0AApJg=;
 b=UmemFSudIPl5aWHyohYo2I9bZJHYmEWTr9Z/Tij1UhrHjmUL7ZxvN752miqqYPPd5v1s
 d6BZVEhS84qnNoGljMtD9lt7RoSseiPmn2wb9VdI+cKcowMpzFdUJkCZaq5bZDunC0jL
 gdUITsdGXrLhHRlV+VFSldYh+5G+HUMNTUPnK8pvERSAFGLkpOOVLfIuYnHF5+IdFzx5
 74ZsEukNojl+K7T8UKLa80VJO2HTUHmCEZgnOEYmZI4A/aNA+SIpEFNLbBZJxTmKLQ1h
 cWGCqWrhcgeVtTpZhzoQgtmaXxxoi1ddbXoH1Gx0SPIj+nvoJh61Q5nihEO81ADN4Lg/ XA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjmxtjem9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:40:38 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28D7JLaE016076;
	Tue, 13 Sep 2022 07:40:38 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjmxtjekf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:40:37 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28D7ZhbE023090;
	Tue, 13 Sep 2022 07:40:36 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03fra.de.ibm.com with ESMTP id 3jgj78thq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:40:36 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28D7eW6O30736752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Sep 2022 07:40:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9505BAE056;
	Tue, 13 Sep 2022 07:40:32 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B4A6AE045;
	Tue, 13 Sep 2022 07:40:31 +0000 (GMT)
Received: from disgoel-ibm-com.in.ibm.com (unknown [9.199.154.114])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 13 Sep 2022 07:40:31 +0000 (GMT)
From: Disha Goel <disgoel@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/4] powerpc/asm-offset: Remove unused KVM_RADIX macros
Date: Tue, 13 Sep 2022 13:10:23 +0530
Message-Id: <20220913074025.132160-3-disgoel@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220913074025.132160-1-disgoel@linux.vnet.ibm.com>
References: <20220913074025.132160-1-disgoel@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1vS_9NJ9esyaqigq98quTRopePA2ROWV
X-Proofpoint-ORIG-GUID: E2oZEj1KyLKT6_7yM4JJJPbcVz-dgIdn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_02,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 mlxlogscore=841 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130033
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, npiggin@gmail.com, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 9769a7fd79b6 ("KVM: PPC: Book3S HV: Remove radix
guest support from P7/8 path") removed the radix guest
support from P7/8 path since the P9 path now supports of
all the supported radix guest. But missed to remove
KVM_RADIX from the asm-offset. Patch fixes by removing it.

Fixes: 9769a7fd79b6 ("KVM: PPC: Book3S HV: Remove radix guest support from P7/8 path")
Signed-off-by: Disha Goel <disgoel@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/asm-offsets.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index d5d9c1dcef1c..88a329d74d23 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -424,7 +424,6 @@ int main(void)
 	OFFSET(KVM_HOST_SDR1, kvm, arch.host_sdr1);
 	OFFSET(KVM_ENABLED_HCALLS, kvm, arch.enabled_hcalls);
 	OFFSET(KVM_VRMA_SLB_V, kvm, arch.vrma_slb_v);
-	OFFSET(KVM_RADIX, kvm, arch.radix);
 	OFFSET(KVM_SECURE_GUEST, kvm, arch.secure_guest);
 	OFFSET(VCPU_DSISR, kvm_vcpu, arch.shregs.dsisr);
 	OFFSET(VCPU_DAR, kvm_vcpu, arch.shregs.dar);
-- 
2.31.1

