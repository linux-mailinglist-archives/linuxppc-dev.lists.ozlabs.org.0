Return-Path: <linuxppc-dev+bounces-7118-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E070CA648D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 11:08:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGW092ylRz2ygn;
	Mon, 17 Mar 2025 21:08:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742206137;
	cv=none; b=VV7/yFNVQs6se/IhWIZVW7TNu9K0WZNWcVOZJbbwl701W5bWl1XMVzk/kLLjpSJVLgkJuEWzDlJV1MWP75QNGAChxsB34wxVWunj6u524u1vQTLcvuqyv6EsU6GX+qRpeVXDvrJD+SARSiDDVUb+wZuK5bPks0PbQ5RorG39547bOGFotQpsGZVMQsZgUSZkvZM88YI3cE57VtwGfhJee86CwhutP0DUn7BVjuvEUEH1LB+0rvHBYRWtHFAxzdhoEL9UMywhocCUgQ3Jbxg1sLYsbA0FZCb/KonTz3UfCxfWDpui9K1tWIKyMzsWf38Dfm1ckebQ04pz8t2mISdDaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742206137; c=relaxed/relaxed;
	bh=7/gWP6EnxcvSbuNjEk0V/DA1hwpexBHF1vFMf7taYD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CsnItktiUg+aaZDhWc2UIGolh6PI4tJfa2SqaxQlpMNz6d3uFky8Z7oaUpVoRpbqYzxbyT0vnhdRD5BifHuL1Yqk6YDs3ObaWZUVipinNh7TctmVTuLLjJG9KXiXvpnX3eoZruCmTWCexnSKIGQPxTNRotzAz7Aew1ZgOHqJ+k/hvyuY/gbRl5KLJRW4P+AEQQ+nTEeG+FcF323AnS7nl+jiHfBo4Ah5UKueF9IZgTqwGiu2D73M28+EXnhOQJVhiD/klgD0lQiduP8pQr9pl1QToqJLuk1GGp14oElk901F81l6Rd/+nTP/x44EQGxHWuibnxfvllRqQ5Dzw9oHEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tlyCIDqg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tlyCIDqg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGW082p16z2ygm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 21:08:55 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H9oD0Y019283;
	Mon, 17 Mar 2025 10:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=7/gWP6EnxcvSbuNjEk0V/DA1hwpexBHF1vFMf7taY
	D4=; b=tlyCIDqgfinXHtWXQPN+xwOBeeQWa5LjJinJPFWfSSiPWy+I0rgmKSzz3
	Ks+RlbRUfelo7Rk9QnP9zMjw818Am41+i/pgYvkaWpptUNkXgPig6TWij7zEfcF1
	dXL9J32eUZqd36CJZc5Hhkc0ouxr+zYjiW6VjSJwF1PX+yDt3wb3T59M9GnAUa53
	I6LfsSfcEbWhnaXMPrSpaTbOvPfZLvD8SmEDMeREmHEjbCdc340Ekx/exgUOChLr
	BCSgtRG2iXme24hJdspe6qKiJjS+SGodvvqd9WrhEanrSBF1DqwsX9yB5wqJ6aoU
	UEOShPNRfQeblI8czEpe9yP79Cbug==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45e6252m6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 10:08:47 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52HA2MEN032247;
	Mon, 17 Mar 2025 10:08:46 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45e6252m6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 10:08:46 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52H8xcuf024449;
	Mon, 17 Mar 2025 10:08:46 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45dnckwfqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 10:08:46 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52HA8fHx34800336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 10:08:41 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCED72006C;
	Mon, 17 Mar 2025 10:08:41 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C50A20063;
	Mon, 17 Mar 2025 10:08:37 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.124.208.110])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 17 Mar 2025 10:08:37 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Mon, 17 Mar 2025 15:38:36 +0530
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
Subject: [PATCH v5 0/6] kvm powerpc/book3s-hv: Expose Hostwide counters as perf-events
Date: Mon, 17 Mar 2025 15:38:27 +0530
Message-ID: <20250317100834.451452-1-vaibhav@linux.ibm.com>
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
X-Proofpoint-GUID: UX7_SGtmrdNQBLJ2AAyAT_TOCIqsoDC1
X-Proofpoint-ORIG-GUID: 1hzyZ6Kgpl4mJM27eC4unFo74eLFVyyG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_03,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503170073
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Changes from v4
Link: https://lore.kernel.org/all/20250224131522.77104-1-vaibhav@linux.ibm.com/
* Addressed various review comments from Atheera
* Fixed a kismet flagged issue in newly new config reported by test-robot [4]
============

Cover Letter
============

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
[4] - https://lore.kernel.org/oe-kbuild-all/202502280218.Jdd4jjlZ-lkp@intel.com

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
 arch/powerpc/perf/kvm-hv-pmu.c                | 435 ++++++++++++++++++
 9 files changed, 775 insertions(+), 22 deletions(-)
 create mode 100644 arch/powerpc/perf/kvm-hv-pmu.c

-- 
2.48.1


