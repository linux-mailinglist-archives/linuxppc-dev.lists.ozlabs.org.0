Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 499F72172F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 12:46:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4554hT4yr5zDqSl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 20:46:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::144; helo=mail-it1-x144.google.com;
 envelope-from=ard.biesheuvel@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="R6RUDRe4"; 
 dkim-atps=neutral
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4554fw444YzDqRf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 20:44:38 +1000 (AEST)
Received: by mail-it1-x144.google.com with SMTP id e184so11245523ite.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 03:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ae6y0KuXzMG1pHLjgX5VAMMTwD/mpdbSQHyUYqpGa1Y=;
 b=R6RUDRe47ZibIlkhxQWfsIgH9dt5pFYOUAFW/3Asfdh4QE7ekEXvUMeji89niTUt1k
 ThSHvMS8k3bXzi1VUy39vktMv6CElxov+TYUYhnWCWo/JeHIl+5X5uTCE/JPXOr9SNxF
 itX9zP/rxln7zlf7HwFmVYDMS5/xp2TFIkV0GGNN+/7PfpTnpEPE+hJBb0z/BNOLkuD8
 fM8SBe/WyYf0Wg2moOirFS03wLy6/d548Y2nMjbiOokDeRXQUbUn7dr6gtDP/bnIa6mx
 aaatnT+JDGwhVfUdZh/oAQz/iZ67xf1VLuE9Sq/dNCVBEWfSOEzycF2eMKOKgKqVT9/q
 Fw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ae6y0KuXzMG1pHLjgX5VAMMTwD/mpdbSQHyUYqpGa1Y=;
 b=XrK1b7wNGXEu4ePE0JhrD5j1MhNBZuIbei4kObjrD9P2nINBBLqCHzP0ZwA6yimJ2b
 Z/CqMtR5kKhMS+mUO6QbZJR01jQfUBeNW4kTXg/RQONqGoK5ndAWFFOqlfaJ6VafPgWe
 dfaqbkcWp/wuBduhJMVxLeYApCull+dhL9X/pjEHWcz8iHeH/Fo60xXJXbOhW7/aiPs5
 hyBcbj6TlrSmqMpvFcRgwlew/7zqYAsPXSaGAj4bDLF1QEJMYVRxe6QIUPDkmm19EfL0
 65soXYpe79REDMBBzBS/6jJDiFhL1ZhET7G79RNw7qgLAgo+gPJKlWzBA1pzHU2EkXnE
 Uq3A==
X-Gm-Message-State: APjAAAU/NnPuIphDmqbiPrVgaOcS5nibAq5NfgdFcnWOzp/ZMImQBPaK
 vz3/FyXRL5tJ+d5WowGHUXjKnKMCjbgqKdPzsDfDEw==
X-Google-Smtp-Source: APXvYqx3JP27Nk1tvOQBMDUThEQjHMC4TS5L3KtmWKuKzLoARJahORDrcr3fbLBY/dMbMzQj6L5PkULqhdgPoVo6Vr4=
X-Received: by 2002:a02:1dc7:: with SMTP id 190mr34241024jaj.62.1558089874890; 
 Fri, 17 May 2019 03:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190515072747.39941-1-xiaowei.bao@nxp.com>
 <20190515072747.39941-2-xiaowei.bao@nxp.com>
 <CAK8P3a3AXRp_v_7hkoJA28tUCiSh1eYzbk4Q4h29OqL6y-KL8A@mail.gmail.com>
 <AM5PR04MB329934765FB8EB1828743D79F50B0@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <CAK8P3a0kKb7njiJvUkwJYwf-yc-hEyErSiWcvbdf0XnMoctzrg@mail.gmail.com>
