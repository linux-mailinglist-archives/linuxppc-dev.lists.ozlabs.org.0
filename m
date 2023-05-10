Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4736FD479
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 05:39:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGLP30qlKz3fk0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 13:39:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T/H5nqP+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T/H5nqP+;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGLDh47Dlz3chV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 13:32:04 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A3DMok014933;
	Wed, 10 May 2023 03:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1fHfXaNGaB+iSJ2OiPJB4LdnyDdYad3AsPBd9J6ei5o=;
 b=T/H5nqP+a/lH7gXHaY0zw9rTQ8lxBqeT0LEt3D3pjwJG06v8zUUl4974FzW7nBwsnZby
 dZkXFUlFAdIsBB4bvtrXSzmWRbl/pXSBNxqm0eK1pqXI5v30NQmwiBgk1n7L6DQxBhwx
 woCuaygMhosbBQx1qzrp9qM8JfOqRJhH2yNCQUUzZydDmB6CwAsO3NGeB4aIZCY1B2xt
 lI8cuUet1cbacmX7i+FVjQpQ2XGVb28NveR9U4vOfXb6sncb7IdFPouJLD8ykIBcsEvm
 Ne4eftboZGXsmf4P2KHyT5Ms76sovUw+0TSNB8d/mOKJlBy8HEO/NcJwlCaBna/GaDQe +A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg35urb2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:40 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34A3VeQM032603;
	Wed, 10 May 2023 03:31:40 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg35urb28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:40 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34A0vAS1016703;
	Wed, 10 May 2023 03:31:38 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3qf7mhgmvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:38 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34A3VZY615794924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 May 2023 03:31:36 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE81F20063;
	Wed, 10 May 2023 03:31:35 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 430F820043;
	Wed, 10 May 2023 03:31:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 May 2023 03:31:35 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 196E8605DC;
	Wed, 10 May 2023 13:31:30 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/11] powerpc: Mark writes registering ipi to host cpu through kvm and polling
Date: Wed, 10 May 2023 13:31:14 +1000
Message-Id: <20230510033117.1395895-9-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230510033117.1395895-1-rmclure@linux.ibm.com>
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dFpI8EYqb-O5DhPOHYOln4V7bQTum27n
X-Proofpoint-GUID: 7ZO4dAdI5MH-xVLHR-OEhl5KtRs5jRuS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=490 spamscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100021
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
Cc: arnd@arndb.de, gautam@linux.ibm.com, npiggin@gmail.com, Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mark writes to hypervisor ipi state so that KCSAN recognises these
asynchronous issue of kvmppc_{set,clear}_host_ipi to be intended, with
atomic writes. Mark asynchronous polls to this variable in
kvm_ppc_read_one_intr().

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v2: Add read-side annotations to both polling locations in
kvm_ppc_read_one_intr().
---
 arch/powerpc/include/asm/kvm_ppc.h   | 4 ++--
 arch/powerpc/kvm/book3s_hv_builtin.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index bc57d058ad5b..d701df006c08 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -548,12 +548,12 @@ static inline void kvmppc_set_host_ipi(int cpu)
 	 * pairs with the barrier in kvmppc_clear_host_ipi()
 	 */
 	smp_mb();
-	paca_ptrs[cpu]->kvm_hstate.host_ipi = 1;
+	WRITE_ONCE(paca_ptrs[cpu]->kvm_hstate.host_ipi, 1);
 }
 
 static inline void kvmppc_clear_host_ipi(int cpu)
 {
-	paca_ptrs[cpu]->kvm_hstate.host_ipi = 0;
+	WRITE_ONCE(paca_ptrs[cpu]->kvm_hstate.host_ipi, 0);
 	/*
 	 * order clearing of host_ipi flag vs. processing of IPI messages
 	 *
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index da85f046377a..0f5b021fa559 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -406,7 +406,7 @@ static long kvmppc_read_one_intr(bool *again)
 		return 1;
 
 	/* see if a host IPI is pending */
-	host_ipi = local_paca->kvm_hstate.host_ipi;
+	host_ipi = READ_ONCE(local_paca->kvm_hstate.host_ipi);
 	if (host_ipi)
 		return 1;
 
@@ -466,7 +466,7 @@ static long kvmppc_read_one_intr(bool *again)
 		 * meantime. If it's clear, we bounce the interrupt to the
 		 * guest
 		 */
-		host_ipi = local_paca->kvm_hstate.host_ipi;
+		host_ipi = READ_ONCE(local_paca->kvm_hstate.host_ipi);
 		if (unlikely(host_ipi != 0)) {
 			/* We raced with the host,
 			 * we need to resend that IPI, bummer
-- 
2.37.2

