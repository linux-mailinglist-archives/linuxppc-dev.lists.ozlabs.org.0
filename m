Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD5E9DB8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 04:13:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HXVP2cWZzDqbc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 12:13:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HXSj6K26zDqM9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 12:12:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46HXSj4x2Yz9s7T;
 Tue, 27 Aug 2019 12:12:21 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/time: use feature fixup in __USE_RTC() instead of
 cpu feature.
In-Reply-To: <60da7620a43dc29317a062f1d58dcfde8d32b258.camel@kernel.crashing.org>
References: <55c267ac6e0cd289970accfafbf9dda11a324c2e.1566802736.git.christophe.leroy@c-s.fr>
 <87blwc40i4.fsf@concordia.ellerman.id.au>
 <60da7620a43dc29317a062f1d58dcfde8d32b258.camel@kernel.crashing.org>
Date: Tue, 27 Aug 2019 12:12:20 +1000
Message-ID: <87y2zf2w6z.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:

> On Mon, 2019-08-26 at 21:41 +1000, Michael Ellerman wrote:
>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> > sched_clock(), used by printk(), calls __USE_RTC() to know
>> > whether to use realtime clock or timebase.
>> > 
>> > __USE_RTC() uses cpu_has_feature() which is initialised by
>> > machine_init(). Before machine_init(), __USE_RTC() returns true,
>> > leading to a program check exception on CPUs not having realtime
>> > clock.
>> > 
>> > In order to be able to use printk() earlier, use feature fixup.
>> > Feature fixups are applies in early_init(), enabling the use of
>> > printk() earlier.
>> > 
>> > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> > ---
>> >  arch/powerpc/include/asm/time.h | 9 ++++++++-
>> >  1 file changed, 8 insertions(+), 1 deletion(-)
>> 
>> The other option would be just to make this a compile time decision, eg.
>> add CONFIG_PPC_601 and use that to gate whether we use RTC.
>> 
>> Given how many 601 users there are, maybe 1?, I think that would be a
>> simpler option and avoids complicating the code / binary for everyone
>> else.
>
> Didn't we ditch 601 support years ago anyway ? We had workaround we
> threw out I think...

Paul said his still booted recently.

cheers