In-Reply-To: <CAK8P3a0kKb7njiJvUkwJYwf-yc-hEyErSiWcvbdf0XnMoctzrg@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 17 May 2019 12:44:22 +0200
Message-ID: <CAKv+Gu-WVcVvqPoH3gsz8G3Dwizne81MAQAUGNnGrpthvUiSnw@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH 2/3] arm64: dts: ls1028a: Add PCIe controller DT
 nodes
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Roy Zang <roy.zang@nxp.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Xiaowei Bao <xiaowei.bao@nxp.com>, DTML <devicetree@vger.kernel.org>,
 gregkh <gregkh@linuxfoundation.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 Philippe Ombredanne <pombredanne@nexb.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kishon <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Shawn Guo <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Kate Stewart <kstewart@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 17 May 2019 at 10:59, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, May 17, 2019 at 5:21 AM Xiaowei Bao <xiaowei.bao@nxp.com> wrote:
> > -----Original Message-----
> > From: Arnd Bergmann <arnd@arndb.de>
> > On Wed, May 15, 2019 at 9:36 AM Xiaowei Bao <xiaowei.bao@nxp.com> wrote=
:
> > > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi |   52 ++++++++++++++=
++++++++++
> > >  1 files changed, 52 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/ar=
m64/boot/dts/freescale/fsl-ls1028a.dtsi
> > > index b045812..50b579b 100644
> > > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > > @@ -398,6 +398,58 @@
> > >                         status =3D "disabled";
> > >                 };
> > >
> > > +               pcie@3400000 {
> > > +                       compatible =3D "fsl,ls1028a-pcie";
> > > +                       reg =3D <0x00 0x03400000 0x0 0x00100000   /* =
controller registers */
> > > +                              0x80 0x00000000 0x0 0x00002000>; /* co=
nfiguration space */
> > > +                       reg-names =3D "regs", "config";
> > > +                       interrupts =3D <GIC_SPI 108 IRQ_TYPE_LEVEL_HI=
GH>, /* PME interrupt */
> > > +                                    <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH=
>; /* aer interrupt */
> > > +                       interrupt-names =3D "pme", "aer";
> > > +                       #address-cells =3D <3>;
> > > +                       #size-cells =3D <2>;
> > > +                       device_type =3D "pci";
> > > +                       dma-coherent;
> > > +                       num-lanes =3D <4>;
> > > +                       bus-range =3D <0x0 0xff>;
> > > +                       ranges =3D <0x81000000 0x0 0x00000000 0x80 0x=
00010000 0x0 0x00010000   /* downstream I/O */
> > > +                                 0x82000000 0x0 0x40000000 0x80 0x40=
000000 0x0 0x40000000>; /* non-prefetchable memory */
> >
> > Are you sure there is no support for 64-bit BARs or prefetchable memory=
?
> > [Xiaowei Bao] sorry for late reply, Thought that our Layerscape platfor=
m has not added prefetchable memory support in DTS, so this platform has no=
t been added, I will submit a separate patch to add prefetchable memory sup=
port for all Layerscape platforms.
>
> Ok, thanks.
>
> > Of course, the prefetchable PCIE device can work in our boards, because=
 the RC will
> > assign non-prefetchable memory for this device. We reserve 1G no-prefet=
chable
> > memory for PCIE device, it is enough for general devices.
>
> Sure, many devices work just fine, this is mostly a question of supportin=
g those
> devices that do require multiple gigabytes, or that need prefetchable mem=
ory
> semantics to get the expected performance. GPUs are the obvious example,
> but I think there are others (infiniband?).
>

Some implementations of the Synopsys dw PCIe IP contain a 'root port'
(within quotes because it is not actually a root port but an arbitrary
set of MMIO registers that looks like a type 01 config region) that
does not permit the prefetchable bridge window BAR to be written (a
thing which is apparently permitted by the PCIe spec). So while the
host bridge is capable of supporting more than one MMIO BAR window,
the OS visible software interface does not expose this functionality

In practice, it probably doesn't matter, since the driver uses the
same iATU attributes for prefetchable and non-prefetchable windows,
but I guess 1 GB of MMIO BAR space is a bit restrictive for modern
systems.
