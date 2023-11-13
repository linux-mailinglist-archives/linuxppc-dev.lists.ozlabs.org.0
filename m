Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFE47E9AB1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 12:07:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STRVL3BNGz3d9Y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 22:07:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.170; helo=mail-yw1-f170.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STRTp5hXXz3c2V
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 22:07:25 +1100 (AEDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a90d6ab962so49319247b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 03:07:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699873642; x=1700478442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljt2pdxD6mQ41IzJFM9voVHvaM5NwwcPFP6Lo8muJps=;
        b=e7DkdoQed46eX9n3Km3kdg9/eFfaq1K47SSLkhFTWv2tj3E8CqHFhEcSlXt0TgZiPJ
         x2at8+9JnKgkCAFRiZgWuGK84+nHB2osilmQ47iOBHa6uRF9ofAyFiiQQdZnBrxoFB4Q
         DubCIaREVfLUl7fT+FG6px/XsvqXdUjQNnE56GWbF32vJ45CnchMlec1y8rNzWfgvMZP
         awaLwzFPBam/JyHd6olfA+u6KDN2l7olALvl6oyTcqsbjZyUWCNgogdQpDo7h5wvzJOP
         VGAecUYcMvjszcrpG3OjBUCSrviRROGzvCjKvZkg9r7BsvTEoCxNZBTvd5ZVJP+HuVY1
         pq6w==
X-Gm-Message-State: AOJu0YztAtnz/Bt8LlCQOJtqlTkrQGL3yf0nSrjNVUVd1YGjArgyPNoQ
	a4Y/ZSJqdqeTQOEBK5nBk7HSryIgbAbdEg==
X-Google-Smtp-Source: AGHT+IEqNZ4Tu1ymcG0XWzDs5vygmtsPgeSK37idL8z7GyVj/cGH/MnCdGARZiqTl/VsTnbk99riQg==
X-Received: by 2002:a0d:cb55:0:b0:5b3:26e1:31fb with SMTP id n82-20020a0dcb55000000b005b326e131fbmr6883709ywd.28.1699873641683;
        Mon, 13 Nov 2023 03:07:21 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id z62-20020a818941000000b005add997ae53sm1717613ywf.81.2023.11.13.03.07.20
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 03:07:21 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a84204e7aeso49694657b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 03:07:20 -0800 (PST)
X-Received: by 2002:a81:9141:0:b0:5b3:60c2:5781 with SMTP id
 i62-20020a819141000000b005b360c25781mr6828845ywg.32.1699873640712; Mon, 13
 Nov 2023 03:07:20 -0800 (PST)
MIME-Version: 1.0
References: <20231113013300.2132152-1-yoshihiro.shimoda.uh@renesas.com> <20231113100914.GB1583963@rocinante>
In-Reply-To: <20231113100914.GB1583963@rocinante>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Nov 2023 12:07:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVLmmf12KPQch7fT2iGjfDV--M2Wd0zsxSw6wfqYxUggQ@mail.gmail.com>
Message-ID: <CAMuHMdVLmmf12KPQch7fT2iGjfDV--M2Wd0zsxSw6wfqYxUggQ@mail.gmail.com>
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
Cc: robh@kernel.org, mani@kernel.org, gustavo.pimentel@synopsys.com, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-pci@vger.kernel.org, roy.zang@nxp.com, linux-renesas-soc@vger.kernel.org, minghuan.Lian@nxp.com, jingoohan1@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, lpieralisi@kernel.org, mingkai.hu@nxp.com, marek.vasut+renesas@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

On Mon, Nov 13, 2023 at 11:09=E2=80=AFAM Krzysztof Wilczy=C5=84ski <kw@linu=
x.com> wrote:
> > This patch series is based on the latest pci.git / next branch.
> [...]
>
> Thank you for following up to tidy things up!  Much appreciated.
>
> Now, while you are looking at things, can you also take care about the fo=
llowing:
>
>   drivers/pci/controller/dwc/pcie-rcar-gen4.c:439:15: warning: cast to sm=
aller integer type 'enum dw_pcie_device_mode' from 'const void *' [-Wvoid-p=
ointer-to-enum-cast]
>
> This requires adding structs for each data member of the of_device_id typ=
e.

That sounds like overkill to me.
An intermediate cast to uintptr_t should fix the issue as well.

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
