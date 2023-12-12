Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8AF80E288
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 04:14:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WugFTJ8c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq3cJ0w9yz3bYc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 14:14:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WugFTJ8c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq2b41l25z2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 13:27:59 +1100 (AEDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5df49931b4eso28077617b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Dec 2023 18:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702348072; x=1702952872; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2rIXSzzj4Vn0OnxWzlgjGuiOUWfNx+9Oitq+JebsnVk=;
        b=WugFTJ8cBlcvVp99qf3SoIvjZGg+hbwvyGD8xutwcXyAl4FKJqEXYcnohDuMhnwKqI
         8Jd+ybghtrZrbOQ+DO3+Vlva27FzjoAtZnYTy5gR03IMQOmxZ17EM+y+NspRgIRuMOut
         pp4dT2O09v62EsVVWzyRY5vNvUr3lY7BbAAG67JuEND550J58wGY9YyK1gAtlJ8vcd0c
         gEYKWQdtGhdiHmk9KhjNLlX7vX6HLadR1m8ZJ/FutZPVSpi7ErtkVLuvalTdTHrTcbIG
         9yIk4dQjl3PIeSprmUbhy8/8RKHA/sqz+9BDU+Or0duEgkLnussripQoL1yyTHk5Bmc2
         a3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702348072; x=1702952872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rIXSzzj4Vn0OnxWzlgjGuiOUWfNx+9Oitq+JebsnVk=;
        b=ovZWpBnF6ZylILsPbh8AW6RT1iCBjotHp6fGCZeN0OSJV1f4FQnQnJJIfcW4RJjmQr
         vxBdW9WeI4pMoUZsP3BYVS7Zp/gHCGCtQwe8Uxly+UbcIdUEKnszxaxpCffbMofTTfcu
         bjspoi1r/qHvev2aJH6g8aHexIdzIvNHURuPzTiJ1j4ZxUicV0ceaueqozbZOliVwMdc
         puVcOBgPxZR2jCxtcVJN0dm7m08Xw0ccA7QGyzrAhznx3bpCpXAF4V9GVGgp8KduB6Wo
         kTU8yW5nSWRDBnJyrnBP/yWay1YpbNWu6b+L8XtTtgv6CcXq/OUc46Qm/w+KyVbrc8QC
         ohyg==
X-Gm-Message-State: AOJu0YwYz+cUXAot/lgwHVdvQM3EvofxoswNSPRaEdrzIAmFU047c00c
	HGrZesTxYDkme0fR9ATsP2M=
X-Google-Smtp-Source: AGHT+IGNrxiOB0CU5Pwp1l0+iyVygpKHBLCSMm3YHsDrVXT56LslkKopHRNY35LGYnIHsoxEKrxNng==
X-Received: by 2002:a0d:f6c7:0:b0:5d7:1940:b37e with SMTP id g190-20020a0df6c7000000b005d71940b37emr4381333ywf.74.1702348071823;
        Mon, 11 Dec 2023 18:27:51 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:38aa:1c88:df05:9b73])
        by smtp.gmail.com with ESMTPSA id y188-20020a0dd6c5000000b005d6da42e443sm3448474ywd.59.2023.12.11.18.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 18:27:51 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Disseldorp <ddiss@suse.de>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hdegoede@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jens Axboe <axboe@kernel.dk>,
	Jiri Pirko <jiri@resnulli.us>,
	Jiri Slaby <jirislaby@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Karsten Graul <kgraul@linux.ibm.com>,
	Karsten Keil <isdn@linux-pingi.de>,
	Kees Cook <keescook@chromium.org>,
	Leon Romanovsky <leon@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Martin Habets <habetsm.xilinx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Oliver Neukum <oneukum@suse.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Rich Felker <dalias@libc.org>,
	Rob Herring <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wenjia Zhang <wenjia@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	GR-QLogic-Storage-Upstream@marvell.com,
	alsa-devel@alsa-project.org,
	ath10k@lists.infradead.org,
	dmaengine@vger.kernel.org,
	iommu@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-net-drivers@amd.com,
	linux-pci@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	mpi3mr-linuxdrv.pdl@broadcom.com,
	netdev@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v3 00/35] bitops: add atomic find_bit() operations
