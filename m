Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7C8837611
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 23:25:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=poRfCOKg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJlCP31m1z3bwX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 09:25:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=poRfCOKg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJlBV0HX7z30YR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 09:24:17 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40ML8uEW025831;
	Mon, 22 Jan 2024 22:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=iRHbQgmrTzp1HRJNzUPQrEN9Ad2eSPmUeIRqPalVWAo=;
 b=poRfCOKgl7qbeG9TSl4eby8Eny0pXZ6VQjei7BdcrQbbGtTuGe9mIN8N5VwwMOipaQff
 ZeDUEa+z/gTuF43m1IxWO/wPTj6ShSmzf5DptyAXNJWAinDsRvVY2TPlMwcSoL0o37F9
 4qJFJQbSiHdFVzfeWD6YWTKV3uPeEI2E70FFJDLucxed3oFVVtq+SafsmTzGOJZVjC5D
 ZR3B57cyLV/BV7qECz1AI4yZizDV7yveuGqgSlKH1/neMBeVluaN4piKrd4PGkNtPg7V
 llyt6e7f3vnrxW2+fDjj6H+rfe4NuljjrxkdWwkEEUg1cW7TcJ/pKHJS115GKv1QMHrT ww== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vswk0dpj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 22:24:11 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40ML4aTV028225;
	Mon, 22 Jan 2024 22:24:10 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vru72ay7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 22:24:10 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40MMO90B60293536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jan 2024 22:24:09 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BB4058059;
	Mon, 22 Jan 2024 22:24:09 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA10B58043;
	Mon, 22 Jan 2024 22:24:08 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.168.182])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Jan 2024 22:24:08 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/pseries/iommu: DLPAR ADD of pci device doesn't completely initialize pci_controller structure
Date: Mon, 22 Jan 2024 16:24:07 -0600
Message-Id: <20240122222407.39603-1-gbatra@linux.ibm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RmuEwD_8P1tg7I8XpKSYs_sF4sgM3ZPD
X-Proofpoint-GUID: RmuEwD_8P1tg7I8XpKSYs_sF4sgM3ZPD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_11,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401220159
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
Cc: Gaurav Batra <gbatra@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a PCI device is Dynamically added, LPAR OOPS with NULL pointer
exception.

Complete stack is as below

