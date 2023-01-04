Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 881C865D0B8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 11:35:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nn5Zy1xKSz3c9G
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 21:35:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZgQc1aUh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nn5Z16Jk0z2xkG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 21:34:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZgQc1aUh;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Nn5Yr2J42z4xwl;
	Wed,  4 Jan 2023 21:34:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1672828450;
	bh=5gtoEfhVejTP2PSgVm0jnlqHjpeRUn34WQgEHxOBFKo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZgQc1aUhkiFUlsN1j3jU9HhNE9Mc/f5fex+rJfbq/ViJ/I45I7m1Nawieeq0kUPuy
	 OjSsaoBVGoAxMd+6G6OvQiTizzajnZ77O8cWzKrOkwI3VOy10QtrnSWF9UwqNutxnB
	 mFY+2SYBZVMLvDSw9cUnEP1yVBVEVxpZP0/A2VR5knYFZde6FYruZHJb4N7UqYhGM1
	 vioLbAL/Zxo8qgC0GL0iQUcy0rPPul6NBBtUQoIPDohhIRMzAquHn/9TOvQ9bRmWaC
	 eAEbZL+nB/MY9veAzSVOI+uppvtT1pJsa2jp3V2S1Q2iBMiTMj4Z6om5vLO9SxRhdg
	 ZI6UueG8lj68w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ard Biesheuvel <ardb@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: Linux 6.2-rc2
In-Reply-To: <CAMj1kXHqQoqoys83nEp=Q6oT68+-GpCuMjfnYK9pMy-X_+jjKw@mail.gmail.com>
References: <CAHk-=wim8DMRzjyYTJ3UbdqZ26keQyZSU02NZb-JY1=9OpcO1w@mail.gmail.com>
 <20230102225656.GA3532398@roeck-us.net>
 <CAHk-=wjZPPscjDhsHQw_ttHOaQS69rADLm0KuRhbNavBiO62OQ@mail.gmail.com>
 <20230103014535.GA313835@roeck-us.net>
 <CAHk-=whmeBkyu3iS_s-yk0=t3GEoW3sQb-wJFHKykOjG=iQVFw@mail.gmail.com>
 <CAMj1kXHqQoqoys83nEp=Q6oT68+-GpCuMjfnYK9pMy-X_+jjKw@mail.gmail.com>
Date: Wed, 04 Jan 2023 21:34:07 +1100
Message-ID: <874jt64mhs.fsf@mpe.ellerman.id.au>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ard Biesheuvel <ardb@kernel.org> writes:
> On Tue, 3 Jan 2023 at 03:13, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> On Mon, Jan 2, 2023 at 5:45 PM Guenter Roeck <linux@roeck-us.net> wrote:
>> >
>> > ... and reverting commit 99cb0d917ff indeed fixes the problem.
>>
>> Hmm. My gut feel is that this just exposes some bug in binutils.
...
>> It really shouldn't matter, but here we are, with a build problem with
>> some random old binutils on an odd platform..
>>
>
> AIUI, the way ld.bfd used to combine output sections may also affect
> the /DISCARD/ pseudo-section, and so introducing it much earlier
> results in these discards to be interpreted in a different order.
>
> The purpose of this change is to prevent .note.GNU-stack from deciding
> the section type of the .notes output section, and so keeping it in
> its own section should be sufficient. E.g.,
>
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -896,7 +896,7 @@
>   * Otherwise, the type of .notes section would become PROGBITS
> instead of NOTES.
>   */
>  #define NOTES                                                          \
> -       /DISCARD/ : { *(.note.GNU-stack) }                              \
> +       .note.GNU-stack : { *(.note.GNU-stack) }                        \
>         .notes : AT(ADDR(.notes) - LOAD_OFFSET) {                       \
>                 BOUNDED_SECTION_BY(.note.*, _notes)                     \
>         } NOTES_HEADERS                                                 \

This also fixes errors seen in the powerpc build with binutils <= 2.35.

Tested-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
