Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CDD94B480
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 03:12:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nGYB0TYo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfTXf4s0gz3dLq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 11:12:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nGYB0TYo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfTWy4jX8z3cjf
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 11:11:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 795AECE12BF;
	Thu,  8 Aug 2024 01:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E037C32781;
	Thu,  8 Aug 2024 01:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723079482;
	bh=9cwcJwD2oFV3GuhOKOZnwg10DfpgHVH065g5lC627eQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nGYB0TYobLTgZx1Wq2FRNVa3VDlbvtXC04RbIYk9iWFGDDkdgF/q/bWv6WjPnaFk5
	 SACL172kz5LTd6R153Mbh8c0qAC/llSV5sKFNMRaEH3Y9TX05jQpexPX4GW1/Omz1p
	 +4rSU7vN2MVgf+XFzugWsj0WYJwe4hwGkxWpiNF1WeInM6WV9L/QeEeZcQHmnAPw5P
	 qkx0cB2O2ZGKaiDARQZdTXHRF25YlOgQBzWChujPnB4Q7o60ZnkNC516Z29cpX9gE+
	 pBg2aAwgKAhTrKzI5LZ7ku4eoqahr+rp/rve0xrdHqqjevfNnOe1ATA5fCJjfagvc8
	 GoOCiUV/3/dMA==
Date: Wed, 7 Aug 2024 22:11:18 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCHSET 00/10] perf tools: Sync tools and kernel headers for
 v6.11
Message-ID: <ZrQbNtK3LSpyXpMu@x1>
References: <20240806225013.126130-1-namhyung@kernel.org>
 <ZrO5HR9x2xyPKttx@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrO5HR9x2xyPKttx@google.com>
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
Cc: Ian Rogers <irogers@google.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Kajol Jain <kjain@linux.ibm.com>, James Clark <james.clark@linaro.org>, Thomas Richter <tmricht@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Jiri Olsa <jolsa@kernel.org>, Leo Yan <leo.yan@arm.com>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 07, 2024 at 11:12:45AM -0700, Namhyung Kim wrote:
> On Tue, Aug 06, 2024 at 03:50:03PM -0700, Namhyung Kim wrote:
> > This is the usual sync up in header files we keep in tools directory.
> > I put a file to give the reason of this work and not to repeat it in
> > every commit message.  The changes will be carried in the perf-tools
> > tree.

> Could you please double check what's in the tmp.perf-tools branch at the
> perf-tools tree so I don't break build and perf trace for arm64, powerpc
> and s390?  It has this patchset + arm64 unistd header revert (according
> to the discussion on patch 6/10) on top of v6.11-rc2.

On arm64:

acme@roc-rk3399-pc:~/git/perf-tools$ git log --oneline -10
d5b854893d27 (HEAD -> perf-tools, perf-tools/tmp.perf-tools) tools/include: Sync arm64 headers with the kernel sources
f6d9883f8e68 tools/include: Sync x86 headers with the kernel sources
845295f4004c tools/include: Sync filesystem headers with the kernel sources
ed86525f1f4b tools/include: Sync network socket headers with the kernel sources
568901e709d7 tools/include: Sync uapi/asm-generic/unistd.h with the kernel sources
b97350067626 tools/include: Sync uapi/sound/asound.h with the kernel sources
8ec9497d3ef3 tools/include: Sync uapi/linux/perf.h with the kernel sources
a625df3995c3 tools/include: Sync uapi/linux/kvm.h with the kernel sources
aef21f6b6a4a tools/include: Sync uapi/drm/i915_drm.h with the kernel sources
fbc05142ccdd perf tools: Add tools/include/uapi/README
acme@roc-rk3399-pc:~/git/perf-tools$
acme@roc-rk3399-pc:~/git/perf-tools$ sudo su -
[sudo] password for acme: 
root@roc-rk3399-pc:~# perf -vv
perf version 6.11.rc2.gd5b854893d27
                 dwarf: [ on  ]  # HAVE_DWARF_SUPPORT
    dwarf_getlocations: [ on  ]  # HAVE_DWARF_GETLOCATIONS_SUPPORT
         syscall_table: [ on  ]  # HAVE_SYSCALL_TABLE_SUPPORT
                libbfd: [ OFF ]  # HAVE_LIBBFD_SUPPORT
            debuginfod: [ OFF ]  # HAVE_DEBUGINFOD_SUPPORT
                libelf: [ on  ]  # HAVE_LIBELF_SUPPORT
               libnuma: [ on  ]  # HAVE_LIBNUMA_SUPPORT
