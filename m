Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BC1581E6E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 05:54:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lt0KX3F7gz3dq8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 13:54:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CTwtJY9k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lt0Jf3xQtz3c7q
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 13:54:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CTwtJY9k;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lt0Jd1lSnz4x1b;
	Wed, 27 Jul 2022 13:54:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658894049;
	bh=kTFbGZYtIh0aDw7GS0DUle8DHhfypCpsBdzMprXBryI=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=CTwtJY9kCA6+M/ptApfbp6/9reKR4ShVxwLL0EJjUPHG4PXAiOmjjYhxsuHeYpQAW
	 I+5/0wjOc2Az68kRZR5G0qOkAZdXXO3ZRxcioyYhqG+eujM/+SEfJd1dNtPadWsdzo
	 7dih3yxPJg3mRiXtP2O7/e5dL5bsJklnNiVBPhqgl8lgdtIy5jGyhWgnc9cpLO9/Mr
	 OQ6P5a+v91ZPHG1M97w4PGQZP/jsg4jA+ub5vF6y1HiKlo1/0WhdID5XDmnZQ4TJiK
	 pJztQm0NhAsOok1r+EmBP/wh+BV188GTbEfsGQKK+cczIqk428epxZP8Za1TmKgI4Z
	 6aHAcZFlLkEng==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Sachin Sant <sachinp@linux.ibm.com>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/2] powerpc rng cleanups
In-Reply-To: <CAHmME9pMOQKnMUQQyOA+CkN5scQjtLN79pvdYSu70MkuU207cw@mail.gmail.com>
References: <20220711232448.136765-1-Jason@zx2c4.com>
 <YtVbbMpRbfCWEIFn@zx2c4.com>
 <CAHmME9pMOQKnMUQQyOA+CkN5scQjtLN79pvdYSu70MkuU207cw@mail.gmail.com>
Date: Wed, 27 Jul 2022 13:54:07 +1000
Message-ID: <87wnbz9pnk.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:
> On Mon, Jul 18, 2022 at 3:09 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>> On Tue, Jul 12, 2022 at 01:24:46AM +0200, Jason A. Donenfeld wrote:
>> > These are two small cleanups for -next. This v5 rebases on the latest
>> > git master, as some whitespace was added that made v4 no longer apply.
>> >
>> > Jason A. Donenfeld (2):
>> >   powerpc/powernv: rename remaining rng powernv_ functions to pnv_
>> >   powerpc/kvm: don't crash on missing rng, and use darn
>> >
>> >  arch/powerpc/include/asm/archrandom.h |  7 +--
>> >  arch/powerpc/kvm/book3s_hv_builtin.c  |  7 +--
>> >  arch/powerpc/platforms/powernv/rng.c  | 66 ++++++++++-----------------
>> >  drivers/char/hw_random/powernv-rng.c  |  2 +-
>> >  4 files changed, 30 insertions(+), 52 deletions(-)
>>
>> I think v5 has reached a completion point. Could you queue these up in
>> some PPC tree for 5.20?
>
> Just paging again. Do you think you could queue these up for 5.20?
> This trivial series is over a month old now.

It can't claim to fix a guest-triggerable hypervisor crash and also be
"trivial" :)

But yes I plan to queue it for v5.20.

cheers
