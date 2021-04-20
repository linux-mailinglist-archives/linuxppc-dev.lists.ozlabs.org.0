Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 524203651E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 07:47:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPXl82MQpz30BJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 15:47:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KuGIhSh4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=vax4=jr=linux.ibm.com=sourabhjain@ozlabs.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KuGIhSh4; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPXkg1JGrz2xZg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 15:47:06 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4FPXkW5ZH8z9vFD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 15:46:59 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4FPXkW5GKBz9vDw; Tue, 20 Apr 2021 15:46:59 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KuGIhSh4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4FPXkT5sVwz9vDx;
 Tue, 20 Apr 2021 15:46:56 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13K5Yc3M090887; Tue, 20 Apr 2021 01:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=206p6hfJ0Ewr8vho6VcnE/W9AxRmF2psc/AQavftmU4=;
 b=KuGIhSh4oteBiThLeLyekfsfdRAEPS/bB4Tr8ZdsSORt0AbbVY3Gu8/hveTFLx56jzrB
 /8X7SGwJlXQUizPXBKWzOj0MvNkYs3cYDZ7lq+LapSRuBFA/xEUvfXGFsHPpdWkG84ua
 Tc3rXfePjnBJ4wbqzbtVru9Mibsw8Dqigv188Go2U77144op50gzpW/H4PBtoiuM2qZU
 xNwWuJgRdhPUhRjaNak0WLg1wrqDeGPxDbSHOX0WEpwZhDEalOATgaJJ0AifkcGxtMA7
 XXVWoJctBvGdzBY/wepPNII/7iQ66sq29KYSy/yX/zF4wcHNHHtbyK1SvG54LiFlLoAt RQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 381fmycsmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 01:46:53 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13K5fbLi018874;
 Tue, 20 Apr 2021 05:46:51 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 37yqa88t5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 05:46:51 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13K5kPhu29557006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 05:46:25 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38947A4054;
 Tue, 20 Apr 2021 05:46:48 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B3D2A405B;
 Tue, 20 Apr 2021 05:46:46 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.85.72.203])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Apr 2021 05:46:46 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v5] powerpc/kexec_file: use current CPU info while setting up
 FDT
Date: Tue, 20 Apr 2021 11:16:44 +0530
Message-Id: <20210420054644.1218593-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8EqPm3gpUVvSKBtgwPG5bP-sQruX5mQT
X-Proofpoint-GUID: 8EqPm3gpUVvSKBtgwPG5bP-sQruX5mQT
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-20_01:2021-04-19,
 2021-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104200042
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
Cc: mahesh@linux.vnet.ibm.com, Sourabh Jain <sourabhjain@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, stable@vger.kernel.org, hbathini@linux.ibm.com,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kexec_file_load uses initial_boot_params in setting up the device-tree
for the kernel to be loaded. Though initial_boot_params holds info
about CPUs at the time of boot, it doesn't account for hot added CPUs.

So, kexec'ing with kexec_file_load syscall would leave the kexec'ed
kernel with inaccurate CPU info. Also, if kdump kernel is loaded with
kexec_file_load syscall and the system crashes on a hot added CPU,
capture kernel hangs failing to identify the boot CPU.

 Kernel panic - not syncing: sysrq triggered crash
 CPU: 24 PID: 6065 Comm: echo Kdump: loaded Not tainted 5.12.0-rc5upstream #54
 Call Trace:
 [c0000000e590fac0] [c0000000007b2400] dump_stack+0xc4/0x114 (unreliable)
 [c0000000e590fb00] [c000000000145290] panic+0x16c/0x41c
 [c0000000e590fba0] [c0000000008892e0] sysrq_handle_crash+0x30/0x40
 [c0000000e590fc00] [c000000000889cdc] __handle_sysrq+0xcc/0x1f0
 [c0000000e590fca0] [c00000000088a538] write_sysrq_trigger+0xd8/0x178
 [c0000000e590fce0] [c0000000005e9b7c] proc_reg_write+0x10c/0x1b0
 [c0000000e590fd10] [c0000000004f26d0] vfs_write+0xf0/0x330
 [c0000000e590fd60] [c0000000004f2aec] ksys_write+0x7c/0x140
 [c0000000e590fdb0] [c000000000031ee0] system_call_exception+0x150/0x290
 [c0000000e590fe10] [c00000000000ca5c] system_call_common+0xec/0x278
 --- interrupt: c00 at 0x7fff905b9664
 NIP:  00007fff905b9664 LR: 00007fff905320c4 CTR: 0000000000000000
 REGS: c0000000e590fe80 TRAP: 0c00   Not tainted  (5.12.0-rc5upstream)
 MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28000242
       XER: 00000000
 IRQMASK: 0
 GPR00: 0000000000000004 00007ffff5fedf30 00007fff906a7300 0000000000000001
 GPR04: 000001002a7355b0 0000000000000002 0000000000000001 00007ffff5fef616
 GPR08: 0000000000000001 0000000000000000 0000000000000000 0000000000000000
 GPR12: 0000000000000000 00007fff9073a160 0000000000000000 0000000000000000
 GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
 GPR20: 0000000000000000 00007fff906a4ee0 0000000000000002 0000000000000001
 GPR24: 00007fff906a0898 0000000000000000 0000000000000002 000001002a7355b0
 GPR28: 0000000000000002 00007fff906a1790 000001002a7355b0 0000000000000002
 NIP [00007fff905b9664] 0x7fff905b9664
 LR [00007fff905320c4] 0x7fff905320c4
 --- interrupt: c00

