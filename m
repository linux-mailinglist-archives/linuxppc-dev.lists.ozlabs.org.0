Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33479692586
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:43:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD2fq08Hzz3f7s
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 05:42:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FTdZIJb2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FTdZIJb2;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD2dt1ccCz3bVP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 05:42:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB44361E86;
	Fri, 10 Feb 2023 18:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A4E2C433D2;
	Fri, 10 Feb 2023 18:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676054527;
	bh=PknwGmEPHTjSZQIYe2wgrB2bMv2yoUBHoujD4AnIk+A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FTdZIJb2xJu7JfS9UxC0pm1Mhgs1ENKvmpWad/TSBxjbWHG4mAB00lfTuN9E6G8Aj
	 cm1TzJ8+myQleysQT/tCzhXNz8p/yNh7kaatDkckXtiVjUoTFWNCjAYFjHWLKnvAZj
	 1ECKrPx0NLCEEfGM6vAJMmFERouTZGWMUsH5JkeGD2nqRbGHP8k1va7KJLQa52jLg4
	 LxmafXLJ+G8bpsSLUWkRj8mmYtofK8Bv9+ix7KWdk1hRvQUYwqCGIG5K5lwrOBaDcp
	 aYPYi7tAnjHDWi36Sw7QIyUt9K0m7ebeBOlpuViOsemILcmk16WeRh97GFZSIWwXUM
	 U02bs9bRnCYVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE8FC636CD;
	Fri, 10 Feb 2023 18:42:07 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Subject: [PATCH v3 00/20] RTAS maintenance
Date: Fri, 10 Feb 2023 12:41:48 -0600
Message-Id: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOyP5mMC/32Oyw6CMBREf4V07SV9UARX/odx0ZaLNIGCLSCG8
 O8WEjcuXM4kZ86sJKC3GMglWYnH2QbbuxjEKSGmUe6BYKuYCadcUMYl6AyG/oV+MOBHFeA54YR
 g6kKiyXJZ1yWJrFYBQXvlTBNpN7VtLAePtV0O2e0ec2PD2Pv34Z7Z3u4azhgrmKRnydIsL0Upg
 IFTY3zTXlvrpiW1uktN35F9ZOZf8N+/mQOFUqlcV1QWNBe/S9u2fQB9+jGEDAEAAA==
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676054526; l=7316;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=PknwGmEPHTjSZQIYe2wgrB2bMv2yoUBHoujD4AnIk+A=;
 b=wCqha5V1oepJ9NuDCh5S6QdAiBgPtw1TuiUM7nZCcs5FgvSP2n4GK0CSO35up7t7vooKEsoHu
 GYQ6YSjCyk7CejJe+DMvil4CuuIZeidBqZomYlXujsNcJRk324sWCxw
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=6daubz/ymoaMF+8voz7UHwnhluEsmDZuqygIIMWpQQY=
X-Endpoint-Received:  by B4 Submission Endpoint for nathanl@linux.ibm.com/20230206 with auth_id=27
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Proposed changes for the RTAS subsystem and client code.

Fixes that are subject to backporting are at the front of the queue.
The rest of the queue is roughly ordered with respect to maturity:
i.e. patches that have already garnered some review and discussion
precede newer, more experimental changes.

Major features:

* Static tracepoints around RTAS entry/exit.
* An allocator for work area buffers.
* A new client of the work area allocator in the form of a
  higher-level API for PAPR system parameter retrieval.
* Constant-time symbolic RTAS function token lookups.

Tested with ppc64le in PowerVM LPARs and QEMU's pseries
model. Obsolescent RTAS platforms (chrp, cell, maple) get build
coverage.

---
Changes in v3:

* Additions:
  - Ensure 4KB alignment for rtas_data_buf.

* Modifications to existing patches (all per Michael Ellerman)
  - Rename "ret" to "retry" in rtas_busy_delay_early().
  - Reset the stuck counter when rtas_busy_delay_early() warns.
  - Explain addition of __ref to rtas_busy_delay().
  - Spell out function index constants instead of cpp-pasting.
  - Use more conventional header inclusion guards in new heaaders.
  - Align early_work_area_buf.
  - Prevent bad arguments to rtas_work_area_alloc() with a
    compile-time assertion.
  - Discard pr_devel() from rtas-work-area.c.
  - Access work area allocator state through a single struct instead
    of a pointer indirection.
  - Initialize work area descriptors more conventionally.
  - Ensure rtas_function_token() returns RTAS_UNKNOWN_SERVICE on
    non-RTAS platforms.
  - Move rtas-work-area.c to platforms/pseries/ and initialize it on
    pseries only.
* Link to v2: https://lore.kernel.org/r/20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com

Changes in v2:

* Drop applied patches:
  - powerpc/rtas: document rtas_call()
  - powerpc/rtasd: use correct OF API for event scan rate
  - powerpc/rtas: avoid device tree lookups in rtas_os_term()
  - powerpc/rtas: avoid scheduling in rtas_os_term()
  - powerpc/pseries/eeh: use correct API for error log size
  - powerpc/rtas: clean up rtas_error_log_max initialization
  - powerpc/rtas: clean up includes
  - powerpc/rtas: define pr_fmt and convert printk call sites
  - powerpc/rtas: mandate RTAS syscall filtering

