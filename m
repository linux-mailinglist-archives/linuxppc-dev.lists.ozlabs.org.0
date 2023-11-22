Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 515CD7F471E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 13:55:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XYRAWaNy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sb1SL1cdcz3dLg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 23:55:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XYRAWaNy;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sb1RV2xkpz2yN8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 23:54:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700657686;
	bh=wuIXzags+RBlDsjUweIx70S2oQNg60ItGMTYwpyF8/M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XYRAWaNyY9Csde2AbWpecLjArnLsrn0AlVA79QjjWeODirREpWX314cVo3QIskZpN
	 m51hJ686exSXsNpE9nVqalYXaeQBoAeGC2xByBScxxgOlln9d/b7gFhnRSRnlV47W0
	 dEn7nCwXtKgxtNgyXWT/SWibxwhRvXSvf/0/OIL7vZH3/weJl0f+5S/jFLnaTGoNgJ
	 SwdL1M1rDCZ/NN63LGyaiVfYsIl5Z2GyN6U3yuJiKFg7OUuVQeoHymsns06ydgG8Nt
	 XdHE5k9dS7i02GUJxltb7eBdQeqe5XWjWbvaK+XqZUbgzkRlRvKqZQGvDcq/zC3Fw2
	 kx54DpXN6r3xQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sb1RT54M1z4xWV;
	Wed, 22 Nov 2023 23:54:45 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>
Subject: Re: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
In-Reply-To: <CAK7LNAT-_07_h1_jG606VX0WjJq8dEW+C_4E0f28mjyqFnCWFw@mail.gmail.com>
References: <20231120232332.4100288-1-masahiroy@kernel.org>
 <CX42TU4QHS1Z.A0UUHMDAMZOL@wheely> <87bkbnsa5r.fsf@kernel.org>
 <CAK7LNAT-_07_h1_jG606VX0WjJq8dEW+C_4E0f28mjyqFnCWFw@mail.gmail.com>
Date: Wed, 22 Nov 2023 23:54:45 +1100
Message-ID: <87a5r6j6cq.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <masahiroy@kernel.org> writes:
> On Tue, Nov 21, 2023 at 6:55=E2=80=AFPM Aneesh Kumar K.V
> <aneesh.kumar@kernel.org> wrote:
>>
>> "Nicholas Piggin" <npiggin@gmail.com> writes:
>>
>> > On Tue Nov 21, 2023 at 9:23 AM AEST, Masahiro Yamada wrote:
>> >> crtsavres.o is linked to modules. However, as explained in commit
>> >> d0e628cd817f ("kbuild: doc: clarify the difference between extra-y
>> >> and always-y"), 'make modules' does not build extra-y.
>> >>
>> >> For example, the following command fails:
>> >>
>> >>   $ make ARCH=3Dpowerpc LLVM=3D1 KBUILD_MODPOST_WARN=3D1 mrproper ps3=
_defconfig modules
>> >>     [snip]
>> >>     LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
>> >>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such fi=
le or directory
>> >>   make[3]: *** [scripts/Makefile.modfinal:56: arch/powerpc/platforms/=
cell/spufs/spufs.ko] Error 1
>> >>   make[2]: *** [Makefile:1844: modules] Error 2
>> >>   make[1]: *** [/home/masahiro/workspace/linux-kbuild/Makefile:350: _=
_build_one_by_one] Error 2
>> >>   make: *** [Makefile:234: __sub-make] Error 2
>> >>
>> >
>> > Thanks. Is this the correct Fixes tag?
>> >
>> > Fixes: d0e628cd817f ("powerpc/64: Do not link crtsavres.o in vmlinux")
>> >
>>
>> I am finding a different commit ID:
>>
>> commit baa25b571a168aff5a13bfdc973f1229e2b12b63
>> Author: Nicholas Piggin <npiggin@gmail.com>
>> Date:   Fri May 12 01:56:49 2017 +1000
>>
>>     powerpc/64: Do not link crtsavres.o in vmlinux
>>
>>     The 64-bit linker creates save/restore functions on demand with final
>>     links, so vmlinux does not require crtsavres.o.
>
> Yeah, I think the correct tag is:
>
> Fixes: baa25b571a16 ("powerpc/64: Do not link crtsavres.o in vmlinux")

Yep, I used that when applying.

cheers
