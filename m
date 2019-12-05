Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6781149FE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 00:49:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TXVm5hHlzDqZb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 10:49:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TXSd12lzzDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 10:47:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="MU6YF9GW"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47TXSZ3xJZz9sP3;
 Fri,  6 Dec 2019 10:47:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1575589632;
 bh=wAZuwdnJoPe3+FgYUjdUVPeIo9sHGAkp3Xkas6yjm7o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=MU6YF9GWTfd+tSG/eJAgCm9dAGjrBKg1tM8fmqVstE+pyyvxQYftJIoyoJb4UoB+n
 iAbTbh3Pzzo6U+76W/pknMo72GC/k0S1fYx5sHZEhRM59UMTHvAiBUE60m4ExKYWVL
 C9NUXPbo7ahc/uMdvxR1csPyXMZ7CYcLSZDxo11uNeAi/Nu/yzGdgls9NslSAk428x
 idE3FkCFbLHtWe+rfMPVDTvP4/i51RKKfG0P+3E5aZKO5LgfigGuK0JokmQuYWskVA
 7hohWPDKM2dZXUXEezikSBZ12IjI8PlsxLaxK0Su1ZU6KUaa1hGNMe7tHhlDuruHgU
 Lc4GFzX64uDjg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 2/5] powerpc/kprobes: Mark newly allocated probes as RO
In-Reply-To: <8736f636bl.fsf@mpe.ellerman.id.au>
References: <20191030073111.140493-1-ruscur@russell.cc>
 <20191030073111.140493-3-ruscur@russell.cc>
 <8736f636bl.fsf@mpe.ellerman.id.au>
Date: Fri, 06 Dec 2019 10:47:10 +1100
Message-ID: <87eexie3nl.fsf@mpe.ellerman.id.au>
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
Cc: dja@axtens.net, joel@jms.id.au, ajd@linux.ibm.com, npiggin@gmail.com,
 kernel-hardening@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Russell Currey <ruscur@russell.cc> writes:
>> With CONFIG_STRICT_KERNEL_RWX=y and CONFIG_KPROBES=y, there will be one
>> W+X page at boot by default.  This can be tested with
>> CONFIG_PPC_PTDUMP=y and CONFIG_PPC_DEBUG_WX=y set, and checking the
>> kernel log during boot.
>>
>> powerpc doesn't implement its own alloc() for kprobes like other
>> architectures do, but we couldn't immediately mark RO anyway since we do
>> a memcpy to the page we allocate later.  After that, nothing should be
>> allowed to modify the page, and write permissions are removed well
>> before the kprobe is armed.
>>
>> Thus mark newly allocated probes as read-only once it's safe to do so.
>>
>> Signed-off-by: Russell Currey <ruscur@russell.cc>
>> ---
>>  arch/powerpc/kernel/kprobes.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
>> index 2d27ec4feee4..2610496de7c7 100644
>> --- a/arch/powerpc/kernel/kprobes.c
>> +++ b/arch/powerpc/kernel/kprobes.c
>> @@ -24,6 +24,7 @@
>>  #include <asm/sstep.h>
>>  #include <asm/sections.h>
>>  #include <linux/uaccess.h>
>> +#include <linux/set_memory.h>
>>  
>>  DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
>>  DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
>> @@ -131,6 +132,8 @@ int arch_prepare_kprobe(struct kprobe *p)
>>  			(unsigned long)p->ainsn.insn + sizeof(kprobe_opcode_t));
>>  	}
>>  
>> +	set_memory_ro((unsigned long)p->ainsn.insn, 1);
>> +
>
> That comes from:
> 	p->ainsn.insn = get_insn_slot();
>
>
> Which ends up in __get_insn_slot() I think. And that looks very much
> like it's going to hand out multiple slots per page, which isn't going
> to work because you've just marked the whole page RO.
>
> So I would expect this to crash on the 2nd kprobe that's installed. Have
> you tested it somehow?

I'm not sure if this is the issue I was talking about, but it doesn't
survive ftracetest:

  [ 1139.576047] ------------[ cut here ]------------
  [ 1139.576322] kernel BUG at mm/memory.c:2036!
  cpu 0x1f: Vector: 700 (Program Check) at [c000001fd6c675d0]
      pc: c00000000035d018: apply_to_page_range+0x318/0x610
      lr: c0000000000900bc: change_memory_attr+0x4c/0x70
      sp: c000001fd6c67860
     msr: 9000000000029033
    current = 0xc000001fa4a47880
    paca    = 0xc000001ffffe5c80   irqmask: 0x03   irq_happened: 0x01
      pid   = 7168, comm = ftracetest
  kernel BUG at mm/memory.c:2036!
  Linux version 5.4.0-gcc-8.2.0-11694-gf1f9aa266811 (michael@Raptor-2.ozlabs.ibm.com) (gcc version 8.2.0 (crosstool-NG 1.24.0-rc1.16-9627a04)) #1384 SMP Thu Dec 5 22:11:09 AEDT 2019
  enter ? for help
  [c000001fd6c67940] c0000000000900bc change_memory_attr+0x4c/0x70
  [c000001fd6c67970] c000000000053c48 arch_prepare_kprobe+0xb8/0x120
  [c000001fd6c679e0] c00000000022f718 register_kprobe+0x608/0x790
  [c000001fd6c67a40] c00000000022fc50 register_kretprobe+0x230/0x350
  [c000001fd6c67a80] c0000000002849b4 __register_trace_kprobe+0xf4/0x1a0
  [c000001fd6c67af0] c000000000285b18 trace_kprobe_create+0x738/0xf70
  [c000001fd6c67c30] c000000000286378 create_or_delete_trace_kprobe+0x28/0x70
  [c000001fd6c67c50] c00000000025f024 trace_run_command+0xc4/0xe0
  [c000001fd6c67ca0] c00000000025f128 trace_parse_run_command+0xe8/0x230
  [c000001fd6c67d40] c0000000002845d0 probes_write+0x20/0x40
  [c000001fd6c67d60] c0000000003eef4c __vfs_write+0x3c/0x70
  [c000001fd6c67d80] c0000000003f26a0 vfs_write+0xd0/0x200
  [c000001fd6c67dd0] c0000000003f2a3c ksys_write+0x7c/0x140
  [c000001fd6c67e20] c00000000000b9e0 system_call+0x5c/0x68
  --- Exception: c01 (System Call) at 00007fff8f06e420
  SP (7ffff93d6830) is in userspace
  1f:mon> client_loop: send disconnect: Broken pipe


Sorry I didn't get any more info on the crash, I lost the console and
then some CI bot stole the machine 8)

You should be able to reproduce just by running ftracetest.

cheers
