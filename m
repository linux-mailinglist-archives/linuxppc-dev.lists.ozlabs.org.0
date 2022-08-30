Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CE65A60FD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 12:44:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MH3pS58Pkz3c5D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 20:44:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fVf/5xnC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MH3ns4L9qz3bcc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 20:44:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fVf/5xnC;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MH3nr5wnlz4xG6;
	Tue, 30 Aug 2022 20:44:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1661856241;
	bh=7FFszpKAwHkUcxfIIXTrsjmWHYTLLEAcEncl3AbzgmY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fVf/5xnChhmP5DNHOSS9QSyyCN2N3VX7gGKy3eglqlHvJuahftMSqb1BlXSI9rrDX
	 6DP3LrXiQXRsB05renWOiocFqYxY6u+JvWhyAgxQMcFdeoBKSj2pDJ+7uM2dZbBiRO
	 SrkQFagFwarD+ForSxKLf234yS6ScXJQQJjah00n8cFUjgFncZ8ZfzWyst8FL6Uwon
	 F9NbMQUnA6MHgi+jMKkSDYjde0gnDgZSLiCKDJu/LsUAp8pPtme9dzAmdrmmWMcbeY
	 zfH3AaHP1JvZm+QsJljRKHTVELGAUWcEsC1jQOE0VRBTjrt3dkJIityRWZ2OMwN3e4
	 Ybf3KFKj11ciw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Masahiro Yamada
 <masahiroy@kernel.org>
Subject: Re: [PATCH] powerpc: clean up binutils version check
In-Reply-To: <7daf34ca-ed5e-90ea-8ccc-6821127cbd96@csgroup.eu>
References: <20220827164056.3365356-1-masahiroy@kernel.org>
 <58a90319-668f-7c87-4168-e0df10644aa7@csgroup.eu>
 <CAK7LNATJiQc5HMdsct1S5z15-b1fzc5-Y2xtBs6oT17Na79H_w@mail.gmail.com>
 <7daf34ca-ed5e-90ea-8ccc-6821127cbd96@csgroup.eu>
Date: Tue, 30 Aug 2022 20:43:56 +1000
Message-ID: <87o7w2j9jn.fsf@mpe.ellerman.id.au>
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
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 27/08/2022 =C3=A0 20:03, Masahiro Yamada a =C3=A9crit=C2=A0:
>> On Sun, Aug 28, 2022 at 2:37 AM Christophe Leroy
>> <christophe.leroy@csgroup.eu> wrote:
>>> Le 27/08/2022 =C3=A0 18:40, Masahiro Yamada a =C3=A9crit :
>>>> The checkbin in arch/powerpc/Makefile errors out if ld <=3D 2.24.
>>>> So, the requirement on PPC is binutils >=3D 2.25. It is cleaner to
>>>> specify it in scripts/min-tool-version.sh. If binutils < 2.25 is
>>>> used, the toolchain check will fail in the Kconfig stage going
>>>> forward.
>>>>
>>>> Since binutils >=3D 2.25 is already required, another version test
>>>> for --save-restore-funcs on PPC64 is always met.
...
>>>> diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
>>>> index 250925aab101..7df9f2150ea1 100755
>>>> --- a/scripts/min-tool-version.sh
>>>> +++ b/scripts/min-tool-version.sh
>>>> @@ -14,7 +14,13 @@ fi
>>>>
>>>>    case "$1" in
>>>>    binutils)
>>>> -     echo 2.23.0
>>>> +     if [ "$SRCARCH" =3D powerpc ]; then
>>>
>>> Isn't this limitation only for ppc64le ?
>>>
>>> Refer commit 60e065f70bdb ("powerpc: Reject binutils 2.24 when building
>>> little endian")
>>=20
>> I do not see any CONFIG check in the current checkbin.
>>=20
>> Refer commit a3ad84da0760 ("powerpc/toc: Future proof
>> kernel toc")
>
> That's odd. There is no toc on PPC32.

I think that's just a bug in a3ad84da0760.

But that means we inadvertantly dropped support for 2.24 about 8 months
ago, and no one noticed.

Let's see what the responses are to Nick's proposal to increase the
minimum to 2.25.1.

cheers
