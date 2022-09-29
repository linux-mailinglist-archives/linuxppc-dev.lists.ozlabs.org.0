Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA855EFF45
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 23:28:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mdmgz2Z89z3bms
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 07:28:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=j6uSKWeX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=j6uSKWeX;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdmgL4FM5z2xk6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 07:28:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nKkp4EcfXgofFnFrywrhIotmIiMrzxdQ/G5/JvZSeIE=; b=j6uSKWeXpVHx42ioIMQOQA4xBG
	mhlC5RicNdriGlPZJ5NiqS83mGrUoQ5LHiXTvFsILv4bFuruFmQYqwPYIPxUGwvvoOqP0g/fC56Jd
	Hah18RXFSjaD2YtQDebkbJ7t4d0zomcVkycwhoZkMzlmKghDi03zR9xokD+SQPbznIq8CwKLbZIhT
	aK/ltTtmshQDTS1Rfzw6hx6RedfS8SRqBfii2Ji9uJrsUIrjojRLZ8j/ej0LSzNEMgFdMEDyY90DC
	317XbSv7tAuAWq1GQ1uowrGZRptQSZn2KVTLsS33YgN5D9zfG9N6HF7kktTS3jtdPaySGaXHY+XVc
	RgHpeRzQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe14a-00Dclb-RV; Thu, 29 Sep 2022 21:28:00 +0000
Date: Thu, 29 Sep 2022 22:28:00 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Zorro Lang <zlang@kernel.org>
Subject: Re: [Bug report] BUG: Kernel NULL pointer dereference at 0x00000069,
 filemap_release_folio+0x88/0xb0
Message-ID: <YzYN4JqbKdxLd6oA@casper.infradead.org>
References: <20220927011720.7jmugevxc7ax26qw@zlang-mailbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927011720.7jmugevxc7ax26qw@zlang-mailbox>
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
Cc: linux-mm@kvack.org, linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 27, 2022 at 09:17:20AM +0800, Zorro Lang wrote:
> Hi mm and ppc list,
> 
> Recently I started to hit a kernel panic [2] rarely on *ppc64le* with *1k
> blocksize* ext4. It's not easy to reproduce, but still has chance to trigger
> by loop running generic/048 on ppc64le (not sure all kind of ppc64le can
> reproduce it).
> 
> Although I've reported a bug to ext4 [1] (more details refer to [1]), but I only
> hit it on ppc64le until now, and I'm not sure if it's an ext4 related bug, more
> likes folio related issue, so I cc mm and ppc mail list, hope to get more
> reviewing.

Argh.  This is the wrong way to do it.  Please stop using bugzilla.
Now there's discussion in two places and there's nowhere to see all
of it.

