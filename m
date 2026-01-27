Return-Path: <linuxppc-dev+bounces-16299-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKcYHfI7eGnsowEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16299-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 05:15:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1678FD3E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 05:15:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0XBh21wrz2xjP;
	Tue, 27 Jan 2026 15:15:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769480294;
	cv=none; b=cMwwZiao8OYA+ZZZOFt+qr4Ul/tbFjbWjrlx4cAdN4l4YC/zg26eZwK4zil1jprREbKggHo7RqNY9YAnS13mifKL8cS8OqZoT6qbV+K2W0BBiS1cYhDaU434szRsZPpfVap8Dd/feK8Qod2/6nHAzI+OTNquboc12X3QA5sk/dw3+ZQg3mWSrG8l9hCC7Geiy2/agfE1pD66IMGmeB+xd0g4QV9a6vMp1Zre67YXuEh3fWm2F3q8NhfPdFkCxAClsesq9gWul/HiCT5U7Aoc5ms/bmJDGO4ouv2zU6GVXA8sm4Xsft2cjkPPUYlqADx4OeyQqkZUIPM0QVFf24r93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769480294; c=relaxed/relaxed;
	bh=ILbdrs4Bla+uWz0JeBAHQW7wW3rfgXE+tpe4Z9zQqSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m4rFGezjrAmvbrJHlmv4vtg9gGtMyzNPz8+MVB8fr/oeeKqIn1GwrX6i6ZP1plzB7q6arTo+/4NPzLh2ofdHf5Gygd6iC6mM2abSmLuk3A0uiX2p9/mfoNLPRyxARTvm4fzgvyBWjqp3uMCjUdqur9FNsOYG8Y99ldJ7ZvsCkr2Mw7Ds+puy88qoxen/AyNbaDNH5ctsJDuQBk0h6a++6cBh/ccz2A9disAx5Kzwy1VCOhkcc/en1nqHuClmHOv8ySgdOwdtm5d41D3XuJTXermSYq5t2WwuFB/0igpY1MaONIcnao6Rr02dmWE94TVVmpDEpJ5amiGNjOKdLGAOGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gaeYthzL; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=wenxiong@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gaeYthzL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=wenxiong@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0Tb948bgz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 13:18:13 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60QGJPHd007578
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 02:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=ILbdrs4Bla+uWz0JeBAHQW7wW3rfgXE+tpe4Z9zQq
	Sc=; b=gaeYthzLCD9CHB5TqyK/kOzjL+//blLxsW0TBFSaS6chmf6xy5hrrk+oa
	g0XFvYgMWjB1T/brofFDSHpXQa1KSuimrWu+F4F0TUs9p/uBDBGGLhPHVpEi26YU
	b5o9/ixEFWuLEvHaoTmbAGS80WCTaqwejrlHm3Qp7cVQcBuayEIHn+jKBK+R4NuE
	8PULamz25oyWnZW6cIbsqPPLf3IJQGGz8OZ1LAyGru5SkY92M6PxWh1fRkDsVl9J
	oMzQoteRIvHcG4niXJgeHJICLclQUYr9LlA37O6eDSfAJQEL7WLngTo6M0GAZvFY
	Knusygl03d8BFq9a+g5N9xvrZQm0A==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnr61fgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 02:18:10 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60R21qLg019630
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 02:18:09 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bw9dmxyae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 02:18:09 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60R2I6og26935992
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jan 2026 02:18:06 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19BC558054;
	Tue, 27 Jan 2026 02:18:06 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7BE5158055;
	Tue, 27 Jan 2026 02:18:05 +0000 (GMT)
Received: from ltcrain119-lp4.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 Jan 2026 02:18:05 +0000 (GMT)
From: wenxiong@linux.ibm.com
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, haren@linux.ibm.com, tyreld@linux.ibm.com,
        Wen Xiong <wenxiong@linux.ibm.com>
