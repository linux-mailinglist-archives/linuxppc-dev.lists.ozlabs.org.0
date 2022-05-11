Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD9B523E44
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 22:02:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kz5RH1lbJz3cCf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 06:02:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aDFV+CNg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=aDFV+CNg; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kz5QS3Bbzz3cBT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 06:01:35 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id d15so5450223lfk.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 13:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aIr7kufHqh1aklBFT48PcfwiGgRwuFks7DI5SiM+9Q0=;
 b=aDFV+CNgCaB8HAuXCMaTOeqfz3Euqlc9UfykqEg/M7trT+lMOcwb6NTqEGZJ7SsVNZ
 wKPGERgQdDUkJumgL37urxFlDsGkmX7PqdKJaBJZ9MZbdtLV8cQTIpE0yfVn6cMSgZyZ
 GDcUvdJSKIpdCHdovd/rPOddBCdGdf7Tcs7gNO1JNMXTpaAKmIBz3TFWivhPzhsqWiWP
 vJ/31TdyTBLQqry7t/YKe6QWlgU/ihp+YfVohSDDCIs1NWIXVc6t8SiZYJv7SQNHxS8u
 uvm0zjVSH3yCGxEApXJnHd78LwJfVPsGlD2n86/VBo9AQNLgEv62rjfzxd444XLv3wC4
 k+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aIr7kufHqh1aklBFT48PcfwiGgRwuFks7DI5SiM+9Q0=;
 b=K8gstFVi7uvgSGzBlTeDNZ2U+aK90dGaiGQSRCgBq6SmTuo4AJM6JJpg7hLmTABNx2
 xnPxuYS8UZXlAm1kk20+owbsfnVDQ4ElsUdAutODpxNkh07g9f6yxDagkPfT5OwwZWIr
 u7BYd2ybgAq+2omoucYq3RL7q1Myj+shKZTqpFjCpipTpJTNr9y7Hg8MZf9WiipKdR1y
 Nyjct/ca/br055nWSIl11ChkiK7NugaoZQvN27ht7rNzfmrmhopaNjagsfR+JlkrSnvv
 etYeK4K/NZ0bympVu++JvhxYXyGbsbRgdJcTfoxx3+0y6iGdCvW+BL0Oa5lztC7hCMZc
 qfIQ==
X-Gm-Message-State: AOAM5304Up97XpoLtURnGvR6FmIJ0sodFeeUIKnsewl5TfNkGceZPpHP
 rOuLSEko5qQ5kUY5NlTFIYtcUNNlkIpocuIcOYuK7w==
X-Google-Smtp-Source: ABdhPJyw+NM/b0aVOHtc066BYz2oDYf2ffAEKshIqZZZ77ExFAqpVJecq3d8qHUAeYUdPNE/gr7l7Cdi4Emgrt5UzVw=
X-Received: by 2002:a19:4303:0:b0:473:f5fb:27b2 with SMTP id
 q3-20020a194303000000b00473f5fb27b2mr20127658lfa.626.1652299285108; Wed, 11
 May 2022 13:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-4-masahiroy@kernel.org>
 <CAKwvOd=LR=UNOeWJDmM-McJ=FrCWTo8w1ox+KGMQCwCVpiUyFg@mail.gmail.com>
 <CAK7LNARGNEDzPPUsPjDXsXUUUPSFK2erQRuyPocR_v5hTYRihg@mail.gmail.com>
 <CAKwvOdmK4oH0t8Q6F19sWKX1fT=AgS=kfvn05FT01HffLJwgMQ@mail.gmail.com>
 <CAK7LNAR5preB59HJH1-F_ZfEmoF3N8b9z4eRhYzsEVwu_XUH4Q@mail.gmail.com>
 <8babc23b-5e24-f662-6c4a-eb1c30e0e6da@quicinc.com>
In-Reply-To: <8babc23b-5e24-f662-6c4a-eb1c30e0e6da@quicinc.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 May 2022 13:01:13 -0700
Message-ID: <CAKwvOdk1z6jnTA79W8qyy1sWuoa29YxppU1gAkHkQ=g6UiVvCw@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] modpost: split the section mismatch checks into
 section-check.c
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <masahiroy@kernel.org>,
 clang-built-linux <llvm@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-modules <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 11, 2022 at 12:51 PM Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>
> On 5/11/2022 12:27 PM, Masahiro Yamada wrote:
> > On Thu, May 12, 2022 at 3:48 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> >>
> >> On Mon, May 9, 2022 at 11:57 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >>>
> >>>>> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> >>>>> index a78b75f0eeb0..e7e2c70a98f5 100644
> >>>>> --- a/scripts/mod/modpost.c
> >>>>> +++ b/scripts/mod/modpost.c
> >>>>> @@ -31,7 +31,7 @@ static bool external_module;
> >>>>>   /* Only warn about unresolved symbols */
> >>>>>   static bool warn_unresolved;
> >>>>>
> >>>>> -static int sec_mismatch_count;
> >>>>> +int sec_mismatch_count;
> >>>>
> >>>> ^ this should go in modpost.h if it is to be used in two translation
> >>>> units, rather than forward declaring it in section-check.c.  You did
> >>>> this for the functions.
> >>>
> >>>
> >>> Sorry, I do not understand.
> >>>
> >>>
> >>> In modpost.h, I put the declaration:
> >>>
> >>>    extern int sec_mismatch_count;
> >>>
> >>> If I moved it to the header without 'extern'
> >>> I would get multiple definitions.
> >>
> >> Yeah, you need to _declare_ it w/ extern in the header, then _define_
> >> it in one source file.
> >>
> >> That way, if the type ever changes, the sources will agree on type in
> >> all source files. You will get a redefinition error if the definition
> >> changes the type of the variable since the last declaration.
> >>
> >> What you're doing is forward declaring, which works, and is a common
> >> pattern for (bloated) C++, but is less type safe than sharing a single
> >> common declaration between multiple source files via a single common
> >> shared header. (Sorry I didn't respond before you sent v5)
> >
> > Sorry, I still do not understand your suggestion.
> >
> >
> > Could you provide me with a code diff
> > showing how to do this better?
>
> I think you are doing exactly what he's asking for:
> declare it with extern in the header (modpost.h change)
> define it in one source file (modpost.c change)
>

Oh! Indeed, sorry, I'm getting lost here in the review. Sorry for the
noise then.
-- 
Thanks,
~Nick Desaulniers
