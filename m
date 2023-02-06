Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0D468C65F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 20:03:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9bHz30Lfz3ccn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 06:03:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RWQPfsel;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RWQPfsel;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9b5y40fDz3cMn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 05:54:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5802BB815C2;
	Mon,  6 Feb 2023 18:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F8BFC433EF;
	Mon,  6 Feb 2023 18:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675709665;
	bh=wq37oRMfEAOKfFU8vXR47uunp3Y8BkUds7FY3ZDc+Dg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=RWQPfselw8nfyRnVd/RRTrfFOpplMog+Rm5PFZcaGPhClBf4RrxRJRaycocz2kFFI
	 vnjd3T0T93TW10GiCl7D365F/Y3M9jktsjidcrxv7Eu0EvANHaGC++g2KIN1f4Lrg2
	 IR+k03QsdB4lVbBpsOfEbOTn9OMxz8EJgLdUGcH3STTYCx/RiSDZ5sxVzI+St9LbNT
	 Vwy5sMYG0INQUk5LKThaholJUQ62VQyiV0Phjdggd3zRgXColKYD9PQP+rLIC1leRa
	 nmoEloNwFQRE1GoYZ0g2bEv8iFFiJrHxvDwQuRNQsm0RzBjCDU7y22yB5NlYysEIpb
	 nTtqLCrCHLsbQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E5AC636D3;
	Mon,  6 Feb 2023 18:54:24 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Subject: [PATCH v2 00/19] RTAS maintenance
Date: Mon, 06 Feb 2023 12:54:16 -0600
Message-Id: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANhM4WMC/x2OQQ6DIBQFr2JY9xtBsdpV79G4APqpJBQsiLUx3
 r3ociZ5mbeRiMFgJLdiIwEXE413GdilIGoU7oVgnpkJq1hdUcZBNjD5L4ZJQZhFhE/ChKB0x1E
 1Lde6J3krRUSQQTg15rVL1mY5BdRmPWOPIfNo4uzD72wv9LBHhlFKO8qrK6dl0/Z1XwMFJ+b8x
 t6tcWktjXyXyr/JsO/7H3cymp7CAAAA
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675709663; l=6172;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=wq37oRMfEAOKfFU8vXR47uunp3Y8BkUds7FY3ZDc+Dg=;
 b=XgsHIJnHQNmGQvEYO7aEc9fqjPmye4UN5QRmIZ0ZhykRrx3RjKlmGfPu6BZ6LnCgZPqVMA0BF
 maslNQ74aegCkp/wj5kxk4GDARMdhl1EV/jT3ON6RncRMEK6orM259H
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
Nathan Lynch (19):
      powerpc/rtas: handle extended delays safely in early boot
      powerpc/perf/hv-24x7: add missing RTAS retry status handling
      powerpc/pseries/lpar: add missing RTAS retry status handling
      powerpc/pseries/lparcfg: add missing RTAS retry status handling
      powerpc/pseries/setup: add missing RTAS retry status handling
      powerpc/pseries: drop RTAS-based timebase synchronization
      powerpc/rtas: improve function information lookups
      powerpc/rtas: strengthen do_enter_rtas() type safety, drop inline
      powerpc/tracing: tracepoints for RTAS entry and exit
      powerpc/rtas: add tracepoints around RTAS entry
      powerpc/rtas: add work area allocator
      powerpc/pseries/dlpar: use RTAS work area API
      powerpc/pseries: PAPR system parameter API
      powerpc/pseries: convert CMO probe to papr_sysparm API
      powerpc/pseries/lparcfg: convert to papr_sysparm API
      powerpc/pseries/hv-24x7: convert to papr_sysparm API
      powerpc/pseries/lpar: convert to papr_sysparm API
      powerpc/rtas: introduce rtas_function_token() API
      powerpc/rtas: arch-wide function token lookup conversions

 arch/powerpc/include/asm/papr-sysparm.h       |  38 ++
 arch/powerpc/include/asm/rtas-work-area.h     |  45 ++
 arch/powerpc/include/asm/rtas.h               | 185 +++++
 arch/powerpc/include/asm/trace.h              | 103 +++
 arch/powerpc/kernel/Makefile                  |   3 +-
 arch/powerpc/kernel/rtas-proc.c               |  24 +-
 arch/powerpc/kernel/rtas-rtc.c                |   6 +-
 arch/powerpc/kernel/rtas-work-area.c          | 208 ++++++
 arch/powerpc/kernel/rtas.c                    | 942 +++++++++++++++++++++-----
 arch/powerpc/kernel/rtas_flash.c              |  21 +-
 arch/powerpc/kernel/rtas_pci.c                |   8 +-
 arch/powerpc/kernel/rtasd.c                   |   2 +-
 arch/powerpc/perf/hv-24x7.c                   |  45 +-
 arch/powerpc/platforms/52xx/efika.c           |   4 +-
 arch/powerpc/platforms/cell/ras.c             |   4 +-
 arch/powerpc/platforms/cell/smp.c             |   4 +-
 arch/powerpc/platforms/chrp/nvram.c           |   4 +-
 arch/powerpc/platforms/chrp/pci.c             |   4 +-
 arch/powerpc/platforms/chrp/setup.c           |   4 +-
 arch/powerpc/platforms/maple/setup.c          |   4 +-
 arch/powerpc/platforms/pseries/Makefile       |   2 +-
 arch/powerpc/platforms/pseries/dlpar.c        |  29 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c  |  22 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c  |   4 +-
 arch/powerpc/platforms/pseries/io_event_irq.c |   2 +-
 arch/powerpc/platforms/pseries/lpar.c         |  37 +-
 arch/powerpc/platforms/pseries/lparcfg.c      | 104 +--
 arch/powerpc/platforms/pseries/mobility.c     |   4 +-
 arch/powerpc/platforms/pseries/msi.c          |   4 +-
 arch/powerpc/platforms/pseries/nvram.c        |   4 +-
 arch/powerpc/platforms/pseries/papr-sysparm.c | 151 +++++
 arch/powerpc/platforms/pseries/pci.c          |   2 +-
 arch/powerpc/platforms/pseries/ras.c          |   2 +-
 arch/powerpc/platforms/pseries/setup.c        |  27 +-
 arch/powerpc/platforms/pseries/smp.c          |  12 +-
 arch/powerpc/sysdev/xics/ics-rtas.c           |   8 +-
 arch/powerpc/xmon/xmon.c                      |  16 +-
 37 files changed, 1660 insertions(+), 428 deletions(-)
---
base-commit: 0bfb97203f5f300777624a2ad6f8f84aea3e8658
change-id: 20230125-b4-powerpc-rtas-queue-cf85ec465ff9

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

