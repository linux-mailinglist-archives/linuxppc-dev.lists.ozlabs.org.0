Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9B8253CC8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 06:36:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcVLY4dwQzDqP4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 14:36:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mT0VOAQp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcTmC0cmLzDqSx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 14:10:34 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R42gqg089231; Thu, 27 Aug 2020 00:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8tTZH76Fl2lipTwZ0DHB/hVM09vGb5PM4dDNUmtrWvI=;
 b=mT0VOAQpCS/1ntaEI1mjONLmm7L6oTEw2WxYno9fryiUqFITuBVCkqppjmcr2ZHeQeLW
 B0bOqx7aUDt0pXHrAVrc8aZmqQASAG1CeutrlXcCH4h8xNFCbEDNMO9q8EaUti6W9n66
 0B0Rt39uehZtrvHOr2mfz6FodbZpevDylOMQ14TkqNfh9WDZSziAVs3ZDN9AHKCnHmlx
 L4KWFDaMjnUHqUocKB2BY0XjgbIYSIwhXnQNO2HmALFqiqH2tKIoHNdJmj1bvgh2VTjP
 HGAcLyOca9EqWb8//NtxYKFX17W+0xz1rJxHx2FWmdH4IC4p3GrW3zDhtc6px0xGmPLC OQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3365da87rf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 00:10:30 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R46rY1016350;
 Thu, 27 Aug 2020 04:10:28 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 332uw7pxve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 04:10:28 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R4AS3V51249566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 04:10:28 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7099928059;
 Thu, 27 Aug 2020 04:10:28 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C27228058;
 Thu, 27 Aug 2020 04:10:27 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.74.195])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 04:10:26 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 14/23] powerpc/ptrace-view: Use pt_regs values instead of
 thread_struct based one.
Date: Thu, 27 Aug 2020 09:39:22 +0530
Message-Id: <20200827040931.297759-15-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
References: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_14:2020-08-26,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008270028
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We will remove thread.amr/iamr/uamor in a later patch

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/kernel/ptrace/ptrace-view.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index 7e6478e7ed07..c719e29aff76 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -470,12 +470,12 @@ static int pkey_active(struct task_struct *target, const struct user_regset *reg
 static int pkey_get(struct task_struct *target, const struct user_regset *regset,
 		    struct membuf to)
 {
-	BUILD_BUG_ON(TSO(amr) + sizeof(unsigned long) != TSO(iamr));
 
 	if (!arch_pkeys_enabled())
 		return -ENODEV;
 
-	membuf_write(&to, &target->thread.amr, 2 * sizeof(unsigned long));
+	membuf_store(&to, target->thread.regs->kuap);
+	membuf_store(&to, target->thread.regs->kuep);
 	return membuf_store(&to, default_uamor);
 }
 
@@ -508,7 +508,8 @@ static int pkey_set(struct task_struct *target, const struct user_regset *regset
 	 * Pick the AMR values for the keys that kernel is using. This
 	 * will be indicated by the ~default_uamor bits.
 	 */
-	target->thread.amr = (new_amr & default_uamor) | (target->thread.amr & ~default_uamor);
+	target->thread.regs->kuap = (new_amr & default_uamor) |
+		(target->thread.regs->kuap & ~default_uamor);
 
 	return 0;
 }
-- 
2.26.2

