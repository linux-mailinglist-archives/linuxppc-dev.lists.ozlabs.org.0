Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B01D3146032
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 02:06:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4833yJ1S4NzDqTW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 12:06:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sukadev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4833wL6KZyzDqMM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 12:05:06 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00N10dAm139244; Wed, 22 Jan 2020 20:05:01 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xp963a4af-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 20:05:00 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00N13lrI011375;
 Thu, 23 Jan 2020 01:04:59 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 2xksn6sv7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 01:04:59 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00N14vaR34275738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jan 2020 01:04:57 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A3FA6E052;
 Thu, 23 Jan 2020 01:04:57 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85E2B6E04E;
 Thu, 23 Jan 2020 01:04:57 +0000 (GMT)
Received: from suka-w540.localdomain (unknown [9.70.94.45])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jan 2020 01:04:57 +0000 (GMT)
Received: by suka-w540.localdomain (Postfix, from userid 1000)
 id E69C62E0F41; Wed, 22 Jan 2020 17:04:55 -0800 (PST)
Date: Wed, 22 Jan 2020 17:04:55 -0800
From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/xmon: Fix compile error in print_insn* functions
Message-ID: <20200123010455.GA15080@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux 2.0.32 on an i486
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-22_08:2020-01-22,
 2020-01-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-2001230005
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From 72a7497a8673c93a4b80aa4fc38b88a8e90aa650 Mon Sep 17 00:00:00 2001
From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Date: Wed, 22 Jan 2020 18:57:18 -0600
Subject: [PATCH 1/1] powerpc/xmon: Fix compile error in print_insn* functions

Fix couple of compile errors I stumbled upon with CONFIG_XMON=y and
CONFIG_XMON_DISASSEMBLY=n

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
---
 arch/powerpc/xmon/dis-asm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/xmon/dis-asm.h b/arch/powerpc/xmon/dis-asm.h
index c4d246ebca37..c4c982d6402e 100644
--- a/arch/powerpc/xmon/dis-asm.h
+++ b/arch/powerpc/xmon/dis-asm.h
@@ -13,13 +13,13 @@ extern int print_insn_spu(unsigned long insn, unsigned long memaddr);
 #else
 static inline int print_insn_powerpc(unsigned long insn, unsigned long memaddr)
 {
-	printf("%.8x", insn);
+	printf("%.8lx", insn);
 	return 0;
 }
 
 static inline int print_insn_spu(unsigned long insn, unsigned long memaddr)
 {
-	printf("%.8x", insn);
+	printf("%.8lx", insn);
 	return 0;
 }
 #endif
-- 
2.18.1

