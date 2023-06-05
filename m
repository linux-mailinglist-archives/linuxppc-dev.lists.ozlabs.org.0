Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B4A721E8D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 08:51:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZPR65ZXbz3dxd
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 16:51:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z3v+7eHq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jpn@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z3v+7eHq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZPNK6cCCz3c3w
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 16:49:21 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3556l4A4013791;
	Mon, 5 Jun 2023 06:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=D/3MBPaELEF1VOmCuosGB989uzoBCgQxZwS8UG1yKHU=;
 b=Z3v+7eHqQEz3ZuyI8Vqa9r4uC5EGzWyDKInyUFeSriwbArFWtKW2H56xldCHNCXo0UEm
 9sUGs8SpBQeh+neS8Igug2V5Znz2rikO824er77YuHjP7y0sDNgQpwYhM/LWJ08q9bbi
 dHv41eW1D2urgO8qaQc3g09Rw4nlEk7itNZ7QgnWegs0AWqspk+HSgBQGqYBwLsbnyGE
 uDHhW964eR4DBed9q/b30xRwIdckhbdEqDcXLRxLCq0YcHgRPZdoARZFosff3yrcQcBQ
 QbUDf0lZrHXJ10233FF4qmAMgANt0llCiFp9ek5sy6Pd7fdVBtvkXjZ4M/UIRI3cYcXr zw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1ar60111-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 06:49:16 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3556kqrt013586;
	Mon, 5 Jun 2023 06:49:16 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1ar6010m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 06:49:16 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3555l3Xu027498;
	Mon, 5 Jun 2023 06:49:14 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3qyxmyh6kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 06:49:14 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3556nBKD65733084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Jun 2023 06:49:11 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7B552004B;
	Mon,  5 Jun 2023 06:49:11 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B936920043;
	Mon,  5 Jun 2023 06:49:10 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Jun 2023 06:49:10 +0000 (GMT)
Received: from pwon.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2DCE1600D5;
	Mon,  5 Jun 2023 16:49:08 +1000 (AEST)
From: Jordan Niethe <jpn@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v2 0/6] KVM: PPC: Nested PAPR guests
Date: Mon,  5 Jun 2023 16:48:42 +1000
Message-Id: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: B3o1dsBf15sSvM3MaKALlSzqV6oStgbb
X-Proofpoint-ORIG-GUID: evnw4AJWwlbCFbKecYGeVTcSvrBOLDY-
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=694
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306050058
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
Cc: Jordan Niethe <jpn@linux.vnet.ibm.com>, mikey@neuling.org, kautuk.consul.1980@gmail.com, kvm@vger.kernel.org, npiggin@gmail.com, kvm-ppc@vger.kernel.org, sbhat@linux.ibm.com, vaibhav@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is existing support for nested guests on powernv hosts however the
hcall interface this uses is not support by other PAPR hosts. A set of
new hcalls will be added to PAPR to facilitate creating and managing
guests by a regular partition in the following way:

  - L1 and L0 negotiate capabilities with
    H_GUEST_{G,S}ET_CAPABILITIES

  - L1 requests the L0 create a L2 with
    H_GUEST_CREATE and receives a handle to use in future hcalls

  - L1 requests the L0 create a L2 vCPU with
    H_GUEST_CREATE_VCPU

  - L1 sets up the L2 using H_GUEST_SET and the
    H_GUEST_VCPU_RUN input buffer

  - L1 requests the L0 runs the L2 vCPU using H_GUEST_VCPU_RUN

  - L2 returns to L1 with an exit reason and L1 reads the
    H_GUEST_VCPU_RUN output buffer populated by the L0

  - L1 handles the exit using H_GET_STATE if necessary

  - L1 reruns L2 vCPU with H_GUEST_VCPU_RUN

  - L1 frees the L2 in the L0 with H_GUEST_DELETE

Further details are available in Documentation/powerpc/kvm-nested.rst.

This series adds KVM support for using this hcall interface as a regular
PAPR partition, i.e. the L1. It does not add support for running as the
L0.

