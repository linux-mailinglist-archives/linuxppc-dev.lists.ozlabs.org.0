Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7057E28E689
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 20:38:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBLlv6pHMzDr0V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 05:38:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Pofh7UmO; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBLh43YSBzDqqD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 05:35:32 +1100 (AEDT)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D01322246
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 18:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602700529;
 bh=Pda5e4mTtOE+ZlY6hUmRRRDO7I+9vJoYWhBous9Gcls=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Pofh7UmO7iRQ6dIxMcM+BkYBtJ7jUuuDxYvnx45uCg3oTKCzplu1qgt32rENNlGE+
 6CbsGFGyyKtjPzOfwqXjDpOqeJ9TKaHnrisubMIcT108UpGEmLQHnQg3MzptTLo85b
 09GIwDh7G3BzSCkAOxH94vxwT2RuWvy6ESdGDHkk=
Received: by mail-oo1-f47.google.com with SMTP id z1so104155ooj.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 11:35:29 -0700 (PDT)
X-Gm-Message-State: AOAM533TuLVKY8UOuE3X/jrIRFlQ2tZ8bFkinZ2IjSDa+CBh0y4VVeJu
 TJYxq+KWXzc1W+bvBk3qdia7npckVYVV9uMe0A==
X-Google-Smtp-Source: ABdhPJxmywHYTJ4dMOU2YaRv5iUSZXhICQXEppzBvIlKDcu6yZMwhcqON/hhJlbOheAOzFbJbkRhHRpm3BOL3wbOkQ8=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr18868oti.107.1602700527584;
 Wed, 14 Oct 2020 11:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
 <878sc8lx0e.fsf@kernel.org> <20201014143720.yny3jco5pkb7dr4b@mobilestation>
In-Reply-To: <20201014143720.yny3jco5pkb7dr4b@mobilestation>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 14 Oct 2020 13:35:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKNuYS1ojJMCx1whLgynz+cTZ-Hvxn5pEFJc_PUgA1hsg@mail.gmail.com>
Message-ID: <CAL_JsqKNuYS1ojJMCx1whLgynz+cTZ-Hvxn5pEFJc_PUgA1hsg@mail.gmail.com>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Linux USB List <linux-usb@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Wei Xu <xuwei5@hisilicon.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Mathias Nyman <mathias.nyman@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Serge Semin <fancer.lancer@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 Manu Gautam <mgautam@codeaurora.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 14, 2020 at 9:37 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> On Wed, Oct 14, 2020 at 05:09:37PM +0300, Felipe Balbi wrote:
> >
> > Hi Serge,
> >
> > Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:
> > > In accordance with the DWC USB3 bindings the corresponding node name is
> > > suppose to comply with Generic USB HCD DT schema, which requires the USB
> >
>
> > DWC3 is not a simple HDC, though.
>
> Yeah, strictly speaking it is equipped with a lot of vendor-specific stuff,
> which are tuned by the DWC USB3 driver in the kernel. But after that the
> controller is registered as xhci-hcd device so it's serviced by the xHCI driver,
> which then registers the HCD device so the corresponding DT node is supposed
> to be compatible with the next bindings: usb/usb-hcd.yaml, usb/usb-xhci.yaml
> and usb/snps,dwc3,yaml. I've created the later one so to validate the denoted
> compatibility.
>
> >
> > > nodes to have the name acceptable by the regexp: "^usb(@.*)?" . But a lot
> > > of the DWC USB3-compatible nodes defined in the ARM/ARM64 DTS files have
> > > name as "^dwc3@.*" or "^usb[1-3]@.*" or even "^dwusb@.*", which will cause
> > > the dtbs_check procedure failure. Let's fix the nodes naming to be
> > > compatible with the DWC USB3 DT schema to make dtbs_check happy.
> > >
> > > Note we don't change the DWC USB3-compatible nodes names of
> > > arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} since the
> > > in-source comment says that the nodes name need to be preserved as
> > > "^dwusb@.*" for some backward compatibility.
> >
>
> > interesting, compatibility with what? Some debugfs files, perhaps? :-)
>
> Don't really know.) In my experience the worst type of such compatibility is
> connected with some bootloader magic, which may add/remove/modify properties
> to nodes with pre-defined names.

I seriously doubt anyone is using the APM machines with DT (even ACPI
is somewhat doubtful). I say change them. Or remove the dts files and
see what happens. Either way it can always be reverted.

Rob
