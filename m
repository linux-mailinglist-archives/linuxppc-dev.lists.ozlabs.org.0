Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA511ABAD5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 10:11:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492sNy4XbhzDqJ7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 18:10:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492s1Q2JqhzDqwF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 17:54:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 492s1Q0Z33z99jc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 17:54:02 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 492s1P63VJz9sSc; Thu, 16 Apr 2020 17:54:01 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 492s1P0S0Rz9sP7
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Apr 2020 17:54:00 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03G7YLfZ115960
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Apr 2020 03:53:58 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30ej4ya9m8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Apr 2020 03:53:58 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Thu, 16 Apr 2020 08:53:28 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 Apr 2020 08:53:25 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03G7rrBe65011882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Apr 2020 07:53:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 012AC42042;
 Thu, 16 Apr 2020 07:53:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2055542041;
 Thu, 16 Apr 2020 07:53:51 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.79.182.109])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Apr 2020 07:53:50 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, 
 skiboot@lists.ozlabs.org, oohall@gmail.com, ego@linux.vnet.ibm.com,
 linuxram@us.ibm.com, pratik.r.sampat@gmail.com, psampat@linux.ibm.com
Subject: [PATCH v7 4/4] Advertise the self-save and self-restore attributes in
 the device tree
Date: Thu, 16 Apr 2020 13:23:41 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200416075341.75268-1-psampat@linux.ibm.com>
References: <20200416075341.75268-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20041607-0008-0000-0000-000003719D95
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041607-0009-0000-0000-00004A93546A
Message-Id: <20200416075341.75268-5-psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_02:2020-04-14,
 2020-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 suspectscore=2 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160045
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

Support for self save and self restore interface is advertised in the
device tree, along with the list of SPRs it supports for each.

The Special Purpose Register identification is encoded in a 2048 bitmask
structure, where each bit signifies the identification key of that SPR
which is consistent with that of the POWER architecture set for that
register.

Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 .../ibm,opal/power-mgt/self-restore.rst       |  27 ++++
 .../ibm,opal/power-mgt/self-save.rst          |  27 ++++
 hw/slw.c                                      | 118 ++++++++++++++++++
 include/skiboot.h                             |   1 +
 4 files changed, 173 insertions(+)
 create mode 100644 doc/device-tree/ibm,opal/power-mgt/self-restore.rst
 create mode 100644 doc/device-tree/ibm,opal/power-mgt/self-save.rst

diff --git a/doc/device-tree/ibm,opal/power-mgt/self-restore.rst b/doc/device-tree/ibm,opal/power-mgt/self-restore.rst
new file mode 100644
index 00000000..2a2269f7
--- /dev/null
+++ b/doc/device-tree/ibm,opal/power-mgt/self-restore.rst
@@ -0,0 +1,27 @@
+ibm,opal/power-mgt/self-restore device tree entries
+===================================================
+
+This node exports the bitmask representing the special purpose registers that
+the self-restore API currently supports.
+
+Example:
+
+.. code-block:: dts
+
+  self-restore {
+        sprn-bitmask = <0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x42010000 0x0 0x0
+                        0x20000 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0
+                        0x0 0x0 0x100000 0x900000 0x0 0x0 0x530000 0x0 0x0 0x0
+                        0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0
+                        0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0
+                        0x0 0x10000>;
+        phandle = <0x1c7>;
+  };
+
+sprn-bitmask
+------------
+
+This property is a bitmask of of all the existing SPRs and if the SPR is
+supported, the corresponding bit of the SPR number is set to 1.
+The representation of the bits are left-right, i.e the MSB of the first
+doubleword represants the 0th bit.
diff --git a/doc/device-tree/ibm,opal/power-mgt/self-save.rst b/doc/device-tree/ibm,opal/power-mgt/self-save.rst
new file mode 100644
index 00000000..c367720e
--- /dev/null
+++ b/doc/device-tree/ibm,opal/power-mgt/self-save.rst
@@ -0,0 +1,27 @@
+ibm,opal/power-mgt/self-save device tree entries
+===================================================
+
+This node exports the bitmask representing the special purpose registers that
+the self-save API currently supports.
+
+Example:
+
+.. code-block:: dts
+
+  self-save {
+        sprn-bitmask = <0x0 0x0 0x0 0x0 0x100000 0x0 0x0 0x0 0x42010000 0x0 0x0
+                        0x20000 0x0 0x0 0x0 0x10000 0x0 0x0 0x0 0x0 0x0 0x0 0x0
+                        0x0 0x0 0x0 0x100000 0x840000 0x0 0x0 0x0 0x0 0x0 0x0
+                        0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0
+                        0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0
+                        0x0 0x10000>;
+        phandle = <0x1c8>;
+  };
+
+sprn-bitmask
+------------
+
+This property is a bitmask of of all the existing SPRs and if the SPR is
+supported, the corresponding bit of the SPR number is set to 1.
+The representation of the bits are left-right, i.e the MSB of the first
+doubleword represants the 0th bit.
diff --git a/hw/slw.c b/hw/slw.c
index 9751c04f..fb14bd0c 100644
--- a/hw/slw.c
+++ b/hw/slw.c
@@ -29,6 +29,7 @@
 #include <sbe_xip_image.h>
 
 static uint32_t slw_saved_reset[0x100];
+#define SPR_BITMAP_LENGTH	2048
 
 static bool slw_current_le = false;
 
