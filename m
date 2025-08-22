Return-Path: <linuxppc-dev+bounces-11192-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB20B31CEF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:57:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jw63xrkz3chF;
	Sat, 23 Aug 2025 00:57:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874646;
	cv=none; b=a6Gt+Resl0/EPdcYfy6g9MU90RFe4zbY03xC/GvsI4MHFvvhDfr9Re457076K17dJmp5Vm5Q+dBVXCaAh4RFfqPKfiFsRiJ0+mN2jfFtPold1vuxHed3erh4rKgPREm2ag53mBA/VevsS8N2AQJwVJSwVp6sVgMcfZnAYFhR2G0uP4JPus4jHwYUnxxtgqhCN2RSEn7FW+NZvDG9OG0ngoiY0ZnxBkDk21OwdkyYu6S8J18rzXSHKcfLv7Nhxtf2vHxRQPGVX/VA0TdV2kyJVxu9pxexpWf5oB9jAnKaLvrgkGY9b9KtgZ459X6quHQtEhmrnnOB1Yhct0Q+i+8Tqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874646; c=relaxed/relaxed;
	bh=Qq93kCQM50c4ZEruSWjaQwToRFI1zbkXpmAhezXWxzE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Zb/Duxmf5Rdh68DbPlWVZvIo543b8m1RZjp5DeU4bZUcGym7kjsWTHZ74yiwBzetXjxHCFzG26vA9BcR8GsPVxbfZy2b1KFrNKIqJnQkw3EgmVxLYTBYSrA9gdcFOKFKZs9HjIPLwL+DkXkKsZW3B7AwyslU72d05bjILxp1JA+HBfTSMDLbuyn871XUn0gczR3gmmaKJkVcLNmsp7fne7kA56cPiNWhIs5Kv2tHNQBC2+xS+7TSOsNCqy3fKlq9TqqpGBfbLSRepJPxYtxfvilY0O4Fx+8ffSjS+tMZ1z1U/SvbNLr0eC0wfwWlfA3cqv/+d1zwVl+qWwNCrnON2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a4/J5M0u; dkim-atps=neutral; spf=none (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a4/J5M0u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Sat, 23 Aug 2025 00:57:24 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jw40GRTz3cgt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:57:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874644; x=1787410644;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RvRkItUYJ0ETFE5CancMO5F68qXMPOtLToh8/qa/woA=;
  b=a4/J5M0uqEqeO3pwDON1fGDKGtEWE/2mi5nHk1E1w24jfsKlw/j7Pw+h
   AMjJkUrnqtXlFDkTaIdQ2BJS+Mrun6CE2L/gjXnCJCNBg9z6HG8Bcq16D
   zUsM8eolrWlkvKLKWlGofXUjGjA326VqsstX0/4zY0UEfVT8bJ3FzFtn1
   TXKOIRz5kqgCXlcFL+w7JllLTOQHUYlFLJNgXykYrURCf4KDHT0f2jzQA
   /qWe4Ss6LUtrs0GZFLP/utmTWTaVOx0M1TnINeZnxvvXHzfxY+lOlRcPU
   szsMBfEsf+nn7BBYryzpP++sqZLuHymn6zh9AUEZjcfj9QqFQ//4/CEfz
   A==;
X-CSE-ConnectionGUID: DSLioqJDTOK1Ahjl9OSvwA==
X-CSE-MsgGUID: 2UTz8PI4R8m9VTVJYt5q4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69552238"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="69552238"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:56:17 -0700
X-CSE-ConnectionGUID: xkRYlbZZQ0K+NwgRSu7KdQ==
X-CSE-MsgGUID: 8+r9yxO9Rjy+vpGvbZE8yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="167956179"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:56:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andreas Larsson <andreas@gaisler.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-pci@vger.kernel.org,
	sparclinux@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Yinghai Lu <yinghai@kernel.org>,
	Igor Mammedov <imammedo@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 00/24] PCI: Bridge window selection improvements
Date: Fri, 22 Aug 2025 17:55:41 +0300
Message-Id: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series is based on top of the three resource fitting and
assignment algorithm fixes (v3).

PCI resource fitting and assignment code needs to find the bridge
window a resource belongs to in multiple places, yet, no common
function for that exists. Thus, each site has its own version of
the decision, each with their own corner cases, misbehaviors, and
some resulting in complex interfaces between internal functions.

This series tries to rectify the situation by adding two new functions
to select the bridge window. To support these functions, bridge windows
must always contain their type information in flags which requires
modifying the flags behavior for bridge window resources.

I've hit problems related to zeroed resource flags so many times by now
that I've already lost count which has highlighted over and over again
that clearing type information is not a good idea. As also proven by
some changes of this series, retaining the flags for bridge windows
ended up fixing existing issues (although kernel ended up recovering
from the worst problem graciously and the other just results in dormant
code).

