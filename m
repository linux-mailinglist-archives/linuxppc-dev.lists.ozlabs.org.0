Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AFDEAB2A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 08:57:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473d340sG5zF56q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 18:57:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.44.159; helo=7.mo173.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4717 seconds by postgrey-1.36 at bilbo;
 Thu, 31 Oct 2019 18:55:52 AEDT
Received: from 7.mo173.mail-out.ovh.net (7.mo173.mail-out.ovh.net
 [46.105.44.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473d141yJqzF5bN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 18:55:47 +1100 (AEDT)
Received: from player796.ha.ovh.net (unknown [10.109.159.224])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 997AB11BA21
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 07:37:05 +0100 (CET)
Received: from kaod.org (ppp-seco11pareq2-46-193-129-117.wb.wifirst.net
 [46.193.129.117]) (Authenticated sender: clg@kaod.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id AE67BB760EE7;
 Thu, 31 Oct 2019 06:36:58 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/xive: Prevent page fault issues in the machine crash
 handler
Date: Thu, 31 Oct 2019 07:31:00 +0100
Message-Id: <20191031063100.3864-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9299933230795557809
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddtgedgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
Cc: linuxppc-dev@lists.ozlabs.org, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When the machine crash handler is invoked, all interrupts are masked
but interrupts which have not been started yet do not have an ESB page
mapped in the Linux address space. This crashes the 'crash kexec'
sequence on sPAPR guests.

To fix, force the mapping of the ESB page when an interrupt is being
mapped in the Linux IRQ number space. This is done by setting the
initial state of the interrupt to OFF which is not necessarily the
case on PowerNV.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index df832b09e3e9..f5fadbd2533a 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1035,6 +1035,15 @@ static int xive_irq_alloc_data(unsigned int virq, irq_hw_number_t hw)
 	xd->target = XIVE_INVALID_TARGET;
 	irq_set_handler_data(virq, xd);
 
+	/*
+	 * Turn OFF by default the interrupt being mapped. A side
+	 * effect of this check is the mapping the ESB page of the
+	 * interrupt in the Linux address space. This prevents page
+	 * fault issues in the crash handler which masks all
+	 * interrupts.
+	 */
+	xive_esb_read(xd, XIVE_ESB_SET_PQ_01);
+
 	return 0;
 }
 
-- 
2.21.0

