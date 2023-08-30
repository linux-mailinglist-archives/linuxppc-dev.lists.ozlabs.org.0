Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA1478D550
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 12:57:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UG/YQaGj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbLpY6xZqz3cTW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 20:57:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UG/YQaGj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbLkp5wbsz3bX1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 20:53:54 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37UADi4X024752;
	Wed, 30 Aug 2023 10:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=H7sB8FNo2hCMDf3fAD1CSdM7f7rOQLfvI5hlgRjL4xI=;
 b=UG/YQaGjaXDYFtnE/IKm+kx/YQfnEZMN36mmK2vwGWrp4nDvL62DSHpeRXE+re3n68jm
 8XmQ0VLQZTPWuS4USyUTDQ93CsopjkvQ6TJiqe435DokPz9hNPgTHYsfjE5sZ7Jry2Qt
 7/0O6mWPSVzeMmYCbWnMo2I0B0EF+H4fIcIMPAMjZqF+R3kwnOojG/Nz/XOwkv9FZUq0
 P4otOaUrcOUlsVsVcmHXVqhsdRg4P9obtOIsUj+Zv/QJLOsyI6g1xJ8uQ3mVxeq4EZ5e
 V6Qv/p2q2A3jkBweoo8Ns5dLaAnKZ73mQw88AnU2qoFI+ycWrdVMbmxw2qdc7qh6C+rY sg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3st360j1jw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 10:53:37 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37UAa4LP029312;
	Wed, 30 Aug 2023 10:53:36 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3st360j1j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 10:53:36 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37U8cHWu009967;
	Wed, 30 Aug 2023 10:53:34 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sqw7kk1xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 10:53:34 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37UArWGB15663618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Aug 2023 10:53:32 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC7BD2004D;
	Wed, 30 Aug 2023 10:53:32 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 253F220040;
	Wed, 30 Aug 2023 10:53:28 +0000 (GMT)
Received: from saptarishi.in.ibm.com (unknown [9.43.8.96])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Aug 2023 10:53:27 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/4] powerpc/smp: Move shared_processor static key to smp.h
Date: Wed, 30 Aug 2023 16:22:42 +0530
Message-ID: <20230830105244.62477-3-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830105244.62477-1-srikar@linux.vnet.ibm.com>
References: <20230830105244.62477-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: A2uaoWiWyjL7ha3P5cIJwy2m8KwOCNVs
X-Proofpoint-ORIG-GUID: aJibNW_AvqP4RJZbSxOOnRuYtDMNszS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=729
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300098
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
Cc: Juergen Gross <jgross@suse.com>, Nathan Lynch <nathanl@linux.ibm.com>, Valentin Schneider <vschneid@redhat.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Paul E McKenney <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
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
index f5ba1a3c41f8..3bc8cff97f9a 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -14,13 +14,6 @@
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
@@ -71,11 +64,6 @@ static inline void yield_to_any(void)
 	plpar_hcall_norets_notrace(H_CONFER, -1, 0);
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
2.41.0

