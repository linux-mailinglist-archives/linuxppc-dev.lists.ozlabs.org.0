Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2C15808D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 02:56:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsJQF4kn3z3c9W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 10:56:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kWgG78BP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsJPh3Fxgz3bYS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 10:56:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kWgG78BP;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LsJPh01Psz4x1T;
	Tue, 26 Jul 2022 10:56:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658796968;
	bh=XM/sSLZCdmxU7N0ibsdjeo384f6+QLdmjSl5hrtE3HY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kWgG78BPwfOqjitCUhFJ1j7aQuatzG1Kzsf+7936A1WLUoNMph3bVIxIlABiTDJEJ
	 hIIcGB/y8AFSlwe/+vhMtJcBEakfJHeQb/EPEh1G7QM8Fj1g7kmD4E4rDvBAscAEEQ
	 Y9m7YoapBqwumAnrkXpPVFp4iTJcszdtuCXUjKZ3zAyIkxhYTxrIpZQ+9viWvCIJZN
	 Lo+0ODKIoi8+wOoWZGyX2w81RnbtPvoDX+kaetTWOCl8t08KBgIfEZU4r9ji6GmqBD
	 XC9xzCTHZvgPJML2QJUKrzkpJdrABgL2gtRQwE/S/p+qpY1A+EQDJrveHxPMK7Qwkp
	 zoGf02DW07bSw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] drm/amdgpu: Re-enable DCN for 64-bit powerpc
In-Reply-To: <CAHk-=wihON4Ytte5zLHWNQtTapUvCpkToxY06OjX-_2B+Gq6Gg@mail.gmail.com>
References: <20220725123918.1903255-1-mpe@ellerman.id.au>
 <CAHk-=wihON4Ytte5zLHWNQtTapUvCpkToxY06OjX-_2B+Gq6Gg@mail.gmail.com>
Date: Tue, 26 Jul 2022 10:56:07 +1000
Message-ID: <87k080bsk8.fsf@mpe.ellerman.id.au>
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
Cc: dan@danny.cz, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, tpearson@raptorengineering.com, alexdeucher@gmail.com, linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Mon, Jul 25, 2022 at 5:39 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Further digging shows that the build failures only occur with compilers
>> that default to 64-bit long double.
>
> Where the heck do we have 'long double' things anywhere in the kernel?

There's one or two uses, but not in any code that's relevant to this
issue AFAICS.

> I tried to grep for it, and failed miserably. I found some constants
> that would qualify, but they were in the v4l colorspaces-details.rst
> doc file.
>
> Strange.

It doesn't seem to matter if you use long double or not. It's just that
if the long double size is 64-bits the linker refuses to link a mixture
of soft/hard-float objects.

The 64-bit ABI says long double is 128-bits, so the compilers that are
using 64-bit long double are either not built correctly, or we are not
passing the correct flags to them.

There's an -mlong-double-128 flag which we can pass at build time which
seems to do the right thing, I will probably add that to the kernel
CFLAGS, but I want that to get a bit more testing.

cheers
