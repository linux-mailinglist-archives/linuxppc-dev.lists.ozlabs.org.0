Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D79BB903BE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 14:30:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kf5NSpz1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vz7Kg6LKqz3dSd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 22:29:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kf5NSpz1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vz7Jy6gXFz3blb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 22:29:22 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BBTIOW018271;
	Tue, 11 Jun 2024 12:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	subject:from:to:cc:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=pp1; bh=+xuTgifUTgDv1
	KSSr0HjQCiBclbjmC0EqABAAJC4HvM=; b=kf5NSpz1G8/09UVKF/27gCllDadn4
	6KPbZtGNWGcfuZn24InGc8DyvWnvlyl3U+Wlx0F1Nvn6GHj+PtkLnXdFkJTEiqxO
	Dj1fJPczEFuHWAEslHYq3WeKhQJZpUz74b80zHtMbl04Enj4pNZch05q7uwIFYLR
	ry3MsMXt18ez28FqqwRA5CNcU++baDSz+miIEpTQY358DGfeLgE7DcazRtdo6FOE
	7O4PVKPfMoRpUJ1JmWCg+Q1pDQoaKGMZG77MEbgJPEoR88ImHPBJIWOclNCA9IOu
	/FamQD9HEXFNYjCAOid0eZaRvvKBIp/sWxTbVB6hKcDBvE65qp9pOa57w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ypnr0r3vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:29:09 +0000 (GMT)
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45BCT8nR010062;
	Tue, 11 Jun 2024 12:29:08 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ypnr0r3vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:29:08 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45BAG4rE028734;
	Tue, 11 Jun 2024 12:29:07 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yn1mu5y4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:29:07 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45BCT2aR52625874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jun 2024 12:29:04 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F7A12004F;
	Tue, 11 Jun 2024 12:29:02 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0576A20043;
	Tue, 11 Jun 2024 12:28:59 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.3.101.175])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jun 2024 12:28:58 +0000 (GMT)
Subject: [PATCH v3 0/6] powerpc: pSeries: vfio: iommu: Re-enable support for
 SPAPR TCE VFIO
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: mpe@ellerman.id.au, tpearson@raptorengineering.com,
        alex.williamson@redhat.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Date: Tue, 11 Jun 2024 12:28:58 +0000
Message-ID: <171810893836.1721.2640631616827396553.stgit@linux.ibm.com>
User-Agent: StGit/1.5
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 92C-Q4P0P3MjOTXxbdTJzlyYklVSGKDI
X-Proofpoint-ORIG-GUID: ESotMs8n1MpL44jpM8heqXKn36I0pJ_x
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406110092
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
Cc: svaidy@linux.ibm.com, robh@kernel.org, jroedel@suse.de, sbhat@linux.ibm.com, gbatra@linux.vnet.ibm.com, jgg@ziepe.ca, aik@ozlabs.ru, linux-kernel@vger.kernel.org, mahesh@linux.ibm.com, aneesh.kumar@kernel.org, brking@linux.vnet.ibm.com, oohall@gmail.com, npiggin@gmail.com, kvm@vger.kernel.org, ruscur@russell.cc, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, msuchanek@suse.de, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patches reimplement the iommu table_group_ops for pSeries
for VFIO SPAPR TCE sub-driver thereby bringing consistency with
PowerNV implementation and getting rid of limitations/bugs which
were emanating from these differences on the earlier approach on
pSeries.

Structure of the patchset:
-------------------------
The first and fifth patches just code movements.

Second patch takes care of collecting the TCE and DDW information
for the vfio_iommu_spapr_tce_ddw_info during probe.

Third patch fixes the convention of using table[1] for VFs on
pSeries when used by the host driver.

Fourth patch fixes the VFIO to call TCE clear before unset window.

The last patch has the API reimplementations, please find the
details on its commit description.

Testing:
-------
Tested with nested guest for NVME card, Mellanox multi-function
card by attaching them to nested kvm guest running on a pSeries
lpar.
Also vfio-test [2] by Alex Willamson, was forked and updated to
add support for pSeries guest and used to test these patches[3].

Limitations/Known Issues:
------------------------
* The DMA window restrictions with SRIOV VF scenarios of having
maximum 1 dma window is taken care in the current patches itself.
However, the necessary changes required in
vfio_iommu_spapr_tce_ddw_info to expose the default window being
a 64-bit one and the qemu changes handle the same will be taken
care in future versions.

References:
----------
[1] https://lore.kernel.org/linuxppc-dev/171026724548.8367.8321359354119254395.stgit@linux.ibm.com/
[2] https://github.com/awilliam/tests
[3] https://github.com/nnmwebmin/vfio-ppc-tests/tree/vfio-ppc-ex

---
Changelog:
v2: https://lore.kernel.org/linuxppc-dev/171450753489.10851.3056035705169121613.stgit@linux.ibm.com/
 - Rebased to upstream. So, required the explicit vmalloc.h inclusion as its
   removed from the system header io.h now.
 - Fixed the DLPAR hotplugged device assignment case. The dma window
   property is backed up before removal. That copy is restored when required.
 - Cleaned up bit more. Removed leftover debug prints and dump_stack()s.
 - The warning at remap_pfn_range_notrack() during kvm guest boot is no longer
   seen after the rebase.

v1: https://lore.kernel.org/linuxppc-dev/171026724548.8367.8321359354119254395.stgit@linux.ibm.com/
 - Rewrite as to stop borrowing the DMA windows and implemented
 the table_group_ops for pSeries.
 - Cover letter and Patch 6 has more details as this was a rewrite.

Shivaprasad G Bhat (6):
      powerpc/iommu: Move pSeries specific functions to pseries/iommu.c
      powerpc/pseries/iommu: Fix the VFIO_IOMMU_SPAPR_TCE_GET_INFO ioctl output
      powerpc/pseries/iommu: Use the iommu table[0] for IOV VF's DDW
      vfio/spapr: Always clear TCEs before unsetting the window
      powerpc/iommu: Move dev_has_iommu_table() to iommu.c
      powerpc/iommu: Reimplement the iommu_table_group_ops for pSeries


 arch/powerpc/include/asm/iommu.h          |   9 +-
 arch/powerpc/kernel/eeh.c                 |  16 -
 arch/powerpc/kernel/iommu.c               | 170 +-----
 arch/powerpc/platforms/powernv/pci-ioda.c |   6 +-
 arch/powerpc/platforms/pseries/iommu.c    | 708 +++++++++++++++++++++-
 drivers/vfio/vfio_iommu_spapr_tce.c       |  13 +-
 6 files changed, 717 insertions(+), 205 deletions(-)

--
Signature

