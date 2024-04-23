Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8D78ADF72
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 10:08:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=XZeV3YWG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNvqy2Fzmz3vkX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 18:07:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=XZeV3YWG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNvkV4qClz3cTt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 18:03:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1713858962;
	bh=O54mll2lZcxHuSuV6IhzlmRJxXGkXc6uykp5lefHyQg=;
	h=From:Subject:Date:To:Cc:From;
	b=XZeV3YWGKdzXDyt2gGdiSBu+tAR9ehmxCo0/cgGTgNF4l9KeVxXCrFY2tRLq1+ykl
	 c6TDhFBKGpJkh/D8HY03220W94T6e0r+dDxGxBkrr0k1umozRGS6gkzuySz0B7Xa/g
	 8yXILGrDVWsr+D5Q4C7df89uD11g1JxsYDcXWzP0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 00/11] sysctl: treewide: constify ctl_table argument of
 sysctl handlers
Date: Tue, 23 Apr 2024 09:54:35 +0200
Message-Id: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADtpJ2YC/3XOwQ7CIAwG4FdZOIuB4oR48j2Mh411QrIwQxFdl
 r27bCcT9fg3/b92ZoTRI7FTNbOI2ZMfQwlqVzHrmnBD7ruSGQhQEuDIaSKbBm7HQImXjW7AyI1
 RbY1to9EIVqr3iL1/bezlWrLzlMY4bVeyXKcreBBK1r/BLLngUgE0VttWqO78RE9E1j3cPmBiq
 5rhQwL1R4IilbdaqU0vNegvaVmWN33FrUoHAQAA
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Joel Granados <j.granados@samsung.com>, Kees Cook <keescook@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713858961; l=7199;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=O54mll2lZcxHuSuV6IhzlmRJxXGkXc6uykp5lefHyQg=;
 b=SEVrV4QL0aRQf4sZAyD6Lh+KIYjBicAEwKhtJ0PUAXQvKQVj+Lo8XxYFfez7YZFSvNW40HQoh
 r7IOwglEOGsCcMSO1z8xH6fte/UGc8Ay9QjWTKXdmQpGpMwPGKciBsV
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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
Cc: Dave Chinner <david@fromorbit.com>, =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, linux-sctp@vger.kernel.org, lvs-devel@vger.kernel.org, coreteam@netfilter.org, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, apparmor@lists.ubuntu.com, linux-xfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Patch 1 is a bugfix for the stack_erasing sysctl handler
* Patches 2-10 change various helper functions throughout the kernel to
  be able to handle 'const ctl_table'.
* Patch 11 changes the signatures of all proc handlers through the tree.
  Some other signatures are also adapted, for details see the commit
  message.

Only patch 1 changes any code at all.

The series was compile-tested on top of next-20230423 for
i386, x86_64, arm, arm64, riscv, loongarch, s390 and m68k.

The series was split from my larger series sysctl-const series [0].
It only focusses on the proc_handlers but is an important step to be
able to move all static definitions of ctl_table into .rodata.

[0] https://lore.kernel.org/lkml/20231204-const-sysctl-v2-0-7a5060b11447@weissschuh.net/

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v3:
- Rebase on current -next
- Cc affected mailing lists again to gather feedback
- Link to v2: https://lore.kernel.org/r/20240323-sysctl-const-handler-v2-0-e80b178f1727@weissschuh.net

