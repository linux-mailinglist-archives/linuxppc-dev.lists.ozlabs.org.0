Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A12F46B2C9F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 19:06:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXcZD695mz3fYV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 05:06:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=emPG9Acp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=emPG9Acp;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXcTs5Z7Vz3chq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 05:02:41 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 329H52VA019970;
	Thu, 9 Mar 2023 18:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=f2YtmbBo/XIPEk+DAobJEAfO4YCF48VXlkBCn3DMtMQ=;
 b=emPG9Acp51jKiCoik1OeG4C1vfcnE9zMDBp6z/pil7ienvF9tdE+OJY2AwlLzJMdm+vO
 fcrH7G18qmIordajWpe5o96qfh8way9WVit3SncAjRNA6C6hbKqS4phloibqVrYVwNIS
 AiI8aQgEVm63hlQCuj5Iuyf2zStRImJQS+Hw42nAKIc9KkHi4Re57KkGbgDLNeyrewMx
 zPj1ReQTNCgt9AymvPvhEITIsGHHPvMu7cRvJn2Bs3KprBkXui9pJ4SBXcLvXULOOUyY
 0HRUfQ7cbj/cj70QNA/DJfRaN7+BeWSC41t3O8g32pRb0LsZRFgatXZGPx3z5GUKYjd/ Rw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p7j154ecn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 18:02:20 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 329GsqhN022967;
	Thu, 9 Mar 2023 18:02:18 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3p6fystqvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 18:02:18 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 329I2G0f65864158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Mar 2023 18:02:16 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 420312004E;
	Thu,  9 Mar 2023 18:02:16 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18CB62004D;
	Thu,  9 Mar 2023 18:02:14 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.13.46])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Mar 2023 18:02:13 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [PATCH v2 0/4] enable bpf_prog_pack allocator for powerpc
Date: Thu,  9 Mar 2023 23:32:09 +0530
Message-Id: <20230309180213.180263-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hL_b8h0taduXkIHftOfrB6nqMHSSmEnS
X-Proofpoint-GUID: hL_b8h0taduXkIHftOfrB6nqMHSSmEnS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_08,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303090141
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most BPF programs are small, but they consume a page each. For systems
with busy traffic and many BPF programs, this may also add significant
pressure on instruction TLB. High iTLB pressure usually slows down the
whole system causing visible performance degradation for production
workloads.

bpf_prog_pack, a customized allocator that packs multiple bpf programs
into preallocated memory chunks, was proposed [1] to address it. This
series extends this support on powerpc.

The first patch introduces patch_instructions() function to enable
patching more than one instruction at a time. This change showed
around 5X improvement in the time taken to run test_bpf test cases.
Patches 2 & 3 add the arch specific functions needed to support this
feature. Patch 4 enables the support for powerpc and ensures cleanup
is handled racefully. Tested the changes successfully.

[1] https://lore.kernel.org/bpf/20220204185742.271030-1-song@kernel.org/
[2] https://lore.kernel.org/all/20221110184303.393179-1-hbathini@linux.ibm.com/ 

Changes in v2:
* Introduced patch_instructions() to help with patching bpf programs.

Hari Bathini (4):
  powerpc/code-patching: introduce patch_instructions()
  powerpc/bpf: implement bpf_arch_text_copy
  powerpc/bpf: implement bpf_arch_text_invalidate for bpf_prog_pack
  powerpc/bpf: use bpf_jit_binary_pack_[alloc|finalize|free]

 arch/powerpc/include/asm/code-patching.h |   1 +
 arch/powerpc/lib/code-patching.c         | 151 ++++++++++++++++-------
 arch/powerpc/net/bpf_jit.h               |   7 +-
 arch/powerpc/net/bpf_jit_comp.c          | 142 ++++++++++++++++-----
 arch/powerpc/net/bpf_jit_comp32.c        |   4 +-
 arch/powerpc/net/bpf_jit_comp64.c        |   6 +-
 6 files changed, 226 insertions(+), 85 deletions(-)

-- 
2.39.2

