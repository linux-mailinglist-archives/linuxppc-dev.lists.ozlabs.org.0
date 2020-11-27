Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 140242C5FD8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 06:43:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cj3Sc6NBfzDrQ3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 16:43:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZbCsbuS4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cj3LY5bBFzDrCQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 16:37:57 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AR5WRQ4043879; Fri, 27 Nov 2020 00:37:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=nyuHt1CFHVhFwjWidhKEmvtzgr87UJs/toM07JZEijM=;
 b=ZbCsbuS45UPL0G+unJTfEHmeTCcgkStTq2TFwOzmorIPoScs23LyZp2BUStvFZoj26zX
 kMthH28MCdseJa/DF1QbrxcW9qfzbFgb+Wb/14JvZQEko4oq2lwE3RuIaFPYVuRjUnuN
 5+iJ2/Q6qhcElray+b9wYxeXNhKqrii0/3mZykFEMfyKvFxx/yB1Gb87ctTs7aClVHLV
 niMSXEIHMGV2Iy5l708Hb5/zNMx9Jzy5ah07kL9/W4711LSAnQR63dnubA5QNrcpD1Sc
 NlsH1ShNbkh2IaMmF65ueRMNq9OgN1hzzdudfwQZ5tD9+L3iJmz+OvD95g+CEyMjeZc/ Fg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352pfwp8v0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 00:37:51 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AR5bep0012512;
 Fri, 27 Nov 2020 05:37:49 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 351pca0vqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 05:37:49 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AR5biJS34603412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 05:37:44 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8041A42045;
 Fri, 27 Nov 2020 05:37:44 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15CC04203F;
 Fri, 27 Nov 2020 05:37:43 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.199.43.10])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 27 Nov 2020 05:37:42 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/numa: Fix a regression on memoryless node 0
Date: Fri, 27 Nov 2020 11:07:38 +0530
Message-Id: <20201127053738.10085-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_01:2020-11-26,
 2020-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 mlxscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011270028
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Haren Myneni <haren@linux.ibm.com>, Milan Mohanty <milmohan@in.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit e75130f20b1f ("powerpc/numa: Offline memoryless cpuless node 0")
offlines node 0 and expects nodes to be subsequently onlined when CPUs
or nodes are detected.

Commit 6398eaa26816 ("powerpc/numa: Prefer node id queried from vphn")
skips onlining node 0 when CPUs are associated with node 0.

On systems with node 0 having CPUs but no memory, this causes node 0 be
marked offline. This causes issues at boot time when trying to set
memory node for online CPUs while building the zonelist.

0:mon> t
[link register   ] c000000000400354 __build_all_zonelists+0x164/0x280
[c00000000161bda0] c0000000016533c8 node_states+0x20/0xa0 (unreliable)
[c00000000161bdc0] c000000000400384 __build_all_zonelists+0x194/0x280
[c00000000161be30] c000000001041800 build_all_zonelists_init+0x4c/0x118
[c00000000161be80] c0000000004020d0 build_all_zonelists+0x190/0x1b0
[c00000000161bef0] c000000001003cf8 start_kernel+0x18c/0x6a8
[c00000000161bf90] c00000000000adb4 start_here_common+0x1c/0x3e8
0:mon> r
R00 = c000000000400354   R16 = 000000000b57a0e8
R01 = c00000000161bda0   R17 = 000000000b57a6b0
R02 = c00000000161ce00   R18 = 000000000b5afee8
R03 = 0000000000000000   R19 = 000000000b6448a0
R04 = 0000000000000000   R20 = fffffffffffffffd
R05 = 0000000000000000   R21 = 0000000001400000
R06 = 0000000000000000   R22 = 000000001ec00000
R07 = 0000000000000001   R23 = c000000001175580
R08 = 0000000000000000   R24 = c000000001651ed8
R09 = c0000000017e84d8   R25 = c000000001652480
R10 = 0000000000000000   R26 = c000000001175584
R11 = c000000c7fac0d10   R27 = c0000000019568d0
R12 = c000000000400180   R28 = 0000000000000000
R13 = c000000002200000   R29 = c00000000164dd78
R14 = 000000000b579f78   R30 = 0000000000000000
R15 = 000000000b57a2b8   R31 = c000000001175584
pc  = c000000000400194 local_memory_node+0x24/0x80
cfar= c000000000074334 mcount+0xc/0x10
lr  = c000000000400354 __build_all_zonelists+0x164/0x280
msr = 8000000002001033   cr  = 44002284
ctr = c000000000400180   xer = 0000000000000001   trap =  380
dar = 0000000000001388   dsisr = c00000000161bc90
0:mon>

Fix this by setting node to be online while onlining CPUs that belong to
node 0.

Fixes: e75130f20b1f ("powerpc/numa: Offline memoryless cpuless node 0")
Fixes: 6398eaa26816 ("powerpc/numa: Prefer node id queried from vphn")
Reported-by: Milan Mohanty <milmohan@in.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Milan Mohanty <milmohan@in.ibm.com>
Cc: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 63f61d8b55e5..f2bf98bdcea2 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -742,8 +742,7 @@ static int __init parse_numa_properties(void)
 			of_node_put(cpu);
 		}
 
-		if (likely(nid > 0))
-			node_set_online(nid);
+		node_set_online(nid);
 	}
 
 	get_n_mem_cells(&n_mem_addr_cells, &n_mem_size_cells);
-- 
2.27.0

