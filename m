Return-Path: <linuxppc-dev+bounces-2700-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 489B59B5C4A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 08:09:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XddXy2hP9z2xk1;
	Wed, 30 Oct 2024 18:09:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730272178;
	cv=none; b=lbRdLnTYmRR+X5vPpYRaSDnQWqWqP2rNqsuQRH3nFIvzvgEgHzYdImmlmkOuDEpw4YiIVDHqeXq6G8X/rXBnM5QOTCHpE5g4YNbidVwbh8DQ68PQxPz2+sCRFDCQzscpfet51/r/Uph4UVI/vHyWqigxV2QD9wysmM40PdvDo9OmlZz84+E3/pXCCWPi6+pRwdbAc5agC+IB/AMj5qdX73Ww6qC7B8LZ0d4x781tOJlLP2qEM4RyU8ylcyJWuxqwXvvs29qfInX64fZGO+kg9My29wv+7mGBNuAWAa7paDeInTIFcQYwTEA+3FQhAggXxnzlg5AfhDt6GxfewusuSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730272178; c=relaxed/relaxed;
	bh=LftNx6hiTtEwvQYBqJ87AysvaLELZSDfv14gxXieGLM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xv1fahm02gnXfy37Au4f+CUb3b+2sK76UxRTk8kLVWJmzucZFGRkXqEuEdkI8XElJLeZlYB/EVvL8Rs4We+Ull106aqWGzBUqZkqBKqG9z90l12RccuedUIaVCgnmM50IDMxR4gm2dOIIRGeOgbHUEUfhaP2GltUKmTe64ldKGx7+FBMRp/HtWcCImVsFNtekd2qglHfuvVRIZ+UQs88Q59vElyW0upBo+hP8GOB1vNMm8FUI1L+pNXGZFx9kBFgoeTrNxh21URqu7W7AjhXF6KVgJETbZlkNHWIEqSVDxP/NfLx+PNCPe+qjALQQez6v0BLNunrMK51GwfF0XNwNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PUouqrvG; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PUouqrvG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XddXx0Mqdz2xb3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 18:09:36 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U2d1Fd029914;
	Wed, 30 Oct 2024 07:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=LftNx6hiTtEwvQYBqJ87AysvaLELZSDfv14gxXieG
	LM=; b=PUouqrvGAxH5I7hig9Y9sfUDNkh+75ewCx82WrmdsDT+8zu5VHfEGUzCj
	bIim5wDngdxtdBGtAWurkOHGCoHqDk46DvZ9CnzKAVh3a5QFCOuVlmLJUANvYvw2
	DT6PgeWwDbobOEMq6TuZQ/yNkFLYl7M2Z6m0VTOylPh0rJlgZLHX/oAyAK6/JxND
	JLFfNvQg0sKVDonr/4t5hdiddrECC+oB+HG9pZIRX9Bp+k1h4MF6jWM3ZxPjJPuT
	PunT4n6vyjvUr0weBY8zjGq+anl8qgQZt2JycrwEBhn7YJD0xl5vpFm7cvfue7gl
	mHC2CfwRKhhlT3y9F8sy55fKINykA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42js0h740m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:09:01 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49U7907Y030809;
	Wed, 30 Oct 2024 07:09:00 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42js0h740g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:09:00 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49U6kFSv017307;
	Wed, 30 Oct 2024 07:08:59 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 42harsf3mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:08:59 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49U78uMp58917160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Oct 2024 07:08:56 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2EDB20043;
	Wed, 30 Oct 2024 07:08:55 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D518A2004D;
	Wed, 30 Oct 2024 07:08:51 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.143])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Oct 2024 07:08:51 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH v7 00/17] powerpc: Core ftrace rework, support for ftrace direct and bpf trampolines
Date: Wed, 30 Oct 2024 12:38:33 +0530
Message-ID: <20241030070850.1361304-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5BDp5Xcj1bPaExoq2UF0eLvwIEeM1ONO
X-Proofpoint-ORIG-GUID: VY57FNGPImFqUPbSfFOsu53LvE_YBHcX
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
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
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300051
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This is v7 of the series posted here:
https://lore.kernel.org/all/20241018173632.277333-1-hbathini@linux.ibm.com/

This series reworks core ftrace support on powerpc to have the function
profiling sequence moved out of line. This enables us to have a single
nop at kernel function entry virtually eliminating effect of the
function tracer when it is not enabled. The function profile sequence is
moved out of line and is allocated at two separate places depending on a
new config option.

For 64-bit powerpc, the function profiling sequence is also updated to
include an additional instruction 'mtlr r0' after the usual
two-instruction sequence to fix link stack imbalance (return address
predictor) when ftrace is enabled. This showed an improvement of ~10%
in null_syscall benchmark (NR_LOOPS=10000000) on a Power 10 system
with ftrace enabled.

Finally, support for ftrace direct calls is added based on support for
DYNAMIC_FTRACE_WITH_CALL_OPS. BPF Trampoline support is added atop this.

Support for ftrace direct calls is added for 32-bit powerpc. There is
some code to enable bpf trampolines for 32-bit powerpc, but it is not
complete and will need to be pursued separately.

Patches 1 to 10 are independent of this series and can go in separately
though. Rest of the patches depend on the series from Benjamin Gray
adding support for patch_uint() and patch_ulong():
https://lore.kernel.org/all/172474280311.31690.1489687786264785049.b4-ty@ellerman.id.au/

