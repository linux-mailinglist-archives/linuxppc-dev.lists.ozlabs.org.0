Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B64EF5B1116
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 02:28:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNKhz31Jwz3c3m
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 10:28:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IXhfa81v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNKhJ6ydfz2y8J
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 10:27:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IXhfa81v;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MNKhC0m8Vz4xGG;
	Thu,  8 Sep 2022 10:27:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662596844;
	bh=5ove+5VwWAQ5AMLZQbbF24PafDZgzxX6ZGM0226lFkY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IXhfa81v7lWARgyj9MztAPbvgQz9Pn3u0Xdy4UYJ0UAU66a4cUX91jR/A5/cdLCBn
	 sVOv/0cFvrcQ5XCgp2qktd6GFd33ErdPhcvYV3iKnKtfRpujukJR5lgZMIp0+cGijU
	 8sU1F3/JcsvjEb/GPH7kNqsGsSxoDYIkD2feul2+5dgorxPliCDlyLKAOVSoM+RENw
	 pfRtYJr6gO2z7mPT7TUWrchJ9vQe+y07ew6kVNG6MPlJlboc9yYME8QVGZn4p3KHkw
	 FSBoZ7ujJj1ry7YldiAbw2vrIoKu/TZWuP6z9p7OlNUHXhGp53H1ZhJyeEOBzph9oM
	 uLOwn13/NEl1g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Mathieu Malaterre
 <malat@debian.org>, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] powerpc/lib/xor_vmx: Relax frame size for clang
In-Reply-To: <7cb1285a-42e6-2b67-664f-7d206bc9fd80@csgroup.eu>
References: <20190621085822.1527-1-malat@debian.org>
 <7cb1285a-42e6-2b67-664f-7d206bc9fd80@csgroup.eu>
Date: Thu, 08 Sep 2022 10:27:19 +1000
Message-ID: <87v8pyemmw.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 21/06/2019 =C3=A0 10:58, Mathieu Malaterre a =C3=A9crit=C2=A0:
>> When building with clang-8 the frame size limit is hit:
>>=20
>>    ../arch/powerpc/lib/xor_vmx.c:119:6: error: stack frame size of 1200 =
bytes in function '__xor_altivec_5' [-Werror,-Wframe-larger-than=3D]
>>=20
>> Follow the same approach as commit 9c87156cce5a ("powerpc/xmon: Relax
>> frame size for clang") until a proper fix is implemented upstream in
>> clang and relax requirement for clang.
>
> With Clang 14 I get the following errors, but only with KASAN selected.
>
>    CC      arch/powerpc/lib/xor_vmx.o
> arch/powerpc/lib/xor_vmx.c:95:6: error: stack frame size (1040) exceeds=20
> limit (1024) in '__xor_altivec_4' [-Werror,-Wframe-larger-than]
> void __xor_altivec_4(unsigned long bytes,
>       ^
> arch/powerpc/lib/xor_vmx.c:124:6: error: stack frame size (1312) exceeds=
=20
> limit (1024) in '__xor_altivec_5' [-Werror,-Wframe-larger-than]
> void __xor_altivec_5(unsigned long bytes,
>       ^

That's a 32-bit build?

> Is this patch still relevant ?

The clang issue was closed because a different change fixed the issue:

  https://github.com/ClangBuiltLinux/linux/issues/563

> Or should frame size be relaxed when KASAN is selected ? After all the=20
> stack size is multiplied by 2 when we have KASAN, so maybe the warning=20
> limit should be increased as well ?

Yeah that would make some sense.

On 64-bit the largest frame in that file is 1424, which is below the
default 2048 byte limit.

So maybe just increase it for 32-bit && KASAN.

What would be nice is if the FRAME_WARN value could be calculated as a
percentage of the THREAD_SHIFT, but that's not easily doable with the
way things are structured in Kconfig.

cheers
