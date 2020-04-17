Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C131AD49D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 04:48:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493L9x056zzDqML
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 12:48:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=Ss9Y8NoV; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=nsENolDW; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493L8D4Tj2zDrgK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 12:46:36 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C625360D;
 Thu, 16 Apr 2020 22:46:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 16 Apr 2020 22:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 uBMzu65Xk32W4CUkghS8JLzUYDeM9GMYqeDoBoIfrGs=; b=Ss9Y8NoVoxUKcNfD
 slmq5Z8mLwBPIrfS3B3BhDP8d0IWEkR/utKrpT4fotfdcbRgEN+TgirmBNkR6BdM
 eYhwmrKkZgKiUaR2Aok05trJKoaTGXgYrPRQ/a3o13dtY7JbG1bS+1HFhKibIZia
 oRQOBSaM90KnTO9JJYA7laDdaF8oO/aek2Rwe0k/j2EO4svRc/JoRunnMGOgYbq7
 /nBUmaqKHugaevFQkqW9sVCLoWkwE75vBeIT+7Ru4yj6GlrcrpvvOzonMf07gbpv
 1ziNBKpRplBOeMHr2sBIr8pOeIxzDTIg/POybLVLvgVlPTAYDdsuKnCWhlSZHu5A
 oU/JMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=uBMzu65Xk32W4CUkghS8JLzUYDeM9GMYqeDoBoIfr
 Gs=; b=nsENolDWAueoEGmiUWO7CIvYFaqdlN8smnGwByIyG8JPznbLktEC17NiP
 n5D87SQjgksMoEXYrizc9Pd6yxSfUXXEY6+5XpDiIJfP1RkriqFzb3KfvWWY2HOK
 kjmG/r7pqvDx04uTzZNnU6fLL7fqd4ez2TIj3vqo1hBwueZQr6UcLk3YIC8l2Tqa
 KdUYOnSUMJxdTUGxupGFYJKbvsxYeDIgvnd/cKgF5OgogCMcs/ul3sb6qxCwTDYb
 vaW9vbzYrOCcDZuGPXoPoDsTLslX2EtdWiNTl1M+s3wX2zNDVhqenMLdiZ43QN0W
 yN/qO2HGKwVB+lA8NsK2Jqy3LkbJA==
X-ME-Sender: <xms:iBiZXlYBbzX0KK26_zWihqBKgsSg-gzdzK9_wX496UZO5rSXNx0Z3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeeigdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdeftddmnecujfgurhepkffuhffvffgjfhgtfggggfesthejredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecukfhppeduvddurdeghedrvdduvddrvdefleenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvg
 hllhdrtggt
X-ME-Proxy: <xmx:iBiZXk8qh6dLy7GBTMSv2rKezmpBB4Aozb8PAXNgywBVxk4bH9m1Dw>
 <xmx:iBiZXvChXeSNrICTNzGlfMA8nyPafkgpUxdjuQtlqju4AbN6AT-hog>
 <xmx:iBiZXovwbuHr5tO0TziBneTOTAXu3Nvuh-y2XvP_983oSySAEJlAAA>
 <xmx:iRiZXrySExpBHV99HNrmU01z12BfbtegutRn8BDU-MkaK2SWyAGl8g>
Received: from crackle.ozlabs.ibm.com
 (ppp121-45-212-239.bras1.cbr2.internode.on.net [121.45.212.239])
 by mail.messagingengine.com (Postfix) with ESMTPA id B4AD63280064;
 Thu, 16 Apr 2020 22:46:30 -0400 (EDT)
Message-ID: <fec2e755ea20e15dc5b6fee6c856562aa42872bd.camel@russell.cc>
Subject: Re: POWER9 crash due to STRICT_KERNEL_RWX (WAS: Re: Linux-next
 POWER9 NULL pointer NIP...)
From: Russell Currey <ruscur@russell.cc>
To: Qian Cai <cai@lca.pw>
Date: Fri, 17 Apr 2020 12:46:28 +1000
In-Reply-To: <43EE54C0-6F20-4ADD-9948-21F24D90C5E1@lca.pw>
References: <43EE54C0-6F20-4ADD-9948-21F24D90C5E1@lca.pw>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-04-16 at 22:40 -0400, Qian Cai wrote:
> > On Apr 16, 2020, at 10:27 PM, Russell Currey <ruscur@russell.cc>
> > wrote:
> > 
> > Reverting the patch with the given config will have the same effect
> > as
> > STRICT_KERNEL_RWX=n.  Not discounting that it could be a bug on the
> > powerpc side (i.e. relocatable kernels with strict RWX on haven't
> > been
> > exhaustively tested yet), but we should definitely figure out
> > what's
> > going on with this bad access first.
> 
> BTW, this bad access only happened once. The overwhelming rest of
> crashes are with NULL pointer NIP like below. How can you explain
> that STRICT_KERNEL_RWX=n would also make those NULL NIP disappear if
> STRICT_KERNEL_RWX is just a messenger?

