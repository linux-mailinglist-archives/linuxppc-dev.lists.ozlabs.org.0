Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D7570D4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2019 01:23:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45syN05VP0zDqX0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2019 09:23:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45syLF6hDHzDqCp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 09:21:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45syLF0b78z9s4Y;
 Tue, 23 Jul 2019 09:21:57 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2] powerpc: slightly improve cache helpers
In-Reply-To: <20190722151801.GC20882@gate.crashing.org>
References: <45hnfp6SlLz9sP0@ozlabs.org>
 <20190708191416.GA21442@archlinux-threadripper>
 <a5864549-40c3-badd-8c41-d5b7bf3c4f3c@c-s.fr>
 <20190709064952.GA40851@archlinux-threadripper>
 <20190719032456.GA14108@archlinux-threadripper>
 <20190719152303.GA20882@gate.crashing.org>
 <20190719160455.GA12420@archlinux-threadripper>
 <20190721075846.GA97701@archlinux-threadripper>
 <20190721180150.GN20882@gate.crashing.org>
 <87imru74ul.fsf@concordia.ellerman.id.au>
 <20190722151801.GC20882@gate.crashing.org>
Date: Tue, 23 Jul 2019 09:21:53 +1000
Message-ID: <875znt7izy.fsf@concordia.ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Mon, Jul 22, 2019 at 08:15:14PM +1000, Michael Ellerman wrote:
>> Segher Boessenkool <segher@kernel.crashing.org> writes:
>> > On Sun, Jul 21, 2019 at 12:58:46AM -0700, Nathan Chancellor wrote:
>> >> 0000017c clear_user_page:
>> >>      17c: 94 21 ff f0                  	stwu 1, -16(1)
>> >>      180: 38 80 00 80                  	li 4, 128
>> >>      184: 38 63 ff e0                  	addi 3, 3, -32
>> >>      188: 7c 89 03 a6                  	mtctr 4
>> >>      18c: 38 81 00 0f                  	addi 4, 1, 15
>> >>      190: 8c c3 00 20                  	lbzu 6, 32(3)
>> >>      194: 98 c1 00 0f                  	stb 6, 15(1)
>> >>      198: 7c 00 27 ec                  	dcbz 0, 4
>> >>      19c: 42 00 ff f4                  	bdnz .+65524
>> >
>> > Uh, yeah, well, I have no idea what clang tried here, but that won't
>> > work.  It's copying a byte from each target cache line to the stack,
>> > and then does clears the cache line containing that byte on the stack.
>> 
>> So it seems like this is a clang bug.
>> 
>> None of the distros we support use clang, but we would still like to
>> keep it working if we can.
>
> Which version?  Which versions *are* broken?

AFAIK clang 8 is the first version that we could build with, without
hacks.

>> Looking at the original patch, the only upside is that the compiler
>> can use both RA and RB to compute the address, rather than us forcing RA
>> to 0.
>> 
>> But at least with my compiler here (GCC 8 vintage) I don't actually see
>> GCC ever using both GPRs even with the patch. Or at least, there's no
>> difference before/after the patch as far as I can see.
>
> The benefit is small, certainly.

Zero is small, but I guess some things are smaller? :P

>> So my inclination is to revert the original patch. We can try again in a
>> few years :D
>> 
>> Thoughts?
>
> I think you should give the clang people time to figure out what is
> going on.

Yeah fair enough, will wait and see what their diagnosis is.

cheers