To avoid this from happening, extract current CPU info from of_root
device node and use it for setting up the fdt in kexec_file_load case.

Fixes: 6ecd0163d360 ("powerpc/kexec_file: Add appropriate regions for memory reserve map")

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>
Cc: <stable@vger.kernel.org>
---
 arch/powerpc/kexec/file_load_64.c | 97 +++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

 ---
Changelog:

v1 -> v3
  - https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-April/227756.html

v3 -> v4
  - Rearranged if-else statement in update_cpus_node function to avoid
    redundant checks for positive cpus_offset. 

v4 -> v5
  - removed unnecessary else condition in update_cpus_node function
 ---

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 02b9e4d0dc40..6af3792dbf18 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -960,6 +960,98 @@ unsigned int kexec_fdt_totalsize_ppc64(struct kimage *image)
 	return fdt_size;
 }
 
+/**
+ * add_node_prop - Read property from device node structure and add
+ *			them to fdt.
+ * @fdt:		Flattened device tree of the kernel
+ * @node_offset:	offset of the node to add a property at
+ * np:			device node pointer
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int add_node_prop(void *fdt, int node_offset, const struct device_node *np)
+{
+	int ret = 0;
+	struct property *pp;
+	unsigned long flags;
+
+	if (!np)
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	for (pp = np->properties; pp; pp = pp->next) {
+		ret = fdt_setprop(fdt, node_offset, pp->name,
+				  pp->value, pp->length);
+		if (ret < 0) {
+			pr_err("Unable to add %s property: %s\n",
+			       pp->name, fdt_strerror(ret));
+			goto out;
+		}
+	}
+out:
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+	return ret;
+}
+
+/**
+ * update_cpus_node - Update cpus node of flattened device-tree using of_root
+ *			device node.
+ * @fdt:		Flattened device tree of the kernel.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int update_cpus_node(void *fdt)
+{
+	struct device_node *cpus_node, *dn;
+	int cpus_offset, cpus_subnode_off, ret = 0;
+
+	cpus_offset = fdt_path_offset(fdt, "/cpus");
+	if (cpus_offset < 0 && cpus_offset != -FDT_ERR_NOTFOUND) {
+		pr_err("Malformed device tree: error reading /cpus node: %s\n",
+		       fdt_strerror(cpus_offset));
+		return cpus_offset;
+	}
+
+	if (cpus_offset > 0) {
+		ret = fdt_del_node(fdt, cpus_offset);
+		if (ret < 0) {
+			pr_err("Error deleting /cpus node: %s\n",
+			       fdt_strerror(ret));
+			return -EINVAL;
+		}
+	}
+
+	/* Add cpus node to fdt */
+	cpus_offset = fdt_add_subnode(fdt, fdt_path_offset(fdt, "/"),
+				      "cpus");
+	if (cpus_offset < 0) {
+		pr_err("Error creating /cpus node: %s\n",
+		       fdt_strerror(cpus_offset));
+		return -EINVAL;
+	}
+
+	/* Add cpus node properties */
+	cpus_node = of_find_node_by_path("/cpus");
+	ret = add_node_prop(fdt, cpus_offset, cpus_node);
+	if (ret < 0)
+		return ret;
+
+	/* Loop through all subnodes of cpus and add them to fdt */
+	for_each_node_by_type(dn, "cpu") {
+		cpus_subnode_off = fdt_add_subnode(fdt, cpus_offset,
+						   dn->full_name);
+		if (cpus_subnode_off < 0) {
+			pr_err("Unable to add %s subnode: %s\n",
+			       dn->full_name, fdt_strerror(cpus_subnode_off));
+			return cpus_subnode_off;
+		}
+		ret = add_node_prop(fdt, cpus_subnode_off, dn);
+		if (ret < 0)
+			return ret;
+	}
+	return ret;
+}
+
 /**
  * setup_new_fdt_ppc64 - Update the flattend device-tree of the kernel
  *                       being loaded.
@@ -1020,6 +1112,11 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 		}
 	}
 
+	/* Update cpus nodes information to account hotplug CPUs. */
+	ret =  update_cpus_node(fdt);
+	if (ret < 0)
+		return ret;
+
 	/* Update memory reserve map */
 	ret = get_reserved_memory_ranges(&rmem);
 	if (ret)
-- 
2.26.3

