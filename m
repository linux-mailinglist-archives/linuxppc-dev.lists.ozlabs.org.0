Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1D590B0E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 16:05:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=QeH7J56b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2s981Vwsz3g3b
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 00:05:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=QeH7J56b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2s8Q3Hh3z3fnB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 00:04:52 +1000 (AEST)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-44055ca3103so23012861cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 07:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718633090; x=1719237890; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuiBnTAk1GdD7Nn+nX9o9bL0mw0aUr07eq17+hCN0VA=;
        b=QeH7J56burxeukWPvNdDOSBaDvfXDFnGmJJgvVoPKFvRkhJGSSUgQc8CUZC4I/pSYX
         XNBTAWctuI67iQBPCYCqYmsKuKJCgsmMUSYo6qF8zrxXA5+oQoYEYIDQnjZ0MoZJ2kxS
         FvYYKuKp2GR+9Hr2muXfyT5OBqdYfDWRg6xcvxzxrdXjIEUxz3iFmqkNfZsff7Nfwy2T
         AyEX7SL24GKs2RBVhOpPZpeBIUesaRx2D2iB5zEXLyQtUrsmt9Fm7WV4kzPjXEOGCRzK
         D/a5hWcCiwhR7zQly1cqaT3Gtbr4FKU95MSPLnL2sKzzp0ISVWYE468/BAVg5ob/JT18
         GP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718633090; x=1719237890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuiBnTAk1GdD7Nn+nX9o9bL0mw0aUr07eq17+hCN0VA=;
        b=e2qveOuVh4/nbfpuu2vhUliAHWblOiBSoDnXa2qCI9D26w9MHT364oHcjS6eBLzj+f
         ZfLV8tXSGh91x9/DqDzECAfs8KjXj9yfINymo7R87qe+yVLW9lmTBUy4Y3UZK4/Sxaxn
         HsCs5ur8smJLH2q0V4iVjFcALMc8A0s7jrr7llu/neC+NADtVKzC4djkAmcCjbeVHbeA
         WnH/Q9YldM4v8i98/MjC+Top/j8Nk/do1Hq7DWph7HsfZnZFPD3LW6gZ7Yi2evL9m3ag
         m+3NfBX7e7GQiVgqoZhp97cQhx8MZLJhWrT8paVO00jjKErG57M5Wogptw6u6DiKrK7H
         pT/w==
X-Forwarded-Encrypted: i=1; AJvYcCXRbA7vc+6vtZLqx4YKox1+4j6tQ419WbG9vZcj4efp/qGlHhwQkorjvJkQ2gvmnHd1DFV4N518LuT+hWf5FrLZcI75xuYwFDSP5lTCrQ==
X-Gm-Message-State: AOJu0YyJxWfZOebZBvqfBXZZlaZCQYOPyvcvwd1fVcfmvdVoeiV+PMw2
	hosM+5KFEVClThpJULvodNe6vQ2hCvmBVND/gjkBFfFST9MKt8mCLV2IaVt0FSF080ljDS7o3BF
	TCL6NxDAER28xZALBNIbebaOG5zfs/figzl21Ng==
X-Google-Smtp-Source: AGHT+IHgt8vcIdjEnWNHVtl+wLq4vY15nqjqT8vHj/DvbcH6/AFoCHKztbbB0oihPAkdtwCT0DqCv4v4/vIp7abnqNw=
X-Received: by 2002:a0c:db01:0:b0:6b0:6dba:c947 with SMTP id
 6a1803df08f44-6b2afc8d656mr92366246d6.18.1718633089663; Mon, 17 Jun 2024
 07:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com> <20240614163500.386747-2-piotr.wojtaszczyk@timesys.com>
 <83cbf43e-c927-449f-8b7e-5c8d3ee8cece@kernel.org> <CAG+cZ06EeXUDiLsDXkz+6EHqJwpvv2MWwfpvB8AYw0=ZhUkTfQ@mail.gmail.com>
 <83a45f7c-d90b-44d3-b57e-9dad21045e27@kernel.org>
