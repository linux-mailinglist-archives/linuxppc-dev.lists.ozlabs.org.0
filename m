Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8593B18F3A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 12:29:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mBxM4TpJzDqJM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 22:29:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mBsZ4TJxzDqsw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 22:26:26 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02NB3T20112129
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 07:26:24 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywejv0k6x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 07:26:23 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Mon, 23 Mar 2020 11:26:20 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 23 Mar 2020 11:26:17 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02NBQGYQ58523758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 11:26:16 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E2F0AE059;
 Mon, 23 Mar 2020 11:26:16 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1F2DAE04D;
 Mon, 23 Mar 2020 11:26:13 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.203.173.30])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Mar 2020 11:26:13 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc xmon: drop the option `i` in cacheflush
Date: Mon, 23 Mar 2020 16:55:48 +0530
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20032311-0028-0000-0000-000003E9E2D5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032311-0029-0000-0000-000024AF483B
Message-Id: <20200323112548.1077440-1-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_03:2020-03-21,
 2020-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=449
 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003230065
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com,
 Balamuruhan S <bala24@linux.ibm.com>, paulus@samba.org, sandipan@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Data Cache Block Invalidate (dcbi) instruction implemented in 32-bit
designs prior to PowerPC architecture version 2.01 and got obsolete
from version 2.01. Attempt to use of this illegal instruction results
in a hypervisor emulation assistance interrupt. So, drop the option
`i` in cacheflush xmon and continue using `dcbf`.

0:mon> fi
cpu 0x0: Vector: 700 (Program Check) at [c000000003be74a0]
    pc: c000000000102030: cacheflush+0x180/0x1a0
    lr: c000000000101f3c: cacheflush+0x8c/0x1a0
    sp: c000000003be7730
   msr: 8000000000081033
  current = 0xc0000000035e5c00
  paca    = 0xc000000001910000   irqmask: 0x03   irq_happened: 0x01
    pid   = 1025, comm = bash
Linux version 5.6.0-rc5-g5aa19adac (root@ltc-wspoon6) (gcc version 7.4.0
(Ubuntu 7.4.0-1ubuntu1~18.04.1)) #1 SMP Tue Mar 10 04:38:41 CDT 2020
cpu 0x0: Exception 700 (Program Check) in xmon, returning to main loop
[c000000003be7c50] c00000000084abb0 __handle_sysrq+0xf0/0x2a0
[c000000003be7d00] c00000000084b3c0 write_sysrq_trigger+0xb0/0xe0
[c000000003be7d30] c0000000004d1edc proc_reg_write+0x8c/0x130
[c000000003be7d60] c00000000040dc7c __vfs_write+0x3c/0x70
[c000000003be7d80] c000000000410e70 vfs_write+0xd0/0x210
[c000000003be7dd0] c00000000041126c ksys_write+0xdc/0x130
[c000000003be7e20] c00000000000b9d0 system_call+0x5c/0x68
--- Exception: c01 (System Call) at 00007fffa345e420
SP (7ffff0b08ab0) is in userspace

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/xmon/xmon.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 0ec9640335bb..d287bf2a54be 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -335,11 +335,6 @@ static inline void cflush(void *p)
 	asm volatile ("dcbf 0,%0; icbi 0,%0" : : "r" (p));
 }
 
-static inline void cinval(void *p)
-{
-	asm volatile ("dcbi 0,%0; icbi 0,%0" : : "r" (p));
-}
-
 /**
  * write_ciabr() - write the CIABR SPR
  * @ciabr:	The value to write.
@@ -1791,29 +1786,16 @@ static void prregs(struct pt_regs *fp)
 
 static void cacheflush(void)
 {
-	int cmd;
 	unsigned long nflush;
 
-	cmd = inchar();
-	if (cmd != 'i')
-		termch = cmd;
-	scanhex((void *)&adrs);
-	if (termch != '\n')
-		termch = 0;
 	nflush = 1;
 	scanhex(&nflush);
 	nflush = (nflush + L1_CACHE_BYTES - 1) / L1_CACHE_BYTES;
 	if (setjmp(bus_error_jmp) == 0) {
 		catch_memory_errors = 1;
 		sync();
-
-		if (cmd != 'i') {
-			for (; nflush > 0; --nflush, adrs += L1_CACHE_BYTES)
-				cflush((void *) adrs);
-		} else {
-			for (; nflush > 0; --nflush, adrs += L1_CACHE_BYTES)
-				cinval((void *) adrs);
-		}
+		for (; nflush > 0; --nflush, adrs += L1_CACHE_BYTES)
+			cflush((void *)adrs);
 		sync();
 		/* wait a little while to see if we get a machine check */
 		__delay(200);

base-commit: a87b93bdf800a4d7a42d95683624a4516e516b4f
-- 
2.24.1

