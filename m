Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C633D1AD474
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 04:30:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493Kn70JQrzF0Rt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 12:30:03 +1000 (AEST)
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
 header.s=fm1 header.b=atz2j8Ob; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=gqd6KNRb; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493KkZ37DhzF0PZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 12:27:49 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id ACD62794;
 Thu, 16 Apr 2020 22:27:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 16 Apr 2020 22:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 Z4EK0RmjHHENIp/2ipnM27VWqO3MyOqHeIqAH9ex9ZI=; b=atz2j8ObFE8ZQMZE
 339vFt3PI4Nb+5auKOQLfY6DoHXpKfwh+tQAqaH/TLREs9YA9u5ZSA1wbB23mQAS
 XBvxivytTpfrAm7HSCOkpF8E12utAiNrS92SMgWpXt8LtPR+ukkDS2CUURNtYLIR
 m/d4rcq751Aok3KOyyeEgeTqSucaz7P18XqxwTzv4CBfcPI2LUK3lGVvSDCIL7dx
 MqYWOzZrfMxFeY4nl1AoR1LMGLa8xOlSeqZfmBODKJN1+287NAi9BPntBZAgOS93
 kOVhmLO8qE2JXyPjMINVHj99ouvYQImw5GYK+QUW12POopC3PsS/W/kThhzWHNIg
 huPNqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Z4EK0RmjHHENIp/2ipnM27VWqO3MyOqHeIqAH9ex9
 ZI=; b=gqd6KNRbc8C3IRSAKSfLTTG34ukwZDlP3e1gjR7KBK5BZ1F4X+N67rY1u
 veUYE7rFa+Rdifi6nDJnv9d7yHdLX3p86KrWrh6BJSFGQXt8V980gl2I/KLKnxqT
 Y+u3BM+zmdjlEg8mlFmjPp7EtXRPEF9VETi1LAN0q8BydG6m9SXTBU5lMPG9elJ1
 NTM7Ik40sl7XUuL1AZ2UvFzHCoNV/G3du2n3Lu7N3Mk1u+67y/ckkAIPPdRh4OwT
 RyybnBGxz8ZOgolYYTeINrTtklcY4AWFj0wBDI8ozvGuK40Om9uF4TNm/yO47cKk
 k0PzCX7MbTRnQZRqGyX2CELNcptIA==
X-ME-Sender: <xms:IRSZXgS_LELLZei2llCF1Y8PwZVs9FNzBHrrmXAFOJ3reQjFG_s80w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeeigdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvtddmnecujfgurhepkffuhffvffgjfhgtfggggfesthekredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvuddr
 geehrddvuddvrddvfeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:IRSZXhSiMiZfe2q4JTASJDPD3yIWG-pTzHSOQRS2ID3IqV-fbUXzPA>
 <xmx:IRSZXknV7NFM6yI_95kCgzKdHXUbA6acshCybsM3b-Wbm7lyff69jA>
 <xmx:IRSZXiRjheovvanl6DEIdL3lwDb4FjuWqt-NCW-ZLEsnp5ksF9xtNg>
 <xmx:IhSZXjVYZWQPBvehUfecVASDPicIGngFYFLoW_jDaH3CtGbE-M2xUA>
Received: from crackle.ozlabs.ibm.com
 (ppp121-45-212-239.bras1.cbr2.internode.on.net [121.45.212.239])
 by mail.messagingengine.com (Postfix) with ESMTPA id 86E173280063;
 Thu, 16 Apr 2020 22:27:43 -0400 (EDT)
Message-ID: <f733132895e14123995e6bdaa93854c5632672bc.camel@russell.cc>
Subject: Re: POWER9 crash due to STRICT_KERNEL_RWX (WAS: Re: Linux-next
 POWER9 NULL pointer NIP...)
From: Russell Currey <ruscur@russell.cc>
To: Steven Rostedt <rostedt@goodmis.org>, Qian Cai <cai@lca.pw>
Date: Fri, 17 Apr 2020 12:27:41 +1000
In-Reply-To: <20200416221753.4e47080a@oasis.local.home>
References: <15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw>
 <87eeszlb6u.fsf@mpe.ellerman.id.au>
 <0675B22E-8F32-432C-9378-FDE159DD1729@lca.pw>
 <20200407093054.3eb23e45@gandalf.local.home>
 <EA9F9A54-87BC-477A-BE8A-7D53F80C5223@lca.pw>
 <20200409101413.35d9c72d@gandalf.local.home>
 <06A2EA93-B730-4DB1-819F-D27E7032F0B3@lca.pw>
 <161662E3-5D9C-4C15-919C-CFEFE4CC35CB@lca.pw>
 <69F0448F-CA5B-497D-B8AF-2848175B9477@lca.pw>
 <20200416221753.4e47080a@oasis.local.home>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-04-16 at 22:17 -0400, Steven Rostedt wrote:
> On Thu, 16 Apr 2020 21:19:10 -0400
> Qian Cai <cai@lca.pw> wrote:
> 
> > OK, reverted the commit,
> > 
> > c55d7b5e6426 (“powerpc: Remove STRICT_KERNEL_RWX incompatibility
> > with RELOCATABLE”)
> > 
> > or set STRICT_KERNEL_RWX=n fixed the crash below and also mentioned
> > in this thread,
> 
> This may be a symptom and not a cure.

