Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBFF8B811D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 22:06:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HnOQoY1z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTWS36LKrz3ck3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 06:06:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HnOQoY1z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTWRG6myhz3cVH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 06:06:02 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43UJlvUD010165;
	Tue, 30 Apr 2024 20:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=sDilXrIvkPQzU9RlqIFce8fCDaquSVcfFfsmkfJyoDk=;
 b=HnOQoY1zOI35oFO83Ye0H2bHcVF4hmkPuAPsmMPwBMxq3yGCXkk9zGtKDvUfzvjpmyH5
 yvzF1mDNW1xWy/uezQbp7cabV4fHREL9DwRaKrQP+2VJ4k8Y+akJhR7EmfPGF4qmfEg9
 URZ5KNeHd7LW+RbIaEsJNbFsdZ34rSybfTIMRLrdK2ypDK9cISFNqDR0gDkfpIrGGOLG
 fJMdBw1rsN/9Mwn+ROxiNov/PNni3Em2jLj5/7bhy27kPU0wau1RNve7M9TGF7waePMU
 bnF2Ske6ieyevafmXIXKXHoeVXkw6JqWi0oLaUk60X2aTJayNu6WQW9UhNBxijVctk5J hA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xu73s01tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 20:05:47 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43UK5kgx009010;
	Tue, 30 Apr 2024 20:05:46 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xu73s01ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 20:05:46 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43UH49DS003184;
	Tue, 30 Apr 2024 20:05:45 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xscppexxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 20:05:45 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43UK5dBH15204848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Apr 2024 20:05:41 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4969220049;
	Tue, 30 Apr 2024 20:05:39 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E5C2B2004B;
	Tue, 30 Apr 2024 20:05:35 +0000 (GMT)
Received: from ltcd48-lp2.aus.stglabs.ibm.com (unknown [9.3.101.175])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 30 Apr 2024 20:05:35 +0000 (GMT)
Subject: [RFC PATCH v2 0/6] powerpc: pSeries: vfio: iommu: Re-enable support
 for SPAPR TCE VFIO
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: mpe@ellerman.id.au, tpearson@raptorengineering.com,
        alex.williamson@redhat.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Date: Tue, 30 Apr 2024 15:05:34 -0500
Message-ID: <171450753489.10851.3056035705169121613.stgit@linux.ibm.com>
User-Agent: StGit/1.5
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1hEs32qjXcLh_6kuIbHPlDBZhmxdfyiC
X-Proofpoint-GUID: 0ZlVqQRxDY2uE26kp8FRvMBnhxpWxmLj
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_12,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404300143
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

RFC v1 was posted here [1]. As I was testing more and fixing the
issues, I realized its clean to have the table_group_ops implemented
the way it is done on PowerNV and stop 'borrowing' the DMA windows
for pSeries.

This patch-set implements the iommu table_group_ops for pSeries for
VFIO SPAPR TCE sub-driver thereby enabling the VFIO support on POWER
pSeries machines.

So, this patchset is a re-write and not close to the V1 except
for few changes.

Structure of the patchset:
-------------------------
The first and fifth patches just code movements.

Second patch takes care of collecting the TCE and DDW information
for the vfio_iommu_spapr_tce_ddw_info during probe.

Third patch fixes the convention of using table[1] for VFs on
pSeries when used by the host driver.

Fourth patch fixes the VFIO to call TCE clear before unset window.

The last patch has the API implementations, please find the
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
care in next versions.
* KVM guest boot throws warning at remap_pfn_range_notrack(), on
the host, I will post the fix along in the next versions.
* The DLPAR hotplugged device has no FDT entry until next reboot,
default dma window property has to be preserved differently for
this case.

References:
----------
[1] https://lore.kernel.org/linuxppc-dev/171026724548.8367.8321359354119254395.stgit@linux.ibm.com/
[2] https://github.com/awilliam/tests
[3] https://github.com/nnmwebmin/vfio-ppc-tests/tree/vfio-ppc-ex

---
Changelog:
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
      powerpc/iommu: Implement the iommu_table_group_ops for pSeries


 arch/powerpc/include/asm/iommu.h          |   9 +-
 arch/powerpc/kernel/eeh.c                 |  16 -
 arch/powerpc/kernel/iommu.c               | 170 +----
 arch/powerpc/platforms/powernv/pci-ioda.c |   6 +-
 arch/powerpc/platforms/pseries/iommu.c    | 720 +++++++++++++++++++++-
 drivers/vfio/vfio_iommu_spapr_tce.c       |  13 +-
 6 files changed, 729 insertions(+), 205 deletions(-)

--
Signature

