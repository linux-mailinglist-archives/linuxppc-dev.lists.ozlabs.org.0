Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E531AD40C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 03:20:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493JFN160LzDsNQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 11:20:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=Aj9G5jYC; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493JCW5J8szDrgd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 11:19:16 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id w24so700784qts.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 18:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=pCwqpfgs7LGSQlluiA82lBftlzkWpGiJUBmelFG0C34=;
 b=Aj9G5jYCoXCP4ueVnwSoIx17tBbEhdmn7F9xroe69R8jZb8w9GI7WUfC9U7KAlHAOb
 AI+ZHQbNofg08analrNy3EtbTdsr2oSg7/6sOxx40Ve8L1WuSQ5hO05hte0zITOLw/Mn
 GNrRD+EyWZjjjYDaqhyXueBe9qhJoYuILVb2Czzdkx6/s2gfSX5BNbhvXFlWQcan6Z8h
 LbZa4TKGNTpYNonJU+JnhoKNCsJXiNwWC9BcmHfTGGYZzqjkXw0b9mKakMiyroWUk3vR
 KGN6z7SLIxfIetuDas8v9I2Pxxx/xBw31dX8gkL0B9cvplgAC81/5iVeYJ21YCaBZC9i
 rLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=pCwqpfgs7LGSQlluiA82lBftlzkWpGiJUBmelFG0C34=;
 b=gKV+1QDadxzphEIeebyZY7/9w0+LRlH2GAI0e0xUtpv4+5BBZt8K1MzUB8kR3gfLL4
 6FxzjXnJgh3uNVXSCD3laXh1ggkRpx7lQebMqdGXXZx6h+aH11rsF8QEMEaxEqU/WIOM
 qsv2qbpJBwW0ldeL4wBsRjuv9MgZjf2wItB+K7RYUEB2za59cL/MTr8JHHsbc3MrQbIV
 AxUQSwN49d/Hz9uktng0kiH58QaG2kyuXISNic8u82tC4dmmi0RIBmKNjrgK+htW8L8u
 SRpVzxWoPuGvr2w1qM1q+O1hfP2mKyDK2MjerrtCSkiLXIx2YKQijR6fVPzwev3ysQT1
 uYxA==
X-Gm-Message-State: AGi0PubNVC2X0jTlUVN52dBXo4haBpL7a/NYitSg+za35d3pCvzo8zs8
 zPOft+zTQFQL0/P9yntHyJLeuw==
X-Google-Smtp-Source: APiQypLXK7lxDKQDKeTcX+/os+B8404g4+lHsypoMx51Dm+gNRUP514l+5vWDgxNrUnY2GGNJNXg8g==
X-Received: by 2002:ac8:7c96:: with SMTP id y22mr610880qtv.17.1587086352500;
 Thu, 16 Apr 2020 18:19:12 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id a5sm15743797qkn.83.2020.04.16.18.19.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Apr 2020 18:19:11 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: POWER9 crash due to STRICT_KERNEL_RWX (WAS: Re: Linux-next POWER9
 NULL pointer NIP...)
From: Qian Cai <cai@lca.pw>
In-Reply-To: <161662E3-5D9C-4C15-919C-CFEFE4CC35CB@lca.pw>
Date: Thu, 16 Apr 2020 21:19:10 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <69F0448F-CA5B-497D-B8AF-2848175B9477@lca.pw>
References: <15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw>
 <87eeszlb6u.fsf@mpe.ellerman.id.au>
 <0675B22E-8F32-432C-9378-FDE159DD1729@lca.pw>
 <20200407093054.3eb23e45@gandalf.local.home>
 <EA9F9A54-87BC-477A-BE8A-7D53F80C5223@lca.pw>
 <20200409101413.35d9c72d@gandalf.local.home>
 <06A2EA93-B730-4DB1-819F-D27E7032F0B3@lca.pw>
 <161662E3-5D9C-4C15-919C-CFEFE4CC35CB@lca.pw>
To: Michael Ellerman <mpe@ellerman.id.au>, Russell Currey <ruscur@russell.cc>
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
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

OK, reverted the commit,

c55d7b5e6426 (=E2=80=9Cpowerpc: Remove STRICT_KERNEL_RWX incompatibility =
with RELOCATABLE=E2=80=9D)

or set STRICT_KERNEL_RWX=3Dn fixed the crash below and also mentioned in =
this thread,

=
https://lore.kernel.org/lkml/15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw/

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


