Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E35DB5A1CC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 00:52:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDJBr6W9Sz3c79
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 08:52:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OuII/6zh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDJBC16zTz2xHC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 08:52:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OuII/6zh;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MDJB75nWmz4x1N;
	Fri, 26 Aug 2022 08:51:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1661467920;
	bh=QzUqfZa0fF0JU5NNb8XHyYrURc4kns7FREDr0t9N9RQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OuII/6zhB03t1wPs832ZkI3lcWzdiIItZjGhSLzkzJUP6iCub2TDgLLw6zyaSU1LL
	 R9CKaFW1D8hwbQSLlAL0VzYUFjedsaDAFHvIueylf4Z7PeWh+5B6XKgWUAjxyZ6zn9
	 1nF9yTtv3VkSqO90eWNXcCnpkDNqX8f4v3GuRzPp+5Uj1hAATTXWVSMKkXL1G7owKk
	 g8hcb2wANfp3nqk8x0dsJwHnVlwlzjI+8YOfFYstdh4reXKyWTvI2IAeY+E6zrZuvi
	 Hcf20vWe+CfT1tiItcCVkuWbl2+PvpJrgNk80SuHpsZQfC0TGGb56w6l/QKrf2/ih9
	 Iq4RLS+LHqpEw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] powerpc: align syscall table for ppc32
In-Reply-To: <CAK7LNAQ8ZQHYzoJTPxiRYBsdVXdYUt=bxyrag-d7UnwQ9r7q=w@mail.gmail.com>
References: <20220820165129.1147589-1-masahiroy@kernel.org>
 <874jy0lpy9.fsf@mpe.ellerman.id.au>
 <CAK7LNAQ8ZQHYzoJTPxiRYBsdVXdYUt=bxyrag-d7UnwQ9r7q=w@mail.gmail.com>
Date: Fri, 26 Aug 2022 08:51:55 +1000
Message-ID: <87wnawj5ro.fsf@mpe.ellerman.id.au>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <masahiroy@kernel.org> writes:
> On Thu, Aug 25, 2022 at 4:53 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Masahiro Yamada <masahiroy@kernel.org> writes:
>> > Christophe Leroy reported that commit 7b4537199a4a ("kbuild: link
>> > symbol CRCs at final link,  removing CONFIG_MODULE_REL_CRCS") broke
>> > mpc85xx_defconfig + CONFIG_RELOCATABLE=y.
>> >
>> >     LD      vmlinux
>> >     SYSMAP  System.map
>> >     SORTTAB vmlinux
>> >     CHKREL  vmlinux
>> >   WARNING: 451 bad relocations
>> >   c0b312a9 R_PPC_UADDR32     .head.text-0x3ff9ed54
>> >   c0b312ad R_PPC_UADDR32     .head.text-0x3ffac224
>> >   c0b312b1 R_PPC_UADDR32     .head.text-0x3ffb09f4
>> >   c0b312b5 R_PPC_UADDR32     .head.text-0x3fe184dc
>> >   c0b312b9 R_PPC_UADDR32     .head.text-0x3fe183a8
>> >       ...
>> >
>> > The compiler emits a bunch of R_PPC_UADDR32, which is not supported by
>> > arch/powerpc/kernel/reloc_32.S.
>> >
>> > The reason is there exists an unaligned symbol.
>> >
>> >   $ powerpc-linux-gnu-nm -n vmlinux
>> >     ...
>> >   c0b31258 d spe_aligninfo
>> >   c0b31298 d __func__.0
>> >   c0b312a9 D sys_call_table
>> >   c0b319b8 d __func__.0
>> >
>> > Commit 7b4537199a4a is not the root cause. Even before that, I can
>> > reproduce the same issue for mpc85xx_defconfig + CONFIG_RELOCATABLE=y
>> > + CONFIG_MODVERSIONS=n.
>> >
>> > It is just that nobody did not notice it because when CONFIG_MODVERSIONS
>
> I wrote weird English (double negation)
>
> nobody did not notice   --> nobody noticed
>
> Please fix it if you have not yet.

Yeah I did fix it up when applying :)

  It is just that nobody noticed because when CONFIG_MODVERSIONS is
  enabled, a __crc_* symbol inserted before sys_call_table was hiding the
  unalignment issue.

cheers
