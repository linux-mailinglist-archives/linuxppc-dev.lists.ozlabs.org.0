Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B52F66A58BB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 12:58:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQwrG4Rk0z3cM3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 22:58:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=f5n+G1Sa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQwqN1n88z3bgv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 22:58:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=f5n+G1Sa;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PQwqL0WKnz4x1S;
	Tue, 28 Feb 2023 22:58:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1677585487;
	bh=T7m6rAKgrT8sjyDmNLKdZltCp4n7kd0f94FIxHvHRGw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=f5n+G1San0GWm4EURNJwqNBX5uB++CKCNw0d4OVqayAOk9X6wJ0cJNyhLbSmkqsf9
	 I8TJPFTiRl0qOqMUYUC55+bFFECxTuNz91Kw9Ou3qAorl5UorGl+3CtE7vE4BzZvZs
	 tyLvaxkStt6qhxCRxGt1hY9gvWqAkP3cyx831AnNmAdt00vQDCMDvAxAfVYbJ56mwm
	 ScSy6Nwpi94mJ5Iv3P283KF7epzI45yiXTh0JnUJss8Odc3npkdc9osKcGtpxjDwtf
	 Im+tkXG3OdgrSEejGFlh2Y16eZ5woef/IqAPThq/XOLbWzaTSMWupbn8Z9zX27C64f
	 Nz4srrQ/Q4hvQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Marco Elver <elver@google.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH mm] kasan, powerpc: Don't rename memintrinsics if
 compiler adds prefixes
In-Reply-To: <CANpmjNNtxW41H8ju6iog=ynMdEE0awa7GYabsuL6ZRihmVYQHw@mail.gmail.com>
References: <20230227094726.3833247-1-elver@google.com>
 <20230227141646.084c9a49fcae018852ca60f5@linux-foundation.org>
 <CANpmjNNtxW41H8ju6iog=ynMdEE0awa7GYabsuL6ZRihmVYQHw@mail.gmail.com>
Date: Tue, 28 Feb 2023 22:58:03 +1100
Message-ID: <87o7peuhmc.fsf@mpe.ellerman.id.au>
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
Cc: kernel test robot <lkp@intel.com>, Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Liam Howlett <liam.howlett@oracle.com>, kasan-dev@googlegroups.com, Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Marco Elver <elver@google.com> writes:
> On Mon, 27 Feb 2023 at 23:16, Andrew Morton <akpm@linux-foundation.org> wrote:
>>
>> On Mon, 27 Feb 2023 10:47:27 +0100 Marco Elver <elver@google.com> wrote:
>>
>> > With appropriate compiler support [1], KASAN builds use __asan prefixed
>> > meminstrinsics, and KASAN no longer overrides memcpy/memset/memmove.
>> >
>> > If compiler support is detected (CC_HAS_KASAN_MEMINTRINSIC_PREFIX),
>> > define memintrinsics normally (do not prefix '__').
>> >
>> > On powerpc, KASAN is the only user of __mem functions, which are used to
>> > define instrumented memintrinsics. Alias the normal versions for KASAN
>> > to use in its implementation.
>> >
>> > Link: https://lore.kernel.org/all/20230224085942.1791837-1-elver@google.com/ [1]
>> > Link: https://lore.kernel.org/oe-kbuild-all/202302271348.U5lvmo0S-lkp@intel.com/
>> > Reported-by: kernel test robot <lkp@intel.com>
>> > Signed-off-by: Marco Elver <elver@google.com>
>>
>> Seems this is a fix against "kasan: treat meminstrinsic as builtins in
>> uninstrumented files", so I'll plan to fold this patch into that patch.
>
> Yes, that looks right.
>
> If a powerpc maintainer could take a quick look as well would be good.

The patch looks OK to me. It builds for various configs and I did a few
test boots with KASAN enabled, everything seems normal.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)


> The maze of memcpy/memmove/memset definitions and redefinitions isn't
> the simplest - I hope in a few years we can delete all the old code
> (before CC_HAS_KASAN_MEMINTRINSIC_PREFIX), and let the compilers just
> "do the right thing".

Yeah that would be nice.

cheers
