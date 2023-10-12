Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B10F7C7798
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 22:04:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V+2J7iko;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S60wC6lK6z3vX6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 07:04:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V+2J7iko;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S60vH5pYPz3cC7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 07:03:39 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39CJqqZF004550;
	Thu, 12 Oct 2023 20:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=/wzyO0p/EDnzfwgYky/PN4hWqfNjoWhhsl3+Ay7AqL8=;
 b=V+2J7ikoHQTYR9h6xyaEwNOr+fTTy1SulUCiU0w0+J1YMQhbWiosZZ51g/V9bVedObxC
 wyeS6ZpFrUcVvhjhdlB7QKv1wT4AQpp1irG/jDIFr5qNRfpZdRP4iuL+L4Uo+py51oN7
 zTfHOyBAw8iD7uLeNTtwhFNmEfTS0pCgROfrJsRjc03bl+kabh86ifmu4tiEYHfef7Fy
 O4Bl4fmluYcuoEnE4W+YDeTsMc1p5duXpdKgLUYFBe2vEBFrU38ovGDaKfERHjp9weTb
 JE/yFtByKv43l4UO2yah8zgXI8eKhddDYtdd90t1PqSiJLmdkOdbEFB8IcEBRBj7K3Lr Vg== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tpqbbrdkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 20:03:17 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39CIh31C001170;
	Thu, 12 Oct 2023 20:03:16 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkkvk9p7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 20:03:15 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39CK3EoG16253688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Oct 2023 20:03:14 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42B9220043;
	Thu, 12 Oct 2023 20:03:14 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A19620040;
	Thu, 12 Oct 2023 20:03:12 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.73.24])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Oct 2023 20:03:12 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [PATCH v6 0/5] powerpc/bpf: use BPF prog pack allocator
Date: Fri, 13 Oct 2023 01:33:05 +0530
Message-ID: <20231012200310.235137-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: B40UDUlRvvFNEfNfE2czTJDwPns5euRK
X-Proofpoint-ORIG-GUID: B40UDUlRvvFNEfNfE2czTJDwPns5euRK
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_12,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=764 mlxscore=0 bulkscore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310120167
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

Both bpf_arch_text_copy() & bpf_arch_text_invalidate() functions,
needed for this support depend on instruction patching in text area.
Currently, patch_instruction() supports patching only one instruction
at a time. The first patch introduces patch_instructions() function
to enable patching more than one instruction at a time. This helps in
avoiding performance degradation while JITing bpf programs.

Patches 2 & 3 implement the above mentioned arch specific functions
using patch_instructions(). Patch 4 fixes a misnomer in bpf JITing
code. The last patch enables the use of BPF prog pack allocator on
powerpc and also, ensures cleanup is handled gracefully.

[1] https://lore.kernel.org/bpf/20220204185742.271030-1-song@kernel.org/

Changes in v6:
* No changes in patches 2-5/5 except addition of Acked-by tags from Song.
* Skipped merging code path of patch_instruction() & patch_instructions()
  to avoid performance overhead observed on ppc32 with that.

Changes in v5:
* Moved introduction of patch_instructions() as 1st patch in series.
* Improved patch_instructions() to use memset & memcpy.
* Fixed the misnomer in JITing code as a separate patch.
* Removed unused bpf_flush_icache() function.

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

Changes in v2:
* Introduced patch_instructions() to help with patching bpf programs.


Hari Bathini (5):
  powerpc/code-patching: introduce patch_instructions()
  powerpc/bpf: implement bpf_arch_text_copy
  powerpc/bpf: implement bpf_arch_text_invalidate for bpf_prog_pack
  powerpc/bpf: rename powerpc64_jit_data to powerpc_jit_data
  powerpc/bpf: use bpf_jit_binary_pack_[alloc|finalize|free]

 arch/powerpc/include/asm/code-patching.h |   1 +
 arch/powerpc/lib/code-patching.c         | 138 +++++++++++++++++++++
 arch/powerpc/net/bpf_jit.h               |  18 +--
 arch/powerpc/net/bpf_jit_comp.c          | 145 ++++++++++++++++++-----
 arch/powerpc/net/bpf_jit_comp32.c        |  13 +-
 arch/powerpc/net/bpf_jit_comp64.c        |  10 +-
 6 files changed, 271 insertions(+), 54 deletions(-)

-- 
2.41.0

