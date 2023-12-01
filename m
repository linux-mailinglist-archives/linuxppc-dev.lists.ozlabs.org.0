Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D0B800C1D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 14:31:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bteRmwvG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShYq63yChz3dTY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Dec 2023 00:30:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bteRmwvG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShYkp5V21z3d8N
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Dec 2023 00:27:14 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1DDilQ028099;
	Fri, 1 Dec 2023 13:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Rc3HPvYC8e7vCSIAUFc6byeLxTiY4UQuc4oW21K7ISU=;
 b=bteRmwvGe/W/GgJ+KJ5rLxJtiIUatumjNclLZ/52/Cg6XKUxi0pM5mfmdRakRr4rHUOU
 D0FVJ8LPFjVbhVPQCVfI9GT68zOJRDnSbjAQ+YQ2uO1wYuhdGEioazl2/5xoqDcjerDM
 WxFzGMopeyitOLHZi6LLtDQ5AJY07o0VEaQgwKtQX9vLZPvY/5V4zzmPxcoxdNWhufeP
 /skTiqrIV4H5H/dwMPw+AeKXMNm3k1zHFsVKxURpqel34n3UyGWVqXAjrVCbi8e5C74S
 SKcsnCIEsNI0IDWAMmpblR6C/smKvwX/ZL+OnvoNazxtz1OzwBArQ0lAF+ur0rwMJcRK Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uqg6fgdgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 13:27:04 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B1DEJg9030824;
	Fri, 1 Dec 2023 13:26:50 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uqg6fgdc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 13:26:49 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1AY1f2020448;
	Fri, 1 Dec 2023 13:26:32 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukvrm52se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 13:26:31 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B1DQSON23134850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Dec 2023 13:26:28 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AB2D20040;
	Fri,  1 Dec 2023 13:26:28 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A11CF20043;
	Fri,  1 Dec 2023 13:26:24 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.171.33.138])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  1 Dec 2023 13:26:24 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Fri, 01 Dec 2023 18:56:23 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Subject: [PATCH 00/12] KVM: PPC: Nested APIv2 : Performance improvements
Date: Fri,  1 Dec 2023 18:56:05 +0530
Message-ID: <20231201132618.555031-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zrjsxIfc1GSB9SzBuu4AfG_eqmAi68I5
X-Proofpoint-GUID: h2afNjvX0_oXVfYmkQ5trQfskOPxNbyn
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_11,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 adultscore=0 mlxlogscore=228
 priorityscore=1501 spamscore=1 lowpriorityscore=0 malwarescore=0
 phishscore=0 mlxscore=1 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010091
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, David.Laight@ACULAB.COM, kconsul@linux.vnet.ibm.com, vaibhav <vajain21@vajain21.in.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: vaibhav <vajain21@vajain21.in.ibm.com>


This patch series introduces series of performance improvements to recently
added support for Nested APIv2 PPC64 Guests via [1]. Details for Nested
APIv2 for PPC64 Guests is available in Documentation/powerpc/kvm-nested.rst.

This patch series introduces various optimizations for a Nested APIv2
guests namely:

* Reduce the number times L1 hypervisor requests for L2 state from L0.
* Register the L2 VPA with L1
* Optimizing interrupt delivery of some interrupt types.
* Optimize emulation of mmio loads/stores for L2 in L1.

The hcalls needed for testing these patches have been implemented in the
spapr qemu model and is available at [2].

There are scripts available to assist in setting up an environment for
testing nested guests at [3].

These patches are consequence of insights from on going performance
engineering effort for improving performance of Nested APIv2
Guests. Special thanks goes to:
* Gautam Menghani
* Jordan Niethe
* Nicholas Piggin
* Vaidyanathan Srinivasan

Refs:
[1] https://lore.kernel.org/all/20230905034658.82835-1-jniethe5@gmail.com
[2] https://github.com/planetharsh/qemu/tree/upstream-0714-kop
[3] https://github.com/iamjpn/kvm-powervm-test

Jordan Niethe (11):
  KVM: PPC: Book3S HV nestedv2: Invalidate RPT before deleting a guest
  KVM: PPC: Book3S HV nestedv2: Avoid reloading the tb offset
  KVM: PPC: Book3S HV nestedv2: Do not check msr on hcalls
  KVM: PPC: Book3S HV nestedv2: Get the PID only if needed to copy
    tofrom a guest
  KVM: PPC: Book3S HV nestedv2: Ensure LPCR_MER bit is passed to the L0
  KVM: PPC: Book3S HV nestedv2: Do not inject certain interrupts
  KVM: PPC: Book3S HV nestedv2: Avoid msr check in
    kvmppc_handle_exit_hv()
  KVM: PPC: Book3S HV nestedv2: Do not call H_COPY_TOFROM_GUEST
  KVM: PPC: Book3S HV nestedv2: Register the VPA with the L0
  KVM: PPC: Reduce reliance on analyse_instr() in mmio emulation
  KVM: PPC: Book3S HV nestedv2: Do not cancel pending decrementer
    exception

Nicholas Piggin (1):
  KVM: PPC: Book3S HV: Handle pending exceptions on guest entry with
    MSR_EE

 arch/powerpc/include/asm/kvm_book3s.h    | 10 +++-
 arch/powerpc/include/asm/kvm_book3s_64.h |  1 +
 arch/powerpc/kvm/book3s.c                |  4 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c   |  7 ++-
 arch/powerpc/kvm/book3s_hv.c             | 72 +++++++++++++++++-------
 arch/powerpc/kvm/book3s_hv_nested.c      |  2 +-
 arch/powerpc/kvm/book3s_hv_nestedv2.c    | 29 ++++++++++
 arch/powerpc/kvm/emulate_loadstore.c     | 21 ++++---
 8 files changed, 107 insertions(+), 39 deletions(-)

-- 
2.42.0

