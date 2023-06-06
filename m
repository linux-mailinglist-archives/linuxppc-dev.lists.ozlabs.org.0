Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 422A0724E44
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 22:42:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbMpl0VmWz3fhc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 06:42:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NkF8A4gH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=umesh.kalappa0@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NkF8A4gH;
	dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbH3H0FwTz3cDT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 03:07:37 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-970056276acso952076666b.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 10:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686071251; x=1688663251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDsdZnfcxD0GJ2AGUB4yh+w8dDCgzaxM4/KyM3Qr3JY=;
        b=NkF8A4gHV8SPk0tvvrPsDIKPD13E1OKbpo0dhwA1i1zR+NFgLZhsT7h3VCB3UfB9bC
         GAoeGD0oszqra/xc0JhzPyTJ35Gt0JpKe5MADdDfagMCoYPEbqCYsDBENRHYdD8B1cM+
         2LLZCX/tkFOlatXUg5l/N4BatMkTsyayPk7i+iPfkFgaK1TLlSgEEwm0huXtOXyYZ8/j
         Zt72e6EgVDEi1Fqo6G4Z8JM3cSPlmIzUQdSb1/6N/lRg9wMyyP9rMX6+8qGXfFt0CASA
         TU3NhuCGlkgUm8X4ol1GYZPmgysCK7L88q5J5q/NcLJHYim3C9+ysJeyF+wuYLCOKjgL
         Pd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686071251; x=1688663251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDsdZnfcxD0GJ2AGUB4yh+w8dDCgzaxM4/KyM3Qr3JY=;
        b=CF5VdHZXEYAMnxK+Nwz4pQxDEEVBcRcFZ5xgjnevG9gaHkJghHkkCL0CUsTeDF/F/d
         a6TOCHk4EPWXU39gfxWoo2gUPx94Meqn6sc7AikoZ88iaUjsGXe5fudJ9VxSZS6qBEEW
         xZWkJ64JAAfknhRX5eKwLMSHZWcGHYHokyCQmya0/otZ49W0VR/rfaH1jC/OAKU/KUHS
         liYVK9NeF6eCJlABFqE/j/ZaWUr4UXaKcI7qPQpgvWJEx27217oaWLX39roq1tqvkYBZ
         e6Vn5SHh1Xzzeuj7kvj46U0NA5jUrp7Fb387nEc9gsoB93EmRW4roMLBxHyDjdnNwecY
         D2iA==
X-Gm-Message-State: AC+VfDxFWELbRsduxJadFPVEdBzwxLv4G45zg548ozAHI+9JGG9TaCYa
	E0+rw8jywRMtYd7lFdGnw81dt/oYBvNsfchJw1U=
X-Google-Smtp-Source: ACHHUZ5fSETSjs9fUnEL1//HUKtsp2MSES6GFTxI5lyG11t/dcaswODwHar3gZ7NKwdJeJKIdZUbgy3amGEUbJYnmMs=
X-Received: by 2002:a17:907:2d8f:b0:94d:69e0:6098 with SMTP id
 gt15-20020a1709072d8f00b0094d69e06098mr3502764ejc.45.1686071250801; Tue, 06
 Jun 2023 10:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220524093828.505575-1-npiggin@gmail.com> <CAGfacvTu_8tZnndLqbRJeU4UJrnq+tCchiZyFFqOE-hXM0=wCA@mail.gmail.com>
 <CA+=Sn1=gt-nf4T3vfWDKQLRNKkuBXh98nLbTtiCGDSPhMxyRiQ@mail.gmail.com>
 <CAGfacvQ84ZexaH3Wgdz-vL3Y2MkKEtqqMg_jOZ15++rhNvZuXA@mail.gmail.com> <20230606164256.GQ19790@gate.crashing.org>
In-Reply-To: <20230606164256.GQ19790@gate.crashing.org>
From: Umesh Kalappa <umesh.kalappa0@gmail.com>
Date: Tue, 6 Jun 2023 22:37:19 +0530
Message-ID: <CAGfacvQ7qE4S-U=XLVRdZmitWJiCcppWH+VscpKz4piDYWwp=w@mail.gmail.com>
Subject: Re: Passing the complex args in the GPR's
To: Segher Boessenkool <segher@kernel.crashing.org>
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org, Andrew Pinski <pinskia@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Paul E Murphy <murphyp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Segher ,

>>What did you expect, what happened instead?
For example the complex args are passed in GPR's for  cexp in the case
GCC and Clang uses  caller memory .

for reference : https://godbolt.org/z/MfMz3cTe7

We have cross tools  like some of libraries built  using  the GCC and
some use Clang .

We approached Clang developers on this behaviour (Why stack , not the
FPR's registers like PPC64)  and they are not going to change this
behaviour, and asked us to refer back to GCC ,hence this email thread.

Question is : Why does GCC choose to use GPR's here and have any
reference to support this decision  ?

Thank you
~Umesh



On Tue, Jun 6, 2023 at 10:16=E2=80=AFPM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> Hi!
>
> On Tue, Jun 06, 2023 at 08:35:22PM +0530, Umesh Kalappa wrote:
> > Hi Adnrew,
> > Thank you for the quick response and for PPC64 too ,we do have
> > mismatches in ABI b/w complex operations like
> > https://godbolt.org/z/bjsYovx4c .
> >
> > Any reason why GCC chose to use GPR 's here ?
>
> What did you expect, what happened instead?  Why did you expect that,
> and why then is it an error what did happen?
>
> You used -O0.  As long as the code works, all is fine.  But unoptimised
> code frequently is hard to read, please use -O2 instead?
>
> As Andrew says, why did you use -m32 for GCC but -m64 for LLVM?  It is
> hard to compare those at all!  32-bit PowerPC Linux ABI (based on 32-bit
> PowerPC ELF ABI from 1995, BE version) vs. 64-bit ELFv2 ABI from 2015
> (LE version).
>
>
> Segher
