Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 054181AD463
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 04:19:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493KY040HLzF0VF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 12:19:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=tt4n=6b=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493KWB3rKszF0B3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 12:17:58 +1000 (AEST)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 53DAE206B9;
 Fri, 17 Apr 2020 02:17:55 +0000 (UTC)
Date: Thu, 16 Apr 2020 22:17:53 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Qian Cai <cai@lca.pw>
Subject: Re: POWER9 crash due to STRICT_KERNEL_RWX (WAS: Re: Linux-next
 POWER9 NULL pointer NIP...)
Message-ID: <20200416221753.4e47080a@oasis.local.home>
In-Reply-To: <69F0448F-CA5B-497D-B8AF-2848175B9477@lca.pw>
References: <15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw>
 <87eeszlb6u.fsf@mpe.ellerman.id.au>
 <0675B22E-8F32-432C-9378-FDE159DD1729@lca.pw>
 <20200407093054.3eb23e45@gandalf.local.home>
 <EA9F9A54-87BC-477A-BE8A-7D53F80C5223@lca.pw>
 <20200409101413.35d9c72d@gandalf.local.home>
 <06A2EA93-B730-4DB1-819F-D27E7032F0B3@lca.pw>
 <161662E3-5D9C-4C15-919C-CFEFE4CC35CB@lca.pw>
 <69F0448F-CA5B-497D-B8AF-2848175B9477@lca.pw>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Apr 2020 21:19:10 -0400
Qian Cai <cai@lca.pw> wrote:

> OK, reverted the commit,
>=20
> c55d7b5e6426 (=E2=80=9Cpowerpc: Remove STRICT_KERNEL_RWX incompatibility =
with RELOCATABLE=E2=80=9D)
>=20
> or set STRICT_KERNEL_RWX=3Dn fixed the crash below and also mentioned in =
this thread,

This may be a symptom and not a cure.

>=20
> https://lore.kernel.org/lkml/15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw/
>=20
> [  148.110969][T13115] LTP: starting chown04_16
> [  148.255048][T13380] kernel tried to execute exec-protected page (c0000=
000016804ac) - exploit attempt? (uid: 0)
> [  148.255099][T13380] BUG: Unable to handle kernel instruction fetch
> [  148.255122][T13380] Faulting instruction address: 0xc0000000016804ac
> [  148.255136][T13380] Oops: Kernel access of bad area, sig: 11 [#1]
> [  148.255157][T13380] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D256 D=
EBUG_PAGEALLOC NUMA PowerNV
> [  148.255171][T13380] Modules linked in: loop kvm_hv kvm xfs sd_mod bnx2=
x mdio ahci tg3 libahci libphy libata firmware_class dm_mirror dm_region_ha=
sh dm_log dm_mod
> [  148.255213][T13380] CPU: 45 PID: 13380 Comm: chown04_16 Tainted: G    =
    W         5.6.0+ #7
> [  148.255236][T13380] NIP:  c0000000016804ac LR: c00800000fa60408 CTR: c=
0000000016804ac
> [  148.255250][T13380] REGS: c0000010a6fafa00 TRAP: 0400   Tainted: G    =
    W          (5.6.0+)
> [  148.255281][T13380] MSR:  9000000010009033 <SF,HV,EE,ME,IR,DR,RI,LE>  =
CR: 84000248  XER: 20040000
> [  148.255310][T13380] CFAR: c00800000fa66534 IRQMASK: 0=20
> [  148.255310][T13380] GPR00: c000000000973268 c0000010a6fafc90 c00000000=
1648200 0000000000000000=20
> [  148.255310][T13380] GPR04: c000000d8a22dc00 c0000010a6fafd30 00000000b=
5e98331 ffffffff00012c9f=20
> [  148.255310][T13380] GPR08: c000000d8a22dc00 0000000000000000 000000000=
0000000 c00000000163c520=20
> [  148.255310][T13380] GPR12: c0000000016804ac c000001ffffdad80 000000000=
0000000 0000000000000000=20
> [  148.255310][T13380] GPR16: 0000000000000000 0000000000000000 000000000=
0000000 0000000000000000=20
> [  148.255310][T13380] GPR20: 0000000000000000 0000000000000000 000000000=
0000000 0000000000000000=20
> [  148.255310][T13380] GPR24: 00007fff8f5e2e48 0000000000000000 c00800000=
fa6a488 c0000010a6fafd30=20
> [  148.255310][T13380] GPR28: 0000000000000000 000000007fffffff c00800000=
fa60400 c000000efd0c6780=20
> [  148.255494][T13380] NIP [c0000000016804ac] sysctl_net_busy_read+0x0/0x4

The instruction pointer is on sysctl_net_busy_read? Isn't that data and
not code?

In net/socket.c:

  #ifdef CONFIG_NET_RX_BUSY_POLL
  unsigned int sysctl_net_busy_read __read_mostly;
  unsigned int sysctl_net_busy_poll __read_mostly;
  #endif

-- Steve


> [  148.255516][T13380] LR [c00800000fa60408] find_free_cb+0x8/0x30 [loop]
> [  148.255528][T13380] Call Trace:
> [  148.255538][T13380] [c0000010a6fafc90] [c0000000009732c0] idr_for_each=
+0xf0/0x170 (unreliable)
> [  148.255572][T13380] [c0000010a6fafd10] [c00800000fa626c4] loop_lookup.=
part.1+0x4c/0xb0 [loop]
> [  148.255597][T13380] [c0000010a6fafd50] [c00800000fa634d8] loop_control=
_ioctl+0x120/0x1d0 [loop]
> [  148.255623][T13380] [c0000010a6fafdb0] [c0000000004ddc08] ksys_ioctl+0=
xd8/0x130
> [  148.255636][T13380] [c0000010a6fafe00] [c0000000004ddc88] sys_ioctl+0x=
28/0x40
> [  148.255669][T13380] [c0000010a6fafe20] [c00000000000b378] system_call+=
0x5c/0x68
> [  148.255699][T13380] Instruction dump:
> [  148.255718][T13380] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXX=
XXX XXXXXXXX XXXXXXXX=20
> [  148.255744][T13380] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXX=
XXX XXXXXXXX XXXXXXXX=20
> [  148.255772][T13380] ---[ end trace a5894a74208c22ec ]---
> [  148.576663][T13380]=20
> [  149.576765][T13380] Kernel panic - not syncing: Fatal exception
>=20

