Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BCF7CE30E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 18:41:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZXlSWsvm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9c725vK1z3f0P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 03:41:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZXlSWsvm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9c671tLwz2xZG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 03:40:31 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39IGc2n4031758;
	Wed, 18 Oct 2023 16:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6neTOFrs0VpzQCpiQ5eqZP/1xUu3gV7Y6cJcNWkT3dE=;
 b=ZXlSWsvmrS5gAlxSXlZC8Xa3qV4EkyJqd25v8FL89sA2eJLkN8M8svL9MGoXII0+Q2+V
 kE6/VMRAM1DmbxF34FlmW/SO8U/nLSGkGXPkaH62P1pizaQjVR6D4+OPqFokyV+/f89C
 d8V1QHc+IEEBsIPmpdUcsTksTyApLuAJuz3AA2TsA2vnnfsXSPRcDefLJ31Dnk+4Uubv
 MS0UriuYpa/SXUokkWe05ejLz+TVkE36HsFHpcKS0gGne2lAS4c02LXdq1mVhYWX3c4Y
 TqI2+6DuZuZeR8GO7OANFoUJZpj/MlI0gSKLfQ4RC4OnpY1Asjupq5moOpEJDkcUQMOz Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ttjn413hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 16:40:15 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39IGcBoU032385;
	Wed, 18 Oct 2023 16:39:38 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ttjn40vut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 16:39:38 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39IFSdti027177;
	Wed, 18 Oct 2023 16:38:19 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr6tkhvnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 16:38:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39IGcHGF17105470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Oct 2023 16:38:17 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3121C2004B;
	Wed, 18 Oct 2023 16:38:17 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9EAC20049;
	Wed, 18 Oct 2023 16:38:13 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.43.47.66])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Oct 2023 16:38:13 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 3/6] powerpc/smp: Move shared_processor static key to smp.h
Date: Wed, 18 Oct 2023 22:07:43 +0530
Message-ID: <20231018163751.2423181-4-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
References: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 23DZZcsu80wNom_eFt3vDqy-hoFxjry0
X-Proofpoint-GUID: T51MEs9XAoj6v_JKyaeG342_6IVln8iw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_15,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=870 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310180135
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
Cc: Valentin Schneider <vschneid@redhat.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, x86@kernel.org, Ajay Kaher <akaher@vmware.com>, virtualization@lists.linux-foundation.org, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Alexey Makhalov <amakhalov@vmware.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ability to detect if the system is running in a shared processor
mode is helpful in few more generic cases not just in
paravirtualization.
For example: At boot time, different scheduler/ topology flags may be
set based on the processor mode. Hence move it to a more generic file.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/paravirt.h | 12 ------------
 arch/powerpc/include/asm/smp.h      | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index 0372b0093f72..cf83e837a571 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -15,13 +15,6 @@
 #include <asm/kvm_guest.h>
 #include <asm/cputhreads.h>
 
-DECLARE_STATIC_KEY_FALSE(shared_processor);
-
-static inline bool is_shared_processor(void)
-{
-	return static_branch_unlikely(&shared_processor);
-}
-
 #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
 extern struct static_key paravirt_steal_enabled;
 extern struct static_key paravirt_steal_rq_enabled;
@@ -77,11 +70,6 @@ static inline bool is_vcpu_idle(int vcpu)
 	return lppaca_of(vcpu).idle;
 }
 #else
-static inline bool is_shared_processor(void)
-{
-	return false;
-}
-
 static inline u32 yield_count_of(int cpu)
 {
 	return 0;
diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index aaaa576d0e15..08631b2a4528 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -34,6 +34,20 @@ extern bool coregroup_enabled;
 extern int cpu_to_chip_id(int cpu);
 extern int *chip_id_lookup_table;
 
+#ifdef CONFIG_PPC_SPLPAR
+DECLARE_STATIC_KEY_FALSE(shared_processor);
+
+static inline bool is_shared_processor(void)
+{
+	return static_branch_unlikely(&shared_processor);
+}
+#else
+static inline bool is_shared_processor(void)
+{
+	return false;
+}
+#endif
+
 DECLARE_PER_CPU(cpumask_var_t, thread_group_l1_cache_map);
 DECLARE_PER_CPU(cpumask_var_t, thread_group_l2_cache_map);
 DECLARE_PER_CPU(cpumask_var_t, thread_group_l3_cache_map);
-- 
2.31.1

