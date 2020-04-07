Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7291A0E18
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:04:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xSKJ4LYmzDqTh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 23:04:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=KdgA/RAd; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xSGH0PnZzDqc5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 23:01:24 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id 123so1450390qkm.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 06:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=aXHwtXufplShnby/dSIu03ngW1zQC9+PA15Esrg/Ess=;
 b=KdgA/RAdZn4Uo8KKU+SfGnMLhLgLtWu26A0lGUEfLdAeZ7uWWkFsmI8X/+4x0JshmX
 EdKtHwrBSAlx9e29Ri0VrLeBZeOduL1+tqTHTbsgVk22rm+WwrRLxGaCSXQ0dR8QOQoM
 Zv+hbQljJ1irdAH3aKqR3lCDIV7FPdEXndeluqpMy1fkEVCPReaEI04uRBegdl0XTNv5
 2cr0zZGSY9s7NH2aU1RgA15tYHv05PiJCVa5t26CuLHzbsU+2XjJxiQdG/yOIL8N2S5d
 Bht+lNzzKfF7qWeLdSKHexJqTo4v+uUXIbqRvASmRGroR8nxjxIPT3xGYRJT2C0NIRCB
 gNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=aXHwtXufplShnby/dSIu03ngW1zQC9+PA15Esrg/Ess=;
 b=FnmZQB6VASsQszBtQ52WUwQKELObecpb++80N1dJANY6ukLqR/nO32kYS0WeRAGyTQ
 M0MPzfcxJVZpDa6O5L0/Ss3p2fnTHfbCY6v21U7laCSW4sfaz3lbFdc5K0/jtTyh2XNy
 psAJBeLwIB2rhx4bsIJRXDBv2hM4gkondsaWBAqC92xu4rNbAsuy12wk70mjflh2hzUo
 iOEa791SGZnai1AE80suqjz55eyygtR5G/ZUbfVjGh2nENtDsbo/cn6FV4tCmKLPEAG1
 tbEIwUGhxVIqet9BUWMiMWv6kc/ea0m5PHF4c0KBPq3+uZ+03uVm29ZzI3xzkwIUK2Nv
 9fFA==
X-Gm-Message-State: AGi0Pub0LzZOhK6fcF/5zV2Sy/nh2XQBjWpuGPE06swl4CqcgMmi3y5x
 cR/A2FxuKprFjDJFUz+uJHOWqQ==
X-Google-Smtp-Source: APiQypKYRVXmF0vecL1IyOQnHFVlgVZqhtgfx4CAa9BmeIJL/OXq5b4jWFPKERC8InZ5MynTBO7BXw==
X-Received: by 2002:a37:5209:: with SMTP id g9mr2068812qkb.237.1586264479949; 
 Tue, 07 Apr 2020 06:01:19 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id u126sm6385431qkh.66.2020.04.07.06.01.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Apr 2020 06:01:19 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Linux-next POWER9 NULL pointer NIP since 1st Apr.
From: Qian Cai <cai@lca.pw>
In-Reply-To: <87eeszlb6u.fsf@mpe.ellerman.id.au>
Date: Tue, 7 Apr 2020 09:01:10 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <0675B22E-8F32-432C-9378-FDE159DD1729@lca.pw>
References: <15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw>
 <87eeszlb6u.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+ Steven

