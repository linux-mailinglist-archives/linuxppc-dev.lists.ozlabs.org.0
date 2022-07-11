Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8680570692
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 17:05:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhRz41MGRz3cdF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 01:05:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.17.24; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhRyc4d8Nz3blj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 01:05:27 +1000 (AEST)
Received: from mail-yw1-f171.google.com ([209.85.128.171]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MKsax-1nqLr52rhV-00LGij for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul
 2022 17:05:22 +0200
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-31c89111f23so52348647b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 08:05:21 -0700 (PDT)
X-Gm-Message-State: AJIora9o5qpwtpsZ9QbHAl8qM4zWvtaygPrSmxVrwux2wlqqFrumt1q2
	N59tomHjIrgMrQfBV3TxOEvS9WlqkMMQnr5IsUs=
X-Google-Smtp-Source: AGRyM1uuR/3jowLZkJ4wNlbdpbRAfi5CN2W88/co9aQy/bRsGm6Pe6SDOiUAMoudRqc3oLXRF/2zn2EYg7LCb5Ma+f4=
X-Received: by 2002:a0d:df0f:0:b0:31b:e000:7942 with SMTP id
 i15-20020a0ddf0f000000b0031be0007942mr19298786ywe.320.1657551920821; Mon, 11
 Jul 2022 08:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <8abab4888da69ff78b73a56f64d9678a7bf684e9.1657549153.git.christophe.leroy@csgroup.eu>
 <b0d982e223314ed82ab959f5d4ad2c4c00bedb99.1657549153.git.christophe.leroy@csgroup.eu>
In-Reply-To: <b0d982e223314ed82ab959f5d4ad2c4c00bedb99.1657549153.git.christophe.leroy@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Jul 2022 17:05:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a33jf5CUpyzWmRHpoUDMWB7TqSw5afUW=rcmMVSK8BvRA@mail.gmail.com>
Message-ID: <CAK8P3a33jf5CUpyzWmRHpoUDMWB7TqSw5afUW=rcmMVSK8BvRA@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] powerpc/44x: Fix build failure with GCC 12
 (unrecognized opcode: `wrteei')
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:qctdts/y+w7Vt4flGXaYRE8FrnXV4GhMOCR2WZiBaUE7DgpDJot
 w7j07pzg8F0MiV4HvKsBXgHqm0tyLWCrh2v528vSin77KwL7qXrr7h+ALRQB7vO0HB6n/R8
 f4pzaL64kv9OK0WEb32uuWNOP+pBs1DUkeBthCU3YEkdg4V8qWP0WxctFgQ4xKMmpz9NmwV
 DrRDwWHkBhaVINp8zT4dg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cVuYhUHrOpI=:EwoUV0yd3qJrfREg/7WFuk
 iL9whwpKjak9CDWnT8ZLNG9gHgsWFH7+t6Q3dcK+QiVrJLo71p/vhxPk9iX/ucods2uj0/J27
 4LMguHzmlgU2lxFJ2st26MmijokO82r9yw8jtzh+b0C0ees7wwALBu4jnj1huZoB3eFo2Og5k
 DxY0MpKgAq4vLheZez/nm3zOaFd5ntTlPVMqkLKJBe6IwEuB5oj5xfdRk4Mnw0bFy5FeTGe6Q
 E1+tYBipEM/9/fp762i5FRbAio+ddxfFXBlm6vNNscNXllOZjVEGY4cMdmaiMSTcbqI0G0X4N
 m+edbr7M1xjhVIgw0nNIaxMmXeHIt/FDp8epIPIkMs/vLCB1kjxC1ULL8RrB//KVZdgsoQagZ
 vtFYmMd5fdBB1E+PMti56jDPkXHgsCi+PG2oEXXMdS8OXkjLE9oySiYno/W68e84Bc4skmvHQ
 /VJtdcauPSNVhKHiTrzPDqu25GJy4AKyeGXEXx4OidQ54pDYwtihblnH3Zy0cKNQaSQZRlJ6A
 N6WLRIxOJkKGGq5uejaIe/R5+eC8+rdI91RWA0yzL5XMEf1WaduxmkcizSWzB04yNB9nlKGdV
 PlxFfaQoA2k3WM3KwIN+dfCP7MCp6UHpTDspYTqfXvzTK2ndy0e0Z+XkP4kMgku4jVEcQvLMy
 gAGCoYonJb7pPvsICEroxlR5mlKjVW8KDyfkMkqTg+reoAd/25he6QIr57V8ushkCfSFdDfoj
 ivhsV5N3izuQ3GhdnnPEaCueO0BTmswYaYJkJg==
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 11, 2022 at 4:19 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> @@ -183,6 +183,18 @@ config 405_CPU
>         bool "40x family"
>         depends on 40x
>
> +config 440_CPU
> +       bool "440 (44x family)"
> +       depends on 44x
> +
> +config 464_CPU
> +       bool "464 (44x family)"
> +       depends on 44x
> +
> +config 476_CPU
> +       bool "476 (47x family)"
> +       depends on PPC_47x

Is there any value in building for -mcpu=440 or -mcpu=464 when targeting a 476?
Maybe add another !PPC_47x dependency for the first two. Ideally we would also
enforce that 440/464 based boards cannot be selected together with 476, though
I guess that is a separate issue.

Is there a practical difference between 440 and 464 when building kernels?
gcc seems to treat them the same way, so maybe one option for both is enough
here.

     Arnd
