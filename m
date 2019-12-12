Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A654F11C613
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 07:45:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YPSG5CkyzDqw4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 17:45:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="HejDlK/1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Lt8ZKVPt"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YPQ22ZW7zDqn4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 17:43:14 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id AE12C22491;
 Thu, 12 Dec 2019 01:43:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 12 Dec 2019 01:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
 KyeWj8I1QMnmG8BRD33xXuY6tRJtAPepF3GJKhvFlro=; b=HejDlK/1SuGGBh2U
 VSzZQ1jtkfDeE1LwGxG4T6rprj8MkGil741naD2w3v+l9+WoE5iOq3MmnmG0hVkV
 2VgGkNsgtIhJ9oAhNQmJBcbmVZhXt37UqxhCnleuto/eRZs5OR5Oi8+WyrMwsMvT
 j4PGwLJflSV5qb3l6BP8BAXSR+67igfV/cB7QEUva8AJKdjl3MdmYaU5xOSDQ9c4
 JIEZiyDp/JbaNr15K7/+y7yw41HI/Q8QEOnalbvvLaeAE5p7X2xqt1kCrJy5Fu34
 Dz5I2lVY5khYoZwAV2hVFQ009Eya8xLKo/VIfF+GhKoPCmVrU6vkdGrA7BXkyuSX
 5JK2DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=KyeWj8I1QMnmG8BRD33xXuY6tRJtAPepF3GJKhvFl
 ro=; b=Lt8ZKVPtexLF/AskJaPBbCVVyQFCb/lgfHRlhEaaQ8lArbKqULD8jOTwF
 pEgEwdIvmy2ZsEZipq/RaD1gRQtUAjGvbVdv9O3tgOT0Jpw0Z4M0pKnC6tBptE9u
 qHWj/OBV+ukIBZHw8N5pLdHDY+rgSEhlepVeDkOBhK6J2yNflo/Q7jA8nfcisTxe
 z6E5DN4ZWg8+fMvEu2NI4nq8K1RdbdJBnDTsD9wqCbHN1G2Pp/HbRx3CXxaD9mgH
 RZYAqI6PuDQbPuGl76osu8Y9tdgOWbNkPcO+Zgh+Buo4oh26TlC0fPPugy3dfkFc
 ESrCQftm3rtbz9fpoeoNCYBxyujVQ==
X-ME-Sender: <xms:feHxXaqRFqJfPBu82gMup8LSdZ-MvkSxJKv1oVEfxVCvW742jmUXAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeliedgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdluddtmdenucfjughrpefkuf
 fhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
 rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvvddrleelrd
 ekvddruddtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghl
 lhdrtggtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:feHxXUq_6t_Fvu7O6Z9Tvdq7Mg-ukP6SQuxF_8gDM23_fcZDgmCizQ>
 <xmx:feHxXRY_y0XBFHaDqaJHvdLnnLsaFMT4ZSeyMcv8To-Ewcglvq80Gg>
 <xmx:feHxXa-AM8F54FMjU8DhkOCGEsPKApZtGbyP7RkDYD4G3Ua-WD_-6w>
 <xmx:fuHxXXmI5uEodkUlXZid_KiovUsjzRht4SMGI_va0Jm2RqK3nveZnQ>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 19BA230600AB;
 Thu, 12 Dec 2019 01:43:06 -0500 (EST)
Message-ID: <d01de33ebe1fb1e0715878383a68e8e174d048a0.camel@russell.cc>
Subject: Re: [PATCH v5 2/5] powerpc/kprobes: Mark newly allocated probes as RO
From: Russell Currey <ruscur@russell.cc>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 12 Dec 2019 17:43:03 +1100
In-Reply-To: <87eexie3nl.fsf@mpe.ellerman.id.au>
References: <20191030073111.140493-1-ruscur@russell.cc>
 <20191030073111.140493-3-ruscur@russell.cc>
 <8736f636bl.fsf@mpe.ellerman.id.au> <87eexie3nl.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.2 
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
Cc: dja@axtens.net, joel@jms.id.au, ajd@linux.ibm.com, npiggin@gmail.com,
 kernel-hardening@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-12-06 at 10:47 +1100, Michael Ellerman wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
