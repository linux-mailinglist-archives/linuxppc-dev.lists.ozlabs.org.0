Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1266A28E6DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 21:03:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBMJK0232zDqwF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 06:03:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=crapouillou.net (client-ip=89.234.176.197; helo=aposti.net;
 envelope-from=paul@crapouillou.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=crapouillou.net
X-Greylist: delayed 323 seconds by postgrey-1.36 at bilbo;
 Thu, 15 Oct 2020 06:01:50 AEDT
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBMGQ11J2zDqnZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 06:01:50 +1100 (AEDT)
Date: Wed, 14 Oct 2020 20:56:01 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes name
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-Id: <DLG7IQ.15UXZI2H6RYC3@crapouillou.net>
In-Reply-To: <20201014101402.18271-19-Sergey.Semin@baikalelectronics.ru>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-19-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Mackerras <paulus@samba.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Wei Xu <xuwei5@hisilicon.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Kevin Hilman <khilman@baylibre.com>, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@synopsys.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le mer. 14 oct. 2020 =E0 13:14, Serge Semin=20
<Sergey.Semin@baikalelectronics.ru> a =E9crit :
> In accordance with the Generic EHCI/OHCI bindings the corresponding=20
> node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Let's fix the DTS files, which have the nodes defined=20
> with
> incompatible names.
>=20
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>=20
> ---
>=20
> Please, test the patch out to make sure it doesn't brake the=20
> dependent DTS
> files. I did only a manual grepping of the possible nodes=20
> dependencies.
> ---
>  arch/arc/boot/dts/axs10x_mb.dtsi               | 4 ++--
>  arch/arc/boot/dts/hsdk.dts                     | 4 ++--
>  arch/arc/boot/dts/vdk_axs10x_mb.dtsi           | 2 +-
>  arch/arm/boot/dts/bcm5301x.dtsi                | 4 ++--
>  arch/arm/boot/dts/bcm53573.dtsi                | 4 ++--
>  arch/arm/boot/dts/hisi-x5hd2.dtsi              | 4 ++--
>  arch/arm/boot/dts/lpc18xx.dtsi                 | 4 ++--
>  arch/arm/boot/dts/stm32mp151.dtsi              | 4 ++--
>  arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 4 ++--
>  arch/arm64/boot/dts/hisilicon/hip06.dtsi       | 4 ++--
>  arch/arm64/boot/dts/hisilicon/hip07.dtsi       | 4 ++--
>  arch/mips/boot/dts/ingenic/jz4740.dtsi         | 2 +-
>  arch/mips/boot/dts/ingenic/jz4770.dtsi         | 2 +-

For jz4740.dtsi and jz4770.dtsi:
Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

>  arch/mips/boot/dts/mti/sead3.dts               | 2 +-
>  arch/mips/boot/dts/ralink/mt7628a.dtsi         | 2 +-
>  arch/powerpc/boot/dts/akebono.dts              | 6 +++---
>  16 files changed, 28 insertions(+), 28 deletions(-)
>=20
> diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi=20
> b/arch/arc/boot/dts/axs10x_mb.dtsi
> index 99d3e7175bf7..b64435385304 100644
> --- a/arch/arc/boot/dts/axs10x_mb.dtsi
> +++ b/arch/arc/boot/dts/axs10x_mb.dtsi
> @@ -87,13 +87,13 @@ gmac: ethernet@18000 {
>  			mac-address =3D [00 00 00 00 00 00]; /* Filled in by U-Boot */
>  		};
>=20
> -		ehci@40000 {
> +		usb@40000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D < 0x40000 0x100 >;
>  			interrupts =3D < 8 >;
>  		};
>=20
> -		ohci@60000 {
> +		usb@60000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D < 0x60000 0x100 >;
>  			interrupts =3D < 8 >;
> diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
> index dcaa44e408ac..fdd4f7f635d3 100644
> --- a/arch/arc/boot/dts/hsdk.dts
> +++ b/arch/arc/boot/dts/hsdk.dts
> @@ -234,7 +234,7 @@ phy0: ethernet-phy@0 { /* Micrel KSZ9031 */
>  			};
>  		};
>=20
> -		ohci@60000 {
> +		usb@60000 {
>  			compatible =3D "snps,hsdk-v1.0-ohci", "generic-ohci";
>  			reg =3D <0x60000 0x100>;
>  			interrupts =3D <15>;
> @@ -242,7 +242,7 @@ ohci@60000 {
>  			dma-coherent;
>  		};
>=20
> -		ehci@40000 {
> +		usb@40000 {
>  			compatible =3D "snps,hsdk-v1.0-ehci", "generic-ehci";
>  			reg =3D <0x40000 0x100>;
>  			interrupts =3D <15>;
> diff --git a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi=20
> b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
> index cbb179770293..90a412026e64 100644
> --- a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
> +++ b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
> @@ -46,7 +46,7 @@ ethernet@18000 {
>  			clock-names =3D "stmmaceth";
>  		};
>=20
> -		ehci@40000 {
> +		usb@40000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D < 0x40000 0x100 >;
>  			interrupts =3D < 8 >;
> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi=20
> b/arch/arm/boot/dts/bcm5301x.dtsi
> index 0016720ce530..bf5656d79a55 100644
> --- a/arch/arm/boot/dts/bcm5301x.dtsi
> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
> @@ -261,7 +261,7 @@ usb2: usb2@21000 {
>=20
>  			interrupt-parent =3D <&gic>;
>=20
> -			ehci: ehci@21000 {
> +			ehci: usb@21000 {
>  				#usb-cells =3D <0>;
>=20
>  				compatible =3D "generic-ehci";
> @@ -283,7 +283,7 @@ ehci_port2: port@2 {
>  				};
>  			};
>=20
> -			ohci: ohci@22000 {
> +			ohci: usb@22000 {
>  				#usb-cells =3D <0>;
>=20
>  				compatible =3D "generic-ohci";
> diff --git a/arch/arm/boot/dts/bcm53573.dtsi=20
> b/arch/arm/boot/dts/bcm53573.dtsi
> index 4af8e3293cff..51546fccc616 100644
> --- a/arch/arm/boot/dts/bcm53573.dtsi
> +++ b/arch/arm/boot/dts/bcm53573.dtsi
> @@ -135,7 +135,7 @@ usb2: usb2@4000 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>=20
> -			ehci: ehci@4000 {
> +			ehci: usb@4000 {
>  				compatible =3D "generic-ehci";
>  				reg =3D <0x4000 0x1000>;
>  				interrupt-parent =3D <&gic>;
> @@ -155,7 +155,7 @@ ehci_port2: port@2 {
>  				};
>  			};
>=20
> -			ohci: ohci@d000 {
> +			ohci: usb@d000 {
>  				#usb-cells =3D <0>;
>=20
>  				compatible =3D "generic-ohci";
> diff --git a/arch/arm/boot/dts/hisi-x5hd2.dtsi=20
> b/arch/arm/boot/dts/hisi-x5hd2.dtsi
> index 3ee7967c202d..693b85b2cc7d 100644
> --- a/arch/arm/boot/dts/hisi-x5hd2.dtsi
> +++ b/arch/arm/boot/dts/hisi-x5hd2.dtsi
> @@ -452,14 +452,14 @@ gmac1: ethernet@1841000 {
>  			status =3D "disabled";
>  		};
>=20
> -		usb0: ehci@1890000 {
> +		usb0: usb@1890000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D <0x1890000 0x1000>;
>  			interrupts =3D <0 66 4>;
>  			clocks =3D <&clock HIX5HD2_USB_CLK>;
>  		};
>=20
> -		usb1: ohci@1880000 {
> +		usb1: usb@1880000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D <0x1880000 0x1000>;
>  			interrupts =3D <0 67 4>;
> diff --git a/arch/arm/boot/dts/lpc18xx.dtsi=20
> b/arch/arm/boot/dts/lpc18xx.dtsi
> index 10b8249b8ab6..82ffd7b0ad8a 100644
> --- a/arch/arm/boot/dts/lpc18xx.dtsi
> +++ b/arch/arm/boot/dts/lpc18xx.dtsi
> @@ -121,7 +121,7 @@ mmcsd: mmcsd@40004000 {
>  			status =3D "disabled";
>  		};
>=20
> -		usb0: ehci@40006100 {
> +		usb0: usb@40006100 {
>  			compatible =3D "nxp,lpc1850-ehci", "generic-ehci";
>  			reg =3D <0x40006100 0x100>;
>  			interrupts =3D <8>;
> @@ -133,7 +133,7 @@ usb0: ehci@40006100 {
>  			status =3D "disabled";
>  		};
>=20
> -		usb1: ehci@40007100 {
> +		usb1: usb@40007100 {
>  			compatible =3D "nxp,lpc1850-ehci", "generic-ehci";
>  			reg =3D <0x40007100 0x100>;
>  			interrupts =3D <9>;
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi=20
> b/arch/arm/boot/dts/stm32mp151.dtsi
> index bfe29023fbd5..576f7da564c5 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1404,7 +1404,7 @@ ethernet0: ethernet@5800a000 {
>  			status =3D "disabled";
>  		};
>=20
> -		usbh_ohci: usbh-ohci@5800c000 {
> +		usbh_ohci: usb@5800c000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D <0x5800c000 0x1000>;
>  			clocks =3D <&rcc USBH>;
> @@ -1413,7 +1413,7 @@ usbh_ohci: usbh-ohci@5800c000 {
>  			status =3D "disabled";
>  		};
>=20
> -		usbh_ehci: usbh-ehci@5800d000 {
> +		usbh_ehci: usb@5800d000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D <0x5800d000 0x1000>;
>  			clocks =3D <&rcc USBH>;
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi=20
> b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> index 12bc1d3ed424..a4acecb75c89 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> @@ -585,7 +585,7 @@ pcie: pcie@9860000 {
>  			status =3D "disabled";
>  		};
>=20
> -		ohci: ohci@9880000 {
> +		ohci: usb@9880000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D <0x9880000 0x10000>;
>  			interrupts =3D <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> @@ -600,7 +600,7 @@ ohci: ohci@9880000 {
>  			status =3D "disabled";
>  		};
>=20
> -		ehci: ehci@9890000 {
> +		ehci: usb@9890000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D <0x9890000 0x10000>;
>  			interrupts =3D <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/hisilicon/hip06.dtsi=20
> b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
> index 50ceaa959bdc..1226440d54ad 100644
> --- a/arch/arm64/boot/dts/hisilicon/hip06.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
> @@ -373,7 +373,7 @@ refclk: refclk {
>  			#clock-cells =3D <0>;
>  		};
>=20
> -		usb_ohci: ohci@a7030000 {
> +		usb_ohci: usb@a7030000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D <0x0 0xa7030000 0x0 0x10000>;
>  			interrupt-parent =3D <&mbigen_usb>;
> @@ -382,7 +382,7 @@ usb_ohci: ohci@a7030000 {
>  			status =3D "disabled";
>  		};
>=20
> -		usb_ehci: ehci@a7020000 {
> +		usb_ehci: usb@a7020000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D <0x0 0xa7020000 0x0 0x10000>;
>  			interrupt-parent =3D <&mbigen_usb>;
> diff --git a/arch/arm64/boot/dts/hisilicon/hip07.dtsi=20
> b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
> index 4773a533fce5..93f99a5255ac 100644
> --- a/arch/arm64/boot/dts/hisilicon/hip07.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
> @@ -1253,7 +1253,7 @@ uart0: uart@602b0000 {
>  			status =3D "disabled";
>  		};
>=20
> -		usb_ohci: ohci@a7030000 {
> +		usb_ohci: usb@a7030000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D <0x0 0xa7030000 0x0 0x10000>;
>  			interrupt-parent =3D <&mbigen_usb>;
> @@ -1262,7 +1262,7 @@ usb_ohci: ohci@a7030000 {
>  			status =3D "disabled";
>  		};
>=20
> -		usb_ehci: ehci@a7020000 {
> +		usb_ehci: usb@a7020000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D <0x0 0xa7020000 0x0 0x10000>;
>  			interrupt-parent =3D <&mbigen_usb>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi=20
> b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> index 1520585c235c..b989ff62ffbc 100644
> --- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> @@ -281,7 +281,7 @@ dmac: dma-controller@13020000 {
>  		clocks =3D <&cgu JZ4740_CLK_DMA>;
>  	};
>=20
> -	uhc: uhc@13030000 {
> +	uhc: usb@13030000 {
>  		compatible =3D "ingenic,jz4740-ohci", "generic-ohci";
>  		reg =3D <0x13030000 0x1000>;
>=20
> diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi=20
> b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> index fa11ac950499..e45c03038826 100644
> --- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> @@ -417,7 +417,7 @@ dmac1: dma-controller@13420100 {
>  		interrupts =3D <23>;
>  	};
>=20
> -	uhc: uhc@13430000 {
> +	uhc: usb@13430000 {
>  		compatible =3D "generic-ohci";
>  		reg =3D <0x13430000 0x1000>;
>=20
> diff --git a/arch/mips/boot/dts/mti/sead3.dts=20
> b/arch/mips/boot/dts/mti/sead3.dts
> index 192c26ff1d3d..1cf6728af8fe 100644
> --- a/arch/mips/boot/dts/mti/sead3.dts
> +++ b/arch/mips/boot/dts/mti/sead3.dts
> @@ -56,7 +56,7 @@ gic: interrupt-controller@1b1c0000 {
>  		interrupt-parent =3D <&cpu_intc>;
>  	};
>=20
> -	ehci@1b200000 {
> +	usb@1b200000 {
>  		compatible =3D "generic-ehci";
>  		reg =3D <0x1b200000 0x1000>;
>=20
> diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi=20
> b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> index 892e8ab863c5..45bf96a3d17a 100644
> --- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> @@ -275,7 +275,7 @@ usb_phy: usb-phy@10120000 {
>  		reset-names =3D "host", "device";
>  	};
>=20
> -	ehci@101c0000 {
> +	usb@101c0000 {
>  		compatible =3D "generic-ehci";
>  		reg =3D <0x101c0000 0x1000>;
>=20
> diff --git a/arch/powerpc/boot/dts/akebono.dts=20
> b/arch/powerpc/boot/dts/akebono.dts
> index df18f8dc4642..343326c30380 100644
> --- a/arch/powerpc/boot/dts/akebono.dts
> +++ b/arch/powerpc/boot/dts/akebono.dts
> @@ -126,7 +126,7 @@ SATA0: sata@30000010000 {
>  			interrupts =3D <93 2>;
>  		};
>=20
> -		EHCI0: ehci@30010000000 {
> +		EHCI0: usb@30010000000 {
>  			compatible =3D "ibm,476gtr-ehci", "generic-ehci";
>  			reg =3D <0x300 0x10000000 0x0 0x10000>;
>  			interrupt-parent =3D <&MPIC>;
> @@ -140,14 +140,14 @@ SD0: sd@30000000000 {
>  			interrupt-parent =3D <&MPIC>;
>  		};
>=20
> -		OHCI0: ohci@30010010000 {
> +		OHCI0: usb@30010010000 {
>  			compatible =3D "ibm,476gtr-ohci", "generic-ohci";
>  			reg =3D <0x300 0x10010000 0x0 0x10000>;
>  			interrupt-parent =3D <&MPIC>;
>  			interrupts =3D <89 1>;
>  			};
>=20
> -		OHCI1: ohci@30010020000 {
> +		OHCI1: usb@30010020000 {
>  			compatible =3D "ibm,476gtr-ohci", "generic-ohci";
>  			reg =3D <0x300 0x10020000 0x0 0x10000>;
>  			interrupt-parent =3D <&MPIC>;
> --
> 2.27.0
>=20


