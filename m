Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D7A1B509
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 13:34:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452dyh3113zDqJX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 21:34:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452dxL71cNzDqDY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 21:33:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 452dxK1vDjz9s4Y;
 Mon, 13 May 2019 21:33:41 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Dmitry Vyukov <dvyukov@google.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH, RFC] byteorder: sanity check toolchain vs kernel endianess
In-Reply-To: <CACT4Y+ad5z6z0Dweh5hGwYcUUebPEtqsznmX9enPvYB20J16aA@mail.gmail.com>
References: <20190412143538.11780-1-hch@lst.de>
 <CAK8P3a2bg9YkbNpAb9uZkXLFZ3juCmmbF7cRw+Dm9ZiLFno2OQ@mail.gmail.com>
 <fd59e6e22594f740eaf86abad76ee04d@mailhost.ics.forth.gr>
 <CACT4Y+aKGKm9Wbc1owBr51adkbesHP_Z81pBAoZ5HmJ+uZdsaw@mail.gmail.com>
 <CAK8P3a3xRBZrgv16sSigJhY0vGmb=qF9o=6dC_5DqAJtW3qPGQ@mail.gmail.com>
 <CACT4Y+ad5z6z0Dweh5hGwYcUUebPEtqsznmX9enPvYB20J16aA@mail.gmail.com>
Date: Mon, 13 May 2019 21:33:39 +1000
Message-ID: <87woiutwq4.fsf@concordia.ellerman.id.au>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dmitry Vyukov <dvyukov@google.com> writes:
> From: Arnd Bergmann <arnd@arndb.de>
> Date: Sat, May 11, 2019 at 2:51 AM
> To: Dmitry Vyukov
> Cc: Nick Kossifidis, Christoph Hellwig, Linus Torvalds, Andrew Morton,
> linux-arch, Linux Kernel Mailing List, linuxppc-dev
>
>> On Fri, May 10, 2019 at 6:53 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>> > >
>> > > I think it's good to have a sanity check in-place for consistency.
>> >
>> >
>> > Hi,
>> >
>> > This broke our cross-builds from x86. I am using:
>> >
>> > $ powerpc64le-linux-gnu-gcc --version
>> > powerpc64le-linux-gnu-gcc (Debian 7.2.0-7) 7.2.0
>> >
>> > and it says that it's little-endian somehow:
>> >
>> > $ powerpc64le-linux-gnu-gcc -dM -E - < /dev/null | grep BYTE_ORDER
>> > #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
>> >
>> > Is it broke compiler? Or I always hold it wrong? Is there some
>> > additional flag I need to add?
>>
>> It looks like a bug in the kernel Makefiles to me. powerpc32 is always
>> big-endian,
>> powerpc64 used to be big-endian but is now usually little-endian. There are
>> often three separate toolchains that default to the respective user
>> space targets
>> (ppc32be, ppc64be, ppc64le), but generally you should be able to build
>> any of the
>> three kernel configurations with any of those compilers, and have the Makefile
>> pass the correct -m32/-m64/-mbig-endian/-mlittle-endian command line options
>> depending on the kernel configuration. It seems that this is not happening
>> here. I have not checked why, but if this is the problem, it should be
>> easy enough
>> to figure out.
>
>
> Thanks! This clears a lot.
> This may be a bug in our magic as we try to build kernel files outside
> of make with own flags (required to extract parts of kernel
> interfaces).
> So don't spend time looking for the Makefile bugs yet.

OK :)

We did have some bugs in the past (~1-2 y/ago) but AFAIK they are all
fixed now. These days I build most of my kernels with a bi-endian 64-bit
toolchain, and switching endian without running `make clean` also works.

cheers