What happens if you test with STRICT_KERNEL_RWX=y and RELOCATABLE=n,
reverting my patch?  This would give us an idea of whether it's
something broken recently or if there's something else going on.

> 
> [  215.281666][T16896] LTP: starting chown04_16
> [  215.424203][T18297] BUG: Unable to handle kernel instruction fetch
> (NULL pointer?)
> [  215.424289][T18297] Faulting instruction address: 0x00000000
> [  215.424313][T18297] Oops: Kernel access of bad area, sig: 11 [#1]
> [  215.424341][T18297] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=256
> DEBUG_PAGEALLOC NUMA PowerNV
> [  215.424383][T18297] Modules linked in: loop kvm_hv kvm ip_tables
> x_tables xfs sd_mod bnx2x mdio tg3 ahci libahci libphy libata
> firmware_class dm_mirror dm_region_hash dm_log dm_mod
> [  215.424459][T18297] CPU: 85 PID: 18297 Comm: chown04_16 Tainted:
> G        W         5.6.0-next-20200405+ #3
> [  215.424489][T18297] NIP:  0000000000000000 LR: c00800000fbc0408
> CTR: 0000000000000000
> [  215.424530][T18297] REGS: c000200b8606f990 TRAP: 0400   Tainted:
> G        W          (5.6.0-next-20200405+)
> [  215.424570][T18297] MSR:  9000000040009033
> <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84000248  XER: 20040000
> [  215.424619][T18297] CFAR: c00800000fbc64f4 IRQMASK: 0 
> [  215.424619][T18297] GPR00: c0000000006c2238 c000200b8606fc20
> c00000000165ce00 0000000000000000 
> [  215.424619][T18297] GPR04: c000201a58106400 c000200b8606fcc0
> 000000005f037e7d ffffffff00013bfb 
> [  215.424619][T18297] GPR08: c000201a58106400 0000000000000000
> 0000000000000000 c000000001652ee0 
> [  215.424619][T18297] GPR12: 0000000000000000 c000201fff69a600
> 0000000000000000 0000000000000000 
> [  215.424619][T18297] GPR16: 0000000000000000 0000000000000000
> 0000000000000000 0000000000000000 
> [  215.424619][T18297] GPR20: 0000000000000000 0000000000000000
> 0000000000000000 0000000000000007 
> [  215.424619][T18297] GPR24: 0000000000000000 0000000000000000
> c00800000fbc8688 c000200b8606fcc0 
> [  215.424619][T18297] GPR28: 0000000000000000 000000007fffffff
> c00800000fbc0400 c00020068b8c0e70 
> [  215.424914][T18297] NIP [0000000000000000] 0x0
> [  215.424953][T18297] LR [c00800000fbc0408] find_free_cb+0x8/0x30
> [loop]
> find_free_cb at drivers/block/loop.c:2129
> [  215.424997][T18297] Call Trace:
> [  215.425036][T18297] [c000200b8606fc20] [c0000000006c2290]
> idr_for_each+0xf0/0x170 (unreliable)
> [  215.425073][T18297] [c000200b8606fca0] [c00800000fbc2744]
> loop_lookup.part.2+0x4c/0xb0 [loop]
> loop_lookup at drivers/block/loop.c:2144
> [  215.425105][T18297] [c000200b8606fce0] [c00800000fbc3558]
> loop_control_ioctl+0x120/0x1d0 [loop]
> [  215.425149][T18297] [c000200b8606fd40] [c0000000004eb688]
> ksys_ioctl+0xd8/0x130
> [  215.425190][T18297] [c000200b8606fd90] [c0000000004eb708]
> sys_ioctl+0x28/0x40
> [  215.425233][T18297] [c000200b8606fdb0] [c00000000003cc30]
> system_call_exception+0x110/0x1e0
> [  215.425274][T18297] [c000200b8606fe20] [c00000000000c9f0]
> system_call_common+0xf0/0x278
> [  215.425314][T18297] Instruction dump:
> [  215.425338][T18297] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
> XXXXXXXX XXXXXXXX XXXXXXXX 
> [  215.425374][T18297] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
> XXXXXXXX XXXXXXXX XXXXXXXX 
> [  215.425422][T18297] ---[ end trace ebed248fad431966 ]---
> [  215.642114][T18297] 
> [  216.642220][T18297] Kernel panic - not syncing: Fatal exception