> On Apr 7, 2020, at 8:42 AM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Qian Cai <cai@lca.pw> writes:
>> Ever since 1st Apr, linux-next starts to trigger a NULL pointer NIP =
on POWER9 below using
>> this config,
>>=20
>> =
https://raw.githubusercontent.com/cailca/linux-mm/master/powerpc.config
>>=20
>> It takes a while to reproduce, so before I bury myself into bisecting =
and just send a head-up
>> to see if anyone spots anything obvious.
>>=20
>> [  206.744625][T13224] LTP: starting fallocate04
>> [  207.601583][T27684] /dev/zero: Can't open blockdev
>> [  208.674301][T27684] EXT4-fs (loop0): mounting ext3 file system =
using the ext4 subsystem
>> [  208.680347][T27684] BUG: Unable to handle kernel instruction fetch =
(NULL pointer?)
>> [  208.680383][T27684] Faulting instruction address: 0x00000000
>> [  208.680406][T27684] Oops: Kernel access of bad area, sig: 11 [#1]
>> [  208.680439][T27684] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D256=
 DEBUG_PAGEALLOC NUMA PowerNV
>> [  208.680474][T27684] Modules linked in: ext4 crc16 mbcache jbd2 =
loop kvm_hv kvm ip_tables x_tables xfs sd_mod bnx2x ahci libahci mdio =
tg3 libata libphy firmware_class dm_mirror dm_region_hash dm_log dm_mod
>> [  208.680576][T27684] CPU: 117 PID: 27684 Comm: fallocate04 Tainted: =
G        W         5.6.0-next-20200401+ #288
>> [  208.680614][T27684] NIP:  0000000000000000 LR: c0080000102c0048 =
CTR: 0000000000000000
>> [  208.680657][T27684] REGS: c000200361def420 TRAP: 0400   Tainted: G =
       W          (5.6.0-next-20200401+)
>> [  208.680700][T27684] MSR:  900000004280b033 =
<SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 42022228  XER: 20040000
>> [  208.680760][T27684] CFAR: c00800001032c494 IRQMASK: 0=20
>> [  208.680760][T27684] GPR00: c0000000005ac3f8 c000200361def6b0 =
c00000000165c200 c00020107dae0bd0=20
>> [  208.680760][T27684] GPR04: 0000000000000000 0000000000000400 =
0000000000000000 0000000000000000=20
>> [  208.680760][T27684] GPR08: c000200361def6e8 c0080000102c0040 =
000000007fffffff c000000001614e80=20
>> [  208.680760][T27684] GPR12: 0000000000000000 c000201fff671280 =
0000000000000000 0000000000000002=20
>> [  208.680760][T27684] GPR16: 0000000000000002 0000000000040001 =
c00020030f5a1000 c00020030f5a1548=20
>> [  208.680760][T27684] GPR20: c0000000015fbad8 c00000000168c654 =
c000200361def818 c0000000005b4c10=20
>> [  208.680760][T27684] GPR24: 0000000000000000 c0080000103365b8 =
c00020107dae0bd0 0000000000000400=20
>> [  208.680760][T27684] GPR28: c00000000168c3a8 0000000000000000 =
0000000000000000 0000000000000000=20
>> [  208.681014][T27684] NIP [0000000000000000] 0x0
>> [  208.681065][T27684] LR [c0080000102c0048] ext4_iomap_end+0x8/0x30 =
[ext4]
>=20
> That LR looks like it's pointing to the return from _mcount in
> ext4_iomap_end(), which means we have probably crashed in ftrace
> somewhere.
>=20
> Did you have tracing enabled when you ran the test? Or does it do
> tracing itself?

Yes, it run ftrace at first before running LTP to trigger it,

https://github.com/cailca/linux-mm/blob/master/test.sh

echo function > /sys/kernel/debug/tracing/current_tracer
echo nop > /sys/kernel/debug/tracing/current_tracer

There is another crash with even non-NULL NIP, but then symbol behaves =
weird.

# ./scripts/faddr2line vmlinux sysctl_net_busy_read+0x0/0x4
skipping sysctl_net_busy_read address at 0xc0000000016804ac due to =
non-function symbol of type 'D'

[  148.110969][T13115] LTP: starting chown04_16
[  148.255048][T13380] kernel tried to execute exec-protected page =
(c0000000016804ac) - exploit attempt? (uid: 0)
[  148.255099][T13380] BUG: Unable to handle kernel instruction fetch
[  148.255122][T13380] Faulting instruction address: 0xc0000000016804ac
[  148.255136][T13380] Oops: Kernel access of bad area, sig: 11 [#1]
[  148.255157][T13380] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D256 =
DEBUG_PAGEALLOC NUMA PowerNV
[  148.255171][T13380] Modules linked in: loop kvm_hv kvm xfs sd_mod =
bnx2x mdio ahci tg3 libahci libphy libata firmware_class dm_mirror =
dm_region_hash dm_log dm_mod
[  148.255213][T13380] CPU: 45 PID: 13380 Comm: chown04_16 Tainted: G    =
    W         5.6.0+ #7
[  148.255236][T13380] NIP:  c0000000016804ac LR: c00800000fa60408 CTR: =
c0000000016804ac
[  148.255250][T13380] REGS: c0000010a6fafa00 TRAP: 0400   Tainted: G    =
    W          (5.6.0+)
[  148.255281][T13380] MSR:  9000000010009033 <SF,HV,EE,ME,IR,DR,RI,LE>  =
CR: 84000248  XER: 20040000
[  148.255310][T13380] CFAR: c00800000fa66534 IRQMASK: 0=20
[  148.255310][T13380] GPR00: c000000000973268 c0000010a6fafc90 =
c000000001648200 0000000000000000=20
[  148.255310][T13380] GPR04: c000000d8a22dc00 c0000010a6fafd30 =
00000000b5e98331 ffffffff00012c9f=20
[  148.255310][T13380] GPR08: c000000d8a22dc00 0000000000000000 =
0000000000000000 c00000000163c520=20
[  148.255310][T13380] GPR12: c0000000016804ac c000001ffffdad80 =
0000000000000000 0000000000000000=20
[  148.255310][T13380] GPR16: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000000=20
[  148.255310][T13380] GPR20: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000000=20
[  148.255310][T13380] GPR24: 00007fff8f5e2e48 0000000000000000 =
c00800000fa6a488 c0000010a6fafd30=20
[  148.255310][T13380] GPR28: 0000000000000000 000000007fffffff =
c00800000fa60400 c000000efd0c6780=20
[  148.255494][T13380] NIP [c0000000016804ac] =
sysctl_net_busy_read+0x0/0x4
[  148.255516][T13380] LR [c00800000fa60408] find_free_cb+0x8/0x30 =
[loop]
[  148.255528][T13380] Call Trace:
[  148.255538][T13380] [c0000010a6fafc90] [c0000000009732c0] =
idr_for_each+0xf0/0x170 (unreliable)
[  148.255572][T13380] [c0000010a6fafd10] [c00800000fa626c4] =
loop_lookup.part.1+0x4c/0xb0 [loop]
[  148.255597][T13380] [c0000010a6fafd50] [c00800000fa634d8] =
loop_control_ioctl+0x120/0x1d0 [loop]
[  148.255623][T13380] [c0000010a6fafdb0] [c0000000004ddc08] =
ksys_ioctl+0xd8/0x130
[  148.255636][T13380] [c0000010a6fafe00] [c0000000004ddc88] =
sys_ioctl+0x28/0x40
[  148.255669][T13380] [c0000010a6fafe20] [c00000000000b378] =
system_call+0x5c/0x68
[  148.255699][T13380] Instruction dump:
[  148.255718][T13380] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX =
XXXXXXXX XXXXXXXX XXXXXXXX=20
[  148.255744][T13380] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX =
XXXXXXXX XXXXXXXX XXXXXXXX=20
[  148.255772][T13380] ---[ end trace a5894a74208c22ec ]---
[  148.576663][T13380]=20
[  149.576765][T13380] Kernel panic - not syncing: Fatal exception

The bisect so far indicated the bad ones always have this,

aa1a8ce53332 Merge tag 'trace-v5.7' of =
git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace

I=E2=80=99ll go to bisect some more but it is going to take a while.

$ git log --oneline 4c205c84e249..8e99cf91b99b
8e99cf91b99b tracing: Do not allocate buffer in trace_find_next_entry() =
in atomic
2ab2a0924b99 tracing: Add documentation on set_ftrace_notrace_pid and =
set_event_notrace_pid
ebed9628f5c2 selftests/ftrace: Add test to test new =
set_event_notrace_pid file
ed8839e072b8 selftests/ftrace: Add test to test new =
set_ftrace_notrace_pid file
276836260301 tracing: Create set_event_notrace_pid to not trace tasks
b3b1e6ededa4 ftrace: Create set_ftrace_notrace_pid to not trace tasks
717e3f5ebc82 ftrace: Make function trace pid filtering a bit more exact
6a13a0d7b4d1 ftrace/kprobe: Show the maxactive number on kprobe_events
8a815e6b8b88 tracing: Have the document reflect that the trace file =
keeps tracing enabled
c9b7a4a72ff6 ring-buffer/tracing: Have iterator acknowledge dropped =
events
06e0a548bad0 tracing: Do not disable tracing when reading the trace file
1039221cc278 ring-buffer: Do not disable recording when there is an =
iterator
07b8b10ec94f ring-buffer: Make resize disable per cpu buffer instead of =
total buffer
153368ce1bd0 ring-buffer: Optimize rb_iter_head_event()
ff84c50cfb4b ring-buffer: Do not die if rb_iter_peek() fails more than =
thrice
785888c544e0 ring-buffer: Have rb_iter_head_event() handle concurrent =
writer
28e3fc56a471 ring-buffer: Add page_stamp to iterator for synchronization
bc1a72afdc4a ring-buffer: Rename ring_buffer_read() to =
read_buffer_iter_advance()
ead6ecfddea5 ring-buffer: Have ring_buffer_empty() not depend on tracing =
stopped
ff895103a84a tracing: Save off entry when peeking at next entry
8c77f0ba4156 selftest/ftrace: Fix function trigger test to handle trace =
not disabling the tracer
bf2cbe044da2 tracing: Use address-of operator on section symbols
bbd9d05618a6 gpu/trace: add a gpu total memory usage tracepoint
89b74cac7834 tools/bootconfig: Show line and column in parse error
306b69dce926 bootconfig: Support O=3D<builddir> option
5412e0b763e0 tracing: Remove unused TRACE_BUFFER bits
b396bfdebffc tracing: Have hwlat ts be first instance and record count =
of instances


>=20
> cheers
>=20
>> [  208.681091][T27684] Call Trace:
>> [  208.681129][T27684] [c000200361def6b0] [c0000000005ac3bc] =
iomap_apply+0x20c/0x920 (unreliable) iomap_apply at fs/iomap/apply.c:80 =
(discriminator 4)
>> [  208.681173][T27684] [c000200361def7f0] [c0000000005b4adc] =
iomap_bmap+0xfc/0x160 iomap_bmap at fs/iomap/fiemap.c:142
>> [  208.681228][T27684] [c000200361def850] [c0080000102c2c1c] =
ext4_bmap+0xa4/0x180 [ext4] ext4_bmap at fs/ext4/inode.c:3213
>> [  208.681260][T27684] [c000200361def890] [c0000000004f71fc] =
bmap+0x4c/0x80
>> [  208.681281][T27684] [c000200361def8c0] [c00800000fdb0acc] =
jbd2_journal_init_inode+0x44/0x1a0 [jbd2] jbd2_journal_init_inode at =
fs/jbd2/journal.c:1255
>> [  208.681326][T27684] [c000200361def960] [c00800001031c808] =
ext4_load_journal+0x440/0x860 [ext4]
>> [  208.681371][T27684] [c000200361defa30] [c008000010322a14] =
ext4_fill_super+0x342c/0x3ab0 [ext4]
>> [  208.681414][T27684] [c000200361defba0] [c0000000004cb0bc] =
mount_bdev+0x25c/0x290
>> [  208.681478][T27684] [c000200361defc40] [c008000010310250] =
ext4_mount+0x28/0x50 [ext4]
>> [  208.681520][T27684] [c000200361defc60] [c00000000053242c] =
legacy_get_tree+0x4c/0xb0
>> [  208.681556][T27684] [c000200361defc90] [c0000000004c864c] =
vfs_get_tree+0x4c/0x130
>> [  208.681593][T27684] [c000200361defd00] [c00000000050a1c8] =
do_mount+0xa18/0xc50
>> [  208.681641][T27684] [c000200361defdd0] [c00000000050a9a8] =
sys_mount+0x158/0x180
>> [  208.681679][T27684] [c000200361defe20] [c00000000000b3f8] =
system_call+0x5c/0x68
>> [  208.681726][T27684] Instruction dump:
>> [  208.681747][T27684] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX =
XXXXXXXX XXXXXXXX XXXXXXXX=20
>> [  208.681797][T27684] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX =
XXXXXXXX XXXXXXXX XXXXXXXX=20
>> [  208.681839][T27684] ---[ end trace 4e9e2bab7f1d4048 ]---
>> [  208.802259][T27684]=20
>> [  209.802373][T27684] Kernel panic - not syncing: Fatal exception
>>=20
>> [  215.281666][T16896] LTP: starting chown04_16
>> [  215.424203][T18297] BUG: Unable to handle kernel instruction fetch =
(NULL pointer?)
>> [  215.424289][T18297] Faulting instruction address: 0x00000000
>> [  215.424313][T18297] Oops: Kernel access of bad area, sig: 11 [#1]
>> [  215.424341][T18297] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D256=
 DEBUG_PAGEALLOC NUMA PowerNV
>> [  215.424383][T18297] Modules linked in: loop kvm_hv kvm ip_tables =
x_tables xfs sd_mod bnx2x mdio tg3 ahci libahci libphy libata =
firmware_class dm_mirror dm_region_hash dm_log dm_mod
>> [  215.424459][T18297] CPU: 85 PID: 18297 Comm: chown04_16 Tainted: G =
       W         5.6.0-next-20200405+ #3
>> [  215.424489][T18297] NIP:  0000000000000000 LR: c00800000fbc0408 =
CTR: 0000000000000000
>> [  215.424530][T18297] REGS: c000200b8606f990 TRAP: 0400   Tainted: G =
       W          (5.6.0-next-20200405+)
>> [  215.424570][T18297] MSR:  9000000040009033 =
<SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84000248  XER: 20040000
>> [  215.424619][T18297] CFAR: c00800000fbc64f4 IRQMASK: 0=20
>> [  215.424619][T18297] GPR00: c0000000006c2238 c000200b8606fc20 =
c00000000165ce00 0000000000000000=20
>> [  215.424619][T18297] GPR04: c000201a58106400 c000200b8606fcc0 =
000000005f037e7d ffffffff00013bfb=20
>> [  215.424619][T18297] GPR08: c000201a58106400 0000000000000000 =
0000000000000000 c000000001652ee0=20
>> [  215.424619][T18297] GPR12: 0000000000000000 c000201fff69a600 =
0000000000000000 0000000000000000=20
>> [  215.424619][T18297] GPR16: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000000=20
>> [  215.424619][T18297] GPR20: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000007=20
>> [  215.424619][T18297] GPR24: 0000000000000000 0000000000000000 =
c00800000fbc8688 c000200b8606fcc0=20
>> [  215.424619][T18297] GPR28: 0000000000000000 000000007fffffff =
c00800000fbc0400 c00020068b8c0e70=20
>> [  215.424914][T18297] NIP [0000000000000000] 0x0
>> [  215.424953][T18297] LR [c00800000fbc0408] find_free_cb+0x8/0x30 =
[loop]
>> find_free_cb at drivers/block/loop.c:2129
>> [  215.424997][T18297] Call Trace:
>> [  215.425036][T18297] [c000200b8606fc20] [c0000000006c2290] =
idr_for_each+0xf0/0x170 (unreliable)
>> [  215.425073][T18297] [c000200b8606fca0] [c00800000fbc2744] =
loop_lookup.part.2+0x4c/0xb0 [loop]
>> loop_lookup at drivers/block/loop.c:2144
>> [  215.425105][T18297] [c000200b8606fce0] [c00800000fbc3558] =
loop_control_ioctl+0x120/0x1d0 [loop]
>> [  215.425149][T18297] [c000200b8606fd40] [c0000000004eb688] =
ksys_ioctl+0xd8/0x130
>> [  215.425190][T18297] [c000200b8606fd90] [c0000000004eb708] =
sys_ioctl+0x28/0x40
>> [  215.425233][T18297] [c000200b8606fdb0] [c00000000003cc30] =
system_call_exception+0x110/0x1e0
>> [  215.425274][T18297] [c000200b8606fe20] [c00000000000c9f0] =
system_call_common+0xf0/0x278
>> [  215.425314][T18297] Instruction dump:
>> [  215.425338][T18297] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX =
XXXXXXXX XXXXXXXX XXXXXXXX=20
>> [  215.425374][T18297] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX =
XXXXXXXX XXXXXXXX XXXXXXXX=20
>> [  215.425422][T18297] ---[ end trace ebed248fad431966 ]---
>> [  215.642114][T18297]=20
>> [  216.642220][T18297] Kernel panic - not syncing: Fatal exception

