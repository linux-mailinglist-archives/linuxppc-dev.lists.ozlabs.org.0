Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA61477FBC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:01:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFR034wYrz3cPQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:01:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Frkc/RjO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82f;
 helo=mail-qt1-x82f.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Frkc/RjO; dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzV1c3jz3056
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:00:52 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id p19so680470qtw.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sMr6Qm2ZRAPWHO8VKmFAg9zNVh0B4CLiVKOXqBkVgVs=;
 b=Frkc/RjO4I9YYdDeG17GlBUcNHe0yfzyy6/JuDQnuKixhABzIk600AxlXhj4FoGWQS
 ebuauO5Gx6/Bfg0G9m4jnTPyn1bbOwS28Qyia6DbarQgk9yu2YhRFQobj8Xs3crngYJr
 wh2WBySPE+RDNv1zAFUp45tiWGNI2+RC9IqfaLSxZ8lWPPL1v+H7B2Wwtg56SvKJpEHh
 SEfFgryUQX701I/p+fdzdpQ8W/mBTc1eX6tqKwAYCZKxWa9jq67IgzEOQReAvRYRc0oq
 eUA4i8t6oFpv8BY3RKVeyepKjr5Q8PTPbR8zjHyeeMAgitXx5dxmGs3Cts6sg/glVALX
 gDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sMr6Qm2ZRAPWHO8VKmFAg9zNVh0B4CLiVKOXqBkVgVs=;
 b=UlwZZfJuRHMPDQWy9msL1KhihVxLueAxw7BoPYOrLnnUPCQTPFcJjjp9ndxm4TGJK5
 eK7+cfEBBzwKPbtfo+1DGrnwbnlqAzpXh2KHyfCjMtgdoitVQlNG8ipEelsNzk0+PEyu
 BghJzXpmUr239AJDwCVH+FyZL93GJJvPZbZK8nX9Jaw6PUQiyk72M7mbNktFvvKqiQdO
 +TD4MVhkRm18OWfNOisVWVeDxNjwj3SLc4rz8w9rypuL4mxu4VyRHfidF3eSEcgPz72T
 MB905/B8I0re153rujq+5askQ8rho9YNthVn/GRxyjLLgeQ4lXyRUkThyQSF0UQMWPkR
 HUcw==
X-Gm-Message-State: AOAM530BA29iXW6JT/qoe555XeeMGLWq0aKRtZ/EIHd2XqrIQvuta5nT
 yBJUUY5yLfZH3y8Udh4KBbUVqaisvJ4=
X-Google-Smtp-Source: ABdhPJxjIFQ6HBpdvmTrMVY0QClxHbwlhvO9HhJ5qX5ZfemZkNsUMKhCtnPVomBuRN63VMXDNUXApg==
X-Received: by 2002:ac8:5a0b:: with SMTP id n11mr18897718qta.485.1639692046543; 
 Thu, 16 Dec 2021 14:00:46 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:00:46 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/20] powerpc: Define eligible functions as __init
Date: Thu, 16 Dec 2021 17:00:15 -0500
Message-Id: <20211216220035.605465-1-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello all,

This patchset focuses on redefining/declaring functions that could be 
labeled with the macro `__init`. From my understanding, an
initialization function is one which is only needed during the initial
phases of booting, after which it's resources can be freed. I figure
that any function which is only called by other initialization
functions may also be labeled as an initialization function. There are 
several (mostly static) functions which can and should be labeled as
`__init`. I created some scripts to help identify these functions. It
scans all functions defined in `arch/powerpc` and, if it is only called
by functions with the `__init` attribute, it will go on to adjust the
prototype and definition to include the `__init` declaration. This 
patchset hopes to solve related issue #282:
  https://github.com/linuxppc/issues/issues/282

Some notes about the scripts:
  1. Trying to handle things like functions assigned to macros and
      function pointers proved to be a bit too complicated to track. I
      ended up just halting the investigation of these functions. In
      the future, I would like to be able to attempt to `__init` them
      but for now we leave them alone.

  2. The proper syntax for adding the `__init` macro is followed as it
      is defined in `include/linux/init.h`. 

  3. There are some odd looking functions that look something like:
      `char *__init foo(...`. I have found that this happens in many 
      other places in the kernel source prior to running the scripts.
      Additionally, after running the scripts. I have successfully
      built all powerpc defconfigs without error. For these reasons, I
      assume the odd syntax is valid but I am interested in other
      opinions on this.

  5. I have run my scripts on the Dec 14, 2021 `merge` branch
      (specifically 798527287598)