Changes in v2:
- Reduce recipient list
- Fix source formatting
- Rebase onto next-20240322
- Link to v1: https://lore.kernel.org/r/20240315-sysctl-const-handler-v1-0-1322ac7cb03d@weissschuh.net

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

 arch/arm64/kernel/armv8_deprecated.c      |  2 +-
 arch/arm64/kernel/fpsimd.c                |  2 +-
 arch/s390/appldata/appldata_base.c        | 10 ++--
 arch/s390/kernel/debug.c                  |  2 +-
 arch/s390/kernel/topology.c               |  2 +-
 arch/s390/mm/cmm.c                        |  6 +--
 arch/x86/kernel/itmt.c                    |  2 +-
 drivers/cdrom/cdrom.c                     |  4 +-
 drivers/char/random.c                     |  6 +--
 drivers/macintosh/mac_hid.c               |  2 +-
 drivers/net/vrf.c                         |  2 +-
 drivers/parport/procfs.c                  | 12 ++---
 drivers/perf/arm_pmuv3.c                  |  4 +-
 drivers/perf/riscv_pmu_sbi.c              |  2 +-
 fs/coredump.c                             |  2 +-
 fs/dcache.c                               |  4 +-
 fs/drop_caches.c                          |  2 +-
 fs/exec.c                                 |  4 +-
 fs/file_table.c                           |  4 +-
 fs/fs-writeback.c                         |  2 +-
 fs/inode.c                                |  4 +-
 fs/pipe.c                                 |  2 +-
 fs/quota/dquot.c                          |  2 +-
 fs/xfs/xfs_sysctl.c                       |  6 +--
 include/linux/filter.h                    |  2 +-
 include/linux/ftrace.h                    |  4 +-
 include/linux/mm.h                        |  8 +--
 include/linux/perf_event.h                |  6 +--
 include/linux/security.h                  |  2 +-
 include/linux/sysctl.h                    | 36 ++++++-------
 include/linux/vmstat.h                    |  6 +--
 include/linux/writeback.h                 |  2 +-
 include/net/ndisc.h                       |  2 +-
 include/net/neighbour.h                   |  6 +--
 include/net/netfilter/nf_hooks_lwtunnel.h |  2 +-
 ipc/ipc_sysctl.c                          |  8 +--
 kernel/bpf/syscall.c                      |  4 +-
 kernel/delayacct.c                        |  4 +-
 kernel/events/callchain.c                 |  2 +-
 kernel/events/core.c                      |  4 +-
 kernel/fork.c                             |  2 +-
 kernel/hung_task.c                        |  6 +--
 kernel/kexec_core.c                       |  2 +-
 kernel/kprobes.c                          |  2 +-
 kernel/latencytop.c                       |  4 +-
 kernel/pid_namespace.c                    |  2 +-
 kernel/pid_sysctl.h                       |  2 +-
 kernel/printk/internal.h                  |  2 +-
 kernel/printk/printk.c                    |  2 +-
 kernel/printk/sysctl.c                    |  5 +-
 kernel/sched/core.c                       |  8 +--
 kernel/sched/rt.c                         | 16 +++---
 kernel/sched/topology.c                   |  2 +-
 kernel/seccomp.c                          | 10 ++--
 kernel/stackleak.c                        |  9 ++--
 kernel/sysctl.c                           | 89 ++++++++++++++++---------------
 kernel/time/timer.c                       |  2 +-
 kernel/trace/ftrace.c                     |  2 +-
 kernel/trace/trace.c                      |  2 +-
 kernel/trace/trace_events_user.c          |  2 +-
 kernel/trace/trace_stack.c                |  2 +-
 kernel/umh.c                              |  2 +-
 kernel/utsname_sysctl.c                   |  4 +-
 kernel/watchdog.c                         | 12 ++---
 mm/compaction.c                           |  6 +--
 mm/hugetlb.c                              | 12 ++---
 mm/page-writeback.c                       | 18 +++----
 mm/page_alloc.c                           | 14 ++---
 mm/util.c                                 | 12 ++---
 mm/vmstat.c                               |  4 +-
 net/bridge/br_netfilter_hooks.c           |  2 +-
 net/core/neighbour.c                      | 20 +++----
 net/core/sysctl_net_core.c                | 20 +++----
 net/ipv4/devinet.c                        |  6 +--
 net/ipv4/route.c                          |  2 +-
 net/ipv4/sysctl_net_ipv4.c                | 38 ++++++-------
 net/ipv6/addrconf.c                       | 27 +++++-----
 net/ipv6/ndisc.c                          |  4 +-
 net/ipv6/route.c                          |  2 +-
 net/ipv6/sysctl_net_ipv6.c                |  4 +-
 net/mpls/af_mpls.c                        |  4 +-
 net/netfilter/ipvs/ip_vs_ctl.c            | 19 +++----
 net/netfilter/nf_conntrack_standalone.c   |  2 +-
 net/netfilter/nf_hooks_lwtunnel.c         |  2 +-
 net/netfilter/nf_log.c                    |  2 +-
 net/phonet/sysctl.c                       |  2 +-
 net/rds/tcp.c                             |  4 +-
 net/sctp/sysctl.c                         | 32 +++++------
 net/sunrpc/sysctl.c                       |  6 +--
 net/sunrpc/xprtrdma/svc_rdma.c            |  2 +-
 security/apparmor/lsm.c                   |  2 +-
 security/min_addr.c                       |  2 +-
 security/yama/yama_lsm.c                  |  2 +-
 93 files changed, 329 insertions(+), 322 deletions(-)
---
base-commit: a59668a9397e7245b26e9be85d23f242ff757ae8
change-id: 20231226-sysctl-const-handler-883b5eba7e80

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

