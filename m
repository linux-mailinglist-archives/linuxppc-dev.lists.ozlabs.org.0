Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAC017C6CD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 21:08:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YzFk0zlJzDrCv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 07:08:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.119.138; helo=6.mo5.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 12595 seconds by postgrey-1.36 at bilbo;
 Sat, 07 Mar 2020 07:07:10 AEDT
Received: from 6.mo5.mail-out.ovh.net (6.mo5.mail-out.ovh.net [178.32.119.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YzDG2HVGzDqkw
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 07:07:03 +1100 (AEDT)
Received: from player758.ha.ovh.net (unknown [10.108.57.141])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 4CAA026A928
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 16:02:01 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 5EBB1102B4F93;
 Fri,  6 Mar 2020 15:01:56 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/4] powerpc/xive: Fix xmon support on the PowerNV platform
Date: Fri,  6 Mar 2020 16:01:41 +0100
Message-Id: <20200306150143.5551-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200306150143.5551-1-clg@kaod.org>
References: <20200306150143.5551-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7343400669491530673
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudduvddgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
 stable@vger.kernel.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The PowerNV platform has multiple IRQ chips and the xmon command
dumping the state of the XIVE interrupt should only operate on the
XIVE IRQ chip.

Fixes: 5896163f7f91 ("powerpc/xmon: Improve output of XIVE interrupts")
Cc: stable@vger.kernel.org # v5.4+
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 550baba98ec9..8155adc2225a 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -261,11 +261,15 @@ notrace void xmon_xive_do_dump(int cpu)
 
 int xmon_xive_get_irq_config(u32 hw_irq, struct irq_data *d)
 {
+	struct irq_chip *chip = irq_data_get_irq_chip(d);
 	int rc;
 	u32 target;
 	u8 prio;
 	u32 lirq;
 
+	if (!is_xive_irq(chip))
+		return -EINVAL;
+
 	rc = xive_ops->get_irq_config(hw_irq, &target, &prio, &lirq);
 	if (rc) {
 		xmon_printf("IRQ 0x%08x : no config rc=%d\n", hw_irq, rc);
-- 
2.21.1

