Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6E222ABD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 11:32:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC6Yt18WfzDrMr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 19:32:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC63M6V4gzDrFY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 19:09:35 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06N93YbY188832; Thu, 23 Jul 2020 05:09:27 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32f1gxgy5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 05:09:26 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06N93hS3190179;
 Thu, 23 Jul 2020 05:09:26 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32f1gxgy4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 05:09:26 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N96B9J017349;
 Thu, 23 Jul 2020 09:09:23 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 32brq837cp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 09:09:23 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06N99J7463766918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 09:09:19 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DEEE4C05A;
 Thu, 23 Jul 2020 09:09:19 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 285D84C052;
 Thu, 23 Jul 2020 09:09:14 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.40.160])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jul 2020 09:09:13 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v5 08/10] powerpc/watchpoint: Guest support for 2nd DAWR hcall
Date: Thu, 23 Jul 2020 14:38:11 +0530
Message-Id: <20200723090813.303838-9-ravi.bangoria@linux.ibm.com>
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

2nd DAWR can be set/unset using H_SET_MODE hcall with resource value 5.
Enable powervm guest support with that. This has no effect on kvm guest
because kvm will return error if guest does hcall with resource value 5.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h         | 1 +
 arch/powerpc/include/asm/machdep.h        | 2 +-
 arch/powerpc/include/asm/plpar_wrappers.h | 5 +++++
 arch/powerpc/kernel/dawr.c                | 2 +-
 arch/powerpc/platforms/pseries/setup.c    | 7 +++++--
 5 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index b785e9f0071c..33793444144c 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -358,6 +358,7 @@
 #define H_SET_MODE_RESOURCE_SET_DAWR0		2
 #define H_SET_MODE_RESOURCE_ADDR_TRANS_MODE	3
 #define H_SET_MODE_RESOURCE_LE			4
+#define H_SET_MODE_RESOURCE_SET_DAWR1		5
 
 /* Values for argument to H_SIGNAL_SYS_RESET */
 #define H_SIGNAL_SYS_RESET_ALL			-1
diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 7bcb64444a39..a90b892f0bfe 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -131,7 +131,7 @@ struct machdep_calls {
 				    unsigned long dabrx);
 
 	/* Set DAWR for this platform, leave empty for default implementation */
-	int		(*set_dawr)(unsigned long dawr,
+	int		(*set_dawr)(int nr, unsigned long dawr,
 				    unsigned long dawrx);
 
 #ifdef CONFIG_PPC32	/* XXX for now */
diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index d12c3680d946..ece84a430701 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -315,6 +315,11 @@ static inline long plpar_set_watchpoint0(unsigned long dawr0, unsigned long dawr
 	return plpar_set_mode(0, H_SET_MODE_RESOURCE_SET_DAWR0, dawr0, dawrx0);
 }
 
+static inline long plpar_set_watchpoint1(unsigned long dawr1, unsigned long dawrx1)
+{
+	return plpar_set_mode(0, H_SET_MODE_RESOURCE_SET_DAWR1, dawr1, dawrx1);
+}
+
 static inline long plpar_signal_sys_reset(long cpu)
 {
 	return plpar_hcall_norets(H_SIGNAL_SYS_RESET, cpu);
diff --git a/arch/powerpc/kernel/dawr.c b/arch/powerpc/kernel/dawr.c
index 500f52fa4711..cdc2dccb987d 100644
--- a/arch/powerpc/kernel/dawr.c
+++ b/arch/powerpc/kernel/dawr.c
@@ -37,7 +37,7 @@ int set_dawr(int nr, struct arch_hw_breakpoint *brk)
 	dawrx |= (mrd & 0x3f) << (63 - 53);
 
 	if (ppc_md.set_dawr)
-		return ppc_md.set_dawr(dawr, dawrx);
+		return ppc_md.set_dawr(nr, dawr, dawrx);
 
 	if (nr == 0) {
 		mtspr(SPRN_DAWR0, dawr);
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 2db8469e475f..d516ee8eb7fc 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -831,12 +831,15 @@ static int pseries_set_xdabr(unsigned long dabr, unsigned long dabrx)
 	return plpar_hcall_norets(H_SET_XDABR, dabr, dabrx);
 }
 
-static int pseries_set_dawr(unsigned long dawr, unsigned long dawrx)
+static int pseries_set_dawr(int nr, unsigned long dawr, unsigned long dawrx)
 {
 	/* PAPR says we can't set HYP */
 	dawrx &= ~DAWRX_HYP;
 
-	return  plpar_set_watchpoint0(dawr, dawrx);
+	if (nr == 0)
+		return plpar_set_watchpoint0(dawr, dawrx);
+	else
+		return plpar_set_watchpoint1(dawr, dawrx);
 }
 
 #define CMO_CHARACTERISTICS_TOKEN 44
-- 
2.26.2