Subject: [PATCH] error path improvement in dlpar add
Date: Mon, 26 Jan 2026 20:18:45 -0600
Message-ID: <20260127021845.2326-1-wenxiong@linux.ibm.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAxNyBTYWx0ZWRfX6XlvXlk71feW
 TJMV6zqizXdSh+oxoWJTVMTmMYSJY6VfZq0YRm0upwelDHFnPkwg/CdNx2d+6U57JijIIOj3HRG
 NO07m2pykRIFkf6kZDVly2buJjGpHoLYYBvX3qT+aUe97e4+ljmwODE9XsRndphjmEc6VR9TNHF
 t660zC94ILhvXXtAphfcu6IySs3hPYpvq8kvxnJHUjevpsnaxjXFzkhllRNMWGIljeAKGOXsg4c
 PThFh4BAdLGPrLBd63vETBLa2iVZSfi8uYlCS+q4sjcXpL216vPz3/VgKcCpnWvwyqwxhfO74Uh
 4nsAE/dxhshx0DeUveDQqnIqlO0hRelH6xXJ40XnS7egb8G5ZtC+VMhA99F8e6Q+vzQUTq6piEj
 wCRhAAF4MMe40lPbSmxs4qek7M0uX+curh+vCaT8JprZV+Q9bnci06E1l3c1MBnZ7kZwXsI+gL/
 wQT/eeyFCNAbd4ZrCtw==
