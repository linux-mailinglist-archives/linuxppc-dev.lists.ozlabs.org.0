Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ABD38AF5C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 14:58:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm8tW1KsYz3062
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 22:58:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm8t80g4yz2yjK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 22:58:07 +1000 (AEST)
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MnaY1-1l13i343mP-00jcOW for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May
 2021 14:58:03 +0200
Received: by mail-wr1-f42.google.com with SMTP id j14so15834900wrq.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 05:58:02 -0700 (PDT)
X-Gm-Message-State: AOAM5325vF+kRfjime9Bq5lq1llROFLNvfQpLYTgE1IKFw46LGTAOVAZ
 RyPl5Pwxee71vIzVErbixMnIECMJCNq1lkCHB60=
X-Google-Smtp-Source: ABdhPJzjF6dsH5HoZqJvsW8Z8vuY/KQcYke0jL+BR2nKnLRzRk59Q8j7MY6u03gtUYt403a0Fz/TtBgmPs8YgE0TcrY=
X-Received: by 2002:a05:6000:18a:: with SMTP id
 p10mr4175890wrx.99.1621515471669; 
 Thu, 20 May 2021 05:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210520121347.3467794-1-lee.jones@linaro.org>
In-Reply-To: <20210520121347.3467794-1-lee.jones@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 May 2021 14:56:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0VujuG8eU_CEVSvzbk4nAJz8fStedM5eMUrLAr9EJxDQ@mail.gmail.com>
Message-ID: <CAK8P3a0VujuG8eU_CEVSvzbk4nAJz8fStedM5eMUrLAr9EJxDQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] Rid W=1 warnings from Char
To: Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:20c6Xf9KOtvhlAGgThCMfcb6P7Y2Oiw+2Gc60CYM3h0/OnQKa5C
 1y4/r9N2J6Y89TwF97+H2Z4ERSgZ6KoYaQg/tNQfEToxMs5UIDS5PqEpcCLtTQstq1ewGVC
 wDV+1zzsOBCIZLgjaPrTu9HKOrBhDjF+6sPjI3a+rtiwMQxzQe7TJulDD+v4bzGjNlxbX90
 gqwxRwqU7FVsihSBd3nmw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IBE8t81oDrY=:YxP1bUg3rkKVieCw4+QCt7
 FWTnjMjGOkl13bZnvDNAhmqwQ1T+UqaBjd3JiXJWGlP6eZHYeNIHPTMcqUgBL3mm1GY5kvjTl
 qyEfKH7UVEAaL/XYipr0OGzzPu50UKTC+ApdqKcDxGU7a1N6jtL4yxOQjXtJravKE8q2iJdMN
 thd6sAi1kfgDB0P8wjTDRD+2zbYJXNK6qakyAsheQ6RTTztYit6uCnqPuKiU5JuiIXKfD1Vwc
 qQgmK+OUOYQF44j8k8wl6gDIq0ocLC9MCEkLHVDTq/Za39ybX2Yh3NDbVj5THuOyjFbm8Zl6v
 AnR1qULO5hKgUjm50+7IqGBw/vO9+5LGnlnushSWpuFQrYPNVuQU8o4o4EHk39bMlF/zq+oB2
 Ss2v0soKbtks2neg7KRGfWWs6R327eFtC0mWEO4HBzPcyjeIRTEZcVowNGifegHGrydlRJxOu
 rktWmBxnxbBjYNm9YE1pR0dkha/KsLyezDUyDdBJKWMWLv++i5oJkik+POeXTxmHghOqmsLED
 +6oPrpNYvin2PGSZp4OjXplIhRRfI1XsrM2o+043/o3mMjb+QJPNfGOykOLW0RL3gcNhQCy07
 eW0dfQgV2EY6C3cTJC4rm7F8+ZVmNAJ4By+HT/wkD2Ha8Ppnc9/Hypf0l3GzYx5vE2SvyctxP
 WaYA=
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, David Airlie <airlied@linux.ie>,
 Clemens Ladisch <clemens@ladisch.de>,
 "C. Scott Ananian" <cananian@alumni.princeton.edu>,
 Paul Mackerras <paulus@samba.org>, Kylene Hall <kjhall@us.ibm.com>,
 Jerome Glisse <j.glisse@gmail.com>, Peter Huewe <peterhuewe@gmx.de>,
 Michael Neuling <mikey@neuling.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Dave Safford <safford@watson.ibm.com>, Harald Welte <laforge@gnumonks.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kanoj Sarcar <kanoj@sgi.com>,
 David Woodhouse <dwmw2@infradead.org>, Bob Picco <robert.picco@hp.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>,
 Thirupathaiah Annapureddy <thiruan@microsoft.com>,
 "cs.c" <support.linux@omnikey.com>, Lijun Pan <ljp@linux.ibm.com>,
 Reiner Sailer <sailer@watson.ibm.com>, Matt Mackall <mpm@selenic.com>,
 van Doorn <leendert@watson.ibm.com>, Theodore Ts'o <tytso@mit.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Fulghum <paulkf@microgate.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 2:13 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
>
> Lee Jones (16):
>   char: pcmcia: cm4000_cs: Remove unused variable 'tmp'
>   char: pcmcia: cm4040_cs: Remove unused variable 'uc'
>   char: random: Include header containing our prototypes
>   char: pcmcia: synclink_cs: Fix a bunch of kernel-doc issues
>   char: pcmcia: synclink_cs: Fix a bunch of kernel-doc issues
>   char: applicom: Remove 3 unused variables 'ret' and 2 instances of
>     'byte_reset_it'
>   char: tpm: tpm1-cmd: Fix a couple of misnamed functions
>   char: tpm: tpm_ftpm_tee: Fix a couple of kernel-doc misdemeanours
>   char: agp: backend: Demote some non-conformant kernel-doc headers
>   char: agp: frontend: Include header file containing our prototypes
>   char: agp: via-agp: Remove unused variable 'current_size'
>   char: hpet: Remove unused variable 'm'
>   char: agp: generic: Place braces around optimised out function in if()
>   char: agp: uninorth-agp: Remove unused variable 'size'
>   char: hw_random: pseries-rng: Demote non-conformant kernel-doc header
>   char: mem: Provide local prototype for non-static function

Thanks a lot!

I've looked all the patches now and commented on patches 6 and 16.
With my comments addressed

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

       Arnd
