Return-Path: <linuxppc-dev+bounces-11713-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78154B437F4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 12:09:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHZvg1dvpz2yrp;
	Thu,  4 Sep 2025 20:09:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756980559;
	cv=none; b=Dn0QGF6huVBqDfycPHfto8ozwG2Gy5oraFXhf5HnbH/ALpBsjwwc1FDsbrvK0slCyV3IJa7+81yHnYG8pUcu/oIo9SWWeqen4+YP673WfMGrjzYeZ9xDPLXr2+mOzjrU0c6y7I3+JJvzowaPF4nnXVZ+5Jc3b3dWBSTxpEu+3AmywHU1vc6l6ZGZmbdZPbwO3jQHVjTetZVl2r9D5hCQ/se4sFYfE2Y2jM56TW1CnbygkTiD+0pksPg9VzJ6W9dMXqg5MYbd9rAeGWJCXP/Z5s8RwunmIYgTOeyxWuyBxOqS58ZaASM0dK5JLVE1UPUbVlBWFHzXN+Kl17vCO8oduA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756980559; c=relaxed/relaxed;
	bh=FCfIB0g19w/gBXxKkNHd0SAzNkeaeHjORouxgnQnUzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WKdkIh/sGLm+m0Y8p2i6HImIwa1j8TglhvXv5IzcILVR/f4u4owsklH4CfsRZWjUpOuk69l0YCrMaUvQ99nrZhGdcgx4G7JXe+Stxwh00uZCCscm2gsw0NS6cT0Q/YYtIw60JF7b7V9dChnOPHEES4T7k7vbwPgP2zALVcro7wGtKoBaru/pax9dx7a/KojwFrLvOPpHL2RQUMk5FPdu8jEcCIy9Imtfh97BapSouOXPXzuooyPU/HCNULY8p6CEHsK+ITeWLO+EWyAUXhSPeIzNXN9jfKb4SGNgCNxQG5iE+I71nJLlHWOvqmI04s7Zlu0S1RKo+kVD4e+bvjrBYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pDViCc8I; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pDViCc8I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHZvf3gGbz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 20:09:18 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Mov8L014694;
	Thu, 4 Sep 2025 10:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=FCfIB0g19w/gBXxKkNHd0SAzNkeaeHjORouxgnQnU
	zE=; b=pDViCc8IW2JP4VUNqe0+DcUcElnbbylmh66K+Ui/w7ueRLrilv12sc8oW
	jjFN4HhpFLcT/HQzPo6DpkcnldvfYhXldn54xaCv4NVjNTZU/IkBhAiB5d04PkI8
	udZO84R23EOH9rECk1rXbvp86d/k52YBkCijBjTpj2pmuLMYte9cXiupbZHr+s8e
	eIUMR9EYeAbeTW8FjJWzyg4lBU6cJA8vr6Mc+IJT9nd8p+1jHRbtywB9t4A1SXkI
	F89hHtqbtZ2iXCWSgIPfysj9vebFS2vRn0g5U+UnGebkwul2OlMc7mszE6hLFOxM
	Om9kcTcRjnoYPRLffWKCKDnZc5J6w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48wshf572t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 10:08:46 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5849rqAs013634;
	Thu, 4 Sep 2025 10:08:45 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48wshf572r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 10:08:45 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 584916SF014345;
	Thu, 4 Sep 2025 10:08:44 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48veb3kn9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 10:08:44 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 584A8f5M49414534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Sep 2025 10:08:41 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3596C20073;
	Thu,  4 Sep 2025 10:08:41 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC7A220067;
	Thu,  4 Sep 2025 10:08:36 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.in.ibm.com (unknown [9.109.219.153])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Sep 2025 10:08:36 +0000 (GMT)
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
        andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org
Subject: [PATCH bpf-next v3 0/4] powerpc64/bpf: Add support for bpf arena and arena atomics
Date: Thu,  4 Sep 2025 15:38:31 +0530
Message-ID: <20250904100835.1100423-1-skb99@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JR7FPIcHfEQnGfz7BVi3W-hDsDegsZaT
X-Authority-Analysis: v=2.4 cv=do3bC0g4 c=1 sm=1 tr=0 ts=68b9652e cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=HxOIHn79L73zkQQosxIA:9
X-Proofpoint-ORIG-GUID: OhqdGAvzUkue9J7WOXEruG4O5p2dlXqe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA0MCBTYWx0ZWRfX26+bzVJt7zrS
 6fJYW3rFrOZHLTbyItko32Ky21x3uYEslaG3cOtND5u6idICHm76lebAKX+8iHYvuyCs0kzqcTf
 byCDP2y44R+fkE2aN6/z7ehm4Jn/eA8lV1bdR+HqYp/u7AvVg2GknlCCbIeQV3oEI+gtvhpGXUz
 0SCahV5VnlrrV4wqf7oQy5wpgBap9t6bH6fr6xs8/gCejXgDnZHKwmU/3F3ES8n4QDjiSflwptw
 bvevwOxDs+vfde2ofoMvHVBrup3g0QJFeaGblDe3U55Fb/Uf+SsUBukF8a+I1H0X6JcD89E8U5q
 RAee1UDYr5o7sC3IvVshVVG1JbB2OJqPT3olMjlpNzmjkRW1SxrDCMSeL/ocdx9krf1KqRnslD/
 irkBd6Um
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020040
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch series introduces support for the PROBE_MEM32,
bpf_addr_space_cast and PROBE_ATOMIC instructions in the powerpc BPF JIT,
facilitating the implementation of BPF arena and arena atomics.