X-Proofpoint-GUID: 3rWMY9WT1LIaeN77jcnbsZuFHGA0IQYD
X-Proofpoint-ORIG-GUID: 3rWMY9WT1LIaeN77jcnbsZuFHGA0IQYD
X-Authority-Analysis: v=2.4 cv=X+Vf6WTe c=1 sm=1 tr=0 ts=69782062 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=WJWy47JjtfI5XqIBqRAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601270017
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-16299-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[133.3.45.187:email,linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[wenxiong@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BE1678FD3E
X-Rspamd-Action: no action

From: Wen Xiong <wenxiong@linux.ibm.com>

When doing a dlpar adding a device back, expect not loading device driver
if claiming pci resource failed.

Validating PHB DLPAR capability...yes.
[ 4928.798012] pci_bus 0187:c0: root bus resource [bus c0-ff]
[ 4928.798038] pci 0187:c0:00.0: No hypervisor support for SR-IOV on this device, IOV BARs disabled.
[ 4928.815867] pci 0187:c0:00.0: BAR 0 [mem 0xb0020000-0xb0027fff 64bit]: can't claim; no compatible bridge window

---> Expect to exit if claiming resources fails(BAR0)

[ 4928.815899] pci 0187:c0:00.0: ROM [mem 0xb0000000-0xb001ffff]: can't claim; no compatible bridge window

--->Expect to exit if claiming resources fails(ROM), don't load device
driver anymore, showed "dlpar add failed"

[ 4928.815913] pci 0187:c0:00.0: ROM [mem 0x40000000000-0x4000001ffff]: assigned
[ 4928.815923] pci 0187:c0:00.0: BAR 0 [mem 0x40800000000-0x40800007fff 64bit]: assigned
[ 4928.816220] pci 0187:c0:00.0: BAR 0: error updating (0x00000004 != 0xffffffff)
[ 4928.816364] pci 0187:c0:00.0: BAR 0: error updating (high 0x00060238 != 0xffffffff)
[ 4928.816839] pci 0187:c0:00.0: ibm,query-pe-dma-windows(53) b00000 8000000 20000187 returned -3, lb=0 ps=0 wn=0
[ 4928.816855] pci 0187:c0:00.0: spapr_tce_init_table_group: query_ddw failed
[ 4928.816871] pci 0187:c0:00.0: Adding to iommu group 1
[ 4928.816952] pci 0187:c0:00.0: of_irq_parse_pci: no interrupt-map found, INTx interrupts not available
[ 4928.818135] nvme 0187:c0:00.0: ibm,query-pe-dma-windows(53) b00000 8000000 20000187 returned -3, lb=0 ps=0 wn=0
[ 4928.818284] nvme nvme1: pci function 0187:c0:00.0
[ 4928.819321] rpaphp: Slot [U78DB.ND0.WZS08E2-P1-C7] registered
[ 4928.819338] rpadlpar_io: slot PHB 391 added

With adding error path checking, didn't load the device driver anymore
if claiming resources failed.

Validating PHB DLPAR capability...yes.
[  260.414453] PCI host bridge /pci@800000020000187  ranges:
[  260.414473]  MEM 0x0000040000000000..0x0000040007ffffff -> 0x00000000b8000000
[  260.414480]  MEM 0x0000040800000000..0x0000040fffffffff -> 0x0006023800000000
[  260.414915] PCI host bridge to bus 0187:c0
[  260.414922] pci_bus 0187:c0: root bus resource [mem 0x40000000000-0x40007ffffff] (bus address [0xb8000000-0xbfffffff])
[  260.414929] pci_bus 0187:c0: root bus resource [mem 0x40800000000-0x40fffffffff 64bit] (bus address [0x6023800000000-0x6023fffffffff])
[  260.414936] pci_bus 0187:c0: root bus resource [bus c0-ff]
[  260.414948] pci 0187:c0:00.0: No hypervisor support for SR-IOV on this device, IOV BARs disabled.
[  260.423439] pci 0187:c0:00.0: BAR 0 [mem 0xb0020000-0xb0027fff 64bit]: can't claim; no compatible bridge window
[  260.423463] after pci_cliam_Resource=-22   ----> pci_claim_resources fails.

[  260.423471] rpadlpar_io: slot PHB 391 added failed rc=-5  -----> added failed.

Signed-off-by: Wen Xiong <wenxiong@linux.ibm.com>
Reviewed-by: Haren Myneni <haren@linux.ibm.com>
Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 arch/powerpc/include/asm/pci.h             |  4 ++--
 arch/powerpc/kernel/pci-common.c           | 23 +++++++++++++++++-----
 arch/powerpc/kernel/pci-hotplug.c          |  5 ++++-
 arch/powerpc/platforms/pseries/pci_dlpar.c |  3 ++-
 drivers/pci/hotplug/rpadlpar_core.c        |  7 ++++++-
 5 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/pci.h b/arch/powerpc/include/asm/pci.h
index 46a9c4491ed0..ebeb912a92bf 100644
--- a/arch/powerpc/include/asm/pci.h
+++ b/arch/powerpc/include/asm/pci.h
@@ -86,9 +86,9 @@ extern void pci_adjust_legacy_attr(struct pci_bus *bus,
 				   enum pci_mmap_state mmap_type);
 #define HAVE_PCI_LEGACY	1
 
-extern void pcibios_claim_one_bus(struct pci_bus *b);
+extern int pcibios_claim_one_bus(struct pci_bus *b);
 
-extern void pcibios_finish_adding_to_bus(struct pci_bus *bus);
+extern int pcibios_finish_adding_to_bus(struct pci_bus *bus);
 
 extern void pcibios_resource_survey(void);
 
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index eac84d687b53..b16f43c7f02e 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -1446,10 +1446,11 @@ void __init pcibios_resource_survey(void)
  * rest of the code later, for now, keep it as-is as our main
  * resource allocation function doesn't deal with sub-trees yet.
  */
-void pcibios_claim_one_bus(struct pci_bus *bus)
+int pcibios_claim_one_bus(struct pci_bus *bus)
 {
 	struct pci_dev *dev;
 	struct pci_bus *child_bus;
+	int ret = 0;
 
 	list_for_each_entry(dev, &bus->devices, bus_list) {
 		struct resource *r;
@@ -1462,15 +1463,20 @@ void pcibios_claim_one_bus(struct pci_bus *bus)
 			pr_debug("PCI: Claiming %s: Resource %d: %pR\n",
 				 pci_name(dev), i, r);
 
-			if (pci_claim_resource(dev, i) == 0)
+			ret = pci_claim_resource(dev, i);
+			if (ret == 0)
 				continue;
+			else
+				return ret;
 
 			pci_claim_bridge_resource(dev, i);
 		}
 	}
 
 	list_for_each_entry(child_bus, &bus->children, node)
-		pcibios_claim_one_bus(child_bus);
+		ret = pcibios_claim_one_bus(child_bus);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(pcibios_claim_one_bus);
 
@@ -1481,14 +1487,19 @@ EXPORT_SYMBOL_GPL(pcibios_claim_one_bus);
  * added to a bus, this include calling it for a PHB that is just
  * being added
  */
-void pcibios_finish_adding_to_bus(struct pci_bus *bus)
+int pcibios_finish_adding_to_bus(struct pci_bus *bus)
 {
+	int ret = 0;
+
 	pr_debug("PCI: Finishing adding to hotplug bus %04x:%02x\n",
 		 pci_domain_nr(bus), bus->number);
 
 	/* Allocate bus and devices resources */
 	pcibios_allocate_bus_resources(bus);
-	pcibios_claim_one_bus(bus);
+	ret = pcibios_claim_one_bus(bus);
+	if (ret)
+		return ret;
+
 	if (!pci_has_flag(PCI_PROBE_ONLY)) {
 		if (bus->self)
 			pci_assign_unassigned_bridge_resources(bus->self);
@@ -1498,6 +1509,8 @@ void pcibios_finish_adding_to_bus(struct pci_bus *bus)
 
 	/* Add new devices to global lists.  Register in proc, sysfs. */
 	pci_bus_add_devices(bus);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(pcibios_finish_adding_to_bus);
 
diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
index 6f444d0822d8..133ce03fdd82 100644
--- a/arch/powerpc/kernel/pci-hotplug.c
+++ b/arch/powerpc/kernel/pci-hotplug.c
@@ -140,6 +140,7 @@ void pci_hp_add_devices(struct pci_bus *bus)
 	struct pci_dev *dev;
 	struct pci_controller *phb;
 	struct device_node *dn = pci_bus_to_OF_node(bus);
+	int ret = 0;
 
 	if (!dn)
 		return;
@@ -176,6 +177,8 @@ void pci_hp_add_devices(struct pci_bus *bus)
 		for_each_pci_bridge(dev, bus)
 			max = pci_scan_bridge(bus, dev, max, 1);
 	}
-	pcibios_finish_adding_to_bus(bus);
+	ret = pcibios_finish_adding_to_bus(bus);
+	if (ret)
+		pr_err("%s: unable to add hotplug pci device!\n");
 }
 EXPORT_SYMBOL_GPL(pci_hp_add_devices);
diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/platforms/pseries/pci_dlpar.c
index 8c77ec7980de..2b78faba40f6 100644
--- a/arch/powerpc/platforms/pseries/pci_dlpar.c
+++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
@@ -58,7 +58,8 @@ struct pci_controller *init_phb_dynamic(struct device_node *dn)
 		pseries_eeh_init_edev_recursive(PCI_DN(dn));
 
 	pcibios_scan_phb(phb);
-	pcibios_finish_adding_to_bus(phb->bus);
+	if (pcibios_finish_adding_to_bus(phb->bus))
+		return NULL;
 
 	return phb;
 }
diff --git a/drivers/pci/hotplug/rpadlpar_core.c b/drivers/pci/hotplug/rpadlpar_core.c
index 980bb3afd092..4c507dd04fa1 100644
--- a/drivers/pci/hotplug/rpadlpar_core.c
+++ b/drivers/pci/hotplug/rpadlpar_core.c
@@ -240,8 +240,10 @@ static int dlpar_add_phb(char *drc_name, struct device_node *dn)
 	}
 
 	phb = init_phb_dynamic(dn);
-	if (!phb)
+	if (!phb) {
+		pr_err("%s: unable to add hotplug slot %s\n", drc_name);
 		return -EIO;
+	}
 
 	if (rpaphp_add_slot(dn)) {
 		printk(KERN_ERR "%s: unable to add hotplug slot %s\n",
@@ -311,6 +313,9 @@ int dlpar_add_slot(char *drc_name)
 	}
 	of_node_put(dn);
 
+	if (rc)
+		goto exit;
+
 	printk(KERN_INFO "%s: slot %s added\n", DLPAR_MODULE_NAME, drc_name);
 exit:
 	mutex_unlock(&rpadlpar_mutex);
-- 
2.47.3


