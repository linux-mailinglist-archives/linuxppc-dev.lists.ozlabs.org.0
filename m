Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E95BB852
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 17:46:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cTFT5fgVzDqJX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 01:46:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cTBV6mJzzDqJM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 01:43:46 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8NFgB0Q032594
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 11:43:40 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v70cv9c96-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 11:43:39 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <groug@kaod.org>;
 Mon, 23 Sep 2019 16:43:37 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 23 Sep 2019 16:43:33 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8NFhWS339125128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 15:43:32 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58E98A405B;
 Mon, 23 Sep 2019 15:43:32 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFC5CA4060;
 Mon, 23 Sep 2019 15:43:31 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.22.84])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Sep 2019 15:43:31 +0000 (GMT)
Subject: [PATCH 0/6] KVM: PPC: Book3S: HV: XIVE: Allocate less VPs in OPAL
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>
Date: Mon, 23 Sep 2019 17:43:31 +0200
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19092315-0028-0000-0000-000003A18D89
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092315-0029-0000-0000-000024639F7C
Message-Id: <156925341155.974393.11681611197111945710.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-23_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=738 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909230148
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
Cc: kvm@vger.kernel.org, Radim =?utf-8?b?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 kvm-ppc@vger.kernel.org, =?utf-8?q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Each vCPU of a VM allocates a XIVE VP in OPAL which is associated with
8 event queue (EQ) descriptors, one for each priority. A POWER9 socket
can handle a maximum of 1M event queues.

The powernv platform allocates NR_CPUS (== 2048) VPs for the hypervisor,
and each XIVE KVM device allocates KVM_MAX_VCPUS (== 2048) VPs. This
means that on a bi-socket system, we can create at most:

(2 * 1M) / (8 * 2048) - 1 == 127 XIVE KVM devices

ie, start at most 127 VMs benefiting from an in-kernel interrupt
controller. Subsequent VMs need to rely on a much slower userspace
emulated XIVE or XICS device in QEMU.

This is problematic as one can legitimately expect to start the same
number of mono-cpu VMs as the number of HW threads available on the
system, eg, 144 on a bi-socket POWER9 Witherspoon.

This series allows QEMU to tell KVM how many interrupt servers are needed,
which is likely less than 2048 with a typical VM, eg. it is only 256 for
32 vCPUs with a guest's core stride of 8 and 1 thread per core.

With this I could run ~500 SMP1 VMs on a Witherspoon system.

Patches 1 to 3 are preliminary fixes (1 and 2 have already been posted
but are provided for convenience).

--
Greg

---

Cédric Le Goater (1):
      KVM: PPC: Book3S HV: XIVE: initialize private pointer when VPs are allocated

Greg Kurz (5):
      KVM: PPC: Book3S HV: XIVE: Set kvm->arch.xive when VPs are allocated
      KVM: PPC: Book3S HV: XIVE: Ensure VP isn't already in use
      KVM: PPC: Book3S HV: XIVE: Compute the VP id in a common helper
      KVM: PPC: Book3S HV: XIVE: Make VP block size configurable
      KVM: PPC: Book3S HV: XIVE: Allow userspace to set the # of VPs


 Documentation/virt/kvm/devices/xics.txt |   14 +++
 Documentation/virt/kvm/devices/xive.txt |    8 ++
 arch/powerpc/include/uapi/asm/kvm.h     |    3 +
 arch/powerpc/kvm/book3s_xive.c          |  145 +++++++++++++++++++++++++------
 arch/powerpc/kvm/book3s_xive.h          |   17 ++++
 arch/powerpc/kvm/book3s_xive_native.c   |   49 +++++-----
 6 files changed, 179 insertions(+), 57 deletions(-)

