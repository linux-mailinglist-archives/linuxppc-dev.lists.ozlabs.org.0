Return-Path: <linuxppc-dev+bounces-16106-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNAIEEDhcGnCaQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16106-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 15:22:56 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CACA9585AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 15:22:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dx5y20Qdyz2yFg;
	Thu, 22 Jan 2026 01:22:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.165.32
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769000745;
	cv=none; b=RSz2oFtSFsxGNCvUUt3n2HWqpDdLw85KWpWEqKW6DiPSMF44R6QxX5CKyOaTbfV86jp/qASldW0JzlaFPRBnG3V0eVzH53YcS1JMO7VPJf1yhqTiGEguBcX+s4fR2n4/zblPkozcLWcOS0L+4NSNc9b3vUOEzNc8tR6XB4xInmUJ6cBEOLVWKkmhzjfExRmvouYbpkmL+1S3Uecx1hZcdvuKjiOmEqPfLHR68GS8wT2L7//4S1DZFCswMKPu61tMusBEkEk8rq81ITo8gH5C9kqNEfeo8xzPcuaYmr6gNe0GXnA3Ril/M32BTk1hb/zQZnzuWXGDFOl9azv3eqZ3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769000745; c=relaxed/relaxed;
	bh=8xSmsePBtJ3EW+zKnS0O0ktRO+JFCw7jsgeeT4kz2Qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KW6XYppFQCjscChG41AtdKcvHMgyfQNNaSjjSYjP2ZoN369uA5YLrUOEs0VlwBjp0RzOvqMr7xeqMhD/IYpyk4nC4H0RcwaWQMaxmRihN+ZjnE5ADZaLcSIm9lNUFHW2WH9LkglnjBnqnIDGH+z8fZX4KqBeHybxdoiMofN8UohT0J1OLU/e7LLBzVSkVgL0egZbXDhReItXbdXvIKNT+juhAT6yiRLhltcHbMBbb/EEWwb+MnOaXaiEozHLhw6pvdox2C+qlF27czENpKj16eOnFBTHQC981dt62fuZtky7o6QIqDOuxI/mN88U4Bl0e16cLoXSA24CE+I/WrnUhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=MOnnSka8; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=haakon.bugge@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=MOnnSka8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=haakon.bugge@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 5372 seconds by postgrey-1.37 at boromir; Thu, 22 Jan 2026 00:05:44 AEDT
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dx4F44gxTz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 00:05:43 +1100 (AEDT)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L5DAob3264903;
	Wed, 21 Jan 2026 11:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=8xSmsePBtJ3EW+zKnS0O0ktRO+JFCw7jsgeeT4kz2Qw=; b=
	MOnnSka8xoIYh/B6oQ1Uphz72FGG+D8EnlDjAb3NBGkkGFD4nuVoeBlraSbBGhPX
	9h3UwXuM/47qBP7FGg42txUJEogNnBjquRqynSuYafsOxNWYpU0cpt3kP132CA6P
	pxSm9CN/Gy+/oeiP+MzDimcOCB2r2JEolo2yMN2mjjTjUBuUgh6PbV1hgbjwxWIi
	+T5QonDVTGQN+IF3Su/pFTB/ypCUh3fhYi4zC1zWNne3bgd00Tw23PqqZD8dS9z4
	UNpn7cJuS34ZkvO8GbH5SSlqj3Vj3HYgXMwGxeEf/Ofq28+4diKjADDnF4nwU89u
	nAhnfgtdsRCQ1nzRBeRJfw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br1b8dq1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jan 2026 11:35:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60LA6OqX019001;
	Wed, 21 Jan 2026 11:35:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bsyrry2x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jan 2026 11:35:52 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60LBUlCD025086;
	Wed, 21 Jan 2026 11:35:52 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4bsyrry2rv-3;
	Wed, 21 Jan 2026 11:35:51 +0000
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        "Oliver O'Halloran" <oohall@gmail.com>,
        Greg Kroah-Hartman <gregkh@suse.de>,
        Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>