[  211.239206] BUG: Kernel NULL pointer dereference on read at 0x00000030
[  211.239210] Faulting instruction address: 0xc0000000006bbe5c
[  211.239214] Oops: Kernel access of bad area, sig: 11 [#1]
[  211.239218] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
[  211.239223] Modules linked in: rpadlpar_io rpaphp rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd grace fscache netfs xsk_diag bonding nft_compat nf_tables nfnetlink rfkill binfmt_misc dm_multipath rpcrdma sunrpc rdma_ucm ib_srpt ib_isert iscsi_target_mod target_core_mod ib_umad ib_iser libiscsi scsi_transport_iscsi ib_ipoib rdma_cm iw_cm ib_cm mlx5_ib ib_uverbs ib_core pseries_rng drm drm_panel_orientation_quirks xfs libcrc32c mlx5_core mlxfw sd_mod t10_pi sg tls ibmvscsi ibmveth scsi_transport_srp vmx_crypto pseries_wdt psample dm_mirror dm_region_hash dm_log dm_mod fuse
[  211.239280] CPU: 17 PID: 2685 Comm: drmgr Not tainted 6.7.0-203405+ #66
[  211.239284] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_008) hv:phyp pSeries
[  211.239289] NIP:  c0000000006bbe5c LR: c000000000a13e68 CTR: c0000000000579f8
[  211.239293] REGS: c00000009924f240 TRAP: 0300   Not tainted  (6.7.0-203405+)
[  211.239298] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24002220  XER: 20040006
[  211.239306] CFAR: c000000000a13e64 DAR: 0000000000000030 DSISR: 40000000 IRQMASK: 0
[  211.239306] GPR00: c000000000a13e68 c00000009924f4e0 c0000000015a2b00 0000000000000000
[  211.239306] GPR04: c0000000013c5590 0000000000000000 c000000006d07970 c0000000d8f8f180
[  211.239306] GPR08: 00000000000006ec c0000000d8f8f180 c000000002c35d58 0000000024002228
[  211.239306] GPR12: c0000000000579f8 c0000003ffeb3880 0000000000000000 0000000000000000
[  211.239306] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[  211.239306] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[  211.239306] GPR24: c0000000919460c0 0000000000000000 fffffffffffff000 c0000000010088e8
[  211.239306] GPR28: c0000000013c5590 c000000006d07970 c0000000919460c0 c0000000919460c0
[  211.239354] NIP [c0000000006bbe5c] sysfs_add_link_to_group+0x34/0x94
[  211.239361] LR [c000000000a13e68] iommu_device_link+0x5c/0x118
[  211.239367] Call Trace:
[  211.239369] [c00000009924f4e0] [c000000000a109b8] iommu_init_device+0x26c/0x318 (unreliable)
[  211.239376] [c00000009924f520] [c000000000a13e68] iommu_device_link+0x5c/0x118
[  211.239382] [c00000009924f560] [c000000000a107f4] iommu_init_device+0xa8/0x318
[  211.239387] [c00000009924f5c0] [c000000000a11a08] iommu_probe_device+0xc0/0x134
[  211.239393] [c00000009924f600] [c000000000a11ac0] iommu_bus_notifier+0x44/0x104
[  211.239398] [c00000009924f640] [c00000000018dcc0] notifier_call_chain+0xb8/0x19c
[  211.239405] [c00000009924f6a0] [c00000000018df88] blocking_notifier_call_chain+0x64/0x98
[  211.239411] [c00000009924f6e0] [c000000000a250fc] bus_notify+0x50/0x7c
[  211.239416] [c00000009924f720] [c000000000a20838] device_add+0x640/0x918
[  211.239421] [c00000009924f7f0] [c0000000008f1a34] pci_device_add+0x23c/0x298
[  211.239427] [c00000009924f840] [c000000000077460] of_create_pci_dev+0x400/0x884
[  211.239432] [c00000009924f8e0] [c000000000077a08] of_scan_pci_dev+0x124/0x1b0
[  211.239437] [c00000009924f980] [c000000000077b0c] __of_scan_bus+0x78/0x18c
[  211.239442] [c00000009924fa10] [c000000000073f90] pcibios_scan_phb+0x2a4/0x3b0
[  211.239447] [c00000009924fad0] [c0000000001007a8] init_phb_dynamic+0xb8/0x110
[  211.239453] [c00000009924fb40] [c008000006920620] dlpar_add_slot+0x170/0x3b8 [rpadlpar_io]
[  211.239461] [c00000009924fbe0] [c008000006920d64] add_slot_store.part.0+0xb4/0x130 [rpadlpar_io]
[  211.239468] [c00000009924fc70] [c000000000fb4144] kobj_attr_store+0x2c/0x48
[  211.239473] [c00000009924fc90] [c0000000006b90e4] sysfs_kf_write+0x64/0x78
[  211.239479] [c00000009924fcb0] [c0000000006b7b78] kernfs_fop_write_iter+0x1b0/0x290
[  211.239485] [c00000009924fd00] [c0000000005b6fdc] vfs_write+0x350/0x4a0
[  211.239491] [c00000009924fdc0] [c0000000005b7450] ksys_write+0x84/0x140
[  211.239496] [c00000009924fe10] [c000000000030a04] system_call_exception+0x124/0x330
[  211.239502] [c00000009924fe50] [c00000000000cedc] system_call_vectored_common+0x15c/0x2ec

