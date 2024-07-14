Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3329308F3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 10:00:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LEogC1L3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMHny1VjKz3ccL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 18:00:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LEogC1L3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMHnF22xgz30YZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 18:00:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7887C608CD;
	Sun, 14 Jul 2024 08:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D798C116B1;
	Sun, 14 Jul 2024 08:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720944012;
	bh=4k9OuVo1gkeM46Ac6cZA8tvbi026HQl5WiZntWB/l3g=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=LEogC1L3snWVGhXwarb0RqFyankIZvVGAYq2EFDjPEcpDjyiqOACgPVWMm4znF0M3
	 gej7n7dr1ezf7bsbm4pWuYCq/DpBEXJRSAABQsS9EGix0QA8ENR7Iu+jLbcOTjbtza
	 tnc6Gl9pZcm3MbT4CSJxJ91b6zWEW5Q1+cmkoNU1HvZHWwmyiZqyJMOUwlf6Kv7JMq
	 ZnEhmZ080YLWRer/hmju+f9Ks6owLPTu1gaLyYNtoHb0q1Q5hPnlY83zEphkRYML+7
	 KE6qh+ioYPqwj6PY1GERWyMfxEgovmm9c71BiMEG2adLPlVmpim/w7mJfUzBOSoZdd
	 k1zf5jO2hCQrg==
Date: Sun, 14 Jul 2024 13:22:49 +0530
From: Naveen N Rao <naveen@kernel.org>
Subject: Re: [RFC PATCH v3 00/11] powerpc: Add support for ftrace direct and
 BPF trampolines
To: Vishal Chourasia <vishalc@linux.ibm.com>
References: <cover.1718908016.git.naveen@kernel.org>
	<ZoUx37C0bXB66MNG@linux.ibm.com>
In-Reply-To: <ZoUx37C0bXB66MNG@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.16.0 (https://github.com/astroidmail/astroid)
Message-Id: <1720942451.kwuygmxy1r.naveen@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Alexei Starovoitov <ast@kernel.org>, Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vishal,

Vishal Chourasia wrote:
> On Fri, Jun 21, 2024 at 12:24:03AM +0530, Naveen N Rao wrote:
>> This is v3 of the patches posted here:
>> http://lkml.kernel.org/r/cover.1718008093.git.naveen@kernel.org
>>=20
>> Since v2, I have addressed review comments from Steven and Masahiro=20
>> along with a few fixes. Patches 7-11 are new in this series and add=20
>> support for ftrace direct and bpf trampolines.=20
>>=20
>> This series depends on the patch series from Benjamin Gray adding=20
>> support for patch_ulong():
>> http://lkml.kernel.org/r/20240515024445.236364-1-bgray@linux.ibm.com
>>=20
>>=20
>> - Naveen
>=20
> Hello Naveen,
>=20
> I've noticed an issue with `kstack()` in bpftrace [1] when using `kfunc`=20
> compared to `kprobe`. Despite trying all three modes specified in the=20
> documentation (bpftrace, perf, or raw), the stack isn't unwinding=20
> properly with `kfunc`.=20
>=20
> [1] https://github.com/bpftrace/bpftrace/blob/master/man/adoc/bpftrace.ad=
oc#kstack
>=20
>=20
> for mode in modes; do
> 	run bpftrace with kfunc
> 	disable cpu
> 	kill bpftrace
> 	run bpftrace with kprobe
> 	enable cpu
> 	kill bpftrace
>=20
> # ./kprobe_vs_kfunc.sh
> + bpftrace -e 'kfunc:vmlinux:build_sched_domains {@[kstack(bpftrace), com=
m, tid]=3Dcount();}'
> Attaching 1 probe...
> + chcpu -d 2-3
> CPU 2 disabled
> CPU 3 disabled
> + kill 35214
>=20
> @[
>     bpf_prog_cfd8d6c8bb4898ce+972
> , cpuhp/2, 33]: 1
> @[
>     bpf_prog_cfd8d6c8bb4898ce+972
> , cpuhp/3, 38]: 1

Yeah, this is because we don't capture the full register state with bpf=20
trampolines unlike with kprobes. BPF stackmap relies on=20
perf_arch_fetch_caller_regs() to create a dummy pt_regs for use by=20
get_perf_callchain(). We end up with a NULL LR, and bpftrace (and most=20
other userspace tools) stop showing the backtrace when they encounter a=20
NULL entry. I recall fixing some tools to continue to show backtrace=20
inspite of a NULL entry, but I may be mis-remembering.

Perhaps we should fix/change how the perf callchain is captured in the=20
kernel. We filter out invalid entries, and capture an additional entry=20
for perf since we can't be sure of our return address. We should revisit=20
this and see if we can align with the usual expectations of a callchain=20
not having a NULL entry. Something like this may help, but this needs=20
more testing especially on the perf side:

diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 6b4434dd0ff3..9f67b764da92 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -83,12 +83,12 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *=
entry, struct pt_regs *re
                         * We can't tell which of the first two addresses
                         * we get are valid, but we can filter out the
                         * obviously bogus ones here.  We replace them
-                        * with 0 rather than removing them entirely so
+                        * with -1 rather than removing them entirely so
                         * that userspace can tell which is which.
                         */
                        if ((level =3D=3D 1 && next_ip =3D=3D lr) ||
                            (level <=3D 1 && !kernel_text_address(next_ip))=
)
-                               next_ip =3D 0;
+                               next_ip =3D -1;
=20
                        ++level;
		}


- Naveen

