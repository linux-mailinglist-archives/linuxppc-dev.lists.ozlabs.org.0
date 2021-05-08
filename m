Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9993771A9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 14:22:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcmfY1h6Dz3bnW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 22:22:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=9lys=kd=arndb.de=arnd@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcmfB3d5Qz2yXp
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 22:22:09 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4Fcmf43N7tz9vFL
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 22:22:04 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4Fcmf33Ykgz9vFT; Sat,  8 May 2021 22:22:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4Fcmf20JxFz9vFL
 for <linuxppc-dev@ozlabs.org>; Sat,  8 May 2021 22:22:00 +1000 (AEST)
Received: from mail-oi1-f174.google.com ([209.85.167.174]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MPXxi-1ls5Oo0Kna-00MYGO for <linuxppc-dev@ozlabs.org>; Sat, 08 May 2021
 14:21:56 +0200
Received: by mail-oi1-f174.google.com with SMTP id u16so11335169oiu.7
 for <linuxppc-dev@ozlabs.org>; Sat, 08 May 2021 05:21:55 -0700 (PDT)
X-Gm-Message-State: AOAM5329LL81iEWSSI9pPWjL8gom0RDoAsF2hZuU4iqyC/bu1wAOaSq1
 h9JQaOq390XK6Mb5yM3VJpEPXpnFqlRrZIR5YmE=
X-Google-Smtp-Source: ABdhPJz8wjHfRS+/Q+eZ+vgK5sEvCpSm4dvIu5Sef0q3jBRWfZmkWGhCQDA/zgL7Q/iZwER5KOp+F1w4rmg6peADUK4=
X-Received: by 2002:aca:3389:: with SMTP id z131mr18447887oiz.11.1620476514018; 
 Sat, 08 May 2021 05:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <be7c92b2-43c2-0d8a-6e8c-ac92e7e07bfc@csgroup.eu>
 <CAK8P3a3OdcSQQGKxRob3A6qfh8tVD1JtLdcTp9i25SizqWpiXA@mail.gmail.com>
 <19e791d9-3226-4c13-b6e8-cdabdaaa0268@csgroup.eu>
 <CAK8P3a3V=y8tHkN6JSpA54bKAOZv9RK04WcVE9LPL0r-WE0Nmw@mail.gmail.com>
 <b6fad6f3-6390-54a3-f0c8-30b7476c686a@csgroup.eu>
In-Reply-To: <b6fad6f3-6390-54a3-f0c8-30b7476c686a@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 8 May 2021 14:21:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0vpqKiTUqK2zf4WeV9RcPVgz1f97Y0a5Z9-ciY4Tsmag@mail.gmail.com>
Message-ID: <CAK8P3a0vpqKiTUqK2zf4WeV9RcPVgz1f97Y0a5Z9-ciY4Tsmag@mail.gmail.com>
Subject: Re: Kernel crosscompilers
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lroNIRMKOvjsR8wYBjXMWLSH71UxTu9wBbsKRcITrSXUqCRmIfp
 uvo2Eptag3vFKLotwAxZe1XGo0/MJ49QvEMRplgy73fsCnpvWc0ifb4Q0Gg5JXaTAHiF8DM
 bEI3dMrX+8n5fYnp1fKnW86Ravs/hAT8FfHoZGs2ARuEVdi7ejkra/2wSW182N6qlbb+8g9
 WYF7gVieq5jf8FuahWSXw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UJ8xSrd8d20=:J0S7ZerF/EuO3xEjZDTfES
 EOVWh2bxNEzZpstIWpapd7wxPdlHG6iyOmzHXJrLflZZSdNzgMGwulG54DJ1vbAfkin00oEmB
 whKN0/v5erWiyH2oj7sYFhjpicgMZ21rK5xjOy/UqvuIUD04nrFpJHI1oC/Rc3C2AJDb6K15H
 I1MBRQiZhxdcArJZbuV3QJAJRjlVIiLNPP2DddJeIid4ViJUJQP6OtRjDcjGA1XnuA6FAA7NG
 qA5XorFoZLimMOJ94GMvzM62FeEHcmeNqR93JIlaW7ShpcZkOFr83tRE3dKUvSt4+w6+QWkvr
 zn2XO6i4cL//xcBW/MI8uYeOQs44dttCUtwYkuVo2VON/lRzylRHZCq5U9GUkIMGpi7bu9aa9
 oKm/MgsVf1l8Ljnfsu6WOeboO8u1DbnNfuiKBW0hljKqTYmpHLaPfSEn9dR6dbp/un5GzWVD0
 zZV/vIEU264H9q1t/fCD06q20s7hZM/XG5XXkECXm119DMEbsuUIOrusR37paway+VY7BHpaj
 Rb2bvVYuyF7iUcfzS4fnVXpeRidavTe9rs7EJoRX3kzrJADgd7v3haLJpMLgooEhs+fVmrgaw
 1c6Hu+dr7jJ/eT6RpRmoxocVvU9XpBeRTItsjLqcn0v/sRnsPrC063f23ooLfgmP6qjUrXEjz
 wFp0=
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 8, 2021 at 12:15 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 08/05/2021 =C3=A0 11:43, Arnd Bergmann a =C3=A9crit :
> > On Sat, May 8, 2021 at 8:46 AM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >> Something is going wrong with asm goto output. I implemented get_user(=
) helpers with asm goto this
> >> cycle (commit 5cd29b1fd3e8). I tested it with CLANG before submitting,=
 it was working.
> >
> > BTW, can you point me to those patches? I think it would be nice if we
> > could eventually
> > converge parts of get_user()/put_user() implementation on something
> > that works for all
> > architectures, we do seem to rewrite these way too often. Ideally we'd
> > have something
> > in asm-generic that provides all the wrappers, and just requires an
> > architecture to
> > implement the inline asm helpers for each of the sizes.
> >
>
> The series that is merged for 5.13 is here:
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D233250&s=
tate=3D*
>
> And of course the result is just
> https://github.com/linuxppc/linux/blob/master/arch/powerpc/include/asm/ua=
ccess.h
> and all its history at
> https://github.com/linuxppc/linux/commits/master/arch/powerpc/include/asm=
/uaccess.h

Ah, I should have looked there first ;-)

> The fix from today here:
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/cf0a050d124d4f426=
cdc7a74009d17b01d8d8969.1620465917.git.christophe.leroy@csgroup.eu/
>
> I made a try to use asm-generic/uaccess.h a few weeks ago, but it was not=
 conclusive. I can't
> remember the details, but I can have a new look at it next week if you ar=
e interested with the details.

I hope you didn't waste too much time on that. The current asm-generic/uacc=
ess.h
code is not helpful anywhere and needs to be rewritten before we can have
normal architectures using it.

        Arnd
