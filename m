Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E59A46A7C17
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 08:50:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PS3F85jWBz3cLr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 18:50:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.46; helo=mail-oa1-f46.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PS3Db5MSkz3c2v
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 18:50:21 +1100 (AEDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1722c48a773so17249825fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Mar 2023 23:50:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9NdTpfDEMV32UTE9lZbQp6kQQhUJVdsU2kqbFsl+ZA=;
        b=wXczfoP8lcaHq3NaTZO5m/Bxi8aOgG3GaRgXGHgElr6bKJdxbJdeDPZ/MGo8Pe9ni/
         34SvhcbdCnY4aw0qGMel8U3ycgoyImQOqcMY2KCBQmAyIjo1CR20RePEwu9ANA8X65Xi
         mLSG5S8iadOiAqymYoNwgqi+c1dIZFq0BDKISUggPe2O1SA4MZNKhGN3UbngwhlBjT80
         gKWJetsQKW4BE4AwlU36by8em9vbaupzg7yMmQu9uankZsOr35GNe+BKB247rNLdEytq
         0pEiOYMwoTpwmn2ZD10eBPdfsrGLcDVtQaLtDrh990mOy5yQ7Sb9R7SVQzIdkGsZ3cMU
         6gNA==
X-Gm-Message-State: AO0yUKUgfxwHu4n2i8KBiBtjwC405Vo6jXJ/U9NlF0XP4qdmHIk9FPIe
	POiyZsAQwzFa/8gIZ0H8IrJLGwD3yfPp7g==
X-Google-Smtp-Source: AK7set9HJg5DClfCLNfXbVH1sWQVT0mBMp23X0g55Hidie8RYip9YtkoDI0JxS3qTAfq+6vUQKOHKA==
X-Received: by 2002:a05:6870:a794:b0:171:8716:f0be with SMTP id x20-20020a056870a79400b001718716f0bemr5240999oao.59.1677743417390;
        Wed, 01 Mar 2023 23:50:17 -0800 (PST)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com. [209.85.161.52])
        by smtp.gmail.com with ESMTPSA id x131-20020a4a4189000000b00517fc5fdf5bsm5827914ooa.17.2023.03.01.23.50.17
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 23:50:17 -0800 (PST)
Received: by mail-oo1-f52.google.com with SMTP id a23-20020a4ad5d7000000b005250867d3d9so2509406oot.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Mar 2023 23:50:17 -0800 (PST)
X-Received: by 2002:a81:ad1b:0:b0:52f:1c23:ef1 with SMTP id
 l27-20020a81ad1b000000b0052f1c230ef1mr5784211ywh.5.1677743396691; Wed, 01 Mar
 2023 23:49:56 -0800 (PST)
MIME-Version: 1.0
References: <20230301185209.274134-1-jjhiblot@traphandler.com> <20230301185209.274134-3-jjhiblot@traphandler.com>
In-Reply-To: <20230301185209.274134-3-jjhiblot@traphandler.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Mar 2023 08:49:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVF337k+zyjpbzoDtWWDnYhM6eM3+As6UuZ7FCgASsMQg@mail.gmail.com>
Message-ID: <CAMuHMdVF337k+zyjpbzoDtWWDnYhM6eM3+As6UuZ7FCgASsMQg@mail.gmail.com>
Subject: Re: [PATCH 2/3] of: irq: make callers of of_irq_parse_one() release
 the device node
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
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
Cc: Nishanth Menon <nm@ti.com>, zajec5@gmail.com, linux-pci@vger.kernel.org, ssantosh@kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, saravanak@google.com, Samuel Holland <samuel@sholland.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, jonathanh@nvidia.com, Chen-Yu Tsai <wens@csie.org>, clement.leger@bootlin.com, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, mathias.nyman@intel.com, Manivannan Sadhasivam <mani@kernel.org>, linux-actions@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Claudiu 
 Beznea <claudiu.beznea@microchip.com>, linux-renesas-soc@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org, afaerber@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jean-Jacques,

Thanks for your patch!

On Wed, Mar 1, 2023 at 7:53=E2=80=AFPM Jean-Jacques Hiblot
<jjhiblot@traphandler.com> wrote:
> of_irq_parse_one() does a get() on the device node returned in out_irq->n=
p.
> Callers of of_irq_parse_one() must do a put() when they are done with it.

What does "be done with it" really mean here?

> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@traphandler.com>

> --- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
> +++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
> @@ -184,6 +184,7 @@ static int __init rcar_gen2_regulator_quirk(void)
>                         kfree(quirk);
>                         continue;
>                 }
> +               of_node_put(argsa->np);

The quirk object, which is a container of argsa, is still used below,
and stored in a linked list.  I agree argsa->np is not dereferenced,
but the pointer itself is still compared to other pointers.
IIUIC, calling of_node_put() might cause the reference count to drop to
zero, and the underlying struct node object to be deallocated.
So when a future reference to the same DT node will be taken, a new
struct node object will be allocated, and the pointer comparison below
will fail?

Or am I missing something?

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