Commit a940904443e4 ("powerpc/iommu: Add iommu_ops to report capabilities
and allow blocking domains") broke DLPAR ADD of pci devices.

The above added iommu_device structure to pci_controller. During
system boot, pci devices are discovered and this newly added iommu_device
structure initialized by a call to iommu_device_register().

During DLPAR ADD of a PCI device, a new pci_controller structure is
allocated but there are no calls made to iommu_device_register()
interface.

Fix would be to register iommu device during DLPAR ADD as well.

Fixes: a940904443e4 ("powerpc/iommu: Add iommu_ops to report capabilities and allow blocking domains")
Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
---
 arch/powerpc/include/asm/ppc-pci.h         |  3 +++
 arch/powerpc/kernel/iommu.c                | 21 ++++++++++++++++-----
 arch/powerpc/platforms/pseries/pci_dlpar.c |  4 ++++
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-pci.h b/arch/powerpc/include/asm/ppc-pci.h
index ce2b1b5eebdd..c3a3f3df36d1 100644
--- a/arch/powerpc/include/asm/ppc-pci.h
+++ b/arch/powerpc/include/asm/ppc-pci.h
@@ -29,6 +29,9 @@ void *pci_traverse_device_nodes(struct device_node *start,
 				void *(*fn)(struct device_node *, void *),
 				void *data);
 extern void pci_devs_phb_init_dynamic(struct pci_controller *phb);
+extern void ppc_iommu_register_device(struct pci_controller *phb);
+extern void ppc_iommu_unregister_device(struct pci_controller *phb);
+
 
 /* From rtas_pci.h */
 extern void init_pci_config_tokens (void);
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index ebe259bdd462..c6f62e130d55 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1388,6 +1388,21 @@ static const struct attribute_group *spapr_tce_iommu_groups[] = {
 	NULL,
 };
 
+void ppc_iommu_register_device(struct pci_controller *phb)
+{
+	iommu_device_sysfs_add(&phb->iommu, phb->parent,
+				spapr_tce_iommu_groups, "iommu-phb%04x",
+				phb->global_number);
+	iommu_device_register(&phb->iommu, &spapr_tce_iommu_ops,
+				phb->parent);
+}
+
+void ppc_iommu_unregister_device(struct pci_controller *phb)
+{
+	iommu_device_unregister(&phb->iommu);
+	iommu_device_sysfs_remove(&phb->iommu);
+}
+
 /*
  * This registers IOMMU devices of PHBs. This needs to happen
  * after core_initcall(iommu_init) + postcore_initcall(pci_driver_init) and
@@ -1398,11 +1413,7 @@ static int __init spapr_tce_setup_phb_iommus_initcall(void)
 	struct pci_controller *hose;
 
 	list_for_each_entry(hose, &hose_list, list_node) {
-		iommu_device_sysfs_add(&hose->iommu, hose->parent,
-				       spapr_tce_iommu_groups, "iommu-phb%04x",
-				       hose->global_number);
-		iommu_device_register(&hose->iommu, &spapr_tce_iommu_ops,
-				      hose->parent);
+		ppc_iommu_register_device(hose);
 	}
 	return 0;
 }
diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/platforms/pseries/pci_dlpar.c
index 4ba824568119..4448386268d9 100644
--- a/arch/powerpc/platforms/pseries/pci_dlpar.c
+++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
@@ -35,6 +35,8 @@ struct pci_controller *init_phb_dynamic(struct device_node *dn)
 
 	pseries_msi_allocate_domains(phb);
 
+	ppc_iommu_register_device(phb);
+
 	/* Create EEH devices for the PHB */
 	eeh_phb_pe_create(phb);
 
@@ -76,6 +78,8 @@ int remove_phb_dynamic(struct pci_controller *phb)
 		}
 	}
 
+	ppc_iommu_unregister_device(phb);
+
 	pseries_msi_free_domains(phb);
 
 	/* Keep a reference so phb isn't freed yet */
-- 
2.39.3 (Apple Git-145)

