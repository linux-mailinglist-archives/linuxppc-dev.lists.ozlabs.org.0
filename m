Return-Path: <linuxppc-dev+bounces-16326-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qVxaM7UFeWlcugEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16326-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 19:36:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE1C992DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 19:36:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0vJ16G2Mz309N;
	Wed, 28 Jan 2026 05:36:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769538993;
	cv=none; b=CMtTt/G6YD3Ca+vOIc9zXz9lSeRQVolDcRCUWlg4Z/37uWVAVqXIdp+YMFNY4zikPAvgnFZkpa/raV7kMd/JWmsN9RDrh1jnFE9m68BiKoaYzDSidTw5ygYadIc+CkSmejXS+UAWbbStenhXFA/IeCVJJ5bxFSYEFR6sEa/NudPVviMlZA4xdR7oOc9/voT59iIwEiBylYau2QENAUx8QpoHDSZ7NUCvDTNKLQpH6snoPP7zb0yxtZyCp+1Ry1sQ4PGE/RtOsKmG2vwj9xd9VLS7Q43+LSHgP2FBM2iizWHhJI8gzBVnAZLfkeSHnvEta/06YnYBSeoNmNtbfZWKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769538993; c=relaxed/relaxed;
	bh=GaDBwH3KODFFSK45InM8An4Jx56DAGVoyiDOqYzm+no=;
	h=Subject:From:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=XMPJBa9An7C6SbM6l0auWtowBB8KKnPLFg0aCxPyEfChf/2BUtKPeITArsWZ27HnUYk9MhSxx0QPxeocSeL9dbND6Ahv9fE8pEWZvZMBlhVTDRoPW7IXIc4AtOkXpK5hHHPo0Knb1MSXmGwgoAE28QZpDAkVt9jyyk4sGrModZR1Ru4DxKfRyEiHJIIedq328HRF4vy5UGWpyKUcAHgXF/Dxb/Gbtcve8YAxWppI8Pse5X5N61C3XdYxktos4Z5wzSzkRvcCMqTF/g95qi6LlOtpI1g0wS4H3K/s4cJulzU758Agg1VN+npEhjW3f/xyQGDaCOjftxoqb8Z8dbfQrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C88f7fTh; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C88f7fTh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0vJ06Jj8z2xc8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 05:36:32 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60RIBEEw007148;
	Tue, 27 Jan 2026 18:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=GaDBwH3KODFFSK45InM8An4Jx56D
	AGVoyiDOqYzm+no=; b=C88f7fThYzzOtPJsNtasUe1o4h9u1bYVp4FYMkZSz8sE
	cGQuCe5DaphjpvN0jF+p4xA38U0ArQGXuaTEN73FvE4GV6/ikTB0oAJhe1BOt4P6
	Q7zFBWZ2wQI7lNujT+9MRPhcQK1prnT8IV7LROsw/T9HlXciKGMn8EWWur8PHv1y
	dWEPuOhAsZzryodwgNNL9rQbKw+qotYm1kx5s9G8t0XFD6lq6F4suOdCGkNwg3wp
	9e0PqAMfW63UFNnwi6BidQNqSkUWOQ1JanwkzsC782yopC5NDmR1g7snxKBoC6U2
	KkVw5nBRbSRLONVacjsQUByf7OdPqoWrqk8TQCQ0nw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnrtf2c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 18:36:07 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60RIUfVL016122;
	Tue, 27 Jan 2026 18:36:06 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnrtf2by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 18:36:06 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60RIYwX8018399;
	Tue, 27 Jan 2026 18:36:05 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bwb41smq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 18:36:05 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60RIa13h16712004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jan 2026 18:36:01 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB22720049;
	Tue, 27 Jan 2026 18:36:01 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B043920040;
	Tue, 27 Jan 2026 18:35:57 +0000 (GMT)