Date: Mon, 11 Dec 2023 18:27:14 -0800
Message-Id: <20231212022749.625238-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 12 Dec 2023 14:13:27 +1100
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
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, Jan Kara <jack@suse.cz>, Bart Van Assche <bvanassche@acm.org>, Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Matthew Wilcox <willy@infradead.org>, Alexey Klimov <klimov.linux@gmail.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add helpers around test_and_{set,clear}_bit() that allow to search for
clear or set bits and flip them atomically.

The target patterns may look like this:

	for (idx = 0; idx < nbits; idx++)
		if (test_and_clear_bit(idx, bitmap))
			do_something(idx);

Or like this:

	do {
		bit = find_first_bit(bitmap, nbits);
		if (bit >= nbits)
			return nbits;
	} while (!test_and_clear_bit(bit, bitmap));
	return bit;

In both cases, the opencoded loop may be converted to a single function
or iterator call. Correspondingly:

	for_each_test_and_clear_bit(idx, bitmap, nbits)
		do_something(idx);

Or:
	return find_and_clear_bit(bitmap, nbits);

Obviously, the less routine code people have to write themself, the
less probability to make a mistake.

Those are not only handy helpers but also resolve a non-trivial
issue of using non-atomic find_bit() together with atomic
test_and_{set,clear)_bit().

The trick is that find_bit() implies that the bitmap is a regular
non-volatile piece of memory, and compiler is allowed to use such
optimization techniques like re-fetching memory instead of caching it.

For example, find_first_bit() is implemented like this:

      for (idx = 0; idx * BITS_PER_LONG < sz; idx++) {
              val = addr[idx];
              if (val) {
                      sz = min(idx * BITS_PER_LONG + __ffs(val), sz);
                      break;
              }
      }

On register-memory architectures, like x86, compiler may decide to
access memory twice - first time to compare against 0, and second time
to fetch its value to pass it to __ffs().

When running find_first_bit() on volatile memory, the memory may get
changed in-between, and for instance, it may lead to passing 0 to
__ffs(), which is undefined. This is a potentially dangerous call.

find_and_clear_bit() as a wrapper around test_and_clear_bit()
naturally treats underlying bitmap as a volatile memory and prevents
compiler from such optimizations.

Now that KCSAN is catching exactly this type of situations and warns on
undercover memory modifications. We can use it to reveal improper usage
of find_bit(), and convert it to atomic find_and_*_bit() as appropriate.

In some cases concurrent operations with plain find_bit() are acceptable.
For example:

 - two threads running find_*_bit(): safe wrt ffs(0) and returns correct
   value, because underlying bitmap is unchanged;
 - find_next_bit() in parallel with set or clear_bit(), when modifying
   a bit prior to the start bit to search: safe and correct;
 - find_first_bit() in parallel with set_bit(): safe, but may return wrong
   bit number;
 - find_first_zero_bit() in parallel with clear_bit(): same as above.

In last 2 cases find_bit() may not return a correct bit number, but
it may be OK if caller requires any (not exactly the first) set or clear
bit, correspondingly.

In such cases, KCSAN may be safely silenced with data_race(). But in most
cases where KCSAN detects concurrency people should carefully review their
code and likely protect critical sections or switch to atomic
find_and_bit(), as appropriate.

The 1st patch of the series adds the following atomic primitives:

	find_and_set_bit(addr, nbits);
	find_and_set_next_bit(addr, nbits, start);
	...

Here find_and_{set,clear} part refers to the corresponding
test_and_{set,clear}_bit function. Suffixes like _wrap or _lock
derive their semantics from corresponding find() or test() functions.