@@ -750,6 +751,121 @@ static void slw_late_init_p9(struct proc_chip *chip)
 	}
 }
 
+/* Add device tree properties to determine self-save | restore */
+void add_cpu_self_save_restore_properties(void)
+{
+	struct dt_node *self_restore, *self_save, *power_mgt;
+	uint64_t *self_save_mask, *self_restore_mask;
+	bool self_save_supported = true;
+	uint64_t compVector = -1;
+	struct proc_chip *chip;
+	int i, rc;
+
+	const uint64_t self_restore_regs[] = {
+		P8_SPR_HRMOR,
+		P8_SPR_HMEER,
+		P8_SPR_PMICR,
+		P8_SPR_PMCR,
+		P8_SPR_HID0,
+		P8_SPR_HID1,
+		P8_SPR_HID4,
+		P8_SPR_HID5,
+		P8_SPR_HSPRG0,
+		P8_SPR_LPCR,
+		P8_MSR_MSR
+	};
+
+	const uint64_t self_save_regs[] = {
+		P9_STOP_SPR_DAWR,
+		P9_STOP_SPR_HSPRG0,
+		P9_STOP_SPR_LDBAR,
+		P9_STOP_SPR_LPCR,
+		P9_STOP_SPR_PSSCR,
+		P9_STOP_SPR_MSR,
+		P9_STOP_SPR_HRMOR,
+		P9_STOP_SPR_HMEER,
+		P9_STOP_SPR_PMCR,
+		P9_STOP_SPR_PTCR
+	};
+
+	chip = next_chip(NULL);
+	assert(chip);
+	rc = proc_stop_api_discover_capability((void *) chip->homer_base,
+					       &compVector);
+	if (rc == STOP_SAVE_ARG_INVALID_IMG) {
+		prlog(PR_DEBUG, "HOMER BASE INVALID\n");
+		return;
+	} else if (rc == STOP_SAVE_API_IMG_INCOMPATIBLE) {
+		prlog(PR_DEBUG, "STOP API running incompatible versions\n");
+		if ((compVector & SELF_RESTORE_VER_MISMATCH) == 0) {
+			prlog(PR_DEBUG, "Self-save API unsupported\n");
+			self_save_supported = false;
+		}
+	}
+
+	power_mgt = dt_find_by_path(dt_root, "/ibm,opal/power-mgt");
+	if (!power_mgt) {
+		prerror("SLW: dt node /ibm,opal/power-mgt not found\n");
+		return;
+	}
+
+	self_restore = dt_new(power_mgt, "self-restore");
+	if (!self_restore) {
+		prerror("SLW: Failed to create self restore node");
+		return;
+	}
+
+	self_restore_mask = zalloc(SPR_BITMAP_LENGTH / 8);
+	if (!self_restore_mask)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(self_restore_regs); i++) {
+		int bitmask_idx = self_restore_regs[i] / 64;
+		uint64_t bitmask_pos = self_restore_regs[i] % 64;
+		self_restore_mask[bitmask_idx] |= 1ul << bitmask_pos;
+	}
+
+	for (i = 0; i < (SPR_BITMAP_LENGTH / 64); i++) {
+		self_restore_mask[i] = cpu_to_be64(self_restore_mask[i]);
+	}
+
+	dt_add_property(self_restore, "sprn-bitmask", self_restore_mask,
+			SPR_BITMAP_LENGTH / 8);
+	dt_add_property_string(self_restore, "compatible",
+			       "ibm,opal-self-restore");
+	free(self_restore_mask);
+
+	if (proc_gen != proc_gen_p9 || !self_save_supported) {
+		prlog(PR_INFO, "SLW: self-save not supported on this platform");
+		return;
+	}
+
+	self_save = dt_new(power_mgt, "self-save");
+	if (!self_save) {
+		prerror("SLW: Failed to create self save node");
+		return;
+	}
+
+	self_save_mask = zalloc(SPR_BITMAP_LENGTH / 8);
+	if (!self_save_mask)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(self_save_regs); i++) {
+		int bitmask_idx = self_save_regs[i] / 64;
+		uint64_t bitmask_pos = self_save_regs[i] % 64;
+		self_save_mask[bitmask_idx] |= 1ul << bitmask_pos;
+	}
+
+	for (i = 0; i < (SPR_BITMAP_LENGTH / 64); i++) {
+		self_save_mask[i] = cpu_to_be64(self_save_mask[i]);
+	}
+
+	dt_add_property(self_save, "sprn-bitmask", self_save_mask,
+			SPR_BITMAP_LENGTH / 8);
+	dt_add_property_string(self_save, "compatible", "ibm,opal-self-save");
+	free(self_save_mask);
+}
+
 /* Add device tree properties to describe idle states */
 void add_cpu_idle_state_properties(void)
 {
@@ -1563,4 +1679,6 @@ void slw_init(void)
 		}
 	}
 	add_cpu_idle_state_properties();
+	if (has_deep_states)
+		add_cpu_self_save_restore_properties();
 }
diff --git a/include/skiboot.h b/include/skiboot.h
index 9ced240e..d3631dea 100644
--- a/include/skiboot.h
+++ b/include/skiboot.h
@@ -209,6 +209,7 @@ extern void early_uart_init(void);
 extern void homer_init(void);
 extern void slw_init(void);
 extern void add_cpu_idle_state_properties(void);
+extern void add_cpu_self_save_restore_properties(void);
 extern void lpc_rtc_init(void);
 
 /* flash support */
-- 
2.25.1

