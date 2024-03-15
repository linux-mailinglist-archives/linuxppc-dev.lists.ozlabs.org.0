Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A947687D6A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 23:30:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=qNDlogzy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TxJpl3n0pz3vdm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 09:30:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=qNDlogzy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TxGgz2M89z3dnN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Mar 2024 07:54:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1710535696;
	bh=UQpx8/b/XTKLmVj1eXwhJn/1lYtutU5drdFjuhtFc8Q=;
	h=From:Subject:Date:To:Cc:From;
	b=qNDlogzyuL5NF8OjRV46+rDUbxyIMtOYZlFLSwLbviicTyfpUQvpFjMhavWRGxMPb
	 +KLyaJldvQaCaK8bZDu2BzGm/LykYpsCaxYcWdiFuplr9priximfT/xu1KNJzE8mNQ
	 QUnnlq6A+2zF05g+yrdBYpLqYgXYSWY/mpzB+Yw8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 00/11] sysctl: treewide: constify ctl_table argument of
 sysctl handlers
Date: Fri, 15 Mar 2024 21:47:58 +0100
Message-Id: <20240315-sysctl-const-handler-v1-0-1322ac7cb03d@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAP+z9GUC/x2MQQqAIBAAvxJ7bqGUSvpKdFDbakEs3Igi+nvSc
 WBmHhBKTAJ98UCik4W3mKEuC/CrjQshT5lBVUrXSrUot/gjoN+iHJiNKVBCY7RryNmOTAU53RP
 NfP3bYXzfDzWhXLJmAAAA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kees Cook <keescook@chromium.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Ahern <dsahern@kernel.org>, Simon Horman <horms@verge.net.au>, 
 Julian Anastasov <ja@ssi.bg>, Pablo Neira Ayuso <pablo@netfilter.org>, 
 Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, 
 Luis Chamberlain <mcgrof@kernel.org>, 
 Joel Granados <j.granados@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Phillip Potter <phil@philpotter.co.uk>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
 Mark Rutland <mark.rutland@arm.com>, Atish Patra <atishp@atishpatra.org>, 
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Eric Biederman <ebiederm@xmission.com>, 
 Chandan Babu R <chandan.babu@oracle.com>, 
 "Darrick J. Wong" <djwong@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Balbir Singh <bsingharora@gmail.com>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, 
 Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
 Daniel Bristot de Oliveira <bristot@redhat.com>, 
 Valentin Schneider <vschneid@redhat.com>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Roopa Prabhu <roopa@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
 Remi Denis-Courmont <courmisch@gmail.com>, 
 Allison Henderson <allison.henderson@oracle.com>, 
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
 Xin Long <lucien.xin@gmail.com>, Chuck Lever <chuck.lever@oracle.com>, 
 Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>, 
 Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 John Johansen <john.johansen@canonical.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Alexander Popov <alex.popov@linux.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710535695; l=6875;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=UQpx8/b/XTKLmVj1eXwhJn/1lYtutU5drdFjuhtFc8Q=;
 b=bVuYFtDUnQnTEuvf1YPhVHCMGvQdlkNbjMU3q96YFVTF+/BakIUECyvigrykuveXZ44uroO53
 +PypwG0ixxgAcYPFaz0HjaUa6FY1M4K7insg4HvI7YV0Uo2rCOzuB/j
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Mailman-Approved-At: Sat, 16 Mar 2024 09:23:34 +1100
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
Cc: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, linux-mm@kvack.org, linux-sctp@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, lvs-devel@vger.kernel.org, coreteam@netfilter.org, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, apparmor@lists.ubuntu.com, linux-xfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Patch 1 is a bugfix for the stack_erasing sysctl handler
* Patches 2-10 change various helper functions throughout the kernel to
  be able to handle 'const ctl_table'.
* Patch 11 changes the signatures of all proc handlers through the tree.
  Some other signatures are also adapted, for details see the commit
  message.

Only patch 1 changes any code at all.

The series was compile-tested on top of next-20230315 for
i386, x86_64, arm, arm64, riscv, loongarch and s390.

This series was split from my larger series sysctl-const series [0].
It only focusses on the proc_handlers but is an important step to be
able to move all static definitions of ctl_table into .rodata.

