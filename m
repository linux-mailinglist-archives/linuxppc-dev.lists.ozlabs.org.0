Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C2D1F7396
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 07:44:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jqRJ2BggzDqwm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 15:44:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jplK5mGjzDqgC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 15:13:01 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05C53Cf5051725; Fri, 12 Jun 2020 01:12:57 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31kx98eyg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:57 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05C53HPO052242;
 Fri, 12 Jun 2020 01:12:56 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31kx98eyfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:56 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05C5B9lS009958;
 Fri, 12 Jun 2020 05:12:56 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 31g2s9856h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 05:12:56 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05C5Ctjr53150094
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jun 2020 05:12:55 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8704AE062;
 Fri, 12 Jun 2020 05:12:55 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67834AE060;
 Fri, 12 Jun 2020 05:12:55 +0000 (GMT)
Received: from localhost (unknown [9.65.252.60])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 12 Jun 2020 05:12:55 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 18/18] powerpc/pseries: remove obsolete memory hotplug DT
 notifier code
Date: Fri, 12 Jun 2020 00:12:38 -0500
Message-Id: <20200612051238.1007764-19-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200612051238.1007764-1-nathanl@linux.ibm.com>
References: <20200612051238.1007764-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_23:2020-06-11,
 2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 impostorscore=0 suspectscore=1 priorityscore=1501
 mlxlogscore=999 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006110174
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
Cc: tyreld@linux.ibm.com, srikar@linux.vnet.ibm.com, ego@linux.vnet.ibm.com,
 npiggin@gmail.com, svaidy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pseries_update_drconf_memory() runs from a DT notifier in response to
an update to the ibm,dynamic-memory property of the
/ibm,dynamic-reconfiguration-memory node. This property is an older
less compact format than the ibm,dynamic-memory-v2 property used in
most currently supported firmwares. There has never been an equivalent
function for the v2 property.

pseries_update_drconf_memory() compares the 'assigned' flag for each
LMB in the old vs new properties and adds or removes the block
accordingly. However it appears to be of no actual utility:

* Partition suspension and PRRNs are specified only to change LMBs'
  NUMA affinity information. This notifier should be a no-op for those
  scenarios since the assigned flags should not change.

* The memory hotplug/DLPAR path has a hack which short-circuits
  execution of the notifier:
     dlpar_memory()
        ...
        rtas_hp_event = true;
        drmem_update_dt()
           of_update_property()
              pseries_memory_notifier()
                 pseries_update_drconf_memory()
                    if (rtas_hp_event) return;

So this code only makes sense as a relic of the time when more of the
DLPAR workflow took place in user space. I don't see a purpose for it
now.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 .../platforms/pseries/hotplug-memory.c        | 65 +------------------
 1 file changed, 1 insertion(+), 64 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 67ece3ac9ac2..73a5dcd977e1 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -22,8 +22,6 @@
 #include <asm/drmem.h>
 #include "pseries.h"
 
-static bool rtas_hp_event;
-
 unsigned long pseries_memory_block_size(void)
 {
 	struct device_node *np;
@@ -871,11 +869,8 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_elog)
 		break;
 	}
 
-	if (!rc) {
-		rtas_hp_event = true;
+	if (!rc)
 		rc = drmem_update_dt();
-		rtas_hp_event = false;
-	}
 
 	unlock_device_hotplug();
 	return rc;
@@ -911,60 +906,6 @@ static int pseries_add_mem_node(struct device_node *np)
 	return (ret < 0) ? -EINVAL : 0;
 }
 
-static int pseries_update_drconf_memory(struct of_reconfig_data *pr)
-{
-	struct of_drconf_cell_v1 *new_drmem, *old_drmem;
-	unsigned long memblock_size;
-	u32 entries;
-	__be32 *p;
-	int i, rc = -EINVAL;
-
-	if (rtas_hp_event)
-		return 0;
-
-	memblock_size = pseries_memory_block_size();
-	if (!memblock_size)
-		return -EINVAL;
-
-	if (!pr->old_prop)
-		return 0;
-
-	p = (__be32 *) pr->old_prop->value;
-	if (!p)
-		return -EINVAL;
-
-	/* The first int of the property is the number of lmb's described
-	 * by the property. This is followed by an array of of_drconf_cell
-	 * entries. Get the number of entries and skip to the array of
-	 * of_drconf_cell's.
-	 */
-	entries = be32_to_cpu(*p++);
-	old_drmem = (struct of_drconf_cell_v1 *)p;
-
-	p = (__be32 *)pr->prop->value;
-	p++;
-	new_drmem = (struct of_drconf_cell_v1 *)p;
-
-	for (i = 0; i < entries; i++) {
-		if ((be32_to_cpu(old_drmem[i].flags) & DRCONF_MEM_ASSIGNED) &&
-		    (!(be32_to_cpu(new_drmem[i].flags) & DRCONF_MEM_ASSIGNED))) {
-			rc = pseries_remove_memblock(
-				be64_to_cpu(old_drmem[i].base_addr),
-						     memblock_size);
-			break;
-		} else if ((!(be32_to_cpu(old_drmem[i].flags) &
-			    DRCONF_MEM_ASSIGNED)) &&
-			    (be32_to_cpu(new_drmem[i].flags) &
-			    DRCONF_MEM_ASSIGNED)) {
-			rc = memblock_add(be64_to_cpu(old_drmem[i].base_addr),
-					  memblock_size);
-			rc = (rc < 0) ? -EINVAL : 0;
-			break;
-		}
-	}
-	return rc;
-}
-
 static int pseries_memory_notifier(struct notifier_block *nb,
 				   unsigned long action, void *data)
 {
@@ -978,10 +919,6 @@ static int pseries_memory_notifier(struct notifier_block *nb,
 	case OF_RECONFIG_DETACH_NODE:
 		err = pseries_remove_mem_node(rd->dn);
 		break;
-	case OF_RECONFIG_UPDATE_PROPERTY:
-		if (!strcmp(rd->prop->name, "ibm,dynamic-memory"))
-			err = pseries_update_drconf_memory(rd);
-		break;
 	}
 	return notifier_from_errno(err);
 }
-- 
2.25.4