* Additions:
  - Safe early-boot fallback in rtas_busy_delay().
  - Fixes for missed RTAS function call retries in various places.
  - Remove RTAS timebase sync from pseries, previously posted
    separately as "powerpc/pseries: drop RTAS-based timebase
    synchronization":
    https://lore.kernel.org/linuxppc-dev/20230110042845.121792-1-nathanl@linux.ibm.com/T/#u
  - RTAS work area buffer allocator.
  - Conversion of pseries DLPAR code to work area allocator.
  - A pseries-specific PAPR system parameter API built on top of the
    RTAS work area allocator.
  - Conversion of ibm,get-system-parameter users to papr_sysparm API.
  - New rtas_function_token() API and associated conversions.

* Modifications to existing patches:
  - Convert RTAS tracepoint definitions to unconditional
    variants (TRACE_EVENT_CONDITION() -> TRACE_EVENT()), dropping a
    cpu_online() check that duplicates work already done at the call
    site.
  - Skip tracepoints in unsafe contexts (real mode, CPU
    offline). (Nicholas Piggin)
  - Use bool bitfield for "banned on LE" function flag.
  - Better documentation for "banned on LE" function flag. (Andrew Donnellan)
  - Drop unnecessary cast for xa_load() key argument. (Nick Child)

* Link to v1: https://lore.kernel.org/r/20221118150751.469393-1-nathanl@linux.ibm.com

---
Nathan Lynch (20):
      powerpc/rtas: handle extended delays safely in early boot
      powerpc/perf/hv-24x7: add missing RTAS retry status handling
      powerpc/pseries/lpar: add missing RTAS retry status handling
      powerpc/pseries/lparcfg: add missing RTAS retry status handling
      powerpc/pseries/setup: add missing RTAS retry status handling
      powerpc/rtas: ensure 4KB alignment for rtas_data_buf
      powerpc/pseries: drop RTAS-based timebase synchronization
      powerpc/rtas: improve function information lookups
      powerpc/rtas: strengthen do_enter_rtas() type safety, drop inline
      powerpc/tracing: tracepoints for RTAS entry and exit
      powerpc/rtas: add tracepoints around RTAS entry
      powerpc/pseries: add RTAS work area allocator
      powerpc/pseries/dlpar: use RTAS work area API
      powerpc/pseries: PAPR system parameter API
      powerpc/pseries: convert CMO probe to papr_sysparm API
      powerpc/pseries/lparcfg: convert to papr_sysparm API
      powerpc/pseries/hv-24x7: convert to papr_sysparm API
      powerpc/pseries/lpar: convert to papr_sysparm API
      powerpc/rtas: introduce rtas_function_token() API
      powerpc/rtas: arch-wide function token lookup conversions

 arch/powerpc/include/asm/papr-sysparm.h         |  38 +
 arch/powerpc/include/asm/rtas-work-area.h       |  96 +++
 arch/powerpc/include/asm/rtas.h                 | 184 +++++
 arch/powerpc/include/asm/trace.h                | 103 +++
 arch/powerpc/kernel/rtas-proc.c                 |  24 +-
 arch/powerpc/kernel/rtas-rtc.c                  |   6 +-
 arch/powerpc/kernel/rtas.c                      | 951 ++++++++++++++++++++----
 arch/powerpc/kernel/rtas_flash.c                |  21 +-
 arch/powerpc/kernel/rtas_pci.c                  |   8 +-
 arch/powerpc/kernel/rtasd.c                     |   2 +-
 arch/powerpc/perf/hv-24x7.c                     |  45 +-
 arch/powerpc/platforms/52xx/efika.c             |   4 +-
 arch/powerpc/platforms/cell/ras.c               |   4 +-
 arch/powerpc/platforms/cell/smp.c               |   4 +-
 arch/powerpc/platforms/chrp/nvram.c             |   4 +-
 arch/powerpc/platforms/chrp/pci.c               |   4 +-
 arch/powerpc/platforms/chrp/setup.c             |   4 +-
 arch/powerpc/platforms/maple/setup.c            |   4 +-
 arch/powerpc/platforms/pseries/Makefile         |   2 +-
 arch/powerpc/platforms/pseries/dlpar.c          |  29 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c    |  22 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c    |   4 +-
 arch/powerpc/platforms/pseries/io_event_irq.c   |   2 +-
 arch/powerpc/platforms/pseries/lpar.c           |  37 +-
 arch/powerpc/platforms/pseries/lparcfg.c        | 104 +--
 arch/powerpc/platforms/pseries/mobility.c       |   4 +-
 arch/powerpc/platforms/pseries/msi.c            |   4 +-
 arch/powerpc/platforms/pseries/nvram.c          |   4 +-
 arch/powerpc/platforms/pseries/papr-sysparm.c   | 151 ++++
 arch/powerpc/platforms/pseries/pci.c            |   2 +-
 arch/powerpc/platforms/pseries/ras.c            |   2 +-
 arch/powerpc/platforms/pseries/rtas-work-area.c | 209 ++++++
 arch/powerpc/platforms/pseries/setup.c          |  27 +-
 arch/powerpc/platforms/pseries/smp.c            |  12 +-
 arch/powerpc/sysdev/xics/ics-rtas.c             |   8 +-
 arch/powerpc/xmon/xmon.c                        |  16 +-
 36 files changed, 1717 insertions(+), 428 deletions(-)
---
base-commit: 0bfb97203f5f300777624a2ad6f8f84aea3e8658
change-id: 20230125-b4-powerpc-rtas-queue-cf85ec465ff9

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