After running my script for 3 rounds, they have identified about 250
functions so I tried to break the patches up into related platforms and
subdirectories. There are only two functions with a prototype outside
of `arch/powerpc`, these are `find_via_cuda` and `find_via_pmu`. I put
those in their own patch.

Other than building all the ppc defconfigs, I have tested the changes 
by building kernels with and without the patches using defconfigs
ppc64le_guest, powernv and pseries_le. There were no size differences
reported in the boot logs. However, when using `readelf -t` we see the 
following differences in the size of the .text section:
  ppc64le_guest -> .text decreased in size by 12.8k, init.text unchanged
  powernv -> .text decreased in size by 7.7k, init.text unchanged
  pseries_le -> .text decreased in size by 9.6k, init.text increased 65.5k

I figured the size differences (or lack of) in .init.text might have
something to do with the requirement that the .init.text "section ends
on a page boundary", as described in 
`arch/powerpc/kernel/vmlinux.lds.S`. 

I am excited to say this is my first attempt at kernel development. I
know this patchset is in no way important but I figured it was a good
starting point. Please let me know if there is anything I am doing
wrong or if I can do anything to help meet the kernel contribution 
guidelines.

Special thanks to Daniel Axtens for mentoring me and helping me get my 
first patchset out!

Changes in v2:
 - add `__init` in prototypes right before the funtion name instead of 
    at the end.
 - respond to ./scripts/checkpatch feedback
 - reference the related github issue in cover letter
 - fix date in cover letter
 - rebase onto latest `merge`
v1:
  https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=277093&state=
    

