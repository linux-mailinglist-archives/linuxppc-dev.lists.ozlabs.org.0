Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2982F4D5970
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 05:16:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFCLJ0nGpz2xTq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 15:16:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=i9UqldKK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFCKb0mfHz2yMy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 15:16:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=i9UqldKK; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KFCKY3zHjz4xbG;
 Fri, 11 Mar 2022 15:16:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1646972162;
 bh=aWuv/cB2IRk/pSpG8sU4nbvCzp3/Ix7ZV08F5OtN0eU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=i9UqldKKsJpUVZvfHbkXYq6awpvN5Ap6TjGO/igs37yYKbQDoRTw0zBa0t6e+eBGZ
 Ti5RhXN0X6ngbJodkwVd5SsGfg9Sb0+mV7/WmO6G/fynhEodhGhicoDEKBF6Iar46j
 P+/7siGGDClvmmHt1sws/1v/Elg3dX8QTxXblz2JiBBoA4MxDUHEOFUYIS0BXFp44f
 5DTkcPpGrnLeXxFJlq+i9n34MfHhlxyTbXO7LayrXuueToBq0L0mskeCNyQx7VDUP8
 aR5stvRDHwRay7QN1XbZY/+CNs46DPlK8ES167w5A6FZgdL7R0vj+UTkEbPOsj12Wz
 F7jnEIf+6Hsug==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>, Alexey
 Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH] powerpc: Replace ppc64 DT_RELACOUNT usage with
 DT_RELASZ/24
In-Reply-To: <CAFP8O3+jJf=amTYjm6YQbJKAuK0XRNoG3Gwc6C+E0=CPd46ZAw@mail.gmail.com>
References: <20220309055118.1551013-1-maskray@google.com>
 <CAKwvOdmMS4=QAoBFvhAdXWaLHOwH2252FX9i_yZyiCOpOt=3Dw@mail.gmail.com>
 <CAFP8O3+jJf=amTYjm6YQbJKAuK0XRNoG3Gwc6C+E0=CPd46ZAw@mail.gmail.com>
Date: Fri, 11 Mar 2022 15:15:59 +1100
Message-ID: <87a6dxm8e8.fsf@mpe.ellerman.id.au>
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
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

F=C4=81ng-ru=C3=AC S=C3=B2ng <maskray@google.com> writes:
> On Thu, Mar 10, 2022 at 11:48 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>>
>> On Tue, Mar 8, 2022 at 9:53 PM Fangrui Song <maskray@google.com> wrote:
>> >
>> > DT_RELACOUNT is an ELF dynamic tag inherited from SunOS indicating the
>> > number of R_*_RELATIVE relocations. It is optional but {ld.lld,ld.lld}
>> > -z combreloc always creates it (if non-zero) to slightly speed up glibc
>> > ld.so relocation resolving by avoiding R_*R_PPC64_RELATIVE type
>> > comparison. The tag is otherwise nearly unused in the wild and I'd
>> > recommend that software avoids using it.
>> >
>> > lld>=3D14.0.0 (since commit da0e5b885b25cf4ded0fa89b965dc6979ac02ca9)
>> > underestimates DT_RELACOUNT for ppc64 when position-independent long
>> > branch thunks are used. Correcting it needs non-trivial arch-specific
>> > complexity which I'd prefer to avoid. Since our code always compares t=
he
>> > relocation type with R_PPC64_RELATIVE, replacing every occurrence of
>> > DT_RELACOUNT with DT_RELASZ/sizeof(Elf64_Rela)=3DDT_RELASZ/24 is a cor=
rect
>> > alternative.
>>
>> checking that sizeof(Elf64_Rela) =3D=3D 24, yep: https://godbolt.org/z/b=
b4aKbo5T
>>
>> >
>> > DT_RELASZ is in practice bounded by an uint32_t. Dividing x by 24 can =
be
>> > implemented as (uint32_t)(x*0xaaaaaaab) >> 4.
>>
>> Yep: https://godbolt.org/z/x9445ePPv
>>
>> >
>> > Link: https://github.com/ClangBuiltLinux/linux/issues/1581
>> > Reported-by: Nathan Chancellor <nathan@kernel.org>
>> > Signed-off-by: Fangrui Song <maskray@google.com>
>> > ---
>> >  arch/powerpc/boot/crt0.S       | 28 +++++++++++++++++-----------
>> >  arch/powerpc/kernel/reloc_64.S | 15 +++++++++------
>> >  2 files changed, 26 insertions(+), 17 deletions(-)
...

> I rebased the patch on
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> master and got a conflict.
> Seems that https://lore.kernel.org/linuxppc-dev/20220309061822.168173-1-a=
ik@ozlabs.ru/T/#u
> ("[PATCH kernel v4] powerpc/64: Add UADDR64 relocation support") fixed
> the issue.
> It just doesn't change arch/powerpc/boot/crt0.S

Yeah sorry, I applied Alexey's v4 just before I saw your patch arrive on
the list.

If one of you can rework this so it applies on top that would be great :)

cheers