The new hcalls have been implemented in the spapr qemu model for
testing.

This is available at https://github.com/mikey/qemu/tree/kvm-papr

There are scripts available to assist in setting up an environment for
testing nested guests at https://github.com/mikey/kvm-powervm-test

A tree with this series is available at
https://github.com/iamjpn/linux/tree/features/kvm-papr

Thanks to Amit Machhiwal, Kautuk Consul, Vaibhav Jain, Michael Neuling,
Shivaprasad Bhat, Harsh Prateek Bora, Paul Mackerras and Nicholas
Piggin. 

Change overview in v2:
  - Rebase on top of kvm ppc prefix instruction support
  - Make documentation an individual patch
  - Move guest state buffer files from arch/powerpc/lib/ to
    arch/powerpc/kvm/
  - Use kunit for testing guest state buffer
  - Fix some build errors
  - Change HEIR element from 4 bytes to 8 bytes

Previous revisions:

  - v1: https://lore.kernel.org/linuxppc-dev/20230508072332.2937883-1-jpn@linux.vnet.ibm.com/

Jordan Niethe (5):
  KVM: PPC: Use getters and setters for vcpu register state
  KVM: PPC: Add fpr getters and setters
  KVM: PPC: Add vr getters and setters
  KVM: PPC: Add helper library for Guest State Buffers
  KVM: PPC: Add support for nested PAPR guests

Michael Neuling (1):
  docs: powerpc: Document nested KVM on POWER

 Documentation/powerpc/index.rst               |   1 +
 Documentation/powerpc/kvm-nested.rst          | 636 +++++++++++
 arch/powerpc/Kconfig.debug                    |  12 +
 arch/powerpc/include/asm/guest-state-buffer.h | 988 ++++++++++++++++++
 arch/powerpc/include/asm/hvcall.h             |  30 +
 arch/powerpc/include/asm/kvm_book3s.h         | 205 +++-
 arch/powerpc/include/asm/kvm_book3s_64.h      |   6 +
 arch/powerpc/include/asm/kvm_booke.h          |  10 +
 arch/powerpc/include/asm/kvm_host.h           |  21 +
 arch/powerpc/include/asm/kvm_ppc.h            |  80 +-
 arch/powerpc/include/asm/plpar_wrappers.h     | 198 ++++
 arch/powerpc/kvm/Makefile                     |   4 +
 arch/powerpc/kvm/book3s.c                     |  38 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c           |   4 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c        |   9 +-
 arch/powerpc/kvm/book3s_64_vio.c              |   4 +-
 arch/powerpc/kvm/book3s_hv.c                  | 336 ++++--
 arch/powerpc/kvm/book3s_hv.h                  |  65 ++
 arch/powerpc/kvm/book3s_hv_builtin.c          |  10 +-
 arch/powerpc/kvm/book3s_hv_nested.c           |  38 +-
 arch/powerpc/kvm/book3s_hv_p9_entry.c         |   4 +-
 arch/powerpc/kvm/book3s_hv_papr.c             | 940 +++++++++++++++++
 arch/powerpc/kvm/book3s_hv_ras.c              |   5 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c           |   8 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c          |   4 +-
 arch/powerpc/kvm/book3s_xive.c                |   9 +-
 arch/powerpc/kvm/emulate_loadstore.c          |   6 +-
 arch/powerpc/kvm/guest-state-buffer.c         | 612 +++++++++++
 arch/powerpc/kvm/powerpc.c                    |  76 +-
 arch/powerpc/kvm/test-guest-state-buffer.c    | 321 ++++++
 30 files changed, 4467 insertions(+), 213 deletions(-)
 create mode 100644 Documentation/powerpc/kvm-nested.rst
 create mode 100644 arch/powerpc/include/asm/guest-state-buffer.h
 create mode 100644 arch/powerpc/kvm/book3s_hv_papr.c
 create mode 100644 arch/powerpc/kvm/guest-state-buffer.c
 create mode 100644 arch/powerpc/kvm/test-guest-state-buffer.c

-- 
2.31.1