Reverting the patch with the given config will have the same effect as
STRICT_KERNEL_RWX=n.  Not discounting that it could be a bug on the
powerpc side (i.e. relocatable kernels with strict RWX on haven't been
exhaustively tested yet), but we should definitely figure out what's
going on with this bad access first.

> 
> > https://lore.kernel.org/lkml/15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw/
> > 
> > [  148.110969][T13115] LTP: starting chown04_16
> > [  148.255048][T13380] kernel tried to execute exec-protected page
> > (c0000000016804ac) - exploit attempt? (uid: 0)
> > [  148.255099][T13380] BUG: Unable to handle kernel instruction
> > fetch
> > [  148.255122][T13380] Faulting instruction address:
> > 0xc0000000016804ac
> > [  148.255136][T13380] Oops: Kernel access of bad area, sig: 11
> > [#1]
> > [  148.255157][T13380] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=256
> > DEBUG_PAGEALLOC NUMA PowerNV
> > [  148.255171][T13380] Modules linked in: loop kvm_hv kvm xfs
> > sd_mod bnx2x mdio ahci tg3 libahci libphy libata firmware_class
> > dm_mirror dm_region_hash dm_log dm_mod
> > [  148.255213][T13380] CPU: 45 PID: 13380 Comm: chown04_16 Tainted:
> > G        W         5.6.0+ #7
> > [  148.255236][T13380] NIP:  c0000000016804ac LR: c00800000fa60408
> > CTR: c0000000016804ac
> > [  148.255250][T13380] REGS: c0000010a6fafa00 TRAP: 0400   Tainted:
> > G        W          (5.6.0+)
> > [  148.255281][T13380] MSR:  9000000010009033
> > <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84000248  XER: 20040000
> > [  148.255310][T13380] CFAR: c00800000fa66534 IRQMASK: 0 
> > [  148.255310][T13380] GPR00: c000000000973268 c0000010a6fafc90
> > c000000001648200 0000000000000000 
> > [  148.255310][T13380] GPR04: c000000d8a22dc00 c0000010a6fafd30
> > 00000000b5e98331 ffffffff00012c9f 
> > [  148.255310][T13380] GPR08: c000000d8a22dc00 0000000000000000
> > 0000000000000000 c00000000163c520 
> > [  148.255310][T13380] GPR12: c0000000016804ac c000001ffffdad80
> > 0000000000000000 0000000000000000 
> > [  148.255310][T13380] GPR16: 0000000000000000 0000000000000000
> > 0000000000000000 0000000000000000 
> > [  148.255310][T13380] GPR20: 0000000000000000 0000000000000000
> > 0000000000000000 0000000000000000 
> > [  148.255310][T13380] GPR24: 00007fff8f5e2e48 0000000000000000
> > c00800000fa6a488 c0000010a6fafd30 
> > [  148.255310][T13380] GPR28: 0000000000000000 000000007fffffff
> > c00800000fa60400 c000000efd0c6780 
> > [  148.255494][T13380] NIP [c0000000016804ac]
> > sysctl_net_busy_read+0x0/0x4
> 
> The instruction pointer is on sysctl_net_busy_read? Isn't that data
> and
> not code?
> 
> In net/socket.c:
> 
>   #ifdef CONFIG_NET_RX_BUSY_POLL
>   unsigned int sysctl_net_busy_read __read_mostly;
>   unsigned int sysctl_net_busy_poll __read_mostly;
>   #endif
> 
> -- Steve
> 
> 
> > [  148.255516][T13380] LR [c00800000fa60408] find_free_cb+0x8/0x30
> > [loop]
> > [  148.255528][T13380] Call Trace:
> > [  148.255538][T13380] [c0000010a6fafc90] [c0000000009732c0]
> > idr_for_each+0xf0/0x170 (unreliable)
> > [  148.255572][T13380] [c0000010a6fafd10] [c00800000fa626c4]
> > loop_lookup.part.1+0x4c/0xb0 [loop]
> > [  148.255597][T13380] [c0000010a6fafd50] [c00800000fa634d8]
> > loop_control_ioctl+0x120/0x1d0 [loop]
> > [  148.255623][T13380] [c0000010a6fafdb0] [c0000000004ddc08]
> > ksys_ioctl+0xd8/0x130
> > [  148.255636][T13380] [c0000010a6fafe00] [c0000000004ddc88]
> > sys_ioctl+0x28/0x40
> > [  148.255669][T13380] [c0000010a6fafe20] [c00000000000b378]
> > system_call+0x5c/0x68
> > [  148.255699][T13380] Instruction dump:
> > [  148.255718][T13380] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
> > XXXXXXXX XXXXXXXX XXXXXXXX 
> > [  148.255744][T13380] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
> > XXXXXXXX XXXXXXXX XXXXXXXX 
> > [  148.255772][T13380] ---[ end trace a5894a74208c22ec ]---
> > [  148.576663][T13380] 
> > [  149.576765][T13380] Kernel panic - not syncing: Fatal exception
> > 

