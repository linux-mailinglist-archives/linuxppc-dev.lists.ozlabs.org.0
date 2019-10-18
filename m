Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AED3DBBB4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 06:05:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vXW76mW0zDr94
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 15:05:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vWSj4qthzDr45
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 14:18:11 +1100 (AEDT)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 102F3C7E15F427A45DB1;
 Fri, 18 Oct 2019 11:18:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Fri, 18 Oct 2019 11:17:56 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Petr Mladek <pmladek@suse.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 00/33] Kill pr_warning in the whole linux code
Date: Fri, 18 Oct 2019 11:17:10 +0800
Message-ID: <20191018031710.41052-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 18 Oct 2019 15:03:54 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 Rich Felker <dalias@libc.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, David Howells <dhowells@redhat.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Frank Rowand <frowand.list@gmail.com>, Christoph
 Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com,
 Song Liu <songliubraving@fb.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Herbert Xu <herbert@gondor.apana.org.au>, Daniel
 Borkmann <daniel@iogearbox.net>, Jiri Olsa <jolsa@redhat.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-afs@lists.infradead.org,
 Peter Zijlstra <peterz@infradead.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Darren Hart <dvhart@infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Len Brown <lenb@kernel.org>,
 Fenghua Yu <fenghua.yu@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Robert Richter <rric@kernel.org>, Will Deacon <will@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Arnaldo Carvalho de Melo <acme@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Lars Ellenberg <lars.ellenberg@linbit.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andy
 Whitcroft <apw@canonical.com>, Takashi Iwai <tiwai@suse.com>,
 bpf@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Karsten Keil <isdn@linux-pingi.de>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Sangbeom Kim <sbkim73@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Philipp Reisner <philipp.reisner@linbit.com>, Martin KaFai Lau <kafai@fb.com>,
 Yonghong Song <yhs@fb.com>, Sergey
 Senozhatsky <sergey.senozhatsky@gmail.com>, James Morse <james.morse@arm.com>,
 Corentin Chary <corentin.chary@gmail.com>, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are pr_warning and pr_warng to show WARNING level message,
most of the code using pr_warn, number based on next-20191017,

pr_warn: 5206   pr_warning: 546 (tools: 399, others: 147)

