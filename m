Return-Path: <linuxppc-dev+bounces-17119-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDDVHrDQnWn4SAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17119-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 17:24:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE32189C57
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 17:24:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fL32N0ygxz3cX8;
	Wed, 25 Feb 2026 03:24:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771950252;
	cv=none; b=hKTDoRilt9AC4+ifB/mlIOg/ipQftT0itKPtleuPMWtrA6EDArPaxwaPNby0hxh0V7yQDPrhcHRnIKXDlyHs4tun109onsE+jw24eyAbZuD0KaCJabqJP6/9OiWGWLcrhfrEKIbkPdzkCwOyG/8TebiqrrEnlp27wX2fKRREuwm5wqxBJvX47uujqLlmmbW5Ly1+PD63tQ6X2g7Py6VfsNUwONw5X8KjNKzIud63m5+dN6/Qdh8rIvs58gR+4w02e3JraosBOasOeVFln+Gg52+XbUzRplJF3PKNMQNjvykTxVyv8cYAu5kVyk2tvcwdr8TjJ6ozKOoaXpd6DP2rRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771950252; c=relaxed/relaxed;
	bh=lWsphxNOBrSqzk5ZZ5+1NbMnTzU9gGUw2E1K/M6EWtk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WsvCpgC54Qaxh1lOrR+ciFDOX5Vmk8mvWkdq/rdhJj8D3KsngFpQ4A7JKxOrww9C8wibpMKs1WhkD/dXdG6cvUFVsFf0hKkgoaz5QP769q/GQYRgmVppOjkTCUWqIBgDvCrDGSOZ8x2lXS5OoVnvhjZBQAU1QRvLceb7+HRTStXUaf0zHmSzs/LSemBC4bwP4yYaM+8hlUsvGNcq0rQ4H5/QGA6Iio0IsqydgIvDuLYZ+8q3+WD/NgFLK/xK9QNvY8kLWfZ2oyyB3vM+ugjQ/h7yvFobqPnwFzxaZzCzwmt3aP846D+DEUNs2mjRQ9xXdmV0h/SS/PGhLRkemYsQ5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ue+aCXwf; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ue+aCXwf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fL32M0Y18z3cVZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 03:24:10 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O7qn772870425
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 16:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=lWsphxNOBrSqzk5ZZ5+1NbMnTzU9gGUw2E1K/M6EW
	tk=; b=Ue+aCXwfh5r3Ip3430yf0LpNMiSmr53Msqdt2hl65n+oldOvH23Hsy5+I
	fRq9ZS4ELUyEy7UFH4u2RkHm6S2T1gnbbuYTEfeaYNXWNFhhWaiwWCA2ytGYGHUi
	l5mQ+ac1A7WaHZtaoR3sMj/IsYJJHZgME25iZQM8Cg2SinnmXxxNBKGZxxMrYDZ9
	agGKTVh78npAeqedEs+MBFCpUa9PqXmz/JKtrVC7QpS84eeDukoDI55Fl3qDasWS
	hVNGvWybIwNs90SWgcdT9W+HHM9NmXIj/yykFXS8cuTgq8xEzhDKSxqkdrLIrcNM
	TChfT1AfXgNnGLXGe0/aQSJC+5TKA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4brusj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 16:24:08 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61ODxsrV003397
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 16:24:07 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfs8jscvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 16:24:07 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61OGO6hA21758514
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Feb 2026 16:24:06 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 869B25805A;
	Tue, 24 Feb 2026 16:24:06 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F42558056;
	Tue, 24 Feb 2026 16:24:06 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.246.71])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Feb 2026 16:24:06 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.ibm.com>
To: maddy@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, sbhat@linux.ibm.com, vaibhav@linux.ibm.com,
        Gaurav Batra <gbatra@linux.ibm.com>, Brian King <brking@linux.ibm.com>
