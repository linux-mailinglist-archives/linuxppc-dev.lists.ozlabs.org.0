Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 659D04CAA13
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 17:24:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7zvn3flxz3brn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 03:24:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7zvM4zWTz3bky
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 03:23:41 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K7zvH3rXNz9sSR;
 Wed,  2 Mar 2022 17:23:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g3_V2IdfLWdQ; Wed,  2 Mar 2022 17:23:39 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K7zvH2zcrz9sSN;
 Wed,  2 Mar 2022 17:23:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5597B8B76D;
 Wed,  2 Mar 2022 17:23:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id jM4um5h1j013; Wed,  2 Mar 2022 17:23:39 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 241D08B763;
 Wed,  2 Mar 2022 17:23:39 +0100 (CET)
Message-ID: <d67e43a5-a654-e622-bab8-d2f55a7013f3@csgroup.eu>
Date: Wed, 2 Mar 2022 17:23:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Reoprt] Some compile warning on ppc dts
Content-Language: fr-FR
To: "chenjun (AM)" <chenjun102@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Rob Herring <robh+dt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <CE1E7D7EFA066443B6454A6A5063B50220CCBBE4@dggeml509-mbx.china.huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CE1E7D7EFA066443B6454A6A5063B50220CCBBE4@dggeml509-mbx.china.huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "Xiangrui \(Euler\)" <rui.xiang@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/03/2021 à 03:16, chenjun (AM) a écrit :
> Hi
> 
> After run the following commands
> make distclean
> make allmodconfig ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu-
> make oldconfig ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu-
> make -j64 ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu-
> 
> I get some warning:
> arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge):
> /pci@f0000d00: missing ranges for PCI bridg
> e (or not a bridge)
> arch/powerpc/boot/dts/o2dnt2.dtb: Warning (pci_device_bus_num): Failed
> prerequisite 'pci_bridge'
> arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning
> (spi_bus_bridge): /soc5200@f0000000/psc@2000: node name f
> or SPI buses should be 'spi'
>     also defined at arch/powerpc/boot/dts/o2d.dtsi:32.12-43.5
> arch/powerpc/boot/dts/o2dnt2.dtb: Warning (spi_bus_reg): Failed
> prerequisite 'spi_bus_bridge'
> ...
> 
> For the problem about "node name for SPI buses should be 'spi'":
> Rename the psc@2000 to spi@2000 in arch/powerpc/boot/dts/o2d.dtsi can
> fix it.
> diff --git a/arch/powerpc/boot/dts/o2d.dtsi b/arch/powerpc/boot/dts/o2d.dtsi
> index 6661955a2be4..cd3dc70cd72e 100644
> --- a/arch/powerpc/boot/dts/o2d.dtsi
> +++ b/arch/powerpc/boot/dts/o2d.dtsi
> @@ -29,7 +29,7 @@ rtc@800 {
>    >------>------->-------status = "disabled";
>    >------>-------};
> -
> ->------>-------psc@2000 {>----->-------// PSC1
> +>------>-------spi@2000 {>----->-------// PSC1
>    >------>------->-------compatible =
> "fsl,mpc5200b-psc-spi","fsl,mpc5200-psc-spi";
>    >------>------->-------#address-cells = <1>;
>    >------>------->-------#size-cells = <0>;
> ---
> 
> For the problem about "missing ranges for PCI bridge (or not a bridge)":
> Ranges should be add in arch/powerpc/boot/dts/mpc5200b.dtsi.
>   >-------pci: pci@f0000d00 {
>   >------->-------#interrupt-cells = <1>;
>   >------->-------#size-cells = <2>;
>   >------->-------#address-cells = <3>;
>   >------->-------device_type = "pci";
>   >------->-------compatible = "fsl,mpc5200b-pci","fsl,mpc5200-pci";
>   >------->-------reg = <0xf0000d00 0x100>;
>   >------->-------// interrupt-map-mask = need to add
>   >------->-------// interrupt-map = need to add
>   >------->-------clock-frequency = <0>; // From boot loader
>   >------->-------interrupts = <2 8 0 2 9 0 2 10 0>;
>   >------->-------bus-range = <0 0>;
>   >------->-------// ranges = need to add
>   >-------};
> I think the ranges should be add by someone who knows the mpc5200 better.
> 


This patch has garbage instead of tabs, it doesn't apply
