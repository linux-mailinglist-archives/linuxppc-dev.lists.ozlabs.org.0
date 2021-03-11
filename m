Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 217D2336DFB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 09:40:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dx2T410dwz3cXw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 19:40:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EqyywcMn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EqyywcMn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dx2Sb4R0pz30Ld
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 19:39:59 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12B8YVTW040479; Thu, 11 Mar 2021 03:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=u8O1auKJEwbS7emSxAdqNXdwmfOBia+5IcLfVGnGR/8=;
 b=EqyywcMnuoVxCaTk1Irwen8ajpsIKnaWhwo23WM1P1wvQctUYf2DlBdELj3x8soy3nhG
 HuoAgSVHTyOjM02EXr9YRIjj7GQbbIVxAPrQUb92f1F2B80lVclubnt9rWE+P2nQVG/J
 O3B9w3C9/3i7UmCZlW+sn9UulyTrFIlgHh2oE4r3fvX1lvOBgTYhzQnYckykF7HZjzWS
 xvENLtTP2IxRpQSGKt+gMkfQ5rFcJpu9XehwsFPfdLZmfEIX2YCq6TzUms+xpvOr7KBF
 4/AW16Rsr5n6ICfDIgg768KFWi6iumBS0pJYsT76tN8PDXyNHbyTpxkW3YIiJ/VABAUd Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3774me7n6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 03:39:53 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12B8bPql050446;
 Thu, 11 Mar 2021 03:39:52 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3774me7n5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 03:39:52 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12B8XFte016424;
 Thu, 11 Mar 2021 08:39:50 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3768mprx03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 08:39:50 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12B8dV8535127718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Mar 2021 08:39:31 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AAA252052;
 Thu, 11 Mar 2021 08:39:47 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.77.205.2])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9A0985204E;
 Thu, 11 Mar 2021 08:39:45 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 0/6] Support for H_RPT_INVALIDATE in PowerPC KVM
Date: Thu, 11 Mar 2021 14:09:33 +0530
Message-Id: <20210311083939.595568-1-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_02:2021-03-10,
 2021-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103110047
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
Cc: farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset adds support for the new hcall H_RPT_INVALIDATE
and replaces the nested tlb flush calls with this new hcall
if support for the same exists.

Changes in v6:
-------------
- Split the patch that adds hcall support in to three parts so that
  it becomes easy to understand.
  part1: hcall support for L1 guest
  part2: hcall support for nested guests
  part3: add KVM_CAP_PPC_RPT_INVALIDATE
- Renames, comments and code reorgs to improve readability of the
  patches.
- Added a patch to fix comments in hcall args (Aneesh).
- Added hcall documentation as part of commit message.
- Correct handling for partition-scoped invalidation of nested
  guests (Aneesh).

I haven't addressed the optimization that David suggested for
psize_to_rpti_pgsize() and that could be done later separately.

This patchset passes the following tests:
-----------------------------------------
- Boot and reboot of L1, L2 and L3 guests with GTSE=0.
- Boot and reboot of L1 and multiple L2 guests with GTSE=0
- vm class stress-ng tests on L3 with GTSE=0
- Boot and reboot of L1, L2 and L3 guest with GTSE=1

v5: https://lore.kernel.org/linuxppc-dev/20210224082510.3962423-1-bharata@linux.ibm.com/T/#t

Aneesh Kumar K.V (1):
  KVM: PPC: Book3S HV: Fix comments of H_RPT_INVALIDATE arguments

Bharata B Rao (5):
  powerpc/book3s64/radix: Add H_RPT_INVALIDATE pgsize encodings to
    mmu_psize_def
  KVM: PPC: Book3S HV: Add support for H_RPT_INVALIDATE
  KVM: PPC: Book3S HV: Nested support in H_RPT_INVALIDATE
  KVM: PPC: Book3S HV: Add KVM_CAP_PPC_RPT_INVALIDATE capability
  KVM: PPC: Book3S HV: Use H_RPT_INVALIDATE in nested KVM

 Documentation/virt/kvm/api.rst                |  18 +++
 arch/powerpc/include/asm/book3s/64/mmu.h      |   1 +
 .../include/asm/book3s/64/tlbflush-radix.h    |   4 +
 arch/powerpc/include/asm/hvcall.h             |   4 +-
 arch/powerpc/include/asm/kvm_book3s.h         |   3 +
 arch/powerpc/include/asm/mmu_context.h        |  11 ++
 arch/powerpc/kvm/book3s_64_mmu_radix.c        |  27 +++-
 arch/powerpc/kvm/book3s_hv.c                  | 111 +++++++++++++
 arch/powerpc/kvm/book3s_hv_nested.c           | 116 ++++++++++++-
 arch/powerpc/kvm/powerpc.c                    |   3 +
 arch/powerpc/mm/book3s64/radix_pgtable.c      |   5 +
 arch/powerpc/mm/book3s64/radix_tlb.c          | 152 +++++++++++++++++-
 include/uapi/linux/kvm.h                      |   1 +
 13 files changed, 443 insertions(+), 13 deletions(-)

-- 
2.26.2

