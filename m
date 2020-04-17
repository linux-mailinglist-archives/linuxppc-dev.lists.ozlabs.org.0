Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4E41ADC78
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 13:52:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493ZGF5h84zDrhZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 21:52:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=P+TcTl4l; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493ZBJ4dp9zDrgp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 21:49:12 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id s63so2031299qke.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 04:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VnN12sUhtmsxG+yIlrQow1WXxjvXI/u/Sfip/9xsltw=;
 b=P+TcTl4lOHFzDyhslBAbIck4Blk9RP5c9j9bQVZy4RDzWStfevaK/kBJB8mwGBP0w2
 PrmdM2MDuVIiBw/0Xu3W0cXSN3bfz7xS39d1d7BnIK2DkG6ZQNmfyZvZjZPdyd8rTDN+
 GBty3ikOjBRW8q1E7daXysyRfGkWUOi5UJAdlGPxp7tKB/X0yQb06eORlhhZKTaB53se
 LzkmVXdJ1Xnx+eZcvE+fF+U+FAcroI3I6QR8lplW5wt2QBktD5TriXL1IGOuv7M/dVp+
 J6ExXnQxZF8OeGFSXdMYr/apsL0KsOA+mhLQjmagTdCYJnB+w7S+Ta5ii5B9OnWjB8Ot
 /TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VnN12sUhtmsxG+yIlrQow1WXxjvXI/u/Sfip/9xsltw=;
 b=prT9aZGxUodFysqBL950GeQ8HyU2rbMBiBgQglM2+z0BY+icIlUH67p6deSmk8jJ+R
 OouIitW07HUrtvrV5acq1OWoXtHRP822/nVSPvRBlMM714WdcIMgfzGjd3YdNl0aBoKJ
 a56xg0AqSgWYL2stKUvP5EyPOrjNBT3uqm+cDqQvxGr8U+E4z279ECW3HbM3/SWvi8NN
 w649BNvDVfPHRzou7E4Gamt0a5PYPqfNlIVZH3T+3hQEVxG5C505j5g98r/2t4iGAF/p
 5qmPI7DrQ95BrCbKv1RviNXN4RYnZTRKB2WUMXNBHjEpiKm1wnYOhNWvGJvtPsaWX4K6
 gW/A==
X-Gm-Message-State: AGi0PuaW6Nq6oIukx22CliwDUnWK472QFT5OBisPpthX8yO1CIzezn9O
 6UnkWmAkLD++AdILcdw2naInQQ==
X-Google-Smtp-Source: APiQypIhA7GbLmW5RORCwUGKS1Bj9gXJrUHc90Wp/lkJ1bXnSGa+wpcGsRWtNBkIs6mCZTfNS7/daQ==
X-Received: by 2002:a37:9b4f:: with SMTP id d76mr2805965qke.305.1587124148953; 
 Fri, 17 Apr 2020 04:49:08 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id p31sm15027588qtf.11.2020.04.17.04.49.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Apr 2020 04:49:08 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: POWER9 crash due to STRICT_KERNEL_RWX (WAS: Re: Linux-next POWER9
 NULL pointer NIP...)
From: Qian Cai <cai@lca.pw>
In-Reply-To: <fec2e755ea20e15dc5b6fee6c856562aa42872bd.camel@russell.cc>
Date: Fri, 17 Apr 2020 07:49:06 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <2B00DA57-823E-4689-A265-0D33D3DA48EF@lca.pw>
References: <43EE54C0-6F20-4ADD-9948-21F24D90C5E1@lca.pw>
 <fec2e755ea20e15dc5b6fee6c856562aa42872bd.camel@russell.cc>
To: Russell Currey <ruscur@russell.cc>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Apr 16, 2020, at 10:46 PM, Russell Currey <ruscur@russell.cc> =
wrote:
>=20
> On Thu, 2020-04-16 at 22:40 -0400, Qian Cai wrote:
>>> On Apr 16, 2020, at 10:27 PM, Russell Currey <ruscur@russell.cc>
>>> wrote:
>>>=20
>>> Reverting the patch with the given config will have the same effect
>>> as
>>> STRICT_KERNEL_RWX=3Dn.  Not discounting that it could be a bug on =
the
>>> powerpc side (i.e. relocatable kernels with strict RWX on haven't
>>> been
>>> exhaustively tested yet), but we should definitely figure out
>>> what's
>>> going on with this bad access first.
>>=20
>> BTW, this bad access only happened once. The overwhelming rest of
>> crashes are with NULL pointer NIP like below. How can you explain
>> that STRICT_KERNEL_RWX=3Dn would also make those NULL NIP disappear =
if
>> STRICT_KERNEL_RWX is just a messenger?
>=20
> What happens if you test with STRICT_KERNEL_RWX=3Dy and RELOCATABLE=3Dn,=

