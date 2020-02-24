Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F33716A68C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 13:57:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48R2D06mbszDqGY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 23:57:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48R27s3fykzDqF5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 23:54:14 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id z9so8564670oth.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 04:54:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KuIMkn3CNjUmXT9na5O6u952ZSxUT8pEly8T96UQHaU=;
 b=fN7ViY1HadQ0Yu6xBK5D5KiDXYh0M2gO7yw34uZixelEVKGooRrwPHd4NoT3jmsZeB
 yFAzxQvhkin7bhk+gzbgG2vJbtHtCfyX1RXCz1/W1GzkcN68uqzc6AmK/SG/peiZH3gi
 5LOHH86HSDPg+OLQckAWIdY4glw5uSW84/RnvhhBJA8GLktXhwvPsfKvSds3thdvy+LA
 gs/8cY4m6oecBQRIxyGXNyhpjLzlSmV+B28oaNz/PKJPx/Ez/AXTpa+QgdpYRsQCthLv
 0MzKfMXvvf8QjDpeSXAk+aN3LElTLnAvvOtU3XTLgBBwk5JVbeYu5z/Z+9iZkKHWF7GQ
 sFHw==
X-Gm-Message-State: APjAAAWoOuUfaYsj6w2VQZEFEAx6YH7LlAWZclfnX1Zkuv5J587iijz6
 AA/OpFq2u9hUcRiNOyrreKfDySpp4hZNMW8wVs4=
X-Google-Smtp-Source: APXvYqwtZk2+zO66egcnUYHRtozVqcTMGUrrNpS9RZJQahGOv8qXCcCp9UcRypG9zsmrMsbFU1zCpBady1p1pO44v4k=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr40460889otm.297.1582548851139; 
 Mon, 24 Feb 2020 04:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-10-krzk@kernel.org>
 <518a9023-f802-17b3-fca5-582400bc34ae@gmail.com> <20200224124744.GA1949@pi3>
In-Reply-To: <20200224124744.GA1949@pi3>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Feb 2020 13:54:00 +0100
Message-ID: <CAMuHMdVev0PLF=8bD3nHrhcU9UgM-DAgdQpXi09PgvAxdbt24A@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 9/9] ath5k: Constify ioreadX() iomem argument
 (as in generic implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Krzysztof,

On Mon, Feb 24, 2020 at 1:47 PM Krzysztof Kozlowski <krzk@kernel.org> wrote=
:
> On Thu, Feb 20, 2020 at 10:48:33AM +0100, Jiri Slaby wrote:
> > On 19. 02. 20, 18:50, Krzysztof Kozlowski wrote:
> > > The ioreadX() helpers have inconsistent interface.  On some architect=
ures
> > > void *__iomem address argument is a pointer to const, on some not.
> > >
> > > Implementations of ioreadX() do not modify the memory under the addre=
ss
> > > so they can be converted to a "const" version for const-safety and
> > > consistency among architectures.
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > Acked-by: Kalle Valo <kvalo@codeaurora.org>
> > > ---
> > >  drivers/net/wireless/ath/ath5k/ahb.c | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/net/wireless/ath/ath5k/ahb.c b/drivers/net/wirel=
ess/ath/ath5k/ahb.c
> > > index 2c9cec8b53d9..8bd01df369fb 100644
> > > --- a/drivers/net/wireless/ath/ath5k/ahb.c
> > > +++ b/drivers/net/wireless/ath/ath5k/ahb.c
> > > @@ -138,18 +138,18 @@ static int ath_ahb_probe(struct platform_device=
 *pdev)
> > >
> > >     if (bcfg->devid >=3D AR5K_SREV_AR2315_R6) {
> > >             /* Enable WMAC AHB arbitration */
> > > -           reg =3D ioread32((void __iomem *) AR5K_AR2315_AHB_ARB_CTL=
);
> > > +           reg =3D ioread32((const void __iomem *) AR5K_AR2315_AHB_A=
RB_CTL);
> >
> > While I understand why the parameter of ioread32 should be const, I
> > don't see a reason for these casts on the users' side. What does it
> > bring except longer code to read?
>
> Because the argument is an int:
>
> drivers/net/wireless/ath/ath5k/ahb.c: In function =E2=80=98ath_ahb_probe=
=E2=80=99:
> drivers/net/wireless/ath/ath5k/ahb.c:141:18: warning: passing argument 1 =
of =E2=80=98ioread32=E2=80=99 makes pointer from integer without a cast [-W=
int-conversion]
>    reg =3D ioread32(AR5K_AR2315_AHB_ARB_CTL);

That's an argument for keeping the cast to "void __iomem *", not for
adding the "const", right?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
