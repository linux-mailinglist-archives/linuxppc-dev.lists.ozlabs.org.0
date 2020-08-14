Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC1B24440D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 06:01:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSV9b2kJHzDqjJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 14:01:23 +1000 (AEST)
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
 header.s=pp1 header.b=oevmrpEO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSV7M0r4RzDqXC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 13:59:26 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07E3Vm1F064330; Thu, 13 Aug 2020 23:59:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=yDHexnyrwpx9799KU2I1nPPJXnGG63RtxlZ3mEFP+Yg=;
 b=oevmrpEO5+6WxAATv/ruDTdvRp8NpmLHPZjqwzQuiOo4xkmEgJSk61l/y2YBlF9VX1BB
 rVUDwDHxf0HRQ1AX+1rk7zyPiZWlv7Tu9trBIsDE3O2xswK/6itBI34FeO3/ls1W6DfX
 995V3vEEjNbZbLcVLfGHhOb3HUkNnp4k4HVqK9gEtjffcomZbumGmGNcSPr76MGVOOAY
 m3WTXZg54FY89S8DPA7IbeaMG5+hpPxYLh+9KgEtOUUcF+EJ70Z5zJPtiSwIBPMTYkZv
 L+sNmjD9qRKDvGPxfl0i1LYBvFbbkBIv13eZZRodgb6KaKvYAfm61SlA+kaboaiFg2Co sQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32w706kprb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 23:59:17 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07E3sd5s007348;
 Fri, 14 Aug 2020 03:59:15 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 32skp7utv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 03:59:15 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07E3xCkZ28770784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Aug 2020 03:59:12 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 939145204F;
 Fri, 14 Aug 2020 03:59:12 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.85.91.57])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 78B7F5204E;
 Fri, 14 Aug 2020 03:59:11 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc: Add POWER10 raw mode cputable entry
Date: Fri, 14 Aug 2020 09:29:03 +0530
Message-Id: <20200814035903.3179314-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-14_01:2020-08-13,
 2020-08-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=1 adultscore=0 malwarescore=0
 mlxlogscore=939 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008140023
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
filed. On bare metal systems we use DT CPU features, which doesn't need a
cputable entry. But in VMs we still rely on the raw cputable entry to
set the correct values for the PMU related fields.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/kernel/cputable.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index b4066354f0730..1e052f53e5dca 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -541,6 +541,25 @@ static struct cpu_spec __initdata cpu_specs[] = {
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

