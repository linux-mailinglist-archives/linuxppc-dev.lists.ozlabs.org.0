Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA2951987B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 09:42:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtTMJ08gFz3bpY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 17:42:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtTLr5wPDz2yJQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 17:42:27 +1000 (AEST)
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M1JJC-1nnnHB46nq-002p2z for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 May
 2022 09:42:24 +0200
Received: by mail-wr1-f49.google.com with SMTP id w4so783622wrg.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 May 2022 00:42:23 -0700 (PDT)
X-Gm-Message-State: AOAM5324Sbf0N/t0HU8fwap/3OlOBCYw/5/QkK7E2ivwCNFq4jYgNKk2
 VnxYo96li7RjkEOqvQx9IFd1eZwLWquFX8BipVM=
X-Google-Smtp-Source: ABdhPJyAtaHJAu4B6FvTyywy89EOYjaADkD1ii+djh63zQRkEMld6M+vJFv/YubU9ANwgQaTox0QURVrOWQbFXWyNvQ=
X-Received: by 2002:a5d:5986:0:b0:20c:5844:820d with SMTP id
 n6-20020a5d5986000000b0020c5844820dmr13214984wri.192.1651650143027; Wed, 04
 May 2022 00:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <2c8c96f-a12f-aadc-18ac-34c1d371929c@linux.intel.com>
In-Reply-To: <2c8c96f-a12f-aadc-18ac-34c1d371929c@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 4 May 2022 09:42:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0hy8Ras7pwF9rJADtCAfeV49K7GWkftJnzqeGiQ6j-zA@mail.gmail.com>
Message-ID: <CAK8P3a0hy8Ras7pwF9rJADtCAfeV49K7GWkftJnzqeGiQ6j-zA@mail.gmail.com>
Subject: Re: [PATCH 1/1] termbits: Convert octal defines to hex
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UULqFMFbanAVAAkRPyMcoe5LU4M3n6XPdQX4EyAMS0lln8b+OKO
 73K3yNpMvrU8s6mIVvOqqSjmAHv0X+o8izbIo6Y5c/sx1ySptsIvFOUHllDw9hI1uwBklrQ
 wrHTm8dIJWKOw9PzpWv41dXkHkvXe/swDT86ou+v7ced99/klaR7vURkoCebY2DGGgkMG1I
 FDyREs8ktxJ136z0xEnHg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OSfkoLH+QoE=:zmOGIWGHJVINmuOohde0Fg
 MCOUQWb5sZU8aOD96CF9CcU1iL92C8R2NYtdJ78U6GxuPoKPfks0nyaXjNZ2E7ajVmlkFtLO7
 gFv6NKB1TWGehk+/sLmZgdJWsDwRA00lfjPEtRSgGrfjDgqcMSUOjEyVHlbQ/goTwduoe77RZ
 aYhVeOc6oq/Nu27qma09SHXs9ThaupWwupuA9TdgoqhqCJI+rWMqSV0ILEPuDOWs8udiyQWxx
 sH2ZlySeIe1rZzMf8Su9+G+vtD8FD/qEY7u0MZ1I99TYJt5NduAGCXfIKvQOSQtZoSBl8CjdI
 LVhu/7PaSa8R9AS9but6QZJgviVOXFCAQzgm2+R0QymhmJowCesZfSm8BZOz1H7y6V8RhzjF0
 6dNcOjDbiIYd7nbcyi2d1P7yjJEeP61aAkco7pokDAuF85wgCWpY4arS5d3WEBGr12Z4T8jtm
 VmsAgznOXCP/w1Wj/DLhrIrg7OeNe1APzBrA/Hg6MfPdAQ7dOZ2T/GJVjr18WWlS3ws+8oS3y
 hDywhfNMeSAaurXYvzTQdDvua+9gyvX5wNT0ke+HNpRfUoDIcGSS2M2yw7yyD773gaMTcgF/u
 vRAi9SSdd/9P3j1w0TdEeYFMLq86eKWXu8sDukEqtQRm34ULJMh91MkL6VkCnjIdp3x4GY/gS
 QuDXRMpxB/AXYCwTJgQf7fU+e1iMisj7DPLbSs2jF8OjnGfWW1AoTt70NBVs7jdwGXv1ywOgJ
 XWT12tdshZKIJRpDI6wg57SpwDw8N9S48Q06XdREsZ3jzrgxy2kpaxTgHrhet62mxmEkABNst
 A2H3fpCLG3MAFl57NBb1xh4GAvK0GF4VQVZKRi1x/HsNsRu6HM=
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Arnd Bergmann <arnd@arndb.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 alpha <linux-alpha@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-serial <linux-serial@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Matt Turner <mattst88@gmail.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 4, 2022 at 9:20 AM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> Many archs have termbits.h as octal numbers. It makes hard for humans
> to parse the magnitude of large numbers correctly and to compare with
> hex ones of the same define.
>
> Convert octal values to hex.
>
> First step is an automated conversion with:
>
> for i in $(git ls-files | grep 'termbits\.h'); do
>         awk --non-decimal-data '/^#define\s+[A-Z][A-Z0-9]*\s+0[0-9]/ {
>                 l=3Dint(((length($3) - 1) * 3 + 3) / 4);
>                 repl =3D sprintf("0x%0" l "x", $3);
>                 print gensub(/[^[:blank:]]+/, repl, 3);
>                 next} {print}' $i > $i~;
>         mv $i~ $i;
> done
>
> On top of that, some manual processing on alignment and number of zeros.
> In addition, small tweaks to formatting of a few comments on the same
> lines.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Good idea!

I assume you already checked if additional file contents can be shared acro=
ss
architectures? I think I've tried in the past but didn't really get
anywhere with
that.

After applying the patch locally, I still see a bunch of whitespace
differences in the
changed lines if I run

vimdiff arch/*/include/uapi/asm/termbits.h include/uapi/asm-generic/termbit=
s.h

I think this mostly because you left the sparc version alone (it already
uses hex constants), but it may be nice to edit this a little more to
make the actual differences stick out more.

> I prefer this to go in though Greg's tty tree.

Acked-by: Arnd Bergmann <arnd@arndb.de>
