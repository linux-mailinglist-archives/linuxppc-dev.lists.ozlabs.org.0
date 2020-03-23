Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E75718F698
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 15:11:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mGWf1qHQzDr68
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 01:11:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=qais.yousef@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48mG4m2TjyzDqYt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 00:51:18 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2962E1FB;
 Mon, 23 Mar 2020 06:51:17 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82C293F52E;
 Mon, 23 Mar 2020 06:51:14 -0700 (PDT)
From: Qais Yousef <qais.yousef@arm.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v4 00/17] Convert cpu_up/down to device_online/offline
Date: Mon, 23 Mar 2020 13:50:53 +0000
Message-Id: <20200323135110.30522-1-qais.yousef@arm.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Juergen Gross <jgross@suse.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Catalin Marinas <catalin.marinas@arm.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, Mark Rutland <mark.rutland@arm.com>,
 linuxppc-dev@lists.ozlabs.org, Qais Yousef <qais.yousef@arm.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

=============
Changes in v4
=============

	* Split arm and arm64 patches so that the change to use reboot_cpu goes
	  into its own separate patch (Russell)
	* Collected new Acked-by
	* Rebased on top of v5.6-rc6
	* Trimmed the CC list on the cover letter as lists were rejecting it


	git clone git://linux-arm.org/linux-qy.git -b cpu-hp-cleanup-v4


Older post can be found here
----------------------------

	https://lore.kernel.org/lkml/20200223192942.18420-2-qais.yousef@arm.com/


=============
Test Coverage
=============

	All tests ran with LOCKDEP enabled.

Platform: Juno-r2: arm64
------------------------

	* Overnight rcutorture
	* Overnight locktorture
	* kexec -f Image --command="$(cat /proc/cmdline) reboot=s[0-5]"
	* Hibernate to disk (using suspend option)
	* Userspace hotplug via sysfs
	* PSCI firemware checker

Notes:

	* Couldn't convince Juno to hibernate using [reboot] or [shutdown]
	  options.

Platform: qemu (8 vCPUs) and VM (2 vCPUs): x86_64
-------------------------------------------------

	* Overnight rcutorture
	* Overnight locktorture
	* Userspace hotplug via sysfs
	* echo mmiotrace > /sys/kernel/debug/tracing/current_tracer &&
	  echo nop > /sys/kernel/debug/tracing/current_tracer
	* Ran with CONFIG_DEBUG_HOTPLUG_CPU0 and CONFIG_BOOTPARAM_HOTPLUG_CPU0

Notes:

	* qemu failed to bring cpu0 after offlining. Same behavior observed on
	  vanilla v5.6-rc6. Worked fine on the VM.

	* mmiotrace successfully brought down all cpus when enabled,
	  then back online again when disabled. Including when cpu0 was
	  offline.

	* My xen shenanigans are too 'humble' too create environment to test
	  the change in xen yet..


=====================
Original Cover Letter
=====================

Using cpu_up/down directly to bring cpus online/offline loses synchronization
with sysfs and could suffer from a race similar to what is described in
commit a6717c01ddc2 ("powerpc/rtas: use device model APIs and serialization
during LPM").

cpu_up/down seem to be more of a internal implementation detail for the cpu
subsystem to use to boot up cpus, perform suspend/resume and low level hotplug
operations. Users outside of the cpu subsystem would be better using the device
core API to bring a cpu online/offline which is the interface used to hotplug
memory and other system devices.

Several users have already migrated to use the device core API, this series
converts the remaining users and hides cpu_up/down from internal users at the
end.

I noticed this problem while working on a hack to disable offlining
a particular CPU but noticed that setting the offline_disabled attribute in the
device struct isn't enough because users can easily bypass the device core.
While my hack isn't a valid use case but it did highlight the inconsistency in
the way cpus are being onlined/offlined and this attempt hopefully improves on
this.

The first patch introduces new API to {add,remove}_cpu() using device_{online,
offline}() with correct locks held and export it.

The following 10 patches fix arch users.

The remaining 6 patches fix generic code users. Particularly creating a new
special exported API for the device core to use instead of cpu_up/down.

The last patch removes cpu_up/down from cpu.h and unexport the functions.

In some cases where the use of cpu_up/down seemed legitimate, I encapsulated
the logic in a higher level - special purposed function; and converted the code
to use that instead.


CC: Thomas Gleixner <tglx@linutronix.de>
CC: Tony Luck <tony.luck@intel.com>
CC: Fenghua Yu <fenghua.yu@intel.com>
CC: Russell King <linux@armlinux.org.uk>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: "David S. Miller" <davem@davemloft.net>
CC: Helge Deller <deller@gmx.de>
CC: Juergen Gross <jgross@suse.com>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
CC: "Paul E. McKenney" <paulmck@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: xen-devel@lists.xenproject.org
CC: linux-parisc@vger.kernel.org
CC: sparclinux@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: x86@kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-ia64@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Qais Yousef (17):
  cpu: Add new {add,remove}_cpu() functions
  smp: Create a new function to shutdown nonboot cpus
  ia64: Replace cpu_down with smp_shutdown_nonboot_cpus()
  arm: Don't use disable_nonboot_cpus()
  arm: Use reboot_cpu instead of hardcoding it to 0
  arm64: Don't use disable_nonboot_cpus()
  arm64: Use reboot_cpu instead of hardconding it to 0
  arm64: hibernate.c: Create a new function to handle cpu_up(sleep_cpu)
  x86: Replace cpu_up/down with add/remove_cpu
  powerpc: Replace cpu_up/down with add/remove_cpu
  sparc: Replace cpu_up/down with add/remove_cpu
  parisc: Replace cpu_up/down with add/remove_cpu
  driver: xen: Replace cpu_up/down with device_online/offline
  firmware: psci: Replace cpu_up/down with add/remove_cpu
  torture: Replace cpu_up/down with add/remove_cpu
  smp: Create a new function to bringup nonboot cpus online
  cpu: Hide cpu_up/down

 arch/arm/kernel/reboot.c             |   4 +-
 arch/arm64/kernel/hibernate.c        |  13 +--
 arch/arm64/kernel/process.c          |   4 +-
 arch/ia64/kernel/process.c           |   8 +-
 arch/parisc/kernel/processor.c       |   2 +-
 arch/powerpc/kexec/core_64.c         |   2 +-
 arch/sparc/kernel/ds.c               |   4 +-
 arch/x86/kernel/topology.c           |  22 ++---
 arch/x86/mm/mmio-mod.c               |   4 +-
 arch/x86/xen/smp.c                   |   2 +-
 drivers/base/cpu.c                   |   4 +-
 drivers/firmware/psci/psci_checker.c |   4 +-
 drivers/xen/cpu_hotplug.c            |   2 +-
 include/linux/cpu.h                  |  10 +-
 kernel/cpu.c                         | 134 ++++++++++++++++++++++++++-
 kernel/smp.c                         |   9 +-
 kernel/torture.c                     |   9 +-
 17 files changed, 172 insertions(+), 65 deletions(-)

-- 
2.17.1