Changelog v7:
* Changed 'arch_vmlinux_o=""' to 'arch_vmlinux_o='.
* Added Masahiro's Acked-by.
* Added change to avoid ".space repeat count is zero, ignored" warning.
* Fixed PCREL build failure.

Changelog v6:
* Shellcheck warnings fixed for arch/powerpc/tools/ftrace_check.sh
* Masahiro's suggestions incorporated in appropriate patches:
    - https://lore.kernel.org/all/CAK7LNATzqVAJHFg6OyVR1+YgNKo7S=nN1M7w5GJVG1Ygn0QhUA@mail.gmail.com/
* Shellcheck warnings fixed for arch/powerpc/tools/ftrace-gen-ool-stubs.sh
* Fixed https://lore.kernel.org/all/202409170544.6d1odaN2-lkp@intel.com/
* Updated the stale comment describing redzone usage in ppc64 BPF JIT

Changelog v5:
* Intermediate files named .vmlinux.arch.* instead of .arch.vmlinux.*
* Fixed ftrace stack tracer failure due to inadvertent use of
  'add r7, r3, MCOUNT_INSN_SIZE' instruction instead of
  'addi r7, r3, MCOUNT_INSN_SIZE'
* Fixed build error for !CONFIG_MODULES case.
* .vmlinux.arch.* files compiled under arch/powerpc/tools
* Resolved checkpatch.pl warnings.
* Dropped RFC tag.

Changelog v4:
- Patches 1, 10 and 13 are new.
- Address review comments from Nick. Numerous changes throughout the 
  patch series.
- Extend support for ftrace ool to vmlinux text up to 64MB (patch 13).
- Address remaining TODOs in support for BPF Trampolines.
- Update synchronization when patching instructions during trampoline 
  attach/detach.


Naveen N Rao (17):
  powerpc/trace: Account for -fpatchable-function-entry support by
    toolchain
  powerpc/kprobes: Use ftrace to determine if a probe is at function
    entry
  powerpc64/ftrace: Nop out additional 'std' instruction emitted by gcc
    v5.x
  powerpc32/ftrace: Unify 32-bit and 64-bit ftrace entry code
  powerpc/module_64: Convert #ifdef to IS_ENABLED()
  powerpc/ftrace: Remove pointer to struct module from dyn_arch_ftrace
  powerpc/ftrace: Skip instruction patching if the instructions are the
    same
  powerpc/ftrace: Move ftrace stub used for init text before _einittext
  powerpc64/bpf: Fold bpf_jit_emit_func_call_hlp() into
    bpf_jit_emit_func_call_rel()
  powerpc/ftrace: Add a postlink script to validate function tracer
  kbuild: Add generic hook for architectures to use before the final
    vmlinux link
  powerpc64/ftrace: Move ftrace sequence out of line
  powerpc64/ftrace: Support .text larger than 32MB with out-of-line
    stubs
  powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_CALL_OPS
  powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS
  samples/ftrace: Add support for ftrace direct samples on powerpc
  powerpc64/bpf: Add support for bpf trampolines

 arch/Kconfig                                |   6 +
 arch/powerpc/Kbuild                         |   2 +-
 arch/powerpc/Kconfig                        |  22 +-
 arch/powerpc/Makefile                       |   8 +
 arch/powerpc/Makefile.postlink              |   8 +
 arch/powerpc/include/asm/ftrace.h           |  33 +-
 arch/powerpc/include/asm/module.h           |   5 +
 arch/powerpc/include/asm/ppc-opcode.h       |  14 +
 arch/powerpc/kernel/asm-offsets.c           |  11 +
 arch/powerpc/kernel/kprobes.c               |  18 +-
 arch/powerpc/kernel/module_64.c             |  66 +-
 arch/powerpc/kernel/trace/Makefile          |  11 +-
 arch/powerpc/kernel/trace/ftrace.c          | 298 ++++++-
 arch/powerpc/kernel/trace/ftrace_64_pg.c    |  69 +-
 arch/powerpc/kernel/trace/ftrace_entry.S    | 244 ++++--
 arch/powerpc/kernel/vmlinux.lds.S           |   3 +-
 arch/powerpc/net/bpf_jit.h                  |  17 +
 arch/powerpc/net/bpf_jit_comp.c             | 847 +++++++++++++++++++-
 arch/powerpc/net/bpf_jit_comp32.c           |   7 +-
 arch/powerpc/net/bpf_jit_comp64.c           |  72 +-
 arch/powerpc/tools/.gitignore               |   2 +
 arch/powerpc/tools/Makefile                 |  10 +
 arch/powerpc/tools/ftrace-gen-ool-stubs.sh  |  51 ++
 arch/powerpc/tools/ftrace_check.sh          |  50 ++
 samples/ftrace/ftrace-direct-modify.c       |  85 +-
 samples/ftrace/ftrace-direct-multi-modify.c | 101 ++-
 samples/ftrace/ftrace-direct-multi.c        |  79 +-
 samples/ftrace/ftrace-direct-too.c          |  83 +-
 samples/ftrace/ftrace-direct.c              |  69 +-
 scripts/Makefile.vmlinux                    |   7 +
 scripts/link-vmlinux.sh                     |   7 +-
 31 files changed, 2103 insertions(+), 202 deletions(-)
 create mode 100644 arch/powerpc/tools/.gitignore
 create mode 100644 arch/powerpc/tools/Makefile
 create mode 100755 arch/powerpc/tools/ftrace-gen-ool-stubs.sh
 create mode 100755 arch/powerpc/tools/ftrace_check.sh

-- 
2.47.0


