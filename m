Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 745528FCE53
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 15:07:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WACDZTdS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvSR93hCTz3cLL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 23:07:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WACDZTdS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvSQQ1J9Rz30VH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 23:06:21 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4559rSvJ022091;
	Wed, 5 Jun 2024 13:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=pp1;
 bh=rNaqCrZ8VkCrTSUz1srEIHGfpxPqUW/VbEDWIXQIZg0=;
 b=WACDZTdSFDX5LXI4qxLk9CM6jOrOmxvKoFCfOqINcGbdQesjJm2lw40duw0sQvJlBs0V
 U/05v80Zbl4Iy7yA37hGAof0NuPOh0NL+qWhpvq2k+1cWa9tpYFw3arY+Jusr7neahQb
 328KP9Xf+7BJPO6ZsHJgOdKSZLM+TByV4x+Lfpd7A1sPvEsWoaw5C7g/gkJCjm/MSvYs
 mi/rod3lsZ52Bd/AL93F5eLvLWIh/P2dNfRUdvqn6lsajsl/bAbM6ZKXZ0U1Ob8MTCuf
 gglu6iTvRNCmD1d8uoJRzKysYJgDPnN4OgiAU3KSEaoaR7SR/LaZ/kADh3P8JUBBgkn8 ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjns38ehm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 13:06:10 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 455D69ba021172;
	Wed, 5 Jun 2024 13:06:09 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjns38ehf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 13:06:09 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4559YkrW031147;
	Wed, 5 Jun 2024 13:06:09 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygeypm7v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 13:06:08 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455D63mX53150180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 13:06:05 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3169F2004B;
	Wed,  5 Jun 2024 13:06:03 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F39C2005A;
	Wed,  5 Jun 2024 13:06:01 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.3.101.175])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 13:06:01 +0000 (GMT)
Subject: [PATCH v2 0/8] KVM: PPC: Book3S HV: Nested guest migration fixes
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Date: Wed, 05 Jun 2024 13:06:00 +0000
Message-ID: <171759276071.1480.9356137231993600304.stgit@linux.ibm.com>
User-Agent: StGit/1.5
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: usujUYPXPSZC1j1m1N83Obvb62lwIZV-
X-Proofpoint-ORIG-GUID: vi58BNYDMLwa3X9OeEw_8w-YXSJNnj-z
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=807 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050099
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

The remaining patches take care of save-restoring the guest
state elements for DEXCR, HASHKEYR and HASHPKEYR SPRs with PHYP
during entry-exit. The KVM_PPC_REG too for them are missing which
are added for use by the QEMU.

References:
[1]: https://github.com/kvm-unit-tests/kvm-unit-tests

---

Changelog:
v1: https://lore.kernel.org/kvm/171741555734.11675.17428208097186191736.stgit@c0c876608f2d/
 - Reordered the patches in a way to introduce the SPRs first as
   suggested.
 - Added Reviewed-bys to the reviewed ones.
 - Added 2 more patches to handle the hashpkeyr state

Shivaprasad G Bhat (8):
      KVM: PPC: Book3S HV: Fix the set_one_reg for MMCR3
      KVM: PPC: Book3S HV: Fix the get_one_reg of SDAR
      KVM: PPC: Book3S HV: Add one-reg interface for DEXCR register
      KVM: PPC: Book3S HV nestedv2: Keep nested guest DEXCR in sync
      KVM: PPC: Book3S HV: Add one-reg interface for HASHKEYR register
      KVM: PPC: Book3S HV nestedv2: Keep nested guest HASHKEYR in sync
      KVM: PPC: Book3S HV: Add one-reg interface for HASHPKEYR register
      KVM: PPC: Book3S HV nestedv2: Keep nested guest HASHPKEYR in sync


 Documentation/virt/kvm/api.rst        |  3 +++
 arch/powerpc/include/asm/kvm_host.h   |  3 +++
 arch/powerpc/include/uapi/asm/kvm.h   |  3 +++
 arch/powerpc/kvm/book3s_hv.c          | 22 ++++++++++++++++++++--
 arch/powerpc/kvm/book3s_hv.h          |  3 +++
 arch/powerpc/kvm/book3s_hv_nestedv2.c | 18 ++++++++++++++++++
 6 files changed, 50 insertions(+), 2 deletions(-)

--
Signature

