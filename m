Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9605E36D4FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 11:48:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVYjc3ZmRz30BK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 19:48:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FbI1FSjm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FbI1FSjm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVYj90925z2yRB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 19:48:12 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13S9XRc9161159; Wed, 28 Apr 2021 05:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=tit3hb7m3zYdZhFI0+cPTFP8j/KlEFlZwtxvK/e1Wfs=;
 b=FbI1FSjmKE9U8xsoMiKMSgSkpCwiKLa1Er03TRRSqggmgU4epDp02B1sq1xSScvI86LJ
 +Bw2F+/CLznTAWylUUoiW7EtBgV/bvB1kL6n4pVsC663TDX8joixa3uBER2Z8d3ZAiRY
 n4EfVXO/AwL9O/Nj9m8NjIZ521B9Hv1luq6nmS53siqhbpIsQCT+0javLEZA6o2OUmhu
 reZV8brfDD9vovp6k7sgDvsplfCBsOQMs0gndO72k7rgZ0R94/8ASvBNsOeIVDD/iblo
 0LenE+EeXqldLGLurInaiEX8H2JZfUbTx3VohtDl2O0c4i9t3vK4GNAIsQ43qo3J2z0J 5A== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38740tahvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 05:48:05 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13S9m3kj018635;
 Wed, 28 Apr 2021 09:48:03 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 384ay8s0sh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 09:48:03 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13S9lxx318809090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 09:47:59 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BCA6A405C;
 Wed, 28 Apr 2021 09:47:59 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B582A405B;
 Wed, 28 Apr 2021 09:47:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.14.58])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Apr 2021 09:47:59 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org
Subject: [PATCH v3] pseries/drmem: update LMBs after LPM
Date: Wed, 28 Apr 2021 11:47:58 +0200
Message-Id: <20210428094758.28665-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: exmDS7dCltIpB86W1CWWoY5aWuRA-z_F
X-Proofpoint-ORIG-GUID: exmDS7dCltIpB86W1CWWoY5aWuRA-z_F
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_03:2021-04-27,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104280064
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
Cc: nathanl@linux.ibm.com, Tyrel Datwyler <tyreld@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After a LPM, the device tree node ibm,dynamic-reconfiguration-memory may be
updated by the hypervisor in the case the NUMA topology of the LPAR's
memory is updated.

This is caught by the kernel, but the memory's node is updated because
there is no way to move a memory block between nodes.

If later a memory block is added or removed, drmem_update_dt() is called
and it is overwriting the DT node to match the added or removed LMB. But
the LMB's associativity node has not been updated after the DT node update
and thus the node is overwritten by the Linux's topology instead of the
hypervisor one.

Introduce a hook called when the ibm,dynamic-reconfiguration-memory node is
updated to force an update of the LMB's associativity.

Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---

V3:
 - Check rd->dn->name instead of rd->dn->full_name
V2:
 - Take Tyrel's idea to rely on OF_RECONFIG_UPDATE_PROPERTY instead of
 introducing a new hook mechanism.
---
 arch/powerpc/include/asm/drmem.h              |  1 +
 arch/powerpc/mm/drmem.c                       | 35 +++++++++++++++++++
 .../platforms/pseries/hotplug-memory.c        |  4 +++
 3 files changed, 40 insertions(+)

diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
index bf2402fed3e0..4265d5e95c2c 100644
--- a/arch/powerpc/include/asm/drmem.h
+++ b/arch/powerpc/include/asm/drmem.h
@@ -111,6 +111,7 @@ int drmem_update_dt(void);
 int __init
 walk_drmem_lmbs_early(unsigned long node, void *data,
 		      int (*func)(struct drmem_lmb *, const __be32 **, void *));
+void drmem_update_lmbs(struct property *prop);
 #endif
 
 static inline void invalidate_lmb_associativity_index(struct drmem_lmb *lmb)
diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
index 9af3832c9d8d..f0a6633132af 100644
--- a/arch/powerpc/mm/drmem.c
+++ b/arch/powerpc/mm/drmem.c
@@ -307,6 +307,41 @@ int __init walk_drmem_lmbs_early(unsigned long node, void *data,
 	return ret;
 }
 
+/*
+ * Update the LMB associativity index.
+ */
+static int update_lmb(struct drmem_lmb *updated_lmb,
+		      __maybe_unused const __be32 **usm,
+		      __maybe_unused void *data)
+{
+	struct drmem_lmb *lmb;
+
+	/*
+	 * Brut force there may be better way to fetch the LMB
+	 */
+	for_each_drmem_lmb(lmb) {
+		if (lmb->drc_index != updated_lmb->drc_index)
+			continue;
+
+		lmb->aa_index = updated_lmb->aa_index;
+		break;
+	}
+	return 0;
+}
+
+/*
+ * Update the LMB associativity index.
+ *
+ * This needs to be called when the hypervisor is updating the
+ * dynamic-reconfiguration-memory node property.
+ */
+void drmem_update_lmbs(struct property *prop)
+{
+	if (!strcmp(prop->name, "ibm,dynamic-memory"))
+		__walk_drmem_v1_lmbs(prop->value, NULL, NULL, update_lmb);
+	else if (!strcmp(prop->name, "ibm,dynamic-memory-v2"))
+		__walk_drmem_v2_lmbs(prop->value, NULL, NULL, update_lmb);
+}
 #endif
 
 static int init_drmem_lmb_size(struct device_node *dn)
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 8377f1f7c78e..672ffbee2e78 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -949,6 +949,10 @@ static int pseries_memory_notifier(struct notifier_block *nb,
 	case OF_RECONFIG_DETACH_NODE:
 		err = pseries_remove_mem_node(rd->dn);
 		break;
+	case OF_RECONFIG_UPDATE_PROPERTY:
+		if (!strcmp(rd->dn->name,
+			    "ibm,dynamic-reconfiguration-memory"))
+			drmem_update_lmbs(rd->prop);
 	}
 	return notifier_from_errno(err);
 }
-- 
2.31.1

