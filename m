Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E14A619580E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 14:31:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pjRR63ZxzDqTy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 00:30:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.13; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 98435 seconds by postgrey-1.36 at bilbo;
 Sat, 28 Mar 2020 00:28:29 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pjNY4cPWzDrCP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 00:28:27 +1100 (AEDT)
Received: from mail-qt1-f177.google.com ([209.85.160.177]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MBUuP-1j5wrd3DXL-00D2Sc for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar
 2020 14:23:14 +0100
Received: by mail-qt1-f177.google.com with SMTP id z24so7221911qtu.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 06:23:14 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1WGVv3ajztV+zJT4R9siPWa4wHVinA4Rlnjege65uZhc9Ls3Te
 pD5gzUCBcvCx9jFHO79CqYhcH+HG8+lAfDzu+VY=
X-Google-Smtp-Source: ADFU+vulNA+7BxZ8KynFjYc9GnYqAH2MuhhxSGrAnAMTyGPWxL6I9KWAa8nLPHSfN4FBnPkXk6FuMsvBVm3MWAXJwGU=
X-Received: by 2002:a37:6455:: with SMTP id y82mr14033725qkb.286.1585315392272; 
 Fri, 27 Mar 2020 06:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
In-Reply-To: <20200327131531.GU1922688@smile.fi.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 27 Mar 2020 14:22:55 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
Message-ID: <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:1/uBEKWHFP1NbKvzz3CT0rDAjnZBfg2lrR5klQFExcC8SJjo3Vb
 wX9pr+WmdZYCK6Ip2dBU9mpuPAkJSB8uh1hWaaPl+KcVd6woN3ougzfB380+vf2f7A5/WAR
 pnki06tZRfUHJEwdzL6VK3kUu5L3NZcR/c5ZZb8OnAk3LV3xKuBklaWohvmKG6o7DbFN/7f
 cFet74QHpHYbRWfsnBx7w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JRHLibNcsXk=:ZBR4qdDU9jqsFz2eLykUUr
 kzN12gg3APN2h8J76ithOPKU1+BszlXmfxSuEM7mTw6lnfinwKIsuCDGrJz4v+oOvchGYfV7Q
 fPrYcpaFGElgh8i/9ei1UWJG3fnnds0Mzlk8X+tajUAbJK+awDCljcBgy7EpBsVpFaGKbppmf
 yaC08PmR4BcMMeBQ9Tryrb22vhcm+8HETZMVduHhVuv73M2KsqiEGNPxhtV+qCBFB04fA/sXI
 Mmb6p8aYUfmHWkRRLPRzrxJFqmSqpvHadV6h7mOVHWeBVAVjyzl1NqMNV08TozKMwozN81NlX
 7PAjG4Oic7KzgUrHdudg5b8MVe4JoA4eSM3jLMEbspe8vCUtQdJetdluBFE8DGS31SKMlYyFL
 V9KeE8av1b81fWd/mwNaA/bLU7zp1UiviWORCq0zt7SRYNrcDd3WEQo9I/uhr08UkjcWUX6++
 YDHFu9DP7CU1EbjgQUTk2+lJswv+US2m3vlXZqZ/Ai3E6e5ZH22fmimNa7IdkDKT3RIoO0Zp8
 zZGyS1TL9/t8TNQveRnJe0bUbm3JcX2NUPDycyPFKtQnImQ11DA5yf4P/sK8BW8eaXYFk+a5p
 R/DO7XTSWBsHplSUDcb1p2CMNEFJxeWRQM2Mq0Fmfy3Vjk9pyaV9s5ISLELRlo6vx1GX0Nkys
 fRHu+44WiRnXW4JemxYqsTVSdeu60aWO2Ci4Q8J2rAcgi1R45gjea5gEHrPlXPohCEqRkmj2v
 9tRv0RPAjBsgUoLKk1VcsgT19XkFS+xRnLBmOf9GsTbVQv7bouKwEJele5fzJCZAEBgKsPs/9
 uyXfwKFPgqVAUBBuqekU1PC2Oz31UqDwu38M9kjYherbko76tY=
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
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Michal Simek <monstr@monstr.eu>, Wei Hu <weh@microsoft.com>,
 Christian Lamparter <chunkeey@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 27, 2020 at 2:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Fri, Mar 27, 2020 at 03:10:26PM +0200, Andy Shevchenko wrote:
> > On Fri, Mar 27, 2020 at 01:54:33PM +0100, Arnd Bergmann wrote:
> > > On Fri, Mar 27, 2020 at 1:12 PM Michal Simek <michal.simek@xilinx.com> wrote:
> > > >
> > > > recently we wanted to update xilinx intc driver and we found that function
> > > > which we wanted to remove is still wired by ancient Xilinx PowerPC
> > > > platforms. Here is the thread about it.
> > > > https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com/
> > > >
> > > > I have been talking about it internally and there is no interest in these
> > > > platforms and it is also orphan for quite a long time. None is really
> > > > running/testing these platforms regularly that's why I think it makes sense
> > > > to remove them also with drivers which are specific to this platform.
> > > >
> > > > U-Boot support was removed in 2017 without anybody complain about it
> > > > https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c069821bbba10273a0a8ed
> > > >
> > > > Based on current ppc/next.
> > > >
> > > > If anyone has any objection about it, please let me know.
> > >
> > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > >
> > > This looks reasonable to me as well, in particular as the code only
> > > supports the two
> > > ppc44x virtex developer boards and no commercial products.
> > >
> > > It does raise a follow-up question about ppc40x though: is it time to
> > > retire all of it?
> >
> > Who knows?
> >
> > I have in possession nice WD My Book Live, based on this architecture, and I
> > won't it gone from modern kernel support. OTOH I understand that amount of real
> > users not too big.
>
> +Cc: Christian Lamparter, whom I owe for that WD box.

According to https://openwrt.org/toh/wd/mybooklive, that one is based on
APM82181/ppc464, so it is about several generations newer than what I
asked about (ppc40x).

> > Ah, and I have Amiga board, but that one is being used only for testing, so,
> > I don't care much.

I think there are a couple of ppc440 based Amiga boards, but again, not 405
to my knowledge.

      Arnd
