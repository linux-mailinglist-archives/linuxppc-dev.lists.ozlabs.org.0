Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A23C49FA5A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 14:07:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jld6f5V5Nz3c7f
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 00:07:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cNBEtVx5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2a;
 helo=mail-yb1-xb2a.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cNBEtVx5; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jld5x6dnZz2xsq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 00:07:15 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id g14so18227386ybs.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 05:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YgGxwqesxYhk+GrHgJnKwpv75Cf0zbWqGe6zVs0QN+M=;
 b=cNBEtVx5FT1+KykCzEe9T2FFs9AIQBumaxy53+2enGDqLWGuhatShrWWnhC49Jy9xw
 VmTHspZqGebuddH4NHpFewL2UtFVBpApT3VtMcKLUIBuB/WhObXIS47vBZw4v3RpZ/HM
 q5of2qbhTXbKMMRrGBrJEwq9vP20jD9Q+OBNWFLYgvH+Bm4JCrCO2xlDtTR217dtey2i
 kuaKb7v1zs6oPJeRtzhyGmy3hR+bFGpG3lR36aJXckQNlP4uqZRLDN0mhpFpZCE81jEg
 ImcsFQXJCnKDW4AzBbhzX+Ajy1vnY2eqn+d9RADdGcZGQHfk43bOCwvVKr3QM2jXvMGF
 yH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YgGxwqesxYhk+GrHgJnKwpv75Cf0zbWqGe6zVs0QN+M=;
 b=vTKTj/NAeJaV624DuTgA59kHLN8BLo5tQLeJp93+Hw/lDH4SlwD6tYN4mN7BsHeKwl
 L9HMzfEbkbnyCMrBQ1H5ES0979VHaan02JvvDRXwztCxQLU2z3ZgJkE9bmq3q5uDAuEB
 UxDkT6J1yM5NDVDxqFFCKxImikIx3qzCPmgriuBgK2BotyPY3KNMBCpYxh2wILkrX8g4
 niMktALLJBQsaWcxkq7KJ1XoJwwycEfgmg5DBJPRA4v5lBkNIc8uN88vVgUFrU/R4Nbx
 bZflCpr20iQovJrlzDrVJ/OZGsVxIHjrf4yEORs2sIzQgTJZGciTbztuv6jQ6uX9oxA5
 Pq6w==
X-Gm-Message-State: AOAM532Hp6NJp5/85sMX43I4ljuAeZT+zfYTVSY4zM7UDIhSpbINv8DB
 LIkl/ceEzxGghnARwG0vtDnw4gSTo+uCmUinSoBkhg==
X-Google-Smtp-Source: ABdhPJzb57UArYumAtcFeFp1C6yIxpu8it15t9WtSxwl45jhC2s8WeqrPkgaWoXnmz9TXVUA2MkZKhDWx0uFxL1ECgM=
X-Received: by 2002:a25:bb4d:: with SMTP id b13mr12751188ybk.129.1643375230778; 
 Fri, 28 Jan 2022 05:07:10 -0800 (PST)
MIME-Version: 1.0
References: <20220128100815.3231551-1-anders.roxell@linaro.org>
 <c6beb8a8-ecf3-1c17-f685-f5e69cd6265a@csgroup.eu>
In-Reply-To: <c6beb8a8-ecf3-1c17-f685-f5e69cd6265a@csgroup.eu>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Fri, 28 Jan 2022 14:07:00 +0100
Message-ID: <CADYN=9L=RB2AoBNU6Cfy2UKyznJy+oo0aPvapHp-v1f12uVs-A@mail.gmail.com>
Subject: Re: [PATCHv2] powerpc: mm: radix_tlb: rearrange the if-else block
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 28 Jan 2022 at 11:14, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 28/01/2022 =C3=A0 11:08, Anders Roxell a =C3=A9crit :
> > Clang warns:
> >
> > arch/powerpc/mm/book3s64/radix_tlb.c:1191:23: error: variable 'hstart' =
is uninitialized when used here [-Werror,-Wuninitialized]
> >                                  __tlbiel_va_range(hstart, hend, pid,
> >                                                    ^~~~~~
> > arch/powerpc/mm/book3s64/radix_tlb.c:1175:23: note: initialize the vari=
able 'hstart' to silence this warning
> >                  unsigned long hstart, hend;
> >                                      ^
> >                                       =3D 0
> > arch/powerpc/mm/book3s64/radix_tlb.c:1191:31: error: variable 'hend' is=
 uninitialized when used here [-Werror,-Wuninitialized]
> >                                  __tlbiel_va_range(hstart, hend, pid,
> >                                                            ^~~~
> > arch/powerpc/mm/book3s64/radix_tlb.c:1175:29: note: initialize the vari=
able 'hend' to silence this warning
> >                  unsigned long hstart, hend;
> >                                            ^
> >                                             =3D 0
> > 2 errors generated.
> >
> > Rework the 'if (IS_ENABLE(CONFIG_TRANSPARENT_HUGEPAGE))' so hstart/hend
> > always gets initialized, this will silence the warnings. That will also
> > simplify the 'else' path. Clang is getting confused with these warnings=
,
> > but the warnings is a false-positive.
> >
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Suggested-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
> >   arch/powerpc/mm/book3s64/radix_tlb.c | 9 +++------
> >   1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/boo=
k3s64/radix_tlb.c
> > index 7724af19ed7e..7d65965a0688 100644
> > --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> > +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> > @@ -1174,12 +1174,9 @@ static inline void __radix__flush_tlb_range(stru=
ct mm_struct *mm,
> >               bool hflush =3D false;
>
> You should then remove the default initialisation of hflush to false
> which has become pointless.
>
> With that fixed,
>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thank you for the review.
I will send a v3 shortly with that fixed.

Cheers,
Anders
