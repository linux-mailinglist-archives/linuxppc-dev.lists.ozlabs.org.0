Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 710A23514A9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 14:00:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB1wD34Xfz3bwN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 23:00:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ewhhZEqP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=parth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ewhhZEqP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB1vY1h75z2yqD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 22:59:52 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 131BXkAW139976; Thu, 1 Apr 2021 07:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Cw8wlhjvzScD1ZY2xlirHJZDoapHZiTRjUnDP1/H0VE=;
 b=ewhhZEqP4iuZiQo9VjXWEJrUGh4FUul7yCB1wl/A336U7QocgTA778abTywkSJ06LYSx
 kqpu9sGxe7yNBdQvSuPJ8OkfnO0wMb3ftuTg8XVFaef6g0oqLd0o1UzxEruKo4PQTRHj
 NIPlSa37CNiAzuvxIif5SnbCPxrPzDPcHjbNnIR7Os5ozGEkSRMinTdMn+Tg3/T+3cGO
 fvn5h3rWaIkEyP9KdV1t9PnPK/l3vDFzWEgKP09JLo//lX6JOUU3Kh+KacUfLb/hjt18
 7z0bnVbmM0e/d3ZMkCrtO34tmef+OBzpLbQB+Pu/wSlINnYsfGdVGw4bEOR8FC1ejvz1 Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37n9nx7vsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 07:59:47 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 131BYSLP145137;
 Thu, 1 Apr 2021 07:59:47 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37n9nx7vsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 07:59:47 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 131Bwhwr009694;
 Thu, 1 Apr 2021 11:59:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 37n28trfbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 11:59:45 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 131Bxgid28246330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Apr 2021 11:59:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1BFB4204F;
 Thu,  1 Apr 2021 11:59:42 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68A3442042;
 Thu,  1 Apr 2021 11:59:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.32.50])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Apr 2021 11:59:40 +0000 (GMT)
From: Parth Shah <parth@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC 2/2] sched: Use H_IDLE_HINT hcall to find if a vCPU can be
 wakeup target
Date: Thu,  1 Apr 2021 17:29:22 +0530
Message-Id: <20210401115922.1524705-3-parth@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210401115922.1524705-1-parth@linux.ibm.com>
References: <20210401115922.1524705-1-parth@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gZZ1W3Kp7SVMoBrojinjFTZadmcpLYoG
X-Proofpoint-ORIG-GUID: n2T78Y6bdU3CenboJqXp0HTI4gBOeC86
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-01_04:2021-03-31,
 2021-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103310000 definitions=main-2104010082
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, srikar@linux.vnet.ibm.com,
 npiggin@gmail.com, paulus@samba.org, svaidy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During checking for an available_idle_cpu, if the vCPU is yielded then
check if it will be scheduled instantly by hypervisor or not. From guestOS,
use H_IDLE_HINT hcall to ask for this hint from the hypverisor, and
consider the yielded vCPU as target for wakeups iff it is hinted to be
scheduled instantly.

Signed-off-by: Parth Shah <parth@linux.ibm.com>
---
 arch/powerpc/include/asm/paravirt.h | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index edc08f04aef7..c7dd0368e1a4 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -41,6 +41,15 @@ static inline void yield_to_any(void)
 {
 	plpar_hcall_norets(H_CONFER, -1, 0);
 }
+
+/* Find if the previous physical CPU of this vcpu is available_idle or not */
+static inline void pcpu_available_instantly(int vcpu, unsigned long *is_idle)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
+
+	if (plpar_hcall(H_IDLE_HINT, retbuf, vcpu) == H_SUCCESS)
+		*is_idle = retbuf[0];
+}
 #else
 static inline bool is_shared_processor(void)
 {
@@ -75,6 +84,8 @@ static inline void prod_cpu(int cpu)
 #define vcpu_is_preempted vcpu_is_preempted
 static inline bool vcpu_is_preempted(int cpu)
 {
+	unsigned long is_idle = 0;
+
 	if (!is_shared_processor())
 		return false;
 
@@ -92,8 +103,14 @@ static inline bool vcpu_is_preempted(int cpu)
 	}
 #endif
 
-	if (yield_count_of(cpu) & 1)
-		return true;
+	if (yield_count_of(cpu) & 1) {
+#ifdef CONFIG_PPC_SPLPAR
+		pcpu_available_instantly(cpu, &is_idle);
+#endif
+
+		if (!is_idle)
+			return true;
+	}
 	return false;
 }
 
-- 
2.26.2

