Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 609A01ADC72
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 13:47:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493Z836Qh1zDrhP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 21:47:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493Z5y2XjPzDrft
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 21:45:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Bb8/szne; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 493Z5x2CTNz9sR4;
 Fri, 17 Apr 2020 21:45:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1587123926;
 bh=Ydrwh4zVWReMG0PuEe60Gimg3Ml7L8jwJayYN/OsWuc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Bb8/szneqPRZeh3W/59sO/wQx1gPp+qvmo9HKPkEM/acrIjhceUUYomLKSO+E6L7P
 EYZgLtvrGIhmB+WS5gM8UmFkR2bV9WDWqp78xK500wUMrRSjh8bz2YbWWMXVYRe3Yh
 lrRHXDQqmSfh4yl2v/ZX++9mgOShgNYGuxp3e7gRqX0tg2jDHZks9tU3l02uFVlqHw
 ty2UZNwx5bkTe60+xAyb5L4OCJTqLQZcI9Pi33xLvS5K6lu8xzzkyywdZL4BdDZa67
 SBu//M6pOphomQHiUXQUGvuwAeOrR/JIivCL3nI4UjLWt2U9Lavdwf13OmIBdIcROi
 cQFht9S3/FRTA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Steven Rostedt <rostedt@goodmis.org>, Qian Cai <cai@lca.pw>
Subject: Re: POWER9 crash due to STRICT_KERNEL_RWX (WAS: Re: Linux-next POWER9
 NULL pointer NIP...)
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
Date: Fri, 17 Apr 2020 21:45:34 +1000
Message-ID: <87eesmibdt.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Steven Rostedt <rostedt@goodmis.org> writes:
> On Thu, 16 Apr 2020 21:19:10 -0400
> Qian Cai <cai@lca.pw> wrote:
>
>> OK, reverted the commit,
>>=20
>> c55d7b5e6426 (=E2=80=9Cpowerpc: Remove STRICT_KERNEL_RWX incompatibility=
 with RELOCATABLE=E2=80=9D)
>>=20
>> or set STRICT_KERNEL_RWX=3Dn fixed the crash below and also mentioned in=
 this thread,
>
> This may be a symptom and not a cure.

I think it is a cure.

But we still have a bug, which is that when STRICT_KERNEL_RWX is enabled
we have some sort of corruption going on.

Enabling STRICT_KERNEL_RWX changes our implementation of
patch_instruction() which is used by ftrace, so I suspect this is a
powerpc bug.

>> [  148.110969][T13115] LTP: starting chown04_16
>> [  148.255048][T13380] kernel tried to execute exec-protected page (c000=
0000016804ac) - exploit attempt? (uid: 0)
>> [  148.255099][T13380] BUG: Unable to handle kernel instruction fetch
>> [  148.255122][T13380] Faulting instruction address: 0xc0000000016804ac
>> [  148.255136][T13380] Oops: Kernel access of bad area, sig: 11 [#1]
>> [  148.255157][T13380] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D256 =
DEBUG_PAGEALLOC NUMA PowerNV
>> [  148.255171][T13380] Modules linked in: loop kvm_hv kvm xfs sd_mod bnx=
2x mdio ahci tg3 libahci libphy libata firmware_class dm_mirror dm_region_h=
ash dm_log dm_mod
>> [  148.255213][T13380] CPU: 45 PID: 13380 Comm: chown04_16 Tainted: G   =
     W         5.6.0+ #7
>> [  148.255236][T13380] NIP:  c0000000016804ac LR: c00800000fa60408 CTR: =
c0000000016804ac
>> [  148.255250][T13380] REGS: c0000010a6fafa00 TRAP: 0400   Tainted: G   =
     W          (5.6.0+)
>> [  148.255281][T13380] MSR:  9000000010009033 <SF,HV,EE,ME,IR,DR,RI,LE> =
 CR: 84000248  XER: 20040000
>> [  148.255310][T13380] CFAR: c00800000fa66534 IRQMASK: 0=20
>> [  148.255310][T13380] GPR00: c000000000973268 c0000010a6fafc90 c0000000=
01648200 0000000000000000=20
>> [  148.255310][T13380] GPR04: c000000d8a22dc00 c0000010a6fafd30 00000000=
b5e98331 ffffffff00012c9f=20
>> [  148.255310][T13380] GPR08: c000000d8a22dc00 0000000000000000 00000000=
00000000 c00000000163c520=20
>> [  148.255310][T13380] GPR12: c0000000016804ac c000001ffffdad80 00000000=
00000000 0000000000000000=20
>> [  148.255310][T13380] GPR16: 0000000000000000 0000000000000000 00000000=
00000000 0000000000000000=20
>> [  148.255310][T13380] GPR20: 0000000000000000 0000000000000000 00000000=
00000000 0000000000000000=20
>> [  148.255310][T13380] GPR24: 00007fff8f5e2e48 0000000000000000 c0080000=
0fa6a488 c0000010a6fafd30=20
>> [  148.255310][T13380] GPR28: 0000000000000000 000000007fffffff c0080000=
0fa60400 c000000efd0c6780=20
>> [  148.255494][T13380] NIP [c0000000016804ac] sysctl_net_busy_read+0x0/0=
x4
>
> The instruction pointer is on sysctl_net_busy_read? Isn't that data and
> not code?

Yes.

But we're corrupting the text, or data, somewhere, so we can jump
anywhere.

I have another trace where vhost_init() appears to call into
proc_dointvec() before crashing. vhost_init() is an empty function.

cheers