> > Russell Currey <ruscur@russell.cc> writes:
> > > With CONFIG_STRICT_KERNEL_RWX=y and CONFIG_KPROBES=y, there will
> > > be one
> > > W+X page at boot by default.  This can be tested with
> > > CONFIG_PPC_PTDUMP=y and CONFIG_PPC_DEBUG_WX=y set, and checking
> > > the
> > > kernel log during boot.
> > > 
> > > powerpc doesn't implement its own alloc() for kprobes like other
> > > architectures do, but we couldn't immediately mark RO anyway
> > > since we do
> > > a memcpy to the page we allocate later.  After that, nothing
> > > should be
> > > allowed to modify the page, and write permissions are removed
> > > well
> > > before the kprobe is armed.
> > > 
> > > Thus mark newly allocated probes as read-only once it's safe to
> > > do so.
> > > 
> > > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > > ---
> > >  arch/powerpc/kernel/kprobes.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/arch/powerpc/kernel/kprobes.c
> > > b/arch/powerpc/kernel/kprobes.c
> > > index 2d27ec4feee4..2610496de7c7 100644
> > > --- a/arch/powerpc/kernel/kprobes.c
> > > +++ b/arch/powerpc/kernel/kprobes.c
> > > @@ -24,6 +24,7 @@
> > >  #include <asm/sstep.h>
> > >  #include <asm/sections.h>
> > >  #include <linux/uaccess.h>
> > > +#include <linux/set_memory.h>
> > >  
> > >  DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
> > >  DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
> > > @@ -131,6 +132,8 @@ int arch_prepare_kprobe(struct kprobe *p)
> > >  			(unsigned long)p->ainsn.insn +
> > > sizeof(kprobe_opcode_t));
> > >  	}
> > >  
> > > +	set_memory_ro((unsigned long)p->ainsn.insn, 1);
> > > +
> > 
> > That comes from:
> > 	p->ainsn.insn = get_insn_slot();
> > 
> > 
> > Which ends up in __get_insn_slot() I think. And that looks very
> > much
> > like it's going to hand out multiple slots per page, which isn't
> > going
> > to work because you've just marked the whole page RO.
> > 
> > So I would expect this to crash on the 2nd kprobe that's installed.
> > Have
> > you tested it somehow?
> 
> I'm not sure if this is the issue I was talking about, but it doesn't
> survive ftracetest:
> 
>   [ 1139.576047] ------------[ cut here ]------------
>   [ 1139.576322] kernel BUG at mm/memory.c:2036!
>   cpu 0x1f: Vector: 700 (Program Check) at [c000001fd6c675d0]
>       pc: c00000000035d018: apply_to_page_range+0x318/0x610
>       lr: c0000000000900bc: change_memory_attr+0x4c/0x70
>       sp: c000001fd6c67860
>      msr: 9000000000029033
>     current = 0xc000001fa4a47880
>     paca    = 0xc000001ffffe5c80   irqmask: 0x03   irq_happened: 0x01
>       pid   = 7168, comm = ftracetest
>   kernel BUG at mm/memory.c:2036!
>   Linux version 5.4.0-gcc-8.2.0-11694-gf1f9aa266811 (
> michael@Raptor-2.ozlabs.ibm.com) (gcc version 8.2.0 (crosstool-NG
> 1.24.0-rc1.16-9627a04)) #1384 SMP Thu Dec 5 22:11:09 AEDT 2019
>   enter ? for help
>   [c000001fd6c67940] c0000000000900bc change_memory_attr+0x4c/0x70
>   [c000001fd6c67970] c000000000053c48 arch_prepare_kprobe+0xb8/0x120
>   [c000001fd6c679e0] c00000000022f718 register_kprobe+0x608/0x790
>   [c000001fd6c67a40] c00000000022fc50 register_kretprobe+0x230/0x350
>   [c000001fd6c67a80] c0000000002849b4
> __register_trace_kprobe+0xf4/0x1a0
>   [c000001fd6c67af0] c000000000285b18 trace_kprobe_create+0x738/0xf70
>   [c000001fd6c67c30] c000000000286378
> create_or_delete_trace_kprobe+0x28/0x70
>   [c000001fd6c67c50] c00000000025f024 trace_run_command+0xc4/0xe0
>   [c000001fd6c67ca0] c00000000025f128
> trace_parse_run_command+0xe8/0x230
>   [c000001fd6c67d40] c0000000002845d0 probes_write+0x20/0x40
>   [c000001fd6c67d60] c0000000003eef4c __vfs_write+0x3c/0x70
>   [c000001fd6c67d80] c0000000003f26a0 vfs_write+0xd0/0x200
>   [c000001fd6c67dd0] c0000000003f2a3c ksys_write+0x7c/0x140
>   [c000001fd6c67e20] c00000000000b9e0 system_call+0x5c/0x68
>   --- Exception: c01 (System Call) at 00007fff8f06e420
>   SP (7ffff93d6830) is in userspace
>   1f:mon> client_loop: send disconnect: Broken pipe
> 
> 
> Sorry I didn't get any more info on the crash, I lost the console and
> then some CI bot stole the machine 8)
> 
> You should be able to reproduce just by running ftracetest.

The test that blew it up was test.d/kprobe/probepoint.tc for the
record.  It goes away when replacing the memcpy with a
patch_instruction().

> 
> cheers

