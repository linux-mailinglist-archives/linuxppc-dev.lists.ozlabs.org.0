Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AE81DC7D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 09:40:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SM3Y37BTzDqhN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 17:40:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SM1r45T4zDqXf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 17:38:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=J1Z4F9XG; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49SM1p0SX0z9sRK;
 Thu, 21 May 2020 17:38:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590046736;
 bh=KRzHDOmfMwlaMt726UpqEu3b+oSfQAbmI4Tg50xYIik=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=J1Z4F9XG13Cdg81A5YXPatjOCGOJGjrbCIl7emvLoWP8hT7DNDtKVvXOT+CHC/N3A
 AXVqHxKsBXPwydnwBJp37FU9sc2zHkZULjUVmqFv1I7ojLL661ZPnr70PLZHd2130Z
 e8a8vn4ZYyJgD2x49ssPHCJepew46JI6a4fY6LnG/yRGNIe/ZXGU9nxBT7sj9Blhfp
 V/ropzRK4CQxJtoGKKPgZa/Ws+fswwWoTOtK76R4sGayCKBGWz057AHKo4RxAyMqLr
 7kOhBvAFPTb4UiiAnnojRx3Wb7YQCm3frLi/yHa7PgwjWvw7badmwtXv85jF82QtR+
 HqJOBSC2Syl5g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] input: i8042: Remove special PowerPC handling
In-Reply-To: <20200520171618.GT89269@dtor-ws>
References: <87a7254bxd.fsf@mpe.ellerman.id.au>
 <20200518181043.3363953-1-natechancellor@gmail.com>
 <87ftbv87i3.fsf@mpe.ellerman.id.au> <20200520171618.GT89269@dtor-ws>
Date: Thu, 21 May 2020 17:39:13 +1000
Message-ID: <87wo557n4u.fsf@mpe.ellerman.id.au>
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
Cc: kbuild test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linux-input@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dmitry Torokhov <dmitry.torokhov@gmail.com> writes:
> Hi Michael,
>
> On Wed, May 20, 2020 at 04:07:00PM +1000, Michael Ellerman wrote:
>> [ + Dmitry & linux-input ]
>> 
>> Nathan Chancellor <natechancellor@gmail.com> writes:
>> > This causes a build error with CONFIG_WALNUT because kb_cs and kb_data
>> > were removed in commit 917f0af9e5a9 ("powerpc: Remove arch/ppc and
>> > include/asm-ppc").
>> >
>> > ld.lld: error: undefined symbol: kb_cs
>> >> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
>> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>> >> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
>> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>> >> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
>> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>> >
>> > ld.lld: error: undefined symbol: kb_data
>> >> referenced by i8042.c:309 (drivers/input/serio/i8042.c:309)
>> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>> >> referenced by i8042-ppcio.h:33 (drivers/input/serio/i8042-ppcio.h:33)
>> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>> >> referenced by i8042.c:319 (drivers/input/serio/i8042.c:319)
>> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>> >> referenced 15 more times
>> >
>> > Presumably since nobody has noticed this for the last 12 years, there is
>> > not anyone actually trying to use this driver so we can just remove this
>> > special walnut code and use the generic header so it builds for all
>> > configurations.
>> >
>> > Fixes: 917f0af9e5a9 ("powerpc: Remove arch/ppc and include/asm-ppc")
>> > Reported-by: kbuild test robot <lkp@intel.com>
>> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>> > ---
>> >  drivers/input/serio/i8042-ppcio.h | 57 -------------------------------
>> >  drivers/input/serio/i8042.h       |  2 --
>> >  2 files changed, 59 deletions(-)
>> >  delete mode 100644 drivers/input/serio/i8042-ppcio.h
>> 
>> This LGTM.
>> 
>> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>> 
>> I assumed drivers/input/serio would be pretty quiet, but there's
>> actually some commits to it in linux-next. So perhaps this should go via
>> the input tree.
>> 
>> Dmitry do you want to take this, or should I take it via powerpc?
>> 
>> Original patch is here:
>>   https://lore.kernel.org/lkml/20200518181043.3363953-1-natechancellor@gmail.com
>
> I'm fine with you taking it through powerpc.
>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

> Also, while I have your attention ;), could you please ack or take
> https://lore.kernel.org/lkml/20191002214854.GA114387@dtor-ws/ as I
> believe this is the last user or input_polled_dev API and I would like
> to drop it from the tree.

Ooof. Sorry, you are very patient :)

I have put it in my next-test.

In future feel free to send me mail off-list, or ping me on irc, if I
haven't picked something up after several months!

cheers
