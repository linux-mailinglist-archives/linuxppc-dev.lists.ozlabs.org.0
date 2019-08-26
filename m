Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D54959C7F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 05:31:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GyG775TCzDqcP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 13:31:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GyDC29LjzDqV3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 13:29:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46GyDC1MpCz9sMr; Mon, 26 Aug 2019 13:29:31 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46GyDC0Qd2z9sDB;
 Mon, 26 Aug 2019 13:29:31 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [powerpc]WARN : arch/powerpc/platforms/powernv/smp.c:160
In-Reply-To: <AB1A20B4-523B-491E-AB89-124AD2810C17@linux.vnet.ibm.com>
References: <AB1A20B4-523B-491E-AB89-124AD2810C17@linux.vnet.ibm.com>
Date: Mon, 26 Aug 2019 13:29:30 +1000
Message-ID: <87imqk4nad.fsf@concordia.ellerman.id.au>
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
Cc: ego@linux.vnet.ibm.com, linux-next@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
> linux-next is currently broken on POWER8 non virtualized. Kernel
> fails to reach login prompt with following kernel warning
> repeatedly shown during boot.

I don't see it on my test systems.

The backtrace makes it look like you're doing CPU hot_un_plug during
boot, which seems a bit odd.

Or possibly it's just that the cpu_is_offline() test in do_idle() is
returning true due to some bug.

> The problem dates back atleast till next-20190816.=20

A bisect would be helpful obviously :)

> [   40.285606] WARNING: CPU: 1 PID: 0 at arch/powerpc/platforms/powernv/s=
mp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
> [   40.285609] Modules linked in: kvm_hv kvm sunrpc dm_mirror dm_region_h=
ash dm_log dm_mod ses enclosure scsi_transport_sas sg ipmi_powernv ipmi_dev=
intf powernv_rng uio_pdrv_genirq uio leds_powernv ipmi_msghandler powernv_o=
p_panel ibmpowernv ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pp=
s_core
> [   40.285643] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.3.0-rc5-next-2=
0190823-autotest-autotest #1
> [   40.285644] NIP:  c0000000000b5f40 LR: c000000000055498 CTR: c00000000=
00b5ef0
> [   40.285646] REGS: c0000007f5527980 TRAP: 0700   Not tainted  (5.3.0-rc=
5-next-20190823-autotest-autotest)
> [   40.285646] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 2400=
4028  XER: 00000000
> [   40.285650] CFAR: c000000000055494 IRQMASK: 1=20
> [   40.285650] GPR00: c000000000055498 c0000007f5527c10 c00000000148b200 =
0000000000000000=20
> [   40.285650] GPR04: 0000000000000000 c0000007fa897d80 c0000007fa90c800 =
00000007f9980000=20
> [   40.285650] GPR08: 0000000000000000 0000000000000001 0000000000000000 =
c0000007fa90c800=20
> [   40.285650] GPR12: c0000000000b5ef0 c0000007ffffee00 0000000000000800 =
c000000ffffc11d0=20
> [   40.285650] GPR16: 0000000000000001 c000000001035280 0000000000000000 =
c0000000015303c0=20
> [   40.285650] GPR20: c000000000052d60 0000000000000001 c0000007f54cd800 =
c0000007f54cd880=20
> [   40.285650] GPR24: 0000000000080000 c0000007f54cd800 c0000000014bdf78 =
c0000000014c20d8=20
> [   40.285650] GPR28: 0000000000000002 c0000000014c2538 0000000000000001 =
c0000007f54cd800=20
> [   40.285662] NIP [c0000000000b5f40] pnv_smp_cpu_kill_self+0x50/0x2d0
> [   40.285664] LR [c000000000055498] cpu_die+0x48/0x64
> [   40.285665] Call Trace:
> [   40.285667] [c0000007f5527c10] [c000000000f85f10] ppc64_tlb_batch+0x0/=
0x1220 (unreliable)
> [   40.285669] [c0000007f5527df0] [c000000000055498] cpu_die+0x48/0x64
> [   40.285672] [c0000007f5527e10] [c0000000000226a0] arch_cpu_idle_dead+0=
x20/0x40
> [   40.285674] [c0000007f5527e30] [c00000000016bd2c] do_idle+0x37c/0x3f0
> [   40.285676] [c0000007f5527ed0] [c00000000016bfac] cpu_startup_entry+0x=
3c/0x50
> [   40.285678] [c0000007f5527f00] [c000000000055198] start_secondary+0x63=
8/0x680
> [   40.285680] [c0000007f5527f90] [c00000000000ac5c] start_secondary_prol=
og+0x10/0x14
> [   40.285680] Instruction dump:
> [   40.285681] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821=
fe21 e90d1178=20
> [   40.285684] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d=
210164 39200003=20
> [   40.285687] ---[ end trace 72c90a064122d9e4 ]=E2=80=94

That WARN shouldn't really kill the boot, do you see anything else?

> Relevant code snippet :
> 156         /*
> 157          * This hard disables local interurpts, ensuring we have no l=
azy
> 158          * irqs pending.
> 159          */
> 160         WARN_ON(irqs_disabled());  <<=3D=3D=3D
> 161         hard_irq_disable();
> 162         WARN_ON(lazy_irq_pending());

Even via the path shown above I think we should have IRQs enabled, but I
guess not.

cheers