For brevity, the naming omits the fact that we search for zero bit in
find_and_set, and correspondingly search for set bit in find_and_clear
functions.

The patch also adds iterators with atomic semantics, like
for_each_test_and_set_bit(). Here, the naming rule is to simply prefix
corresponding atomic operation with 'for_each'.

In [1] Jan reported 2% slowdown in a single-thread search test when
switching find_bit() function to treat bitmaps as volatile arrays. On
the other hand, kernel robot in the same thread reported +3.7% to the
performance of will-it-scale.per_thread_ops test.

Assuming that our compilers are sane and generate better code against
properly annotated data, the above discrepancy doesn't look weird. When
running on non-volatile bitmaps, plain find_bit() outperforms atomic
find_and_bit(), and vice-versa.

So, all users of find_bit() API, where heavy concurrency is expected,
are encouraged to switch to atomic find_and_bit() as appropriate.

The 1st patch of this series adds atomic find_and_bit() API, 2nd adds
a basic test for new API, and all the following patches spread it over
the kernel.

They can be applied separately from each other on per-subsystems basis,
or I can pull them in bitmap tree, as appropriate.

[1] https://lore.kernel.org/lkml/634f5fdf-e236-42cf-be8d-48a581c21660@alu.unizg.hr/T/#m3e7341eb3571753f3acf8fe166f3fb5b2c12e615

---
v1: https://lore.kernel.org/netdev/20231118155105.25678-29-yury.norov@gmail.com/T/
v2: https://lore.kernel.org/all/20231204185101.ddmkvsr2xxsmoh2u@quack3/T/
v3:
 - collect more reviews;
 - align wording in commit messages @ Bjorn Helgaas;
 - add examples where non-atomic find_bit() may safely race @ Jan Kara;
 - patch  #3: use if-else instead of ternary operator @ Jens Axboe;
 - patch #13: align coding style @ Vitaly Kuznetsov, Sean Christopherson;

