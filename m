Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 257BD377100
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 11:44:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fcj7j0PkLz3092
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 19:44:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=srs0=9lys=kd=arndb.de=arnd@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fcj7K56hMz2yXs
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 19:43:41 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4Fcj7K0tvTz9sWk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 19:43:41 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4Fcj7K0PwNz9sWq; Sat,  8 May 2021 19:43:41 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 309 seconds by postgrey-1.36 at bilbo;
 Sat, 08 May 2021 19:43:40 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4Fcj7J0dT2z9sWk
 for <linuxppc-dev@ozlabs.org>; Sat,  8 May 2021 19:43:39 +1000 (AEST)
Received: from mail-ot1-f44.google.com ([209.85.210.44]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MXXdn-1m24hb44y7-00YyeC for <linuxppc-dev@ozlabs.org>; Sat, 08 May 2021
 11:38:25 +0200
Received: by mail-ot1-f44.google.com with SMTP id
 c8-20020a9d78480000b0290289e9d1b7bcso10087788otm.4
 for <linuxppc-dev@ozlabs.org>; Sat, 08 May 2021 02:38:24 -0700 (PDT)
X-Gm-Message-State: AOAM530+hr2wmpI6MT5Sl9CcypJZVZd2uJ76c0p6xo5d0KyxhmgksV49
 Bf46K7rlae9ND/DbVEoBhmLcLxrTlYpyViegI+I=
X-Google-Smtp-Source: ABdhPJyobA+ah5ssFuqtU39jXwN3VslIwpiKtFNA+na9bSuoJWduj3Tfxu+/4nZvmdNF7FqepVfxvhKb8dBq3U8xe0Q=
X-Received: by 2002:a9d:222a:: with SMTP id o39mr11647804ota.246.1620466703051; 
 Sat, 08 May 2021 02:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <be7c92b2-43c2-0d8a-6e8c-ac92e7e07bfc@csgroup.eu>
 <CAK8P3a3OdcSQQGKxRob3A6qfh8tVD1JtLdcTp9i25SizqWpiXA@mail.gmail.com>
 <19e791d9-3226-4c13-b6e8-cdabdaaa0268@csgroup.eu>
 <1bf8523a-848a-7686-c179-7bedb18979ac@csgroup.eu>
In-Reply-To: <1bf8523a-848a-7686-c179-7bedb18979ac@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 8 May 2021 11:37:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1--4iZZNM_ySb74Umy91PoS=513tBS0eMoTzOPLBA2gw@mail.gmail.com>
Message-ID: <CAK8P3a1--4iZZNM_ySb74Umy91PoS=513tBS0eMoTzOPLBA2gw@mail.gmail.com>
Subject: Re: Kernel crosscompilers
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0CohCkx6WX8a616NSRHVZQXhl723DbOv2Uaod0q1FWFX2Zz88U9
 +zFE84M/RXUQJZ53FTBv/VbkPGX/eF9ZxZFjxPhJlYMo1FLCHEe0YdpK6SiygyIdlwfJjGZ
 o3cuwBjOUHy/c2yfKdEsFPzujn7J6DVTWLxLdfauAAD7i7c8rFLtVb6iKSkoRFgcQt2x4MX
 UQ26zpTa43F6qChUylU2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eiF/kH177l8=:aHq9Bir1Hw5tKy/heQKEn0
 ew12zqtOPj7yjqTFW1WIIkL1wXd/FvcJst+Cte/oP9pi0m8gqjwRx4vkfsjbT1gD80ArViivF
 b7Bnt6nFmJ0+2n8fbFCsBE64eoyZ6zG3spxMTlaHf4SgLqf9a29ZLJlQdj6aknXN3LoW9081C
 qg30lhqyTd0H0Uf6sJBevsCdMQipOR3IxGzYo3U9S84X4QzdH7fFeSEzPgB+LJIignAmSqN/7
 mD+gSs6jE//u7UM3gVo4roCjogvWAGiOn6ZfpAdSRSQ1uHvEqWTYeC2i4bDYSnZEbRuF9vdi5
 DtDXNLQDxCc9kHW6vo+jytN8tnYhDHbJ346nDZ7WTyCp3MBqCqoNiF4beb4sLdaANogZLCF4j
 kFut6156a99qQs7Fk9zJ/uvdYetnBxZBW102yTZN7LUE+1pPDRNfbHUnHdSli2hIbDOapUENd
 NYaN6jCMrVx5au4nEZf4/DPnVn/cZgDK6VF7h5s5wM8UrftLnwaPY7HDktiM44ouLjRDP7aOt
 ZK3LdmgLH21ufajElJFRB0=
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

On Sat, May 8, 2021 at 11:22 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 08/05/2021 =C3=A0 08:46, Christophe Leroy a =C3=A9crit :
> >
> > I don't have any ppc or arm host I can build on.
> > I'm building on x86 for powerpc embedded boards.
> >
> > I have tried your GCC 11 snapshot, I get something booting but it crash=
es when launching init.
> >
...
> > Seems like there is something wrong with it with GCC11. When forcing CO=
NFIG_CC_HAS_ASM_GOTO_OUTPUT
> > to 'n', the kernel boots ok.
> >
>
> I found the problem, that's due to r10 register being reused by GCC in th=
e copy loop below:

Ok, thanks for testing. I'll try to rebuild the release tag in the
next few days.

      Arnd
