Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E8C70D8DF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 11:23:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQTQ65rZDz3fD5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 19:23:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.176; helo=mail-oi1-f176.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQTPd1Y8Xz3bkD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 19:22:59 +1000 (AEST)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-397f13944f2so1912458b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 02:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684833776; x=1687425776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElqaZMSGIZr1PDsUyYzS4b4CKhVSDM9bJ+kKBcpqibs=;
        b=He+Rg7gHmy8Lq9Xk/knag9V88nqiRfkmlP9AB6PfdPuH9rlNA1gVKewynVTPWKwUMW
         B0JfRUKGxLouV+l0Pver//kEHqe+RA7wyAQ8f3wYCq+gG1pWlo3yrnriRLWUT9tXC+RG
         pifp5ifr+BgIsjG5px15DUiV8dR6jnwkUlM3YqBQUzrBiKD1hkPAz89GeNaI7rW+M2ZZ
         LFCm+X94E93GIFgvWlCzPe9oUPXId5MUfTzyppn+ixWzOTchMpuaugKGU3Ct7T+PTVWV
         jlI/HHqSrPUytxw9tGUWivMJKluwj2mAG8JCho3dGQjKlyiBg/+ypP1I2dxbyFkE3zGx
         UO7w==
X-Gm-Message-State: AC+VfDymu7rpm7Zr3lM2jqgwYdppWhPV67aAmMIHE/+Qou3vZK74rIeb
	9/KU/cYtJg4jCZnHso6smjNjMeYYOyoN1Q==
X-Google-Smtp-Source: ACHHUZ6TkfWSvf+2y4hchtHJ/lRUxJJjQN4TTpzrmm5rXbJDf5NcgG7bpST2xEP8ruklpG4rJfZVIA==
X-Received: by 2002:aca:120a:0:b0:398:1151:a42b with SMTP id 10-20020aca120a000000b003981151a42bmr2211198ois.20.1684833776195;
        Tue, 23 May 2023 02:22:56 -0700 (PDT)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id u26-20020a4ae69a000000b0054f85f67f31sm3148774oot.46.2023.05.23.02.22.55
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 02:22:56 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6af6f5fc42aso2517845a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 02:22:55 -0700 (PDT)
X-Received: by 2002:a81:5bc6:0:b0:562:16d7:e6eb with SMTP id
 p189-20020a815bc6000000b0056216d7e6ebmr15255699ywb.40.1684833736388; Tue, 23
 May 2023 02:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230523091139.21449-1-vbabka@suse.cz>
In-Reply-To: <20230523091139.21449-1-vbabka@suse.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 May 2023 11:22:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRZmA1iEG2aXdKZ+wWgSTgg-P7KY7pTTJx9EmvuEa58A@mail.gmail.com>
Message-ID: <CAMuHMdWRZmA1iEG2aXdKZ+wWgSTgg-P7KY7pTTJx9EmvuEa58A@mail.gmail.com>
Subject: Re: [PATCH] mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED
To: Vlastimil Babka <vbabka@suse.cz>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Roman Gushchin <roman.gushchin@linux.dev>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, Helge Deller <deller@gmx.de>, sparclinux@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>, Christoph Lameter <cl@linux.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-renesas-soc@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, Gregory Clement <gregory.clement@bootlin.com>, David Rientjes <rientjes@google.com>, linux-snps-arc@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Johannes Berg <joha
 nnes@sipsolutions.net>, linux-arm-kernel@lists.infradead.org, Qin Jian <qinjian@cqplus1.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Andrew Morton <akpm@linux-foundation.org>, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, Pekka Enberg <penberg@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vlastimil,

Thanks for your patch!

On Tue, May 23, 2023 at 11:12=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> w=
rote:
> As discussed at LSF/MM [1] [2] and with no objections raised there,
> deprecate the SLAB allocator. Rename the user-visible option so that
> users with CONFIG_SLAB=3Dy get a new prompt with explanation during make
> oldconfig, while make olddefconfig will just switch to SLUB.
>
> In all defconfigs with CONFIG_SLAB=3Dy remove the line so those also
> switch to SLUB. Regressions due to the switch should be reported to
> linux-mm and slab maintainers.

Technically, removing these lines from the defconfig files does not
have any impact, right?
And it removes one more sync point indicating the last time some
defconfig files were (not) updated by their maintainers ;-)

> [1] https://lore.kernel.org/all/4b9fc9c6-b48c-198f-5f80-811a44737e5f@suse=
.cz/
> [2] https://lwn.net/Articles/932201/
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

>  arch/m68k/configs/amiga_defconfig               |  1 -
>  arch/m68k/configs/apollo_defconfig              |  1 -
>  arch/m68k/configs/atari_defconfig               |  1 -
>  arch/m68k/configs/bvme6000_defconfig            |  1 -
>  arch/m68k/configs/hp300_defconfig               |  1 -
>  arch/m68k/configs/mac_defconfig                 |  1 -
>  arch/m68k/configs/multi_defconfig               |  1 -
>  arch/m68k/configs/mvme147_defconfig             |  1 -
>  arch/m68k/configs/mvme16x_defconfig             |  1 -
>  arch/m68k/configs/q40_defconfig                 |  1 -
>  arch/m68k/configs/sun3_defconfig                |  1 -
>  arch/m68k/configs/sun3x_defconfig               |  1 -

Regardless,
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
