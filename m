Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B44D0223680
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 10:03:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7NsX5PJyzDrLw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 18:03:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7Npx5ZRBzDrLZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 18:00:57 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06H7WKO9075692; Fri, 17 Jul 2020 04:00:46 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32aut4tf24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 04:00:45 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06H7ip95024052;
 Fri, 17 Jul 2020 08:00:44 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 327527xfbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 08:00:43 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06H80fXh30605738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 08:00:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5E33A4072;
 Fri, 17 Jul 2020 08:00:40 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 783A6A4080;
 Fri, 17 Jul 2020 08:00:37 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.163.39.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jul 2020 08:00:37 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [v4 0/5] Migrate non-migrated pages of a SVM.
Date: Fri, 17 Jul 2020 01:00:22 -0700
Message-Id: <1594972827-13928-1-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_04:2020-07-16,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007170054
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

The time to switch a VM to Secure-VM, increases by the size of the VM.
A 100GB VM takes about 7minutes. This is unacceptable.  This linear
increase is caused by a suboptimal behavior by the Ultravisor and the
Hypervisor.  The Ultravisor unnecessarily migrates all the GFN of the
VM from normal-memory to secure-memory. It has to just migrate the
necessary and sufficient GFNs.

However when the optimization is incorporated in the Ultravisor, the
Hypervisor starts misbehaving. The Hypervisor has a inbuilt assumption
that the Ultravisor will explicitly request to migrate, each and every
GFN of the VM. If only necessary and sufficient GFNs are requested for
migration, the Hypervisor continues to manage the remaining GFNs as
normal GFNs. This leads to memory corruption; manifested
consistently when the SVM reboots.

The same is true, when a memory slot is hotplugged into a SVM. The
Hypervisor expects the ultravisor to request migration of all GFNs to
secure-GFN.  But the hypervisor cannot handle any H_SVM_PAGE_IN
requests from the Ultravisor, done in the context of
UV_REGISTER_MEM_SLOT ucall.  This problem manifests as random errors
in the SVM, when a memory-slot is hotplugged.

This patch series automatically migrates the non-migrated pages of a
SVM, and thus solves the problem.

Testing: Passed rigorous testing using various sized SVMs.

Changelog:

v4:  .  Incorported Bharata's comments:
	- Optimization -- replace write mmap semaphore with read mmap semphore.
	- disable page-merge during memory hotplug.
	- rearranged the patches. consolidated the page-migration-retry logic
		in a single patch.

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
  KVM: PPC: Book3S HV: in H_SVM_INIT_DONE, migrate remaining normal-GFNs
    to secure-GFNs.
  KVM: PPC: Book3S HV: retry page migration before erroring-out

 Documentation/powerpc/ultravisor.rst        |   4 +
 arch/powerpc/include/asm/kvm_book3s_uvmem.h |  12 +
 arch/powerpc/kvm/book3s_hv.c                |  10 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c          | 508 ++++++++++++++++++++++++----
 4 files changed, 457 insertions(+), 77 deletions(-)

-- 
1.8.3.1