> reverting my patch?  This would give us an idea of whether it's
> something broken recently or if there's something else going on.

That combination will crash as well. I don=E2=80=99t think it is broken =
recently though due to
the crash could happen back in 5.6-rc1 when your commit first =
introduced.

>=20
>>=20
>> [  215.281666][T16896] LTP: starting chown04_16
>> [  215.424203][T18297] BUG: Unable to handle kernel instruction fetch
>> (NULL pointer?)
>> [  215.424289][T18297] Faulting instruction address: 0x00000000
>> [  215.424313][T18297] Oops: Kernel access of bad area, sig: 11 [#1]
>> [  215.424341][T18297] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D256=

>> DEBUG_PAGEALLOC NUMA PowerNV
>> [  215.424383][T18297] Modules linked in: loop kvm_hv kvm ip_tables
>> x_tables xfs sd_mod bnx2x mdio tg3 ahci libahci libphy libata
>> firmware_class dm_mirror dm_region_hash dm_log dm_mod
>> [  215.424459][T18297] CPU: 85 PID: 18297 Comm: chown04_16 Tainted:
>> G        W         5.6.0-next-20200405+ #3
>> [  215.424489][T18297] NIP:  0000000000000000 LR: c00800000fbc0408
>> CTR: 0000000000000000
>> [  215.424530][T18297] REGS: c000200b8606f990 TRAP: 0400   Tainted:
>> G        W          (5.6.0-next-20200405+)
>> [  215.424570][T18297] MSR:  9000000040009033
>> <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84000248  XER: 20040000
>> [  215.424619][T18297] CFAR: c00800000fbc64f4 IRQMASK: 0=20
>> [  215.424619][T18297] GPR00: c0000000006c2238 c000200b8606fc20
>> c00000000165ce00 0000000000000000=20
>> [  215.424619][T18297] GPR04: c000201a58106400 c000200b8606fcc0
>> 000000005f037e7d ffffffff00013bfb=20
>> [  215.424619][T18297] GPR08: c000201a58106400 0000000000000000
>> 0000000000000000 c000000001652ee0=20
>> [  215.424619][T18297] GPR12: 0000000000000000 c000201fff69a600
>> 0000000000000000 0000000000000000=20
>> [  215.424619][T18297] GPR16: 0000000000000000 0000000000000000
>> 0000000000000000 0000000000000000=20
>> [  215.424619][T18297] GPR20: 0000000000000000 0000000000000000
>> 0000000000000000 0000000000000007=20
>> [  215.424619][T18297] GPR24: 0000000000000000 0000000000000000
>> c00800000fbc8688 c000200b8606fcc0=20
>> [  215.424619][T18297] GPR28: 0000000000000000 000000007fffffff
>> c00800000fbc0400 c00020068b8c0e70=20
>> [  215.424914][T18297] NIP [0000000000000000] 0x0
>> [  215.424953][T18297] LR [c00800000fbc0408] find_free_cb+0x8/0x30
>> [loop]
>> find_free_cb at drivers/block/loop.c:2129
>> [  215.424997][T18297] Call Trace:
>> [  215.425036][T18297] [c000200b8606fc20] [c0000000006c2290]
>> idr_for_each+0xf0/0x170 (unreliable)
>> [  215.425073][T18297] [c000200b8606fca0] [c00800000fbc2744]
>> loop_lookup.part.2+0x4c/0xb0 [loop]
>> loop_lookup at drivers/block/loop.c:2144
>> [  215.425105][T18297] [c000200b8606fce0] [c00800000fbc3558]
>> loop_control_ioctl+0x120/0x1d0 [loop]
>> [  215.425149][T18297] [c000200b8606fd40] [c0000000004eb688]
>> ksys_ioctl+0xd8/0x130
>> [  215.425190][T18297] [c000200b8606fd90] [c0000000004eb708]
>> sys_ioctl+0x28/0x40
>> [  215.425233][T18297] [c000200b8606fdb0] [c00000000003cc30]
>> system_call_exception+0x110/0x1e0
>> [  215.425274][T18297] [c000200b8606fe20] [c00000000000c9f0]
>> system_call_common+0xf0/0x278
>> [  215.425314][T18297] Instruction dump:
>> [  215.425338][T18297] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
>> XXXXXXXX XXXXXXXX XXXXXXXX=20
>> [  215.425374][T18297] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
>> XXXXXXXX XXXXXXXX XXXXXXXX=20
>> [  215.425422][T18297] ---[ end trace ebed248fad431966 ]---
>> [  215.642114][T18297]=20
>> [  216.642220][T18297] Kernel panic - not syncing: Fatal exception

