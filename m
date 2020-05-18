Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D81B41D7115
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 08:32:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QThv2LfGzDqSc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 16:32:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QTgM2lP0zDqTW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 16:31:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hiZAk5Z7; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49QTgJ5p2jz9sTK;
 Mon, 18 May 2020 16:31:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589783486;
 bh=A9ilZb+m38EVwZcusvWoFAeYwAVu/NnhwISefnzp1JQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hiZAk5Z7gXISsenZ17Mm5zKblpvYJS7sBLgBoXfG8yVWfvjwNtu2/EymxnFkoQKQp
 7S9soZUEPwLYZzfrTvrUM/Zk1UObHcoXjhJxZC4MDcgjxezQGBxobik5DwqzNTBqME
 9zBi5SDe2CO6bWILBZFz01wWtsGZ8SC9hW6wctcQTsYagKoYdXM2EaAusAjbVlTWNK
 Nus7alWXXf1ZudtcYcEeujmHltTdA0BcXwYODBapSysuNDZvmmVB+tIEKdrtCumgvL
 basZq9z+EYUezVKOkO8Emks92LEShvUPP47BDuzuAy/6VIHzcLChCvAJ76vYEoVPGd
 +ne4IIFlAbAEA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Geoff Levand <geoff@infradead.org>
Subject: Re: [PATCH v2 7/9] powerpc/ps3: Add check for otheros image size
In-Reply-To: <65353693-f082-42eb-aa89-ab11ea5f623b@infradead.org>
References: <cover.1589049250.git.geoff@infradead.org>
 <4e8defeb49d62dd9d435e5ea3ddc5668e56fa496.1589049250.git.geoff@infradead.org>
 <87y2pu9cqd.fsf@mpe.ellerman.id.au>
 <65353693-f082-42eb-aa89-ab11ea5f623b@infradead.org>
Date: Mon, 18 May 2020 16:31:40 +1000
Message-ID: <87h7wdah4j.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Geoff Levand <geoff@infradead.org> writes:
> Hi Michael,
>
> On 5/14/20 7:02 PM, Michael Ellerman wrote:
>> Geoff Levand <geoff@infradead.org> writes:
> ...
>>> +    # The ps3's flash loader has a size limit of 16 MiB for the uncompressed
>>> +    # image.  If a compressed image that exceeded this limit is written to
>>> +    # flash the loader will decompress that image until the 16 MiB limit is
>>> +    # reached, then enter the system reset vector of the partially decompressed
>>> +    # image.  No warning is issued.
>>> +    rm -f "$odir"/{otheros,otheros-too-big}.bld
>>> +    size=$(${CROSS}nm --no-sort --radix=d "$ofile" | egrep ' _end$' | cut -d' ' -f1)
>>> +    bld="otheros.bld"
>>> +    if [ $size -gt $((0x1000000)) ]; then
>>> +        bld="otheros-too-big.bld"
>>> +        echo "  INFO: Uncompressed kernel is too large to program into PS3 flash memory;" \
>> 
>> This now appears on all my ppc64_defconfig builds, which I don't really
>> like.
>
> No, neither do I.  I didn't think of that case.
>
>> That does highlight the fact that ppc64_defconfig including
>> CONFIG_PPC_PS3 is not really helpful for people actually wanting to run
>> the kernel on a PS3.
>
> No, this is just for the bootloader image (.bld) that can be
> programed into flash memory.  This is what is used to create,
> for example, a petitboot bootloader image.
>
> Normal usage is for the bootloader in flash to load a vmlinux
> image from disk or network, in which case running a ppc64_defconfig
> image would be fine.

Ah yep, that rings a bell.

>> So I wonder if we should drop CONFIG_PPC_PS3 from ppc64_defconfig, in
>> which case I'd be happy to keep the INFO message because it should only
>> appear on ps3 specific builds.
>
> I'd like to keep CONFIG_PPC_PS3 set in ppc64_defconfig.  I feel it
> useful to get some build testing of the PS3 platform code.
>
>> The other option would be to drop the message, or only print it when
>> we're doing a verbose build.
>
> Building a boatloader image to program into flash memory is
> something only very advanced users would be doing.  I don't
> think they would need this message.  They would see the file
> name and understand the situation.  I'll post a v3 patch that
> removes the message.

Great, thanks.

cheers
