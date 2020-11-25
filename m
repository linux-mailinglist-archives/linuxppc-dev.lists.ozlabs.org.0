Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EEA2C38D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 06:42:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgqXX4hrjzDqZL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 16:42:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kAlQI/eF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgpzs5JRdzDqX2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 16:17:29 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AP51Krc171294; Wed, 25 Nov 2020 00:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3EUtAkoiYeRKfK/T1IVMaY7TGUyQ9f2dbfS1pCJ8SUY=;
 b=kAlQI/eFxjgedAo9GFqRgze64AKud1Ncf5IQnau2iVg/f27hIh9xV1SxjxHEaTJOEP5p
 oP8CdcUVAXeCJiH0OsRdkK0mA9O3a8eSfbGle6SnoN2Z53E+7w6FRkowzNbvy1P/sqq2
 eDzd3tElRD7Zht2O6myassfCl7+7Rsefpnwr1PYy3NtGxKcdZTbrBXIzl5tibRvmfVtH
 ENv4gMJGEHElvkqT/lHPBm+Xq0Bv8vexjlRDr1Go47nzuIhLLVIK4KMSBLb7XVk3W/pj
 LK/G6iH1+pzM1/Pcg9ROkhGjquHIn4PlDPMCDwG094zjGcyTBWPaG3uIO66KVN2wVz+j eg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3513uwxh1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 00:17:24 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AP5CGI9003086;
 Wed, 25 Nov 2020 05:17:24 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 34xth94uvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 05:17:24 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AP5HOUO10682882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 05:17:24 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1700124054;
 Wed, 25 Nov 2020 05:17:23 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65030124053;
 Wed, 25 Nov 2020 05:17:22 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.77.195.3])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 05:17:22 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 13/22] powerpc/ptrace-view: Use pt_regs values instead of
 thread_struct based one.
Date: Wed, 25 Nov 2020 10:46:25 +0530
Message-Id: <20201125051634.509286-14-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_07:2020-11-24,
 2020-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240121
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
index 7e6478e7ed07..bdbe8cfdafc7 100644
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
+	membuf_store(&to, target->thread.regs->amr);
+	membuf_store(&to, target->thread.regs->iamr);
 	return membuf_store(&to, default_uamor);
 }
 
@@ -508,7 +508,8 @@ static int pkey_set(struct task_struct *target, const struct user_regset *regset
 	 * Pick the AMR values for the keys that kernel is using. This
 	 * will be indicated by the ~default_uamor bits.
 	 */
-	target->thread.amr = (new_amr & default_uamor) | (target->thread.amr & ~default_uamor);
+	target->thread.regs->amr = (new_amr & default_uamor) |
+		(target->thread.regs->amr & ~default_uamor);
 
 	return 0;
 }
-- 
2.28.0

