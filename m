Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 519C12C8051
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 09:55:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkzZT4bDPzDrBr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 19:54:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux-m68k.org
 (client-ip=195.130.137.77; helo=leibniz.telenet-ops.be;
 envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be [195.130.137.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkzXk408FzDr1Q
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 19:53:26 +1100 (AEDT)
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4CkzXV0sqkzMqp0D
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 09:53:14 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
 by andre.telenet-ops.be with bizsmtp
 id yYt92300d4C55Sk01Yt99w; Mon, 30 Nov 2020 09:53:13 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kjevl-006uxW-He; Mon, 30 Nov 2020 09:53:09 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kjevl-006a5y-0Z; Mon, 30 Nov 2020 09:53:09 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH] clk: renesas: r9a06g032: Drop __packed for portability
Date: Mon, 30 Nov 2020 09:53:03 +0100
Message-Id: <20201130085303.1566901-1-geert@linux-m68k.org>
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
Cc: linux-kernel@vger.kernel.org,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The R9A06G032 clock driver uses an array of packed structures to reduce
kernel size.  However, this array contains pointers, which are no longer
aligned naturally, and cannot be relocated on PPC64.  Hence when
compile-testing this driver on PPC64 with CONFIG_RELOCATABLE=y (e.g.
PowerPC allyesconfig), the following warnings are produced:

    WARNING: 136 bad relocations
    c000000000616be3 R_PPC64_UADDR64   .rodata+0x00000000000cf338
    c000000000616bfe R_PPC64_UADDR64   .rodata+0x00000000000cf370
    ...

Fix this by dropping the __packed attribute from the r9a06g032_clkdesc
definition, trading a small size increase for portability.

This increases the 156-entry clock table by 1 byte per entry, but due to
the compiler generating more efficient code for unpacked accesses, the
net size increase is only 76 bytes (gcc 9.3.0 on arm32).

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 4c3d88526eba2143 ("clk: renesas: Renesas R9A06G032 clock driver")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Please take directly (ppc or clk), as this is a build fix.
https://lore.kernel.org/linux-clk/20201128122819.32187696@canb.auug.org.au/

Compile-tested only due to lack of hardware.

 drivers/clk/renesas/r9a06g032-clocks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index d900f6bf53d0b944..892e91b92f2c80f5 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -55,7 +55,7 @@ struct r9a06g032_clkdesc {
 			u16 sel, g1, r1, g2, r2;
 		} dual;
 	};
-} __packed;
+};
 
 #define I_GATE(_clk, _rst, _rdy, _midle, _scon, _mirack, _mistat) \
 	{ .gate = _clk, .reset = _rst, \
-- 
2.25.1