Joe Perches posted a patch, commit f2c2cbcc35d4 ("powerpc: Use
pr_warn instead of pr_warning"), which is beginning to remove
pr_warning, so all logging messages use a consistent pr_warn
style once pr_warning removed, and checkpatch also sugguests
that better to use pr_warn instead of pr_warning.

Let's carry on with the work to standardize the logging macro,
kill pr_warning in the whole linux code.

Note, for tools api/bpf/perf part, rename pr_warning to pr_warn
to keep the consistence, with this patchset,

pr_warn: 5747   pr_warning: 0

Patch[01-28]: simply sed and ajust formats
patch[29]:    drop pr_warning definition in printk
patch[30-32]: tools api/bpf/perf, rename and make manually changes
patch[33]:    cleanup the checkpatch.pl

Miscellanea:
o Coalesce formats
o Realign arguments
o Remove unnecessary line continuations

The patchset is based on next-20191017 and will be taked via printk.git
by Petr Mladek, see
https://lore.kernel.org/lkml/20191017135229.a4mvcyap6l34m5bk@pathway.suse.cz/

v2:
- Collect ack-by/review-by
- Fix some indentation and alignment 
- Split patches in drivers/platform/x86/ suggested by Andy Shevchenko
- Drop staging changes which already merged

Kefeng Wang (33):
  alpha: Use pr_warn instead of pr_warning
  arm64: Use pr_warn instead of pr_warning
  ia64: Use pr_warn instead of pr_warning
  riscv: Use pr_warn instead of pr_warning
  sh: Use pr_warn instead of pr_warning
  sparc: Use pr_warn instead of pr_warning
  x86: Use pr_warn instead of pr_warning
  acpi: Use pr_warn instead of pr_warning
  drbd: Use pr_warn instead of pr_warning
  gdrom: Use pr_warn instead of pr_warning
  clocksource: samsung_pwm_timer: Use pr_warn instead of pr_warning
  crypto: n2: Use pr_warn instead of pr_warning
  ide: Use pr_warn instead of pr_warning
  idsn: Use pr_warn instead of pr_warning
  macintosh: Use pr_warn instead of pr_warning
  of: Use pr_warn instead of pr_warning
  oprofile: Use pr_warn instead of pr_warning
  platform/x86: eeepc-laptop: Use pr_warn instead of pr_warning
  platform/x86: asus-laptop: Use pr_warn instead of pr_warning
  platform/x86: intel_oaktrail: Use pr_warn instead of pr_warning
  scsi: Use pr_warn instead of pr_warning
  sh/intc: Use pr_warn instead of pr_warning
  fs: afs: Use pr_warn instead of pr_warning
  vgacon: Use pr_warn instead of pr_warning
  dma-debug: Use pr_warn instead of pr_warning
  trace: Use pr_warn instead of pr_warning
  lib: cpu_rmap: Use pr_warn instead of pr_warning
  ASoC: samsung: Use pr_warn instead of pr_warning
  printk: Drop pr_warning
  tools lib api: Renaming pr_warning to pr_warn
  tools lib bpf: Renaming pr_warning to pr_warn
  tools perf: Renaming pr_warning to pr_warn
  checkpatch: Drop pr_warning check

 arch/alpha/kernel/perf_event.c            |   4 +-
 arch/arm64/kernel/hw_breakpoint.c         |   8 +-
 arch/arm64/kernel/smp.c                   |  11 +-
 arch/ia64/kernel/setup.c                  |   2 +-
 arch/riscv/kernel/module.c                |   4 +-
 arch/sh/boards/mach-sdk7786/nmi.c         |   2 +-
 arch/sh/drivers/pci/fixups-sdk7786.c      |   2 +-
 arch/sh/kernel/io_trapped.c               |   2 +-
 arch/sh/kernel/setup.c                    |   2 +-
 arch/sh/mm/consistent.c                   |   5 +-
 arch/sparc/kernel/smp_64.c                |   6 +-
 arch/x86/kernel/amd_gart_64.c             |  12 +-
 arch/x86/kernel/apic/apic.c               |  41 +-
 arch/x86/kernel/setup_percpu.c            |   4 +-
 arch/x86/kernel/tboot.c                   |  15 +-
 arch/x86/kernel/tsc_sync.c                |   8 +-
 arch/x86/kernel/umip.c                    |   6 +-
 arch/x86/mm/kmmio.c                       |   7 +-
 arch/x86/mm/mmio-mod.c                    |   6 +-
 arch/x86/mm/numa_emulation.c              |   4 +-
 arch/x86/mm/testmmiotrace.c               |   6 +-
 arch/x86/oprofile/op_x86_model.h          |   6 +-
 arch/x86/platform/olpc/olpc-xo15-sci.c    |   2 +-
 arch/x86/platform/sfi/sfi.c               |   3 +-
 arch/x86/xen/setup.c                      |   2 +-
 drivers/acpi/apei/apei-base.c             |  36 +-
 drivers/acpi/apei/einj.c                  |   4 +-
 drivers/acpi/apei/erst-dbg.c              |   5 +-
 drivers/acpi/apei/ghes.c                  |  25 +-
 drivers/acpi/apei/hest.c                  |  14 +-
 drivers/acpi/battery.c                    |   2 +-
 drivers/acpi/resource.c                   |   4 +-
 drivers/block/drbd/drbd_nl.c              |  13 +-
 drivers/cdrom/gdrom.c                     |   4 +-
 drivers/clocksource/samsung_pwm_timer.c   |   2 +-
 drivers/crypto/n2_core.c                  |  12 +-
 drivers/ide/tx4938ide.c                   |   2 +-
 drivers/ide/tx4939ide.c                   |   6 +-
 drivers/isdn/hardware/mISDN/avmfritz.c    |  16 +-
 drivers/isdn/hardware/mISDN/hfcmulti.c    |   8 +-
 drivers/isdn/hardware/mISDN/hfcpci.c      |   3 +-
 drivers/isdn/hardware/mISDN/hfcsusb.c     |   4 +-
 drivers/isdn/hardware/mISDN/mISDNipac.c   |   4 +-
 drivers/isdn/hardware/mISDN/mISDNisar.c   |  10 +-
 drivers/isdn/hardware/mISDN/netjet.c      |   8 +-
 drivers/isdn/hardware/mISDN/w6692.c       |  12 +-
 drivers/isdn/mISDN/hwchannel.c            |   7 +-
 drivers/macintosh/windfarm_fcu_controls.c |   4 +-
 drivers/macintosh/windfarm_lm87_sensor.c  |   4 +-
 drivers/macintosh/windfarm_pm72.c         |  22 +-
 drivers/macintosh/windfarm_rm31.c         |   6 +-
 drivers/of/fdt.c                          |  20 +-
 drivers/oprofile/oprofile_perf.c          |   8 +-
 drivers/platform/x86/asus-laptop.c        |   2 +-
 drivers/platform/x86/eeepc-laptop.c       |   2 +-
 drivers/platform/x86/intel_oaktrail.c     |  10 +-
 drivers/scsi/a3000.c                      |   2 +-
 drivers/sh/intc/core.c                    |   4 +-
 drivers/video/console/vgacon.c            |   6 +-
 fs/afs/flock.c                            |   4 +-
 fs/afs/inode.c                            |  13 +-
 fs/afs/yfsclient.c                        |   4 +-
 include/linux/printk.h                    |   3 +-
 kernel/dma/debug.c                        |   2 +-
 kernel/trace/trace_benchmark.c            |   4 +-
 lib/cpu_rmap.c                            |   2 +-
 scripts/checkpatch.pl                     |   9 -
 sound/soc/samsung/s3c-i2s-v2.c            |   6 +-
 tools/lib/api/debug-internal.h            |   4 +-
 tools/lib/api/debug.c                     |   4 +-
 tools/lib/api/fs/fs.c                     |   4 +-
 tools/lib/bpf/btf.c                       |  56 +-
 tools/lib/bpf/btf_dump.c                  |  18 +-
 tools/lib/bpf/libbpf.c                    | 679 +++++++++++-----------
 tools/lib/bpf/libbpf_internal.h           |   8 +-
 tools/lib/bpf/xsk.c                       |   4 +-
 tools/perf/arch/x86/util/intel-pt.c       |   2 +-
 tools/perf/builtin-annotate.c             |   7 +-
 tools/perf/builtin-buildid-cache.c        |  28 +-
 tools/perf/builtin-diff.c                 |  12 +-
 tools/perf/builtin-help.c                 |  10 +-
 tools/perf/builtin-inject.c               |   8 +-
 tools/perf/builtin-probe.c                |  14 +-
 tools/perf/builtin-record.c               |  10 +-
 tools/perf/builtin-report.c               |   2 +-
 tools/perf/builtin-script.c               |  14 +-
 tools/perf/builtin-stat.c                 |  18 +-
 tools/perf/builtin-timechart.c            |  12 +-
 tools/perf/builtin-top.c                  |   2 +-
 tools/perf/builtin-trace.c                |   8 +-
 tools/perf/lib/internal.h                 |   2 +-
 tools/perf/ui/browsers/scripts.c          |   2 +-
 tools/perf/util/bpf-loader.c              |   6 +-
 tools/perf/util/bpf-prologue.c            |   4 +-
 tools/perf/util/callchain.c               |   2 +-
 tools/perf/util/config.c                  |   8 +-
 tools/perf/util/data-convert-bt.c         |   4 +-
 tools/perf/util/data.c                    |   2 +-
 tools/perf/util/debug.c                   |   4 +-
 tools/perf/util/debug.h                   |   2 +-
 tools/perf/util/event.c                   |   4 +-
 tools/perf/util/evlist.c                  |   4 +-
 tools/perf/util/evsel.c                   |  19 +-
 tools/perf/util/header.c                  |  20 +-
 tools/perf/util/jitdump.c                 |   4 +-
 tools/perf/util/llvm-utils.c              |  18 +-
 tools/perf/util/machine.c                 |   2 +-
 tools/perf/util/parse-branch-options.c    |   3 +-
 tools/perf/util/perf-hooks.c              |   6 +-
 tools/perf/util/probe-event.c             |  90 +--
 tools/perf/util/probe-file.c              |  36 +-
 tools/perf/util/probe-finder.c            | 115 ++--
 tools/perf/util/record.c                  |  18 +-
 tools/perf/util/session.c                 |   2 +-
 tools/perf/util/srcline.c                 |   6 +-
 tools/perf/util/synthetic-events.c        |  10 +-
 tools/perf/util/thread-stack.c            |   4 +-
 tools/perf/util/thread_map.c              |   2 +-
 tools/perf/util/trace-event-parse.c       |   2 +-
 tools/perf/util/unwind-libunwind-local.c  |   9 +-
 120 files changed, 898 insertions(+), 944 deletions(-)

-- 
2.20.1

