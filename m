Return-Path: <linuxppc-dev+bounces-6413-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FB5A42029
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 14:15:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1h7R62Xtz303B;
	Tue, 25 Feb 2025 00:15:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740402947;
	cv=none; b=kD5sBIqkLfaki64o3Sv9ZpH40fbUhQIL9Tq8ya3TYEEgx/bVKYWLi2BCnQ+AZqzapGbFrdyewuYeZPesj8jCdWojtapjOIL5cj5hUUXFEQmpyNDaArVpadk9yZkQ/X0QsMKg4nO7MIEs7LxGa8Gm8FsrAlZrJmud/MyLqXU9oEy6dsR8P0aThgxvcesZogfqZIihinX5P/ZibB5OwylyW+4x0zsEALmz8mepQlgszQuuISDJK91iDWdqckOB2c+pEpVaMrUw16u8asSq0z/TaO+F/fNUYRW0j8z9oeBOhUTUTbIfrSJvaRBLMAvg/AeM4BveqeHoE8zrlBOUnAiUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740402947; c=relaxed/relaxed;
	bh=DK+EbFfcxQhbmSMryt9imagThUzLKYVHVA9zC4GRY/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AcZ/j+dCCFgs58neNy9emu7kjg002l45PQgz4+dQS5zcuilyLafB7FujYkfYcE6IlvRTLUaNHHe70MqyiHdbtgc5s2zCaaugVNR9QX57WeaDmgVpnVMXQLEx6n1GI7xJnCqx7PA5QJoHsS7BlkdGyU4y7M21yyMRDZaJ1qFqkhy+pcHKHXKYIzMnGJVUr5onf1+j30sX2eoTAsQipxBpR+JqkFeUo1blzxkLfGPzzKtg3deEqmGWT5KcoczPe/6GJ9o642Bn/1NTr80DimgN3WNCdFNNRIOcM7dErghEUu1D++D2j2VM0YEwf39FbhTcwnQDEljoXtTvsTFy3uLROw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DYXfU5ow; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DYXfU5ow;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1h7Q5gtnz302c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 00:15:46 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O5O6YB012144;
	Mon, 24 Feb 2025 13:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=DK+EbFfcxQhbmSMryt9imagThUzLKYVHVA9zC4GRY
	/E=; b=DYXfU5owqK307lhbaIrwg1swpZgjyJo1hjGDnvxFPSJZwDxt77chKJ7pG
	YrNSbIcr7jazZbikReVH3CAU1OH00XXSJOJM83DjeCeYW3fkKrHpq274gpTo9xCt
	3vwIo+I4UGDRolh0LcZbehvy2Rn4tPNqj/K66+GxmhQ0GJ4aJFeNWQo7ztMqg1P5
	lnSMNXtUlmYBpLoefASijiEa54JFaDcAkmG2jt14+ArYxsuiOI+MRfx/C6Lebret
	l3zc79kkKndzPlkdJxynO2QbaS2ekL0/T/TT/bzvMj+1zOz2Th/+mRJVEPjtZlP7
	b53DFm9C/2ey5Oe976ogzBVzOryOw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 450jk81xs4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 13:15:37 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51OD4pP9006177;
	Mon, 24 Feb 2025 13:15:37 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 450jk81xru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 13:15:37 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51OC76Q8026269;
	Mon, 24 Feb 2025 13:15:35 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44yswn78jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 13:15:35 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51ODFWVe10944816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2025 13:15:32 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEEE12004B;
	Mon, 24 Feb 2025 13:15:31 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA51920040;
	Mon, 24 Feb 2025 13:15:27 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.124.210.32])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 24 Feb 2025 13:15:27 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Mon, 24 Feb 2025 18:45:26 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
        amachhiw@linux.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: [PATCH v4 0/6] kvm powerpc/book3s-hv: Expose Hostwide counters as perf-events
Date: Mon, 24 Feb 2025 18:45:14 +0530
Message-ID: <20250224131522.77104-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UyHQHyWQipd433kMt39Tv0yveKhLKCxH
X-Proofpoint-GUID: pubqu-O1gKG7CZOqvQBys_x50UvgvieI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_05,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 spamscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240095
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Changes from v3
Link: https://lore.kernel.org/all/20250123120749.90505-1-vaibhav@linux.ibm.com/
* Moved the new 'kvm-hv' pmu code to a separate module named 'kvm-hv-pmu'
* Fixed a kunit test code crash that happened when run on kvm-hv on
  bare-metal.
* Minor changes to the 'kvm-hv' pmu code / patch descriptions as its now
  built as a kernel module.
=======

This patch-series adds support for reporting Hostwide(L1-Lpar) counters via
perf-events in a new kernel module named 'kvm-hv-pmu'. With the support for
running KVM Guest in a PSeries-Lpar using nested-APIv2 via [1], the
underlying L0-PowerVM hypervisor holds some state information pertaining to
all running L2-KVM Guests in an L1-Lpar. This state information is held in
a pre-allocated memory thats owned by L0-PowerVM and is termed as
Guest-Management-Area(GMA). The GMA is allocated per L1-LPAR and is only
allocated if the lpar is KVM enabled. The size of this area is a fixed
percentage of the memory assigned to the KVM enabled L1-lpar and is
composed of two major components, Guest Management Space(Host-Heap) and
Guest Page Table Management Space(Host-Pagetable).

