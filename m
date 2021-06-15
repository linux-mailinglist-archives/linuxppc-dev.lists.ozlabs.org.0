Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB0C3A81DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 16:07:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G49Bk1t77z3cbH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 00:07:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cTMcvO/r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=cTMcvO/r; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G49BG7592z2ymS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 00:07:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G49BD5nZwz9sRN;
 Wed, 16 Jun 2021 00:07:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623766052;
 bh=EJYttFUi5FjCKQh0C14kQtr8XDgdowEYGx8C+HzulWU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=cTMcvO/r5atIxHQtPX/lgGuVZmv+yipG31iK5Vv2lzx5l2pZjWn3R5BJiCfdkjZXt
 8tllw0437LNwbwff9+0jd2uF5lpocasO1QWYQYPG6LiyRgH6EEZqUYub2kn9O+vqWM
 jHJfjPxN8ZWlqQv1Y9N5uNXLKBkIwHwfPCWRYW0FkPqofhPDYT//w8mZoPJaO3sTPd
 Hye0jU5IPxYWTKLmXbdBrxEqWWZxQE0/Q8tSvnJQKTYeuUp1BbVNp+syRGkCGxNI7p
 buCiIamHHlUHuINZTk7uPJCgsIBFOO5mBz36LpDwut25s7JD4LZ8rEYl1m041sSHjo
 XVF02S+5hFY3g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 00/11] powerpc/64: fast interrupt exits
In-Reply-To: <20210610130921.706938-1-npiggin@gmail.com>
References: <20210610130921.706938-1-npiggin@gmail.com>
Date: Wed, 16 Jun 2021 00:07:32 +1000
Message-ID: <878s3bte57.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> This series attempts to improve the speed of interrupts and system calls
> in three major ways.

With the full series applied I'm seeing various warnings.

I feel like I must be missing some lead up patch?

cheers


mambo, p8, hash, be:

