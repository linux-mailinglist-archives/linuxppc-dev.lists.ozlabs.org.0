Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 186121ABFE8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 13:44:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492y7H2n7gzDrcW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 21:44:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492y5X2jNdzDqgN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 21:42:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=F6msH8q4; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 492y5V2GZKz9sR4;
 Thu, 16 Apr 2020 21:42:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1587037375;
 bh=t4CnpKi/1cWNveFL503UiUpa0nOioFN2uGWTVXoAKYo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=F6msH8q4pMopBVokSfSDN6OBQ2S/Eb32uVgHlQ0T511IzSGtYtiaPIYwl/WVqwAzB
 pl3QBuU5QbsXoXyFXmZ21FGYq7sWMmuonMX+4+FRxfwvwDpTakIsA64FlIELXls/Fk
 iBWCoCwbM3fY2tIz6olJLuRfOd3prB0QUwORjf0UHyg5D0cXZN1n2479owrKo8mb2H
 4Z9qCObz2+YH64TdrgA0v1on7J/TO5im0Sp37K7tv9tXlYJHD2zvBgJiPJGgTe5v36
 ucqbz3InfjaVmg95tQi4nJj8dJYQ4sEzmpGlNqQ4eO6FheHkpmQ39ZsOyKv/JzFSDC
 IOvVLxgMc6YPA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "christophe.leroy\@c-s.fr" <christophe.leroy@c-s.fr>,
 "paulus\@samba.org" <paulus@samba.org>,
 "benh\@kernel.crashing.org" <benh@kernel.crashing.org>,
 "oss\@buserror.net" <oss@buserror.net>,
 "tglx\@linutronix.de" <tglx@linutronix.de>
Subject: Re: [PATCH v2] powerpc/setup_64: Set cache-line-size based on
 cache-block-size
In-Reply-To: <343c0e8b01ab74481e0b8dfbe588b1c84127a487.camel@alliedtelesis.co.nz>
References: <dd342c71e03e654a8786302d82f9662004418c6e.camel@alliedtelesis.co.nz>
 <20200325031854.7625-1-chris.packham@alliedtelesis.co.nz>
 <343c0e8b01ab74481e0b8dfbe588b1c84127a487.camel@alliedtelesis.co.nz>
Date: Thu, 16 Apr 2020 21:43:04 +1000
Message-ID: <87tv1jirlj.fsf@mpe.ellerman.id.au>
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
Cc: Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Chris Packham <Chris.Packham@alliedtelesis.co.nz> writes:
> Hi All,
>
> On Wed, 2020-03-25 at 16:18 +1300, Chris Packham wrote:
>> If {i,d}-cache-block-size is set and {i,d}-cache-line-size is not,
>> use
>> the block-size value for both. Per the devicetree spec cache-line-
>> size
>> is only needed if it differs from the block size.
>> 
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> ---
>> It looks as though the bsizep = lsizep is not required per the spec
>> but it's
>> probably safer to retain it.
>> 
>> Changes in v2:
>> - Scott pointed out that u-boot should be filling in the cache
>> properties
>>   (which it does). But it does not specify a cache-line-size because
>> it
>>   provides a cache-block-size and the spec says you don't have to if
>> they are
>>   the same. So the error is in the parsing not in the devicetree
>> itself.
>> 
>
> Ping? This thread went kind of quiet.

I replied in the other thread:

  https://lore.kernel.org/linuxppc-dev/87369xx99u.fsf@mpe.ellerman.id.au/

But then the merge window happened which is a busy time.

What I'd really like is a v3 that incorporates the info I wrote in the
other thread and a Fixes tag.

If you feel like doing that, that would be great. Otherwise I'll do it
tomorrow.

cheers
