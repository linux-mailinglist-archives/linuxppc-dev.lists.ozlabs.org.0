Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D10FF3DCAE6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 11:25:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GcwhV51QQz3cRR
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 19:24:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gcwh80kvMz2yY7
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Aug 2021 19:24:38 +1000 (AEST)
Received: from mail-wm1-f46.google.com ([209.85.128.46]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MC2o9-1mKGCK2MOL-00CUXU for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Aug
 2021 11:24:33 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so9159794wmd.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Aug 2021 02:24:32 -0700 (PDT)
X-Gm-Message-State: AOAM531Y0DStUd1kCGrH6kACVRPu/6LHqQosJMGjjxKLT+O+UzAQtjDQ
 4k6lf/y/9cVTy+IzyHXoPaKw7dy4K63bHvD7Tc0=
X-Google-Smtp-Source: ABdhPJzm+d+GUJq55lf66fORA7zJHnwG96B/E2RUvkJawwTVMsCLwoBqiUjM0EJRl1uPz7IdzGuPR7PXCL0i1oa8StU=
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr2673903wmq.43.1627809872298; 
 Sun, 01 Aug 2021 02:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210801051627.78999-1-xianting.tian@linux.alibaba.com>
In-Reply-To: <20210801051627.78999-1-xianting.tian@linux.alibaba.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 1 Aug 2021 11:24:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2_ip1zGMe=EeAA7Xpkvi8iQGWw6=0sGvLqv02Mj4LrmA@mail.gmail.com>
Message-ID: <CAK8P3a2_ip1zGMe=EeAA7Xpkvi8iQGWw6=0sGvLqv02Mj4LrmA@mail.gmail.com>
Subject: Re: [PATCH 1/2] tty: hvc: pass DMA capable memory to put_chars()
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QQz5QZFBKRmP6mPKf7ypdtyRHUqoKPpN/xWozK6daTH61O7qu5m
 7iPdEeKbyEsRBfe5GiLvrZYmT3AYEfYTTXgugk6XkF8SBNsGWzRQy3W5bDFZNokI5LUt16o
 ixV0V2Xc2gmuYpgK5bIJ5aFN4VfeemYQdzN4cDlgbSpL5h1g4AnVduU7NgGnfqksY/tWYRJ
 1nJCGOAmNwRf9B+iNFF6A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KU/pEdPUwRU=:L9SXerbjlo7ulLg70XQx5X
 TRUpEa1TV2DS6TNsfMoV6fzDHGFnxpLbg29wfHqZFTqM7ROed2H7qL0GnwnyioT1IZhqp7MZW
 z4lhPCWjlNISyTzBMhLptlsnPCTJTjAUHhSR9pp/fdK0CnEoweUlwFJ7E4UPRNB3kIx24eF4B
 /qmGhp41my+uNg7chBEesmlavCPZ2MU/9eMSBBw1Gk4Bbt+zztyhbbtMgWtDHdcVF47KjOXIN
 WtS5r5x+VkoY82F3Fa9NB3MavOc0l6QMsJNZAeiPQ8xadm/W8akX5DP5UYSRr3jo6jPFZhtJB
 0mc+4ZIIZ9DKtvehFYrdGtzKrTHM1t2dp2pnOL5d87aD/RmeIxkogDOKj1Fm1HkamMac8Zd+l
 XKkXDjsHC7DmiR3WESHCPeTBnj8Ij41R40dWHt66cNC9PWTf8HsDWJP1d9xCpxCQGz21OMYdt
 fRE+qeVeuzixL7ePlQcvf+yIDPKjrLQa/vkZtZvvDfEfjjqVePBbCYlCstzo1pLnEreRb3SyO
 m24tIv0KK6e9OY/i+7ISoCvFcn+zYUU2/tOBSrVem/2LpU2rvVbgJy7EeMu2Po7/hRRNfVk14
 0v9YRS4ltnnD4j+9JcnDbMUyFbCkyh10XOBtsgO8Kz2+6/ojmvAFVZDGx6bspenOo1NhJCYR8
 QOHKV1DZ1cWNHV6H0kjWnMLpFM9x+ESicfpz8Ba7PhWHmvFRmT/UstCCFLdDNL0HL4KQx6/vy
 IavLQkKpdmNBGaMrENKd/XRAjtbKVAXXV5Han3QdDcdUiWra8jt2ddOaqQgIhl41ADMTg2STb
 8iNYqHcPupzxTdxVgYKiMbxXipm5DqlmhshOmhhYz3K9tCyZKXK9Gaw//lcGCpgXhjxxzGONg
 hHoGh19lSjuyl2f+CaJ9yWpSMurXOOR+GJVZ9R5v3x5mdM6mL6y5ypSf1+udSZ0qzREuVM3Cs
 nON/17Wsw+xtyVlzFyOeX18XUX7dex7hBk0AM6LD9RmUYX/O+QgtI
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
Cc: Arnd Bergmann <arnd@arndb.de>, Amit Shah <amit@kernel.org>,
 gregkh <gregkh@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, Jiri Slaby <jirislaby@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 1, 2021 at 7:16 AM Xianting Tian
<xianting.tian@linux.alibaba.com> wrote:

> Considering lock competition of hp->outbuf and the complicated logic in
> hvc_console_print(), I didn=E2=80=99t use hp->outbuf, just allocate addit=
ional
> memory(length N_OUTBUF) and append it to hp->outbuf.
> For the issue in hvc_poll_put_char(), I use a static char to replace
> the char in stack.

While this may work, it sounds rather obscure to me, I don't think
it's a good idea
to append the buffer at the back.

If you need a separate field besides hp->outbuf, I would make that part of =
the
structure itself, and give it the correct alignment constraints to ensure i=
t is
in a cache line by itself. The size of this field is a compile-time
constant, so I
don't see a need to play tricks with pointer arithmetic.

I'm not sure about the locking either: Is it possible for two CPUs to enter
hvc_console_print() at the same time, or is there locking at a higher level
already? It would be good to document this in the structure definition next
to the field.

> @@ -878,6 +885,7 @@ static void hvc_poll_put_char(struct tty_driver *driv=
er, int line, char ch)
>         struct tty_struct *tty =3D driver->ttys[0];
>         struct hvc_struct *hp =3D tty->driver_data;
>         int n;
> +       static char ch =3D ch;
>
>         do {
>                 n =3D hp->ops->put_chars(hp->vtermno, &ch, 1);

This does not compile, and it's neither thread-safe nor dma safe if you get=
 it
to build by renaming the variable.

        Arnd
