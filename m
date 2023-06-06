Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB04724E42
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 22:41:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbMnr3G7dz3fdk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 06:41:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rFb7mDt7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=umesh.kalappa0@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rFb7mDt7;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbDLX6Mjtz3bkn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 01:05:38 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5149429c944so9518140a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 08:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686063935; x=1688655935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X703EAUE0dT3jCdU0w/NHCbRg7Eui+oLA87Q0QiNbeQ=;
        b=rFb7mDt7FxMNgKrbLclsK4JNMzxg1A0FFAgpPA7llAnXuvs4a8TkhRWRPrR5jKo2f3
         ktXvPPG/jU/aSx84TKwrpJthBidHudUyWxTMHdUwa1j22SdPfmTsjy/XOWDHjOkWh8Sx
         OyZCnBppkuhhYY7FqEqXZXtT51KWfRuB2fHi1Dec2ClxhZ8a2a2IXLTxDzpdwfBT0mKw
         cthvqQJiGJ3w7/PxLVojSbFgKhv5bEiPSiLsN8ZTbHaoTGX4KYV8CVKtx1vQvubxOIPY
         kYeqFE23rLCx9GlCCeSlGTQqjw/EsJ9ZMeTUomA/LJFlGe6F7EVVRdmUa9oBmGu6yAkB
         4JnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686063935; x=1688655935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X703EAUE0dT3jCdU0w/NHCbRg7Eui+oLA87Q0QiNbeQ=;
        b=Itt0nu7rdQWQNlOXzxwMS9EO6oKJlWbjfuKuEQ4Y+rvgI8twBwc50JQKwErD6F7NP3
         aTryp/M+ghAZMY0rLamz6X3h/Rj6y4lHi3D7qaLKzS8sPbiqlNN0sEhtXVD9phs3HSGu
         8CBymo91v1pKBloCLWn0cSyHlYk6EwEFfPlcwtRTgpaX0tWg8Q4VMVBmvtdtIghLKpx5
         EmyprjAWQzUnNTS9N8t8Fe9jixufRJ1bDAp4HgSg79r2btZwFTJXbcCBrJk0hTMXMtdp
         b8DP/qEDdShCgpY6wxuwSzncmhLjqbNQTj+XVkuxDwEIxQDaWexlQQgBdYQXFEIwnzVf
         rxZg==
X-Gm-Message-State: AC+VfDz9CAP1pDCgokZbSZCzVdPNtPjtvgWEI2Z59Dkm5Uql6OQiR+Qd
	v5vbdvYGjap2+WCygK3GiOsW/tZcLjurU8nce3g=
X-Google-Smtp-Source: ACHHUZ5FtagZetoLJ45NxobQ3kNf+3WfWp3T4qBpfYI3kQswhbPEFpRb4e6I8s3ZP1+09vwBPQYLPTffy0V9e5cLfEI=
X-Received: by 2002:a17:907:6e13:b0:974:e767:e1e7 with SMTP id
 sd19-20020a1709076e1300b00974e767e1e7mr2546800ejc.28.1686063934399; Tue, 06
 Jun 2023 08:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220524093828.505575-1-npiggin@gmail.com> <CAGfacvTu_8tZnndLqbRJeU4UJrnq+tCchiZyFFqOE-hXM0=wCA@mail.gmail.com>
 <CA+=Sn1=gt-nf4T3vfWDKQLRNKkuBXh98nLbTtiCGDSPhMxyRiQ@mail.gmail.com>
In-Reply-To: <CA+=Sn1=gt-nf4T3vfWDKQLRNKkuBXh98nLbTtiCGDSPhMxyRiQ@mail.gmail.com>
From: Umesh Kalappa <umesh.kalappa0@gmail.com>
Date: Tue, 6 Jun 2023 20:35:22 +0530
Message-ID: <CAGfacvQ84ZexaH3Wgdz-vL3Y2MkKEtqqMg_jOZ15++rhNvZuXA@mail.gmail.com>
Subject: Re: Passing the complex args in the GPR's
To: Andrew Pinski <pinskia@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 07 Jun 2023 06:39:51 +1000
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org, Nicholas Piggin <npiggin@gmail.com>, Paul E Murphy <murphyp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Adnrew,
Thank you for the quick response and for PPC64 too ,we do have
mismatches in ABI b/w complex operations like
https://godbolt.org/z/bjsYovx4c .

Any reason why GCC chose to use GPR 's here ?

~Umesh

On Tue, Jun 6, 2023 at 8:28=E2=80=AFPM Andrew Pinski <pinskia@gmail.com> wr=
ote:
>
> On Tue, Jun 6, 2023 at 7:50=E2=80=AFAM Umesh Kalappa via Libc-alpha
> <libc-alpha@sourceware.org> wrote:
> >
> > Hi all ,
> >
> > For the test case https://godbolt.org/z/vjs1vfs5W ,we see the mismatch
> > in the ABI b/w gcc and clang .
> >
> > Do we have any supporting documents that second the GCC behaviour over =
CLANG ?
> >
> > EABI states like
> >
> > In the Power Architecture 64-Bit ELF V2 ABI Specification document
> > (v1.1 from 16 July 2015)
>
> You are looking at the wrong ABI document.
> That is for the 64bit ABI.
> The 32bit ABI document is located at:
> http://refspecs.linux-foundation.org/elf/elfspec_ppc.pdf
>
> Plus the 32bit ABI document does not document Complex argument passing
> as it was written in 1995 and never updated.
>
> https://www.nxp.com/docs/en/reference-manual/E500ABIUG.pdf does not
> document it either.
>
> Thanks,
> Andrew Pinski
>
> >
> > Page 53:
> >
> > Map complex floating-point and complex integer types as if the
> > argument was specified as separate real
> > and imaginary parts.
> >
> > and in this case the double complexes are broken down with double real
> > and double img and expected to pass in FPR not the GPR.
> >
> >
> >
> > Thank you
> > ~Umesh