> [ 4681.230907] BUG: Kernel NULL pointer dereference at 0x00000069 
> [ 4681.230922] Faulting instruction address: 0xc00000000068ee0c 
> [ 4681.230929] Oops: Kernel access of bad area, sig: 11 [#1] 
> [ 4681.230934] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries 
> [ 4681.230991] CPU: 0 PID: 82 Comm: kswapd0 Kdump: loaded Not tainted 6.0.0-rc6+ #1 
> [ 4681.230999] NIP:  c00000000068ee0c LR: c00000000068f2b8 CTR: 0000000000000000 
> [ 4681.238525] REGS: c000000006c0b560 TRAP: 0380   Not tainted  (6.0.0-rc6+) 
> [ 4681.238532] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24028242  XER: 00000000 
> [ 4681.238556] CFAR: c00000000068edf4 IRQMASK: 0  
> [ 4681.238556] GPR00: c00000000068f2b8 c000000006c0b800 c000000002cf1700 c00c00000042f1c0  
> [ 4681.238556] GPR04: c000000006c0b860 0000000000000000 0000000000000002 0000000000000000  
> [ 4681.238556] GPR08: c000000002d404b0 0000000000000000 c00c00000042f1c0 0000000000000000  
> [ 4681.238556] GPR12: c0000000001cf080 c000000005100000 c000000000194298 c0000001fff9c480  
> [ 4681.238556] GPR16: c000000048cdb850 0000000000000007 0000000000000000 0000000000000000  
> [ 4681.238556] GPR20: 0000000000000001 c000000006c0b8f8 c00000000146b9d8 5deadbeef0000100  
> [ 4681.238556] GPR24: 5deadbeef0000122 c000000048cdb800 c000000006c0bc00 c000000006c0b8e8  
> [ 4681.238556] GPR28: c000000006c0b860 c00c00000042f1c0 0000000000000009 0000000000000009  
> [ 4681.238634] NIP [c00000000068ee0c] drop_buffers.constprop.0+0x4c/0x1c0 
> [ 4681.238643] LR [c00000000068f2b8] try_to_free_buffers+0x128/0x150 
> [ 4681.238650] Call Trace: 
> [ 4681.238654] [c000000006c0b800] [c000000006c0b880] 0xc000000006c0b880 (unreliable) 
> [ 4681.238663] [c000000006c0b840] [c000000006c0bc00] 0xc000000006c0bc00 
> [ 4681.238670] [c000000006c0b890] [c000000000498708] filemap_release_folio+0x88/0xb0 
> [ 4681.238679] [c000000006c0b8b0] [c0000000004c51c0] shrink_active_list+0x490/0x750 
> [ 4681.238688] [c000000006c0b9b0] [c0000000004c9f88] shrink_lruvec+0x3f8/0x430 
> [ 4681.238697] [c000000006c0baa0] [c0000000004ca1f4] shrink_node_memcgs+0x234/0x290 
> [ 4681.238704] [c000000006c0bb10] [c0000000004ca3c4] shrink_node+0x174/0x6b0 
> [ 4681.238711] [c000000006c0bbc0] [c0000000004cacf0] balance_pgdat+0x3f0/0x970 
> [ 4681.238718] [c000000006c0bd20] [c0000000004cb440] kswapd+0x1d0/0x450 
> [ 4681.238726] [c000000006c0bdc0] [c0000000001943d8] kthread+0x148/0x150 
> [ 4681.238735] [c000000006c0be10] [c00000000000cbe4] ret_from_kernel_thread+0x5c/0x64 
> [ 4681.238745] Instruction dump: 
> [ 4681.238749] fbc1fff0 f821ffc1 7c7d1b78 7c9c2378 ebc30028 7fdff378 48000018 60000000  
> [ 4681.238765] 60000000 ebff0008 7c3ef840 41820048 <815f0060> e93f0000 5529077c 7d295378  

Running that through scripts/decodecode (with some minor hacks .. how
do PPC people do this properly?) I get:

   0:	fb c1 ff f0 	std     r30,-16(r1)
   4:	f8 21 ff c1 	stdu    r1,-64(r1)
   8:	7c 7d 1b 78 	mr      r29,r3
   c:	7c 9c 23 78 	mr      r28,r4
  10:	eb c3 00 28 	ld      r30,40(r3)
  14:	7f df f3 78 	mr      r31,r30
  18:	48 00 00 18 	b       0x30
  1c:	60 00 00 00 	nop
  20:	60 00 00 00 	nop
  24:	eb ff 00 08 	ld      r31,8(r31)
  28:	7c 3e f8 40 	cmpld   r30,r31
  2c:	41 82 00 48 	beq     0x74
  30:*	81 5f 00 60 	lwz     r10,96(r31)		<-- trapping instruction
  34:	e9 3f 00 00 	ld      r9,0(r31)
  38:	55 29 07 7c 	rlwinm  r9,r9,0,29,30
  3c:	7d 29 53 78 	or      r9,r9,r10

That would seem to track; 96 is 0x60 and r31 contains 0x00..09, giving
us an effective address of 0x69.

It would be nice to know what source line that corresponds to.  Could
you use scripts/faddr2line to turn drop_buffers.constprop.0+0x4c/0x1c0
into a line number?  I can't because it needs the vmlinux you generated.
