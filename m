Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 887A82B5DF4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 12:08:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cb38D0vDNzDqHb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 22:08:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cb34D5wQ7zDqRt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 22:04:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RC46mI7o; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cb34D071Tz9sSs;
 Tue, 17 Nov 2020 22:04:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1605611084;
 bh=F85XDsCUd/+zweu0A2PeEPjjJvwLjHMUUwIvEo61Ovw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RC46mI7o9H0+suwlvjg0aJ1MFMrXEHaAGrz54/dbAPDi63Qx4TdDZQhSPQX/cGfXW
 RWeMFEb7eDuAzqb8yUnFK4Dhz4lqv/Bc3lW+XY/tgoc/6MZ4vBB5Ymw/Fe2+2EV2U+
 URJUEayd4sTmKXrhbz9PLSrA9qx9OFWANIou8H+DPVF7/yFrEA33Wv1a7bYS6ElWxn
 w1zrTFGrknsP7uOlonaojDZscBQgqFeWL7Lv8LLVWBFLG4Spz8Ygcl+7LTd/pmszY5
 g2PBDrLeoYZOE9si1Nx5Gq6nCSLQvu++nbSBdbTXep2OTtE2nyDO1xF1yu5Gn43jGr
 8G5w51UEnjpSQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH] powerpc/powernv/memtrace: Fake non-memblock aligned sized
 traces
In-Reply-To: <CACzsE9rBCjkDAM69E68yE=9bzxo5M6y6ZZd3dioFvLtiESFE9Q@mail.gmail.com>
References: <20201111055524.2458-1-jniethe5@gmail.com>
 <87blfx4iho.fsf@mpe.ellerman.id.au>
 <CACzsE9rBCjkDAM69E68yE=9bzxo5M6y6ZZd3dioFvLtiESFE9Q@mail.gmail.com>
Date: Tue, 17 Nov 2020 22:04:43 +1100
Message-ID: <87r1os2qic.fsf@mpe.ellerman.id.au>
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
Cc: Michael Neuling <mikey@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:
> On Mon, Nov 16, 2020 at 11:02 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Jordan Niethe <jniethe5@gmail.com> writes:
>> > The hardware trace macros which use the memory provided by memtrace are
>> > able to use trace sizes as small as 16MB. Only memblock aligned values
>> > can be removed from each NUMA node by writing that value to
>> > memtrace/enable in debugfs.  This means setting up, say, a 16MB trace is
>> > not possible.  To allow such a trace size, instead align whatever value
>> > is written to memtrace/enable to the memblock size for the purpose of
>> > removing it from each NUMA node but report the written value from
>> > memtrace/enable and memtrace/x/size in debugfs.
>>
>> Why does it matter if the size that's removed is larger than the size
>> that was requested?
>>
>> Is it about constraining the size of the trace? If so that seems like it
>> should be the job of the tracing tools, not the kernel.
>
> Yeah about constraining the size, I'll just do it in the trace tools.

OK, I think that would be better. Thanks.

cheers
