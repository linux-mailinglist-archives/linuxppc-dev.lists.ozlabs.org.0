Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0712445EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 09:47:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSbBB6TCgzDqlZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 17:47:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AoqIGXIT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSb8L2Q3bzDqk7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 17:45:38 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07E7VAnK136076; Fri, 14 Aug 2020 03:45:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=eWmE0Ve6vBkReUWrtIhxA8N4aRZd43/r+zKHR+N7Tz0=;
 b=AoqIGXITgYdtE27OPb+5wAV0Sk4u+UHQHtnFPyxxm/UoPSIVZsJMCFY3JlMhEbgNFzX9
 7UnH26ta6lOwA7BFjTuYvzNuYy29FA5Q4OLRVdKuFENzf7RUgH9nJapuN3oklUQ5Iofm
 GBYwJ5KKRJANVxK6lULDjC4NpDofdAZwtNOKESKW1+klSXRNLg/zL+1VgfQ/Q8gdPGTX
 ZNd5VwZ55UEtJXU9shbCJ4s/Yf+psKIg/3X3B6+Yrbbk6HO0RFlKIYCQLwGvwvWGE6Cg
 Rtoqp5tqJOfcYWzEj5XuzRsE2ifw+Xn6sMyqTY0Ayd4JmV8cZ+K+sqv759QyW2mqKUxG 5g== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32w0n1dkse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 03:45:30 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07E7YsKF016392;
 Fri, 14 Aug 2020 07:45:29 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 32skp8ec3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 07:45:28 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07E7jQJS60817756
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Aug 2020 07:45:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F52A4204C;
 Fri, 14 Aug 2020 07:45:26 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E37734203F;
 Fri, 14 Aug 2020 07:45:24 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.85.87.35])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Aug 2020 07:45:24 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc: Add POWER10 raw mode cputable entry
Date: Fri, 14 Aug 2020 13:15:20 +0530
Message-Id: <20200814074520.3667973-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-14_02:2020-08-13,
 2020-08-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 adultscore=0 suspectscore=1 bulkscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 mlxlogscore=946 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008140054
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a raw mode cputable entry for POWER10. Copies most of the fields
from commit a3ea40d5c736 ("powerpc: Add POWER10 architected mode")
except for oprofile_cpu_type, machine_check_early, pvr_mask and pvr_mask
fields. On bare metal systems we use DT CPU features, which doesn't need a
cputable entry. But in VMs we still rely on the raw cputable entry to
set the correct values for the PMU related fields.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
- Fixed function undeclared compiler error.

 arch/powerpc/kernel/cputable.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index b4066354f0730..bb0c7f43a8283 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -75,6 +75,7 @@ extern void __restore_cpu_power10(void);
 extern long __machine_check_early_realmode_p7(struct pt_regs *regs);
 extern long __machine_check_early_realmode_p8(struct pt_regs *regs);
 extern long __machine_check_early_realmode_p9(struct pt_regs *regs);
+extern long __machine_check_early_realmode_p10(struct pt_regs *regs);
 #endif /* CONFIG_PPC64 */
 #if defined(CONFIG_E500)
 extern void __setup_cpu_e5500(unsigned long offset, struct cpu_spec* spec);
@@ -541,6 +542,25 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check_early	= __machine_check_early_realmode_p9,
 		.platform		= "power9",
 	},
+	{	/* Power10 */
+		.pvr_mask		= 0xffff0000,
+		.pvr_value		= 0x00800000,
+		.cpu_name		= "POWER10 (raw)",
+		.cpu_features		= CPU_FTRS_POWER10,
+		.cpu_user_features	= COMMON_USER_POWER10,
+		.cpu_user_features2	= COMMON_USER2_POWER10,
+		.mmu_features		= MMU_FTRS_POWER10,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.oprofile_cpu_type	= "ppc64/power10",
+		.oprofile_type		= PPC_OPROFILE_INVALID,
+		.cpu_setup		= __setup_cpu_power10,
+		.cpu_restore		= __restore_cpu_power10,
+		.machine_check_early	= __machine_check_early_realmode_p10,
+		.platform		= "power10",
+	},
 	{	/* Cell Broadband Engine */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x00700000,
-- 
2.26.2

