Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A30F1730C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 07:07:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TJwH1YfjzDrJD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 17:07:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TJtn2mslzDqpG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 17:05:53 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01S64NUd029316; Fri, 28 Feb 2020 01:05:39 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yepxjj11j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 01:05:39 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01S61pwT008934;
 Fri, 28 Feb 2020 06:05:38 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 2yepv2js52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 06:05:38 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01S65aR459572596
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Feb 2020 06:05:37 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7FFDBE054;
 Fri, 28 Feb 2020 06:05:36 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED8D2BE053;
 Fri, 28 Feb 2020 06:05:32 +0000 (GMT)
Received: from LeoBras.aus.stglabs.ibm.com (unknown [9.85.198.107])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 28 Feb 2020 06:05:32 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Thomas Gleixner <tglx@linutronix.de>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, mdroth@linux.vnet.ibm.com
Subject: [PATCH 1/1] powerpc/kernel: Enables memory hot-remove after reboot on
 pseries guests
Date: Fri, 28 Feb 2020 03:04:39 -0300
Message-Id: <20200228060439.52749-1-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_01:2020-02-26,
 2020-02-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002280053
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While providing guests, it's desirable to resize it's memory on demand.

By now, it's possible to do so by creating a guest with a small base
memory, hot-plugging all the rest, and using 'movable_node' kernel
command-line parameter, which puts all hot-plugged memory in
ZONE_MOVABLE, allowing it to be removed whenever needed.

But there is an issue regarding guest reboot:
If memory is hot-plugged, and then the guest is rebooted, all hot-plugged
memory goes to ZONE_NORMAL, which offers no guaranteed hot-removal.
It usually prevents this memory to be hot-removed from the guest.

It's possible to use device-tree information to fix that behavior, as
it stores flags for LMB ranges on ibm,dynamic-memory-vN.
It involves marking each memblock with the correct flags as hotpluggable
memory, which mm/memblock.c puts in ZONE_MOVABLE during boot if
'movable_node' is passed.

For base memory, qemu assigns these flags for it's LMBs:
(DRCONF_MEM_AI_INVALID | DRCONF_MEM_RESERVED)
For hot-plugged memory, it assigns (DRCONF_MEM_ASSIGNED).

While guest kernel reads the device-tree, early_init_drmem_lmb() is
called for every added LMBs, doing nothing for base memory, and adding
memblocks for hot-plugged memory. Skipping base memory happens here:

if ((lmb->flags & DRCONF_MEM_RESERVED) ||
    !(lmb->flags & DRCONF_MEM_ASSIGNED))
	return;

Marking memblocks added by this function as hotplugable memory
is enough to get the desirable behavior, and should cause no change
if 'movable_node' parameter is not passed to kernel.

Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
---
 arch/powerpc/kernel/prom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 6620f37abe73..f4d14c67bf53 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -518,6 +518,8 @@ static void __init early_init_drmem_lmb(struct drmem_lmb *lmb,
 		DBG("Adding: %llx -> %llx\n", base, size);
 		if (validate_mem_limit(base, &size))
 			memblock_add(base, size);
+
+		early_init_dt_mark_hotplug_memory_arch(base, size);
 	} while (--rngs);
 }
 #endif /* CONFIG_PPC_PSERIES */
-- 
2.24.1

