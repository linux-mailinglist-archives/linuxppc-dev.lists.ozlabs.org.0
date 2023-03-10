Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD486B3C57
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 11:34:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PY2VL3nkqz3f4T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 21:34:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j7yDOF4v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=jonas.gorski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j7yDOF4v;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PY2TP4bl7z3cBy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 21:33:43 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id s18so2787496pgq.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 02:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678444420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YrNzsS4yDEQMUDPv9ek+bekWTDdRMD0SzIqqeBsqXfs=;
        b=j7yDOF4vjuMwEC50NwSCaNecKzZ2/3xLGtDe67+v5aE7gFEJV+8w+NQx8s0kvgTst5
         +naqkoEiK0kI7PmpwOb5Z39aKZNATOodTn+e4rIODobgKz7qibnXmEGO/zSzsEwxaEJJ
         Nya/2AXZC+NK7iLeBBktVHDwyoQAIODH98bn6kKcHWhTGloTdt3wjzwXQoip9pUe+SAx
         S1gDd/X+962d6qPwwzxeYCGWzsx5BicoCCYEy0jICNUfQuZ41zQly40a/C1JQkQ+f45C
         AAtJkeim9GRcRkFMG0hHD0Dvbfnm8eHHdMcarpnh5n/nKRsDyvu3YQLBU9/HVR3/9ruY
         ZBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678444420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YrNzsS4yDEQMUDPv9ek+bekWTDdRMD0SzIqqeBsqXfs=;
        b=upUEqALjMci6c1FOMdlkN7uCkc0krGypo5JxKqJWdHg/NSPlh+kYby3RRZkZoSYMk2
         VQGmEThlWkwHSDQF2zltcBPO/XaJWXioPBuH408b/2TYVNbqzt8VWJU7ouiIUcRJvGVN
         wglxeDedO6CxxN51H9Br4+foiM45CUTp9v9NVzWTNuSQmyiDPsbCiS83VelGbGDGwtI7
         3ljEiGjTUoWeOXMX4isKP2nJVlEEadJ90pMs3DIpafVOYrjFh9esLf5kdOWAbfly07O/
         Bw/8akkCYC0NSrDJmNQHUcpY2M4JWN3bB2gjHUN6PDspoBfpl4SGyno9JN0Y447mr1EQ
         K/MQ==
X-Gm-Message-State: AO0yUKXQM38La6zUFXG+qeG2RtGzjrB8AJfLvbeY1QBex8jpAK755fY/
	dbdV7LdON5jRwSAE1SvfM9GAZG74dNaNa+OfBSw=
X-Google-Smtp-Source: AK7set8WnxbFY5oTrVIKnhdrvft3bVtLVrqnp8sLn5OeESTjitANPmUjpUeCrnOQfk59jWma/T/rN7BdO7v9GpO4T8o=
X-Received: by 2002:a62:828e:0:b0:593:da6f:fb1c with SMTP id
 w136-20020a62828e000000b00593da6ffb1cmr10533664pfd.4.1678444419668; Fri, 10
 Mar 2023 02:33:39 -0800 (PST)
MIME-Version: 1.0
References: <20230306191535.1917656-1-sean.anderson@seco.com>
 <20230306191535.1917656-4-sean.anderson@seco.com> <CAOiHx=mcANqHTk9=b0TGHa2rk9nppnKa2EB1v05uHb5jhzoawA@mail.gmail.com>
 <49b24502-1b21-f05b-ef4a-18d5aa375f8d@seco.com>
In-Reply-To: <49b24502-1b21-f05b-ef4a-18d5aa375f8d@seco.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Fri, 10 Mar 2023 11:33:28 +0100
Message-ID: <CAOiHx=k8f6irVChBOtSoUJZiW6VS3sdg_KWhTo+C+ZWoGmmfdQ@mail.gmail.com>
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
To: Sean Anderson <sean.anderson@seco.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 6 Mar 2023 at 22:27, Sean Anderson <sean.anderson@seco.com> wrote:
>
> On 3/6/23 15:51, Jonas Gorski wrote:
> > Hi,
> >
> > On Mon, 6 Mar 2023 at 20:16, Sean Anderson <sean.anderson@seco.com> wrote:
> >>
> >> This is a generic binding for simple MMIO GPIO controllers. Although we
> >> have a single driver for these controllers, they were previously spread
> >> over several files. Consolidate them. The register descriptions are
> >> adapted from the comments in the source. There is no set order for the
> >> registers, so I have not specified one.
> >>
> >> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> >> ---
> >>
> >> Changes in v10:
> >> - New
> >>
> >>  .../bindings/gpio/brcm,bcm6345-gpio.yaml      |  16 +--
> >>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 136 ++++++++++++++++++
> >>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 -----
> >>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 -----
> >>  4 files changed, 137 insertions(+), 91 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> >>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
> >>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> >> index 4d69f79df859..e11f4af49c52 100644
> >> --- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> >> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> >
> > You are (re-)moving the compatible this file is named after, you might
> > want to rename the file as well then. Going by age bcm6358 would be
> > the next oldest one (bcm6318 would be the newest, despite the lowest
> > number).
>
> I can do that. Would it be fine to rename to e.g. brcm,bcm63xx-gpio.yaml?

I'm not up to date with current naming policies (if there are any at
all), but looking at what's currently there this should be fine.

Jonas
