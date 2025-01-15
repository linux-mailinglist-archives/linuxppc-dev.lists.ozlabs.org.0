Return-Path: <linuxppc-dev+bounces-5293-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A51A12631
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 15:40:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YY7vD48hgz30HP;
	Thu, 16 Jan 2025 01:40:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736952008;
	cv=none; b=WGVVS+S1pbpFRQUOAMBXT1QjIoBS0gFu/kEfGLSkGVyiFVvgonUTJVA/9n02p5oKInR7EkYOYG1zbIYrHqp9igsGk/xD0axyGfQSzLXCQOCxrTyHEiGMRD1O3pGg1ahtZj9nktE9Px+Azdaj36+Y2l5E8SKCnvkzVSTro8UcxWIgJ9KND13vCo6Zf76GWp98bf+f3lPmhk8WmVnSt09e7eIp1IPDpYafwqTG9c9lGoZ2oe83YtkXZaICGAmRBkaj0LDzX3h1bFtA/9xjV5INXZcJy1tie8sfvNfFO0Phl+b6gql2n5R9c7BfFkfu81sIvdmnSVmHzYx1QTm0wH+gzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736952008; c=relaxed/relaxed;
	bh=BIjhstJBspwa6s0ouWd7Qh79P+ykJt1TqJP60TZLA2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U4nBgo4MV2VZeEkSGkI6bGnqsamX9XAlMPFKqiz8wA83CWadOAgNsCxg6YtiJNPyngnt93E7Po/7mRH0tb3iamvmTdiyBLxhCAIHHay8ronGUbvAVRJBTQV2kU43ruJwvwU4MzhZ+ji/1ZoEqVpBOj9pmhxnCbGg5BRZWYwxOaNZ9RyoXyX2cBkDuF3vIvi/zp8bNF77OFshAT/KCUPCKjRPdN01w0226vD2VW4bkXJmSwoUULMD0NZClLam6uBgog/GrYSmUoD5mbGmsZ7ZWG1N+NMZMQKwapJeOKggJCxRsqfdvzvmpxtrk+cYQXp1PHfsUU+f1DnNXwhy9VpSnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g21zpTU4; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g21zpTU4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YY7vC50sjz30Dw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 01:40:07 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FE7YBI019708;
	Wed, 15 Jan 2025 14:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=BIjhstJBspwa6s0ouWd7Qh79P+ykJt1TqJP60TZLA
	2I=; b=g21zpTU4Of3qGbAsp6rYiEFaVPG9cOBKzmPxES0pDjlxqrwlX1QmvhkUp
	OkDQaPiw/yp1nQADDYDnNysoVe9j3g1BeQOKzUYTOJdn50YSYNWsEeyoIFKcC1Pc
	j5zQU9XaChEcaFtkQmyYR6a2GwaDBzrKa/NVFOZ4H9DY7V5vcYWAkvQ79jqEg3No
	iT/Zuwi965QA3LZOJXuuRLO/OvHOh3pWRPFFoqxLJ1kxtCHkEWTZHNeDyyweJ4ZM
	zPDEcONVjuzobDQqerN4IIkYJpczq8rrZGOw8ysLpPt6FZMgIuFAUPTeAoukYj2+
	4PQrrUKax8XtTNPEPC+KUfLtbkYCA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4465gjtq75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 14:39:59 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50FEdxSx017503;
	Wed, 15 Jan 2025 14:39:59 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4465gjtq73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 14:39:59 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50FDR5Zx004543;
	Wed, 15 Jan 2025 14:39:58 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4442ysryq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 14:39:58 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50FEdsZI35455306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2025 14:39:55 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4E3620040;
	Wed, 15 Jan 2025 14:39:54 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B8DB2004D;
	Wed, 15 Jan 2025 14:39:51 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.39.24.117])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 15 Jan 2025 14:39:50 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Wed, 15 Jan 2025 20:09:49 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, gautam@linux.ibm.com
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, kconsul@linux.ibm.com, amachhiw@linux.ibm.com
Subject: [PATCH v2 0/5] kvm powerpc/book3s-hv: Expose Hostwide counters as perf-events
Date: Wed, 15 Jan 2025 20:09:41 +0530
Message-ID: <20250115143948.369379-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
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
X-Proofpoint-ORIG-GUID: Q4SW-HYWLjRNEuIaqgZ305JKQgofAmsg
X-Proofpoint-GUID: bnSASzMeQwEHqoBvrGZJ-EPKouNJgGvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_05,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501150110
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Changes from V1
Link: https://lore.kernel.org/all/20241222140247.174998-1-vaibhav@linux.ibm.com

