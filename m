Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E97A5193871
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 07:17:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nvsr32gZzDqcT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 17:17:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nvr033tjzDq77
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 17:16:00 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02Q63BCV174765
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 02:15:57 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ywcj03kk3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 02:15:57 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Thu, 26 Mar 2020 06:15:55 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 26 Mar 2020 06:15:53 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02Q6FqqD59834436
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Mar 2020 06:15:52 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BF574C046;
 Thu, 26 Mar 2020 06:15:52 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A8E94C040;
 Thu, 26 Mar 2020 06:15:49 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.41.94])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Mar 2020 06:15:49 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc xmon: use `dcbf` inplace of `dcbi` instruction for
 64bit Book3S
Date: Thu, 26 Mar 2020 11:45:22 +0530
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20032606-0028-0000-0000-000003EC03AB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032606-0029-0000-0000-000024B173C4
Message-Id: <20200326061522.33123-1-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-25_15:2020-03-24,
 2020-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=353
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003260036
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

Data Cache Block Invalidate (dcbi) instruction was implemented back in PowerPC
architecture version 2.03. It is obsolete and attempt to use of this illegal
instruction results in a hypervisor emulation assistance interrupt. So, ifdef
it out the option `i` in xmon for 64bit Book3S.

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
 arch/powerpc/xmon/xmon.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)
---
changes in v2:
-------------
Fix review comments from Segher and Michael,
	* change incorrect architecture version 2.01 to 2.03 in commit
	  message.
	* ifdef it out the option `i` for PPC_BOOK3S_64 instead to drop it
	  and change the commit message accordingly.

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 0ec9640335bb..bfd5a97689cd 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -335,10 +335,12 @@ static inline void cflush(void *p)
 	asm volatile ("dcbf 0,%0; icbi 0,%0" : : "r" (p));
 }
 
+#ifndef CONFIG_PPC_BOOK3S_64
 static inline void cinval(void *p)
 {
 	asm volatile ("dcbi 0,%0; icbi 0,%0" : : "r" (p));
 }
+#endif
 
 /**
  * write_ciabr() - write the CIABR SPR
@@ -1791,8 +1793,9 @@ static void prregs(struct pt_regs *fp)
 
 static void cacheflush(void)
 {
-	int cmd;
 	unsigned long nflush;
+#ifndef CONFIG_PPC_BOOK3S_64
+	int cmd;
 
 	cmd = inchar();
 	if (cmd != 'i')
@@ -1800,13 +1803,14 @@ static void cacheflush(void)
 	scanhex((void *)&adrs);
 	if (termch != '\n')
 		termch = 0;
+#endif
 	nflush = 1;
 	scanhex(&nflush);
 	nflush = (nflush + L1_CACHE_BYTES - 1) / L1_CACHE_BYTES;
 	if (setjmp(bus_error_jmp) == 0) {
 		catch_memory_errors = 1;
 		sync();
-
+#ifndef CONFIG_PPC_BOOK3S_64
 		if (cmd != 'i') {
 			for (; nflush > 0; --nflush, adrs += L1_CACHE_BYTES)
 				cflush((void *) adrs);
@@ -1814,6 +1818,10 @@ static void cacheflush(void)
 			for (; nflush > 0; --nflush, adrs += L1_CACHE_BYTES)
 				cinval((void *) adrs);
 		}
+#else
+		for (; nflush > 0; --nflush, adrs += L1_CACHE_BYTES)
+			cflush((void *)adrs);
+#endif
 		sync();
 		/* wait a little while to see if we get a machine check */
 		__delay(200);

base-commit: a87b93bdf800a4d7a42d95683624a4516e516b4f
-- 
2.24.1

