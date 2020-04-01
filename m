Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A15B919B76C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 23:09:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48szMt0GDSzDr2l
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 08:09:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48szL70YkbzDqvx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 08:07:41 +1100 (AEDT)
Received: from mail-qt1-f177.google.com ([209.85.160.177]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MrPRB-1ix7Pz1IEJ-00oWOP for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr
 2020 23:07:36 +0200
Received: by mail-qt1-f177.google.com with SMTP id a5so1440735qtw.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 14:07:35 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0BircpM2S7Ny3Ttn0RXmxJedet5grxzH1UrzAYJBokZmbR1YXG
 1xZnzyCBNX5DPU9oVGR7K0ZSncQ+0YfDELydTho=
X-Google-Smtp-Source: APiQypK2VxbgsBQWN5zZRldfRvjgPaI6APWLNh/n01B0qErpj4ZP7Mfk8XFNqdw3+ssCzEIWikyHqTkJEucg147IwkM=
X-Received: by 2002:a37:d85:: with SMTP id 127mr236136qkn.3.1585775253692;
 Wed, 01 Apr 2020 14:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
 <87mu7xum41.fsf@mpe.ellerman.id.au>
 <11765c82-bf1a-466c-760d-f9a4c4d1d5f1@c-s.fr>
 <20200331175123.GV22482@gate.crashing.org>
In-Reply-To: <20200331175123.GV22482@gate.crashing.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 1 Apr 2020 23:07:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a34Tw+bH9bCBQ9HeDo4m4RE67fNOyL8cfUf-i09ur8seg@mail.gmail.com>
Message-ID: <CAK8P3a34Tw+bH9bCBQ9HeDo4m4RE67fNOyL8cfUf-i09ur8seg@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Segher Boessenkool <segher@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:lp+Vra5F+SMwPTRmveqo18mTMSrtzsAf3BdnmlMrX4TPLVHTkdz
 Td7cT5TFvItnULo5yQgibciPaoR3EU6/V6VfLtWkJlZCdMQgYpcZvVBu0yKoiSCBOKb5AVe
 GfLZ15apBmX05HmWPMI5OBlGoTIyWmbTx5+w3eHj94XNePPOw2yvvL9eU5uv5V67LlAteHM
 fFE6X5X6GkILU+3lWxGIA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tgz/ccKOmbY=:93UExe1+4kwlfoRe9w8nk3
 +RuoPKiVmIiBRRtY05upOCKuR0xujUHSbNXEpNqhGR3AxsiIse6JtbUQdDugUT1W3mbu113GH
 VMxx8cCwD6vcOPK5TZ79NwGi/AoNZ/FqYHq7iMlkMY51IR29fBZzSthvp8Em5xLhGFRklqPaZ
 3+D/FGjorVBHqUcZbfKR8ccgv0o/pTcAWgdLS0Ehc1/NeceJE6711sDjErk/bK4rZtOzpb+9H
 D4ZIc9/RTQK7gCZunnw4yHj/JGVLVB/09Y8xdfT//QQK/UYh7BMv7lKggQDxkp2GWQqgnyZIA
 U1y1JqbTPm5s3cUHbr73ouR7ZDY6FMsehOifxaD2oo5AWZ/zL7RxNXWoGa+2BPc/JzSNZup1E
 vQRCMVXrkypb9lIwP0xEP96k6zSj43cFDB98JVJFoA7ZCdVaWJ0tGixasWRcUzq2RT8Xaw+9t
 hQ3YCjp0vd93UCoM06mSiuo0BNzlXtkxySxc3l8qrLKzBD+8YPPdXFSzhz62FGhiEWZksBO4V
 h2U+ERLZWYoAKy4xdBMzrxQIolc+QvOMkQUXiG49QKKF1Nc+tdos4zZC20OgZUDX3qtNVRO4V
 boZNmmBOm45JGqddft11o1AV04KK0AIaV4RgzNTOiWJ8ZNZdvUDEWNRc0VeSQVE1zXLJKt49T
 sVpmXm5xbRSMT0rsnpiKQCkD63fh9xUPZjM/HFr/Qi4vck3XLgaoTIgYpZncEt+P/b2dbAK3d
 NsVkc5ZfVRuwU3wSbK9fD/MK/Tkzhiq2cU5Sp1dMTi5i9IC+4Og9jivht0PtfI+A3BIWR7xhv
 C+IxeFpKPY0H7IP3WzvxBfnBuyy/aWl3i+fznmxRtRPo3vFTj4=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
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
 Masahiro Yamada <masahiroy@kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Allison Randal <allison@lohutok.net>, Leonardo Bras <leonardo@linux.ibm.com>,
 DTML <devicetree@vger.kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Enrico Weigelt <info@metux.net>, Michal Simek <monstr@monstr.eu>,
 Wei Hu <weh@microsoft.com>, Christian Lamparter <chunkeey@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 31, 2020 at 7:51 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Tue, Mar 31, 2020 at 08:56:23AM +0200, Christophe Leroy wrote:
> > While we are at it, can we also remove the 601 ? This one is also full
> > of workarounds and diverges a bit from other 6xx.
> >
> > I'm unable to find its end of life date, but it was on the market in
> > 1994, so I guess it must be outdated by more than 10-15 yr old now ?
>
> There probably are still some people running Linux on 601 powermacs.

It could be marked as "BROKEN" for a year to find out for sure ;-)

Apparently there were only two or three models that are old enough to
have a 601 and new enough to run Linux with PCI and OF: 7200/8200
and 7500. These were sold for less than 18 months around 1996,
though one can still find them on eBay.

           Arnd
