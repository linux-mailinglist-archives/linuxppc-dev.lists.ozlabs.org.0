Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE27735502C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 11:37:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF2W856SHz3cFV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 19:37:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF2Tl5d7yz3035
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 19:36:27 +1000 (AEST)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58EED6135D;
 Tue,  6 Apr 2021 09:36:24 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lTi8E-005owA-4b; Tue, 06 Apr 2021 10:36:22 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org
Subject: [PATCH 0/9] Cleaning up some of the irqdomain features
Date: Tue,  6 Apr 2021 10:35:48 +0100
Message-Id: <20210406093557.1073423-1-maz@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, daniel@zonque.org,
 robert.jarzmik@free.fr, haojian.zhuang@gmail.com, ysato@users.sourceforge.jp,
 dalias@libc.org, tsbogend@alpha.franken.de, mpe@ellerman.id.au,
 tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Daniel Mack <daniel@zonque.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The irqdomain subsystem has grown quite a lot over the years, and some
of its features are either oddly used or just pretty useless. Some
other helpers expose internals that are likely to change soon.

Here are the bits that I'm trying to get rid of:

- irq_linear_revmap exposes the internals of the domains, and only
  works for linear domains. The supposed speed improvement really
  isn't an argument, as it gets in the way of more significant
  optimisations. Reimplemented in terms of irq_find_mapping, which
  always works, and will eventually go at some point.

- irq_create_strict_mappings is just a way to constraint the
  allocation of irqdescs into a given range, which is better served by
  creating a legacy irqdomain, and shows that the platform really
  needs to catch up with the 21st century.

- irq_create_identity mapping is just a variation on the above, with
  irq==hwirq, although the way it is used is a gross hack in the SH
  code that needs to go.

- irq_domain_add_legacy_isa is, as the names shows, a variation on
  irq_domain_add_legacy with a reservation of 16 interrupts. This is
  only used in the PPC code.

The patches address all of the above, touching some of the ARM, PPC,
and SH code that is affected. Another couple of patches address a MIPS
platform that could use the generic code, and clean some of the
comments in the irqdomain code.

Unless anyone shouts, I'd like to take this into 5.13, as it is the
basis of some further (and deeper) changes in the way irqdomains work.

	M.

Marc Zyngier (9):
  irqdomain: Reimplement irq_linear_revmap() with irq_find_mapping()
  ARM: PXA: Kill use of irq_create_strict_mappings()
  irqchip/jcore-aic: Kill use of irq_create_strict_mappings()
  sh: intc: Drop the use of irq_create_identity_mapping()
  irqdomain: Kill
    irq_create_strict_mappings()/irq_create_identity_mapping()
  mips: netlogic: Use irq_domain_simple_ops for XLP PIC
  irqdomain: Drop references to recusive irqdomain setup
  powerpc: Convert irq_domain_add_legacy_isa use to
    irq_domain_add_legacy
  irqdomain: Kill irq_domain_add_legacy_isa

 Documentation/core-api/irq/irq-domain.rst |  1 -
 arch/arm/mach-pxa/pxa_cplds_irqs.c        | 24 +++++------
 arch/mips/netlogic/common/irq.c           |  6 +--
 arch/powerpc/include/asm/irq.h            |  4 +-
 arch/powerpc/platforms/ps3/interrupt.c    |  4 +-
 arch/powerpc/sysdev/i8259.c               |  3 +-
 arch/powerpc/sysdev/mpic.c                |  2 +-
 arch/powerpc/sysdev/tsi108_pci.c          |  3 +-
 arch/powerpc/sysdev/xics/xics-common.c    |  2 +-
 drivers/irqchip/irq-jcore-aic.c           |  4 +-
 drivers/sh/intc/core.c                    | 50 ++++++++++-------------
 include/linux/irqdomain.h                 | 42 ++++---------------
 kernel/irq/irqdomain.c                    | 49 +++-------------------
 13 files changed, 59 insertions(+), 135 deletions(-)

-- 
2.29.2

