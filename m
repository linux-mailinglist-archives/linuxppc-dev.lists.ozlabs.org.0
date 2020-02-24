Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA3816A8BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 15:46:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48R4cm5zPhzDqVR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 01:46:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.66; helo=mail-ed1-f66.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48R4Zw3s3fzDqMx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 01:44:22 +1100 (AEDT)
Received: by mail-ed1-f66.google.com with SMTP id r18so12183653edl.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 06:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9BiQIzqw1g4Lc7fCMo41b2Sms1ZkrHji7czRtN4yRpY=;
 b=hsdftQS6Lnl9R6n8mXB0GnzAK7/Yt6Nzg5eXgWzzsVOhH0M7uZbbZ6Hdru1T4wUOnf
 h9H0vd6agDEn6RHNrtSkwonrIwV/m0RUx+/5B8W8vmnTeqHuMB0wsrN8VL9ldYRjL2jC
 bEFBtdBwYn1AYh5A15F2D1/JDiosew4V7+xcLKD9PS0qaq3puQu/DYibavpafhjfeniq
 ef7Vf6rd67FLz/GeSqsVpJLMyww1XSNzS8C5QEzgKwMiVyEgfvA+KrCjbDvEJa1WC/mw
 6NoKEPNSiPceJd0d54fkh/6HExpu6yV9WhpsJUufFjTOAZwlXYIzs54SRUMLpCX2ySAw
 TEqw==
X-Gm-Message-State: APjAAAX1VOj0Dwyit/PUoSuoiW244n2nZEbruD+6gwr5ZT8CCFyZ5tOd
 W73OXMkF3rkB2jZuGyFA94g=
X-Google-Smtp-Source: APXvYqzwji2Ykgei/T3ukpc15pByx2S09B2SSkaAFB5FVLPyRnARm/VtcP3TWvca57zCxPIFcvsdrw==
X-Received: by 2002:a17:906:5604:: with SMTP id
 f4mr47998768ejq.255.1582555459077; 
 Mon, 24 Feb 2020 06:44:19 -0800 (PST)
Received: from pi3 ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id a10sm961255edt.50.2020.02.24.06.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 06:44:17 -0800 (PST)
Date: Mon, 24 Feb 2020 15:44:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RESEND PATCH v2 9/9] ath5k: Constify ioreadX() iomem argument
 (as in generic implementation)
Message-ID: <20200224144413.GA2054@pi3>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-10-krzk@kernel.org>
 <518a9023-f802-17b3-fca5-582400bc34ae@gmail.com>
 <20200224124744.GA1949@pi3>
 <CAMuHMdVev0PLF=8bD3nHrhcU9UgM-DAgdQpXi09PgvAxdbt24A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdVev0PLF=8bD3nHrhcU9UgM-DAgdQpXi09PgvAxdbt24A@mail.gmail.com>
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
 Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 24, 2020 at 01:54:00PM +0100, Geert Uytterhoeven wrote:
> Hi Krzysztof,
>=20
> On Mon, Feb 24, 2020 at 1:47 PM Krzysztof Kozlowski <krzk@kernel.org> wro=
te:
> > On Thu, Feb 20, 2020 at 10:48:33AM +0100, Jiri Slaby wrote:
> > > On 19. 02. 20, 18:50, Krzysztof Kozlowski wrote:
> > > > The ioreadX() helpers have inconsistent interface.  On some archite=
ctures
> > > > void *__iomem address argument is a pointer to const, on some not.
> > > >
> > > > Implementations of ioreadX() do not modify the memory under the add=
ress
> > > > so they can be converted to a "const" version for const-safety and
> > > > consistency among architectures.
> > > >
> > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > > Acked-by: Kalle Valo <kvalo@codeaurora.org>
> > > > ---
> > > >  drivers/net/wireless/ath/ath5k/ahb.c | 10 +++++-----
> > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/net/wireless/ath/ath5k/ahb.c b/drivers/net/wir=
eless/ath/ath5k/ahb.c
> > > > index 2c9cec8b53d9..8bd01df369fb 100644
> > > > --- a/drivers/net/wireless/ath/ath5k/ahb.c
> > > > +++ b/drivers/net/wireless/ath/ath5k/ahb.c
> > > > @@ -138,18 +138,18 @@ static int ath_ahb_probe(struct platform_devi=
ce *pdev)
> > > >
> > > >     if (bcfg->devid >=3D AR5K_SREV_AR2315_R6) {
> > > >             /* Enable WMAC AHB arbitration */
> > > > -           reg =3D ioread32((void __iomem *) AR5K_AR2315_AHB_ARB_C=
TL);
> > > > +           reg =3D ioread32((const void __iomem *) AR5K_AR2315_AHB=
_ARB_CTL);
> > >
> > > While I understand why the parameter of ioread32 should be const, I
> > > don't see a reason for these casts on the users' side. What does it
> > > bring except longer code to read?
> >
> > Because the argument is an int:
> >
> > drivers/net/wireless/ath/ath5k/ahb.c: In function =E2=80=98ath_ahb_prob=
e=E2=80=99:
> > drivers/net/wireless/ath/ath5k/ahb.c:141:18: warning: passing argument =
1 of =E2=80=98ioread32=E2=80=99 makes pointer from integer without a cast [=
-Wint-conversion]
> >    reg =3D ioread32(AR5K_AR2315_AHB_ARB_CTL);
>=20
> That's an argument for keeping the cast to "void __iomem *", not for
> adding the "const", right?

Yes, correct. Maybe I misunderstood the question... The const on the
other hand does not have to be in the cast. It is merely for making it
consistent with interface. It is not required. I also mentioned it in
the cover letter:
"PAtches 5-9 are optional cleanup, without actual impact"

Feel free to ignore this one if it is not worth the effort.

Best regards,
Krzysztof