All selftests related to bpf_arena, bpf_arena_atomic(except
load_acquire/store_release) enablement are passing:

# ./test_progs -t arena_list
#5/1     arena_list/arena_list_1:OK
#5/2     arena_list/arena_list_1000:OK
#5       arena_list:OK
Summary: 1/2 PASSED, 0 SKIPPED, 0 FAILED

# ./test_progs -t arena_htab
#4/1     arena_htab/arena_htab_llvm:OK
#4/2     arena_htab/arena_htab_asm:OK
#4       arena_htab:OK
Summary: 1/2 PASSED, 0 SKIPPED, 0 FAILED

# ./test_progs -t verifier_arena
#464/1   verifier_arena/basic_alloc1:OK
#464/2   verifier_arena/basic_alloc2:OK
#464/3   verifier_arena/basic_alloc3:OK
#464/4   verifier_arena/iter_maps1:OK
#464/5   verifier_arena/iter_maps2:OK
#464/6   verifier_arena/iter_maps3:OK
#464     verifier_arena:OK
#465/1   verifier_arena_large/big_alloc1:OK
#465/2   verifier_arena_large/big_alloc2:OK
#465     verifier_arena_large:OK
Summary: 2/8 PASSED, 0 SKIPPED, 0 FAILED

# ./test_progs -t arena_atomics
#3/1     arena_atomics/add:OK
#3/2     arena_atomics/sub:OK
#3/3     arena_atomics/and:OK
#3/4     arena_atomics/or:OK
#3/5     arena_atomics/xor:OK
#3/6     arena_atomics/cmpxchg:OK
#3/7     arena_atomics/xchg:OK
#3/8     arena_atomics/uaf:OK
#3/9     arena_atomics/load_acquire:SKIP
#3/10    arena_atomics/store_release:SKIP
#3       arena_atomics:OK (SKIP: 2/10)
Summary: 1/8 PASSED, 2 SKIPPED, 0 FAILED

Changes since v2:
* Dropped arena_spin_lock selftest fix patch from the patchset as it has
  to go via bpf-next while these changes will go via powerpc tree.

v2:https://lore.kernel.org/all/20250829165135.1273071-1-skb99@linux.ibm.com/

Changes since v1:

Addressed comments from Chris:
* Squashed introduction of bpf_jit_emit_probe_mem_store() and its usage in
  one patch.
* Defined and used PPC_RAW_RLDICL_DOT to avoid the CMPDI.
* Removed conditional statement for fixup[0] = PPC_RAW_LI(dst_reg, 0);
* Indicated this change is limited to powerpc64 in subject.

Addressed comments from Alexei:
* Removed skel->rodata->nr_cpus = get_nprocs() and its usage to get
  currently online cpus(as it needs to be updated from userspace).

Addressed comments from Hari:
* Updated the bpf jit stack layout and associated macros to accommodate
  new NVR.

v1:https://lore.kernel.org/all/20250805062747.3479221-1-skb99@linux.ibm.com/

Saket Kumar Bhaskar (4):
  powerpc64/bpf: Implement PROBE_MEM32 pseudo instructions
  powerpc64/bpf: Implement bpf_addr_space_cast instruction
  powerpc64/bpf: Introduce bpf_jit_emit_atomic_ops() to emit atomic
    instructions
  powerpc64/bpf: Implement PROBE_ATOMIC instructions

 arch/powerpc/include/asm/ppc-opcode.h |   1 +
 arch/powerpc/net/bpf_jit.h            |   6 +-
 arch/powerpc/net/bpf_jit_comp.c       |  32 +-
 arch/powerpc/net/bpf_jit_comp32.c     |   2 +-
 arch/powerpc/net/bpf_jit_comp64.c     | 401 +++++++++++++++++++-------
 5 files changed, 330 insertions(+), 112 deletions(-)

-- 
2.43.5


