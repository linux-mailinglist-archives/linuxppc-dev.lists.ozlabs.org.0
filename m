Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4CA18A1E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 18:47:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jHY71cgDzDr09
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 04:47:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jHT31bQPzDqbB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 04:43:34 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IHYNUR045059
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 13:43:31 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yua2b72ur-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 13:43:31 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <groug@kaod.org>;
 Wed, 18 Mar 2020 17:43:30 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Mar 2020 17:43:26 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02IHhPI351183854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 17:43:25 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47E6BA405B;
 Wed, 18 Mar 2020 17:43:25 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 030D9A4054;
 Wed, 18 Mar 2020 17:43:25 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.41.106])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 Mar 2020 17:43:24 +0000 (GMT)
Subject: [PATCH 0/3] KVM: PPC: Fix host kernel crash with PR KVM
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>
Date: Wed, 18 Mar 2020 18:43:24 +0100
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20031817-0008-0000-0000-0000035F7AD2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031817-0009-0000-0000-00004A80D601
Message-Id: <158455340419.178873.11399595021669446372.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_07:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=724 malwarescore=0 suspectscore=2 clxscore=1034 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003180076
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
Cc: kvm-ppc@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Recent cleanup from Sean Christopherson introduced a use-after-free
condition that crashes the kernel when shutting down the VM with
PR KVM. It went unnoticed so far because PR isn't tested/used much
these days (mostly used for nested on POWER8, not supported on POWER9
where HV should be used for nested), and other KVM implementations for
ppc are unaffected.

This all boils down to the fact that the path that frees the per-vCPU
MMU data goes through a complex set of indirections. This obfuscates
the code to the point that we didn't realize that the MMU data was
now being freed too early. And worse, most of the indirection isn't
needed because only PR KVM has some MMU data to free when the vCPU is
destroyed.

Fix the issue (patch 1) and simplify the code (patch 2 and 3).

--
Greg

---

Greg Kurz (3):
      KVM: PPC: Fix kernel crash with PR KVM
      KVM: PPC: Move kvmppc_mmu_init() PR KVM
      KVM: PPC: Kill kvmppc_ops::mmu_destroy() and kvmppc_mmu_destroy()


 arch/powerpc/include/asm/kvm_ppc.h    |    3 ---
 arch/powerpc/kvm/book3s.c             |    5 -----
 arch/powerpc/kvm/book3s.h             |    1 +
 arch/powerpc/kvm/book3s_32_mmu_host.c |    2 +-
 arch/powerpc/kvm/book3s_64_mmu_host.c |    2 +-
 arch/powerpc/kvm/book3s_hv.c          |    6 ------
 arch/powerpc/kvm/book3s_pr.c          |    4 ++--
 arch/powerpc/kvm/booke.c              |    5 -----
 arch/powerpc/kvm/booke.h              |    2 --
 arch/powerpc/kvm/e500.c               |    1 -
 arch/powerpc/kvm/e500_mmu.c           |    4 ----
 arch/powerpc/kvm/e500mc.c             |    1 -
 arch/powerpc/kvm/powerpc.c            |    2 --
 13 files changed, 5 insertions(+), 33 deletions(-)

