Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91833925BE3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 13:12:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NiADFmnx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDcZM3HTMz3fQj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 21:12:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NiADFmnx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDcYf51M5z2y8h
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 21:12:05 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463AwCxV021950;
	Wed, 3 Jul 2024 11:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=pp1; bh=V5EXuMpElEVCDydqY49VC8OWoJz
	eRVL1xbi04Vcrp6o=; b=NiADFmnxLc1VQgEdQOp35znjmmlknRyrQDf2KVkaiFI
	7ITBV+kHfHVqW9Q/TJKM+a0qa4DcDgzvUNST4CyZdBQnwc8WmXEDQyfL5y4NzRIA
	kCYw4Ho5nhas1gsjEOH83uT5sfzPSp0QxZnAHl6zP+iBDhAWbHWW/HdAZO90rUve
	hnoAue7gIkd8iioLiDkwHX1H0AhGKiQR6S0/PMuOx4LP8+w4DaIBpfcSgurkr0Z0
	aJEJPffcEZrdoNUBcsVjn5JKHff6WgkjRPRPTZz7cI6jnycz/NtiA8bpEbZC0LWe
	FkKDqFjZJoxUucpm/jOLcC6wFe24/Ii7clNYFkWUbYQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4054wv83eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 11:11:39 +0000 (GMT)
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 463BBc1m012790;
	Wed, 3 Jul 2024 11:11:38 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4054wv83es-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 11:11:38 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 463Adili024095;
	Wed, 3 Jul 2024 11:11:37 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 402ya3htgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 11:11:37 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 463BBXb354919622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Jul 2024 11:11:36 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF15320049;
	Wed,  3 Jul 2024 11:11:33 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D8CB20040;
	Wed,  3 Jul 2024 11:11:30 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.43.4.80])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  3 Jul 2024 11:11:29 +0000 (GMT)
Date: Wed, 3 Jul 2024 16:41:27 +0530
From: Vishal Chourasia <vishalc@linux.ibm.com>
To: Naveen N Rao <naveen@kernel.org>
Subject: Re: [RFC PATCH v3 00/11] powerpc: Add support for ftrace direct and
 BPF trampolines
Message-ID: <ZoUx37C0bXB66MNG@linux.ibm.com>
References: <cover.1718908016.git.naveen@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1718908016.git.naveen@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hlzbUeK_YVzifdgfYz29SmkMbXhpLB_q
X-Proofpoint-ORIG-GUID: 4gMNf_VWYhSTQA5MG6LmqaG8sPq1WQWb
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_06,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030080
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
Cc: Mark Rutland <mark.rutland@arm.com>, John Fastabend <john.fastabend@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>, bpf@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Vishal Chourasia <vishalc@linux.ibm.com>, linux-trace-kernel@vger.kernel.org
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
> 
> 
> - Naveen

Hello Naveen,

I've noticed an issue with `kstack()` in bpftrace [1] when using `kfunc` 
compared to `kprobe`. Despite trying all three modes specified in the 
documentation (bpftrace, perf, or raw), the stack isn't unwinding 
properly with `kfunc`. 

[1] https://github.com/bpftrace/bpftrace/blob/master/man/adoc/bpftrace.adoc#kstack


for mode in modes; do
	run bpftrace with kfunc
	disable cpu
	kill bpftrace
	run bpftrace with kprobe
	enable cpu
	kill bpftrace

# ./kprobe_vs_kfunc.sh
+ bpftrace -e 'kfunc:vmlinux:build_sched_domains {@[kstack(bpftrace), comm, tid]=count();}'
Attaching 1 probe...
+ chcpu -d 2-3
CPU 2 disabled
CPU 3 disabled
+ kill 35214

@[
    bpf_prog_cfd8d6c8bb4898ce+972
, cpuhp/2, 33]: 1
@[
    bpf_prog_cfd8d6c8bb4898ce+972
, cpuhp/3, 38]: 1

+ bpftrace -e 'kprobe:build_sched_domains {@[kstack(bpftrace), comm, tid]=count();}'
Attaching 1 probe...
+ chcpu -e 2-3
CPU 2 enabled
CPU 3 enabled
+ kill 35221

