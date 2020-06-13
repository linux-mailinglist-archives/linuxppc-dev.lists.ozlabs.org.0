Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE001F8301
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 12:48:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49kZ7r551YzDr0Q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 20:48:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49kZ5x611LzDqxs
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jun 2020 20:46:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=BFq6fOLl; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49kZ5w30F3z9sRK;
 Sat, 13 Jun 2020 20:46:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592045205;
 bh=C+TXIauZrJrUOan6WNfQuTL+WR9gkJUGFPXh/uGrLlw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=BFq6fOLlZD1bp+UeJIgWj7V6rrZOCFN5xO4KmX/K6nK5DHLGWYo6yc0/TXebp10pH
 haRlfxxiGBjbjt1KyQBdZfXC5633q24KvmQv9W65PlYHeyzk7ZAFTH1ry4XdQ4fU+F
 jJf0LneOpxTqNH1sz0J0P8UtapPt7oFpo/TvZ5w5xAOVDCnIcKYJAYGHAU1RzUdOAp
 q9dPbdIO689+8ZuyCjTntkjTvjfg1P2YWXwr4LUu9Plz/f+oWYnn53s3Fn5+MnSbhf
 mtaEIkof+H5iuZL1Fy2igpddeaV9ro/qD8ZRof0jB7vctPZjLfkWI8syL8jKC2+6O/
 AIXbAhH7SrVtA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nick Desaulniers <ndesaulniers@google.com>,
 Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v4 1/2] powerpc/uaccess: Implement unsafe_put_user() using
 'asm goto'
In-Reply-To: <CAKwvOdkKywb1KZ-SDwwuvQEmbsaAzJj9mEPqVG=qw1F5Ogv8rw@mail.gmail.com>
References: <49YBKY13Szz9sT4@ozlabs.org>
 <20200611224355.71174-1-ndesaulniers@google.com>
 <20200611235256.GL31009@gate.crashing.org>
 <CAKwvOdkKywb1KZ-SDwwuvQEmbsaAzJj9mEPqVG=qw1F5Ogv8rw@mail.gmail.com>
Date: Sat, 13 Jun 2020 20:47:11 +1000
Message-ID: <87366zfdjk.fsf@mpe.ellerman.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Michael Ellerman <patch-notifications@ellerman.id.au>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nick Desaulniers <ndesaulniers@google.com> writes:

> On Thu, Jun 11, 2020 at 4:53 PM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
>>
>> On Thu, Jun 11, 2020 at 03:43:55PM -0700, Nick Desaulniers wrote:
>> > Segher, Cristophe, I suspect Clang is missing support for the %L and %U
>> > output templates [1].
...
>
> IIUC the bug report correctly, it looks like LLVM is failing for the
> __put_user_asm2_goto case for -m32.  A simple reproducer:
> https://godbolt.org/z/jBBF9b

If you add `-mregnames` you get register names:

https://godbolt.org/z/MxLjhF

foo:
        stw %r3, 0(%r5)
        stw %r4, 4(%r5)
        blr


cheers
