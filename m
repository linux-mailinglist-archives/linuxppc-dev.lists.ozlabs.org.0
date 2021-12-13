Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2809D47337D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 19:02:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCTqG02H3z3cPm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 05:02:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=a.fatoum@pengutronix.de;
 receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCMgZ5c6Zz2yQw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 00:24:57 +1100 (AEDT)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1mwlJx-0008Sf-9N; Mon, 13 Dec 2021 14:24:49 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [BUG] mtd: cfi_cmdset_0002: write regression since v4.17-rc1
To: linux-mtd@lists.infradead.org, ikegami@allied-telesis.co.jp,
 Joakim.Tjernlund@infinera.com, miquel.raynal@bootlin.com, vigneshr@ti.com,
 richard@nod.at, ikegami.t@gmail.com
Message-ID: <b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de>
Date: Mon, 13 Dec 2021 14:24:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Mailman-Approved-At: Tue, 14 Dec 2021 05:01:41 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 marek.vasut@gmail.com, Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, cyrille.pitchen@wedev4u.fr,
 Shaohui.Xie@nxp.com, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

I've been investigating a breakage on a PowerPC MPC8313: The SoC is connected
via the "Enhanced Local Bus Controller" to a 8-bit-parallel S29GL064N flash,
which is represented as a memory-mapped cfi-flash.

The regression began in v4.17-rc1 with

  dfeae1073583 ("mtd: cfi_cmdset_0002: Change write buffer to check correct value")

and causes all flash write accesses on the hardware to fail. Example output
after v5.1-rc2[1]:

  root@host:~# mount -t jffs2 /dev/mtdblock0 /mnt
  MTD do_write_buffer_wait(): software timeout, address:0x000c000b.
  jffs2: Write clean marker to block at 0x000c0000 failed: -5

This issue still persists with v5.16-rc. Reverting aforementioned patch fixes
it, but I am still looking for a change that keeps both Tokunori's and my
hardware happy.

What Tokunori's patch did is that it strengthened the success condition
for flash writes:

 - Prior to the patch, DQ polling was done until bits
   stopped toggling. This was taken as an indicator that the write succeeded
   and was reported up the stack. i.e. success condition is chip_ready()

 - After the patch, polling continues until the just written data is
   actually read back, i.e. success condition is chip_good()

This new condition never holds for me, when DQ stabilizes, it reads 0xFF,
never the just written data. The data is still written and can be read back
on subsequent reads, just not at that point of time in the poll loop.

We haven't had write issues for the years predating that patch. As the
regression has been mainline for a while, I am wondering what about my setup
that makes it pop up here, but not elsewhere?

I consulted the data sheet[2] and found Figure 27, which describes DQ polling
during embedded algorithms. DQ switches from status output to "True" (I assume
True == all bits set == 0xFF) until CS# is reasserted. 

I compared with another chip's datasheet, and it (Figure 8.4) doesn't describe
such an intermittent "True" state. In any case, the driver polls a few hundred
times, however, before giving up, so there should be enough CS# toggles.


Locally, I'll revert this patch for now. I think accepting 0xFF as a success
condition may be appropriate, but I don't yet have the rationale to back it up.

I am investigating this some more, probably with a logic trace, but I wanted
to report this in case someone has pointers and in case other people run into
the same issue.


Cheers,
Ahmad

[1] Prior to d9b8a67b3b95 ("mtd: cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer") 
    first included with v5.1-rc2, failing writes just hung indefinitely in kernel space.
    That's fixed, but the writes still fail.

[2]: 001-98525 Rev. *B, https://www.infineon.com/dgdl/Infineon-S29GL064N_S29GL032N_64_Mbit_32_Mbit_3_V_Page_Mode_MirrorBit_Flash-DataSheet-v03_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ed556fd548b

[3]: https://www.mouser.com/datasheet/2/268/SST39VF1601C-SST39VF1602C-16-Mbit-x16-Multi-Purpos-709008.pdf
     Note that "true data" means valid data here, not all bits one.
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
