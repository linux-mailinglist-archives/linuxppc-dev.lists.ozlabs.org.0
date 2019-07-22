Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7EF6FD87
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 12:16:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45scwL19xKzDqTg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 20:16:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sctX6skFzDqQC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 20:15:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45sctX3vfqz9s3l;
 Mon, 22 Jul 2019 20:15:16 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v2] powerpc: slightly improve cache helpers
In-Reply-To: <20190721180150.GN20882@gate.crashing.org>
References: <c6ff2faba7fbb56a7f5b5f08cd3453f89fc0aaf4.1557480165.git.christophe.leroy@c-s.fr>
 <45hnfp6SlLz9sP0@ozlabs.org> <20190708191416.GA21442@archlinux-threadripper>
 <a5864549-40c3-badd-8c41-d5b7bf3c4f3c@c-s.fr>
 <20190709064952.GA40851@archlinux-threadripper>
 <20190719032456.GA14108@archlinux-threadripper>
 <20190719152303.GA20882@gate.crashing.org>
 <20190719160455.GA12420@archlinux-threadripper>
 <20190721075846.GA97701@archlinux-threadripper>
 <20190721180150.GN20882@gate.crashing.org>
Date: Mon, 22 Jul 2019 20:15:14 +1000
Message-ID: <87imru74ul.fsf@concordia.ellerman.id.au>
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
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Sun, Jul 21, 2019 at 12:58:46AM -0700, Nathan Chancellor wrote:
>> I have attached the disassembly of arch/powerpc/kernel/mem.o with
>> clear_page (working) and broken_clear_page (broken), along with the side
>> by side diff. My assembly knowledge is fairly limited as it stands and
>> it is certainly not up to snuff on PowerPC so I have no idea what I am
>> looking for. Please let me know if anything immediately looks off or if
>> there is anything else I can do to help out.
>
> You might want to use a disassembler that shows most simplified mnemonics,
> and you crucially should show the relocations.  "objdump -dr" works nicely.
>
>> 0000017c clear_user_page:
>>      17c: 38 80 00 80                  	li 4, 128
>>      180: 7c 89 03 a6                  	mtctr 4
>>      184: 7c 00 1f ec                  	dcbz 0, 3
>>      188: 38 63 00 20                  	addi 3, 3, 32
>>      18c: 42 00 ff f8                  	bdnz .+65528
>
> That offset is incorrectly disassembled, btw (it's a signed field, not
> unsigned).
>
>> 0000017c clear_user_page:
>>      17c: 94 21 ff f0                  	stwu 1, -16(1)
>>      180: 38 80 00 80                  	li 4, 128
>>      184: 38 63 ff e0                  	addi 3, 3, -32
>>      188: 7c 89 03 a6                  	mtctr 4
>>      18c: 38 81 00 0f                  	addi 4, 1, 15
>>      190: 8c c3 00 20                  	lbzu 6, 32(3)
>>      194: 98 c1 00 0f                  	stb 6, 15(1)
>>      198: 7c 00 27 ec                  	dcbz 0, 4
>>      19c: 42 00 ff f4                  	bdnz .+65524
>
> Uh, yeah, well, I have no idea what clang tried here, but that won't
> work.  It's copying a byte from each target cache line to the stack,
> and then does clears the cache line containing that byte on the stack.

So it seems like this is a clang bug.

None of the distros we support use clang, but we would still like to
keep it working if we can.

Looking at the original patch, the only upside is that the compiler
can use both RA and RB to compute the address, rather than us forcing RA
to 0.

But at least with my compiler here (GCC 8 vintage) I don't actually see
GCC ever using both GPRs even with the patch. Or at least, there's no
difference before/after the patch as far as I can see.

So my inclination is to revert the original patch. We can try again in a
few years :D

Thoughts?

cheers
