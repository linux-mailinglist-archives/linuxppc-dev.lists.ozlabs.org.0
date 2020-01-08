Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26050134E28
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 21:57:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tM4T6KmjzDqX7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 07:56:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.24; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tM1S2Kk2zDqLc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 07:54:18 +1100 (AEDT)
Received: from mail-qv1-f51.google.com ([209.85.219.51]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N5W4y-1jmGwI4BvW-0170BC for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan
 2020 21:54:13 +0100
Received: by mail-qv1-f51.google.com with SMTP id n8so2023840qvg.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 12:54:12 -0800 (PST)
X-Gm-Message-State: APjAAAXsVJ7YdokG8h94awkmxn3Uz/y1Oiu0VsmYSHT+m3hc14YUH9SN
 7b0M+GUkEF6Sws+bElT5bmvLn0YOu2I5sNgEexM=
X-Google-Smtp-Source: APXvYqyt7qWPMbb6m9h/4PQhRs0y159Kx6Uivm6Z+B5Q5nxhhZUKK+jBierZEh41gZgxiLkvgkWmKuzOcUQAJHTJ9Lg=
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr5946876qvg.197.1578516850954; 
 Wed, 08 Jan 2020 12:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20200108200528.4614-1-krzk@kernel.org>
 <20200108200528.4614-2-krzk@kernel.org>
In-Reply-To: <20200108200528.4614-2-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jan 2020 21:53:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2ieH2G5GJvWMev39QkmSFvWSb0sYZ_0L5McR6AZFiayA@mail.gmail.com>
Message-ID: <CAK8P3a2ieH2G5GJvWMev39QkmSFvWSb0sYZ_0L5McR6AZFiayA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] iomap: Constify ioreadX() iomem argument (as in
 generic implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:IroyaXRwMauaan5tLZFalvD17u+uq8D1JRNVDJZHFK5JqPFfbLl
 oToDLHuejccAhcHKrySHpsFsETtYc9F1ce9j+jDxyte28dk7k30wyB2UZd0HHZh5nusVThC
 BcENIVY6t4VrEVaRrD3GdfkoqyFuXWD5IwqNezQ9J+NlwVYFeG9moEKVB44Q2ctV2iYpiBu
 R536SFUMi/1htuV3xvnow==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WLFxhH0K7qM=:3jY2zBZOk8OrOUZZwiP1y5
 wYvo8yN+EiaQXlsczZ/Q3SfZwFpsRWTz+IOHCB8jr+NaR2F1ldpB2y6Q7HZ5TzQEI/on6Kpcl
 6XWraIIUrE/iFAmnfuw5j0NL3Nnm1X2a1KqilDUJqIV3Gk40yEYmhAHt331B3Jc3+KGNvuiol
 J8LCYw8nZnJ1lYURjYXd7T8PCaHoAonCK6AUKJPcGEwdVFxLIiiTYAJieY/MlPFgcMsqwXc5H
 4/vHGbapfzWmoJxhliXQ3eDrgM0wJj46TGU6hpw6mxszypGn9W8pophU5pOU/0uXvR5rTwb/C
 Lvv9BOVbUtbCMANXhOGKcns6dntL1+R5RtebN+hWPV1XsW4bItOwuTk/gHpoXqU7oJGvyd8jf
 F7Mv9lJP4l05uer/rx2BDPkv8YFoSQnQ5uZqq7r/XYc+cCs+6E8vBmL0t9GnXI3290EPk3XY3
 6oei7abXxnDYOYZUuZBCJiXX30MmKXRvhZHLR3HknCPDeO60YMVH5tFbdJjIfIfsR/KglTxg2
 yzn0hg0eqCfmq3ZbRyfAmBSm6jgx3J5DHi4pLhiqhMz/Ffi1PKkKh2Cb1d4zcr3TBX9i27FON
 HBmRX4tQnlG9170dPY39NYtwXmc5ik4Njud3gegPLKTM37km0IEq5Ua3H3RjImLVUV218mLL9
 6QlaozCzxX7H7eLRO44YTLF8cTykeXqheZW/Zr9yVrCTfx2YvnfIODUEQtC6eVssorFi0LhUJ
 BS83nc2wT1S1xV7WODWvrhE2H1S3TAGoWovyRS1FEB42kFmIMY5aQ/DpSsF5cs59+lBxIYVc3
 0BCsnMmhlOvV4eIqFhNpcBQhaDtlDdnpYz2Fn85LqGUkYCAKNBzB/NRaezbM2sSAUtZUe12r7
 35ayovkPoduFHA3KaTyw==
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Networking <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
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
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 8, 2020 at 9:05 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The ioreadX() and ioreadX_rep() helpers have inconsistent interface.  On
> some architectures void *__iomem address argument is a pointer to const,
> on some not.
>
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for getting this done!

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> Changes since v1:
> 1. Constify also ioreadX_rep() and mmio_insX(),
> 2. Squash lib+alpha+powerpc+parisc+sh into one patch for bisectability,

The alpha and parisc versions should be independent, I was thinking
you leave them as separate patches, but this work for me too.

I have no real opinion on the other 8 patches, I would have left
them out completely, but they don't hurt either.

         Arnd
