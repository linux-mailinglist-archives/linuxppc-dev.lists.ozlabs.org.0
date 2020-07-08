Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74589217EC7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 07:05:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1nLc5T3CzDr4d
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 15:05:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1n2b6QHjzDr1D
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 14:51:35 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0684VqBi026692; Wed, 8 Jul 2020 00:51:27 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3256kqh3ev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 00:51:26 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0684Xbxv030659;
 Wed, 8 Jul 2020 00:51:26 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3256kqh3eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 00:51:26 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0684oq2Z002020;
 Wed, 8 Jul 2020 04:51:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3251w8g455-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 04:51:24 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0684pLLu63570400
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 04:51:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73283AE04D;
 Wed,  8 Jul 2020 04:51:21 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7637AE055;
 Wed,  8 Jul 2020 04:51:17 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.51.84])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 Jul 2020 04:51:17 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v3 6/9] powerpc/watchpoint: Rename current H_SET_MODE DAWR
 macro
Date: Wed,  8 Jul 2020 10:20:43 +0530
Message-Id: <20200708045046.135702-7-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708045046.135702-1-ravi.bangoria@linux.ibm.com>
References: <20200708045046.135702-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_01:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 cotscore=-2147483648 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007080024
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, apopple@linux.ibm.com,
 peterz@infradead.org, fweisbec@gmail.com, miltonm@us.ibm.com, oleg@redhat.com,
 npiggin@gmail.com, linux-kernel@vger.kernel.org, paulus@samba.org,
 jolsa@kernel.org, pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Current H_SET_MODE hcall macro name for setting/resetting DAWR0 is
H_SET_MODE_RESOURCE_SET_DAWR. Add suffix 0 to macro name as well.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h         | 2 +-
 arch/powerpc/include/asm/plpar_wrappers.h | 2 +-
 arch/powerpc/kvm/book3s_hv.c              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index e90c073e437e..a7f6f1aeda6b 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -354,7 +354,7 @@
 
 /* Values for 2nd argument to H_SET_MODE */
 #define H_SET_MODE_RESOURCE_SET_CIABR		1
-#define H_SET_MODE_RESOURCE_SET_DAWR		2
+#define H_SET_MODE_RESOURCE_SET_DAWR0		2
 #define H_SET_MODE_RESOURCE_ADDR_TRANS_MODE	3
 #define H_SET_MODE_RESOURCE_LE			4
 
diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index 4497c8afb573..93eb133d572c 100644
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

