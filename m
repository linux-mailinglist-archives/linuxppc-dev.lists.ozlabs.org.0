Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 352736AAA84
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 15:48:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PTSPt18DXz3fBL
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 01:48:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.171; helo=mail-qt1-f171.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PTSPK4RCzz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Mar 2023 01:47:47 +1100 (AEDT)
Received: by mail-qt1-f171.google.com with SMTP id c3so6009597qtc.8
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Mar 2023 06:47:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677941264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeKbxzDZy3GcKkrGUofgHv5MAh6MoP5a08Lg7rMsvMk=;
        b=Ez1c4i3VPIK3Y3ekZYhA2tyUSsQV971fnEB7WUk10hoN3y+AutNdpeAoyq8hFyqi3m
         LhERBpz0yLbbtFpLcAQ5C/tbDSsoipmmQBNhm2rn3jeOt9jNVSLiwZ8kseZWJSvAxfOX
         E/cNMGR5WH2BXAU5pn22x9yRCwy4CIBZq86BeQmn1nqR8leBY5MbV9Qa5gr1ZIBD0mnH
         mJ5L9LEasjByBAwoIH/xslGFfSPhZz4nfydtoa49pa5Jj8VhRotAXC7T0gW9vFCl20Kz
         kKNDDG4G0FQXP51lcGQUy0k80prTnCNYJfgahSfGqCc6+4I4CCLLNTCSlFsmOgGhbtwj
         RTrA==
X-Gm-Message-State: AO0yUKVK7VeDGwE/c667YN/r8s2aJFjGZh+lpyi8c99gEBfJ9yNFbx+i
	0nJxJ06gxZocwxFKPOc12yDKU6nEjKqQPA==
X-Google-Smtp-Source: AK7set+mcJnt4sSDapiM4XVkOVNemWEBECYV9LVemNjVfdQUPXHAfbgygu5DVOn7qBei1KnESNtopg==
X-Received: by 2002:a05:622a:1113:b0:3bf:c0fb:53a2 with SMTP id e19-20020a05622a111300b003bfc0fb53a2mr8851949qty.48.1677941264145;
        Sat, 04 Mar 2023 06:47:44 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id i10-20020ac871ca000000b003bfb950f670sm3860970qtp.41.2023.03.04.06.47.43
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 06:47:44 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5384ff97993so98026357b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Mar 2023 06:47:43 -0800 (PST)
X-Received: by 2002:a81:b723:0:b0:536:38b4:f51 with SMTP id
 v35-20020a81b723000000b0053638b40f51mr3187721ywh.5.1677941242747; Sat, 04 Mar
 2023 06:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20230301185209.274134-1-jjhiblot@traphandler.com>
 <20230301185209.274134-3-jjhiblot@traphandler.com> <CAMuHMdVF337k+zyjpbzoDtWWDnYhM6eM3+As6UuZ7FCgASsMQg@mail.gmail.com>
 <7fa7f07f-d1e1-1e43-992c-4981c5810284@traphandler.com>
In-Reply-To: <7fa7f07f-d1e1-1e43-992c-4981c5810284@traphandler.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 4 Mar 2023 15:47:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdZatMYsc=367OuGotzYuo2-XVe5MAZdzh+kBs31=t5A@mail.gmail.com>
Message-ID: <CAMuHMdVdZatMYsc=367OuGotzYuo2-XVe5MAZdzh+kBs31=t5A@mail.gmail.com>
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

On Sat, Mar 4, 2023 at 11:34=E2=80=AFAM Jean-Jacques Hiblot
<jjhiblot@traphandler.com> wrote:
> On 02/03/2023 08:49, Geert Uytterhoeven wrote:
> > On Wed, Mar 1, 2023 at 7:53=E2=80=AFPM Jean-Jacques Hiblot
> > <jjhiblot@traphandler.com> wrote:
> >> of_irq_parse_one() does a get() on the device node returned in out_irq=
->np.
> >> Callers of of_irq_parse_one() must do a put() when they are done with =
it.
> >
> > What does "be done with it" really mean here?
> >
> >> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
> >
> >> --- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
> >> +++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
> >> @@ -184,6 +184,7 @@ static int __init rcar_gen2_regulator_quirk(void)
> >>                          kfree(quirk);
> >>                          continue;
> >>                  }
> >> +               of_node_put(argsa->np);
> >
> > The quirk object, which is a container of argsa, is still used below,
> > and stored in a linked list.  I agree argsa->np is not dereferenced,
> > but the pointer itself is still compared to other pointers.
>
> I fail to see when the pointers are compared. It looks to me that only
> the args are compared. Am I missing something ?

You're right, in upstream, there is no such check.
In my local tree, I have converted the comparisons below to use a new
helper of_phandle_args_eq() (which does compare the np member, too),
but that change never went upstream, as the other user of that helper
was rejected.

> In any case, looking more closely at the code, I guess that indeed the
> of_node_put() shouldn't be added here because this code expects that the
> nodes never go away. That is probably a good assertion in case of PMICs

OK.

> > IIUIC, calling of_node_put() might cause the reference count to drop to
> > zero, and the underlying struct node object to be deallocated.
> > So when a future reference to the same DT node will be taken, a new
> > struct node object will be allocated, and the pointer comparison below
> > will fail?

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
