Return-Path: <linuxppc-dev+bounces-16406-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOkKBPnNe2l4IgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16406-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 22:15:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6FFB4889
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 22:15:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2BkZ0620z2xMQ;
	Fri, 30 Jan 2026 08:15:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.177.32
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769709178;
	cv=none; b=gRbaCxGcrsgUlW+34y/CCJ5hGIxGBWSU/LzVW4t8AJikBkXItfJdEjDibTuMtu3hyV4VYg6V3FBQPaDhp9EiecFRQOigQfCo6JXWTMe6Zn+1F7YuijkPyB2lK7zMat1/uG1omTfzVA0mrVIpGnn6Hlwh8slCMHdkMZpQholLDCC29iIB8w6Y+HoeYjf1Vfy9iX2HGgGt9W3Qf5zCL/m78YegYfh7EZJUWpT59CIFW2U9UI+l/lhmRwlowzp9RohFBUXyX4rG2RYdBGgrZeOuzRLTblXskslnxB/uekgo6JtLhemoIqKyTsG+smNzcb68757miljRmNbT3ENQtsqlug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769709178; c=relaxed/relaxed;
	bh=fwb2FMXA5tJtyDq/Zqal//2M2OPh3VodiSxTtoTaLBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hdp6jLLk4HMHVTakIZOOT7S+MIwmXUwqBvTvP/w7tfDxOXKZ4EK2bKFNVb9naeHEy7OlnZYjxS0iNRtwLfb9qTnX48yRA0gHt7E0B+K3y3gs8mOJeMlI9EaE1ru664Qsh7SMVVrSum9BnxdtZo7QAo+7Nxivm3Y5Kup/cxajCWR618ZIo26ydMz7R7bEGxlCffG8pg0YE6h/eRehlaBvm+67dPq0CwViQMDIb4tM4vAa8bM0Y6Dj6agOPUZapLbW4mgEnqtXRNUZzijDcf+NK+h09AAqvaNLAMavIEx5hZ7qlrY5NuMy+3XWs99Oc2xqz/YudDmkWvRIst4LhQmNkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=VsWJ2VKR; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=haakon.bugge@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=VsWJ2VKR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=haakon.bugge@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f26Dn1Kl8z2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 04:52:56 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TDgJNf1278673;
	Thu, 29 Jan 2026 17:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=fwb2FMXA5tJtyDq/Zqal//2M2OPh3VodiSxTtoTaLBU=; b=
	VsWJ2VKRf3OjE1laDkpNztObe9cr/Rf1nFHxMq/69fqkJmT9h89cVc6xH+ISzCUE
	tqKgZjunorm5a6iWAz1fJqzS60ynjbzKpsPZW2I1mPOKx6JbdK0f4RVvrUtq06GR
	UpFVjkSPdT1UDPS5b4dja6UoPWAQjMzlaAsOHTdiLY2A875kDcBvgNxLNRdlXTUw
	8y7cqgpRGLxNKyjuWOWkmaaNA64ryENQm9+Y/vwXIPkAVEnz9KHmua+nQa+MfaC1
	DL6GTQfDTkC1PAulgOJwCUH0mzmp0QaAB+I5IUjx6qsi7VRuRYWtjVKI3/DPWIlW
	wfskegk/uQbPtTIBwgaBTQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4by2xquu2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Jan 2026 17:52:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60TH18iq019819;
	Thu, 29 Jan 2026 17:52:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhhyfff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Jan 2026 17:52:46 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60THllYh012086;
	Thu, 29 Jan 2026 17:52:45 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4bvmhhyfc3-3;
	Thu, 29 Jan 2026 17:52:45 +0000
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        "Oliver O'Halloran" <oohall@gmail.com>,
        Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>,
        Greg Kroah-Hartman <gregkh@suse.de>
Cc: Alex Williamson <alex@shazbot.org>,
        Johannes Thumshirn <morbidrsa@gmail.com>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 2/2] PCI/ACPI: Restrict program_hpx_type2() to AER bits
