Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 173D68D80AA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 13:15:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iHFyeFix;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtB2n1xTMz3cRy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 21:14:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iHFyeFix;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtB210Jywz30VH
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2024 21:14:16 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 453Alkee017594;
	Mon, 3 Jun 2024 11:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=pp1;
 bh=TOvba2AZcZDOh/jDmm13qSdJvQxdZhqq0H8lnx+HjkY=;
 b=iHFyeFixl3SDFJxS/YtGpz6QBlx3R1I5FUar1tsiA3c/t0gjqljsEzyL4uiZGG5AG9xL
 pGwEQq+KFf4WTE/tfJOUExcBZ04s9gWxj1PxlLHticU/ggRlN08qirewxETCujNt7Uml
 AzE2NdSqeN6qo39eC2ECiUGCfu9h5VrWE5Kbq4K/X8Teew+6BvvwFq5Jpo70hNUYUSse
 lsTbQOrssITwg+pO3ceB3vNWE2y0U1Ti1aQdQUGj6fBHdThicFsUH/pKCv0LGi3heSgC
 Dmu2lyIY1evohniWXh5U4F7S2z4PHQXR3iovz7sg7xWrlhfAjWyziI5lsE0E65RFKWlP Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yhcctr257-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 11:14:05 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 453BBpYf029688;
	Mon, 3 Jun 2024 11:14:04 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yhcctr254-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 11:14:04 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4539GYFD031106;
	Mon, 3 Jun 2024 11:14:03 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygeyp7f9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 11:14:03 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 453BDwjl47448372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Jun 2024 11:14:00 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0C622004B;
	Mon,  3 Jun 2024 11:13:57 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F8C420040;
	Mon,  3 Jun 2024 11:13:56 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.3.101.175])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Jun 2024 11:13:55 +0000 (GMT)
Subject: [PATCH 0/6] KVM: PPC: Book3S HV: Nested guest migration fixes
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Date: Mon, 03 Jun 2024 11:13:55 +0000
Message-ID: <171741323521.6631.11242552089199677395.stgit@linux.ibm.com>
User-Agent: StGit/1.5
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WcbVjiDJE_hXEiNrf85V175ZV6zG-BP3
X-Proofpoint-GUID: juISLmKnx293AYCfFn8reIE_oUNu7aFH
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_07,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=761 clxscore=1011 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406030094
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
Cc: atrajeev@linux.vnet.ibm.com, sbhat@linux.ibm.com, corbet@lwn.net, linux-kernel@vger.kernel.org, npiggin@gmail.com, namhyung@kernel.org, naveen.n.rao@linux.ibm.com, pbonzini@redhat.com, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The series fixes the issues exposed by the kvm-unit-tests[1]
sprs-migration test.

The SDAR, MMCR3 were seen to have some typo/refactoring bugs.
The first two patches fix them.

Though the nestedv2 APIs defined the guest state elements for
Power ISA 3.1B SPRs to save-restore with PHYP during entry-exit,
the DEXCR and HASHKEYR were ignored in code. The KVM_PPC_REG too
for them are missing without which the Qemu is not setting them
to their 'previous' value during guest migration at destination.
The remaining patches take care of this.

References:
[1]: https://github.com/kvm-unit-tests/kvm-unit-tests

---

Shivaprasad G Bhat (6):
      KVM: PPC: Book3S HV: Fix the set_one_reg for MMCR3
      KVM: PPC: Book3S HV: Fix the get_one_reg of SDAR
      KVM: PPC: Book3S HV nestedv2: Keep nested guest DEXCR in sync
      KVM: PPC: Book3S HV: Add one-reg interface for DEXCR register
      KVM: PPC: Book3S HV nestedv2: Keep nested guest HASHKEYR in sync
      KVM: PPC: Book3S HV: Add one-reg interface for HASHKEYR register


 Documentation/virt/kvm/api.rst            |  2 ++
 arch/powerpc/include/asm/kvm_host.h       |  2 ++
 arch/powerpc/include/uapi/asm/kvm.h       |  2 ++
 arch/powerpc/kvm/book3s_hv.c              | 16 ++++++++++++++--
 arch/powerpc/kvm/book3s_hv.h              |  2 ++
 arch/powerpc/kvm/book3s_hv_nestedv2.c     | 12 ++++++++++++
 tools/arch/powerpc/include/uapi/asm/kvm.h |  2 ++
 7 files changed, 36 insertions(+), 2 deletions(-)

--
Signature

