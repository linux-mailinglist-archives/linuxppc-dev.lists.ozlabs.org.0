Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E6F24649B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 12:36:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVVp70LpwzDqV3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 20:36:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oB5JsfIN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVVX13XdSzDqSH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 20:24:17 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07HA1wjZ186848; Mon, 17 Aug 2020 06:24:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eTv4eDDzdAcCNwcF32va34swuL93aDFIkhfN2V8mRag=;
 b=oB5JsfINYqHM+flRuNtFpKu15BatCpFg0WzwEwAQcCdDQJ4ggZJGoZVmI1T8X5YC2oRl
 v08o6fxiM5D6f4NfX34Mg3pRmj1iPNGvD8f+ecDrAHvOXbV58ezOAOkQSl9yD6HWtAOY
 AN/T5AsCLqx9HZUJqulAIpkvx6iqJ5RdxPE9mBWccDNNQ0MPuzoNRnXDDfWPkasG/xw5
 g2e5rVW8bECtZUnzySZPXFnhhA8lTFFOX5ok8S9J+rGDLpCs6SCKFSmHG2dKZBVXNlJC
 Kl37g/RsbU4v2S4SuHvOjlqb44SkBPhM/oJDUe5ZKHCYOOWxxjPwkY/1T6brhBg+kYJN yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32y85ycj37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 06:24:11 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07HA2oVw191622;
 Mon, 17 Aug 2020 06:24:11 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32y85ycj27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 06:24:10 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07HAM1Qq030597;
 Mon, 17 Aug 2020 10:24:08 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 32x6ygt4am-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 10:24:08 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07HAO35731064428
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 10:24:04 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF7C74C040;
 Mon, 17 Aug 2020 10:24:03 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E9114C046;
 Mon, 17 Aug 2020 10:24:01 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.37.13])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Aug 2020 10:24:01 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, christophe.leroy@c-s.fr
Subject: [PATCH v4 5/6] powerpc/watchpoint/ptrace: Introduce
 PPC_DEBUG_FEATURE_DATA_BP_ARCH_31
Date: Mon, 17 Aug 2020 15:53:29 +0530
Message-Id: <20200817102330.777537-6-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817102330.777537-1-ravi.bangoria@linux.ibm.com>
References: <20200817102330.777537-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_02:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008170071
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, rogealve@br.ibm.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, jniethe5@gmail.com,
 pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PPC_DEBUG_FEATURE_DATA_BP_ARCH_31 can be used to determine whether
we are running on an ISA 3.1 compliant machine. Which is needed to
determine DAR behaviour, 512 byte boundary limit etc. This was
requested by Pedro Miraglia Franco de Carvalho for extending
watchpoint features in gdb. Note that availability of 2nd DAWR is
independent of this flag and should be checked using
ppc_debug_info->num_data_bps.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 Documentation/powerpc/ptrace.rst          | 1 +
 arch/powerpc/include/uapi/asm/ptrace.h    | 1 +
 arch/powerpc/kernel/ptrace/ptrace-noadv.c | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/Documentation/powerpc/ptrace.rst b/Documentation/powerpc/ptrace.rst
index 864d4b6dddd1..77725d69eb4a 100644
--- a/Documentation/powerpc/ptrace.rst
+++ b/Documentation/powerpc/ptrace.rst
@@ -46,6 +46,7 @@ features will have bits indicating whether there is support for::
   #define PPC_DEBUG_FEATURE_DATA_BP_RANGE		0x4
   #define PPC_DEBUG_FEATURE_DATA_BP_MASK		0x8
   #define PPC_DEBUG_FEATURE_DATA_BP_DAWR		0x10
+  #define PPC_DEBUG_FEATURE_DATA_BP_ARCH_31		0x20
 
 2. PTRACE_SETHWDEBUG
 
diff --git a/arch/powerpc/include/uapi/asm/ptrace.h b/arch/powerpc/include/uapi/asm/ptrace.h
index f5f1ccc740fc..7004cfea3f5f 100644
--- a/arch/powerpc/include/uapi/asm/ptrace.h
+++ b/arch/powerpc/include/uapi/asm/ptrace.h
@@ -222,6 +222,7 @@ struct ppc_debug_info {
 #define PPC_DEBUG_FEATURE_DATA_BP_RANGE		0x0000000000000004
 #define PPC_DEBUG_FEATURE_DATA_BP_MASK		0x0000000000000008
 #define PPC_DEBUG_FEATURE_DATA_BP_DAWR		0x0000000000000010
+#define PPC_DEBUG_FEATURE_DATA_BP_ARCH_31	0x0000000000000020
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
index 081c39842d84..1d0235db3c1b 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-noadv.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
@@ -57,6 +57,8 @@ void ppc_gethwdinfo(struct ppc_debug_info *dbginfo)
 	} else {
 		dbginfo->features = 0;
 	}
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		dbginfo->features |= PPC_DEBUG_FEATURE_DATA_BP_ARCH_31;
 }
 
 int ptrace_get_debugreg(struct task_struct *child, unsigned long addr,
-- 
2.26.2

