Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B987B420A13
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 13:26:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNJM253qVz301k
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 22:26:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNJLb0GVtz2yHt
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Oct 2021 22:25:58 +1100 (AEDT)
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N63NW-1mqwDZ0vP6-016L2J for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct
 2021 13:20:41 +0200
Received: by mail-wr1-f53.google.com with SMTP id v25so19432076wra.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 04:20:40 -0700 (PDT)
X-Gm-Message-State: AOAM533G0nM2TL0XCmtyBscHrdh5zdRX6Auj26fQFwS01WZNNNhApo4N
 q0s7UtuPTWryTAVuPfuIXXcl3lnwhlGBMfE5zqs=
X-Google-Smtp-Source: ABdhPJwhFhZN1/rLzElq8LxHI+vYWGkiTfpWXOOqhx7kKzXCSyCUhYRu/5RoeP1GLfBuA250yguyI6fH/b4xP7cPZqg=
X-Received: by 2002:adf:f481:: with SMTP id l1mr13368134wro.411.1633346439970; 
 Mon, 04 Oct 2021 04:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <49890226-cf04-46ff-bc37-33d1643faea2@www.fastmail.com>
 <1B71F6A3-6467-46EF-858F-82E93D54365D@xenosoft.de> <YVrPf4yVFm184LEG@shikoro>
In-Reply-To: <YVrPf4yVFm184LEG@shikoro>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 4 Oct 2021 13:20:23 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2760x4OYbNBuFCv32Tgt7K3MdJna4qXvPchdKhV8-8vQ@mail.gmail.com>
Message-ID: <CAK8P3a2760x4OYbNBuFCv32Tgt7K3MdJna4qXvPchdKhV8-8vQ@mail.gmail.com>
Subject: Re: Add Apple M1 support to PASemi i2c driver
To: Wolfram Sang <wsa@kernel.org>, Christian Zigotzky <chzigotzky@xenosoft.de>,
 Sven Peter <sven@svenpeter.dev>, Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, 
 Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 Hector Martin <marcan@marcan.st>, 
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Stan Skowronek <stan@corellium.com>, 
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 Linux I2C <linux-i2c@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, 
 Darren Stevens <darren@stevens-zone.net>, Matthew Leaman <matthew@a-eon.biz>, 
 "R.T.Dickinson" <rtd@a-eon.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zGd7fiUUIJSarpnsN85muLMoCIiIjpJk4dflcwc4FzKSfGnoSN/
 ZNHD/VqvmMFFOzcCF8vCn10Ftpr2XHBvQ5aIDB5XY13IF6MV07fw+gW/2vwg77JyFNRfcd1
 1c0iOP5yURwPL8x0N24XPU7LTuXYasdoEXRtszsdf75RuPHZVd2PPHkAtMmkH8E7L40iphz
 s3cbK0IAIy67bDL6k7Ixg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BP/mjXkMXjw=:xruHxFTnXu1lLSxfQhBpeR
 8/pBJ5nv+EiSSLQ+DgcumAfPLXeu6/FvZYeuXJMYbtYJIa6q5U31Z6Q4ng4tG9EeQ6H4axzl+
 WTEt5X+qC6UgnoEhZWiPbWsGPClGZJx1CgxfyKuOjP37Slttidral7HsAi8VaY1q2R1ON/J0W
 JHCXKJA4QdTtq/mgShONwwiWHegVPd7NHbupakaOAh0/t+S5h+DdbD3V2W8M4qrnG4bcJizrW
 LV9MdF91RRnCjRoSaY3nZAJm8IjWnN2YuvmWxLxlYmCRqjPkmGlN9is/fvB0SHEoFqGGCStsZ
 9l42QQjgE2jap4PD93dQ2/c640Fqr1U/3W1UlWhYaPWjw+i7xioacdfNnTEXlg9Oet/OiEH22
 FohTva9uXxbB0lqOEEk7IaI+uAvZk1d17rnKMXQ1zirKcLSyxh1co8g/BV0ljAMPi+AWycJvF
 mjoFrp3h0TSMOuki6RsG0fvZ8VVHmFZ6DyW2MlnoVgE1aptf125dkASi/aykuYOIkSdYDwxjL
 438VT1jcq6kROeF3svZzrmCnjQYqGkKpuhXdkLbTCVkYmMkq8n81nxGf8DNvEaOYphKBnzlvx
 B6JZ2iTEPxcSp+1p5IpSBDZ3hHKY9Vo/j06+zs7fc1fm6dUn00LgxUZgW7/8tCvHyEmbU0ew1
 wVTNKWeMQdqwTU+5vEpuP3yMG88xXTCw1jrO2lmhzjN4oKeOXg4RcPiBCdpK5WOt1DRbR+Y+/
 IOl4udbeJYm4siZZavzFv7kt1mYxi8gSwBSDAA/s2Jx6i6cMMdkqPaEcW62WyfvtEJJ8BJX3q
 +PGQ7P5fNrCwVbG1jb24NIznhATG1h46Olr7o1RA43hSAILg8GdxU91+QifvGnwNo+GbF2yt7
 Ry8KT/YJN0B3dDxzpD/w==
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 4, 2021 at 11:55 AM Wolfram Sang <wsa@kernel.org> wrote:
>
>
> > i2c-8 i2c             PA Semi SMBus adapter at 0x(____ptrval____)     I2C adapter
> > i2c-9 i2c             PA Semi SMBus adapter at 0x(____ptrval____)     I2C adapter
> > i2c-10        i2c             PA Semi SMBus adapter at 0x(____ptrval____)     I2C adapter
>
> As Sven correctly switched from %lx to %p, this is intended behaviour.
> Run 'i2cdetect' as root to see the values again.

I think the address could just get removed here, as this is clearly not helpful.
port number, which is somewhat useful for identifying the device, now
it's either the pointless string, or the virtual address that the
device is mapped
to, which is not helpful either and potentially leaks information about kernel
internal structures.

       Arnd