numa_num_possible_cpus: [ on  ]  # HAVE_LIBNUMA_SUPPORT
               libperl: [ on  ]  # HAVE_LIBPERL_SUPPORT
             libpython: [ on  ]  # HAVE_LIBPYTHON_SUPPORT
              libslang: [ on  ]  # HAVE_SLANG_SUPPORT
             libcrypto: [ on  ]  # HAVE_LIBCRYPTO_SUPPORT
             libunwind: [ on  ]  # HAVE_LIBUNWIND_SUPPORT
    libdw-dwarf-unwind: [ on  ]  # HAVE_DWARF_SUPPORT
           libcapstone: [ OFF ]  # HAVE_LIBCAPSTONE_SUPPORT
                  zlib: [ on  ]  # HAVE_ZLIB_SUPPORT
                  lzma: [ on  ]  # HAVE_LZMA_SUPPORT
             get_cpuid: [ on  ]  # HAVE_AUXTRACE_SUPPORT
                   bpf: [ on  ]  # HAVE_LIBBPF_SUPPORT
                   aio: [ on  ]  # HAVE_AIO_SUPPORT
                  zstd: [ on  ]  # HAVE_ZSTD_SUPPORT
               libpfm4: [ on  ]  # HAVE_LIBPFM
         libtraceevent: [ on  ]  # HAVE_LIBTRACEEVENT
         bpf_skeletons: [ on  ]  # HAVE_BPF_SKEL
  dwarf-unwind-support: [ on  ]  # HAVE_DWARF_UNWIND_SUPPORT
            libopencsd: [ on  ]  # HAVE_CSTRACE_SUPPORT
root@roc-rk3399-pc:~# perf trace -e *sleep sleep 1.2345678
     0.000 (1235.340 ms): sleep/8628 clock_nanosleep(rqtp: { .tv_sec: 1, .tv_nsec: 234567800 }, rmtp: 0xfffff4ae40d8) = 0
