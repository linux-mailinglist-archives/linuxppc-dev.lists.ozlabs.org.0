Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4B5239DE9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 05:47:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKkNk4lNFzDqTb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 13:47:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=1wt.eu
 (client-ip=62.212.114.60; helo=1wt.eu; envelope-from=w@1wt.eu;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=1wt.eu
Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BKkM04GRpzDqSK
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 13:46:04 +1000 (AEST)
Received: (from willy@localhost)
 by pcw.home.local (8.15.2/8.15.2/Submit) id 0733jlX7015511;
 Mon, 3 Aug 2020 05:45:47 +0200
Date: Mon, 3 Aug 2020 05:45:47 +0200
From: Willy Tarreau <w@1wt.eu>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: powerpc: build failures in Linus' tree
Message-ID: <20200803034547.GA15501@1wt.eu>
References: <20200802204842.36bca162@canb.auug.org.au>
 <20200802172019.GB26677@1wt.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <20200802172019.GB26677@1wt.eu>
User-Agent: Mutt/1.6.1 (2016-04-27)
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
Cc: Linux-kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Mackerras <paulus@samba.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi again Stephen,

On Sun, Aug 02, 2020 at 07:20:19PM +0200, Willy Tarreau wrote:
> On Sun, Aug 02, 2020 at 08:48:42PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > We are getting build failures in some PowerPC configs for Linus' tree.
> > See e.g. http://kisskb.ellerman.id.au/kisskb/buildresult/14306515/
> > 
> > In file included from /kisskb/src/arch/powerpc/include/asm/paca.h:18,
> >                  from /kisskb/src/arch/powerpc/include/asm/percpu.h:13,
> >                  from /kisskb/src/include/linux/random.h:14,
> >                  from /kisskb/src/include/linux/net.h:18,
> >                  from /kisskb/src/net/ipv6/ip6_fib.c:20:
> > /kisskb/src/arch/powerpc/include/asm/mmu.h:139:22: error: unknown type name 'next_tlbcam_idx'
> >   139 | DECLARE_PER_CPU(int, next_tlbcam_idx);
> > 
> > I assume this is caused by commit
> > 
> >   1c9df907da83 ("random: fix circular include dependency on arm64 after addition of percpu.h")
> > 
> > But I can't see how, sorry.
> 
> So there, asm/mmu.h includes asm/percpu.h, which includes asm/paca.h, which
> includes asm/mmu.h.
> 
> I suspect that we can remove asm/paca.h from asm/percpu.h as it *seems*
> to be only used by the #define __my_cpu_offset but I don't know if anything
> will break further, especially if this __my_cpu_offset is used anywhere
> without this paca definition.

I tried this and it fixed 5.8 for me with your config above. I'm appending
a patch that does just this. I didn't test other configs as I don't know
which ones to test though. If it fixes the problem for you, maybe it can
be picked by the PPC maintainers.

Willy

--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-powerpc-fix-circular-dependency-in-percpu.h.patch"

From bcd64a7d0f3445c9a75d3b4dc4837d2ce61660c9 Mon Sep 17 00:00:00 2001
From: Willy Tarreau <w@1wt.eu>
Date: Mon, 3 Aug 2020 05:27:57 +0200
Subject: powerpc: fix circular dependency in percpu.h

After random.h started to include percpu.h (commit f227e3e), several
archs broke in circular dependencies around percpu.h.

In https://lore.kernel.org/lkml/20200802204842.36bca162@canb.auug.org.au/
Stephen Rothwell reported breakage for powerpc with CONFIG_PPC_FSL_BOOK3E.

It turns out that asm/percpu.h includes asm/paca.h, which itself
includes mmu.h, which includes percpu.h when CONFIG_PPC_FSL_BOOK3E=y.

Percpu seems to include asm/paca.h only for local_paca which is used in
the __my_cpu_offset macro. Removing this include solves the issue for
this config.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: f227e3e ("random32: update the net random state on interrupt and activity")
Link: https://lore.kernel.org/lkml/20200802204842.36bca162@canb.auug.org.au/
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 arch/powerpc/include/asm/percpu.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/include/asm/percpu.h b/arch/powerpc/include/asm/percpu.h
index dce863a..cd3f6e5 100644
--- a/arch/powerpc/include/asm/percpu.h
+++ b/arch/powerpc/include/asm/percpu.h
@@ -10,8 +10,6 @@
 
 #ifdef CONFIG_SMP
 
-#include <asm/paca.h>
-
 #define __my_cpu_offset local_paca->data_offset
 
 #endif /* CONFIG_SMP */
-- 
2.9.0


--+QahgC5+KEYLbs62--
