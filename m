Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F861A1BE8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 08:30:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xvXz6TCzzDqNX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 16:30:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.195;
 helo=mail-oi1-f195.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xvWB3l0DzDqHk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 16:29:08 +1000 (AEST)
Received: by mail-oi1-f195.google.com with SMTP id d3so3795450oic.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 23:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BZyxSe1F9CEekbeEkcnl4DCUrszNmMjMax7bRV4fmFk=;
 b=tRHRJltMnir4M35U8Gje+7+/MeV6wm1AgBSaDXGg6pW7sPdjRnYudLM15DJ4L9mHHF
 I2+Q0EqEYVbPH2HOOel0u1m70GLliriTGZTUG/luvAS1kfjr3YkWk1EqvkQxRv1w3Avf
 9Ul3uHdMLg5+ys7uZCfVrXWCIqK7MHlz0kOrdJWtewGSDA5PoIOLDGNqLMamkZQ32pvD
 TytNO5ZmADC5nGY0oT42SxeGOKLRjyxlGfNSCxvxPwOQWAyuPAOG8Ci+JiCitnwN56xh
 EcuM/09QnvO0iSzImFfhSdCwkL8fKEdwFh1EFcyVhbA4SSpcYe4q+Wmah7XDrp7KmUeb
 oipQ==
X-Gm-Message-State: AGi0PuZ4PLQqfOZ5iyIKxslp9KfCc8PyJ6jya/UC1ITgp25akhJ5cETB
 rA/LAXaSoMR1+zRd9vP/N9OAUx1EehosXAU8HCk=
X-Google-Smtp-Source: APiQypL2H0+76KoauaUo4b9NNZhymcHNW+vj4EBMTBKwnkZS2xjRBEdU1EaFq/Qm0sL2SKQ6wSNTquXtK4QZ4u2dRx0=
X-Received: by 2002:aca:ac09:: with SMTP id v9mr497636oie.148.1586327345628;
 Tue, 07 Apr 2020 23:29:05 -0700 (PDT)
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
In-Reply-To: <5782f9a42ad8acd8b234fa9c15a09db93552dc6b.camel@kernel.crashing.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2020 08:28:54 +0200
Message-ID: <CAMuHMdUkwy8GkXrud2EjUvu8nWn=y=RDXk3b6YK0=NMkPWgVEg@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
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
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
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

Hi Ben,

On Wed, Apr 8, 2020 at 1:34 AM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Fri, 2020-04-03 at 15:59 +1100, Michael Ellerman wrote:
> > Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
> > > On Tue, 2020-03-31 at 16:30 +1100, Michael Ellerman wrote:
> > > > I have no attachment to 40x, and I'd certainly be happy to have
> > > > less
> > > > code in the tree, we struggle to keep even the modern platforms
> > > > well
> > > > maintained.
> > > >
> > > > At the same time I don't want to render anyone's hardware
> > > > obsolete
> > > > unnecessarily. But if there's really no one using 40x then we
> > > > should
> > > > remove it, it could well be broken already.
> > > >
> > > > So I guess post a series to do the removal and we'll see if
> > > > anyone
> > > > speaks up.
> > >
> > > We shouldn't remove 40x completely. Just remove the Xilinx 405
> > > stuff.
> >
> > Congratulations on becoming the 40x maintainer!
>
> Didn't I give you my last 40x system ? :-) IBM still put 40x cores
> inside POWER chips no ?

Good to know!

Are they still big-endian, or have they been corrupted by the LE frenzy,
too? ;)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
