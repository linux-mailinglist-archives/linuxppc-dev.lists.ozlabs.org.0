Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8584416A66D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 13:50:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48R23J2F1vzDqWt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 23:50:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.65; helo=mail-ed1-f65.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48R20d55S1zDqWZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 23:47:52 +1100 (AEDT)
Received: by mail-ed1-f65.google.com with SMTP id r18so11763574edl.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 04:47:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6p1Rm/cgq3FqTcHGA+7QXUNsBMb6waSsaCWakkpOhMI=;
 b=N24RVWfl6A/3T78yCiiBzQHESXgpjDadr00KZxWd71MqOMm+M5rzxrFNJAuITKEh0u
 TF4ION2dGANSN/2G/XgXvyYKVIn8IwTSxwFSMKvBc2zDvctw2L7COndBQVDiIwaPQXgy
 krypz5uBopFEcSGTX7EdHcMT+wkrI8YVQmfepk4zFMaqjnSmxPE5wxM/lraP3T/bvAny
 zbo30xy4JjhuNUg4ep8RjQzynCjV/nK936ewfm41KRh9cTniLUCY+qtLS5JpQn8w7p3g
 VOCV8dlB4PD0Aery1a6op52H7ycykjdtcxsZIlyONhaP2Da4DeDn6Pgym0IVGamnb+DH
 TT0g==
X-Gm-Message-State: APjAAAVz914f5SyPlsmllMkAGuLP1p6JauMWfnQacRqjz4qWYoBFBX+C
 G+tzyQ/5X0goDPLyRAJPYC4=
X-Google-Smtp-Source: APXvYqxOCnjuqHzZ8w9dppB5X8CKpWu3LAO4qx3F7JuCo/1tjWWY0qRzHXx7PYmPGsjZ1wOThemeng==
X-Received: by 2002:a17:906:7fd0:: with SMTP id
 r16mr45290488ejs.319.1582548468870; 
 Mon, 24 Feb 2020 04:47:48 -0800 (PST)
Received: from pi3 ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id n19sm944550edy.9.2020.02.24.04.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 04:47:48 -0800 (PST)
Date: Mon, 24 Feb 2020 13:47:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: [RESEND PATCH v2 9/9] ath5k: Constify ioreadX() iomem argument
 (as in generic implementation)
Message-ID: <20200224124744.GA1949@pi3>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-10-krzk@kernel.org>
 <518a9023-f802-17b3-fca5-582400bc34ae@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <518a9023-f802-17b3-fca5-582400bc34ae@gmail.com>
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
Cc: Rich Felker <dalias@libc.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-arch@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Nick Kossifidis <mickflemm@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 20, 2020 at 10:48:33AM +0100, Jiri Slaby wrote:
> On 19. 02. 20, 18:50, Krzysztof Kozlowski wrote:
> > The ioreadX() helpers have inconsistent interface.  On some architectur=
es
> > void *__iomem address argument is a pointer to const, on some not.
> >=20
> > Implementations of ioreadX() do not modify the memory under the address
> > so they can be converted to a "const" version for const-safety and
> > consistency among architectures.
> >=20
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Acked-by: Kalle Valo <kvalo@codeaurora.org>
> > ---
> >  drivers/net/wireless/ath/ath5k/ahb.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/net/wireless/ath/ath5k/ahb.c b/drivers/net/wireles=
s/ath/ath5k/ahb.c
> > index 2c9cec8b53d9..8bd01df369fb 100644
> > --- a/drivers/net/wireless/ath/ath5k/ahb.c
> > +++ b/drivers/net/wireless/ath/ath5k/ahb.c
> > @@ -138,18 +138,18 @@ static int ath_ahb_probe(struct platform_device *=
pdev)
> > =20
> >  	if (bcfg->devid >=3D AR5K_SREV_AR2315_R6) {
> >  		/* Enable WMAC AHB arbitration */
> > -		reg =3D ioread32((void __iomem *) AR5K_AR2315_AHB_ARB_CTL);
> > +		reg =3D ioread32((const void __iomem *) AR5K_AR2315_AHB_ARB_CTL);
>=20
> While I understand why the parameter of ioread32 should be const, I
> don't see a reason for these casts on the users' side. What does it
> bring except longer code to read?

Because the argument is an int:

drivers/net/wireless/ath/ath5k/ahb.c: In function =E2=80=98ath_ahb_probe=E2=
=80=99:
drivers/net/wireless/ath/ath5k/ahb.c:141:18: warning: passing argument 1 of=
 =E2=80=98ioread32=E2=80=99 makes pointer from integer without a cast [-Win=
t-conversion]
   reg =3D ioread32(AR5K_AR2315_AHB_ARB_CTL);

Best regards,
Krzysztof

