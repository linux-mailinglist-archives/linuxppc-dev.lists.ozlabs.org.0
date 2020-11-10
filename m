Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D942ADCCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 18:22:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVvnP5PN6zDqX7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 04:22:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Vr0EYzw3; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVvlM6yPLzDqW9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 04:20:47 +1100 (AEDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1A6520825
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 17:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605028844;
 bh=CCTnDCAuuzm6mDIFcu8KCQsuUDMrKrxDKK90okxS4fk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Vr0EYzw3G94OIGuCW5pc5gp1CS6c8tExs5si/3znnJA8VirbiEzX7PVpZJR9FP0me
 6te5OHu0md9FgCMdhGD8Ia7VTUDYBcvSMkW7ykIhwvYwW6DNMIxS2hSme8xiPvIzeY
 h8Ft6t25keqfxhMIv34lD+CzZeyFrXpwLjrutDUg=
Received: by mail-ot1-f54.google.com with SMTP id y22so13268687oti.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 09:20:44 -0800 (PST)
X-Gm-Message-State: AOAM531s0HPzzb7Aj0Bm2QWjibdez4y0T6p0p8esRBtcIPDxCRL5nmOq
 offazjhB33c6KYoOxl+rV5b6Y+8c2iARbivxBQ==
X-Google-Smtp-Source: ABdhPJxTW1zyuuGU0nYnE6jokSTkRx0L3GaMfd1E8nJiIRwJDoTnjiX+oRJAcTo4UeF55RMhc+xmv2NCRRQ3bMrB4kg=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr13751749oti.107.1605028843571; 
 Tue, 10 Nov 2020 09:20:43 -0800 (PST)
MIME-Version: 1.0
References: <20201109104635.21116-1-laurentiu.tudor@nxp.com>
 <20201109104635.21116-2-laurentiu.tudor@nxp.com>
 <20201109221123.GA1846668@bogus>
In-Reply-To: <20201109221123.GA1846668@bogus>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 10 Nov 2020 11:20:32 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ2Ew6GdQmE0gcTgFX9cMZKtkL_rO1F+0EMNy88wF+gXw@mail.gmail.com>
Message-ID: <CAL_JsqJ2Ew6GdQmE0gcTgFX9cMZKtkL_rO1F+0EMNy88wF+gXw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: misc: convert fsl, qoriq-mc from txt
 to YAML
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>
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
Cc: devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 netdev <netdev@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yang-Leo Li <leoyang.li@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 Ionut-robert Aron <ionut-robert.aron@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 9, 2020 at 4:11 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, 09 Nov 2020 12:46:35 +0200, Laurentiu Tudor wrote:
> > From: Ionut-robert Aron <ionut-robert.aron@nxp.com>
> >
> > Convert fsl,qoriq-mc to YAML in order to automate the verification
> > process of dts files. In addition, update MAINTAINERS accordingly
> > and, while at it, add some missing files.
> >
> > Signed-off-by: Ionut-robert Aron <ionut-robert.aron@nxp.com>
> > [laurentiu.tudor@nxp.com: update MINTAINERS, updates & fixes in schema]
> > Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> > ---
> > Changes in v2:
> >  - fixed errors reported by yamllint
> >  - dropped multiple unnecessary quotes
> >  - used schema instead of text in description
> >  - added constraints on dpmac reg property
> >
> >  .../devicetree/bindings/misc/fsl,qoriq-mc.txt | 196 ----------------
> >  .../bindings/misc/fsl,qoriq-mc.yaml           | 210 ++++++++++++++++++
> >  .../ethernet/freescale/dpaa2/overview.rst     |   5 +-
> >  MAINTAINERS                                   |   4 +-
> >  4 files changed, 217 insertions(+), 198 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> >  create mode 100644 Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml
> >
>
> Applied, thanks!

And now dropped. This duplicates what's in commit 0dbcd4991719
("dt-bindings: net: add the DPAA2 MAC DTS definition") and has
warnings from it:

/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.example.dt.yaml:
dpmac@1: $nodename:0: 'dpmac@1' does not match '^ethernet(@.*)?$'
 From schema: /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/net/fsl,qoriq-mc-dpmac.yaml

Rob
