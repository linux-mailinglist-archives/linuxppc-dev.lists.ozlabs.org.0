Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D23BEA4FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 21:50:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473LFH3B6szF4mg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 07:50:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=qais.yousef@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 473CPT0MQyzF3JD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 02:41:59 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8EFD1FB;
 Wed, 30 Oct 2019 08:41:56 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6C8C3F6C4;
 Wed, 30 Oct 2019 08:41:50 -0700 (PDT)
From: Qais Yousef <qais.yousef@arm.com>
To: Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 00/12] Convert cpu_up/down to device_online/offline
Date: Wed, 30 Oct 2019 15:38:25 +0000
Message-Id: <20191030153837.18107-1-qais.yousef@arm.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 31 Oct 2019 07:48:50 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org,
 linux-ia64@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Richard Fontana <rfontana@redhat.com>, Nadav Amit <namit@vmware.com>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Helge Deller <deller@gmx.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Qais Yousef <qais.yousef@arm.com>,
 Eiichi Tsukata <devel@etsukata.com>, Catalin Marinas <catalin.marinas@arm.com>,
 xen-devel@lists.xenproject.org, Fenghua Yu <fenghua.yu@intel.com>,
 Juergen Gross <jgross@suse.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>, Nicholas Piggin <npiggin@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Pavankumar Kondeti <pkondeti@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 linux-parisc@vger.kernel.org, Steve Capper <steve.capper@arm.com>,
 Jiri Kosina <jkosina@suse.cz>, linuxppc-dev@lists.ozlabs.org,
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, Armijn Hemel <armijn@tjaldur.nl>,
 James Morse <james.morse@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

I still need to update the documentation to remove references to cpu_up/down
and advocate for device_online/offline instead if this series will make its way
through.

I noticed this problem while working on a hack to disable offlining
a particular CPU but noticed that setting the offline_disabled attribute in the
device struct isn't enough because users can easily bypass the device core.
While my hack isn't a valid use case but it did highlight the inconsistency in
the way cpus are being onlined/offlined and this attempt hopefully improves on
this.

The first 6 patches fixes arch users.

The next 5 patches fixes generic code users. Particularly creating a new
special exported API for the device core to use instead of cpu_up/down.
Maybe we can do something more restrictive than that.

The last patch removes cpu_up/down from cpu.h and unexport the functions.

In some cases where the use of cpu_up/down seemed legitimate, I encapsulated
the logic in a higher level - special purposed function; and converted the code
to use that instead.

I did run the rcu torture, lock torture and psci checker tests and no problem
was noticed. I did perform build tests on all arch affected except for parisc.

Hopefully I got the CC list right for all the patches. Apologies in advance if
some people were omitted from some patches but they should have been CCed.

CC: Armijn Hemel <armijn@tjaldur.nl>
CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
CC: Bjorn Helgaas <bhelgaas@google.com>
CC: Borislav Petkov <bp@alien8.de>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Christophe Leroy <christophe.leroy@c-s.fr>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Davidlohr Bueso <dave@stgolabs.net>
CC: "David S. Miller" <davem@davemloft.net>
CC: Eiichi Tsukata <devel@etsukata.com>
CC: Enrico Weigelt <info@metux.net>
CC: Fenghua Yu <fenghua.yu@intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Helge Deller <deller@gmx.de>
CC: "H. Peter Anvin" <hpa@zytor.com>
CC: Ingo Molnar <mingo@kernel.org>
CC: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
CC: James Morse <james.morse@arm.com>
CC: Jiri Kosina <jkosina@suse.cz>
CC: Josh Poimboeuf <jpoimboe@redhat.com>
CC: Josh Triplett <josh@joshtriplett.org>
CC: Juergen Gross <jgross@suse.com>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Nadav Amit <namit@vmware.com>
CC: Nicholas Piggin <npiggin@gmail.com>
CC: "Paul E. McKenney" <paulmck@kernel.org>
CC: Paul Mackerras <paulus@samba.org>
CC: Pavankumar Kondeti <pkondeti@codeaurora.org>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Ram Pai <linuxram@us.ibm.com>
CC: Richard Fontana <rfontana@redhat.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Steve Capper <steve.capper@arm.com>
CC: Thiago Jung Bauermann <bauerman@linux.ibm.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Tony Luck <tony.luck@intel.com>
CC: Will Deacon <will@kernel.org>
CC: Zhenzhong Duan <zhenzhong.duan@oracle.com>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-ia64@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-parisc@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: sparclinux@vger.kernel.org
CC: x86@kernel.org
CC: xen-devel@lists.xenproject.org


Qais Yousef (12):
  arm64: hibernate.c: create a new function to handle cpu_up(sleep_cpu)
  x86: Replace cpu_up/down with devcie_online/offline
  powerpc: Replace cpu_up/down with device_online/offline
  ia64: Replace cpu_down with freeze_secondary_cpus
  sparc: Replace cpu_up/down with device_online/offline
  parisc: Replace cpu_up/down with device_online/offline
  driver: base: cpu: export device_online/offline
  driver: xen: Replace cpu_up/down with device_online/offline
  firmware: psci: Replace cpu_up/down with device_online/offline
  torture: Replace cpu_up/down with device_online/offline
  smp: Create a new function to bringup nonboot cpus online
  cpu: Hide cpu_up/down

 arch/arm64/kernel/hibernate.c          | 13 +++----
 arch/ia64/kernel/process.c             |  8 +---
 arch/parisc/kernel/processor.c         |  4 +-
 arch/powerpc/kernel/machine_kexec_64.c |  4 +-
 arch/sparc/kernel/ds.c                 |  8 +++-
 arch/x86/kernel/topology.c             |  4 +-
 arch/x86/mm/mmio-mod.c                 |  8 +++-
 arch/x86/xen/smp.c                     |  4 +-
 drivers/base/core.c                    |  4 ++
 drivers/base/cpu.c                     |  4 +-
 drivers/firmware/psci/psci_checker.c   |  6 ++-
 drivers/xen/cpu_hotplug.c              |  2 +-
 include/linux/cpu.h                    |  6 ++-
 kernel/cpu.c                           | 53 ++++++++++++++++++++++++--
 kernel/smp.c                           |  9 +----
 kernel/torture.c                       | 15 ++++++--
 16 files changed, 106 insertions(+), 46 deletions(-)

-- 
2.17.1

