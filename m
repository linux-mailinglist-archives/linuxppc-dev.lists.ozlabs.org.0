Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDCB1389F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 04:53:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47x0720TWmzDqLg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 14:53:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47wzxz4rK5zDqLV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 14:45:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47wzxz3WQMz9B6r
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 14:45:27 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47wzxz27p3z9sRG; Mon, 13 Jan 2020 14:45:27 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47wzxy4vJyz9sP3
 for <linuxppc-dev@ozlabs.org>; Mon, 13 Jan 2020 14:45:26 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00D3gjqW084498
 for <linuxppc-dev@ozlabs.org>; Sun, 12 Jan 2020 22:45:24 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xfvva56fw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sun, 12 Jan 2020 22:45:24 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Mon, 13 Jan 2020 03:45:22 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 13 Jan 2020 03:45:19 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 00D3iTXw40960326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2020 03:44:29 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF12F4204C;
 Mon, 13 Jan 2020 03:45:17 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A91742047;
 Mon, 13 Jan 2020 03:45:16 +0000 (GMT)
Received: from pratiks-thinkpad.in.ibm.com (unknown [9.124.31.88])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jan 2020 03:45:15 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, 
 svaidy@linux.ibm.com, ego@linux.vnet.ibm.com, linuxram@us.ibm.com,
 psampat@linux.ibm.com, pratik.sampat@in.ibm.com, pratik.r.sampat@gmail.com
Subject: [RESEND PATCH v2 3/3] powerpc/powernv: Parse device tree,
 population of SPR support
Date: Mon, 13 Jan 2020 09:15:09 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578886602.git.psampat@linux.ibm.com>
References: <cover.1578886602.git.psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20011303-0012-0000-0000-0000037CC820
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011303-0013-0000-0000-000021B8F07C
Message-Id: <26adc23c6e82d981c6a28470ec84f74443ee3221.1578886602.git.psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-12_11:2020-01-10,
 2020-01-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001130028
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
index d67d4d0b169b..e910ff40b7e6 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -1429,6 +1429,107 @@ static void __init pnv_probe_idle_states(void)
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
+	u64 *temp_u64;
+	const char *state_prop;
+	u64 bit_pos;
+
+	state_prop = of_get_property(np, "status", NULL);
+	if (!state_prop) {
+		pr_warn("opal: failed to find the active value for self save/restore node");
+		return -EINVAL;
+	}
+	if (strncmp(state_prop, "disabled", 8) == 0) {
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
@@ -1577,6 +1678,9 @@ static int __init pnv_init_idle_states(void)
 		return rc;
 	pnv_probe_idle_states();
 
+	rc = pnv_parse_deepstate_dt();
+	if (rc)
+		return rc;
 	if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
 		if (!(supported_cpuidle_states & OPAL_PM_SLEEP_ENABLED_ER1)) {
 			power7_fastsleep_workaround_entry = false;
-- 
2.24.1

