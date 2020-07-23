Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EDF22ABC3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 11:29:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC6Vg3VbhzDqt0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 19:29:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC63H1CmlzDr9H
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 19:09:31 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06N93Xf0188762; Thu, 23 Jul 2020 05:09:20 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32f1gxgy30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 05:09:20 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06N94Pje195084;
 Thu, 23 Jul 2020 05:09:20 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32f1gxgy1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 05:09:20 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N96erH017409;
 Thu, 23 Jul 2020 09:09:17 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 32brq837cn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 09:09:17 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06N97nn362062976
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 09:07:49 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B50714C044;
 Thu, 23 Jul 2020 09:09:13 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B1924C04A;
 Thu, 23 Jul 2020 09:09:07 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.40.160])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jul 2020 09:09:06 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v5 07/10] powerpc/watchpoint: Rename current H_SET_MODE DAWR
 macro
Date: Thu, 23 Jul 2020 14:38:10 +0530
Message-Id: <20200723090813.303838-8-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200723090813.303838-1-ravi.bangoria@linux.ibm.com>
References: <20200723090813.303838-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_03:2020-07-22,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230069
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, rogealve@br.ibm.com,
 miltonm@us.ibm.com, peterz@infradead.org, fweisbec@gmail.com, oleg@redhat.com,
 npiggin@gmail.com, linux-kernel@vger.kernel.org, paulus@samba.org,
 jolsa@kernel.org, jniethe5@gmail.com, pedromfc@br.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Current H_SET_MODE hcall macro name for setting/resetting DAWR0 is
H_SET_MODE_RESOURCE_SET_DAWR. Add suffix 0 to macro name as well.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Reviewed-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/hvcall.h         | 2 +-
 arch/powerpc/include/asm/plpar_wrappers.h | 2 +-
 arch/powerpc/kvm/book3s_hv.c              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 43486e773bd6..b785e9f0071c 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -355,7 +355,7 @@
 
 /* Values for 2nd argument to H_SET_MODE */
 #define H_SET_MODE_RESOURCE_SET_CIABR		1
-#define H_SET_MODE_RESOURCE_SET_DAWR		2
+#define H_SET_MODE_RESOURCE_SET_DAWR0		2
 #define H_SET_MODE_RESOURCE_ADDR_TRANS_MODE	3
 #define H_SET_MODE_RESOURCE_LE			4
 
diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index 4293c5d2ddf4..d12c3680d946 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -312,7 +312,7 @@ static inline long plpar_set_ciabr(unsigned long ciabr)
 
 static inline long plpar_set_watchpoint0(unsigned long dawr0, unsigned long dawrx0)
 {
-	return plpar_set_mode(0, H_SET_MODE_RESOURCE_SET_DAWR, dawr0, dawrx0);
+	return plpar_set_mode(0, H_SET_MODE_RESOURCE_SET_DAWR0, dawr0, dawrx0);
 }
 
 static inline long plpar_signal_sys_reset(long cpu)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6bf66649ab92..7ad692c2d7c7 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -764,7 +764,7 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu, unsigned long mflags,
 			return H_P3;
 		vcpu->arch.ciabr  = value1;
 		return H_SUCCESS;
-	case H_SET_MODE_RESOURCE_SET_DAWR:
+	case H_SET_MODE_RESOURCE_SET_DAWR0:
 		if (!kvmppc_power8_compatible(vcpu))
 			return H_P2;
 		if (!ppc_breakpoint_available())
-- 
2.26.2

