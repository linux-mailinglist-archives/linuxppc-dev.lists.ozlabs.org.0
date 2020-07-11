Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0EA21C353
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jul 2020 11:23:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B3kwh41JbzDqqD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jul 2020 19:23:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B3kld6h6TzDr2d
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jul 2020 19:15:25 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06B920Ew126627; Sat, 11 Jul 2020 05:15:20 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3279y3gq93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 Jul 2020 05:15:20 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06B9BVsd020041;
 Sat, 11 Jul 2020 09:15:18 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 327527r7er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 Jul 2020 09:15:18 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06B9E00P65405134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 11 Jul 2020 09:14:00 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 852E311C04A;
 Sat, 11 Jul 2020 09:14:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A27D811C04C;
 Sat, 11 Jul 2020 09:13:57 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.163.39.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 11 Jul 2020 09:13:57 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [v3 0/5] Migrate non-migrated pages of a SVM.
Date: Sat, 11 Jul 2020 02:13:42 -0700
Message-Id: <1594458827-31866-1-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-11_03:2020-07-10,
 2020-07-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007110065
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
Cc: ldufour@linux.ibm.com, linuxram@us.ibm.com, cclaudio@linux.ibm.com,
 bharata@linux.ibm.com, sathnaga@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The time taken to switch a VM to Secure-VM, increases by the size of the VM.  A
100GB VM takes about 7minutes. This is unacceptable.  This linear increase is
caused by a suboptimal behavior by the Ultravisor and the Hypervisor.  The
Ultravisor unnecessarily migrates all the GFN of the VM from normal-memory to
secure-memory. It has to just migrate the necessary and sufficient GFNs.

However when the optimization is incorporated in the Ultravisor, the Hypervisor
starts misbehaving. The Hypervisor has a inbuilt assumption that the Ultravisor
will explicitly request to migrate, each and every GFN of the VM. If only
necessary and sufficient GFNs are requested for migration, the Hypervisor
continues to manage the remaining GFNs as normal GFNs. This leads of memory
corruption, manifested consistently when the SVM reboots.

The same is true, when a memory slot is hotplugged into a SVM. The Hypervisor
expects the ultravisor to request migration of all GFNs to secure-GFN.  But the
hypervisor cannot handle any H_SVM_PAGE_IN requests from the Ultravisor, done
in the context of UV_REGISTER_MEM_SLOT ucall.  This problem manifests as random
errors in the SVM, when a memory-slot is hotplugged.

This patch series automatically migrates the non-migrated pages of a SVM,
     and thus solves the problem.

Testing: Passed rigorous testing using various sized SVMs.

Changelog:

v3: . Optimized the page-migration retry-logic. 
    . Relax and relinquish the cpu regularly while bulk migrating
    	the non-migrated pages. This issue was causing soft-lockups.
	Fixed it.
    . Added a new patch, to retry page-migration a couple of times
    	before returning H_BUSY in H_SVM_PAGE_IN. This issue was
	seen a few times in a 24hour continuous reboot test of the SVMs.

v2: . fixed a bug observed by Laurent. The state of the GFN's associated
	with Secure-VMs were not reset during memslot flush.
    . Re-organized the code, for easier review.
    . Better description of the patch series.

v1: fixed a bug observed by Bharata. Pages that where paged-in and later
paged-out must also be skipped from migration during H_SVM_INIT_DONE.

Laurent Dufour (1):
  KVM: PPC: Book3S HV: migrate hot plugged memory

Ram Pai (4):
  KVM: PPC: Book3S HV: Disable page merging in H_SVM_INIT_START
  KVM: PPC: Book3S HV: track the state GFNs associated with secure VMs
  KVM: PPC: Book3S HV: migrate remaining normal-GFNs to secure-GFNs in
    H_SVM_INIT_DONE
  KVM: PPC: Book3S HV: retry page migration before erroring-out
    H_SVM_PAGE_IN

 Documentation/powerpc/ultravisor.rst        |   3 +
 arch/powerpc/include/asm/kvm_book3s_uvmem.h |   2 +
 arch/powerpc/kvm/book3s_hv.c                |  10 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c          | 487 ++++++++++++++++++++++++----
 4 files changed, 429 insertions(+), 73 deletions(-)

-- 
1.8.3.1