Yury Norov (35):
  lib/find: add atomic find_bit() primitives
  lib/find: add test for atomic find_bit() ops
  lib/sbitmap; optimize __sbitmap_get_word() by using find_and_set_bit()
  watch_queue: optimize post_one_notification() by using
    find_and_clear_bit()
  sched: add cpumask_find_and_set() and use it in __mm_cid_get()
  mips: sgi-ip30: optimize heart_alloc_int() by using find_and_set_bit()
  sparc: optimize alloc_msi() by using find_and_set_bit()
  perf/arm: use atomic find_bit() API
  drivers/perf: optimize ali_drw_get_counter_idx() by using
    find_and_set_bit()
  dmaengine: idxd: optimize perfmon_assign_event()
  ath10k: optimize ath10k_snoc_napi_poll() with an atomic iterator
  wifi: rtw88: optimize the driver by using atomic iterator
  KVM: x86: hyper-v: optimize and cleanup kvm_hv_process_stimers()
  PCI: hv: Optimize hv_get_dom_num() by using find_and_set_bit()
  scsi: core: optimize scsi_evt_emit() by using an atomic iterator
  scsi: mpi3mr: optimize the driver by using find_and_set_bit()
  scsi: qedi: optimize qedi_get_task_idx() by using find_and_set_bit()
  powerpc: optimize arch code by using atomic find_bit() API
  iommu: optimize subsystem by using atomic find_bit() API
  media: radio-shark: optimize driver by using atomic find_bit() API
  sfc: optimize driver by using atomic find_bit() API
  tty: nozomi: optimize interrupt_handler()
  usb: cdc-acm: optimize acm_softint()
  block: null_blk: replace get_tag() with a generic
    find_and_set_bit_lock()
  RDMA/rtrs: optimize __rtrs_get_permit() by using
    find_and_set_bit_lock()
  mISDN: optimize get_free_devid()
  media: em28xx: cx231xx: optimize drivers by using find_and_set_bit()
  ethernet: rocker: optimize ofdpa_port_internal_vlan_id_get()
  serial: sc12is7xx: optimize sc16is7xx_alloc_line()
  bluetooth: optimize cmtp_alloc_block_id()
  net: smc: optimize smc_wr_tx_get_free_slot_index()
  ALSA: use atomic find_bit() functions where applicable
  m68k: optimize get_mmu_context()
  microblaze: optimize get_mmu_context()
  sh: mach-x3proto: optimize ilsel_enable()

 arch/m68k/include/asm/mmu_context.h          |  11 +-
 arch/microblaze/include/asm/mmu_context_mm.h |  11 +-
 arch/mips/sgi-ip30/ip30-irq.c                |  12 +-
 arch/powerpc/mm/book3s32/mmu_context.c       |  10 +-
 arch/powerpc/platforms/pasemi/dma_lib.c      |  45 +--
 arch/powerpc/platforms/powernv/pci-sriov.c   |  12 +-
 arch/sh/boards/mach-x3proto/ilsel.c          |   4 +-
 arch/sparc/kernel/pci_msi.c                  |   9 +-
 arch/x86/kvm/hyperv.c                        |  40 +--
 drivers/block/null_blk/main.c                |  41 +--
 drivers/dma/idxd/perfmon.c                   |   8 +-
 drivers/infiniband/ulp/rtrs/rtrs-clt.c       |  15 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.h        |  10 +-
 drivers/iommu/msm_iommu.c                    |  18 +-
 drivers/isdn/mISDN/core.c                    |   9 +-
 drivers/media/radio/radio-shark.c            |   5 +-
 drivers/media/radio/radio-shark2.c           |   5 +-
 drivers/media/usb/cx231xx/cx231xx-cards.c    |  16 +-
 drivers/media/usb/em28xx/em28xx-cards.c      |  37 +--
 drivers/net/ethernet/rocker/rocker_ofdpa.c   |  11 +-
 drivers/net/ethernet/sfc/rx_common.c         |   4 +-
 drivers/net/ethernet/sfc/siena/rx_common.c   |   4 +-
 drivers/net/ethernet/sfc/siena/siena_sriov.c |  14 +-
 drivers/net/wireless/ath/ath10k/snoc.c       |   9 +-
 drivers/net/wireless/realtek/rtw88/pci.c     |   5 +-
 drivers/net/wireless/realtek/rtw89/pci.c     |   5 +-
 drivers/pci/controller/pci-hyperv.c          |   7 +-
 drivers/perf/alibaba_uncore_drw_pmu.c        |  10 +-
 drivers/perf/arm-cci.c                       |  24 +-
 drivers/perf/arm-ccn.c                       |  10 +-
 drivers/perf/arm_dmc620_pmu.c                |   9 +-
 drivers/perf/arm_pmuv3.c                     |   8 +-
 drivers/scsi/mpi3mr/mpi3mr_os.c              |  21 +-
 drivers/scsi/qedi/qedi_main.c                |   9 +-
 drivers/scsi/scsi_lib.c                      |   7 +-
 drivers/tty/nozomi.c                         |   5 +-
 drivers/tty/serial/sc16is7xx.c               |   8 +-
 drivers/usb/class/cdc-acm.c                  |   5 +-
 include/linux/cpumask.h                      |  12 +
 include/linux/find.h                         | 293 +++++++++++++++++++
 kernel/sched/sched.h                         |  14 +-
 kernel/watch_queue.c                         |   6 +-
 lib/find_bit.c                               |  85 ++++++
 lib/sbitmap.c                                |  46 +--
 lib/test_bitmap.c                            |  61 ++++
 net/bluetooth/cmtp/core.c                    |  10 +-
 net/smc/smc_wr.c                             |  10 +-
 sound/pci/hda/hda_codec.c                    |   7 +-
 sound/usb/caiaq/audio.c                      |  13 +-
 49 files changed, 631 insertions(+), 419 deletions(-)

-- 
2.40.1