This series only changes resource flags behavior for bridge windows.
The sensible direction is to make a similar change for the other
resources as well eventually but making that change involves more
uncertainty and is not strictly necessary yet. Driver code outside of
PCI core could have assumptions about the flags, whereas bridge windows
are mostly internal to PCI core code (or should be, sane endpoint
drivers shouldn't be messing with the bridge windows). Thus, limiting
the flags behavior changes to bridge windows for now is safer than
attempting full behavioral change in a single step.


I've tried to look out for any trouble that code under arch/ could
cause after the flags start to behave differently and therefore ended
up consolidating arch/ code to use pci_enable_resources(). My
impression is that strictly speaking only the MIPS code would break
similar to PCI core's copy of pci_enable_resources(), the others were
much more lax in checking so they'd likely keep working but
consolidation seemed still the best approach there as the enable checks
seemed diverging for no apparent reason.

Most sites are converted by this change. There are three known places
that are not yet converted:

  - fail_type based logic in __assign_resources_sorted():
    I'm expecting to cover this along with the resizable BAR
    changes as I need to change the fallback logic anyway (one
    of the motivators what got me started with this series,
    I need an easy way to acquire the bridge window during
    retries/fallbacks if maximum sized BARs do not fit, which
    is what this series provides).

  - Failure detection after BAR resize: Keeps using the type
    based heuristic for failure detection. It isn't very clear how
    to decide which assignment failures should be counted and which
    not. There could be pre-existing failures that keep happening
    that end up blocking BAR resize but that's no worse than behavior
    before this series. How to identify the relevant failures does
    not look straightforward given the current structures. This
    clearly needs more thought before coding any solution.

  - resource assignment itself: This is a very complex change
    due to bus and kernel resources abstractions and might not be
    realistic any time soon.

I'd have wanted to also get rid of pci_bridge_check_ranges() that
(re)adds type information which seemed now unnecessary. It turns out,
however, that root windows still require so it will have to wait for
now.

This change has been tested on a large number of machine I've access to
which come with heterogeneous PCI configurations. Some resources
retained their original addresses now also with pci=realloc because
this series fixed the unnecessary release(+assign) of those resources.
Other than that, nothing worth of note from that testing.


My test coverage is x86 centric unfortunately so I'd appreciate if
somebody with access to non-x86 archs takes the effort to test this
series.

Info for potential testers:

Usually, it's enough to gather lspci -vvv pre and post the series, and
use diff to see whether the resources remained the same and also check
that the same drivers are still bound to the devices to confirm that
devices got properly enabled (also shown by lspci -vvv). I normally
test both with and without pci=realloc. In case of a trouble, besides
lspci -vvv output, providing pre and post dmesg and /proc/iomem
contents would be helpful, please take the dmesg with dyndbg="file
drivers/pci/*.c +p" on the kernel cmdline.

Ilpo Järvinen (24):
  m68k/PCI: Use pci_enable_resources() in pcibios_enable_device()
  sparc/PCI: Remove pcibios_enable_device() as they do nothing extra
  MIPS: PCI: Use pci_enable_resources()
  PCI: Move find_bus_resource_of_type() earlier
  PCI: Refactor find_bus_resource_of_type() logic checks
  PCI: Always claim bridge window before its setup
  PCI: Disable non-claimed bridge window
  PCI: Use pci_release_resource() instead of release_resource()
  PCI: Enable bridge even if bridge window fails to assign
  PCI: Preserve bridge window resource type flags
  PCI: Add defines for bridge window indexing
  PCI: Add bridge window selection functions
  PCI: Fix finding bridge window in pci_reassign_bridge_resources()
  PCI: Warn if bridge window cannot be released when resizing BAR
  PCI: Use pbus_select_window() during BAR resize
  PCI: Use pbus_select_window_for_type() during IO window sizing
  PCI: Rename resource variable from r to res
  PCI: Use pbus_select_window() in space available checker
  PCI: Use pbus_select_window_for_type() during mem window sizing
  PCI: Refactor distributing available memory to use loops
  PCI: Refactor remove_dev_resources() to use pbus_select_window()
  PCI: Add pci_setup_one_bridge_window()
  PCI: Pass bridge window to pci_bus_release_bridge_resources()
  PCI: Alter misleading recursion to pci_bus_release_bridge_resources()

 arch/m68k/kernel/pcibios.c   |  39 +-
 arch/mips/pci/pci-legacy.c   |  38 +-
 arch/sparc/kernel/leon_pci.c |  27 --
 arch/sparc/kernel/pci.c      |  27 --
 arch/sparc/kernel/pcic.c     |  27 --
 drivers/pci/bus.c            |   3 +
 drivers/pci/pci-sysfs.c      |  27 +-
 drivers/pci/pci.h            |   8 +-
 drivers/pci/probe.c          |  35 +-
 drivers/pci/setup-bus.c      | 798 ++++++++++++++++++-----------------
 drivers/pci/setup-res.c      |  46 +-
 include/linux/pci.h          |   5 +-
 12 files changed, 504 insertions(+), 576 deletions(-)


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
prerequisite-patch-id: 801e8dd3aa9847d4945cb7d8958574a6006004ab
prerequisite-patch-id: 0233311f04e3ea013676b6cc00626410bbe11e41
prerequisite-patch-id: 9841faf37d56c1acf1167559613e862ef62e509d
-- 
2.39.5


