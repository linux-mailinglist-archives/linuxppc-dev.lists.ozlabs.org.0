Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFC3215D4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 11:00:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4552LN4jXgzDqRc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 19:00:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.196; helo=mail-qt1-f196.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4552Jx2YdGzDqRJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 18:58:57 +1000 (AEST)
Received: by mail-qt1-f196.google.com with SMTP id f24so7094820qtk.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 01:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lUdOq+gx0nXT1b9GsinnX5s7hPrX6YoGJqW2/FU2LMQ=;
 b=oxAPqQk7T5Egxoz9CoOAfMimC4u8rFc+hqPXCmlLoFjD0P/gmH4d7sX+bsvQ0qYlhy
 G23BeiojtJup8dMH0hwyaiKXNfSlgyFvQnpGVXpefvhn2UCv5Ot/ZXwRm4i7f4jgVjLs
 SHrMXC8sVNDO6xyyzPQ2DlXo4Z7uF6/l0NBDcGAkhQzxBZdMIdgd0mlSCnl8Br6zE5zF
 e+2+BMU5xRsP7tk7TYhi8bmxS/PWBAINMp5n0DPc3+M3mxaLAkJhyKhp/rHSH/dYSLs/
 Ps3so/XMxjMgXMvIwnTts/3ZgzSTHK7p74wCPVoSvfrcPOJWfQobr5ee7yG0tu6Gbk2+
 zl9A==
X-Gm-Message-State: APjAAAWvRHADu2j5doJB67+RU4RwsjkbbZ3Kup/pyHrHYaJ6u860L7I+
 Ygo3fnpttNpNoCRmh8v/CjWnJyTQW41t+of5aQQ=
X-Google-Smtp-Source: APXvYqwNxbxFr/vzS1RXQZDBTDKL/hVCvagOotGDm724YF5ym/q8RL/him/sN27hB8O1MZtVcEFf95bHEOo3m0FhXo8=
X-Received: by 2002:ac8:2a05:: with SMTP id k5mr30063052qtk.304.1558083534352; 
 Fri, 17 May 2019 01:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190515072747.39941-1-xiaowei.bao@nxp.com>
 <20190515072747.39941-2-xiaowei.bao@nxp.com>
 <CAK8P3a3AXRp_v_7hkoJA28tUCiSh1eYzbk4Q4h29OqL6y-KL8A@mail.gmail.com>
 <AM5PR04MB329934765FB8EB1828743D79F50B0@AM5PR04MB3299.eurprd04.prod.outlook.com>
In-Reply-To: <AM5PR04MB329934765FB8EB1828743D79F50B0@AM5PR04MB3299.eurprd04.prod.outlook.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 May 2019 10:58:37 +0200
Message-ID: <CAK8P3a0kKb7njiJvUkwJYwf-yc-hEyErSiWcvbdf0XnMoctzrg@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH 2/3] arm64: dts: ls1028a: Add PCIe controller DT
 nodes
To: Xiaowei Bao <xiaowei.bao@nxp.com>
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
 DTML <devicetree@vger.kernel.org>, gregkh <gregkh@linuxfoundation.org>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kishon <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Leo Li <leoyang.li@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 17, 2019 at 5:21 AM Xiaowei Bao <xiaowei.bao@nxp.com> wrote:
> -----Original Message-----
> From: Arnd Bergmann <arnd@arndb.de>
> On Wed, May 15, 2019 at 9:36 AM Xiaowei Bao <xiaowei.bao@nxp.com> wrote:
> > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi |   52 ++++++++++++++++=
++++++++
> >  1 files changed, 52 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm6=
4/boot/dts/freescale/fsl-ls1028a.dtsi
> > index b045812..50b579b 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > @@ -398,6 +398,58 @@
> >                         status =3D "disabled";
> >                 };
> >
> > +               pcie@3400000 {
> > +                       compatible =3D "fsl,ls1028a-pcie";
> > +                       reg =3D <0x00 0x03400000 0x0 0x00100000   /* co=
ntroller registers */
> > +                              0x80 0x00000000 0x0 0x00002000>; /* conf=
iguration space */
> > +                       reg-names =3D "regs", "config";
> > +                       interrupts =3D <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH=
>, /* PME interrupt */
> > +                                    <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;=
 /* aer interrupt */
> > +                       interrupt-names =3D "pme", "aer";
> > +                       #address-cells =3D <3>;
> > +                       #size-cells =3D <2>;
> > +                       device_type =3D "pci";
> > +                       dma-coherent;
> > +                       num-lanes =3D <4>;
> > +                       bus-range =3D <0x0 0xff>;
> > +                       ranges =3D <0x81000000 0x0 0x00000000 0x80 0x00=
010000 0x0 0x00010000   /* downstream I/O */
> > +                                 0x82000000 0x0 0x40000000 0x80 0x4000=
0000 0x0 0x40000000>; /* non-prefetchable memory */
>
> Are you sure there is no support for 64-bit BARs or prefetchable memory?
> [Xiaowei Bao] sorry for late reply, Thought that our Layerscape platform =
has not added prefetchable memory support in DTS, so this platform has not =
been added, I will submit a separate patch to add prefetchable memory suppo=
rt for all Layerscape platforms.

Ok, thanks.

> Of course, the prefetchable PCIE device can work in our boards, because t=
he RC will
> assign non-prefetchable memory for this device. We reserve 1G no-prefetch=
able
> memory for PCIE device, it is enough for general devices.

Sure, many devices work just fine, this is mostly a question of supporting =
those
devices that do require multiple gigabytes, or that need prefetchable memor=
y
semantics to get the expected performance. GPUs are the obvious example,
but I think there are others (infiniband?).

      Arnd
