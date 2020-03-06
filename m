Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 720D117C71A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 21:33:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YzpH5jsyzF3Qq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 07:33:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.127.22; helo=1.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 8393 seconds by postgrey-1.36 at bilbo;
 Sat, 07 Mar 2020 07:26:57 AEDT
Received: from 1.mo1.mail-out.ovh.net (1.mo1.mail-out.ovh.net [178.32.127.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Yzg537YtzF39p
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 07:26:53 +1100 (AEDT)
Received: from player758.ha.ovh.net (unknown [10.110.171.227])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id BA9AC1B2FB7
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 16:02:06 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id B7957102B4FF8;
 Fri,  6 Mar 2020 15:02:01 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/4] powerpc/xmon: Add source flags to output of XIVE
 interrupts
Date: Fri,  6 Mar 2020 16:01:42 +0100
Message-Id: <20200306150143.5551-4-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200306150143.5551-1-clg@kaod.org>
References: <20200306150143.5551-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7344808044535647153
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some firmwares or hypervisors can advertise different source
characteristics. Track their value under XMON. What we are mostly
interested in is the StoreEOI flag.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 8155adc2225a..c865ae554605 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -283,7 +283,10 @@ int xmon_xive_get_irq_config(u32 hw_irq, struct irq_data *d)
 		struct xive_irq_data *xd = irq_data_get_irq_handler_data(d);
 		u64 val = xive_esb_read(xd, XIVE_ESB_GET);
 
-		xmon_printf("PQ=%c%c",
+		xmon_printf("flags=%c%c%c PQ=%c%c",
+			    xd->flags & XIVE_IRQ_FLAG_STORE_EOI ? 'S' : ' ',
+			    xd->flags & XIVE_IRQ_FLAG_LSI ? 'L' : ' ',
+			    xd->flags & XIVE_IRQ_FLAG_H_INT_ESB ? 'H' : ' ',
 			    val & XIVE_ESB_VAL_P ? 'P' : '-',
 			    val & XIVE_ESB_VAL_Q ? 'Q' : '-');
 	}
-- 
2.21.1

