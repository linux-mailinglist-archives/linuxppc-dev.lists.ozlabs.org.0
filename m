Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D22894F117D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 10:58:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KX4Ry4zL4z3bh9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 18:58:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 309 seconds by postgrey-1.36 at boromir;
 Mon, 04 Apr 2022 18:57:40 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KX4RS19H1z2xnK
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Apr 2022 18:57:39 +1000 (AEST)
Received: from mail-wm1-f50.google.com ([209.85.128.50]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MGA0o-1nnMDF0p5w-00GYUj for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Apr
 2022 10:52:25 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso7258882wme.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Apr 2022 01:52:24 -0700 (PDT)
X-Gm-Message-State: AOAM531k5LWpN9ocViEROjXSlaay0VsUoNlmv2afMNxNxzLhDvOAGIMM
 ZRa7tbG6lWHhYpREoI0zJoSaBg7YxjsWVggJqbU=
X-Google-Smtp-Source: ABdhPJwjS3X9LrxfK3xOsCc8eYR0REQjLgLBdtWx850NJg3BCGgrM8fXkYWc4oZfb4QmCDEI6/0d51mdMIrhvJmU1j0=
X-Received: by 2002:a7b:cd13:0:b0:38b:f39c:1181 with SMTP id
 f19-20020a7bcd13000000b0038bf39c1181mr19168624wmj.20.1649062343942; Mon, 04
 Apr 2022 01:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220404082912.6885-1-ilpo.jarvinen@linux.intel.com>
 <20220404082912.6885-8-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20220404082912.6885-8-ilpo.jarvinen@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 4 Apr 2022 10:52:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0iP79RQWr6-YDf=xQZvonZchYN-Rn7HN2pkNihZ=anAw@mail.gmail.com>
Message-ID: <CAK8P3a0iP79RQWr6-YDf=xQZvonZchYN-Rn7HN2pkNihZ=anAw@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] serial: termbits: ADDRB to indicate 9th bit
 addressing mode
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:B7RyEV+s7xhHk0ljwr54SDuc87o1DQD81YVcwCyaWXl2RKb7+gE
 hKYz2KruCACva/tkZ1N2C/gphciw1vCqGg5ey153orXeWxpFqmVSMU8H1QClKe8vtnG8grH
 OAp0/fVidydkejFD9fF4lH+RmLKNE3DlhjUxq7MZAFLnGkhjV5bKKF5/+u+IWzNw5EZjxuc
 pwv7Oqemy3/D00yNYHA4w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WTvyNlRMmKI=:i3jLvBwBfaAyTGUoVagpvQ
 vVd1Iz9RNK0p7v7H8tCRAWsVYcksU5zxUcx9j6CDiP7SeyHB1FaF3xKKDJaqmcSYl2D93rmzT
 b40YzYQ1fgpbBJqj3SGKBsBnOfCH9u9pjS6L+Tg++c71/g64pt1OKFuyt78cS0Pgowx7JhtJH
 R7gKP5wVddOqMGTk9wZUZ9YVx7meMbxd8wk7/rJvjafi0iJyfZZwY7AK9zGWiCL+zmK2ISJ0r
 +hiWSKAYKNVC4SvH3hwRnBzplQ75TKhUDEtRWoL1aUF1l90duDiq//GzvRIV0inK7lAbXaSHR
 CNdICs/y3Yd2BeL5ADaDiJRbolzKxAWdd0RzwksIZyNILRK0mtoSaMNDgWlbuNUvL5f8cl1LU
 guDAzSePI4Anp9S/e0WIe2MhUaxPzaw8hQUfgMz5wrlNk1I45rnzsEiDuTOj3uITRvoAK/JhM
 J+orDvp+8eAZVFlx1aU4p1RAO+Iv1FazlDqHUj9aWTTYjI4Da76nokLJteI/5Sif8OakqyCbP
 4LJWNimKOeKoY2+rAXsFgX3SufSPp142Ff5z5cSGdccbRO3ZpUlN7+owSEzDtFOEMXD14NCrF
 7VYberirxHr+OZKVfvAZ2rWD5L++Pt6XxwganqSchRC5Yssg4hts6MDSb9jWjynv72+jqJmP/
 AtlWyOd6/qJ/u/f9BlCgIOWsLlgeloq14A2ITrGN0+PU2efkjaCgMkISlURD1A5FMS0YCCOqe
 ipTDtNnJ7R9jVEIiHWpCvE1tDuqR7M2BXZS4bK+P9CYeNNHwJF5GGP/RN6uLQ2o88dsipcWLh
 ks+lsCks8KZlLNqDmHK4VYEjgcWrvjC7TPVl9Fu/y7CrCwiWwk=
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Heiko Stuebner <heiko@sntech.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux <sparclinux@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, Helge Deller <deller@gmx.de>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Johan Hovold <johan@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, USB list <linux-usb@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Lukas Wunner <lukas@wunner.de>,
 alpha <linux-alpha@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, giulio.benetti@micronovasrl.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 4, 2022 at 10:29 AM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:

>
>  #define CLOCAL 00100000
> +#define ADDRB  010000000               /* address bit */
>  #define CMSPAR   010000000000          /* mark or space (stick) parity *=
/
>  #define CRTSCTS          020000000000          /* flow control */
>
> diff --git a/arch/mips/include/uapi/asm/termbits.h b/arch/mips/include/ua=
pi/asm/termbits.h
> index dfeffba729b7..e7ea31cfec78 100644
> --- a/arch/mips/include/uapi/asm/termbits.h
> +++ b/arch/mips/include/uapi/asm/termbits.h
> @@ -181,6 +181,7 @@ struct ktermios {
>  #define         B3000000 0010015
>  #define         B3500000 0010016
>  #define         B4000000 0010017
> +#define ADDRB    0020000       /* address bit */
>  #define CIBAUD   002003600000  /* input baud rate */
>  #define CMSPAR   010000000000  /* mark or space (stick) parity */
>  #define CRTSCTS          020000000000  /* flow control */

It looks like the top bits are used the same way on all architectures
already, while the bottom bits of the flag differ. Could you pick
the next free bit from the top to use the same value 04000000000
everywhere?

        Arnd
