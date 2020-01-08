Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B824133DE3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 10:09:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47t3N35c9pzDqPl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 20:09:23 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47t3L43ZxFzDqNs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 20:07:39 +1100 (AEDT)
Received: by mail-ed1-f67.google.com with SMTP id cy15so1957210edb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 01:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0jRYcccy+K8+wcIcmevpt3CSwH1FRXDhvGLKKsO8/R8=;
 b=gBQkbGxfR0LmYNI/fs8mPbMXiJ3r9SSBMUBdKwiBOasStrAEIYIAB+7o1M6qItEwut
 JmQN0Ee0YW3d2YDAutf1MjP+V5VDuDVyAZJaXtrJbYSu+w5ewFk6grF8JZwAFRDBohCL
 GXtOd2FyOzN3uvijIVbD23E8tdZvXQf1ND2C9/ITqm4PAwKPdPyzf7o5sIJFFwFvpOGR
 NGozXGxOZBEXdrEkd9HeXmVdFACVCk/z4MABKlpMKZSQOcJlaW/nYbxgJOnrir7XEbt6
 yYscSHG3MIiWGrQeU1osSCLp3pm2K/Z0tFKrB57UZ7a9v7j+PM3hf6Vt7VZCNHMjfl0W
 bSmQ==
X-Gm-Message-State: APjAAAV/DQn3GsmsvCUyawhY61/KYac8JUZlHQncWMWeH/YxkndWzX8q
 pRQrMYkCix5TYgtZg9OLIOY=
X-Google-Smtp-Source: APXvYqx7lojzs5eJ7tjc2OaNpqjg4Ds4/tRmp0l0ATPp14XCcF7ovHyFxsvNMuPIHycIcD1wSckgnw==
X-Received: by 2002:a17:906:404:: with SMTP id
 d4mr3768395eja.326.1578474456276; 
 Wed, 08 Jan 2020 01:07:36 -0800 (PST)
Received: from pi3 ([194.230.155.149])
 by smtp.googlemail.com with ESMTPSA id j3sm53121edb.50.2020.01.08.01.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 01:07:35 -0800 (PST)
Date: Wed, 8 Jan 2020 10:07:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFT 02/13] alpha: Constify ioreadX() iomem argument (as in
 generic implementation)
Message-ID: <20200108090732.GA10145@pi3>
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <1578415992-24054-3-git-send-email-krzk@kernel.org>
 <CAMuHMdXHhF6GhS1W8qS4j7Jv5YnxXjcRopT5QSA=+trc8qwFng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXHhF6GhS1W8qS4j7Jv5YnxXjcRopT5QSA=+trc8qwFng@mail.gmail.com>
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

On Wed, Jan 08, 2020 at 09:10:06AM +0100, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Tue, Jan 7, 2020 at 5:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > The ioreadX() helpers have inconsistent interface.  On some architectures
> > void *__iomem address argument is a pointer to const, on some not.
> >
> > Implementations of ioreadX() do not modify the memory under the address
> > so they can be converted to a "const" version for const-safety and
> > consistency among architectures.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> > --- a/arch/alpha/include/asm/io.h
> > +++ b/arch/alpha/include/asm/io.h
> > @@ -151,9 +151,9 @@ static inline void generic_##NAME(TYPE b, QUAL void __iomem *addr)  \
> >         alpha_mv.mv_##NAME(b, addr);                                    \
> >  }
> >
> > -REMAP1(unsigned int, ioread8, /**/)
> > -REMAP1(unsigned int, ioread16, /**/)
> > -REMAP1(unsigned int, ioread32, /**/)
> > +REMAP1(unsigned int, ioread8, const)
> > +REMAP1(unsigned int, ioread16, const)
> > +REMAP1(unsigned int, ioread32, const)
> 
> If these would become "const volatile", there would no longer be a need
> for the last parameter of the REMAP1() macro.
> 
> >  REMAP1(u8, readb, const volatile)
> >  REMAP1(u16, readw, const volatile)
> >  REMAP1(u32, readl, const volatile)
> 
> Same for REMAP2() macro below, for iowrite*().

Good point, thanks!

Best regards,
Krzysztof