Received: from [192.168.29.222] (unknown [9.39.18.127])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 Jan 2026 18:35:57 +0000 (GMT)
Subject: [RFC PATCH] powerpc: iommu: Initial IOMMUFD support for PPC64
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, iommu@lists.linux.dev
Cc: chleroy@kernel.org, mpe@ellerman.id.au, maddy@linux.ibm.com,
        npiggin@gmail.com, alex@shazbot.org, sbhat@linux.ibm.com,
        joerg.roedel@amd.com, kevin.tian@intel.com, gbatra@linux.ibm.com,
        jgg@nvidia.com, clg@kaod.org, vaibhav@linux.ibm.com,
        brking@linux.vnet.ibm.com, nnmlinux@linux.ibm.com,
        amachhiw@linux.ibm.com, tpearson@raptorengineering.com
Date: Tue, 27 Jan 2026 18:35:56 +0000
Message-ID: <176953894915.725.1102545144304639827.stgit@linux.ibm.com>
User-Agent: StGit/1.4
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RzBcqAKFr15M2kn-jcQ5sd9uQPVVtWe0
X-Authority-Analysis: v=2.4 cv=Uptu9uwB c=1 sm=1 tr=0 ts=69790597 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VnNF1IyMAAAA:8 a=a1gJu8-CnJHvTXtmsEQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: vuxqoxnmkNU4WboUA_70i67FxJE6FxTb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE0OSBTYWx0ZWRfX/e0zMupTTh8t
 9gmSfaRQx0L6YJSqbRkfZpBUETuTadnJel67hdOQrGr5b7nzWvPmUjtwkqocQ1JUK0JH/pnJmGT
 A/rOE3EvLH9Vpk5vykqlsHOL9xsOiYbDk3QNuk9GQVVAVIrW2S64BLTJgXoCXXRw53C8HcZ0vOE
 DNf0Latk/6ARynUFlQg9lMwejspq1qWc+UjXxUkXbCx5C3Hqx+R9+fWDUOgodV1HhWAMieacd+8
 A9S7VrnC0c6VXYtPCXkaM81E+Vr9KQ/+S92DzQ06t3zitxU75IzgHr9JdKRuBm4YDMw322D7x5Z
 Tt32p74PmFr2MHoB6opNQVXJ8Iih2HfhFsxgrH2Br2PHkWDeMMvfK3lBsIomtHD5b/UCtNvblC4
 hpa+XM8QJ9XmrrmRzL8p6CWLeJL+zQFpvj45HcTC8eQWZPIMOy1W8tpiP2FfUlvl7eg/b7N6bz2
 qh9qyvltVuO6FmP5whg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1011 lowpriorityscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601270149
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,ellerman.id.au,linux.ibm.com,gmail.com,shazbot.org,amd.com,intel.com,nvidia.com,kaod.org,linux.vnet.ibm.com,raptorengineering.com];
	FORGED_SENDER(0.00)[sbhat@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16326-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:iommu@lists.linux.dev,m:chleroy@kernel.org,m:mpe@ellerman.id.au,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:alex@shazbot.org,m:sbhat@linux.ibm.com,m:joerg.roedel@amd.com,m:kevin.tian@intel.com,m:gbatra@linux.ibm.com,m:jgg@nvidia.com,m:clg@kaod.org,m:vaibhav@linux.ibm.com,m:brking@linux.vnet.ibm.com,m:nnmlinux@linux.ibm.com,m:amachhiw@linux.ibm.com,m:tpearson@raptorengineering.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sbhat@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: BFE1C992DB
X-Rspamd-Action: no action

The RFC attempts to implement the IOMMUFD support on PPC64 by
adding new iommu_ops for paging domain. The existing platform
domain continues to be the default domain for in-kernel use.
The domain ownership transfer ensures the reset of iommu states
for the new paging domain and in-kernel usage.

On PPC64, IOVA ranges are based on the type of the DMA window
and their properties. Currently, there is no way to expose the
attributes of the non-default 64-bit DMA window, which the platform
supports. The platform allows the operating system to select the
starting offset(at 4GiB or 512PiB default offset), pagesize and
window size for the non-default 64-bit DMA window. For example,
with VFIO, this is handled via VFIO_IOMMU_SPAPR_TCE_GET_INFO
and VFIO_IOMMU_SPAPR_TCE_CREATE|REMOVE ioctls. While I am exploring
the ways to expose and configure these DMA window attributes as
per user input, any suggestions in this regard will be very helpful.

Currently existing vfio type1 specific vfio-compat driver even
with this patch will not work for PPC64. I believe we need to have
a separate "vfio-spapr-compat" driver to make it work.

So brief list of current open problems and ongoing reworks:
 - Second DMA window support as mentioned above.
 - KVM support.
 - EEH support.
 - The vfio compat driver for the spapr tce iommu.
 - Multiple devices (multifunction, same/different iommu group checks,
   SRIOV VF assignment) support.
 - Race conditions, device plug/unplug.
 - self|tests.

The patch currently works for single device and exposes only the
default DMA window of 1GB to the user. It has been tested for
both PowerNV and pSeries machine tce iommu backends. The testing
was done using a Qemu[1] and TCG guest having a NVME device
passthrough. One can use the command like below to try:

qemu-system-ppc64 -machine pseries -accel tcg \
-device spapr-pci-host-bridge,index=1,id=pci.1,ddw=off \
-device vfio-pci,host=<hostdev>,id=hostdev0,\
bus=pci.1.0,addr=0x1,iommufd=iommufd0 \
-object iommufd,id=iommufd0 <...>
...
root:localhost# mount /dev/nvme0n1 /mnt
root:localhost# ls /mnt
...

The current patch is based on linux kernel 6.19-rc6 tree.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>

References:
1 : https://github.com/shivaprasadbhat/qemu/tree/iommufd-wip
---
 arch/powerpc/include/asm/iommu.h              |    2 
 arch/powerpc/kernel/iommu.c                   |  181 +++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/pci-ioda-tce.c |    4 -
 arch/powerpc/platforms/powernv/pci-ioda.c     |    4 -
 arch/powerpc/platforms/powernv/pci.h          |    2 
 arch/powerpc/platforms/pseries/iommu.c        |    6 -
 drivers/vfio/Kconfig                          |    4 -
 7 files changed, 190 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index eafdd63cd6c4..1dc72fbb89e7 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -46,7 +46,7 @@ struct iommu_table_ops {
 			long index, long npages,
 			unsigned long uaddr,
 			enum dma_data_direction direction,
-			unsigned long attrs);
+			unsigned long attrs, bool is_phys);
 #ifdef CONFIG_IOMMU_API
 	/*
 	 * Exchanges existing TCE with new TCE plus direction bits;
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 0ce71310b7d9..e6543480c461 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -365,7 +365,7 @@ static dma_addr_t iommu_alloc(struct device *dev, struct iommu_table *tbl,
 	/* Put the TCEs in the HW table */
 	build_fail = tbl->it_ops->set(tbl, entry, npages,
 				      (unsigned long)page &
-				      IOMMU_PAGE_MASK(tbl), direction, attrs);
+				      IOMMU_PAGE_MASK(tbl), direction, attrs, false);
 
 	/* tbl->it_ops->set() only returns non-zero for transient errors.
 	 * Clean up the table bitmap in this case and return
@@ -539,7 +539,7 @@ int ppc_iommu_map_sg(struct device *dev, struct iommu_table *tbl,
 		/* Insert into HW table */
 		build_fail = tbl->it_ops->set(tbl, entry, npages,
 					      vaddr & IOMMU_PAGE_MASK(tbl),
-					      direction, attrs);
+					      direction, attrs, false);
 		if(unlikely(build_fail))
 			goto failure;
 
