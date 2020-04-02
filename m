Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A26419CAA9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 21:55:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tYhl5z4RzDrTs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 06:55:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tYg54DTpzDrSt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 06:54:25 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032JYRpS054016; Thu, 2 Apr 2020 15:54:14 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304swt8py7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 15:54:13 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 032JoFxb023346;
 Thu, 2 Apr 2020 19:54:11 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 301x77p7mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 19:54:11 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 032JsAt251708222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 19:54:10 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6892AE060;
 Thu,  2 Apr 2020 19:54:10 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75A51AE05C;
 Thu,  2 Apr 2020 19:54:01 +0000 (GMT)
Received: from LeoBras.aus.stglabs.ibm.com (unknown [9.85.174.86])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  2 Apr 2020 19:54:01 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Allison Randal <allison@lohutok.net>,
 Bharata B Rao <bharata@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Subject: [PATCH v3 1/1] powerpc/kernel: Enables memory hot-remove after reboot
 on pseries guests
Date: Thu,  2 Apr 2020 16:51:57 -0300
Message-Id: <20200402195156.626430-1-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_09:2020-04-02,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004020142
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

For carrying such information, the new flag DRCONF_MEM_HOTREMOVABLE was
proposed and accepted into Power Architecture documentation.
This flag should be:
- true (b=1) if the hypervisor may want to hot-remove it later, and
- false (b=0) if it does not care.

During boot, guest kernel reads the device-tree, early_init_drmem_lmb()
is called for every added LMBs. Here, checking for this new flag and
marking memblocks as hotplugable memory is enough to get the desirable
behavior.

This should cause no change if 'movable_node' parameter is not passed
in kernel command-line.

Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
Reviewed-by: Bharata B Rao <bharata@linux.ibm.com>

---

Changes since v2:
- New flag name changed from DRCONF_MEM_HOTPLUGGED to
	DRCONF_MEM_HOTREMOVABLE

Changes since v1:
- Adds new flag, so PowerVM is compatible with the change.
- Fixes mistakes in code
---
 arch/powerpc/include/asm/drmem.h | 1 +
 arch/powerpc/kernel/prom.c       | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
index 3d76e1c388c2..ad99e27e5b65 100644
--- a/arch/powerpc/include/asm/drmem.h
+++ b/arch/powerpc/include/asm/drmem.h
@@ -65,6 +65,7 @@ struct of_drconf_cell_v2 {
 #define DRCONF_MEM_ASSIGNED	0x00000008
 #define DRCONF_MEM_AI_INVALID	0x00000040
 #define DRCONF_MEM_RESERVED	0x00000080
+#define DRCONF_MEM_HOTREMOVABLE	0x00000100
 
 static inline u32 drmem_lmb_size(void)
 {
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 6620f37abe73..abc9b04d03ce 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -515,9 +515,14 @@ static void __init early_init_drmem_lmb(struct drmem_lmb *lmb,
 				size = 0x80000000ul - base;
 		}
 
+		if (!validate_mem_limit(base, &size))
+			continue;
+
 		DBG("Adding: %llx -> %llx\n", base, size);
-		if (validate_mem_limit(base, &size))
-			memblock_add(base, size);
+		memblock_add(base, size);
+
+		if (lmb->flags & DRCONF_MEM_HOTREMOVABLE)
+			memblock_mark_hotplug(base, size);
 	} while (--rngs);
 }
 #endif /* CONFIG_PPC_PSERIES */
-- 
2.25.1

