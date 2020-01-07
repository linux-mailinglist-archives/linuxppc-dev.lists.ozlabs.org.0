Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDF5132D11
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 18:32:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sfb44JwzzDqSh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 04:32:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sf5g13S1zDqLt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 04:10:30 +1100 (AEDT)
Received: from mail-qv1-f48.google.com ([209.85.219.48]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MuluN-1jgQQj34eR-00rrKe for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan
 2020 18:10:26 +0100
Received: by mail-qv1-f48.google.com with SMTP id l14so145129qvu.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2020 09:10:25 -0800 (PST)
X-Gm-Message-State: APjAAAW4ndDpsrzrsL2xekmjRVlCD/zJo4QFERKtBh6tio3ZCm+MRnEQ
 nRwCnEXO5y0KxRhzvLONdK9iNvOp6cHkg3GnGJk=
X-Google-Smtp-Source: APXvYqxwO5AyDQus85+IK5BIt7KfSsh7NvpnQb9bzWV5OgyrFYMfLh14xqWUd9CW/X7TSfP34I+W9RVMaa5KUvf/Vb8=
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr365813qvg.197.1578417023930; 
 Tue, 07 Jan 2020 09:10:23 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <1578415992-24054-9-git-send-email-krzk@kernel.org>
In-Reply-To: <1578415992-24054-9-git-send-email-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jan 2020 18:10:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1RibnRU6SiVjrOy-q+ZDdKacQgD9mrft_aHMgA9hm3PA@mail.gmail.com>
Message-ID: <CAK8P3a1RibnRU6SiVjrOy-q+ZDdKacQgD9mrft_aHMgA9hm3PA@mail.gmail.com>
Subject: Re: [RFT 06/13] arc: Constify ioreadX() iomem argument (as in generic
 implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:rLgxK+XwwobzkJ6cqUjcXz1KHRkqvZ4JN+MqFY1h21G5DKpM7dK
 TfuCp50JOgPGf+gug4ujWdjksmQ4IzVBxbzmct57VVAC0PH866GcQ8FQRnoQALgx8NB4ofT
 HT4+1QY025ZWGbrQcCtBQSKTjDbZDat63M/DJ0tzAj02zX4ExIDdPFCDRkvry9k2bQ/eez6
 /Vvjw6r4WWuPLsS3Z6RAw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YC0wLCCEUj4=:LaK9vXcuk6Yd3BRtn02e1A
 kfIUWV2d00nuJYiJaFIWgRuaUjJzg7JqYh5ZLLB1hnJa0nGC0gYS3bu84hgpqfvT3OPKXr/fc
 TFnVKxxe9x/vC4whlQ3iUH7rKx/wzt9xo/UtGCSxQtmsML6Q42kgw8ysUNy9AUBUnppUiLuwR
 kZ6hrxh4A5iXowSY30YhtU13DaAjFgOF3rqBETCtD0WhBLIbQZko1hrwKhP2ysuHTSohT9RJH
 T5Uf4f8bfVmEpSuSJVtbGv3Hf2SSuw7Nl/K6CoQcnNTGPS5/q4sVb2kxufB0GYcCBoQgNwy2l
 coY9dQZcE//CNprOnYO4Vy0Dwh8O+bnf+mdr8ByiGfwZA0iu1RNWH3FrkGN+nlnRs9W5Dc+5e
 2jctSfUIk5lgL5vZ8uYda7/TAMQEv4HmUuGjMGG24gAW35KNqPB+YnT/DCVyPg2kA9YqzIV7g
 CNivu9xjcoIvSEbWPfe0zbIpxNiWwy6pwLOvLZCqZoHmlD+lrhznzss56ofieexdXUDHaz+Hm
 /I/9t3r7hOL5A9gUTZBajdfUM70i1m0ZDNW4NAXXQMyzR2/ZAfGXTa8TrYSu7D9PWvYHPEp2n
 7Fc7o8Kx34rOUIvvEqeYTZCyjmXntsg8pcr4LJLC3ITbgjvDHgvJznkZ8dWVh8C3I457ZLdVH
 xnHtV29VmFPnGwXy8qiy63AzJCBnOZ7GFzTdj//5zaI3DI1r3cNS5RVYxmc2qmhmQFSPjceZZ
 gH/Fbd4ddiZBOtRGyCJL8BYVLaD5fDpYFgdfgwkU4tYDc5Jsy8cvq2jOY7wxh59JCgy7bkqAJ
 Q6ZEMicSO4EPi0yyWXbaeUnOhg0NrBbQRWKd6lXAbPpKnHk7xlbXhNDIhNkhpn12JWUZBs8fp
 SnJP9aCvkpaKUhgDQzzw==
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Networking <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 7, 2020 at 5:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The ioreadX() helpers have inconsistent interface.  On some architectures
> void *__iomem address argument is a pointer to const, on some not.
>
> Implementations of ioreadX() do not modify the memory under the
> address so they can be converted to a "const" version for const-safety
> and consistency among architectures.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

The patch looks correct, but I would not bother here, as it has no
effect on the compiler or its output.

      Arnd