Subject: [PATCH] powerpc/pseries/iommu: export DMA window data to user space
Date: Tue, 24 Feb 2026 10:24:05 -0600
Message-ID: <20260224162405.32695-1-gbatra@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
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
X-Proofpoint-ORIG-GUID: _75uOaGd0dLpOboBpdhIC3bpzp9xOLOd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEzNCBTYWx0ZWRfX2NlGqXfgLWcl
 wQiG6fc655zJxQ3J6Lw5yMjfXOV9Jjdi7Gbg3k8Le0gqWFWzXMoWw3Eyf6BVYgP/lYgGEgLe9X/
 Jp/Uc/4ehxajuD0E5Sq3Y3uEct7Wm0ByWVwKOr0pz/doJNfLmGOBapFKBT1HfZzhv3RADH/qT2b
 4RPC3gfO0dHo61ydjEF/nlEIlXl/2OXUI7zQVlF2jRvhrz3JCR6NmNh1iIcUFXls/Dk963bOp42
 1dy33ZMf4pZPghXcGWrqE8myZEeo3Ug2ElHKH5a3REE/P81qQ0HsA8ozJ8q+aq0yVvXksi2x/Jy
 SfPD9kIBkea0RiwoTaWb0be0XcaBSf4cuwfMFmNBalhphsYMF++vWmWTmej/T5aDyNNfQg13ckj
 sAuFJPCVztzDdDs8xWnsZPlF0+4wyCWUQPir3eTQU0+i3swcyArOgyS+qI4HgeS8pwnWX+WSah7
 ZT8DWkcI6yZIvhEkDwA==
