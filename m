Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E889B19BFDF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 13:07:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tKzD5tFnzDq62
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 22:07:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 154838 seconds by postgrey-1.36 at bilbo;
 Thu, 02 Apr 2020 22:05:09 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tKwQ0xSczDrMc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 22:05:06 +1100 (AEDT)
Received: from mail-qk1-f176.google.com ([209.85.222.176]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mc02Z-1im0HJ0M0t-00dU7T for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr
 2020 13:05:02 +0200
Received: by mail-qk1-f176.google.com with SMTP id u4so3334111qkj.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 04:05:01 -0700 (PDT)
X-Gm-Message-State: AGi0PuaAvK5bHh1/eb2sc1KlCO2vPmZAIC82E5EMJohl1NSkT7yJCkyE
 chgcClU8b7ymeZcy0U0HLQjuo93OxJ/Q387rgWc=
X-Google-Smtp-Source: APiQypJsUlmA/o2DdIvGggdD9+ibIYF6moE63pjwvb5CKhqtgTpUSWQDa2hc05O2VxKKurX3JMWriCkgA7smRY8JaYo=
X-Received: by 2002:ac8:7292:: with SMTP id v18mr2220674qto.304.1585825499828; 
 Thu, 02 Apr 2020 04:04:59 -0700 (PDT)
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
 <CAK8P3a34Tw+bH9bCBQ9HeDo4m4RE67fNOyL8cfUf-i09ur8seg@mail.gmail.com>
In-Reply-To: <CAK8P3a34Tw+bH9bCBQ9HeDo4m4RE67fNOyL8cfUf-i09ur8seg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 2 Apr 2020 13:04:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2FJ+Pr_FfetWfJkWv8Z2BGuAmwr7DtoyrkmoHfpFgQVg@mail.gmail.com>
Message-ID: <CAK8P3a2FJ+Pr_FfetWfJkWv8Z2BGuAmwr7DtoyrkmoHfpFgQVg@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Segher Boessenkool <segher@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3BkzD3QDBXvm/r276LJ4XONeZ9UmIeUDj7clM/IAAI1cwdKVC1O
 J4pGwFoyb7lfSQr+FykxErZ3UViuCsYEf3TXTVIh3rjyehEXkKGMohPbGNDjLpUqeZZ983y
 +n5nV8sih4r21CEGQtFHCyMPMSyzi1To3KDzglPRtlfKOQ+OWlB5dxP1JLHidgitaUeDd6n
 E0grSgKOSsm8sXuT6mZOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:p37BSWoOJPQ=:TMZeUfVWvbRk9iZ8HQIXUb
 OBf7LFQzJrzUdPvFtPgzFy3BG8JxAxd+Ryq8YvBjdnK+0z6vojRYWZteNYi6gf8gVHdtyHJO7
 JoW9fX2S7iZ8Ad8WWjvSMvI3V8/U8HYVq4ZfxqBrSuWcDyRFQMA7FjpFKHsscXvXoYAmVcyP7
 EyrezPKEb4G/Vfj74oYqZJS0U0z49ycSfmKGLREoRJtTIsADG3hf/Nt+/zGI88Z7kuSCWbAjE
 hRTCISe17rGSvjadfV6DtAcHJoYuKlk8iRbItENP2XpdExs8hD4lsnh6i5DJgL8onc7fYRCle
 imSPx7+ScAFPldxR8nyGn8qplU2+5pK/XCIjTEajQ5naQ/HegwXwCv0e4bsE5HKYZbelROCxw
 e5ly6boPdiIfkDPJ41nZb6ni+rdyAPNjm9Q8HqCyJLtt3M6TEa81vgr0hkXKLtzdgWJSeiigg
 2rjWuZNDI7REsuBOA7QPfxb86M4T8eRKTrsp5lldJXiS7DQZbaY77qhAYJkUtKKQDsCjbIPCq
 KMFi6kPUQ9cZ66R2djIFXOUHzYapT0lRWzi0XWaupi99OgzXsk4BDlzG/c8ps9gx6LMATQs+G
 +m2czCmLeKa9s1kVNUCTYFbOpMIAaOrZMV+QIV+DSgK/KY/KQ/Azcw+QAAsOa1+SXIVIwhMlx
 7WXXCx1c/mxnAV3ZNfVTkOOW3sUPpJUsK6E6h+g1EfDxHRCQS9wY2YP+e8FucT9MfdtZPzbm0
 MCsJvD5qzneG4dCnzXZFqd5L2GmmJc0nkp2kH104XP1ittgRNasxEK5/6UskNajNOVsPPrV67
 m6vjjAL+vbouWNhRqLECdNAHCihrSlaZ+yOiN+PaTNp4hZwuAk=
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

On Wed, Apr 1, 2020 at 11:07 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Mar 31, 2020 at 7:51 PM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> >
> > On Tue, Mar 31, 2020 at 08:56:23AM +0200, Christophe Leroy wrote:
> > > While we are at it, can we also remove the 601 ? This one is also ful=
l
> > > of workarounds and diverges a bit from other 6xx.
> > >
> > > I'm unable to find its end of life date, but it was on the market in
> > > 1994, so I guess it must be outdated by more than 10-15 yr old now ?
> >
> > There probably are still some people running Linux on 601 powermacs.
>
> It could be marked as "BROKEN" for a year to find out for sure ;-)
>
> Apparently there were only two or three models that are old enough to
> have a 601 and new enough to run Linux with PCI and OF: 7200/8200
> and 7500. These were sold for less than 18 months around 1996,
> though one can still find them on eBay.

A. Wilcox said on IRC regarding 601 support in Ad=C3=A9lie Linux:

"right now we are primarily targeting G3, though 603 should be supported.
601/601e support is planned to be added for 2.0 (next year)."

      Arnd
