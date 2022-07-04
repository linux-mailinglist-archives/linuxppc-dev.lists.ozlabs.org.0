Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1828356579C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 15:44:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc6VH6yQRz3c48
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 23:44:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.126.131; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc6Tq14KFz303t
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 23:43:57 +1000 (AEST)
Received: from mail-yb1-f175.google.com ([209.85.219.175]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M7Jj2-1oG3zp3a2e-007hbI for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jul
 2022 15:43:54 +0200
Received: by mail-yb1-f175.google.com with SMTP id g4so16983804ybg.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jul 2022 06:43:52 -0700 (PDT)
X-Gm-Message-State: AJIora+u6XNWUF6pEsy0mErWPf2iMBJttjKRJCbOrmjWC/aaVgr72xKC
	0XMqLv25H3YwkaUxOT/ht14Baa8tNR0pH/iR/Yg=
X-Google-Smtp-Source: AGRyM1sl7ZhrdyDlr2pScNIVgZG3D4DXePFqgUbPtO3R2pdcjKLgl0+jlEAndq8SOJ1A5ZwWwducTiOPZWJ7gVrp92s=
X-Received: by 2002:a25:8b8b:0:b0:669:b37d:f9cd with SMTP id
 j11-20020a258b8b000000b00669b37df9cdmr31378860ybl.394.1656942231974; Mon, 04
 Jul 2022 06:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220524093939.30927-1-pali@kernel.org> <20220702094405.tp7eo4df7fjvn2ng@pali>
 <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au> <20220704103951.nm4m4kpgnus3ucqo@pali>
 <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com>
 <20220704131358.fy3z7tjcmk2m6pfh@pali> <CAK8P3a2hfnt+tHiqHrHAVyagSm73LJe4OV8ig=CKFcycfk4Zag@mail.gmail.com>
 <20220704132904.irvs4xefu4esgw6c@pali>
In-Reply-To: <20220704132904.irvs4xefu4esgw6c@pali>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 4 Jul 2022 15:43:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a30ecxG-A0_YDSBJAaGjcXXVwSnc7z4k-nreO+0UfJJ3w@mail.gmail.com>
Message-ID: <CAK8P3a30ecxG-A0_YDSBJAaGjcXXVwSnc7z4k-nreO+0UfJJ3w@mail.gmail.com>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Pz06/J48RjC5Q3yPPT3IM8BqROXUTAmWlZaQb/WmRpqoqbFHcLy
 AWs0u7DhpfY17+7nvQEZ2RhPtUnPRftNx76e4BACD75u5gP95ZBJzHFBzzyyXumNtfof0bk
 0T5vWWdNroSw3b+SEp4eTJCE7KmNtdG3ajSzUzIRsi71jjyHjZxHrwPqBBHcLbOsYI79xtO
 8EjrsX363gKwNWbNOVLxg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mVW3uV7wnAk=:0H9xxXHxwTl0ZLaBsFFjeL
 hw7tVE+EgjQ0xurlX5PXbXdzod1/lr1ggi1+su+t54ifF0n0jy/QZYWZ42suLAbYjpVNh4JTV
 5MEyaObDt8egRpGUaVXyP5tmuRzL/F8bCYomWiDy/0rx40dW32iahFuWbmQ++afNlZwJUlg2C
 t1YuxtoivdcLlFvTJ1lmhhNTXQJF+dettKk0FpSYjUZXDAIv0zy1Fs0cO5T1kzLCmw2t4Aq+l
 4ahn9F6+gnSHf5kv8U6SL3T6c+jL2A4PjDK3xtqNTwwEoQD2CV8r7l3B1k+qtjMZsrzQcIzFO
 ndQ6xcpUeNQw1elnNRB3T0Zc3mR7VbRZh/aeuja+agd3GGHREkX/sPQ+f3c0swi/MGVEOldwT
 ZEJo7I/v4PDEOK7kd5dXAN49HriYJtPkwzIMNcQGnjkeCSq0rqCCXGJVbEX5V8jHMqZTPAljr
 F4OVdKvn4ofa+Xv3nHX6+6Knh3u7UzZN9O18ZMX0bqi//ZXjGgzLa7KuF0IQuMjF0wi6ZIftL
 aIhWtSLraGlItlK5tUAzHJgbKxaKskBC+v6u9cZoRlbgyJDaGRXu8K14t7pmMmYhnygQOIwuA
 SGXA0+Y/ykbmtGEKgdoeV+B7bK6H2GxYkGYyDs/TVRfY6mQxX8xANHurIVuCqjggB8VXg0/EL
 Uk78Pddl2Co7NHXgchiM+Y88JkQc20NPxt8b4U4ZIU1ks3+kpHtccbw0kF1pIQ/A0Tl4iudKW
 EJVkFJk3pOIlaPweHl1GpV48f2cl0AowIS2gNmj2MRSPYK9X3nUV+0zfP3Z1fbrHaw4jEx4Pt
 KNRSAliSvF2MRAZhz2zeAThgEVBFrA+kkLaNfnoMq5xiolF0HhkgNvyfjLqC6ay9jIzSDABlY
 Vmr4FHLgBAXtllvnPpit++8LH7GQirolDhPGQIs/w=
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

On Mon, Jul 4, 2022 at 3:29 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:
>
> And still what to do with 4bf4f42a2feb ("powerpc/kbuild: Set default
> generic machine type for 32-bit compile")? I'm somehow lost there...

As far as I can tell, that is not needed, as long as every configuration
sets a specific -mcpu=3D option, the only reason it was required is that
there were some configs that relied on the compiler default, which
ended up being -mcpu=3Dpower8 or similar.

       Arnd