X-Authority-Analysis: v=2.4 cv=eNceTXp1 c=1 sm=1 tr=0 ts=699dd0a8 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=ahZacSa3eos7tKlDAYYA:9
X-Proofpoint-GUID: _75uOaGd0dLpOboBpdhIC3bpzp9xOLOd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602240134
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-17119-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[gbatra@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:sbhat@linux.ibm.com,m:vaibhav@linux.ibm.com,m:gbatra@linux.ibm.com,m:brking@linux.ibm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[gbatra@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2FE32189C57
X-Rspamd-Action: no action

Export PowerPC DMA window information (both default 2GB and Dynamic
larger window) to user space via sysfs. Each of these DMA windows has
attributes like size of the window, page size backing the window, mode,
etc. Each of these atributes is exported for user space consumption as a
file.

PowerPC Host Bridge (PHB) can have multiple devices/functions sharing
the same DMA window. For each PHB, iommu registration creates an iommu
device under "/sys/devices/virtual/iommu".

These devices will have 2 groups created to export Default and DDW
attributes.

Reviewed-by: Brian King <brking@linux.ibm.com>
Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
---
 .../arch/powerpc/dma_window_attributes.rst    |  65 +++++
 arch/powerpc/include/asm/iommu.h              |  20 ++
 arch/powerpc/kernel/iommu.c                   | 235 ++++++++++++++++++
 arch/powerpc/platforms/pseries/iommu.c        | 156 ++++++++++++
 4 files changed, 476 insertions(+)
 create mode 100644 Documentation/arch/powerpc/dma_window_attributes.rst

diff --git a/Documentation/arch/powerpc/dma_window_attributes.rst b/Documentation/arch/powerpc/dma_window_attributes.rst
new file mode 100644
index 000000000000..8bd9aec8539d
--- /dev/null
+++ b/Documentation/arch/powerpc/dma_window_attributes.rst
@@ -0,0 +1,65 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================
+DMA Window Attributes
+=====================
+
+In PowerPC architecture there are 2 types of DMA windows -
+
+1. Default 2GB DMA window which is backed by 4K page size
+2. A bigger Dynamic DMA Window (DDW) which is backed by larger page size
+   (64K or 2MB)
+
+A dedicated device will have both the DMA windows instantiated but an SR-IOV
+device will only have the bigger Dynamic DMA Window.
+
+The attributes of these 2 DMA windows are exported to user space via sysfs.
+Each IOMMU isolation unit will have its directory created under
+/sys/devices/virtual/iommu.
+
+As an exapmple, iommu-phb0001
+
+Under each IOMMU isolation unit, there will be a group of attributes for
+"Default 2GB DMA Window" and "Dynamic DMA Window" - spapr-tce-dma and
+spapr-tce-ddw respectively.
+
+Attributes under each group
+
+spapr-tce-ddw:
+direct_address  dynamic_address       dynamic_size  window_type
+direct_size     dynamic_pages_mapped  page_size
+
+spapr-tce-dma:
+dynamic_address  dynamic_pages_mapped  dynamic_size  page_size
+
+
+The bigger Dynamic DMA Window is configured into pre-mapped and/or dynamically
+allocated TCEs. If the DDW is in "Hybrid" mode, then both the Direct
+(pre-mapped) and Dynamic part of the DMA window will have valid values. Hybrid
+mode is valid only for SR-IOV devices.
+
+DMA Window properties:
+
+direct_address              Starting address of the pre-mapped DMA window
+direct_size                 Size of the pre-mapped DMA Window
+dynamic_address             Starting address of the dynamic allocations
+dynamic_size                Size of the dynamic allocation window
+dynamic_pages_mapped        Pages mapped for DMA by dynamic allocations
+page_size                   Page size backing the DMA window
+window_type                 Type of the DMA Window (Direct/Dynamic/Hybrid)
+
+
+An example of DDW attributes for an SR-IOV device::
+
+    $ cd /sys/devices/virtual/iommu/iommu-phb0001/spapr-tce-ddw
+
+    $ grep . *
+
+    direct_address:0x800000000000000   <-- Starting addr of pre-mapped Window
+    direct_size:137438953472           <-- Size of pre-mapped Window (128GB)
+    dynamic_address:0x800002000000000  <-- Starting addr of Dynamic allocations
+    dynamic_size:412316860416          <-- Size of dynamic allocation window (384GB)
+    dynamic_pages_mapped:270           <-- Pages mapped by dynamic allocations
+    page_size:2097152                  <-- DMA window page size (2MB)
+    window_type:Hybrid                 <-- window has both pre-mapped and
+                                           dynamic sections
diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index eafdd63cd6c4..e644c6e95301 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -90,6 +90,7 @@ struct iommu_pool {
 	unsigned long start;
 	unsigned long end;
 	unsigned long hint;
+	unsigned long inuse;
 	spinlock_t lock;
 } ____cacheline_aligned_in_smp;
 
@@ -319,5 +320,24 @@ extern unsigned long iommu_direction_to_tce_perm(enum dma_data_direction dir);
 
 extern const struct dma_map_ops dma_iommu_ops;
 
+/* used by sysfs when querying Dynamic/Default DMA Window data */
+struct dma_win_data {
+	u32     win_pgsize;
+	u64     direct_addr;
+	u64     direct_size;
+	u64     dynamic_addr;
+	u64     dynamic_size;
+	u32     dynamic_tces_inuse;
+	char    win_type[15];
+};
+
+#define SPAPR_SUCCESS       0
+#define SPAPR_NODMAWIN      -1
+#define SPAPR_NODDWWIN      -2
+#define SPAPR_ERROR         -3
+
+extern int gather_ddw_info(struct device *dev, struct dma_win_data *data);
+extern int gather_dma_info(struct device *dev, struct dma_win_data *data);
+
 #endif /* __KERNEL__ */
 #endif /* _ASM_IOMMU_H */
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 0ce71310b7d9..e3cf3701dd6e 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -339,6 +339,9 @@ static unsigned long iommu_range_alloc(struct device *dev,
 	if (handle)
 		*handle = end;
 
+	/* update use count */
+	pool->inuse += npages;
+
 	spin_unlock_irqrestore(&(pool->lock), flags);
 
 	return n;
@@ -452,6 +455,7 @@ static void __iommu_free(struct iommu_table *tbl, dma_addr_t dma_addr,
 	tbl->it_ops->clear(tbl, entry, npages);
 
 	spin_lock_irqsave(&(pool->lock), flags);
+	pool->inuse -= npages;
 	bitmap_clear(tbl->it_map, free_entry, npages);
 	spin_unlock_irqrestore(&(pool->lock), flags);
 }
@@ -759,6 +763,7 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
 		p->start = tbl->poolsize * i;
 		p->hint = p->start;
 		p->end = p->start + tbl->poolsize;
+		p->inuse = 0;
 	}
 
 	p = &tbl->large_pool;
@@ -766,6 +771,7 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
 	p->start = tbl->poolsize * i;
 	p->hint = p->start;
 	p->end = tbl->it_size;
+	p->inuse = 0;
 
 	iommu_table_clear(tbl);
 
@@ -1269,6 +1275,233 @@ static const struct iommu_ops spapr_tce_iommu_ops = {
 	.device_group = spapr_tce_iommu_device_group,
 };
 
+static inline const char *dma_win_error(int err)
+{
+	switch (err) {
+	case SPAPR_ERROR:
+		return "Error";
+	case SPAPR_NODMAWIN:
+		return "No Default DMA Window Found";
+	case SPAPR_NODDWWIN:
+		return "No Dynamic DMA Window Found";
+	default:
+		return "Unknown Result";
+	}
+}
+
+static ssize_t ddw_direct_address_show(struct device *dev,
+									   struct device_attribute *attr,
+									   char *buf)
+{
+	int rc = 0;
+	struct dma_win_data data;
+
+	rc = gather_ddw_info(dev, &data);
+
+	if (rc == SPAPR_SUCCESS)
+		return sysfs_emit(buf, "%#llx\n", data.direct_addr);
+	else
+		return sysfs_emit(buf, "%s\n", dma_win_error(rc));
+}
+
+static ssize_t ddw_dynamic_address_show(struct device *dev,
+										struct device_attribute *attr,
+										char *buf)
+{
+	int rc = 0;
+	struct dma_win_data data;
+
+	rc = gather_ddw_info(dev, &data);
+
+	if (rc == SPAPR_SUCCESS)
+		return sysfs_emit(buf, "%#llx\n", data.dynamic_addr);
+	else
+		return sysfs_emit(buf, "%s\n", dma_win_error(rc));
+}
+
+static ssize_t ddw_direct_size_show(struct device *dev,
+									struct device_attribute *attr,
+									char *buf)
+{
+	int rc = 0;
+	struct dma_win_data data;
+
+	rc = gather_ddw_info(dev, &data);
+
+	if (rc == SPAPR_SUCCESS)
+		return sysfs_emit(buf, "%lld\n", data.direct_size);
+	else
+		return sysfs_emit(buf, "%s\n", dma_win_error(rc));
+}
+
+static ssize_t ddw_dynamic_size_show(struct device *dev,
+									 struct device_attribute *attr,
+									 char *buf)
+{
+	int rc = 0;
+	struct dma_win_data data;
+
+	rc = gather_ddw_info(dev, &data);
+
+	if (rc == SPAPR_SUCCESS)
+		return sysfs_emit(buf, "%lld\n", data.dynamic_size);
+	else
+		return sysfs_emit(buf, "%s\n", dma_win_error(rc));
+}
+
+static ssize_t ddw_page_size_show(struct device *dev,
+								  struct device_attribute *attr,
+								  char *buf)
+{
+	int rc = 0;
+	struct dma_win_data data;
+
+	rc = gather_ddw_info(dev, &data);
+
+	if (rc == SPAPR_SUCCESS)
+		return sysfs_emit(buf, "%d\n", data.win_pgsize);
+	else
+		return sysfs_emit(buf, "%s\n", dma_win_error(rc));
+}
+
+static ssize_t ddw_window_type_show(struct device *dev,
+									struct device_attribute *attr,
+									char *buf)
+{
+	int rc = 0;
+	struct dma_win_data data;
+
+	rc = gather_ddw_info(dev, &data);
+
+	if (rc == SPAPR_SUCCESS)
+		return sysfs_emit(buf, "%s\n", data.win_type);
+	else
+		return sysfs_emit(buf, "%s\n", dma_win_error(rc));
+}
+
+static ssize_t ddw_dynamic_pages_mapped_show(struct device *dev,
+											 struct device_attribute *attr,
+											 char *buf)
+{
+	int rc = 0;
+	struct dma_win_data data;
+
+	rc = gather_ddw_info(dev, &data);
+
+	if (rc == SPAPR_SUCCESS)
+		return sysfs_emit(buf, "%d\n", data.dynamic_tces_inuse);
+	else
+		return sysfs_emit(buf, "%s\n", dma_win_error(rc));
+}
+
+static ssize_t dma_dynamic_address_show(struct device *dev,
+										struct device_attribute *attr,
+										char *buf)
+{
+	int rc = 0;
+	struct dma_win_data data;
+
+	rc = gather_dma_info(dev, &data);
+
+	if (rc == SPAPR_SUCCESS)
+		return sysfs_emit(buf, "%#llx\n", data.dynamic_addr);
+	else
+		return sysfs_emit(buf, "%s\n", dma_win_error(rc));
+}
+
+static ssize_t dma_dynamic_size_show(struct device *dev,
+									 struct device_attribute *attr,
+									 char *buf)
+{
+	int rc = 0;
+	struct dma_win_data data;
+
+	rc = gather_dma_info(dev, &data);
+
+	if (rc == SPAPR_SUCCESS)
+		return sysfs_emit(buf, "%lld\n", data.dynamic_size);
+	else
+		return sysfs_emit(buf, "%s\n", dma_win_error(rc));
+}
+
+static ssize_t dma_page_size_show(struct device *dev,
+								  struct device_attribute *attr,
+								  char *buf)
+{
+	int rc = 0;
+	struct dma_win_data data;
+
+	rc = gather_dma_info(dev, &data);
+
+	if (rc == SPAPR_SUCCESS)
+		return sysfs_emit(buf, "%d\n", data.win_pgsize);
+	else
+		return sysfs_emit(buf, "%s\n", dma_win_error(rc));
+}
+
+static ssize_t dma_dynamic_pages_mapped_show(struct device *dev,
+											 struct device_attribute *attr,
+											 char *buf)
+{
+	int rc = 0;
+	struct dma_win_data data;
+
+	rc = gather_dma_info(dev, &data);
+
+	if (rc == SPAPR_SUCCESS)
+		return sysfs_emit(buf, "%d\n", data.dynamic_tces_inuse);
+	else
+		return sysfs_emit(buf, "%s\n", dma_win_error(rc));
+}
+
+#define DEVICE_ATTR_DDW(_name)                              \
+		struct device_attribute dev_attr_ddw_##_name =      \
+			__ATTR(_name, 0444, ddw_##_name##_show, NULL)
+#define DEVICE_ATTR_DMA(_name)                              \
+		struct device_attribute dev_attr_dma_##_name =      \
+		__ATTR(_name, 0444, dma_##_name##_show, NULL)
+
+static DEVICE_ATTR_DDW(direct_address);
+static DEVICE_ATTR_DDW(direct_size);
+static DEVICE_ATTR_DDW(page_size);
+static DEVICE_ATTR_DDW(window_type);
+static DEVICE_ATTR_DDW(dynamic_address);
+static DEVICE_ATTR_DDW(dynamic_size);
+static DEVICE_ATTR_DDW(dynamic_pages_mapped);
+static DEVICE_ATTR_DMA(dynamic_address);
+static DEVICE_ATTR_DMA(dynamic_size);
+static DEVICE_ATTR_DMA(page_size);
+static DEVICE_ATTR_DMA(dynamic_pages_mapped);
+
+static struct attribute *spapr_tce_ddw_attrs[] = {
+	&dev_attr_ddw_direct_address.attr,
+	&dev_attr_ddw_direct_size.attr,
+	&dev_attr_ddw_page_size.attr,
+	&dev_attr_ddw_window_type.attr,
+	&dev_attr_ddw_dynamic_address.attr,
+	&dev_attr_ddw_dynamic_size.attr,
+	&dev_attr_ddw_dynamic_pages_mapped.attr,
+	NULL,
+};
+
+static struct attribute *spapr_tce_dma_attrs[] = {
+	&dev_attr_dma_dynamic_address.attr,
+	&dev_attr_dma_dynamic_size.attr,
+	&dev_attr_dma_page_size.attr,
+	&dev_attr_dma_dynamic_pages_mapped.attr,
+	NULL,
+};
+
+static struct attribute_group spapr_tce_ddw_group = {
+	.name = "spapr-tce-ddw",
+	.attrs = spapr_tce_ddw_attrs,
+};
+
+static struct attribute_group spapr_tce_dma_group = {
+	.name = "spapr-tce-dma",
+	.attrs = spapr_tce_dma_attrs,
+};
+
 static struct attribute *spapr_tce_iommu_attrs[] = {
 	NULL,
 };
@@ -1280,6 +1513,8 @@ static struct attribute_group spapr_tce_iommu_group = {
 
 static const struct attribute_group *spapr_tce_iommu_groups[] = {
 	&spapr_tce_iommu_group,
+	&spapr_tce_ddw_group,
+	&spapr_tce_dma_group,
 	NULL,
 };
 
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 5497b130e026..5d04b50ae265 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -837,6 +837,162 @@ static struct device_node *pci_dma_find(struct device_node *dn,
 	return rdn;
 }
 
+static unsigned long iommu_table_inuse_tces(struct iommu_table *tbl)
+{
+	struct iommu_pool *pool;
+	unsigned long ntces = 0;
+
+	/* Number of TCEs in-use */
+	for (int i = 0; i < tbl->nr_pools; i++) {
+		pool = &tbl->pools[i];
+		ntces += pool->inuse;
+	}
+
+	pool = &tbl->large_pool;
+	ntces += pool->inuse;
+
+	return ntces;
+}
+
+/* Get DDW information for the device */
+int gather_ddw_info(struct device *dev, struct dma_win_data *data)
+{
+	struct iommu_device *iommu;
+	struct pci_controller *phb;
+	struct device_node *dn;
+	struct pci_dn *pci;
+	const __be32 *prop = NULL;
+	bool ddw_direct = false;
+	bool found = false;
+	struct iommu_table *tbl;
+	u32 pgshift;
+	struct dynamic_dma_window_prop *p;
+
+	memset(data, 0, sizeof(*data));
+
+	iommu = dev_get_drvdata(dev);
+	phb = container_of(iommu, struct pci_controller, iommu);
+	dn = phb->dn;
+
+	if (!dn)
+		return SPAPR_ERROR;
+
+	pci = PCI_DN(dn);
+	if (!pci || !pci->table_group)
+		return SPAPR_ERROR;
+
+	/* Find DDW */
+	prop = of_get_property(dn, DIRECT64_PROPNAME, NULL);
+	if (prop) {
+		ddw_direct = true;
+		found = true;
+	} else {
+		prop = of_get_property(dn, DMA64_PROPNAME, NULL);
+		if (prop)
+			found = true;
+	}
+
+	/* NO DDW */
+	if (!found)
+		return SPAPR_NODDWWIN;
+
+	p = (struct dynamic_dma_window_prop *)prop;
+
+	pgshift = be32_to_cpu(p->tce_shift);
+	if (pgshift != 0xc && pgshift != 0x10 && pgshift != 0x15)
+		data->win_pgsize = 0;
+	else
+		data->win_pgsize = 1 << pgshift;
+
+	/* Check if DDW has table associated with it. Having a table associated with
+	 * DDW is indicative that is has some dynamic TCE allocations. In this case the
+	 * DDW can be fully Dynamic or in Hybrid mode. For SR-IOV DDW is on index 0,
+	 * for dedicated adapter on index 1.
+	 */
+	found = false;
+	for (int i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i) {
+		tbl = pci->table_group->tables[i];
+
+		if (tbl && tbl->it_index == be32_to_cpu(p->liobn)) {
+			found = true;
+			break;
+		}
+	}
+
+	/* set the parameters depnding on the DDW type */
+	if (ddw_direct && found) {          /* Hybrid */
+		data->direct_addr = be64_to_cpu(p->dma_base);
+		data->dynamic_size = (u64)(tbl->it_size << tbl->it_page_shift);
+
+		data->dynamic_addr = data->direct_addr
+								+ (u64)(1UL << be32_to_cpu(p->window_shift))
+								- data->dynamic_size;
+
+		data->direct_size = data->dynamic_addr - data->direct_addr;
+		data->dynamic_tces_inuse = iommu_table_inuse_tces(tbl);
+
+		sprintf(data->win_type, "%s", "Hybrid");
+	} else if (ddw_direct && !found) {    /* Direct */
+		data->direct_addr = be64_to_cpu(p->dma_base);
+		data->direct_size = (u64)(1UL << be32_to_cpu(p->window_shift));
+
+		sprintf(data->win_type, "%s", "Direct");
+	} else {                              /* Dynamic */
+		data->dynamic_addr = be64_to_cpu(p->dma_base);
+		data->dynamic_size = (u64)(1UL << be32_to_cpu(p->window_shift));
+		data->dynamic_tces_inuse = iommu_table_inuse_tces(tbl);
+
+		sprintf(data->win_type, "%s", "Dynamic");
+	}
+
+	return SPAPR_SUCCESS;
+}
+
+/* Get DDW information for the device */
+int gather_dma_info(struct device *dev, struct dma_win_data *data)
+{
+	struct iommu_device *iommu;
+	struct pci_controller *phb;
+	struct device_node *dn;
+	struct pci_dn *pci;
+	const __be32 *prop = NULL;
+	struct iommu_table *tbl;
+	unsigned long offset, size, liobn;
+
+	memset(data, 0, sizeof(*data));
+
+	iommu = dev_get_drvdata(dev);
+	phb = container_of(iommu, struct pci_controller, iommu);
+	dn = phb->dn;
+
+	if (!dn)
+		return SPAPR_ERROR;
+
+	pci = PCI_DN(dn);
+	if (!pci || !pci->table_group)
+		return SPAPR_ERROR;
+
+	/* search for default DMA window */
+	prop = of_get_property(dn, "ibm,dma-window", NULL);
+
+	if (!prop)
+		return SPAPR_NODMAWIN;
+
+	/* default DMA Window is always at index 0 */
+	tbl = pci->table_group->tables[0];
+	if (!tbl)
+		return SPAPR_ERROR;
+
+	of_parse_dma_window(dn, prop, &liobn, &offset, &size);
+
+	data->dynamic_addr = offset;
+	data->dynamic_size = size;
+	data->win_pgsize = 1ULL << IOMMU_PAGE_SHIFT_4K;
+	data->dynamic_tces_inuse = iommu_table_inuse_tces(tbl);
+
+	return SPAPR_SUCCESS;
+}
+
 static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 {
 	struct iommu_table *tbl;

base-commit: 192c0159402e6bfbe13de6f8379546943297783d
-- 
2.39.3