[0] https://lore.kernel.org/lkml/20231204-const-sysctl-v2-0-7a5060b11447@weissschuh.net/

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (11):
      stackleak: don't modify ctl_table argument
      cgroup: bpf: constify ctl_table arguments and fields
      hugetlb: constify ctl_table arguments of utility functions
      utsname: constify ctl_table arguments of utility function
      neighbour: constify ctl_table arguments of utility function
      ipv4/sysctl: constify ctl_table arguments of utility functions
      ipv6/addrconf: constify ctl_table arguments of utility functions
      ipv6/ndisc: constify ctl_table arguments of utility function
      ipvs: constify ctl_table arguments of utility functions
      sysctl: constify ctl_table arguments of utility function
      sysctl: treewide: constify the ctl_table argument of handlers

 arch/arm64/kernel/armv8_deprecated.c      |   2 +-
 arch/arm64/kernel/fpsimd.c                |   2 +-
 arch/s390/appldata/appldata_base.c        |  10 +--
 arch/s390/kernel/debug.c                  |   2 +-
 arch/s390/kernel/topology.c               |   2 +-
 arch/s390/mm/cmm.c                        |   6 +-
 arch/x86/kernel/itmt.c                    |   2 +-
 drivers/cdrom/cdrom.c                     |   6 +-
 drivers/char/random.c                     |   5 +-
 drivers/macintosh/mac_hid.c               |   2 +-
 drivers/net/vrf.c                         |   2 +-
 drivers/parport/procfs.c                  |  14 ++--
 drivers/perf/arm_pmuv3.c                  |   6 +-
 drivers/perf/riscv_pmu_sbi.c              |   2 +-
 fs/coredump.c                             |   4 +-
 fs/dcache.c                               |   3 +-
 fs/drop_caches.c                          |   4 +-
 fs/exec.c                                 |   6 +-
 fs/file_table.c                           |   3 +-
 fs/fs-writeback.c                         |   2 +-
 fs/inode.c                                |   3 +-
 fs/pipe.c                                 |   2 +-
 fs/quota/dquot.c                          |   4 +-
 fs/xfs/xfs_sysctl.c                       |  33 ++++-----
 include/linux/filter.h                    |   2 +-
 include/linux/ftrace.h                    |   4 +-
 include/linux/mm.h                        |   8 +--
 include/linux/perf_event.h                |   6 +-
 include/linux/security.h                  |   2 +-
 include/linux/sysctl.h                    |  36 +++++-----
 include/linux/vmstat.h                    |   6 +-
 include/linux/writeback.h                 |   2 +-
 include/net/ndisc.h                       |   2 +-
 include/net/neighbour.h                   |   6 +-
 include/net/netfilter/nf_hooks_lwtunnel.h |   2 +-
 ipc/ipc_sysctl.c                          |  14 ++--
 kernel/bpf/syscall.c                      |   4 +-
 kernel/delayacct.c                        |   5 +-
 kernel/events/callchain.c                 |   2 +-
 kernel/events/core.c                      |   9 ++-
 kernel/fork.c                             |   2 +-
 kernel/hung_task.c                        |   7 +-
 kernel/kexec_core.c                       |   2 +-
 kernel/kprobes.c                          |   2 +-
 kernel/latencytop.c                       |   5 +-
 kernel/pid_namespace.c                    |   4 +-
 kernel/pid_sysctl.h                       |   2 +-
 kernel/printk/internal.h                  |   2 +-
 kernel/printk/printk.c                    |   2 +-
 kernel/printk/sysctl.c                    |   6 +-
 kernel/sched/core.c                       |  15 ++--
 kernel/sched/rt.c                         |  20 +++---
 kernel/sched/topology.c                   |   6 +-
 kernel/seccomp.c                          |   7 +-
 kernel/stackleak.c                        |  12 ++--
 kernel/sysctl.c                           | 109 ++++++++++++++++--------------
 kernel/time/timer.c                       |   4 +-
 kernel/trace/ftrace.c                     |   2 +-
 kernel/trace/trace.c                      |   2 +-
 kernel/trace/trace_events_user.c          |   3 +-
 kernel/trace/trace_stack.c                |   2 +-
 kernel/umh.c                              |   4 +-
 kernel/utsname_sysctl.c                   |   6 +-
 kernel/watchdog.c                         |  15 ++--
 mm/compaction.c                           |  17 +++--
 mm/hugetlb.c                              |  20 +++---
 mm/page-writeback.c                       |  27 +++++---
 mm/page_alloc.c                           |  43 ++++++++----
 mm/util.c                                 |  15 ++--
 mm/vmstat.c                               |   6 +-
 net/bridge/br_netfilter_hooks.c           |   2 +-
 net/core/neighbour.c                      |  26 ++++---
 net/core/sysctl_net_core.c                |  24 ++++---
 net/ipv4/devinet.c                        |   6 +-
 net/ipv4/route.c                          |   4 +-
 net/ipv4/sysctl_net_ipv4.c                |  40 ++++++-----
 net/ipv6/addrconf.c                       |  38 ++++++-----
 net/ipv6/ndisc.c                          |   7 +-
 net/ipv6/route.c                          |   4 +-
 net/ipv6/sysctl_net_ipv6.c                |   6 +-
 net/mpls/af_mpls.c                        |   4 +-
 net/netfilter/ipvs/ip_vs_ctl.c            |  19 +++---
 net/netfilter/nf_conntrack_standalone.c   |   2 +-
 net/netfilter/nf_hooks_lwtunnel.c         |   2 +-
 net/netfilter/nf_log.c                    |   4 +-
 net/phonet/sysctl.c                       |   2 +-
 net/rds/tcp.c                             |   4 +-
 net/sctp/sysctl.c                         |  30 ++++----
 net/sunrpc/sysctl.c                       |   5 +-
 net/sunrpc/xprtrdma/svc_rdma.c            |   2 +-
 security/apparmor/lsm.c                   |   2 +-
 security/min_addr.c                       |   2 +-
 security/yama/yama_lsm.c                  |   2 +-
 93 files changed, 467 insertions(+), 376 deletions(-)
---
base-commit: a1e7655b77e3391b58ac28256789ea45b1685abb
change-id: 20231226-sysctl-const-handler-883b5eba7e80

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

