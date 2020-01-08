Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 102C5133E20
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 10:17:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47t3Yc5GRXzDqPy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 20:17:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.67; helo=mail-ed1-f67.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47t3Wd21TlzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 20:15:56 +1100 (AEDT)
Received: by mail-ed1-f67.google.com with SMTP id e10so1945701edv.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 01:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vfyps/IUL6/PJnjolCWEAdH26MAmNPDn2opwbDbnepg=;
 b=NDz6gdS1gyucTtkJEblQz/gZzUrXThFmwXKhpY9FY4qeeG+xpO2U9Si9t2sVH33wLB
 p6BOCwyNhXoaFgiE0G4gZvyOQvNfmGeH5wb66VaRRBQfSyh+Obq80X0CO6GrNTyFF92y
 KgAKdzAbd29fiyAbsXZI4xyABQnIwjbReyMhL6Lq3H/D1lF7qXzmYOrrV8AibgmC8R54
 +D4QzPKn+p5WxJOo0+BeszDd1vlHzDSEYi5u8SwqhQ4czPI7HHQ489NmuAdOyFDDOpub
 AjPQowe40Sa25sjDhY7xS5p0UQuIy/GAuZ0o4PjsRhIgqFhYpYCj8CPX5uwVgjQEubwM
 X04g==
X-Gm-Message-State: APjAAAVGAkHO0fSmuxu6a2A20o3OZ3+APt2rPM1PeNyXlPY/8Q51wwbl
 GpPkotHjuK1LQGV63U4vaHE=
X-Google-Smtp-Source: APXvYqwWgb4dfQDzLCQ3ihOQo6HGElfX4FRxgQVj5VsuPKdEU0cfakNWGRh627mzzt3wCzM621IKeg==
X-Received: by 2002:aa7:c4c8:: with SMTP id p8mr4353856edr.72.1578474953961;
 Wed, 08 Jan 2020 01:15:53 -0800 (PST)
Received: from pi3 ([194.230.155.149])
 by smtp.googlemail.com with ESMTPSA id y4sm54018edl.11.2020.01.08.01.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 01:15:53 -0800 (PST)
Date: Wed, 8 Jan 2020 10:15:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
Message-ID: <20200108091549.GB10145@pi3>
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
 <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
 <CAK8P3a21yPrmp4ik3Ei1BZfeqZNf0wL5NZNF3uXqb4FLRDyUPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAK8P3a21yPrmp4ik3Ei1BZfeqZNf0wL5NZNF3uXqb4FLRDyUPw@mail.gmail.com>
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
 ML nouveau <nouveau@lists.freedesktop.org>, Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Jon Mason <jdmason@kudzu.us>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Daniel Vetter <daniel@ffwll.ch>, alpha <linux-alpha@vger.kernel.org>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 08, 2020 at 09:44:36AM +0100, Arnd Bergmann wrote:
> On Wed, Jan 8, 2020 at 9:36 AM Christophe Leroy <christophe.leroy@c-s.fr>=
 wrote:
> > Le 08/01/2020 =C3=A0 09:18, Krzysztof Kozlowski a =C3=A9crit :
> > > On Wed, 8 Jan 2020 at 09:13, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> > > I'll add to this one also changes to ioreadX_rep() and add another
> > > patch for volatile for reads and writes. I guess your review will be
> > > appreciated once more because of ioreadX_rep()
> > >
> >
> > volatile should really only be used where deemed necessary:
> >
> > https://www.kernel.org/doc/html/latest/process/volatile-considered-harm=
ful.html
> >
> > It is said: " ...  accessor functions might use volatile on
> > architectures where direct I/O memory access does work. Essentially,
> > each accessor call becomes a little critical section on its own and
> > ensures that the access happens as expected by the programmer."
>=20
> The I/O accessors are one of the few places in which 'volatile' generally
> makes sense, at least for the implementations that do a plain pointer
> dereference (probably none of the ones in question here).
>=20
> In case of readl/writel, this is what we do in asm-generic:
>=20
> static inline u32 __raw_readl(const volatile void __iomem *addr)
> {
>         return *(const volatile u32 __force *)addr;
> }

SuperH is another example:
1. ioread8_rep(void __iomem *addr, void *dst, unsigned long count)
   calls mmio_insb()

2. static inline void mmio_insb(void __iomem *addr, u8 *dst, int count)
   calls __raw_readb()

3. #define __raw_readb(a)          (__chk_io_ptr(a), *(volatile u8  __force=
 *)(a))

Even if interface was not marked as volatile, in fact its implementation
was casting to volatile.

> The __force-cast that removes the __iomem here also means that
> the 'volatile' keyword could be dropped from the argument list,
> as it has no real effect any more, but then there are a few drivers
> that mark their iomem pointers as either 'volatile void __iomem*' or
> (worse) 'volatile void *', so we keep it in the argument list to not
> add warnings for those drivers.
>=20
> It may be time to change these drivers to not use volatile for __iomem
> pointers, but that seems out of scope for what Krzysztof is trying
> to do. Ideally we would be consistent here though, either using volatile
> all the time or never.

Indeed. I guess there are no objections around const so let me send v2
for const only.

Best regards,
Krzysztof