Cc: Johannes Thumshirn <morbidrsa@gmail.com>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] PCI/ACPI: Confine program_hpx_type2 to the AER bits
Date: Wed, 21 Jan 2026 12:35:41 +0100
Message-ID: <20260121113544.4163457-3-haakon.bugge@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260121113544.4163457-1-haakon.bugge@oracle.com>
References: <20260121113544.4163457-1-haakon.bugge@oracle.com>
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
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601210097
X-Authority-Analysis: v=2.4 cv=WbcBqkhX c=1 sm=1 tr=0 ts=6970ba19 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8 a=CF6WusRKGoJ8OkfercgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12104
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA5NyBTYWx0ZWRfX9XpsfvLL6NYD
 Uk+YDRag+k2Ud1sE/a096WHh6+TxZ06Cg7PO04mKuliheJH5enV0iCXCsAj6TQwzwjnEi2o2aI5
 JGBih8zwIEE1nKTNDHf1huTMFgQNqRuZFclwJIQuHk9OXI0acADnseIXsfESABLSbiES5sdtH0m
 N+GNIPP5XDHroUnAYzBQm0kxTmAlX+Y1nrF1vbY8qKAsi65h/K0my5JJDMNuZv86nK+zqRgrwNu
 FttEOly85PD+ofOtX0pNCDIcysRetxzTPkr7BPK75Y+Zk93eWU8IpHgNOX0pOAFmdHH4pmTWY3r
 576sogZHVRM3reU4OwS+SwUjscYoFMvIX/gJRsAy65oIGwicD9cmARfbn3SlszdyJJl1JGvoiCN
 TBCsFeXEOg7DEq5pM2ZvxshTCHZooskdankMJ/Br/VaYLL8F1h1stxvTkiuSuOHC1PxhTCK1xzJ
 QeL6YJQ5NDZTcSNI4yTGznP3MB11R0u2DB4/6AZ8=
X-Proofpoint-ORIG-GUID: JGxWucj1N6acwkaAvfRYpRanyfa6x2xv
X-Proofpoint-GUID: JGxWucj1N6acwkaAvfRYpRanyfa6x2xv
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:rafael@kernel.org,m:lenb@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:gregkh@suse.de,m:kaneshige.kenji@jp.fujitsu.com,m:morbidrsa@gmail.com,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:haakon.bugge@oracle.com,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,oracle.com:dkim,oracle.com:mid];
	FORGED_SENDER(0.00)[haakon.bugge@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[google.com,kernel.org,linux.ibm.com,gmail.com,suse.de,jp.fujitsu.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16106-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[oracle.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haakon.bugge@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,oracle.com,lists.ozlabs.org];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CACA9585AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

program_hpx_type2() is today unconditionally called, despite the fact
that when the _HPX was added to the ACPI spec. v3.0, the description
stated:

 OSPM [1] will only evaluate _HPX with Setting Record – Type 2 if OSPM
 is not controlling the PCI Express Advanced Error Reporting
 capability.

Hence, we only call program_hpx_type2() when the OSPM owns the PCIe
hotplug capability but not the AER.

The Advanced Configuration and Power Interface (ACPI) Specification
version 6.6 has a provision that gives the OSPM the ability to control
the other PCIe Device Control bits any way. In a note in section
6.2.9, it is stated:

"OSPM may override the settings provided by the _HPX object's Type2
record (PCI Express Settings) or Type3 record (PCI Express Descriptor
Settings) when OSPM has assumed native control of the corresponding
feature."

So, in order to preserve the non-AER bits in PCIe Device Control, in
particular the performance sensitive ExtTag and RO, we make sure
program_hpx_type2() if called, doesn't modify any non-AER bits.

Also, when program_hpx_type2() is called, we completely avoid
modifying any bits in the Link Control register. However, if the _HPX
type 2 records contains bits indicating such modifications, we print
an info message.

[1] Operating System-directed configuration and Power Management

Fixes: 40abb96c51bb ("[PATCH] pciehp: Fix programming hotplug parameters")
Signed-off-by: Håkon Bugge <haakon.bugge@oracle.com>

---

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
 drivers/pci/pci-acpi.c | 61 +++++++++++++++++++-----------------------
 drivers/pci/pci.h      |  3 +++
 drivers/pci/pcie/aer.c |  3 ---
 3 files changed, 30 insertions(+), 37 deletions(-)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 9369377725fa0..34ea22f65a410 100644
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
@@ -325,33 +320,31 @@ static void program_hpx_type2(struct pci_dev *dev, struct hpx_type2 *hpx)
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
+		if (hpx->pci_exp_lnkctl_and)
+			pci_info(dev,
+				 "_HPX attempts to reset the following bits in PCIe Link Control: 0x%04x\n",
+				 hpx->pci_exp_lnkctl_and);
+		if (hpx->pci_exp_lnkctl_or)
+			pci_info(dev,
+				 "_HPX attempts to set the following bits in PCIe Link Control: 0x%04x\n",
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


