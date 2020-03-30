Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8241B197614
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 10:02:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rQ0m5Bf9zDqQM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 19:02:16 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rPyh0CBvzDq9s
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 19:00:27 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02U7YKmN081780
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 04:00:25 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 301ygumtm7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 04:00:24 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Mon, 30 Mar 2020 09:00:10 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 30 Mar 2020 09:00:07 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02U7xFGd19792184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Mar 2020 07:59:15 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CF04AE057;
 Mon, 30 Mar 2020 08:00:18 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A09CAE05A;
 Mon, 30 Mar 2020 08:00:15 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.49.209])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Mar 2020 08:00:15 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3] powerpc xmon: use `dcbf` inplace of `dcbi` instruction for
 64bit Book3S
Date: Mon, 30 Mar 2020 13:29:54 +0530
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20033008-0020-0000-0000-000003BE1B11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033008-0021-0000-0000-00002216B537
Message-Id: <20200330075954.538773-1-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-27,
 2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 mlxscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 mlxlogscore=354 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003300067
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

Data Cache Block Invalidate (dcbi) instruction implemented back in
PowerPC architecture version 2.03. But as per Power Processor Users Manual
it is obsolete and not supported by POWER8/POWER9 core. Attempt to use of
this illegal instruction results in a hypervisor emulation assistance
interrupt. So, ifdef it out the option `i` in xmon for 64bit Book3S.

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
 arch/powerpc/xmon/xmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---
changes in v3:
-------------
Fix Christophe's review comments and rebase it on latest mpe's merge
tree,
	* mention the dcbi obsolete statement based on Power processor
	  users manual in commit message.
	* make #ifdef in a more simple way.
changes in v2:
-------------
Fix review comments from Segher and Michael,
        * change incorrect architecture version 2.01 to 2.03 in commit
          message.
        * ifdef it out the option `i` for PPC_BOOK3S_64 instead to drop
	  it and change the commit message accordingly.

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index ea303b7e4e29..7b62d5dcc4a1 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1808,7 +1808,7 @@ static void cacheflush(void)
 		catch_memory_errors = 1;
 		sync();
 
-		if (cmd != 'i') {
+		if (cmd != 'i' || IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {
 			for (; nflush > 0; --nflush, adrs += L1_CACHE_BYTES)
 				cflush((void *) adrs);
 		} else {

base-commit: 1ad3b5ebe084246ad593a22707cd91ef6418c31e
-- 
2.24.1

