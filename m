Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC267987D4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 15:29:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L9EV47lA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhxlZ4fBvz3c67
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 23:28:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L9EV47lA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rhxkg2wKkz2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 23:28:10 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 388DHfBP022746;
	Fri, 8 Sep 2023 13:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=C857QE0gBDASg/QiI+16glBAp7wX87iMQ9oEkLqSAx4=;
 b=L9EV47lAC2wUxFLCxOWayBABSpikDT/yLZfeM+3wb8NuFzhvf+jAtG04+IhvQwIC31ra
 IkPo1BhHUXngxwATSTuqMCL7Fi3bcHmM4gSrIpi+C3Z48Eun+PvwGYybFXMuGP72DekM
 Wq3+v+Xbda276AQx8H25KKecHysjk1z72rHqWvJYYjKzjhle8xNvwRH9AiNY3VF+3uN3
 /AvWiqXYoUBEWwe8rVJC9PqrbL/sd7kQvLHfOsA6UH1PoNjTbcSQnv0cmTzmsveHnX3j
 dNvvc66ncVanzarrcG4fxndan/tOcTqZF4UE/JKLk6qVmjAcmks/9uXcsVqMyJDCjO+Y nA== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t04cb87cx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 13:27:47 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 388DN73P021459;
	Fri, 8 Sep 2023 13:27:46 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svfs042x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 13:27:46 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 388DRia219923450
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Sep 2023 13:27:44 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5ACF52004B;
	Fri,  8 Sep 2023 13:27:44 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3B5020049;
	Fri,  8 Sep 2023 13:27:41 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.29.230])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  8 Sep 2023 13:27:41 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [PATCH v4 0/5] powerpc/bpf: use BPF prog pack allocator
Date: Fri,  8 Sep 2023 18:57:35 +0530
Message-ID: <20230908132740.718103-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iB66yX9-dwJr_LY4oAffiGNCqLXaTBtt
X-Proofpoint-GUID: iB66yX9-dwJr_LY4oAffiGNCqLXaTBtt
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_09,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxlogscore=582
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080121
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

Patches 1 & 2 add the arch specific functions needed to support this
feature. Patch 3 enables the support for powerpc and ensures cleanup
is handled gracefully. Patch 4 introduces patch_instructions() that
optimizes some calls while patching more than one instruction. Patch 5
leverages this new function to improve time taken for JIT'ing BPF
programs.

Note that the first 3 patches are sufficient to enable the support
for bpf_prog_pack on powerpc. Patches 4 & 5 are to improve the JIT
compilation time of BPF programs on powerpc.

Changes in v4:
* Updated bpf_patch_instructions() definition in patch 1/5 so that
  it doesn't have to be updated again in patch 2/5.
* Addressed Christophe's comment on bpf_arch_text_invalidate() return
  value in patch 2/5.

Changes in v3:
* Fixed segfault issue observed on ppc32 due to inaccurate offset
  calculation for branching.
* Tried to minimize the performance impact for patch_instruction()
  with the introduction of patch_instructions().
* Corrected uses of u32* vs ppc_instr_t.
* Moved the change that introduces patch_instructions() to after
  enabling bpf_prog_pack support.
* Added few comments to improve code readability.

[1] https://lore.kernel.org/bpf/20220204185742.271030-1-song@kernel.org/
[2] https://lore.kernel.org/all/20230309180028.180200-1-hbathini@linux.ibm.com/


Hari Bathini (5):
  powerpc/bpf: implement bpf_arch_text_copy
  powerpc/bpf: implement bpf_arch_text_invalidate for bpf_prog_pack
  powerpc/bpf: use bpf_jit_binary_pack_[alloc|finalize|free]
  powerpc/code-patching: introduce patch_instructions()
  powerpc/bpf: use patch_instructions()

 arch/powerpc/include/asm/code-patching.h |   1 +
 arch/powerpc/lib/code-patching.c         |  94 ++++++++++++---
 arch/powerpc/net/bpf_jit.h               |  12 +-
 arch/powerpc/net/bpf_jit_comp.c          | 144 ++++++++++++++++++-----
 arch/powerpc/net/bpf_jit_comp32.c        |  13 +-
 arch/powerpc/net/bpf_jit_comp64.c        |  10 +-
 6 files changed, 211 insertions(+), 63 deletions(-)

-- 
2.41.0