Date: Thu, 29 Jan 2026 18:52:33 +0100
Message-ID: <20260129175237.727059-3-haakon.bugge@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260129175237.727059-1-haakon.bugge@oracle.com>
References: <20260129175237.727059-1-haakon.bugge@oracle.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601290126
X-Proofpoint-GUID: jTAJP50xMzHjPyfLiE3zB8lMmrucg_11
X-Proofpoint-ORIG-GUID: jTAJP50xMzHjPyfLiE3zB8lMmrucg_11
X-Authority-Analysis: v=2.4 cv=UepciaSN c=1 sm=1 tr=0 ts=697b9e6e b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8 a=SsKr03gcbRYbsVN0MpsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDEyNiBTYWx0ZWRfX1fAyVDYiClBu
 z17eEuc0YoENcle/VRABxs8D4vTxTXhqx9QGV4lBx7bdJ+k9IGdDW1sqQTxTG0xJBVJmotgBVZm
 vsc3IFJXZRha6liP7elgozwPwNiFGbunTG27JDrxDTFeC7OjaFrRkFNwUwOk1sAnkOUey0ozYlR
 14FO5bqN2i+0tgpkZDFxVinNeL7EMl0ExdzcIlGGG5R3BYiNpfdRzngGN7GmEMeyLQyKF4DFTtP
 4+AM0gQHVt8PEL+mhvMxiJsFhWtjtB4/F5G05rOdvogA/5cKuhj0E6936S+sS1tCTJHR8MzMAyU
 ACZiM7A/FohAgx/vHSnmVIaHjV6io9htTqU2fj+ThvgvFWWl3zSeEmNZcTgJiCAFA6sAOt0DXnB
 542AhQvQVt3lvbck9aGa3VWNq1kQpfKoFduLtr7wEGxr659rndEj90gZ5A5ndywvoOInYNv8kyX
 2Yio5A4ROwzWd1cfAi85Z0v9gZsAVZLfyZgmXxZ4=
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16406-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,oracle.com:email,oracle.com:dkim,oracle.com:mid];
	FREEMAIL_TO(0.00)[google.com,linux.ibm.com,kernel.org,gmail.com,jp.fujitsu.com,suse.de];
	FORGED_SENDER(0.00)[haakon.bugge@oracle.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:schnelle@linux.ibm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:kaneshige.kenji@jp.fujitsu.com,m:gregkh@suse.de,m:alex@shazbot.org,m:morbidrsa@gmail.com,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:haakon.bugge@oracle.com,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[shazbot.org,gmail.com,vger.kernel.org,oracle.com,lists.ozlabs.org];
	DKIM_TRACE(0.00)[oracle.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haakon.bugge@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3D6FFB4889
X-Rspamd-Action: no action

Previously program_hpx_type2() applied PCIe settings unconditionally,
which could incorrectly change bits like Extended Tag Field Enable and
Enable Relaxed Ordering.

When _HPX was added to ACPI r3.0, the intent of the PCIe Setting
Record (Type 2) in sec 6.2.7.3 was to configure AER registers when the
OS does not own the AER Capability:

  The PCI Express setting record contains ... [the AER] Uncorrectable
  Error Mask, Uncorrectable Error Severity, Correctable Error Mask
  ... to be used when configuring registers in the Advanced Error
  Reporting Extended Capability Structure ...

  OSPM [1] will only evaluate _HPX with Setting Record – Type 2 if
  OSPM is not controlling the PCI Express Advanced Error Reporting
  capability.

ACPI r3.0b, sec 6.2.7.3, added more AER registers, including registers
in the PCIe Capability with AER-related bits, and the restriction that
the OS use this only when it owns PCIe native hotplug:

  ... when configuring PCI Express registers in the Advanced Error
  Reporting Extended Capability Structure *or PCI Express Capability
  Structure* ...

  An OS that has assumed ownership of native hot plug but does not
  ... have ownership of the AER register set must use ... the Type 2
  record to program the AER registers ...

  However, since the Type 2 record also includes register bits that
  have functions other than AER, the OS must ignore values ... that
  are not applicable.

Restrict program_hpx_type2() to only the intended purpose:

  - Apply settings only when OS owns PCIe native hotplug but not AER,

  - Only touch the AER-related bits (Error Reporting Enables) in Device
    Control

  - Don't touch Link Control at all, since nothing there seems AER-related,
    but log _HPX settings for debugging purposes

Note that Read Completion Boundary is now configured elsewhere, since it is
unrelated to _HPX.

[1] Operating System-directed configuration and Power Management

Fixes: 40abb96c51bb ("[PATCH] pciehp: Fix programming hotplug parameters")
Signed-off-by: Håkon Bugge <haakon.bugge@oracle.com>

---

v3 -> v4:
   * Improved commit message
   * Corrected info log when _HPX attempts to modify the Link Control
     register

v2 -> v3:
   * No changes

v1 -> v2:
   * Fixed comment style
   * Simplified the and/or logic when programming the Device Control
     register
   * Fixed the incorrect and brutal warning about Link Control
     register bits set and changed it to an info message about _HPX
     attempting to set/reset bits therein.
   * Removed the RCB programming from program_hpx_type2()
   * Moved the PCI_EXP_AER_FLAGS definition from
     drivers/pci/pcie/aer.c to drivers/pci/pci.h
---
 drivers/pci/pci-acpi.c | 58 +++++++++++++++++-------------------------
 drivers/pci/pci.h      |  3 +++
 drivers/pci/pcie/aer.c |  3 ---
 3 files changed, 27 insertions(+), 37 deletions(-)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 9369377725fa0..3ffceaa7603c0 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -271,21 +271,6 @@ static acpi_status decode_type1_hpx_record(union acpi_object *record,
 	return AE_OK;
 }
 
-static bool pcie_root_rcb_set(struct pci_dev *dev)
-{
-	struct pci_dev *rp = pcie_find_root_port(dev);
-	u16 lnkctl;
-
-	if (!rp)
-		return false;
-
-	pcie_capability_read_word(rp, PCI_EXP_LNKCTL, &lnkctl);
-	if (lnkctl & PCI_EXP_LNKCTL_RCB)
-		return true;
-
-	return false;
-}
-
 /* _HPX PCI Express Setting Record (Type 2) */
 struct hpx_type2 {
 	u32 revision;
@@ -311,6 +296,7 @@ static void program_hpx_type2(struct pci_dev *dev, struct hpx_type2 *hpx)
 {
 	int pos;
 	u32 reg32;
+	const struct pci_host_bridge *host;
 
 	if (!hpx)
 		return;
@@ -318,6 +304,15 @@ static void program_hpx_type2(struct pci_dev *dev, struct hpx_type2 *hpx)
 	if (!pci_is_pcie(dev))
 		return;
 
+	host = pci_find_host_bridge(dev->bus);
+
+	/*
+	 * We only do the HP programming if we own the PCIe native
+	 * hotplug and not the AER ownership
+	 */
+	if (!host->native_pcie_hotplug || host->native_aer)
+		return;
+
 	if (hpx->revision > 1) {
 		pci_warn(dev, "PCIe settings rev %d not supported\n",
 			 hpx->revision);
@@ -325,33 +320,28 @@ static void program_hpx_type2(struct pci_dev *dev, struct hpx_type2 *hpx)
 	}
 
 	/*
-	 * Don't allow _HPX to change MPS or MRRS settings.  We manage
-	 * those to make sure they're consistent with the rest of the
+	 * We only allow _HPX to program the AER registers, namely
+	 * PCI_EXP_DEVCTL_CERE, PCI_EXP_DEVCTL_NFERE,
+	 * PCI_EXP_DEVCTL_FERE, and PCI_EXP_DEVCTL_URRE.
+	 *
+	 * The other settings in PCIe DEVCTL are managed by OS in
+	 * order to make sure they're consistent with the rest of the
 	 * platform.
 	 */
-	hpx->pci_exp_devctl_and |= PCI_EXP_DEVCTL_PAYLOAD |
-				    PCI_EXP_DEVCTL_READRQ;
-	hpx->pci_exp_devctl_or &= ~(PCI_EXP_DEVCTL_PAYLOAD |
-				    PCI_EXP_DEVCTL_READRQ);
+	hpx->pci_exp_devctl_and |= ~PCI_EXP_AER_FLAGS;
+	hpx->pci_exp_devctl_or &= PCI_EXP_AER_FLAGS;
 
 	/* Initialize Device Control Register */
 	pcie_capability_clear_and_set_word(dev, PCI_EXP_DEVCTL,
 			~hpx->pci_exp_devctl_and, hpx->pci_exp_devctl_or);
 
-	/* Initialize Link Control Register */
+	/* Log if _HPX attempts to modify PCIe Link Control register */
 	if (pcie_cap_has_lnkctl(dev)) {
-
-		/*
-		 * If the Root Port supports Read Completion Boundary of
-		 * 128, set RCB to 128.  Otherwise, clear it.
-		 */
-		hpx->pci_exp_lnkctl_and |= PCI_EXP_LNKCTL_RCB;
-		hpx->pci_exp_lnkctl_or &= ~PCI_EXP_LNKCTL_RCB;
-		if (pcie_root_rcb_set(dev))
-			hpx->pci_exp_lnkctl_or |= PCI_EXP_LNKCTL_RCB;
-
-		pcie_capability_clear_and_set_word(dev, PCI_EXP_LNKCTL,
-			~hpx->pci_exp_lnkctl_and, hpx->pci_exp_lnkctl_or);
+		if (hpx->pci_exp_lnkctl_and != 0xffff ||
+		    hpx->pci_exp_lnkctl_or != 0)
+			pci_info(dev, "_HPX attempts Link Control setting (AND %#06x OR %#06x)\n",
+				 hpx->pci_exp_lnkctl_and,
+				 hpx->pci_exp_lnkctl_or);
 	}
 
 	/* Find Advanced Error Reporting Enhanced Capability */
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 0e67014aa0013..f388d4414dd3a 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -88,6 +88,9 @@ struct pcie_tlp_log;
 #define PCI_BUS_BRIDGE_MEM_WINDOW	1
 #define PCI_BUS_BRIDGE_PREF_MEM_WINDOW	2
 
+#define	PCI_EXP_AER_FLAGS	(PCI_EXP_DEVCTL_CERE | PCI_EXP_DEVCTL_NFERE | \
+				 PCI_EXP_DEVCTL_FERE | PCI_EXP_DEVCTL_URRE)
+
 extern const unsigned char pcie_link_speed[];
 extern bool pci_early_dump;
 
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e0bcaa896803c..9472d86cef552 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -239,9 +239,6 @@ void pcie_ecrc_get_policy(char *str)
 }
 #endif	/* CONFIG_PCIE_ECRC */
 
-#define	PCI_EXP_AER_FLAGS	(PCI_EXP_DEVCTL_CERE | PCI_EXP_DEVCTL_NFERE | \
-				 PCI_EXP_DEVCTL_FERE | PCI_EXP_DEVCTL_URRE)
-
 int pcie_aer_is_native(struct pci_dev *dev)
 {
 	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
-- 
2.43.5