In-Reply-To: <83a45f7c-d90b-44d3-b57e-9dad21045e27@kernel.org>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Mon, 17 Jun 2024 16:04:38 +0200
Message-ID: <CAG+cZ06kzikieaD_JCBybwWk8XKZQjJxa34Cg4QHxrxpT+j0eA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
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
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, "J.M.B. Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 17, 2024 at 2:14=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 17/06/2024 11:33, Piotr Wojtaszczyk wrote:
> > On Sat, Jun 15, 2024 at 12:01=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >> Do not attach (thread) your patchsets to some other threads (unrelated
> >> or older versions). This buries them deep in the mailbox and might
> >> interfere with applying entire sets.
> >
> > I'm sorry about that, it won't happen again.
> >
> >>> +  dma-vc-names:
> >>
> >> Missing vendor prefix... but I don't really get what's the point of th=
is
> >> property.
> >
> > Is "nxp,lpc3xxx-dma-vc-names" acceptable?
>
> No, because it does not help me to understand:
> " what's the point of this property."
>
> >
> >>
> >>> +    $ref: /schemas/types.yaml#/definitions/string-array
> >>> +    description: |
> >>> +      names of virtual pl08x dma channels for tx and rx
> >>> +      directions in this order.
> >>> +    minItems: 2
> >>> +    maxItems: 2
> >>
> >> What part of hardware or board configuration this represents?
> >>
> >> It wasn't here and nothing in changelog explained it.
> >
> > That's information which DMA signal and mux setting an I2S interface us=
es.
> > It's a name (bus_id field) of platform data entry from phy3250.c in
> > [PATCH v3 3/4].
>
> platform entries from driver do not seem related at all to hardware
> description. You know encode driver model into bindings, so obviously no-=
go.

In this case platform entries do exactly that, they define which dma
signal number is
routed to peripherals in LPC32xx. They describe hardware capabilities
of the pl08x dma
and which AHB bus the dma is connected to. This was carried over from
linux versions
before DT was introduced.

>
> > It's used by snd_soc_dai_init_dma_data() in [PATCH v3 4/4] to give the
> > dmaengine a
> > hint which dma config to use. The LPC32xx doesn't have yet a dmamux dri=
ver like
>
> and if I change driver platform data to foo and bar, does the DTS work? N=
o.

They shouldn't change the same way as expected dma-names shouldn't change.
Lots of drivers expect the dma-names to be "rx", "tx"

>
> > lpc18xx-dmamux.c therefore it still uses platform data entries for
> > pl08x dma channels
> > and 'SND_DMAENGINE_PCM_FLAG_NO_DT | SND_DMAENGINE_PCM_FLAG_COMPAT'
> > flags in the devm_snd_dmaengine_pcm_register().
> > Typically instead of this platform data you would use regular 'dma'
> > and 'dma-names' if it had
> > proper dmamux driver like lpc18xx-dmamux.c
>
> Exactly. Use these.

Then I need to write a lpc32xx dma mux driver, device tree binding for
it and adjust the
LPC32xx I2S driver for it. Is this a hard requirement to accept this
patch set for the
legacy LPC32xx SoC?

>
> >
> >>
> >> Drop.
> >>
> >>
> >>> +
> >>> +  "#sound-dai-cells":
> >>> +    const: 0
> >>> +
> >
> > The "dai-common.yam" doesn't declare a default value for this so
>
> Where is my comment to which you refer to? Please do not drop context
> from replies. I have no clue what you want to discuss here.
Well I didn't remove the context, you said:
"
Drop.
(...)
+  "#sound-dai-cells":
+    const: 0
"
So I'm confused whether the "#sound-dai-cells" should be in the dt
binding or not.

--=20
Piotr Wojtaszczyk
Timesys
