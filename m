Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3A6724768
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 17:17:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbDbj5PYWz3f04
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 01:17:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=k+vHbMO0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=pinskia@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=k+vHbMO0;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbDZr3dTKz3cD5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 01:16:19 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2565a896d07so2756557a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 08:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686064576; x=1688656576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/U+Ir10TGo+FRDrkNKeDyfsxj4MHF2AjGsKRO5a6iw=;
        b=k+vHbMO0x9r5nFFW3cGiEtLVY+avVzey1xjXlHNmKgHLMZ+X9nA+eZVwjr/VAv0PAO
         TMc3bNNHTTRTbROJGsaGlAdi4/vCSr7h+tEBxPhb1Ful8PxK/fuOQLPsD9WTliLnVsNA
         Va8HXQSGndNZ5S1Mv1w8XWFW79bY46Qv9kGEodwHmw89Xbg7dXJIxDi7Vb7LR+PJLGHO
         W9wldRrkGZSIDQuCRv3DLV3UgcNwwMhqc+78aiBfWWCcaqSlLzFGBLEGEfxecwx7/AAQ
         3kB9doPp+eGOcIyf24o4xDL44+3jBSRP217vzbJr9lwK0qlkq7GbvTskx3hzvcdFIf+3
         IYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686064576; x=1688656576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/U+Ir10TGo+FRDrkNKeDyfsxj4MHF2AjGsKRO5a6iw=;
        b=YzivwMmvWcBY8u7T2Aeonzonuhay5xq46aqPTqIcXgHJNeJNUz2cmJecG8t5MOD0YE
         rfh6ktZ3nykg9BZ66+wRfh36M8Y2zvlUfURQntI3xXCd4DAbSVwtzyTyMeuNBmqV5MhT
         fBVYSVkHHROL9bf+XFVqLTqzT5BZND+SB0QpbWtf7YG8NNXGSt3xXwCs6hnNyUgApyEU
         hzWMnwo4z3x6h9VOOdcXrdj78zymcEccZbztorFwtj053s8a6kxNaBLp/y7On5PV4Mgi
         DLg8tCcCdqsfU9CkAbbrRkIb1H8x69NIeuA4z+cmDAQbjaU/I7XWPkiPBm4qcgdemSaf
         vPhA==
X-Gm-Message-State: AC+VfDzSKIJcuaTAWTImldYiG6/jn7o8UkZfwgBCRf91cPbftKRnWfze
	MIaxZTGlR5lUgO5UGQP08zRYXn6AuLPE9BpuwCE=
X-Google-Smtp-Source: ACHHUZ6rFRjp5lc97f7xHtSAY09tlQIMG/3u4xxbGGz1jSL9FsMMW2l89cSpHShnWwjRadGlTGZlIM2cwFIsCQJnUJM=
X-Received: by 2002:a17:90b:11d1:b0:259:548b:d394 with SMTP id
 gv17-20020a17090b11d100b00259548bd394mr1243799pjb.28.1686064576444; Tue, 06
 Jun 2023 08:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220524093828.505575-1-npiggin@gmail.com> <CAGfacvTu_8tZnndLqbRJeU4UJrnq+tCchiZyFFqOE-hXM0=wCA@mail.gmail.com>
 <CA+=Sn1=gt-nf4T3vfWDKQLRNKkuBXh98nLbTtiCGDSPhMxyRiQ@mail.gmail.com> <CAGfacvQ84ZexaH3Wgdz-vL3Y2MkKEtqqMg_jOZ15++rhNvZuXA@mail.gmail.com>
In-Reply-To: <CAGfacvQ84ZexaH3Wgdz-vL3Y2MkKEtqqMg_jOZ15++rhNvZuXA@mail.gmail.com>
From: Andrew Pinski <pinskia@gmail.com>
Date: Tue, 6 Jun 2023 08:16:05 -0700
Message-ID: <CA+=Sn1mZ5VfFQ88T=S2LYV=gKEd_PbnFChsHkdojUhWXwRONqA@mail.gmail.com>
Subject: Re: Passing the complex args in the GPR's
To: Umesh Kalappa <umesh.kalappa0@gmail.com>
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org, Nicholas Piggin <npiggin@gmail.com>, Paul E Murphy <murphyp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 6, 2023 at 8:05=E2=80=AFAM Umesh Kalappa <umesh.kalappa0@gmail.=
com> wrote:
>
> Hi Adnrew,
> Thank you for the quick response and for PPC64 too ,we do have
> mismatches in ABI b/w complex operations like
> https://godbolt.org/z/bjsYovx4c .
>
> Any reason why GCC chose to use GPR 's here ?

Yes because it was set before 2003. There could not be an ABI break.
r0-50273-gded9bf77e35ce9a2246 fixed GCC for the AIX ABI though.

>
> ~Umesh
>
> On Tue, Jun 6, 2023 at 8:28=E2=80=AFPM Andrew Pinski <pinskia@gmail.com> =
wrote:
> >
> > On Tue, Jun 6, 2023 at 7:50=E2=80=AFAM Umesh Kalappa via Libc-alpha
> > <libc-alpha@sourceware.org> wrote:
> > >
> > > Hi all ,
> > >
> > > For the test case https://godbolt.org/z/vjs1vfs5W ,we see the mismatc=
h
> > > in the ABI b/w gcc and clang .
> > >
> > > Do we have any supporting documents that second the GCC behaviour ove=
r CLANG ?
> > >
> > > EABI states like
> > >
> > > In the Power Architecture 64-Bit ELF V2 ABI Specification document
> > > (v1.1 from 16 July 2015)
> >
> > You are looking at the wrong ABI document.
> > That is for the 64bit ABI.
> > The 32bit ABI document is located at:
> > http://refspecs.linux-foundation.org/elf/elfspec_ppc.pdf
> >
> > Plus the 32bit ABI document does not document Complex argument passing
> > as it was written in 1995 and never updated.
> >
> > https://www.nxp.com/docs/en/reference-manual/E500ABIUG.pdf does not
> > document it either.
> >
> > Thanks,
> > Andrew Pinski
> >
> > >
> > > Page 53:
> > >
> > > Map complex floating-point and complex integer types as if the
> > > argument was specified as separate real
> > > and imaginary parts.
> > >
> > > and in this case the double complexes are broken down with double rea=
l
> > > and double img and expected to pass in FPR not the GPR.
> > >
> > >
> > >
> > > Thank you
> > > ~Umesh