Nick Child (20):
  powerpc/kernel: Add __init attribute to eligible functions
  powerpc/lib: Add __init attribute to eligible functions
  powerpc/mm: Add __init attribute to eligible functions
  powerpc/perf: Add __init attribute to eligible functions
  powerpc/sysdev: Add __init attribute to eligible functions
  powerpc/xmon: Add __init attribute to eligible functions
  powerpc/cell: Add __init attribute to eligible functions
  powerpc/chrp: Add __init attribute to eligible functions
  powerpc/pasemi: Add __init attribute to eligible functions
  powerpc/powermac: Add __init attribute to eligible functions
  powerpc/powernv: Add __init attribute to eligible functions
  powerpc/pseries: Add __init attribute to eligible functions
  powerpc/ps3: Add __init attribute to eligible functions
  powerpc/4xx: Add __init attribute to eligible functions
  powerpc/44x: Add __init attribute to eligible functions
  powerpc/embedded6xx: Add __init attribute to eligible functions
  powerpc/83xx: Add __init attribute to eligible functions
  powerpc/85xx: Add __init attribute to eligible functions
  powerpc/512x: Add __init attribute to eligible functions
  cuda/pmu: Make find_via_cuda/pmu init functions

 arch/powerpc/include/asm/book3s/64/mmu.h      |  2 +-
 arch/powerpc/include/asm/btext.h              | 10 ++--
 arch/powerpc/include/asm/cpm2.h               |  6 +--
 arch/powerpc/include/asm/cpuidle.h            |  2 +-
 arch/powerpc/include/asm/eeh.h                |  2 +-
 arch/powerpc/include/asm/fadump-internal.h    |  6 +--
 arch/powerpc/include/asm/hugetlb.h            |  2 +-
 arch/powerpc/include/asm/i8259.h              |  2 +-
 arch/powerpc/include/asm/iommu.h              |  2 +-
 arch/powerpc/include/asm/ipic.h               |  2 +-
 arch/powerpc/include/asm/kexec.h              |  2 +-
 arch/powerpc/include/asm/kvm_guest.h          |  2 +-
 arch/powerpc/include/asm/mmu_context.h        |  2 +-
 arch/powerpc/include/asm/mpic.h               |  2 +-
 arch/powerpc/include/asm/opal.h               |  2 +-
 arch/powerpc/include/asm/pci.h                |  2 +-
 arch/powerpc/include/asm/perf_event_server.h  |  2 +-
 arch/powerpc/include/asm/setup.h              |  8 +--
 arch/powerpc/include/asm/smu.h                |  2 +-
 arch/powerpc/include/asm/udbg.h               | 10 ++--
 arch/powerpc/include/asm/xics.h               |  4 +-
 arch/powerpc/include/asm/xmon.h               |  2 +-
 arch/powerpc/kernel/btext.c                   | 12 ++---
 arch/powerpc/kernel/dt_cpu_ftrs.c             |  2 +-
 arch/powerpc/kernel/eeh_cache.c               |  2 +-
 arch/powerpc/kernel/fadump.c                  | 18 +++----
 arch/powerpc/kernel/nvram_64.c                |  6 +--
 arch/powerpc/kernel/pci-common.c              |  2 +-
 arch/powerpc/kernel/pci_32.c                  |  4 +-
 arch/powerpc/kernel/prom.c                    |  4 +-
 arch/powerpc/kernel/prom_init.c               | 12 ++---
 arch/powerpc/kernel/rtasd.c                   |  6 +--
 arch/powerpc/kernel/security.c                |  4 +-
 arch/powerpc/kernel/setup_64.c                |  2 +-
 arch/powerpc/kernel/smp.c                     |  5 +-
 arch/powerpc/kernel/sysfs.c                   | 10 ++--
 arch/powerpc/kernel/udbg_16550.c              | 10 ++--
 arch/powerpc/kexec/core.c                     |  2 +-
 arch/powerpc/lib/code-patching.c              |  2 +-
 arch/powerpc/lib/feature-fixups.c             | 26 +++++-----
 arch/powerpc/mm/book3s32/mmu.c                |  2 +-
 arch/powerpc/mm/book3s64/hash_utils.c         |  6 +--
 arch/powerpc/mm/book3s64/hugetlbpage.c        |  2 +-
 arch/powerpc/mm/book3s64/mmu_context.c        |  2 +-
 arch/powerpc/mm/book3s64/pkeys.c              |  2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  4 +-
 arch/powerpc/mm/nohash/44x.c                  |  4 +-
 arch/powerpc/mm/nohash/fsl_book3e.c           |  2 +-
 arch/powerpc/mm/nohash/tlb.c                  |  4 +-
 arch/powerpc/mm/numa.c                        |  6 +--
 arch/powerpc/mm/ptdump/ptdump.c               |  2 +-
 arch/powerpc/perf/core-book3s.c               |  2 +-
 arch/powerpc/perf/generic-compat-pmu.c        |  2 +-
 arch/powerpc/perf/internal.h                  | 18 +++----
 arch/powerpc/perf/power10-pmu.c               |  2 +-
 arch/powerpc/perf/power5+-pmu.c               |  2 +-
 arch/powerpc/perf/power5-pmu.c                |  2 +-
 arch/powerpc/perf/power6-pmu.c                |  2 +-
 arch/powerpc/perf/power7-pmu.c                |  2 +-
 arch/powerpc/perf/power8-pmu.c                |  2 +-
 arch/powerpc/perf/power9-pmu.c                |  2 +-
 arch/powerpc/perf/ppc970-pmu.c                |  2 +-
 arch/powerpc/platforms/44x/fsp2.c             |  4 +-
 arch/powerpc/platforms/4xx/cpm.c              |  4 +-
 arch/powerpc/platforms/4xx/pci.c              |  2 +-
 arch/powerpc/platforms/512x/clock-commonclk.c | 52 +++++++++----------
 arch/powerpc/platforms/512x/mpc512x.h         |  4 +-
 arch/powerpc/platforms/512x/mpc512x_shared.c  |  4 +-
 arch/powerpc/platforms/83xx/km83xx.c          |  2 +-
 arch/powerpc/platforms/83xx/mpc834x_mds.c     |  2 +-
 arch/powerpc/platforms/83xx/mpc837x_mds.c     |  2 +-
 arch/powerpc/platforms/83xx/mpc837x_rdb.c     |  2 +-
 arch/powerpc/platforms/83xx/mpc83xx.h         |  6 +--
 arch/powerpc/platforms/83xx/usb.c             |  6 +--
 arch/powerpc/platforms/85xx/ge_imp3a.c        |  2 +-
 arch/powerpc/platforms/85xx/mpc85xx_cds.c     |  2 +-
 .../platforms/85xx/socrates_fpga_pic.c        |  2 +-
 .../platforms/85xx/socrates_fpga_pic.h        |  2 +-
 arch/powerpc/platforms/85xx/xes_mpc85xx.c     |  4 +-
 arch/powerpc/platforms/cell/cbe_regs.c        |  2 +-
 arch/powerpc/platforms/cell/iommu.c           | 14 ++---
 arch/powerpc/platforms/cell/spu_base.c        |  6 +--
 arch/powerpc/platforms/cell/spu_manage.c      | 16 +++---
 arch/powerpc/platforms/cell/spufs/inode.c     |  2 +-
 arch/powerpc/platforms/chrp/pegasos_eth.c     |  2 +-
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c |  4 +-
 arch/powerpc/platforms/embedded6xx/hlwd-pic.h |  2 +-
 arch/powerpc/platforms/embedded6xx/holly.c    |  2 +-
 .../platforms/embedded6xx/usbgecko_udbg.c     |  4 +-
 arch/powerpc/platforms/embedded6xx/wii.c      |  2 +-
 arch/powerpc/platforms/pasemi/msi.c           |  2 +-
 arch/powerpc/platforms/pasemi/pasemi.h        |  2 +-
 arch/powerpc/platforms/pasemi/pci.c           |  2 +-
 arch/powerpc/platforms/pasemi/setup.c         |  2 +-
 arch/powerpc/platforms/powermac/feature.c     |  2 +-
 arch/powerpc/platforms/powermac/nvram.c       |  2 +-
 arch/powerpc/platforms/powermac/pfunc_base.c  |  6 +--
 arch/powerpc/platforms/powermac/setup.c       |  6 +--
 arch/powerpc/platforms/powermac/smp.c         |  4 +-
 arch/powerpc/platforms/powermac/udbg_scc.c    |  2 +-
 arch/powerpc/platforms/powernv/idle.c         |  6 +--
 arch/powerpc/platforms/powernv/opal-core.c    |  6 +--
 arch/powerpc/platforms/powernv/opal-fadump.c  |  2 +-
 arch/powerpc/platforms/powernv/opal-msglog.c  |  4 +-
 arch/powerpc/platforms/powernv/opal-power.c   |  2 +-
 .../powerpc/platforms/powernv/opal-powercap.c |  2 +-
 arch/powerpc/platforms/powernv/opal-rtc.c     |  2 +-
 .../platforms/powernv/opal-sensor-groups.c    |  4 +-
 arch/powerpc/platforms/powernv/opal.c         |  8 +--
 arch/powerpc/platforms/powernv/pci-ioda.c     |  4 +-
 arch/powerpc/platforms/powernv/powernv.h      |  4 +-
 arch/powerpc/platforms/powernv/rng.c          |  2 +-
 arch/powerpc/platforms/powernv/setup.c        |  6 +--
 arch/powerpc/platforms/ps3/gelic_udbg.c       |  2 +-
 arch/powerpc/platforms/ps3/mm.c               |  4 +-
 arch/powerpc/platforms/ps3/os-area.c          |  4 +-
 arch/powerpc/platforms/ps3/platform.h         | 14 ++---
 arch/powerpc/platforms/ps3/repository.c       | 20 +++----
 arch/powerpc/platforms/ps3/smp.c              |  2 +-
 arch/powerpc/platforms/ps3/spu.c              |  2 +-
 .../powerpc/platforms/pseries/event_sources.c |  2 +-
 arch/powerpc/platforms/pseries/iommu.c        |  2 +-
 arch/powerpc/platforms/pseries/lpar.c         |  6 +--
 arch/powerpc/platforms/pseries/pseries.h      |  2 +-
 arch/powerpc/platforms/pseries/rtas-fadump.c  |  6 +--
 arch/powerpc/platforms/pseries/setup.c        |  4 +-
 arch/powerpc/platforms/pseries/vas.c          |  2 +-
 arch/powerpc/platforms/pseries/vio.c          |  6 +--
 arch/powerpc/sysdev/cpm2.c                    |  6 +--
 arch/powerpc/sysdev/dart_iommu.c              |  2 +-
 arch/powerpc/sysdev/fsl_mpic_err.c            |  4 +-
 arch/powerpc/sysdev/fsl_pci.c                 |  2 +-
 arch/powerpc/sysdev/fsl_pci.h                 |  2 +-
 arch/powerpc/sysdev/i8259.c                   |  2 +-
 arch/powerpc/sysdev/ipic.c                    |  2 +-
 arch/powerpc/sysdev/mpic.c                    |  2 +-
 arch/powerpc/sysdev/mpic.h                    | 10 ++--
 arch/powerpc/sysdev/mpic_msi.c                |  6 +--
 arch/powerpc/sysdev/mpic_timer.c              |  6 +--
 arch/powerpc/sysdev/mpic_u3msi.c              |  2 +-
 arch/powerpc/sysdev/tsi108_pci.c              |  2 +-
 arch/powerpc/sysdev/udbg_memcons.c            |  2 +-
 arch/powerpc/sysdev/xics/icp-hv.c             |  2 +-
 arch/powerpc/sysdev/xics/icp-opal.c           |  2 +-
 arch/powerpc/sysdev/xics/xics-common.c        |  2 +-
 arch/powerpc/sysdev/xive/native.c             |  4 +-
 arch/powerpc/sysdev/xive/spapr.c              |  6 +--
 arch/powerpc/xmon/xmon.c                      |  2 +-
 include/linux/cuda.h                          |  2 +-
 include/linux/pmu.h                           |  2 +-
 150 files changed, 335 insertions(+), 334 deletions(-)

-- 
2.25.1

