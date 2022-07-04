Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A0756531C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:15:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc39x3cSFz3c24
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:15:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc39T4kk5z2yRK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:14:37 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc39R2Lm4z4xLX;
	Mon,  4 Jul 2022 21:14:35 +1000 (AEST)
Date: Mon, 04 Jul 2022 21:14:32 +1000
From: Michael Ellerman <michael@ellerman.id.au>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Sachin Sant <sachinp@linux.ibm.com>,
 benh@kernel.crashing.org, paulus@samba.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_powerpc/powernv=3A_delay_rn?= =?US-ASCII?Q?g_of_node_creation_until_later_in_boot?=
User-Agent: K-9 Mail for Android
In-Reply-To: <YsAg/hixHvdxnWNL@zx2c4.com>
References: <Yr2PQSZWVtr+Y7a2@zx2c4.com> <20220630121654.1939181-1-Jason@zx2c4.com> <8A9A296D-D7BD-42BE-AB32-C951C29E4C40@linux.ibm.com> <YsAg/hixHvdxnWNL@zx2c4.com>
Message-ID: <2B9FC5ED-D6B8-4632-ACA4-7CF508EE9C46@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2 July 2022 8:42:06 pm AEST, "Jason A=2E Donenfeld" <Jason@zx2c4=2Ecom>=
 wrote:
>Hi Benjamin, Paul,
>
>On Thu, Jun 30, 2022 at 07:24:05PM +0530, Sachin Sant wrote:
>> > On 30-Jun-2022, at 5:46 PM, Jason A=2E Donenfeld <Jason@zx2c4=2Ecom> =
wrote:
>> >=20
>> > The of node for the rng must be created much later in boot=2E Otherwi=
se it
>> > tries to connect to a parent that doesn't yet exist, resulting on thi=
s
>> > splat:
>> >=20
>> > [    0=2E000478] kobject: '(null)' ((____ptrval____)): is not initial=
ized, yet kobject_get() is being called=2E
>> > [    0=2E002925] [c000000002a0fb30] [c00000000073b0bc] kobject_get+0x=
8c/0x100 (unreliable)
>> > [    0=2E003071] [c000000002a0fba0] [c00000000087e464] device_add+0xf=
4/0xb00
>> > [    0=2E003194] [c000000002a0fc80] [c000000000a7f6e4] of_device_add+=
0x64/0x80
>> > [    0=2E003321] [c000000002a0fcb0] [c000000000a800d0] of_platform_de=
vice_create_pdata+0xd0/0x1b0
>> > [    0=2E003476] [c000000002a0fd00] [c00000000201fa44] pnv_get_random=
_long_early+0x240/0x2e4
>> > [    0=2E003623] [c000000002a0fe20] [c000000002060c38] random_init+0x=
c0/0x214
>> >=20
>> > This patch fixes the issue by doing the of node creation inside of
>> > machine_subsys_initcall=2E
>> >=20
>> > Fixes: f3eac426657d ("powerpc/powernv: wire up rng during setup_arch"=
)
>> > Cc: stable@vger=2Ekernel=2Eorg
>> > Cc: Michael Ellerman <mpe@ellerman=2Eid=2Eau>
>> > Reported-by: Sachin Sant <sachinp@linux=2Eibm=2Ecom>
>> > Signed-off-by: Jason A=2E Donenfeld <Jason@zx2c4=2Ecom>
>> > ---
>>=20
>> Thanks Jason for the patch=2E This fixes the reported problem for me=2E
>>=20
>> Tested-by: Sachin Sant <sachinp@linux=2Eibm=2Ecom>
>>=20
>> - Sachin
>
>It sounds like Michael is on vacation for a few weeks=2E Think you could
>queue this up so we can get POWER8 booting again?

It doesn't break booting for me, but it is an ugly splat=2E

I'll pick it up into fixes=2E

I think it's more correct to say the "platform device creation" causes the=
 problem, so I'll update the change log to say that=2E

cheers