The Host-Heap holds various data-structures allocated by L0-PowerVM for
L2-KVM Guests running in the L1-Lpar. The Host-Pagetable holds the Radix
pagetable[2] for the L2-KVM Guest which is used by L0-PowerVM to handle
page faults. Since the size of both of these areas is limited and fixed via
partition boot profile, it puts an upper bound on the number of L2-KVM
Guests that can be run in an LPAR. Also due limited size of Host-Pagetable
area, L0-PowerVM is at times forced to perform reclaim operation on
it. This reclaim operation is usually performed when running large number
of L2-KVM Guests which are memory bound and increases Host-Pagetable
utilization.

In light of the above its recommended to track usage of these areas to
ensure consistent L2-KVM Guest performance. Hence this patch-series
attempts to expose the max-size and current-usage of these areas as well as
cumulative amount of bytes reclaimed from Host-Pagetable as perf-events
that can be queried via perf-stat.

The patch series introduces a new 'kvm-hv' PMU that hosted in a new kernel
module named 'kvm-hv-pmu' which exports the perf-events mentioned
below. Since perf-events exported represents the state of the whole L1-Lpar
and not that of a specific L2-KVM guest hence the 'kvm-hv' PMU's scope is
set as PERF_PMU_SCOPE_SYS_WIDE(System-Wide).

New perf-events introduced
==========================

* kvm-hv/host_heap/		: The currently used bytes in the
				  Hypervisor's Guest Management Space
				  associated with the Host Partition.
* kvm-hv/host_heap_max/		: The maximum bytes available in the
				  Hypervisor's Guest Management Space
				  associated with the Host Partition.
* kvm-hv/host_pagetable/	: The currently used bytes in the
				  Hypervisor's Guest Page Table Management
				  Space associated with the Host Partition.
* kvm-hv/host_pagetable_max/	: The maximum bytes available in the
				  Hypervisor's Guest Page Table Management
				  Space associated with the Host Partition.
* kvm-hv/host_pagetable_reclaim/: The amount of space in bytes that has
				  been reclaimed due to overcommit in the
				  Hypervisor's Guest Page Table Management
				  Space associated with the Host Partition.

Structure of this patch series
==============================
Start with documenting and updating the KVM nested-APIv2 hcall
specifications for H_GUEST_GET_STATE hcall and Hostwide guest-state-buffer
elements.

Subsequent patches add support for adding and parsing Hostwide
guest-state-buffer elements in existing kvm-hv apiv2 infrastructure. Also
add a kunit test case to verify correctness of the changes introduced.

Next set of patches in the patch-set introduces a new PMU (kvm-hv) and
kernel module (kvm-hv-pmu), implements plumbing in the kvm-hv-pmu module to
create populate and parse a guest-state-buffer holding the Hostwide
counters returned from L0-PowerVM.

The final patch in the series creates the five new perf-events which then
leverage the kernel's perf-event infrastructure to report the Hostwide
counters returned from L0-PowerVM to perf tool.

Output
======
Once the patch-set is integrated, perf-stat should report the Hostwide
counters for a kvm-enabled pseries lpar with kvm-hv-pmu module loaded as
below:

$ sudo perf stat -e 'kvm-hv/host_heap/'  -e 'kvm-hv/host_heap_max/' \
  -e 'kvm-hv/host_pagetable/' -e 'kvm-hv/host_pagetable_max/' \
  -e 'kvm-hv/host_pagetable_reclaim/' -- sleep 0

Performance counter stats for 'system wide':

                 0      kvm-hv/host_heap/
    10,995,367,936      kvm-hv/host_heap_max/
         2,178,304      kvm-hv/host_pagetable/
     2,147,483,648      kvm-hv/host_pagetable_max/
                 0      kvm-hv/host_pagetable_reclaim/

The patch can be tested with Qemu-TCG emulation support for Book3s-HV APIv2
proposed at [3]. Currently with Qemu-TCG the values for all the Hostwide
counters is reported as '0'.

References
==========
[1] - commit 19d31c5f1157 ("KVM: PPC: Add support for nestedv2 guests")
[2] - "KVM in a PowerVM LPAR: A Power user guide Part II"
      https://ibm.biz/BdGHeY
[3] - https://lore.kernel.org/all/20250221155449.530645-1-vaibhav@linux.ibm.com

Vaibhav Jain (6):
  powerpc: Document APIv2 KVM hcall spec for Hostwide counters
  kvm powerpc/book3s-apiv2: Add support for Hostwide GSB elements
  kvm powerpc/book3s-apiv2: Add kunit tests for Hostwide GSB elements
  kvm powerpc/book3s-apiv2: Introduce kvm-hv specific PMU
  powerpc/kvm-hv-pmu: Implement GSB message-ops for hostwide counters
  powerpc/kvm-hv-pmu: Add perf-events for Hostwide counters

 Documentation/arch/powerpc/kvm-nested.rst     |  40 +-
 arch/powerpc/include/asm/guest-state-buffer.h |  35 +-
 arch/powerpc/include/asm/hvcall.h             |  13 +-
 arch/powerpc/kvm/Kconfig                      |  13 +
 arch/powerpc/kvm/book3s_hv_nestedv2.c         |   6 +
 arch/powerpc/kvm/guest-state-buffer.c         |  39 ++
 arch/powerpc/kvm/test-guest-state-buffer.c    | 214 +++++++++
 arch/powerpc/perf/Makefile                    |   2 +
 arch/powerpc/perf/kvm-hv-pmu.c                | 436 ++++++++++++++++++
 9 files changed, 776 insertions(+), 22 deletions(-)
 create mode 100644 arch/powerpc/perf/kvm-hv-pmu.c

-- 
2.48.1