@@ -1201,7 +1201,15 @@ spapr_tce_blocked_iommu_attach_dev(struct iommu_domain *platform_domain,
 	 * also sets the dma_api ops
 	 */
 	table_group = iommu_group_get_iommudata(grp);
+
+	if (old && old->type == IOMMU_DOMAIN_DMA) {
+		ret = table_group->ops->unset_window(table_group, 0);
+		if (ret)
+			goto exit;
+	}
+
 	ret = table_group->ops->take_ownership(table_group, dev);
+exit:
 	iommu_group_put(grp);
 
 	return ret;
@@ -1260,6 +1268,167 @@ static struct iommu_group *spapr_tce_iommu_device_group(struct device *dev)
 	return hose->controller_ops.device_group(hose, pdev);
 }
 
+struct ppc64_domain {
+	struct iommu_domain  domain;
+	struct device        *device; /* Make it a list */
+	struct iommu_table   *table;
+	spinlock_t           list_lock;
+	struct rcu_head      rcu;
+};
+
+static struct ppc64_domain *to_ppc64_domain(struct iommu_domain *dom)
+{
+	return container_of(dom, struct ppc64_domain, domain);
+}
+
+static void spapr_tce_domain_free(struct iommu_domain *domain)
+{
+	struct ppc64_domain *ppc64_domain = to_ppc64_domain(domain);
+
+	kfree(ppc64_domain);
+}
+
+static const struct iommu_ops spapr_tce_iommu_ops;
+static struct iommu_domain *spapr_tce_domain_alloc_paging(struct device *dev)
+{
+	struct iommu_group *grp = iommu_group_get(dev);
+	struct iommu_table_group *table_group;
+	struct ppc64_domain *ppc64_domain;
+	struct iommu_table *ptbl;
+	int ret = -1;
+
+	table_group = iommu_group_get_iommudata(grp);
+	ppc64_domain = kzalloc(sizeof(*ppc64_domain), GFP_KERNEL);
+	if (!ppc64_domain)
+		return NULL;
+
+	/* Just the default window hardcode for now */
+	ret = table_group->ops->create_table(table_group, 0, 0xc, 0x40000000, 1, &ptbl);
+	iommu_tce_table_get(ptbl);
+	ppc64_domain->table = ptbl; /* REVISIT: Single device for now */
+	if (!ppc64_domain->table) {
+		kfree(ppc64_domain);
+		iommu_tce_table_put(ptbl);
+		iommu_group_put(grp);
+		return NULL;
+	}
+
+	table_group->ops->set_window(table_group, 0, ptbl);
+	iommu_group_put(grp);
+
+	ppc64_domain->domain.pgsize_bitmap = SZ_4K;
+	ppc64_domain->domain.geometry.force_aperture = true;
+	ppc64_domain->domain.geometry.aperture_start = 0;
+	ppc64_domain->domain.geometry.aperture_end = 0x40000000; /*default window */
+	ppc64_domain->domain.ops = spapr_tce_iommu_ops.default_domain_ops;
+
+	spin_lock_init(&ppc64_domain->list_lock);
+
+	return &ppc64_domain->domain;
+}
+
+static size_t spapr_tce_iommu_unmap_pages(struct iommu_domain *domain,
+				unsigned long iova,
+				size_t pgsize, size_t pgcount,
+				struct iommu_iotlb_gather *gather)
+{
+	struct ppc64_domain *ppc64_domain = to_ppc64_domain(domain);
+	struct iommu_table *tbl = ppc64_domain->table;
+	unsigned long pgshift = __ffs(pgsize);
+	size_t size = pgcount << pgshift;
+	size_t mapped = 0;
+	unsigned int tcenum;
+	int  mask;
+
+	if (pgsize != SZ_4K)
+		return -EINVAL;
+
+	size = PAGE_ALIGN(size);
+
+	mask = IOMMU_PAGE_MASK(tbl);
+	tcenum = iova >> tbl->it_page_shift;
+
+	tbl->it_ops->clear(tbl, tcenum, pgcount);
+
+	mapped = pgsize * pgcount;
+
+	return mapped;
+}
+
+static phys_addr_t spapr_tce_iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
+{
+	struct ppc64_domain *ppc64_domain = to_ppc64_domain(domain);
+	struct iommu_table *tbl = ppc64_domain->table;
+	phys_addr_t paddr, rpn, tceval;
+	unsigned int tcenum;
+
+	tcenum = iova >> tbl->it_page_shift;
+	tceval = tbl->it_ops->get(tbl, tcenum);
+
+	/* Ignore the direction bits */
+	rpn = tceval >> tbl->it_page_shift;
+	paddr = rpn << tbl->it_page_shift;
+
+	return paddr;
+}
+
+static int spapr_tce_iommu_map_pages(struct iommu_domain *domain,
+				unsigned long iova, phys_addr_t paddr,
+				size_t pgsize, size_t pgcount,
+				int prot, gfp_t gfp, size_t *mapped)
+{
+	struct ppc64_domain *ppc64_domain = to_ppc64_domain(domain);
+	enum dma_data_direction direction = DMA_BIDIRECTIONAL;
+	struct iommu_table *tbl = ppc64_domain->table;
+	unsigned long pgshift = __ffs(pgsize);
+	size_t size = pgcount << pgshift;
+	unsigned int tcenum;
+	int ret;
+
+	if (pgsize != SZ_4K)
+		return -EINVAL;
+
+	if (iova < ppc64_domain->domain.geometry.aperture_start ||
+	    (iova + size - 1) > ppc64_domain->domain.geometry.aperture_end)
+		return -EINVAL;
+
+	if (!IS_ALIGNED(iova | paddr, pgsize))
+		return -EINVAL;
+
+	if (!(prot & IOMMU_WRITE))
+		direction = DMA_FROM_DEVICE;
+
+	if (!(prot & IOMMU_READ))
+		direction = DMA_TO_DEVICE;
+
+	size = PAGE_ALIGN(size);
+	tcenum = iova >> tbl->it_page_shift;
+
+	/* Put the TCEs in the HW table */
+	ret = tbl->it_ops->set(tbl, tcenum, pgcount,
+				paddr, direction, 0, true);
+	if (!ret && mapped)
+		*mapped = pgsize;
+
+	return 0;
+}
+
+static int spapr_tce_iommu_attach_device(struct iommu_domain *domain,
+				    struct device *dev, struct iommu_domain *old)
+{
+	struct ppc64_domain *ppc64_domain = to_ppc64_domain(domain);
+
+	/* REVISIT */
+	if (!domain)
+		return 0;
+
+	/* REVISIT: Check table group, list handling */
+	ppc64_domain->device = dev;
+
+	return 0;
+}
+
+
 static const struct iommu_ops spapr_tce_iommu_ops = {
 	.default_domain = &spapr_tce_platform_domain,
 	.blocked_domain = &spapr_tce_blocked_domain,
@@ -1267,6 +1436,14 @@ static const struct iommu_ops spapr_tce_iommu_ops = {
 	.probe_device = spapr_tce_iommu_probe_device,
 	.release_device = spapr_tce_iommu_release_device,
 	.device_group = spapr_tce_iommu_device_group,
+	.domain_alloc_paging = spapr_tce_domain_alloc_paging,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev     = spapr_tce_iommu_attach_device,
+		.map_pages      = spapr_tce_iommu_map_pages,
+		.unmap_pages    = spapr_tce_iommu_unmap_pages,
+		.iova_to_phys   = spapr_tce_iommu_iova_to_phys,
+		.free           = spapr_tce_domain_free,
+	}
 };
 
 static struct attribute *spapr_tce_iommu_attrs[] = {
diff --git a/arch/powerpc/platforms/powernv/pci-ioda-tce.c b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
index e96324502db0..8800bf86d17a 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda-tce.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
@@ -123,10 +123,10 @@ static __be64 *pnv_tce(struct iommu_table *tbl, bool user, long idx, bool alloc)
 
 int pnv_tce_build(struct iommu_table *tbl, long index, long npages,
 		unsigned long uaddr, enum dma_data_direction direction,
-		unsigned long attrs)
+		unsigned long attrs, bool is_phys)
 {
 	u64 proto_tce = iommu_direction_to_tce_perm(direction);
-	u64 rpn = __pa(uaddr) >> tbl->it_page_shift;
+	u64 rpn = !is_phys ? __pa(uaddr) >> tbl->it_page_shift : uaddr >> tbl->it_page_shift;
 	long i;
 
 	if (proto_tce & TCE_PCI_WRITE)
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index b0c1d9d16fb5..610146a63e3b 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1241,10 +1241,10 @@ static void pnv_pci_ioda2_tce_invalidate(struct iommu_table *tbl,
 static int pnv_ioda2_tce_build(struct iommu_table *tbl, long index,
 		long npages, unsigned long uaddr,
 		enum dma_data_direction direction,
-		unsigned long attrs)
+		unsigned long attrs, bool is_phys)
 {
 	int ret = pnv_tce_build(tbl, index, npages, uaddr, direction,
-			attrs);
+			attrs, is_phys);
 
 	if (!ret)
 		pnv_pci_ioda2_tce_invalidate(tbl, index, npages);
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 42075501663b..3579ecd55d00 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -300,7 +300,7 @@ extern void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
 
 extern int pnv_tce_build(struct iommu_table *tbl, long index, long npages,
 		unsigned long uaddr, enum dma_data_direction direction,
-		unsigned long attrs);
+		unsigned long attrs, bool is_phys);
 extern void pnv_tce_free(struct iommu_table *tbl, long index, long npages);
 extern int pnv_tce_xchg(struct iommu_table *tbl, long index,
 		unsigned long *hpa, enum dma_data_direction *direction);
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index eec333dd2e59..8c6f9f18e462 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -122,7 +122,7 @@ static void iommu_pseries_free_group(struct iommu_table_group *table_group,
 static int tce_build_pSeries(struct iommu_table *tbl, long index,
 			      long npages, unsigned long uaddr,
 			      enum dma_data_direction direction,
-			      unsigned long attrs)
+			      unsigned long attrs, bool false)
 {
 	u64 proto_tce;
 	__be64 *tcep;
@@ -250,7 +250,7 @@ static DEFINE_PER_CPU(__be64 *, tce_page);
 static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
 				     long npages, unsigned long uaddr,
 				     enum dma_data_direction direction,
-				     unsigned long attrs)
+				     unsigned long attrs, bool is_phys)
 {
 	u64 rc = 0;
 	u64 proto_tce;
@@ -287,7 +287,7 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
 		__this_cpu_write(tce_page, tcep);
 	}
 
-	rpn = __pa(uaddr) >> tceshift;
+	rpn = !is_phys ? __pa(uaddr) >> tceshift : uaddr >> tceshift;
 	proto_tce = TCE_PCI_READ;
 	if (direction != DMA_TO_DEVICE)
 		proto_tce |= TCE_PCI_WRITE;
diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index ceae52fd7586..9929aa78a5da 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -4,7 +4,7 @@ menuconfig VFIO
 	select IOMMU_API
 	depends on IOMMUFD || !IOMMUFD
 	select INTERVAL_TREE
-	select VFIO_GROUP if SPAPR_TCE_IOMMU || IOMMUFD=n
+	select VFIO_GROUP if IOMMUFD=n
 	select VFIO_DEVICE_CDEV if !VFIO_GROUP
 	select VFIO_CONTAINER if IOMMUFD=n
 	help
@@ -16,7 +16,7 @@ menuconfig VFIO
 if VFIO
 config VFIO_DEVICE_CDEV
 	bool "Support for the VFIO cdev /dev/vfio/devices/vfioX"
-	depends on IOMMUFD && !SPAPR_TCE_IOMMU
+	depends on IOMMUFD
 	default !VFIO_GROUP
 	help
 	  The VFIO device cdev is another way for userspace to get device



