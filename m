Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67153133CAF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 09:12:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47t25y57y7zDqQy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 19:12:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.196;
 helo=mail-oi1-f196.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47t23v5vG1zDqLf
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 19:10:19 +1100 (AEDT)
Received: by mail-oi1-f196.google.com with SMTP id p125so1867210oif.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 00:10:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zSvatSaXmaDcygklTO+AiD7URC1DncR275ZO9qcviaY=;
 b=SDJoGO2a6eE4aW0UJvTxAhNcIW2NE7092wf92AYp8rb0GZQcNNegBOScKQBRUhVeYT
 +Yv8Zi366sL/Y2twsMQ9QPoJ0Dn63Wqxx0x7qcVW2GY+2Kbg2VQAD9GMk5yzbcl1Vi/G
 txR/MlqeBng2OEgR2/XzZOX+za2Xfk9N4S8hkIfOaYT0hdO7iL/tZAZz9mxPLKYct0L6
 vv3dloLtac1u6bhHIgtffgCQGgOnMOFXaRpMsSq/B1YPUZwSqA/DsjbUhwerYl1Z6Cf2
 6BNpxOavKwKNWdiA6JsCNISMUWJQ1h/a702g7jl3+pi6eYXwB50Jk6PzMa9cANquNmHt
 d7xw==
X-Gm-Message-State: APjAAAVwMsyHZwQyw/kp0xCGdLyc+e1mOaVKVNvpbIiPRTHW0UmCkFXS
 khS3QjokMjKhjfIlhaA4rlYQg3SXwPimexK1HeQ=
X-Google-Smtp-Source: APXvYqx7mMV6iu/aCjHaPWwxCajM/7EbWdhdn3wdjlil8XEXHsid4BFGqUofVL4JHvNq7QwetgrnnLwPgZu0svS796A=
X-Received: by 2002:a05:6808:292:: with SMTP id
 z18mr2042282oic.131.1578471017446; 
 Wed, 08 Jan 2020 00:10:17 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <1578415992-24054-3-git-send-email-krzk@kernel.org>
In-Reply-To: <1578415992-24054-3-git-send-email-krzk@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2020 09:10:06 +0100
Message-ID: <CAMuHMdXHhF6GhS1W8qS4j7Jv5YnxXjcRopT5QSA=+trc8qwFng@mail.gmail.com>
Subject: Re: [RFT 02/13] alpha: Constify ioreadX() iomem argument (as in
 generic implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
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

Hi Krzysztof,

On Tue, Jan 7, 2020 at 5:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> The ioreadX() helpers have inconsistent interface.  On some architectures
> void *__iomem address argument is a pointer to const, on some not.
>
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

> --- a/arch/alpha/include/asm/io.h
> +++ b/arch/alpha/include/asm/io.h
> @@ -151,9 +151,9 @@ static inline void generic_##NAME(TYPE b, QUAL void __iomem *addr)  \
>         alpha_mv.mv_##NAME(b, addr);                                    \
>  }
>
> -REMAP1(unsigned int, ioread8, /**/)
> -REMAP1(unsigned int, ioread16, /**/)
> -REMAP1(unsigned int, ioread32, /**/)
> +REMAP1(unsigned int, ioread8, const)
> +REMAP1(unsigned int, ioread16, const)
> +REMAP1(unsigned int, ioread32, const)

If these would become "const volatile", there would no longer be a need
for the last parameter of the REMAP1() macro.

>  REMAP1(u8, readb, const volatile)
>  REMAP1(u16, readw, const volatile)
>  REMAP1(u32, readl, const volatile)

Same for REMAP2() macro below, for iowrite*().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
