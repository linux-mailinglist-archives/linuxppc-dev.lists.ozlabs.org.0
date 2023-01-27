Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 366C267DCF9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 05:51:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P34sG10k4z3fJf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 15:50:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oSu9/Iai;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P34rM0401z3cgv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 15:50:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oSu9/Iai;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P34rJ02zQz4xGM;
	Fri, 27 Jan 2023 15:50:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1674795008;
	bh=xrXkmoW88qRFi3cS/J8wdbXij99nXqiP/sRzTWWDpHM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oSu9/IaiVeQxufg2Zflj72HUZdDIFHIsgWMA2FUIVh88i23rPhEHjDjfq98IAp7A/
	 DnaKtn7E3QgQ0B0UxRtn6kolE/ndlORgylafo/dQcvtVXTXShSTFyjJ1ND2w6HGNPM
	 b1iAy2ZSuYL34vDYm48gROwv1hVnwkk97nvOrxUQ5uDbwQReN4xGwBeAS7aEyAgt3s
	 UFdwxPE0NE5UHENu/vMgurJVfUw4qp3p0ZxFH7YXx8xTNdlegohom8AwoYkjIwqPcY
	 YxSMnYzTyOm2lp0RWeKVwlVVI6JCWrbtfSDAjXZKfRWDMHqnFWy5xvGFsYx+l20yVi
	 +2YtUaeafdUog==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Morton <akpm@linux-foundation.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] kasan: Fix Oops due to missing calls to
 kasan_arch_is_ready()
In-Reply-To: <20230126152024.bfdd25de2ff5107fa7c02986@linux-foundation.org>
References: <150768c55722311699fdcf8f5379e8256749f47d.1674716617.git.christophe.leroy@csgroup.eu>
 <20230126152024.bfdd25de2ff5107fa7c02986@linux-foundation.org>
Date: Fri, 27 Jan 2023 15:50:01 +1100
Message-ID: <874jsctwcm.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Morton <akpm@linux-foundation.org> writes:
> On Thu, 26 Jan 2023 08:04:47 +0100 Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>
>> On powerpc64, you can build a kernel with KASAN as soon as you build it
>> with RADIX MMU support. However if the CPU doesn't have RADIX MMU,
>> KASAN isn't enabled at init and the following Oops is encountered.
>
> Should we backport to -stable?  If so, can we identify a suitable Fixes: target?

It would be nice if it went to stable, but I'd defer to the Kasan maintainers.

The kasan_arch_is_ready() checks went in a while back, but there wasn't
a meaningful user until the powerpc support went in, so I'd target that:

Fixes: 41b7a347bf14 ("powerpc: Book3S 64-bit outline-only KASAN support")
Cc: stable@vger.kernel.org # v5.19+

cheers
