Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 637D7911ACD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 08:00:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f79FpMRL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W56C60Mz0z3dW1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 16:00:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f79FpMRL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4p983H0jz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 03:57:15 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7062c11d0d1so1107826b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718906228; x=1719511028; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W47tS6B8wqIVT2qpvRqiOMMzdBB5xZ547KnoaR9dSwQ=;
        b=f79FpMRL8C6cXuSxM1kfak/dp4dXPpzMf86o2Yl/JahPU9wgN6saoGO4w7d2Hbp0ah
         IHO5NPThy8Bh+8RBdQRuKKqgiFKNpruzgv3ErsRbJHDv9OFBe4jsL7BZpq6PiD0wSGDN
         SRhXPBloyDyPX+Vh3nvJqDkFc6RLW6FV4vegV0KJm6Nu6YwAzPHz2fjbBSncdbR8/scf
         3w1baGKQpy4ls+XQBpHhdddvtsIz2nnIMDJ3WMYenwr3Rv6dNAb6/6y9jOcwmiNnh4Wu
         AU2i3Lm28acPUIPkmGeC4NPIpSX7/lp4q/R0FJ/xgKLjUsPnzsnj3ijrYr5cq+EpEXq/
         rhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906228; x=1719511028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W47tS6B8wqIVT2qpvRqiOMMzdBB5xZ547KnoaR9dSwQ=;
        b=OMyW67Mkf+HoKEtbEWuAzZV9+O3PhM64RHyxl8RBdaFudGA9ZNm/4KWxdavHoD/2wx
         4RKurSZn8M0/WTDHKK8yzxlEbhZPwjESjVX5+R+3z/guDV5XyVpJXbPeqZCcf9brwg0s
         QUXEaMBlf/fqXgmY8BdMRgkfOxAIfwMTxOZenbO2F4qyK29j2xf1qz3lRa6Ku4Gh6d+c
         67cpr4dsiRhlr+qUf2RP1GHxdJL5vvxIimQhLww6t/6M/zDpH71L9pPfCA6ktlmtEKsf
         gP6YkmjlCNAVCVUVrEdKzk3+Qcw7BrgMJqPTvd94X+9gYwN9ZMrMdYF9jeP2HoW+a6fC
         zKOA==
X-Forwarded-Encrypted: i=1; AJvYcCVcKonIUUaHD0sR9IrX2yz8KYJQ70BYbT/ec3TNllG8jZfOdHyaU14rXu3W242n6jiuhbrqCBraq8a9t9SfXuR70h6a1UDeongqqZB3xA==
X-Gm-Message-State: AOJu0YzkLmODtrvxTQKcCEEc8WWQXriWBtbWTHhDKvSTAa/j7BIAsQtS
	1D0njxfx64fCaT5B1qA65dsFQLjh2Rx8hquU6BYVqpA+qZ1hiBn1
X-Google-Smtp-Source: AGHT+IETPnhQIIAFAn3PVCfwnEc7SkEbk6ro/qDz0Ch8QyPc2IoUZATwJ2GjFRkYml1JLqHQ4RqduQ==
X-Received: by 2002:a05:6a00:1712:b0:704:12fc:7b30 with SMTP id d2e1a72fcca58-70629c565e1mr5514020b3a.17.1718906227709;
        Thu, 20 Jun 2024 10:57:07 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b11bsm12644924b3a.154.2024.06.20.10.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:57:07 -0700 (PDT)
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
Subject: [PATCH v4 00/40] lib/find: add atomic find_bit() primitives
Date: Thu, 20 Jun 2024 10:56:23 -0700
Message-ID: <20240620175703.605111-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 21 Jun 2024 15:58:23 +1000
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
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, Jan Kara <jack@suse.cz>, Bart Van Assche <bvanassche@acm.org>, Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Matthew Wilcox <willy@infradead.org>, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>, Linus Torvalds <torvalds@linux-foundation.org>, Alexey Klimov <alexey.klimov@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--- 

This v4 moves new API to separate headers, as adding stuff to find.h
concerns people, particularly Linus. It also adds few more conversions
alongside other cosmetic changes. See full changelog below.

---

Add helpers around test_and_{set,clear}_bit() to allow searching for
clear or set bits and flipping them atomically.

Using atomic search primitives allows to implement lockless bitmap
handling where only individual bits are touched by concurrent processes,
and where people now have to protect their bitmaps to search for a free
or set bit due to the lack of atomic searching routines.

