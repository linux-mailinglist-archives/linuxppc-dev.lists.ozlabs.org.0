Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8DB7E9C85
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 13:58:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STTxh3jLyz3cZy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 23:58:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.172; helo=mail-yw1-f172.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STTx85hp3z2xdh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 23:57:48 +1100 (AEDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5af6c445e9eso50954677b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 04:57:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699880265; x=1700485065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70G7gCA85kCqk8BsrysSVq5eVLLC+P3sWPCjl6nhTgo=;
        b=YjoxTicETCWDpCGZopXcItm/vQ2vPJfTmFk7U/7EjppPwDWEpWl5yf0sntJupc8QGx
         2hzXKW60ENE7cyrKZLYXF+bPT331KxXWVzg7Wr87ALCO19Iwg7h/5yvzIYZhe/wO76wM
         pc0z01P2RFKUhYTn7kv6pLd0UWTADing7yHKrPo3DQpxGQIcgUPPZWnnCc2PGrWm/Wi4
         dSbUJB6lg7IXTRv0V6yZCc9hKNQGgsWKjoQvqtlJGfl3C+8bImWYEsjzIu0IqijNkUqe
         jnH9H/7kFZ7fjZy3wDI9syxfsHyuYbK4Vl210qaOGyNwqqa7eQes3R9EtOukN7frgOMQ
         0Wsw==
X-Gm-Message-State: AOJu0Yy44zLjp2aMRyj+0NUzeBOo2EgmxGWLMCoWOPtx1YUYCTXOA8K2
	/8dWEXGSLtFWQbTKvlDlf9LZ2FS/M9t6bw==
X-Google-Smtp-Source: AGHT+IExNqt/kwya2ExnpIK9nznDLwiL75e2OHVFQ3PVdqYnPvg9OmxE6pVBQC7dbQ9PL3NrXYR1SA==
X-Received: by 2002:a81:7c88:0:b0:5a7:cc48:208d with SMTP id x130-20020a817c88000000b005a7cc48208dmr4830494ywc.5.1699880265493;
        Mon, 13 Nov 2023 04:57:45 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id u83-20020a816056000000b0059b2be24f88sm1729078ywb.143.2023.11.13.04.57.44
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 04:57:44 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dafe04717baso140035276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 04:57:44 -0800 (PST)
X-Received: by 2002:a25:41d0:0:b0:da0:d0be:ef06 with SMTP id
 o199-20020a2541d0000000b00da0d0beef06mr5385018yba.51.1699880263994; Mon, 13
 Nov 2023 04:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20231113013300.2132152-1-yoshihiro.shimoda.uh@renesas.com>
 <20231113100914.GB1583963@rocinante> <CAMuHMdVLmmf12KPQch7fT2iGjfDV--M2Wd0zsxSw6wfqYxUggQ@mail.gmail.com>
 <TYBPR01MB53411530E01A90CB525DF814D8B3A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <20231113122221.GA2418639@rocinante>
In-Reply-To: <20231113122221.GA2418639@rocinante>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Nov 2023 13:57:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX2D-Ui=6Xt_x_yDAYQYoooP51ZwZTmoASwcUeZTcME4g@mail.gmail.com>
Message-ID: <CAMuHMdX2D-Ui=6Xt_x_yDAYQYoooP51ZwZTmoASwcUeZTcME4g@mail.gmail.com>
Subject: Re: [PATCH 0/3] PCI: dwc: Improve code readability
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
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
Cc: "robh@kernel.org" <robh@kernel.org>, "mani@kernel.org" <mani@kernel.org>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "roy.zang@nxp.com" <roy.zang@nxp.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "minghuan.Lian@nxp.com" <minghuan.Lian@nxp.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "mingkai.hu@nxp.com" <mingkai.hu@nxp.com>, "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

On Mon, Nov 13, 2023 at 1:22=E2=80=AFPM Krzysztof Wilczy=C5=84ski <kw@linux=
.com> wrote:
> > > > Now, while you are looking at things, can you also take care about =
the following:
> > > >
> > > >   drivers/pci/controller/dwc/pcie-rcar-gen4.c:439:15: warning: cast=
 to smaller integer type 'enum dw_pcie_device_mode'
> > > from 'const void *' [-Wvoid-pointer-to-enum-cast]
> >
> > Thank you for the report!
> >
> > > > This requires adding structs for each data member of the of_device_=
id type.
> > >
> > > That sounds like overkill to me.
> > > An intermediate cast to uintptr_t should fix the issue as well.
> >
> > I confirmed that the uintptr_t fixed the issue.
>
> We declined a similar fix in the past[1] ...
>
> > I also think that adding a new struct with the mode is overkill.
>
> ... with the hopes that a driver could drop the switch statements in plac=
e
> of using the other pattern.  Also, to be consistent with other drivers th=
at
> do this already.

Note that the issue of casting is something we cannot fix easily:
some *_device_id structs use "kernel_ulong_t" for the "data" member,
others use "void *".

git grep -W "_device_id" -- include/linux/mod_devicetable.h | grep data

In addition, several drivers use multiple types of device IDs, so you
cannot settle on one type to avoid casts.

Also, putting enum values in instances of that struct, as suggested,
increases kernel size, for IMHO no additional gain.  If there is more
data to put in the struct, I agree it makes sense to use a struct.

> > So, I would like to fix the issue by using the cast of uintptr_t.
>
> Sure.  I appreciate that this would be more work.  When you send your
> patch, can you include an update to the iproc driver (and credit the
> original author from [1])?  I would appreciate it.
>
> 1. https://lore.kernel.org/linux-pci/20230814230008.GA196797@bhelgaas/

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
