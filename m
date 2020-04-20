Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EEC1B016E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 08:19:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495Gkk5wcFzDqlf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 16:19:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495Gds5wqFzDqg8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 16:15:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PsP6bWmZ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 495Gdq6Sxdz9sP7;
 Mon, 20 Apr 2020 16:15:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1587363328;
 bh=jMbpUrFLCEWJHGPV21XUdQwz2t4zTHzw3N1SnDjXtIM=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=PsP6bWmZq+pQKtfGUzVtITA//qBoULHWlb1zzEwLRke2tL0v8bEIgiEgAzQjPpVWX
 f5woRSpv4JrZq/r8PghWOTMwo/ChigWmv8xLsErTRaieANH55vcmRTjskeJAwR58bi
 gTarv65t03ymYhSw5eLq2koUUDq/oDRmCgUPjDv5Ity2meNc7WgeHUtqg3+f2bym03
 k5IE141Gdg5N7nM/MNS4yDxyNm8YirV190QF6Zz/3zR6Dp2G2VwEBnOQNejozwWUxf
 3OPzFhzBwmf7skIC7nHvsETNKqSk1f+ME3mV9O2U1k97w9uII5eTzJTFf89Gls1vLs
 5JfcYLn0jeKuA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: crash in cpuidle_enter_state with 5.7-rc1
In-Reply-To: <20200417160348.GE25468@kitsune.suse.cz>
References: <20200417160348.GE25468@kitsune.suse.cz>
Date: Mon, 20 Apr 2020 16:15:39 +1000
Message-ID: <871roiisxg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> Hello,
>
> I observe crash in cpuidle_enter_state in early boot on POWER9 pSeries
> machine with 5.7-rc1 kernel. The crash is not 100% reliable. Sometimes
> the machine boots.
>
> Attaching config, dmesg, and sample crash message. The stack below
> cpuidle_enter_state appears random - different in each crash.
>
> Any idea what could cause this?

Nothing immediately springs to mind.