The typical lock-protected bit allocation may look like this:

	unsigned long alloc_bit()
	{
		unsigned long bit;

		spin_lock(bitmap_lock);
		bit = find_first_zero_bit(bitmap, nbits);
		if (bit < nbits)
			__set_bit(bit, bitmap);
		spin_unlock(bitmap_lock);

		return bit;
	}

	void free_bit(unsigned long bit)
	{
		spin_lock(bitmap_lock);
		__clear_bit(bit, bitmap);
		spin_unlock(bitmap_lock);
	}

Now with atomic find_and_set_bit(), the above can be implemented
lockless, directly by using it and atomic clear_bit().

Patches 36-40 do this in few places in the kernel where the
transition is clear. There is likely more candidates for
refactoring.

The other important case is when people opencode atomic search
or atomic traverse on the maps with the patterns looking like:

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
less probability to make a mistake. The patch #33 fixes one such
mistake.

The new API is not only a handy helpers - it also resolves a non-trivial
issue of using non-atomic find_bit() together with atomic
test_and_{set,clear)_bit().

The trick is that find_bit() implies that the bitmap is a regular
non-volatile piece of memory, and compiler is allowed to use such
optimization techniques like re-fetching memory instead of caching it.

For example, find_first_bit() is implemented like:

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
__ffs(), which is an undefined behaviour. This is a potentially
dangerous call.

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
cases where KCSAN detects concurrency we should carefully review the code
and likely protect critical sections or switch to atomic find_and_bit(),
as appropriate.

This patch adds the following atomic primitives:

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

This series is not aimed on performance, but some performance
implications are considered.

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

[1] https://lore.kernel.org/lkml/634f5fdf-e236-42cf-be8d-48a581c21660@alu.unizg.hr/T/#m3e7341eb3571753f3acf8fe166f3fb5b2c12e615

---
v1: https://lore.kernel.org/netdev/20231118155105.25678-29-yury.norov@gmail.com/T/
v2: https://lore.kernel.org/all/20231204185101.ddmkvsr2xxsmoh2u@quack3/T/
v3: https://lore.kernel.org/linux-pci/ZX4bIisLzpW8c4WM@yury-ThinkPad/T/
v4:
 - drop patch v3-24: not needed after null_blk refactoring;
 - add patch 34: "MIPS: sgi-ip27: optimize alloc_level()";
 - add patch 35: "uprobes: optimize xol_take_insn_slot()";
 - add patches 36-40: get rid of locking scheme around bitmaps;
 - move new API to separate headers, to not bloat bitmap.h @ Linus;
 - patch #1: adjust comments to allow returning >= @size;
 - rebase the series on top of current master.

