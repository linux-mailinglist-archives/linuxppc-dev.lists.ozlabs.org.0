Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 863FF56C12C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 22:07:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfkpY3lbDz3cBP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 06:07:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.17.13; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lfkp524Lpz3bZC
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 06:07:08 +1000 (AEST)
Received: from mail-yw1-f180.google.com ([209.85.128.180]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MmUDf-1njgIz2nKL-00iUBV for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Jul
 2022 22:07:04 +0200
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-31cac89d8d6so138607217b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Jul 2022 13:07:04 -0700 (PDT)
X-Gm-Message-State: AJIora933OuYcsFIF+Aqvv5M7YzNi/SGEOg0YROl7FsSOXrscB3KdZhT
	7rPR7rA69Ujd11aZcpHKLfe+ZfvKsPnmvJ4/+S8=
X-Google-Smtp-Source: AGRyM1u/OY34ZLqd24Cd7bFbPrMeX+gUQNJgY4utEEdog9FiPcqprCN4MUal9h9VGtW98t7Qp9Y8dgyN45Miasvtu+I=
X-Received: by 2002:a81:1e4d:0:b0:31c:86f1:95b1 with SMTP id
 e74-20020a811e4d000000b0031c86f195b1mr5836069ywe.42.1657310823467; Fri, 08
 Jul 2022 13:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220524093939.30927-1-pali@kernel.org> <20220702094405.tp7eo4df7fjvn2ng@pali>
 <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au> <20220704103951.nm4m4kpgnus3ucqo@pali>
 <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com>
 <20220704131358.fy3z7tjcmk2m6pfh@pali> <20220708171422.mpbhb4ejarwnce6m@pali>
In-Reply-To: <20220708171422.mpbhb4ejarwnce6m@pali>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 Jul 2022 22:06:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0qzes1rXJDKF_6j0-KeB5V4M7ZMeHRrNk-KOQwA0vVEw@mail.gmail.com>
Message-ID: <CAK8P3a0qzes1rXJDKF_6j0-KeB5V4M7ZMeHRrNk-KOQwA0vVEw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w9uN53s8flX8W133cJ+8yXq+jgBqVvjfuP9ZZCrx9y3nOJJsgVV
 jA5r5tTwpczBCx4fPPnsz3j6L6F75dSrlTC+LZgPwG2RWizoFe7RONrDmzjkhr+J0jgURsD
 sGCCZKDm6fuYt9iKvPu+lyd63TYjqpaTKOEzoicMYQEBHarVZmcDmIB5HRaj+YqKTKaG/he
 8MX/0+wlAI7bi8C8ITJmw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:E0p+43K99wA=:i6A86Z6fuG2/k4cHFsxddE
 RFbzW0SgsrniET4TRHwI7o3q0QymhaXFB9G0CgQHKGrJDJ9veA8MOxSjQVoKdnNBswqctLgtv
 Txn8NGhIZIp6sFGwlci0vN0kHUS4w0NWEJJj5sNjk70X3Kd26Fne2VLGGX74ArU7zC6mHvTt/
 IHflANJqiuyvgdcxZEEWz+p7+QL6X2H52UiOgffSm7ZoP6y1XFy0SOC6UR8CZdcts/RWkDiiI
 fEEEm4LQNsiwcbxO3E30ZLbI+AWNncatqpBi/GbP1z9rcKJYATetCAG66PCjwXQ2az/SiItYk
 /tVFlzHB1D3pOid10V5Ecnk1q26fFj7baCiZCIGO8PKiqz4rO3w9GMQhj8QNHOQ3hwHwelZXl
 ny/eI43zAg6qFYspfdU06JkmSKVeYCVKndzlmr+b2Y74Wrr9i5i1uzBhYesILHNggn4IVUv30
 MNCr89Za9N/dn09ZMEvvbjdSOwfYE/54dxra9Y+rJGvlPQazGJI/H8RoLsNuIXEAs6pzEV+CJ
 xArr1yk42W3ViygXglOk06shsFIRqkNMkSF8/xhv7kylz2i2dSLOOz9usTg/qMgE3/F8Lxut/
 34g2dlIzznMaQ7/ayOrvMCoZsuksOVGXYFFsMhOUE28hmhaUP9FSsVyzH2qG44DerEvgpaZcA
 ojZZW0gyNn6LOZrBylblrt9URyx70cQF3G4dp/KLW2+1L5L7htBi1eTy8nUWBbYJAJxMdvgRo
 M8p4Vta8IYJXDOOpuMIs7X34w75WZCpIp3CfFPopvCjFZLGO5qTX/UNUbdbmtWlh7tbn0Flf6
 aerFSKo2sHP4EH0mfcifhtlH9Uvdm7KNpjVb3mW6yTjcmuxlTndZDhOnK/85ApPbNN3WWzyC9
 HDNQCMrtxxR/X59hjWIQ==
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
Cc: Michael Ellerman <michael@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 8, 2022 at 7:14 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:
>
> -ifeq ($(HAS_BIARCH),y)
> -ifeq ($(CROSS32_COMPILE),)
> -ifdef CONFIG_PPC32
> -# These options will be overridden by any -mcpu option that the CPU
> -# or platform code sets later on the command line, but they are needed
> -# to set a sane 32-bit cpu target for the 64-bit cross compiler which
> -# may default to the wrong ISA.
> -KBUILD_CFLAGS          +=3D -mcpu=3Dpowerpc
> -KBUILD_AFLAGS          +=3D -mcpu=3Dpowerpc
> -endif
> -endif

I think to remove these, we first need to ensure that /some/ option is
set for any of
the CPU options.
>
> -ifdef CONFIG_PPC32
> -ifdef CONFIG_PPC_E500MC
> -CFLAGS-y +=3D $(call cc-option,-mcpu=3De500mc,-mcpu=3Dpowerpc)
> -else
> +CFLAGS-$(CONFIG_PPC_E500MC) +=3D $(call cc-option,-mcpu=3De500mc,-mcpu=
=3Dpowerpc)
>  CFLAGS-$(CONFIG_E500) +=3D $(call cc-option,-mcpu=3D8540 -msoft-float,-m=
cpu=3Dpowerpc)
> -endif
> -endif
>

And this part will not do what you want because CONFIG_PPC_E500MC is only
set when CONFIG_E500 is also set, so the -mcpu=3De500mc option always
gets overridden by -mcpu=3D8540

         Arnd