[    0.001038][    T0] ------------[ cut here ]------------
[    0.001287][    T0] Interrupts were enabled early
[    0.001510][    T0] WARNING: CPU: 0 PID: 0 at init/main.c:1004 .start_kernel+0x53c/0x720
[    0.001902][    T0] Modules linked in:
[    0.002084][    T0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.13.0-rc2-00118-gca433a3a44e3-dirty #1
[    0.002518][    T0] NIP:  c000000002004920 LR: c00000000200491c CTR: c0000000000e3cd0
[    0.002887][    T0] REGS: c000000002acfc30 TRAP: 0700   Not tainted  (5.13.0-rc2-00118-gca433a3a44e3-dirty)
[    0.003342][    T0] MSR:  9000000002029032 <SF,HV,VEC,EE,ME,IR,DR,RI>  CR: 28002222  XER: 22000000
[    0.003818][    T0] CFAR: 000000003002afb0 IRQMASK: 0
[    0.003818][    T0] GPR00: c00000000200491c c000000002acfed0 c000000002ad1a00 000000000000001d
[    0.003818][    T0] GPR04: 0000000000000001 c0000000027645b0 0000000000000001 c0000000027645e0
[    0.003818][    T0] GPR08: 00000000fd5c0000 c000000002764560 c000000002764560 9000000032001032
[    0.003818][    T0] GPR12: 0000000028002222 c000000002cd0000 0000000000000000 0000000000000000
[    0.003818][    T0] GPR16: 0000000031c10000 0000000030003180 0000000030000000 0000000000000000
[    0.003818][    T0] GPR20: 0000000000000000 0000000000000000 000000003012e4eb 0000000030110ece
[    0.003818][    T0] GPR24: 00000000301105f5 c000000000000000 0000000020010000 c000000002090008
[    0.003818][    T0] GPR28: c000000002090008 c0000000011ae620 c0000000011ae620 c000000002090008
[    0.007455][    T0] NIP [c000000002004920] .start_kernel+0x53c/0x720
[    0.007765][    T0] LR [c00000000200491c] .start_kernel+0x538/0x720
[    0.008072][    T0] Call Trace:
[    0.008223][    T0] [c000000002acfed0] [c00000000200491c] .start_kernel+0x538/0x720 (unreliable)
[    0.008655][    T0] [c000000002acff90] [c00000000000dd2c] start_here_common+0x1c/0x670
[    0.009041][    T0] Instruction dump:
[    0.009219][    T0] 60000000 4a23dadd 60000000 48035821 60000000 892d0932 71290001 40820018
[    0.009659][    T0] 3c62fe6d 3863f810 4a171751 60000000 <0fe00000> 39200000 3d420003 38600000
[    0.010111][    T0] ---[ end trace e2dce2fbc72d04fa ]---


mambo, p9, hash, be:

[   17.668403][  T267] ------------[ cut here ]------------
[   17.668433][  T267] WARNING: CPU: 1 PID: 267 at arch/powerpc/include/asm/book3s/64/kup.h:304 .arch_local_irq_restore+0x190/0x1a0
[   17.668503][  T267] Modules linked in:
[   17.668532][  T267] CPU: 1 PID: 267 Comm: halt Tainted: G        W         5.13.0-rc2-00118-gca433a3a44e3-dirty #1
[   17.668588][  T267] NIP:  c000000000016680 LR: c00000000002f804 CTR: c0000000005901c0
[   17.668632][  T267] REGS: c000000009f339b0 TRAP: 0700   Tainted: G        W          (5.13.0-rc2-00118-gca433a3a44e3-dirty)
[   17.668686][  T267] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 48244222  XER: 04000000
[   17.668777][  T267] CFAR: c00000000002fdcc IRQMASK: 3
[   17.668777][  T267] GPR00: c00000000002f804 c000000009f33c50 c000000002ad1a00 0000000000000000
[   17.668777][  T267] GPR04: 0000000000000000 0000000000000020 00000000000000b7 00000000000c9495
[   17.668777][  T267] GPR08: 0000000000000008 fcffffffffffffff 3cffffffffffffff 0000000000000003
[   17.668777][  T267] GPR12: 0000000028244228 c0000000fffff300 0000000000000000 0000000000000000
[   17.668777][  T267] GPR16: 0000000000000000 0000000000000000 0000000000000000 00000000100a0a18
[   17.668777][  T267] GPR20: 00007fffdf62ffac 00000000100a09d8 00000100011405f0 0000000002002000
[   17.668777][  T267] GPR24: 0000000000000002 0000000000000001 0000000002802000 0000000000000000
[   17.668777][  T267] GPR28: c00000000cc56080 0000000000000000 0000000000000000 3cffffffffffffff
[   17.669291][  T267] NIP [c000000000016680] .arch_local_irq_restore+0x190/0x1a0
[   17.669343][  T267] LR [c00000000002f804] .interrupt_exit_user_prepare_main+0x144/0x2b0
[   17.669394][  T267] Call Trace:
[   17.669418][  T267] [c000000009f33c50] [c000000009f33ce0] 0xc000000009f33ce0 (unreliable)
[   17.669475][  T267] [c000000009f33cd0] [c00000000002f804] .interrupt_exit_user_prepare_main+0x144/0x2b0
[   17.669538][  T267] [c000000009f33d90] [c00000000002fe08] .syscall_exit_restart+0x68/0x80
[   17.669596][  T267] [c000000009f33e10] [c00000000000d168] system_call_common+0x278/0x2dc
[   17.669652][  T267] --- interrupt: c00 at 0x7fffad5b867c
[   17.669688][  T267] NIP:  00007fffad5b867c LR: 00000000100992a0 CTR: 0000000000000000
[   17.669731][  T267] REGS: c000000009f33e80 TRAP: 0c00   Tainted: G        W          (5.13.0-rc2-00118-gca433a3a44e3-dirty)
[   17.669785][  T267] MSR:  900000000280f032 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI>  CR: 28244222  XER: 00000000
[   17.669910][  T267] IRQMASK: 0
[   17.669910][  T267] GPR00: 0000000000000006 00007fffd8758060 00007fffad687300 0000000000000000
[   17.669910][  T267] GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[   17.669910][  T267] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[   17.669910][  T267] GPR12: 0000000000000000 00007fffad70a3a0 0000000000000000 0000000000000000
[   17.669910][  T267] GPR16: 0000000000000000 0000000000000000 0000000000000000 00000000100a0a18
[   17.669910][  T267] GPR20: 00007fffdf62ffac 00000000100a09d8 00000100011405f0 00000000100e24d0
[   17.669910][  T267] GPR24: 00000000100b91e5 00000000100c1e14 0000010019e002a0 00000000100c1e1e
[   17.669910][  T267] GPR28: 00007fffd875821b 0000000000000004 00007fffd8758210 0000000000000000
[   17.670410][  T267] NIP [00007fffad5b867c] 0x7fffad5b867c
[   17.670446][  T267] LR [00000000100992a0] 0x100992a0
[   17.670480][  T267] --- interrupt: c00
[   17.670507][  T267] Instruction dump:
[   17.670535][  T267] 4e800020 60000000 60000000 60000000 39200000 992d0932 39400000 992d0933
[   17.670627][  T267] 614a8002 7d410164 4e800020 60000000 <0fe00000> 4bfffefc 60000000 60000000
[   17.670719][  T267] ---[ end trace 5ba1b854b2957ce3 ]---


qemu powernv:

[    3.446262][   T51] init[51]: segfault (11) at 0 nip 0 lr 1000ca78 code 1 in busybox[10000000+d0000]
[    3.448351][   T51] init[51]: code: XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
[    3.449598][   T51] init[51]: code: XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
[    3.460559][   T52] init[52]: segfault (11) at 0 nip 0 lr 1000ca78 code 1 in busybox[10000000+d0000]
[    3.461409][   T52] init[52]: code: XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
[    3.462496][   T52] init[52]: code: XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX

... to infinity.


qemu 64e gets to running /init but gets stuck there with no further output.


qemu pseries, p8, be:

[    3.836653][   T75] S20urandom (75) used greatest stack depth: 9792 bytes left
[    4.718806][    C0] ------------[ cut here ]------------
[    4.718971][    C0] irq 17 handler .vp_interrupt+0x0/0xc0 enabled interrupts
[    4.720956][    C0] WARNING: CPU: 0 PID: 99 at kernel/irq/handle.c:159 .__handle_irq_event_percpu+0x230/0x270
[    4.721113][    C0] Modules linked in:
[    4.721502][    C0] CPU: 0 PID: 99 Comm: ip Not tainted 5.13.0-rc2-00118-gca433a3a44e3-dirty #1
[    4.721861][    C0] NIP:  c0000000002108b0 LR: c0000000002108ac CTR: c0000000009bb220
[    4.721943][    C0] REGS: c0000000fffeba00 TRAP: 0700   Not tainted  (5.13.0-rc2-00118-gca433a3a44e3-dirty)
[    4.722081][    C0] MSR:  8000000000029032 <SF,EE,ME,IR,DR,RI>  CR: 28002247  XER: 20000000
[    4.722404][    C0] CFAR: c0000000001760d0 IRQMASK: 0
[    4.722404][    C0] GPR00: c0000000002108ac c0000000fffebca0 c000000002ad1a00 0000000000000038
[    4.722404][    C0] GPR04: 0000000000000001 c0000000027645b0 0000000000000027 c0000000ff906e10
[    4.722404][    C0] GPR08: 0000000000000023 ffffffffffffffd8 0000000000000027 c0000000011d7b40
[    4.722404][    C0] GPR12: 0000000028002247 c000000002cd0000 0000000000000000 0000000000000000
[    4.722404][    C0] GPR16: 0000000000000000 0000000000000000 0000000000000000 00000000100b7866
[    4.722404][    C0] GPR20: 00000000100b7933 00000000100b5562 0000000000000000 0000000000000001
[    4.722404][    C0] GPR24: 0000000000000002 0000000000000001 0000000000000011 c000000008891800
[    4.722404][    C0] GPR28: 0000000000000011 c0000000fffebdd4 c00000000814a880 0000000000000000
[    4.723412][    C0] NIP [c0000000002108b0] .__handle_irq_event_percpu+0x230/0x270
[    4.723497][    C0] LR [c0000000002108ac] .__handle_irq_event_percpu+0x22c/0x270
[    4.723719][    C0] Call Trace:
[    4.723907][    C0] [c0000000fffebca0] [c0000000002108ac] .__handle_irq_event_percpu+0x22c/0x270 (unreliable)
[    4.724205][    C0] [c0000000fffebd60] [c000000000210ae0] .handle_irq_event+0x130/0x190
[    4.724309][    C0] [c0000000fffebe00] [c0000000002182bc] .handle_fasteoi_irq+0xbc/0x310
[    4.724397][    C0] [c0000000fffebea0] [c00000000020ea74] .generic_handle_irq+0x54/0x80
[    4.724575][    C0] [c0000000fffebf10] [c000000000015770] .__do_irq+0x70/0x1c0
[    4.724667][    C0] [c0000000fffebf90] [c0000000000159d4] .do_IRQ+0x114/0x250
[    4.724764][    C0] [c00000000a0730c0] [c00000000001596c] .do_IRQ+0xac/0x250
[    4.724848][    C0] [c00000000a073160] [c000000000009230] hardware_interrupt_common_virt+0x1b0/0x1c0
[    4.724952][    C0] --- interrupt: 500 at .virtnet_send_command+0x138/0x1b0
[    4.725031][    C0] NIP:  c000000000b4db68 LR: c000000000b4db58 CTR: c000000000984910
[    4.725090][    C0] REGS: c00000000a0731d0 TRAP: 0500   Not tainted  (5.13.0-rc2-00118-gca433a3a44e3-dirty)
[    4.725156][    C0] MSR:  8000000000009032 <SF,EE,ME,IR,DR,RI>  CR: 24002444  XER: 20000000
[    4.725299][    C0] CFAR: c00000000097e110 IRQMASK: 0
[    4.725299][    C0] GPR00: c000000000b4db58 c00000000a073470 c000000002ad1a00 0000000000000000
[    4.725299][    C0] GPR04: c00000000a0734e4 0000000000000000 0000000000000000 0000000000000000
[    4.725299][    C0] GPR08: 0000000000000000 0000000000000000 0000000000000000 c00c00000002bb48
[    4.725299][    C0] GPR12: 0000000024002442 c000000002cd0000 0000000000000000 0000000000000000
[    4.725299][    C0] GPR16: 0000000000000000 0000000000000000 0000000000000000 00000000100b7866
[    4.725299][    C0] GPR20: 00000000100b7933 00000000100b5562 00000000100b78c8 c000000008d89000
[    4.725299][    C0] GPR24: 0000000000000003 0000000000001002 c00000000a0734e8 0000000000000002
[    4.725299][    C0] GPR28: 0000000000000000 0000000000000000 c00000000a073508 c00000000ac41900
[    4.726021][    C0] NIP [c000000000b4db68] .virtnet_send_command+0x138/0x1b0
[    4.726091][    C0] LR [c000000000b4db58] .virtnet_send_command+0x128/0x1b0
[    4.726166][    C0] --- interrupt: 500
[    4.726226][    C0] [c00000000a073580] [c000000000b4ee2c] .virtnet_set_rx_mode+0xdc/0x3d0
[    4.726312][    C0] [c00000000a073670] [c000000000d98bac] .__dev_set_rx_mode+0x8c/0x120
[    4.726397][    C0] [c00000000a073700] [c000000000d98e50] .__dev_open+0x1a0/0x220
[    4.726477][    C0] [c00000000a0737b0] [c000000000d994ac] .__dev_change_flags+0x23c/0x2e0
[    4.726557][    C0] [c00000000a073880] [c000000000d99598] .dev_change_flags+0x48/0xa0
[    4.726639][    C0] [c00000000a073910] [c000000000ec2b18] .devinet_ioctl+0x358/0xa00
[    4.726729][    C0] [c00000000a0739f0] [c000000000ec5b1c] .inet_ioctl+0x23c/0x340
[    4.726808][    C0] [c00000000a073b00] [c000000000d52c98] .sock_do_ioctl+0x68/0x1c0
[    4.726891][    C0] [c00000000a073bd0] [c000000000d55ef4] .sock_ioctl+0x394/0x670
[    4.726971][    C0] [c00000000a073cc0] [c0000000004d3e2c] .__se_sys_ioctl+0xdc/0x140
[    4.727081][    C0] [c00000000a073d60] [c00000000002faec] .system_call_exception+0x17c/0x2e0
[    4.727169][    C0] [c00000000a073e10] [c00000000000cfe4] system_call_common+0xf4/0x2dc
[    4.727260][    C0] --- interrupt: c00 at 0x7fff7f9bf2f0
[    4.727630][    C0] NIP:  00007fff7f9bf2f0 LR: 000000001000c6b4 CTR: 0000000000000000
[    4.727692][    C0] REGS: c00000000a073e80 TRAP: 0c00   Not tainted  (5.13.0-rc2-00118-gca433a3a44e3-dirty)
[    4.727758][    C0] MSR:  800000000280f032 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI>  CR: 22000248  XER: 00000000
[    4.727956][    C0] IRQMASK: 0
[    4.727956][    C0] GPR00: 0000000000000036 00007ffffba7db00 00007fff7fa87300 0000000000000003
[    4.727956][    C0] GPR04: 0000000000008914 00007ffffba7dc60 00000000100b554e 0000000000000000
[    4.727956][    C0] GPR08: 0000000000000003 0000000000000000 0000000000000000 0000000000000000
[    4.727956][    C0] GPR12: 0000000000000000 00007fff7fb0a3a0 0000000000000000 0000000000000000
[    4.727956][    C0] GPR16: 0000000000000000 0000000000000000 0000000000000000 00000000100b7866
[    4.727956][    C0] GPR20: 00000000100b7933 00000000100b5562 00000000100b78c8 0000000000000000
[    4.727956][    C0] GPR24: 0000000000000000 ffffffffffffffff ffffffffffffffff 0000000000000000
[    4.727956][    C0] GPR28: 00007ffffba7ff69 0000000000000001 0000000000000003 00000000100b554e
[    4.728666][    C0] NIP [00007fff7f9bf2f0] 0x7fff7f9bf2f0
[    4.728719][    C0] LR [000000001000c6b4] 0x1000c6b4
[    4.728770][    C0] --- interrupt: c00
[    4.728909][    C0] Instruction dump:
[    4.729071][    C0] 38636c58 4bffbab9 60000000 4bfffed4 e8be0000 3c62fe70 3d22ffe7 7f44d378
[    4.729251][    C0] 38636c18 9ae9f062 4bf657c1 60000000 <0fe00000> 9b2d0932 4bfffe70 60000000
[    4.729494][    C0] ---[ end trace 0d7d391060ba35b4 ]---
qemu-system-ppc64: terminating on signal 1 from pid 462523 (
