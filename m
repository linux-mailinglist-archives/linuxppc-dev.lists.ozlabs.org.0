Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F55131D8A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 03:18:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sGJ41pG4zDqNJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 13:18:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sGGK3Pj3zDqVd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 13:16:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47sGGK02nsz8t70
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 13:16:41 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47sGGJ6SwXz9sR8; Tue,  7 Jan 2020 13:16:40 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sukadev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47sGGJ2fDRz9sR0;
 Tue,  7 Jan 2020 13:16:39 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0072CSkf097666; Mon, 6 Jan 2020 21:16:37 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xb8nypqve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 21:16:37 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0072GKKG002386;
 Tue, 7 Jan 2020 02:16:36 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 2xajb5ybhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jan 2020 02:16:36 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0072GZwP44499214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jan 2020 02:16:35 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FE9ABE051;
 Tue,  7 Jan 2020 02:16:35 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25E37BE04F;
 Tue,  7 Jan 2020 02:16:35 +0000 (GMT)
Received: from suka-w540.localdomain (unknown [9.70.94.45])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jan 2020 02:16:35 +0000 (GMT)
Received: by suka-w540.localdomain (Postfix, from userid 1000)
 id 83A6C2E0EE6; Mon,  6 Jan 2020 18:16:33 -0800 (PST)
Date: Mon, 6 Jan 2020 18:16:33 -0800
From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: powerpc/xmon: don't access ASDR in VMs
Message-ID: <20200107021633.GB29843@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux 2.0.32 on an i486
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_08:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 mlxlogscore=820
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001070016
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From 91a77dbea3c909ff15c66cded37f1334304a293d Mon Sep 17 00:00:00 2001
From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Date: Mon, 6 Jan 2020 13:50:02 -0600
Subject: [PATCH 1/1] powerpc/xmon: don't access ASDR in VMs

ASDR is HV-privileged and must only be accessed in HV-mode.
Fixes a Program Check (0x700) when xmon in a VM dumps SPRs.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
---
 arch/powerpc/xmon/xmon.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 02fae453c2ec..b8d179b5cf4f 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1949,15 +1949,14 @@ static void dump_300_sprs(void)
 
 	printf("pidr   = %.16lx  tidr  = %.16lx\n",
 		mfspr(SPRN_PID), mfspr(SPRN_TIDR));
-	printf("asdr   = %.16lx  psscr = %.16lx\n",
-		mfspr(SPRN_ASDR), hv ? mfspr(SPRN_PSSCR)
-					: mfspr(SPRN_PSSCR_PR));
+	printf("psscr  = %.16lx\n",
+		hv ? mfspr(SPRN_PSSCR) : mfspr(SPRN_PSSCR_PR));
 
 	if (!hv)
 		return;
 
-	printf("ptcr   = %.16lx\n",
-		mfspr(SPRN_PTCR));
+	printf("ptcr   = %.16lx  asdr  = %.16lx\n",
+		mfspr(SPRN_PTCR), mfspr(SPRN_ASDR));
 #endif
 }
 
-- 
2.17.2

