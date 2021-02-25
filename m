Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5370232494F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 04:14:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmHvL2S48z3dQ2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:14:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bH9vGPAt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bH9vGPAt; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmHqP2kvZz3d88
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 14:10:57 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id w36so6361018lfu.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 19:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EnWKtR8Gi6MBZCyGkt9dN20MUD2l2Ye826UGjeumL/M=;
 b=bH9vGPAt9TT8vyB02A3LusGmI+8chLo2PIYd/qdVnAoXcA4p9U8W5tREoMsyzsBZ4Z
 Q9NWpJGzbzKuGHL8s6oMt0bLW3cEcmbC9NdcLISbdy921Vh/wsagj4AH++LZuIzRDEbT
 /WeaCZUdRo1TnFila95eDP1Wh6V9uR/3XL/ldcc37WLU90lRiqTi5RA7028rpBzspYn0
 uzW+qM+xaP557V5nIjT5QocjQY/t2x2za9ZZhZ52SkaDpq5OPJHeeJmMELdtjDXjttJT
 B9WSVRITYzuXvO6JzTkJ79NxGhasXXQhMfU3k2UQOy3nrYfAVvhpTpohOVYNphQy7Wsl
 Pj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EnWKtR8Gi6MBZCyGkt9dN20MUD2l2Ye826UGjeumL/M=;
 b=UdSnY/oxr4Xbnqh972ty9ZRWtEJXMabBtfluY0GrqVgRckYRWbApX0Grg4CbmNpZyf
 m2svC6ncOWV5G4+p6QI3mBCp2lNiI16OyR5RYQGJHI8pcq6wZvsnxniFUeZQGXev3QdX
 PSZR5U+nw8QWyPZhl8vkxCtA3tozoY3uUzWlTRIyJkClWfp0OZc8pluQTY/nbtDc3kHo
 gLGH1IxMSX0exzwi5O4NHU3AnnpqDPsLFoS2cFfJCnfI529aN+AvfmQzYg7FgeuQYRIo
 qB52XHEvy7gkyWRDXd1tejUca+wJfMMTRyjAlWIrnptePuMARO12rVjWi22+gum8R5XW
 bFbg==
X-Gm-Message-State: AOAM532Uns/KjprA8CowGHqQiosJlvb2I6zv71+I1vMa/0p9KYSsdJpX
 Q5+dmp5DljC66EIbYm1Tf3o479qzoayi435rWmk=
X-Google-Smtp-Source: ABdhPJxCV+TqWtFTdMF/6bZM7j6af9TKwjCsqsLP5PqihQfPd5E2/w9l1zUzIOTZC6eXqdEZ1+/twFQLRzEl5p88ras=
X-Received: by 2002:a19:4147:: with SMTP id o68mr691484lfa.295.1614222649170; 
 Wed, 24 Feb 2021 19:10:49 -0800 (PST)
MIME-Version: 1.0
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-4-git-send-email-shengjiu.wang@nxp.com>
 <20210210221252.GA2885308@robh.at.kernel.org>
 <CAA+D8APfd8trC8cFsT8k8G54nhrYDrwXxECx9RpDAgw3rco9DQ@mail.gmail.com>
In-Reply-To: <CAA+D8APfd8trC8cFsT8k8G54nhrYDrwXxECx9RpDAgw3rco9DQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 25 Feb 2021 00:10:38 -0300
Message-ID: <CAOMZO5D3HgVF6Gq6sFo7j7OJ63NVN--ZtmwZCoM7=dmmhVZchQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] ASoC: dt-bindings: fsl_rpmsg: Add binding doc for
 rpmsg cpu dai driver
To: Shengjiu Wang <shengjiu.wang@gmail.com>
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
Cc: Rob Herring <robh@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 18, 2021 at 4:21 AM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:

> > rpmsg is a protocol. What's the h/w block?
>
> On Linux side this driver is a virtual driver, it is running
> on Arm Cortex-A core. The h/w block is controlled by
> another core (cortex-M core). so this driver actually
> doesn't touch any hardware, it just does configuration
> for rpmsg channel.
> fsl,version: There are maybe different image running on M core, this
> is the image version, different image has different function.

To answer Rob's question: the hardware block that handles these
messages is the Message Unit block.
