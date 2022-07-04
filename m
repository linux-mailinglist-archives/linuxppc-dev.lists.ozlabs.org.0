Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D445656ED
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 15:22:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc61R1w8Hz3c30
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 23:22:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.17.24; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc60y3Zrlz3bYs
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 23:22:25 +1000 (AEST)
Received: from mail-yw1-f170.google.com ([209.85.128.170]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MStKq-1o2CRv1WWs-00UI2p for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jul
 2022 15:22:21 +0200
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-317a66d62dfso82032667b3.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jul 2022 06:22:21 -0700 (PDT)
X-Gm-Message-State: AJIora8C1d/MOEs69co7l59tqjwXlR7ttTIBneVHAsLD5G98OEIfI/Pw
	T8W4KcQt0v3mmnDqvhknRdKa9ZXhHuqaDBNOAWs=
X-Google-Smtp-Source: AGRyM1vSNqE/dA73xomorsJNTCLKIKAarR3GdJzsZeQ0Unyn8Mqsmv6DIMqnbWDKeKL4LdHxnLOtas+QyAVTl9am/xA=
X-Received: by 2002:a81:1d43:0:b0:318:638d:2ca with SMTP id
 d64-20020a811d43000000b00318638d02camr34734313ywd.135.1656940940226; Mon, 04
 Jul 2022 06:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220524093939.30927-1-pali@kernel.org> <20220702094405.tp7eo4df7fjvn2ng@pali>
 <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au> <20220704103951.nm4m4kpgnus3ucqo@pali>
 <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com> <20220704131358.fy3z7tjcmk2m6pfh@pali>
In-Reply-To: <20220704131358.fy3z7tjcmk2m6pfh@pali>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 4 Jul 2022 15:22:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2hfnt+tHiqHrHAVyagSm73LJe4OV8ig=CKFcycfk4Zag@mail.gmail.com>
Message-ID: <CAK8P3a2hfnt+tHiqHrHAVyagSm73LJe4OV8ig=CKFcycfk4Zag@mail.gmail.com>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jexO/HaevWzijO0yeXS2oxM3pIoU+Dc9Ovu5Yxi6MdSpOkwUlYm
 u6533NSIx+39AMrKCq/AKFNroqIg+KPEiBCdR+AtcJi71IREZAxGceH3xuKj8oZODSNjFvk
 pxYW95v0mtr8RNbv2SYsdlo8Pcv5TTnMRiryPz01IeTGcht1XPiU61qv4rrw12Z3BZGqdBo
 W+Ocjvh5Fio618KRzIlAA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dKa2OCBO+Hs=:Pcu/qaseuY0azkZenpLh0z
 S9159h0cooXIRShXHekblV0LYAAqBnJsUqCEJBhHb8NpUTmbqWvMnWC3D5a2IL7AUZFQF4XyI
 rgk44XbH+1y+BPW5riT2AwQLJonNTOTWpfJ7AoQFpM2+wx27BXlXZj+S7oFgyQMmoDLio99Ey
 vFuOqZAIyOeiKqbOvHaoRvY1W/i5k75wl8otM+pK++dOUE2t3cWUYvepXQnKS4oq/IdCmz6NG
 VLEtihLQ1hodVMl/KGu5GyG6rb9JhriSEqFfPPoNOu9HNfz6t6UyahNtmCfxx2oWgjxsg/FwB
 epgzA8G535XZ8xbsYEppqkqh5aTAq1aYNRy8WXL6wtJ1gwHYs6NbfZY0yCFy0nGJG6A6E4pku
 7Pw3qU0ycVp42ebmzaPCOzPQ1YG6yUq9CjoLDj7hBbXBbmvQUka8crb8nvvjLeFmhJcHIw3Db
 CScKqGAR0X3iB8vJS1bE6elFa+smjSS3qgbpAdUgMIc6tOlJc8VQj+iKBVBdIF6vuWjXiJZT/
 DOR37mgi+msuXfeUoY9700gRdMhs347FGXLWqgJEulAu0pkNXnR0Dn+051lFeoz+tsad2+HoD
 pVKanKPcUqPXmupILPFso4IQkzb8FmxtghyRGGcZbRlSbMpS2xm1DVWmiV9AW8mx0q7excFK/
 WRFJps3RuSiEZppL+wFfdxnj2r1AwuwFSzTLGtZB4J+r7g20F8Fy57rhC+y0Lcx+utbuTdxAG
 Au0ifUxGAEJavwMwuh/8jrQwVT5XhHO9foV8Dk/SIPHlsGvGSXW9f0E7X4wIXs8sl9SK+F0vd
 TyEG+5P1EacuO6GlxmQ7V9QaN6P2Amq0YHZKmg+CIFUuX5TqK7TsfDcovknPxothj2fN5sIpz
 dHhBu955wBZdKg1+SUEE9sNddEiHMADCHun6mwLo8=
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

On Mon, Jul 4, 2022 at 3:13 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:
> On Monday 04 July 2022 14:07:10 Arnd Bergmann wrote:

> > CFLAGS_CPU-$(CONFIG_PPC_BOOK3S_32) :=3D -mcpu=3Dpowerpc
> > CFLAGS_CPU-$(CONFIG_PPC_85xx) :=3D -mcpu=3D8540
> > CFLAGS_CPU-$(CONFIG_PPC8xx) :=3D -mcpu=3D860
> > CFLAGS_CPU-$(CONFIG_PPC44x) :=3D -mcpu=3D440
> > CFLAGS_CPU-$(CONFIG_PPC40x) :=3D -mcpu=3D405
> > ifdef CONFIG_CPU_LITTLE_ENDIAN
> > CFLAGS_CPU-$(CONFIG_BOOK3S_64) :=3D -mcpu=3Dpower8
> > else
> > CFLAGS_CPU-$(CONFIG_BOOK3S_64) :=3D -mcpu=3Dpower5
> > endif
> > CFLAGS_CPU-$(CONFIG_BOOK3E_64) :=3D -mcpu=3Dpowerpc64
>
> Yes, this is something I would expect that in Makefile should be.
>
> But what to do with fallback value?

Most of the fallback values can just be removed because we don't support
building with gcc versions older than 5.1.0 any more. The only one
that I think still needs a fallback is mtune=3Dpower9, which requires gcc-6=
.1
or higher. CONFIG_POWER9_CPU could similarly use a
"depends on GCC_VERSION > 60100".

        Arnd
