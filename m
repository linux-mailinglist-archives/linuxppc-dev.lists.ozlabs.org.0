Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C152AD2983
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 14:31:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pr6Q6H36zDrBG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 23:31:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pqPS5ZQTzDr4Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 22:59:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46pqPR1bNgz8x4q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 22:59:07 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46pqPQ6vn1z9sPk; Thu, 10 Oct 2019 22:59:06 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=psampat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46pqPQ18mNz9sPL
 for <linuxppc-dev@ozlabs.org>; Thu, 10 Oct 2019 22:59:05 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9AAqG1K196426
 for <linuxppc-dev@ozlabs.org>; Thu, 10 Oct 2019 07:58:59 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vj38yhvkx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 10 Oct 2019 07:58:58 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Thu, 10 Oct 2019 12:58:57 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 10 Oct 2019 12:58:55 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9ABwrpc41156610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Oct 2019 11:58:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6B474204C;
 Thu, 10 Oct 2019 11:58:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD4A442049;
 Thu, 10 Oct 2019 11:58:51 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.199.37.96])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Oct 2019 11:58:51 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, mpe@ellerman.id.au,
 svaidy@linux.ibm.com, ego@linux.vnet.ibm.com, premjha2@in.ibm.com,
 akshay.adiga@linux.vnet.ibm.com
Subject: [PATCH v1 3/3] powerpc/powernv: Parse device tree,
 population of SPR support
Date: Thu, 10 Oct 2019 17:28:43 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191010115843.22283-1-psampat@linux.ibm.com>
References: <20191010115843.22283-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101011-4275-0000-0000-00000370DB11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101011-4276-0000-0000-00003883E27B
Message-Id: <20191010115843.22283-4-psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-10_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910100084
X-Mailman-Approved-At: Thu, 10 Oct 2019 23:17:34 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Parse the device tree for nodes self-save, self-restore and populate
support for the preferred SPRs based what was advertised by the device
tree.

Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/idle.c | 104 ++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index f0dd377820c7..43ad0e543b84 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -1408,6 +1408,107 @@ static void __init pnv_probe_idle_states(void)
 		supported_cpuidle_states |= pnv_idle_states[i].flags;
 }
 
+/*
+ * Extracts and populates the self save or restore capabilities
+ * passed from the device tree node
+ */
+static int extract_save_restore_state_dt(struct device_node *np, int type)
+{
+	int nr_sprns = 0, i, bitmask_index;
+	int rc = 0;
+	u32 active = 0;
+	u64 *temp_u64;
+	u64 bit_pos;
+
+	if (of_property_read_u32(np, "active", &active)) {
+		pr_warn("opal: failed to find the active value for self save/restore node");
+		return -EINVAL;
+	}
+
+	if (!active) {
+		/*
+		 * if the feature is not active, strip the preferred_sprs from
+		 * that capability.
+		 */
+		if (type == SELF_RESTORE_TYPE) {
+			for (i = 0; i < nr_preferred_sprs; i++) {
+				preferred_sprs[i].supported_mode &=
+					~SELF_RESTORE_STRICT;
+			}
+		} else {
+			for (i = 0; i < nr_preferred_sprs; i++) {
+				preferred_sprs[i].supported_mode &=
+					~SELF_SAVE_STRICT;
+			}
+		}
+		return 0;
+	}
+	nr_sprns = of_property_count_u64_elems(np, "sprn-bitmask");
+	if (nr_sprns <= 0)
+		return rc;
+	temp_u64 = kcalloc(nr_sprns, sizeof(u64), GFP_KERNEL);
+	if (of_property_read_u64_array(np, "sprn-bitmask",
+				       temp_u64, nr_sprns)) {
+		pr_warn("cpuidle-powernv: failed to find registers in DT\n");
+		kfree(temp_u64);
+		return -EINVAL;
+	}
+	/*
+	 * Populate acknowledgment of support for the sprs in the global vector
+	 * gotten by the registers supplied by the firmware.
+	 * The registers are in a bitmask, bit index within
+	 * that specifies the SPR
+	 */
+	for (i = 0; i < nr_preferred_sprs; i++) {
+		bitmask_index = preferred_sprs[i].spr / 64;
+		bit_pos = preferred_sprs[i].spr % 64;
+		if ((temp_u64[bitmask_index] & (1UL << bit_pos)) == 0) {
+			if (type == SELF_RESTORE_TYPE)
+				preferred_sprs[i].supported_mode &=
+					~SELF_RESTORE_STRICT;
+			else
+				preferred_sprs[i].supported_mode &=
+					~SELF_SAVE_STRICT;
+			continue;
+		}
+		if (type == SELF_RESTORE_TYPE) {
+			preferred_sprs[i].supported_mode |=
+				SELF_RESTORE_STRICT;
+		} else {
+			preferred_sprs[i].supported_mode |=
+				SELF_SAVE_STRICT;
+		}
+	}
+
+	kfree(temp_u64);
+	return rc;
+}
+
+static int pnv_parse_deepstate_dt(void)
+{
+	struct device_node *np, *np1;
+	int rc = 0;
+
+	/* Self restore register population */
+	np = of_find_node_by_path("/ibm,opal/power-mgt/self-restore");
+	if (!np) {
+		pr_warn("opal: self restore Node not found");
+	} else {
+		rc = extract_save_restore_state_dt(np, SELF_RESTORE_TYPE);
+		if (rc != 0)
+			return rc;
+	}
+	/* Self save register population */
+	np1 = of_find_node_by_path("/ibm,opal/power-mgt/self-save");
+	if (!np1) {
+		pr_warn("opal: self save Node not found");
+		pr_warn("Legacy firmware. Assuming default self-restore support");
+	} else {
+		rc = extract_save_restore_state_dt(np1, SELF_SAVE_TYPE);
+	}
+	return rc;
+}
+
 /*
  * This function parses device-tree and populates all the information
  * into pnv_idle_states structure. It also sets up nr_pnv_idle_states
@@ -1556,6 +1657,9 @@ static int __init pnv_init_idle_states(void)
 		return rc;
 	pnv_probe_idle_states();
 
+	rc = pnv_parse_deepstate_dt();
+	if (rc)
+		return rc;
 	if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
 		if (!(supported_cpuidle_states & OPAL_PM_SLEEP_ENABLED_ER1)) {
 			power7_fastsleep_workaround_entry = false;
-- 
2.21.0

