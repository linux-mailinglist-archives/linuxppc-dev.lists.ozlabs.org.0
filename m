Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AED91A23BE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 16:05:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y5dR2mfYzDqTw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 00:05:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y4jK6qcszDr1X
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 23:23:32 +1000 (AEST)
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M3DaN-1jIbuP2Xq1-003dhP for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Apr
 2020 15:23:28 +0200
Received: by mail-qk1-f170.google.com with SMTP id i186so35887qke.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Apr 2020 06:23:27 -0700 (PDT)
X-Gm-Message-State: AGi0PuYVLov0hnmFPXAXvHO5O4H21Z/z1slH4E2OSKc2r37CqZOtfnSI
 ofVqT6Mh/CX5UJMQqGXBIYuvhM4bZmW21fdWgQ0=
X-Google-Smtp-Source: APiQypIZqfyiKAf9iZweRfXbeG68flo58OpjYYdhdvQ5GWYcHF1GFWr0NIasaAFWu9U3CGPPywhiTEL6NA5dmjZoqSM=
X-Received: by 2002:a37:2714:: with SMTP id n20mr7421082qkn.138.1586352205739; 
 Wed, 08 Apr 2020 06:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
 <87mu7xum41.fsf@mpe.ellerman.id.au>
 <bac9af641140cf6df04e3532589a11c2f3bccd2f.camel@kernel.crashing.org>
 <87pncprwp9.fsf@mpe.ellerman.id.au>
 <5782f9a42ad8acd8b234fa9c15a09db93552dc6b.camel@kernel.crashing.org>
 <871roykwu6.fsf@mpe.ellerman.id.au>
In-Reply-To: <871roykwu6.fsf@mpe.ellerman.id.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Apr 2020 15:23:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1XmeeP7FKfNwXZO8cXyJ_U_Jr0kjOaGZ6F=7OcoZ+0nw@mail.gmail.com>
Message-ID: <CAK8P3a1XmeeP7FKfNwXZO8cXyJ_U_Jr0kjOaGZ6F=7OcoZ+0nw@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:cMgpfGcOSw2hDnJzu9BPXlBI6hZvgWLv/TjW+2diD9Qb49OzesU
 QTnuNSTBNkqC2dtlnlYwSfDtmqNfJp7Mb8GAEf7UZdjBVs2ZCl/N0irDI9bMtaZj3AVbF/o
 9+A6N4mNQpsmdlJQRm/t0BYdA6GrmDc6AqAkAZzrrWm4wCELMgMy4nFEFJKiDySBnawt/6W
 eGEZPy/9K+/6k/nNgtDoA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bBPm2irOLms=:8BCOaX7kVE+piU8UkzU4Ju
 oeFIH5iS7SmPqhA4eH/61cU3h9OKsFYcoMwdsZtTDDVn9RD5pltZ3NOk8M30jU1naQkr60pd5
 iEruSpNo0GXTapR8XI3XuGu1lu9P1/mUHdz79ypZcehyHtf3KAXgbJpbKkSljv3jRFOYQboN1
 KOywvZykHq572uLFOb/3Tcdmd0+ny4W4pR16sJC8CWZyG8v45mn2rBOAk1zv+jryMNWltfKOv
 Yc2bD9aBRLaGCgzza9lndWeIhMs0aswZQ0atYinNiven4sBlTtage6jjCUgvtZjvfmJKAgxai
 hWbUxH4L1pTY1ItxatVcR4mlo6YxXIjVgN51PfMn5mNBhyxDwhUexP8fnrF3AOd/5wBc/7UJ9
 /7eV2QYp+e+OjVUdu0IrSsApgw0DFpJNoj72A0tTjWqMojfHyi/44+cVbfsAYk6sYPUudZt1H
 DmM8n1v8yCqYZXpUMX+AG4o3q4fudwGlNwVZ3HXsm02ntm7Et3iYqYDD6DPTWWSaQDkMNyPc7
 KWSJHkvYFg1/ed7YH7jjRTjEkbGKDIhjTObuJh25gdVzNiw7sVYL3zZENZjCzfwXxiz65OwL4
 CxptArVSQqvgG12xhSgRxoQV1UEnefCH2sFqTkyaXLIpkDQAkz55InFphH0F6g5sGnEEERr5e
 oIQ79rs4LCtDbGZm82BOEidQUm6IWI5+ryVjoUmBGnuo4PH58RATVUxUoC13wvcvPu9DQRXJz
 hx+ZeeqwE3B+DFarkIwcfuDYIooqejuHQR42JxeCwfBXJSgIkDS0577mk/WxDk9bgYpiBXBeb
 qEACqQn/bLp5HnyG1JXuJGQlGzdk+Tk/cJM46tmDL8bxzSg8Ts=
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Leonardo Bras <leonardo@linux.ibm.com>, DTML <devicetree@vger.kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>, Michal Simek <monstr@monstr.eu>,
 Wei Hu <weh@microsoft.com>, Christian Lamparter <chunkeey@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+On Wed, Apr 8, 2020 at 2:04 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
> > On Fri, 2020-04-03 at 15:59 +1100, Michael Ellerman wrote:
> >> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
> > IBM still put 40x cores inside POWER chips no ?
>
> Oh yeah that's true. I guess most folks don't know that, or that they
> run RHEL on them.

Is there a reason for not having those dts files in mainline then?
If nothing else, it would document what machines are still being
used with future kernels.

Also, if that's the only 405 based product that is still relevant with
a 5.7+ kernel, it may be useful to know at which point they
move to a 476 core and stop updating kernels on the old ones.

          Arnd