root@roc-rk3399-pc:~# strace -e bpf perf trace -e *sleep sleep 1.2345678 |& head
bpf(0x24 /* BPF_??? */, 0xffffc86fb670, 8) = -1 EINVAL (Invalid argument)
bpf(BPF_PROG_LOAD, {prog_type=BPF_PROG_TYPE_SOCKET_FILTER, insn_cnt=2, insns=0xffffc86fb420, license="GPL", log_level=0, log_size=0, log_buf=NULL, kern_version=KERNEL_VERSION(0, 0, 0), prog_flags=0, prog_name="", prog_ifindex=0, expected_attach_type=BPF_CGROUP_INET_INGRESS, prog_btf_fd=0, func_info_rec_size=0, func_info=NULL, func_info_cnt=0, line_info_rec_size=0, line_info=NULL, line_info_cnt=0, attach_btf_id=0, attach_prog_fd=0, fd_array=NULL}, 148) = 8
bpf(BPF_PROG_LOAD, {prog_type=BPF_PROG_TYPE_SOCKET_FILTER, insn_cnt=2, insns=0xffffc86fb6b8, license="GPL", log_level=0, log_size=0, log_buf=NULL, kern_version=KERNEL_VERSION(0, 0, 0), prog_flags=0, prog_name="", prog_ifindex=0, expected_attach_type=BPF_CGROUP_INET_INGRESS, prog_btf_fd=0, func_info_rec_size=0, func_info=NULL, func_info_cnt=0, line_info_rec_size=0, line_info=NULL, line_info_cnt=0, attach_btf_id=0, attach_prog_fd=0, fd_array=NULL}, 148) = 8
bpf(BPF_BTF_LOAD, {btf="\237\353\1\0\30\0\0\0\0\0\0\0000\0\0\0000\0\0\0\t\0\0\0\1\0\0\0\0\0\0\1"..., btf_log_buf=NULL, btf_size=81, btf_log_size=0, btf_log_level=0}, 40) = 8
bpf(BPF_BTF_LOAD, {btf="\237\353\1\0\30\0\0\0\0\0\0\0000\0\0\0000\0\0\0\5\0\0\0\0\0\0\0\0\0\0\1"..., btf_log_buf=NULL, btf_size=77, btf_log_size=0, btf_log_level=0}, 40) = 8
bpf(BPF_BTF_LOAD, {btf="\237\353\1\0\30\0\0\0\0\0\0\0l\0\0\0l\0\0\0\16\0\0\0\1\0\0\0\0\0\0\1"..., btf_log_buf=NULL, btf_size=146, btf_log_size=0, btf_log_level=0}, 40) = 8
bpf(BPF_PROG_LOAD, {prog_type=BPF_PROG_TYPE_SOCKET_FILTER, insn_cnt=2, insns=0xffffc86fb150, license="GPL", log_level=0, log_size=0, log_buf=NULL, kern_version=KERNEL_VERSION(0, 0, 0), prog_flags=0, prog_name="libbpf_nametest", prog_ifindex=0, expected_attach_type=BPF_CGROUP_INET_INGRESS, prog_btf_fd=0, func_info_rec_size=0, func_info=NULL, func_info_cnt=0, line_info_rec_size=0, line_info=NULL, line_info_cnt=0, attach_btf_id=0, attach_prog_fd=0, fd_array=NULL}, 148) = 9
bpf(BPF_PROG_LOAD, {prog_type=BPF_PROG_TYPE_KPROBE, insn_cnt=4, insns=0xffffc86fb4f8, license="GPL", log_level=0, log_size=0, log_buf=NULL, kern_version=KERNEL_VERSION(0, 0, 0), prog_flags=0, prog_name="det_arg_ctx", prog_ifindex=0, expected_attach_type=BPF_CGROUP_INET_INGRESS, prog_btf_fd=8, func_info_rec_size=8, func_info=0xffffc86fb4e8, func_info_cnt=2, line_info_rec_size=0, line_info=NULL, line_info_cnt=0, attach_btf_id=0, attach_prog_fd=0, fd_array=NULL}, 148) = -1 EINVAL (Invalid argument)
bpf(BPF_BTF_LOAD, {btf="\237\353\1\0\30\0\0\0\0\0\0\0\20\0\0\0\20\0\0\0\5\0\0\0\1\0\0\0\0\0\0\1"..., btf_log_buf=NULL, btf_size=45, btf_log_size=0, btf_log_level=0}, 40) = 8
bpf(BPF_BTF_LOAD, {btf="\237\353\1\0\30\0\0\0\0\0\0\0000\0\0\0000\0\0\0\t\0\0\0\1\0\0\0\0\0\0\1"..., btf_log_buf=NULL, btf_size=81, btf_log_size=0, btf_log_level=0}, 40) = 8
root@roc-rk3399-pc:~# perf trace -e open* sleep 1
     0.000 ( 0.078 ms): sleep/8635 openat(dfd: CWD, filename: "/etc/ld.so.cache", flags: RDONLY|CLOEXEC) = 3
     0.162 ( 0.031 ms): sleep/8635 openat(dfd: CWD, filename: "/lib/aarch64-linux-gnu/libc.so.6", flags: RDONLY|CLOEXEC) = 3
     1.279 ( 0.043 ms): sleep/8635 openat(dfd: CWD, filename: "", flags: RDONLY|CLOEXEC)                 = -1 ENOENT (No such file or directory)
     1.371 ( 0.031 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/share/locale/locale.alias", flags: RDONLY|CLOEXEC) = 3
     1.542 ( 0.020 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.UTF-8/LC_IDENTIFICATION", flags: RDONLY|CLOEXEC) = -1 ENOENT (No such file or directory)
     1.573 ( 0.024 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.utf8/LC_IDENTIFICATION", flags: RDONLY|CLOEXEC) = 3
     1.664 ( 0.025 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/aarch64-linux-gnu/gconv/gconv-modules.cache") = 3
     1.782 ( 0.020 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.UTF-8/LC_MEASUREMENT", flags: RDONLY|CLOEXEC) = -1 ENOENT (No such file or directory)
     1.821 ( 0.021 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.utf8/LC_MEASUREMENT", flags: RDONLY|CLOEXEC) = 3
     1.909 ( 0.018 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.UTF-8/LC_TELEPHONE", flags: RDONLY|CLOEXEC) = -1 ENOENT (No such file or directory)
     1.938 ( 0.019 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.utf8/LC_TELEPHONE", flags: RDONLY|CLOEXEC) = 3
     2.023 ( 0.024 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.UTF-8/LC_ADDRESS", flags: RDONLY|CLOEXEC) = -1 ENOENT (No such file or directory)
     2.059 ( 0.020 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.utf8/LC_ADDRESS", flags: RDONLY|CLOEXEC) = 3
     2.151 ( 0.019 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.UTF-8/LC_NAME", flags: RDONLY|CLOEXEC) = -1 ENOENT (No such file or directory)
     2.180 ( 0.020 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.utf8/LC_NAME", flags: RDONLY|CLOEXEC) = 3
     2.279 ( 0.017 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.UTF-8/LC_PAPER", flags: RDONLY|CLOEXEC) = -1 ENOENT (No such file or directory)
     2.311 ( 0.023 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.utf8/LC_PAPER", flags: RDONLY|CLOEXEC) = 3
     2.420 ( 0.027 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.UTF-8/LC_MESSAGES", flags: RDONLY|CLOEXEC) = -1 ENOENT (No such file or directory)
     2.460 ( 0.025 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.utf8/LC_MESSAGES", flags: RDONLY|CLOEXEC) = 3
     2.514 ( 0.021 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.utf8/LC_MESSAGES/SYS_LC_MESSAGES", flags: RDONLY|CLOEXEC) = 3
     2.609 ( 0.025 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.UTF-8/LC_MONETARY", flags: RDONLY|CLOEXEC) = -1 ENOENT (No such file or directory)
     2.646 ( 0.022 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.utf8/LC_MONETARY", flags: RDONLY|CLOEXEC) = 3
     2.741 ( 0.024 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.UTF-8/LC_COLLATE", flags: RDONLY|CLOEXEC) = -1 ENOENT (No such file or directory)
     2.778 ( 0.020 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.utf8/LC_COLLATE", flags: RDONLY|CLOEXEC) = 3
     2.881 ( 0.024 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.UTF-8/LC_TIME", flags: RDONLY|CLOEXEC) = -1 ENOENT (No such file or directory)
     2.917 ( 0.020 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.utf8/LC_TIME", flags: RDONLY|CLOEXEC) = 3
     3.013 ( 0.025 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.UTF-8/LC_NUMERIC", flags: RDONLY|CLOEXEC) = -1 ENOENT (No such file or directory)
     3.050 ( 0.021 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.utf8/LC_NUMERIC", flags: RDONLY|CLOEXEC) = 3
     3.138 ( 0.024 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.UTF-8/LC_CTYPE", flags: RDONLY|CLOEXEC) = -1 ENOENT (No such file or directory)
     3.174 ( 0.021 ms): sleep/8635 openat(dfd: CWD, filename: "/usr/lib/locale/C.utf8/LC_CTYPE", flags: RDONLY|CLOEXEC) = 3
root@roc-rk3399-pc:~#

The only problem that is outstanding is that one I need to send a patch
for, 32-bit build is broken due to some trivial stuff:

  18    79.36 debian:experimental           : Ok   gcc (Debian 14.1.0-5) 14.1.0 , Debian clang version 16.0.6 (27+b1) flex 2.6.4
  19     3.96 debian:experimental-x-arm64   : FAIL gcc version 14.1.0 (Debian 14.1.0-5) 
                     from libbpf.c:36:
    /git/perf-6.11.0-rc2/tools/include/uapi/asm/bpf_perf_event.h:2:10: fatal error: ../../arch/arm64/include/uapi/asm/bpf_perf_event.h: No such file or directory
        2 | #include "../../arch/arm64/include/uapi/asm/bpf_perf_event.h"
          |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    compilation terminated.
      CC      /tmp/build/perf/libbpf/staticobjs/btf_iter.o
      CC      /tmp/build/perf/libbpf/staticobjs/btf_relocate.o
      LD      /tmp/build/perf/libapi/fs/libapi-in.o
      LD      /tmp/build/perf/libapi/libapi-in.o
    In file included from /git/perf-6.11.0-rc2/tools/include/uapi/linux/bpf_perf_event.h:11,
                     from libbpf.c:36:
    /git/perf-6.11.0-rc2/tools/include/uapi/asm/bpf_perf_event.h:2:10: fatal error: ../../arch/arm64/include/uapi/asm/bpf_perf_event.h: No such file or directory
        2 | #include "../../arch/arm64/include/uapi/asm/bpf_perf_event.h"
          |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    compilation terminated.
      LD      /tmp/build/perf/libperf/libperf-in.o
    make[4]: *** [/git/perf-6.11.0-rc2/tools/build/Makefile.build:105: /tmp/build/perf/libbpf/staticobjs/libbpf.o] Error 1
    make[4]: *** Waiting for unfinished jobs....
      AR      /tmp/build/perf/libperf/libperf.a
      AR      /tmp/build/perf/libapi/libapi.a

Also works on x86_64:

root@number:~# perf -v
perf version 6.11.rc2.gd5b854893d27
root@number:~# 
root@number:~# 
root@number:~# perf trace -e *sleep sleep 1.92837465
     0.000 (1928.436 ms): sleep/158555 clock_nanosleep(rqtp: { .tv_sec: 1, .tv_nsec: 928374651 }, rmtp: 0x7ffd188426d0) = 0
root@number:~# perf trace -e *mmsg --max-events 5
     0.000 ( 0.017 ms): NetworkManager/1322 recvmmsg(fd: 22, mmsg: 0x7ffe36cb6380, vlen: 8)                       = 1
     0.048 ( 0.010 ms): NetworkManager/1322 recvmmsg(fd: 26, mmsg: 0x7ffe36cb6380, vlen: 8)                       = 1
  1012.269 ( 0.018 ms): NetworkManager/1322 recvmmsg(fd: 22, mmsg: 0x7ffe36cb6380, vlen: 8)                       = 1
  1012.321 ( 0.005 ms): NetworkManager/1322 recvmmsg(fd: 26, mmsg: 0x7ffe36cb6380, vlen: 8)                       = 1
  2393.486 ( 0.029 ms): dbus-broker/2438 sendmmsg(fd: 31, mmsg: 0x7ffca4625ba0, vlen: 1, flags: DONTWAIT|NOSIGNAL) = 1
root@number:~# perf trace -e *nnect* --max-events 5
     0.000 ( 0.047 ms): pool/3064 connect(fd: 7, uservaddr: { .family: LOCAL, path: /var/run/.heim_org.h5l.kcm-socket }, addrlen: 110) = 0
  2694.480 ( 0.021 ms): DNS Res~ver #4/2450896 connect(fd: 242, uservaddr: { .family: LOCAL, path: /run/systemd/resolve/io.systemd.Resolve }, addrlen: 42) = 0
  2694.906 ( 0.015 ms): systemd-resolv/1185 connect(fd: 25, uservaddr: { .family: INET6, port: 53, addr: fe80::1ae8:29ff:fe4c:90b0, scope_id: 3 }, addrlen: 28) = 0
  2694.969 ( 0.005 ms): systemd-resolv/1185 connect(fd: 26, uservaddr: { .family: INET6, port: 53, addr: fe80::1ae8:29ff:fe4c:90b0, scope_id: 6 }, addrlen: 28) = 0
  2696.329 ( 0.014 ms): DNS Res~ver #4/2450896 connect(fd: 242, uservaddr: { .family: INET6, port: 0, addr: 2800:3f0:4004:803::200e }, addrlen: 28) = 0
root@number:~# uname -a
Linux number 6.9.10-200.fc40.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Jul 18 21:39:30 UTC 2024 x86_64 GNU/Linux
root@number:~#

All the other container builds didn't regress.

Thanks,

- Arnaldo


