Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF882914943
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 14:00:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yfwjqzf8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W763f20BZz3cYh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 22:00:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yfwjqzf8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W762q1dJdz3cZw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 21:59:46 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OBQhUi007111;
	Mon, 24 Jun 2024 11:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=pp1; bh=psOxch6FPs2WsulZ5Aax8wZVHel
	HN19NTHnsoW0XnZM=; b=Yfwjqzf8CFxopXNKvmRz1hYonmx8D9fVGlocPPdYJlF
	dn4CmDbNvLF04tlcPrlz2lo4uY5l+7VcnjbGBojcZnTLbcW1lQjfqjDBSfbBk8R8
	f/kK9tFoNEkNB+FM9X+nIEqjsthMYeE88wgDmiibKRu3QVhZgnKuwFJZ320L2AVn
	bEU8oa1hiVve8DuVQLPfp5i4SaZPSOC+sJNE0plOKqQi1kO7MRsYNwq0QixsY1p+
	Qt/AKBdLV6tjPIKxI2poqEZLWPn8uzi3498nBpVIGLh0GrOXv/gQiW411eojpDoR
	5MeBc1LFuyKm3ClbvKDfcw4acp5evQ1+J9W1ihNqmZQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yy7h8g4k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 11:59:19 +0000 (GMT)
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45OBxIuK000959;
	Mon, 24 Jun 2024 11:59:18 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yy7h8g4k3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 11:59:18 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45O9tANs008196;
	Mon, 24 Jun 2024 11:59:18 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yx9b0gpuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 11:59:17 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45OBxDOA39649658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jun 2024 11:59:16 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC6DA20043;
	Mon, 24 Jun 2024 11:59:13 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 380D220040;
	Mon, 24 Jun 2024 11:59:06 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.43.62.173])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 24 Jun 2024 11:59:06 +0000 (GMT)
Date: Mon, 24 Jun 2024 17:29:03 +0530
From: Vishal Chourasia <vishalc@linux.ibm.com>
To: Naveen N Rao <naveen@kernel.org>
Subject: Re: [RFC PATCH v3 00/11] powerpc: Add support for ftrace direct and
 BPF trampolines
Message-ID: <ZnlfhxvNnmM1mSVm@linux.ibm.com>
References: <cover.1718908016.git.naveen@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1718908016.git.naveen@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6xGmPnNfcB_oqQw8qAVL90PTjoHARv1z
X-Proofpoint-ORIG-GUID: QFZJp2eMEmgOHMNDYsKPZda3PAumUEGB
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_09,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406240095
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Vernet <dvernet@meta.com>, John Fastabend <john.fastabend@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Tejun Heo <tj@kernel.org>, bpf@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2024 at 12:24:03AM +0530, Naveen N Rao wrote:
> This is v3 of the patches posted here:
> http://lkml.kernel.org/r/cover.1718008093.git.naveen@kernel.org
> 
> Since v2, I have addressed review comments from Steven and Masahiro 
> along with a few fixes. Patches 7-11 are new in this series and add 
> support for ftrace direct and bpf trampolines. 
> 
> This series depends on the patch series from Benjamin Gray adding 
> support for patch_ulong():
> http://lkml.kernel.org/r/20240515024445.236364-1-bgray@linux.ibm.com

This patchset, along with its dependent patchset [2], enables support 
for BPF schedulers introduced by the sched_ext patchset [1] on 
Power Architecture.

Before this patchset, BPF schedulers were failing to load due to the 
lack of trampoline support.

GitHub repo for sched_ext: https://github.com/sched-ext/sched_ext
Note: This repo has been archived. Please refer to the description 
provided on the repo homepage for more details.

[1] v6 https://lore.kernel.org/lkml/20240501151312.635565-1-tj@kernel.org
[2] http://lkml.kernel.org/r/20240515024445.236364-1-bgray@linux.ibm.com

Thank you for the patch!
> 
> 
> - Naveen
> 
> 
> Naveen N Rao (11):
>   powerpc/kprobes: Use ftrace to determine if a probe is at function
>     entry
>   powerpc/ftrace: Unify 32-bit and 64-bit ftrace entry code
>   powerpc/module_64: Convert #ifdef to IS_ENABLED()
>   powerpc/ftrace: Remove pointer to struct module from dyn_arch_ftrace
>   kbuild: Add generic hook for architectures to use before the final
>     vmlinux link
>   powerpc64/ftrace: Move ftrace sequence out of line
>   powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_CALL_OPS
>   powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>   samples/ftrace: Add support for ftrace direct samples on powerpc
>   powerpc64/bpf: Fold bpf_jit_emit_func_call_hlp() into
>     bpf_jit_emit_func_call_rel()
>   powerpc64/bpf: Add support for bpf trampolines
> 
>  arch/Kconfig                                |   3 +
>  arch/powerpc/Kconfig                        |   9 +
>  arch/powerpc/Makefile                       |   8 +
>  arch/powerpc/include/asm/ftrace.h           |  29 +-
>  arch/powerpc/include/asm/module.h           |   5 +
>  arch/powerpc/include/asm/ppc-opcode.h       |  14 +
>  arch/powerpc/kernel/asm-offsets.c           |  11 +
>  arch/powerpc/kernel/kprobes.c               |  18 +-
>  arch/powerpc/kernel/module_64.c             |  67 +-
>  arch/powerpc/kernel/trace/ftrace.c          | 269 +++++++-
>  arch/powerpc/kernel/trace/ftrace_64_pg.c    |  73 +-
>  arch/powerpc/kernel/trace/ftrace_entry.S    | 210 ++++--
>  arch/powerpc/kernel/vmlinux.lds.S           |   3 +-
>  arch/powerpc/net/bpf_jit.h                  |  11 +
>  arch/powerpc/net/bpf_jit_comp.c             | 702 +++++++++++++++++++-
>  arch/powerpc/net/bpf_jit_comp32.c           |   7 +-
>  arch/powerpc/net/bpf_jit_comp64.c           |  68 +-
>  arch/powerpc/tools/Makefile                 |  10 +
>  arch/powerpc/tools/gen-ftrace-pfe-stubs.sh  |  49 ++
>  samples/ftrace/ftrace-direct-modify.c       |  85 ++-
>  samples/ftrace/ftrace-direct-multi-modify.c | 101 ++-
>  samples/ftrace/ftrace-direct-multi.c        |  79 ++-
>  samples/ftrace/ftrace-direct-too.c          |  83 ++-
>  samples/ftrace/ftrace-direct.c              |  69 +-
>  scripts/Makefile.vmlinux                    |   8 +
>  scripts/link-vmlinux.sh                     |  11 +-
>  26 files changed, 1813 insertions(+), 189 deletions(-)
>  create mode 100644 arch/powerpc/tools/Makefile
>  create mode 100755 arch/powerpc/tools/gen-ftrace-pfe-stubs.sh
> 
> 
> base-commit: e2b06d707dd067509cdc9ceba783c06fa6a551c2
> prerequisite-patch-id: a1d50e589288239d5a8b1c1f354cd4737057c9d3
> prerequisite-patch-id: da4142d56880861bd0ad7ad7087c9e2670a2ee54
> prerequisite-patch-id: 609d292e054b2396b603890522a940fa0bdfb6d8
> prerequisite-patch-id: 6f7213fb77b1260defbf43be0e47bff9c80054cc
> prerequisite-patch-id: ad3b71bf071ae4ba1bee5b087e61a2055772a74f
> -- 
> 2.45.2
> 