@[
    0x80000007642bdfb4
    partition_sched_domains_locked+1304
    rebuild_sched_domains_locked+216
    cpuset_handle_hotplug+1148
    sched_cpu_activate+664
    cpuhp_invoke_callback+480
    cpuhp_thread_fun+244
    smpboot_thread_fn+460
    kthread+308
    start_kernel_thread+20
, cpuhp/3, 38]: 1
@[
    0x80000007524b34a4
    partition_sched_domains_locked+1304
    rebuild_sched_domains_locked+216
    cpuset_handle_hotplug+1148
    sched_cpu_activate+664
    cpuhp_invoke_callback+480
    cpuhp_thread_fun+244
    smpboot_thread_fn+460
    kthread+308
    start_kernel_thread+20
, cpuhp/2, 33]: 1

+ bpftrace -e 'kfunc:vmlinux:build_sched_domains {@[kstack(perf), comm, tid]=count();}'
Attaching 1 probe...
+ chcpu -d 2-3
CPU 2 disabled
CPU 3 disabled
+ kill 35229

@[
        c008000003433454 bpf_prog_cfd8d6c8bb4898ce+960
, cpuhp/3, 38]: 1
@[
        c008000003433454 bpf_prog_cfd8d6c8bb4898ce+960
, cpuhp/2, 33]: 1


+ bpftrace -e 'kprobe:build_sched_domains {@[kstack(perf), comm, tid]=count();}'
Attaching 1 probe...
+ chcpu -e 2-3
CPU 2 enabled
CPU 3 enabled
+ kill 35235

@[
        80000007524b379c 0x80000007524b379c
        c000000000206268 partition_sched_domains_locked+1304
        c0000000002cbf08 rebuild_sched_domains_locked+216
        c0000000002cfd5c cpuset_handle_hotplug+1148
        c0000000001b3178 sched_cpu_activate+664
        c000000000156fc0 cpuhp_invoke_callback+480
        c000000000157974 cpuhp_thread_fun+244
        c00000000019ddec smpboot_thread_fn+460
        c0000000001932c4 kthread+308
        c00000000000dd58 start_kernel_thread+20
, cpuhp/2, 33]: 1
@[
        80000007642b9b6c 0x80000007642b9b6c
        c000000000206268 partition_sched_domains_locked+1304
        c0000000002cbf08 rebuild_sched_domains_locked+216
        c0000000002cfd5c cpuset_handle_hotplug+1148
        c0000000001b3178 sched_cpu_activate+664
        c000000000156fc0 cpuhp_invoke_callback+480
        c000000000157974 cpuhp_thread_fun+244
        c00000000019ddec smpboot_thread_fn+460
        c0000000001932c4 kthread+308
        c00000000000dd58 start_kernel_thread+20
, cpuhp/3, 38]: 1

+ bpftrace -e 'kfunc:vmlinux:build_sched_domains {@[kstack(raw), comm, tid]=count();}'
Attaching 1 probe...
+ chcpu -d 2-3
CPU 2 disabled
CPU 3 disabled
+ kill 35243

@[
c00800000343346c
, cpuhp/3, 38]: 1
@[
c00800000343346c
, cpuhp/2, 33]: 1


+ bpftrace -e 'kprobe:build_sched_domains {@[kstack(raw), comm, tid]=count();}'
Attaching 1 probe...
+ chcpu -e 2-3
CPU 2 enabled
CPU 3 enabled
+ kill 35249

@[
80000007642befac
c000000000206268
c0000000002cbf08
c0000000002cfd5c
c0000000001b3178
c000000000156fc0
c000000000157974
c00000000019ddec
c0000000001932c4
c00000000000dd58
, cpuhp/3, 38]: 1
@[
80000007524b425c
c000000000206268
c0000000002cbf08
c0000000002cfd5c
c0000000001b3178
c000000000156fc0
c000000000157974
c00000000019ddec
c0000000001932c4
c00000000000dd58
, cpuhp/2, 33]: 1

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
