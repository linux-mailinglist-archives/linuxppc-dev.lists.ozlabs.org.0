Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1027742D979
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 14:47:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVThF3Pq8z3c4n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 23:47:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SXdxOowl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SXdxOowl; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVTgZ56DKz2ynB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 23:47:06 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4BC8460D07
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 12:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634215624;
 bh=+d01KHTRSumOEZT8agvd8tWEcK3PRRbA5A7BnnIbdpQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SXdxOowlZ7aya9QAoUheTtExbJZKUXxsrsgkhJtRxFO5U/6UOhjDEbbkgc/eAhvnl
 8VDJy5Qls3NqYv00avhVHiihQyHEWNURxN94FMfMOwT4OzaE5ddz0lCArRUKuyjlu4
 ypBeYZx/qfynSMviuCAUnjkQ/rvsK/ajrxAlSlJtz2MTz0o7EjUB1WE/8dDabWV5u0
 JBfg7vG7ROz2sslGyTYewlVnw0Oj7ms/PXk1hu62BcTZutTXH5zudlJ7A1nHzWfUhz
 xO2+keIbybqoaGgEUObO2GFdHsjYg8KhUNuD1XwsBveDBXYXZui4cqjlRssZQgwHYD
 eE0sUkebLL2RQ==
Received: by mail-ed1-f47.google.com with SMTP id z20so23899114edc.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 05:47:04 -0700 (PDT)
X-Gm-Message-State: AOAM530GsAnF6vkGfLZvYH0O86jSo4guMZ7aQLSychwcLv/ehhv14BhW
 L/LVbAXr9mZfBkyUD9IRx2f6w+7cKVXI+HIJrQ==
X-Google-Smtp-Source: ABdhPJwSm3HuhEJ063Rw9UsGLNFNs045f3GLTDsPTojmKwFpUBlKoUE++pS+H7a9JGog+S1ZtaakwJ8m1wxPCvagazI=
X-Received: by 2002:a17:906:9399:: with SMTP id
 l25mr3551972ejx.363.1634215622699; 
 Thu, 14 Oct 2021 05:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211001000924.15421-1-leoyang.li@nxp.com>
 <20211001000924.15421-2-leoyang.li@nxp.com>
 <db751cb1-9107-3857-7576-644bde4c28e5@canonical.com>
 <CADRPPNROVBp_QB=6XEgk8WF5fnEPFTSko4Nn+mm8oLM3iGTuuw@mail.gmail.com>
 <e42fa620-810b-fdcc-c827-602a14d10d97@canonical.com>
In-Reply-To: <e42fa620-810b-fdcc-c827-602a14d10d97@canonical.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 14 Oct 2021 07:46:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLvdFgiPLZoUzXXPmoff2u1pz5pcSdaCh9p=bh1+3PMSg@mail.gmail.com>
Message-ID: <CAL_JsqLvdFgiPLZoUzXXPmoff2u1pz5pcSdaCh9p=bh1+3PMSg@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: memory: fsl: convert ifc binding to yaml
 schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 4, 2021 at 4:31 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 01/10/2021 18:17, Li Yang wrote:
> > On Fri, Oct 1, 2021 at 5:01 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> >>
>
> (...)
>
> >>> +
> >>> +  interrupts:
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>> +    description: |
> >>> +      IFC may have one or two interrupts.  If two interrupt specifiers are
> >>> +      present, the first is the "common" interrupt (CM_EVTER_STAT), and the
> >>> +      second is the NAND interrupt (NAND_EVTER_STAT).  If there is only one,
> >>> +      that interrupt reports both types of event.
> >>> +
> >>> +  little-endian:
> >>> +    $ref: '/schemas/types.yaml#/definitions/flag'
> >>
> >> type: boolean
> >
> > It will not have a true or false value, but only present or not.  Is
> > the boolean type taking care of this too?
>
> boolean is for a property which does not accept values and true/false
> depends on its presence.
> See:
> Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml

They are equivalent, so either can be used.

Really what is needed here is a common schema for the endianness
properties defining the type once. Then any binding using a property
can just do 'little-endian: true'.

Rob
