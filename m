Return-Path: <linuxppc-dev+bounces-1384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2DA9798CB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2024 22:57:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6L2x23r3z2yNn;
	Mon, 16 Sep 2024 06:57:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726433849;
	cv=none; b=elv1ur4GCinqpmaYU44y/A3nGziRRsf/+50HVB1oiLPNqzgClLfWrpa9AFRD8HslfHGqhcJTc5TzlGV5G8qikq4IF9v5guDe1cGYfJYa3X3LaNIKYBwIgm1dcRMOfRAX4r6TJcfPUF1xkrwEG8FCIGs//wN1utUVMpODbEWLlhkWFT7Ykh7U3LNkSkT1tLyhI6+LKb6McoE48WLZ6N1jKu1oQ/vXNKfHJJvkKrLwDKOEcgTmd/b42CM5B4RlMs5Nv3H0FiPfl1vHufUBfURQO9zdUMDXIhDePSRZZN9TyX0cfJaUl7uKN4+CMS5SZQkDgQKEqj4nDZQbqFfxLaGe6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726433849; c=relaxed/relaxed;
	bh=Ugn0Yrgm2MUs+4SWHdqJV7bEgVdPTrB2iBhc/n6ktso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BMq1b+6E08Qd2gIMGc6AhSsD/gNuy3M/2ssIUjT19uXTNZAl6dJ2e8P6E5mifZsSJjiD4pcUn2m3ZivsN9fQqqtZ4sW4GgOz5VwePtzp0xcY/iW8xHZ3+GA5yCq+7YoQBaH5Vun97+X0rqSRLrnIvc5e5FpxvJ/xY2Xwm5yTartfAJwIDgsqv+hLcInZxcWJmxcRVdBsp2Svzn6xFMw+3sgZ6cSrJ/suEq2NruV13fyu2gJerPMzlOSbK6jmvFDnBAzu95L/lEXUoiGqJ4Vf0W834RdI45ZKNs5GpxGxs1VyoEv1z0oP1qKGtheHPuUi1Dpn7S+QtN3R3AQtadG3og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QNm3Vq/j; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QNm3Vq/j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6L2w1q7nz2yFL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 06:57:27 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FAFxU1023503;
	Sun, 15 Sep 2024 20:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-transfer-encoding
	:mime-version; s=pp1; bh=Ugn0Yrgm2MUs+4SWHdqJV7bEgVdPTrB2iBhc/n6
	ktso=; b=QNm3Vq/jFgJzWd03YPpdwMCG/qNKSrLXXewFhN+vLBus5PlVXBhTPcp
	rNQAsq7XRfu0jmdiQslDgZJ9klDr3m/77QYUzKTuuamVl6P/ngxZzwElZ6fvMz2R
	nEI3x/C0YKQMumwGkfe/rWqBHglnzemAIj6L7uF1uebuKW6BmBm0MNTd3nN5BjWP
	1qMySkQLMZxxNgtkUl2plL2CTD8SeZaIqJ6J2QY+m+ZlSljp95L5rF3hoI0zvhzK
	zdG17n8goDCOXBWFGmSRFxBid67Zo6dQek8nztzVGfLyPPqzWvtRVu3U8DwtojSR
	Wpcunbgw46J9w+0CJjPnZ8nQpN771oA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n41a682j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:56:58 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48FKuwvG010563;
	Sun, 15 Sep 2024 20:56:58 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n41a682f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:56:58 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48FIYSk6001906;
	Sun, 15 Sep 2024 20:56:57 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 41nmtubyc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:56:57 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48FKurua30737120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Sep 2024 20:56:53 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75B2820049;
	Sun, 15 Sep 2024 20:56:53 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A89D420040;
	Sun, 15 Sep 2024 20:56:49 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.68.55])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Sep 2024 20:56:49 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: "Naveen N. Rao" <naveen@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH v5 00/17] powerpc: Core ftrace rework, support for ftrace direct and bpf trampolines
Date: Mon, 16 Sep 2024 02:26:31 +0530
Message-ID: <20240915205648.830121-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.46.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 35M_0baBj8BwEKBy9x7HHGs_httRDY3b
X-Proofpoint-ORIG-GUID: XPAIqLoa7QQeaeBB0FdvAy9EqwAgKZ8v
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-15_12,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409150159

This is v5 of the series posted here:
https://lore.kernel.org/all/cover.1720942106.git.naveen@kernel.org/

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

Changelog v5:
* Intermediate files named .vmlinux.arch.* instead of .arch.vmlinux.*
* Fixed ftrace stack tracer failure due to inadvertent use of
  'add r7, r3, MCOUNT_INSN_SIZE' instruction instead of
  'addi r7, r3, MCOUNT_INSN_SIZE'
* Fixed build error for !CONFIG_MODULES case.
* .vmlinux.arch.* files compiled under arch/powerpc/tools
* Made sure .vmlinux.arch.* files are cleaned with `make clean`
* num_ool_stubs_text_end used for setting up ftrace_ool_stub_text_end
  set to zero instead of computing to some random negative value when
  not required.
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
 arch/powerpc/Kconfig                        |  23 +-
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
 arch/powerpc/net/bpf_jit.h                  |  12 +
 arch/powerpc/net/bpf_jit_comp.c             | 847 +++++++++++++++++++-
 arch/powerpc/net/bpf_jit_comp32.c           |   7 +-
 arch/powerpc/net/bpf_jit_comp64.c           |  68 +-
 arch/powerpc/tools/Makefile                 |  12 +
 arch/powerpc/tools/ftrace-gen-ool-stubs.sh  |  52 ++
 arch/powerpc/tools/ftrace_check.sh          |  50 ++
 samples/ftrace/ftrace-direct-modify.c       |  85 +-
 samples/ftrace/ftrace-direct-multi-modify.c | 101 ++-
 samples/ftrace/ftrace-direct-multi.c        |  79 +-
 samples/ftrace/ftrace-direct-too.c          |  83 +-
 samples/ftrace/ftrace-direct.c              |  69 +-
 scripts/Makefile.vmlinux                    |   7 +
 scripts/link-vmlinux.sh                     |   7 +-
 30 files changed, 2098 insertions(+), 200 deletions(-)
 create mode 100644 arch/powerpc/tools/Makefile
 create mode 100755 arch/powerpc/tools/ftrace-gen-ool-stubs.sh
 create mode 100755 arch/powerpc/tools/ftrace_check.sh

-- 
2.46.0