> Preparing to boot Linux version 5.7.0-rc1-1.g8f6a41f-default (geeko@build=
host) (gcc version 9.3.1 20200406 [revision 6db837a5288ee3ca5ec504fbd5a7658=
17e556ac2] (SUSE Linux), GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.34.0.=
20200325-1) #1 SMP Fri Apr 17 10:39:25 UTC 2020 (8f6a41f)
> Detected machine type: 0000000000000101
> command line: BOOT_IMAGE=3D/boot/vmlinux-5.7.0-rc1-1.g8f6a41f-default roo=
t=3DUUID=3D04f3f652-7c85-470b-9d5f-490601f371f8 mitigations=3Dauto quiet cr=
ashkernel=3D242M
> Max number of cores passed to firmware: 256 (NR_CPUS =3D 2048)
> Calling ibm,client-architecture-support... done
> memory layout at init:
>   memory_limit : 0000000000000000 (16 MB aligned)
>   alloc_bottom : 000000000e680000
>   alloc_top    : 0000000020000000
>   alloc_top_hi : 0000000020000000
>   rmo_top      : 0000000020000000
>   ram_top      : 0000000020000000
> instantiating rtas at 0x000000001ecb0000... done
> prom_hold_cpus: skipped
> copying OF device tree...
> Building dt strings...
> Building dt structure...
> Device tree strings 0x000000000e690000 -> 0x000000000e691886
> Device tree struct  0x000000000e6a0000 -> 0x000000000e6b0000
> Quiescing Open Firmware ...
> Booting Linux via __start() @ 0x000000000a6e0000 ...
> [    1.234639] BUG: Unable to handle kernel data access on read at 0xc000=
0000026970e0
> [    1.234654] Faulting instruction address: 0xc0000000000088dc
> [    1.234665] Oops: Kernel access of bad area, sig: 11 [#1]
> [    1.234675] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSer=
ies
> [    1.234686] Modules linked in:
> [    1.234698] CPU: 4 PID: 0 Comm: swapper/4 Not tainted 5.7.0-rc1-1.g8f6=
a41f-default #1 openSUSE Tumbleweed (unreleased)
> [    1.234714] NIP:  c0000000000088dc LR: c000000000aad890 CTR: c00000000=
00087a0
> [    1.234727] REGS: c000000007596e90 TRAP: 0300   Not tainted  (5.7.0-rc=
1-1.g8f6a41f-default)
> [    1.234742] MSR:  8000000000001033 <SF,ME,IR,DR,RI,LE>  CR: 28000022  =
XER: 00000000

MMU was on when we faulted (IR & DR), so it's not real mode weirdness.

> [    1.234760] CFAR: c0000000000087fc DAR: c0000000026970e0 DSISR: 400000=
00 IRQMASK: 0
> [    1.234760] GPR00: c000000000aa9384 c000000007597120 c00000000269f000 =
0000000000000000
> [    1.234760] GPR04: c0000000025d2778 0000000000000000 000000000000c800 =
c0000000026d69c0
> [    1.234760] GPR08: 000e98056e8436d9 0000000000000300 0000000000000000 =
0000000000000000
> [    1.234760] GPR12: 8000000000001033 c00000001ec79c00 0000000000000000 =
000000001ef3d880
> [    1.234760] GPR16: 0000000000000000 0000000000000000 c000000000058990 =
0000000000000000
> [    1.234760] GPR20: c0000000025d2778 c0000003ffa967c8 0000000000000001 =
0000000000080000
> [    2.234760] GPR24: c000000007538100 0000000000000000 0000000000000000 =
000000004995ca42
> [    1.234760] GPR28: c0000000025d2778 c0000003ffa967c8 0000000004945388 =
0000000000000000
> [    1.234869] NIP [c0000000000088dc] data_access_common_virt+0x13c/0x170
> [    1.234882] LR [c000000000aad890] snooze_loop+0x70/0x220
> [    1.234888] Call Trace:
> [    1.234899] [c000000007597420] [0000000000000000] 0x0
> [    1.234908] [c000000007597720] [0000000000000a6d] 0xa6d
> [    1.234919] [c000000007597a20] [0000000000000000] 0x0
> [    1.234931] [c000000007597d20] [0000000000000004] 0x4
> [    1.234943] [c000000007597d50] [c000000000aa9384] cpuidle_enter_state+=
0xa4/0x590
> [    1.234954] Freeing unused kernel memory: 5312K
> [    1.234958] [c000000007597dd0] [c000000000aa990c] cpuidle_enter+0x4c/0=
x70
> [    1.234965] [c000000007597e10] [c00000000019635c] call_cpuidle+0x4c/0x=
90
> [    1.234969] [c000000007597e30] [c000000000196978] do_idle+0x308/0x420
> [    1.234973] [c000000007597ed0] [c000000000196cd8] cpu_startup_entry+0x=
38/0x40
> [    1.234977] [c000000007597f00] [c00000000005b178] start_secondary+0x62=
8/0x650
> [    1.234980] [c000000007597f90] [c00000000000c354] start_secondary_prol=
og+0x10/0x14
> [    1.234983] Instruction dump:
> [    1.234985] f8e100a8 f90100b0 7d2802a6 e84d0010 f9210190 894d0988 7d61=
02a6 f94101a8
> [    1.234989] f9610198 39200300 f92101b0 39400000 <e96280e0> f94101c8 f9=
610060 894d0989

That's:

  std     r7,168(r1)
  std     r8,176(r1)
  mflr    r9
  ld      r2,16(r13)
  std     r9,400(r1)
  lbz     r10,2440(r13)
  mfxer   r11
  std     r10,424(r1)
  std     r11,408(r1)
  li      r9,768
  std     r9,432(r1)
  li      r10,0
  ld      r11,-32544(r2)

Which is from:

.macro __GEN_COMMON_BODY name
	...
	mflr	r9			/* Get LR, later save to stack	*/
	ld	r2,PACATOC(r13)		/* get kernel TOC into r2	*/
	std	r9,_LINK(r1)
	lbz	r10,PACAIRQSOFTMASK(r13)
	mfspr	r11,SPRN_XER		/* save XER in stackframe	*/
	std	r10,SOFTE(r1)
	std	r11,_XER(r1)
	li	r9,IVEC
	std	r9,_TRAP(r1)		/* set trap number		*/
	li	r10,0
	ld	r11,exception_marker@toc(r2)

The address that faulted c0000000026970e0 is ~38MB which looks plausible
for the exception marker, it's definitely not completely off in the weeds.

So it looks like we're just taking a spurious fault on the linear
mapping, which is .. bad.


And I've just hit it with your config on a machine here, but the crash
is different:

[   27.598246][    T1] Freeing unused kernel memory: 5504K
[   27.616971][  T588] BUG: Unable to handle kernel data access on read at =
0xc00000000120a5b8
[   27.616972][    T1] Run /sbin/init as init process
[   27.616981][  T588] Faulting instruction address: 0xc0000000008561c0
cpu 0x11: Vector: 300 (Data Access) at [c00000000678b2d0]
    pc: c0000000008561c0: cmp_ex_search+0x0/0x40
    lr: c0000000007e6844: bsearch+0x84/0x110
    sp: c00000000678b560
   msr: 8000000000001033
   dar: c00000000120a5b8
 dsisr: 40000000
  current =3D 0xc000000006752e00
  paca    =3D 0xc00000000ffe6e00   irqmask: 0x03   irq_happened: 0x01
    pid   =3D 588, comm =3D kworker/17:1
Linux version 5.7.0-rc2-gcc-8.2.0-1.g8f6a41f-default+ (michael@Raptor-2.ozl=
abs.ibm.com) (gcc version 8.2.0 (crosstool-NG 1.24.0-rc1.16-9627a04), GNU l=
d (crosstool-NG 1.24.0-rc1.16-9627a04) 2.32) #287 SMP Mon Apr 20 15:10:22 A=
EST 2020
enter ? for help
[link register   ] c0000000007e6844 bsearch+0x84/0x110
[c00000000678b560] c00000000678b590 (unreliable)
[c00000000678b5c0] c0000000008563a4 search_extable+0x34/0x50
[c00000000678b5f0] c00000000017acc8 search_exception_tables+0x48/0xb0
[c00000000678b620] c000000000089b5c bad_page_fault+0x3c/0x1e0
[c00000000678b6a0] c00000000000bf80 handle_page_fault+0x28/0x2c
--- Exception: 400 (Instruction Access) at c000000000004400 exc_virt_0x4400=
_instruction_access+0x0/0x80
[c00000000678b9a0] c00000000018c8e4 update_rq_clock+0x44/0x1c0 (unreliable)
[c00000000678ba10] c0000000001ab820 _nohz_idle_balance+0x250/0x330
[c00000000678bae0] c0000000001ac2a0 newidle_balance+0x470/0x580
[c00000000678bba0] c0000000001ac48c pick_next_task_fair+0x7c/0x4b0
[c00000000678bc00] c000000000dfddbc __schedule+0x19c/0x970
[c00000000678bce0] c000000000dfe608 schedule+0x78/0x130
[c00000000678bd10] c000000000174ec0 worker_thread+0x130/0x650
[c00000000678bdb0] c00000000017e59c kthread+0x19c/0x1b0
[c00000000678be20] c00000000000cba8 ret_from_kernel_thread+0x5c/0x74
11:mon>=20


Which is very wrong.

I'm going to guess it's STRICT_KERNEL_RWX that's at fault.

And indeed with that off I can't reproduce.

Not sure why though.

cheers