Yury Norov (40):
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
  ath10k: optimize ath10k_snoc_napi_poll()
  wifi: rtw88: optimize the driver by using atomic iterator
  KVM: x86: hyper-v: optimize and cleanup kvm_hv_process_stimers()
  PCI: hv: Optimize hv_get_dom_num() by using find_and_set_bit()
  scsi: core: optimize scsi_evt_emit() by using an atomic iterator
  scsi: mpi3mr: optimize the driver by using find_and_set_bit()
  scsi: qedi: optimize qedi_get_task_idx() by using find_and_set_bit()
  powerpc: optimize arch code by using atomic find_bit() API
  iommu: optimize subsystem by using atomic find_bit() API
  media: radio-shark: optimize the driver by using atomic find_bit() API
  sfc: optimize the driver by using atomic find_bit() API
  tty: nozomi: optimize interrupt_handler()
  usb: cdc-acm: optimize acm_softint()
  RDMA/rtrs: optimize __rtrs_get_permit() by using
    find_and_set_bit_lock()
  mISDN: optimize get_free_devid()
  media: em28xx: cx231xx: optimize drivers by using find_and_set_bit()
  ethernet: rocker: optimize ofdpa_port_internal_vlan_id_get()
  bluetooth: optimize cmtp_alloc_block_id()
  net: smc: optimize smc_wr_tx_get_free_slot_index()
  ALSA: use atomic find_bit() functions where applicable
  m68k: optimize get_mmu_context()
  microblaze: optimize get_mmu_context()
  sh: mach-x3proto: optimize ilsel_enable()
  MIPS: sgi-ip27: optimize alloc_level()
  uprobes: optimize xol_take_insn_slot()
  scsi: sr: drop locking around SR index bitmap
  KVM: PPC: Book3s HV: drop locking around kvmppc_uvmem_bitmap
  wifi: mac80211: drop locking around ntp_fltr_bmap
  mailbox: bcm-flexrm: simplify locking scheme
  powerpc/xive: drop locking around IRQ map

 MAINTAINERS                                  |   2 +
 arch/m68k/include/asm/mmu_context.h          |  12 +-
 arch/microblaze/include/asm/mmu_context_mm.h |  12 +-
 arch/mips/sgi-ip27/ip27-irq.c                |  13 +-
 arch/mips/sgi-ip30/ip30-irq.c                |  13 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c           |  33 +-
 arch/powerpc/mm/book3s32/mmu_context.c       |  11 +-
 arch/powerpc/platforms/pasemi/dma_lib.c      |  46 +--
 arch/powerpc/platforms/powernv/pci-sriov.c   |  13 +-
 arch/powerpc/sysdev/xive/spapr.c             |  34 +-
 arch/sh/boards/mach-x3proto/ilsel.c          |   5 +-
 arch/sparc/kernel/pci_msi.c                  |  10 +-
 arch/x86/kvm/hyperv.c                        |  41 +--
 drivers/dma/idxd/perfmon.c                   |   9 +-
 drivers/infiniband/ulp/rtrs/rtrs-clt.c       |  16 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.h        |  11 +-
 drivers/iommu/msm_iommu.c                    |  19 +-
 drivers/isdn/mISDN/core.c                    |  10 +-
 drivers/mailbox/bcm-flexrm-mailbox.c         |  21 +-
 drivers/media/radio/radio-shark.c            |   6 +-
 drivers/media/radio/radio-shark2.c           |   6 +-
 drivers/media/usb/cx231xx/cx231xx-cards.c    |  17 +-
 drivers/media/usb/em28xx/em28xx-cards.c      |  38 +--
 drivers/net/ethernet/broadcom/bnxt/bnxt.c    |  18 +-
 drivers/net/ethernet/rocker/rocker_ofdpa.c   |  12 +-
 drivers/net/ethernet/sfc/rx_common.c         |   5 +-
 drivers/net/ethernet/sfc/siena/rx_common.c   |   5 +-
 drivers/net/ethernet/sfc/siena/siena_sriov.c |  15 +-
 drivers/net/wireless/ath/ath10k/snoc.c       |  10 +-
 drivers/net/wireless/realtek/rtw88/pci.c     |   6 +-
 drivers/net/wireless/realtek/rtw89/pci.c     |   6 +-
 drivers/pci/controller/pci-hyperv.c          |   8 +-
 drivers/perf/alibaba_uncore_drw_pmu.c        |  11 +-
 drivers/perf/arm-cci.c                       |  25 +-
 drivers/perf/arm-ccn.c                       |  11 +-
 drivers/perf/arm_dmc620_pmu.c                |  10 +-
 drivers/perf/arm_pmuv3.c                     |   9 +-
 drivers/scsi/mpi3mr/mpi3mr_os.c              |  22 +-
 drivers/scsi/qedi/qedi_main.c                |  10 +-
 drivers/scsi/scsi_lib.c                      |   8 +-
 drivers/scsi/sr.c                            |  15 +-
 drivers/tty/nozomi.c                         |   6 +-
 drivers/usb/class/cdc-acm.c                  |   6 +-
 include/linux/cpumask_atomic.h               |  20 ++
 include/linux/find.h                         |   4 -
 include/linux/find_atomic.h                  | 324 +++++++++++++++++++
 kernel/events/uprobes.c                      |  15 +-
 kernel/sched/sched.h                         |  15 +-
 kernel/watch_queue.c                         |   7 +-
 lib/find_bit.c                               |  86 +++++
 lib/sbitmap.c                                |  47 +--
 lib/test_bitmap.c                            |  62 ++++
 net/bluetooth/cmtp/core.c                    |  11 +-
 net/smc/smc_wr.c                             |  11 +-
 sound/pci/hda/hda_codec.c                    |   8 +-
 sound/usb/caiaq/audio.c                      |  14 +-
 56 files changed, 747 insertions(+), 493 deletions(-)
 create mode 100644 include/linux/cpumask_atomic.h
 create mode 100644 include/linux/find_atomic.h

-- 
2.43.0

