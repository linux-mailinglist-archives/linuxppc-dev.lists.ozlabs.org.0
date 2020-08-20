Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBC124C790
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 00:09:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXf2f2crvzDqss
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 08:09:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=212.18.0.10; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
X-Greylist: delayed 346 seconds by postgrey-1.36 at bilbo;
 Fri, 21 Aug 2020 08:08:08 AEST
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXf0m31mWzDr1G
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 08:08:07 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BXdrD3wFDz1rt4M;
 Fri, 21 Aug 2020 00:00:44 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BXdrD1vjSz1qw6h;
 Fri, 21 Aug 2020 00:00:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Ym_BFar1tcee; Fri, 21 Aug 2020 00:00:43 +0200 (CEST)
X-Auth-Info: AaAWNRy8nwRPJM7jJzxHA0w20Zi5hogQa4/6xekBaI6YU6fk6AqWnGyPEgtqCrsv
Received: from igel.home (ppp-46-244-162-139.dynamic.mnet-online.de
 [46.244.162.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 21 Aug 2020 00:00:43 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id BDB002C28BC; Fri, 21 Aug 2020 00:00:42 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 3/6] powerpc/32s: Only leave NX unset on segments
 used for modules
References: <cover.1593428200.git.christophe.leroy@csgroup.eu>
 <7172c0f5253419315e434a1816ee3d6ed6505bc0.1593428200.git.christophe.leroy@csgroup.eu>
X-Yow: ..Wait 'til those  ITALIAN TEENAGERS get back to their HONDAS &
 discover them to be FILLED to the BRIM with MAZOLA!!
Date: Fri, 21 Aug 2020 00:00:42 +0200
In-Reply-To: <7172c0f5253419315e434a1816ee3d6ed6505bc0.1593428200.git.christophe.leroy@csgroup.eu>
 (Christophe Leroy's message of "Mon, 29 Jun 2020 11:15:22 +0000
 (UTC)")
Message-ID: <87eeo1kmet.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Jun 29 2020, Christophe Leroy wrote:

> Instead of leaving NX unset on all segments above the start
> of vmalloc space, only leave NX unset on segments used for
> modules.

I'm getting this crash:

kernel tried to execute exec-protected page (f294b000) - exploit attempt (uid: 0)
BUG: Unable to handle kernel instruction fetch
Faulting instruction address: 0xf294b000
Oops: Kernel access of bad area, sig: 11 [#1]
BE PAGE_SIZE=4K MMU=Hash PowerMac
Modules linked in: pata_macio(+)
CPU: 0 PID: 87 Comm: udevd Not tainted 5.8.0-rc2-test #49
NIP:  f294b000 LR: 0005c60 CTR: f294b000
REGS: f18d9cc0 TRAP: 0400  Not tainted  (5.8.0-rc2-test)
MSR:  10009032 <E,ME,IR,DR,RI>  CR: 84222422  XER: 20000000
GPR00: c0005c14 f18d9d78 ef30ca20 00000000 ef0000e0 c00993d0 ef6da038 0000005e
GPR08: c09050b8 c08b0000 00000000 f18d9d78 44222422 10072070 00000000 0fefaca4
GPR16: 1006a00c f294d50b 00000120 00000124 c0096ea8 0000000e ef2776c0 ef2776e4
GPR24: f18fd6e8 00000001 c086fe64 c086fe04 00000000 c08b0000 f294b000 ffffffff
NIP [f294b000] pata_macio_init+0x0/0xc0 [pata_macio]
LR [c0005c60] do_one_initcall+0x6c/0x160
Call Trace:
[f18d9d78] [c0005c14] do_one_initcall+0x20/0x160 (unreliable)
[f18d9dd8] [c009a22c] do_init_module+0x60/0x1c0
[f18d9df8] [c00993d8] load_module+0x16a8/0x1c14
[f18d9ea8] [c0099aa4] sys_finit_module+0x8c/0x94
[f18d9f38] [c0012174] ret_from_syscall+0x0/0x34
--- interrupt: c01 at 0xfdb4318
   LR = 0xfeee9c0
Instruction dump:
XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX <3d20c08b> 3d40c086 9421ffe0 8129106c
---[ end trace 85a98cc836109871 ]---

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