* Fixed an issue preventing loading of kvm-hv on PowerNV [Gautam]
* Improved the error handling of GSB callback hostwide_fill_info() [Gautam]
* Tweaks to documentation of Hostwide counters [Gautam]
* Proposed Qemu-TCG emulation for Hostwide counters [3]
=======

This patch-series adds support for reporting Hostwide(L1-Lpar) counters via
perf-events. With the support for running KVM Guest in a PSeries-Lpar using
nested-APIv2 via [1], the underlying L0-PowerVM hypervisor holds some state
information pertaining to all running L2-KVM Guests in an L1-Lpar. This
state information is held in a pre-allocated memory thats owned by
L0-PowerVM and is termed as Guest-Management-Area(GMA). The GMA is
allocated per L1-LPAR and is only allocated if the lpar is KVM enabled. The
size of this area is a fixed percentage of the memory assigned to the KVM
enabled L1-lpar and is composed of two major components, Guest Management
Space(Host-Heap) and Guest Page Table Management Space(Host-Pagetable).

The Host-Heap holds the various data-structures allocated by L0-PowerVM for
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

The patch series introduces a new 'kvm-hv' PMU which exports the
perf-events mentioned below. Since perf-events exported represents the
state of the whole L1-Lpar and not that of a specific L2-KVM guest hence
the 'kvm-hv' PMU's scope is set as PERF_PMU_SCOPE_SYS_WIDE(System-Wide).

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

Next set of patches in the patch-set introduces a new PMU for kvm-hv on
pseries named as 'kvm-hv', implement plumbing between kvm-hv module and
initialization of this new PMU, necessary setup code in kvm-hv pmu to
create populate and parse a guest-state-buffer holding the Hostwide
counters returned from L0-PowerVM.

The final patch in the series creates the five new perf-events which then
leverage the kernel's perf-event infrastructure to report the Hostwide
counters returned from L0-PowerVM to perf tool.

Output
======
Once the patch-set is integrated, perf-stat should report the Hostwide
counters for a kvm-enabled pseries lpar as below:

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
[3] - https://lore.kernel.org/all/20250115070741.297944-1-vaibhav@linux.ibm.com

Vaibhav Jain (6):
  powerpc: Document APIv2 KVM hcall spec for Hostwide counters
  kvm powerpc/book3s-apiv2: Add support for Hostwide GSB elements
  kvm powerpc/book3s-apiv2: Add kunit tests for Hostwide GSB elements
  kvm powerpc/book3s-apiv2: Introduce kvm-hv specific PMU
  powerpc/book3s-hv-pmu: Implement GSB message-ops for hostwide counters
  kvm powerpc/book3s-hv-pmu: Add perf-events for Hostwide counters

 Documentation/arch/powerpc/kvm-nested.rst     |  40 +-
 arch/powerpc/include/asm/guest-state-buffer.h |  35 +-
 arch/powerpc/include/asm/hvcall.h             |  13 +-
 arch/powerpc/include/asm/kvm_book3s.h         |  12 +
 arch/powerpc/kvm/Makefile                     |   6 +
 arch/powerpc/kvm/book3s_hv.c                  |   9 +
 arch/powerpc/kvm/book3s_hv_nestedv2.c         |   6 +
 arch/powerpc/kvm/book3s_hv_pmu.c              | 422 ++++++++++++++++++
 arch/powerpc/kvm/guest-state-buffer.c         |  39 ++
 arch/powerpc/kvm/test-guest-state-buffer.c    | 210 +++++++++
 10 files changed, 770 insertions(+), 22 deletions(-)
 create mode 100644 arch/powerpc/kvm/book3s_hv_pmu.c

-- 
2.47.1


