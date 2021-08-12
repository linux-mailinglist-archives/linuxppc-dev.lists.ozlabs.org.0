Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F303EA55B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 15:20:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlnPh1kKtz3bmf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 23:20:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=h1qi=nd=csgroup.eu=christophe.leroy@ozlabs.org;
 receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlnP92L0Wz308y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 23:20:28 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4GlnP64s8Dz9sXN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 23:20:26 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4GlnP56vSmz9sX1; Thu, 12 Aug 2021 23:20:25 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
X-Greylist: delayed 326 seconds by postgrey-1.36 at bilbo;
 Thu, 12 Aug 2021 23:20:24 AEST
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4GlnP41Qnyz9sX3;
 Thu, 12 Aug 2021 23:20:21 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GlnGZ5zYBz9sWJ;
 Thu, 12 Aug 2021 15:14:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RswT0CDLhd46; Thu, 12 Aug 2021 15:14:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GlnGZ4yXVz9sWH;
 Thu, 12 Aug 2021 15:14:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B1CC8B7E8;
 Thu, 12 Aug 2021 15:14:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 38FLmLl4xNsD; Thu, 12 Aug 2021 15:14:46 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3B9698B7DD;
 Thu, 12 Aug 2021 15:14:46 +0200 (CEST)
Subject: Re: [PATCH v2 5/9] powerpc/microwatt: Use standard 16550 UART for
 console
To: Paul Mackerras <paulus@ozlabs.org>, linuxppc-dev@ozlabs.org
References: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
 <YMwXGCTzedpQje7r@thinks.paulus.ozlabs.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ec000575-7f7a-57b7-50d2-9444e17f2a7e@csgroup.eu>
Date: Thu, 12 Aug 2021 15:14:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YMwXGCTzedpQje7r@thinks.paulus.ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/06/2021 à 05:46, Paul Mackerras a écrit :
> From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> 
> This adds support to the Microwatt platform to use the standard
> 16550-style UART which available in the standalone Microwatt FPGA.
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> ---
>   arch/powerpc/boot/dts/microwatt.dts      | 27 ++++++++++++----
>   arch/powerpc/kernel/udbg_16550.c         | 39 ++++++++++++++++++++++++
>   arch/powerpc/platforms/microwatt/Kconfig |  1 +
>   arch/powerpc/platforms/microwatt/setup.c |  2 ++
>   4 files changed, 63 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
> index 04e5dd92270e..974abbdda249 100644
> --- a/arch/powerpc/boot/dts/microwatt.dts
> +++ b/arch/powerpc/boot/dts/microwatt.dts
> @@ -6,6 +6,10 @@ / {
>   	model-name = "microwatt";
>   	compatible = "microwatt-soc";
>   
> +	aliases {
> +		serial0 = &UART0;
> +	};
> +
>   	reserved-memory {
>   		#size-cells = <0x02>;
>   		#address-cells = <0x02>;
> @@ -89,12 +93,6 @@ PowerPC,Microwatt@0 {
>   		};
>   	};
>   
> -	chosen {
> -		bootargs = "";
> -		ibm,architecture-vec-5 = [19 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00
> -					  00 00 00 00 00 00 00 00 40 00 40];
> -	};
> -
>   	soc@c0000000 {
>   		compatible = "simple-bus";
>   		#address-cells = <1>;
> @@ -119,5 +117,22 @@ ICS: interrupt-controller@5000 {
>   			#interrupt-cells = <2>;
>   		};
>   
> +		UART0: serial@2000 {
> +			device_type = "serial";
> +			compatible = "ns16550";
> +			reg = <0x2000 0x8>;
> +			clock-frequency = <100000000>;
> +			current-speed = <115200>;
> +			reg-shift = <2>;
> +			fifo-size = <16>;
> +			interrupts = <0x10 0x1>;
> +		};
> +	};
> +
> +	chosen {
> +		bootargs = "";
> +		ibm,architecture-vec-5 = [19 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00
> +					  00 00 00 00 00 00 00 00 40 00 40];
> +		stdout-path = &UART0;
>   	};
>   };
> diff --git a/arch/powerpc/kernel/udbg_16550.c b/arch/powerpc/kernel/udbg_16550.c
> index 9356b60d6030..8513aa49614e 100644
> --- a/arch/powerpc/kernel/udbg_16550.c
> +++ b/arch/powerpc/kernel/udbg_16550.c
> @@ -296,3 +296,42 @@ void __init udbg_init_40x_realmode(void)
>   }
>   
>   #endif /* CONFIG_PPC_EARLY_DEBUG_40x */
> +
> +#ifdef CONFIG_PPC_EARLY_DEBUG_MICROWATT
> +
> +#define UDBG_UART_MW_ADDR	((void __iomem *)0xc0002000)
> +
> +static u8 udbg_uart_in_isa300_rm(unsigned int reg)
> +{
> +	uint64_t msr = mfmsr();
> +	uint8_t  c;
> +
> +	mtmsr(msr & ~(MSR_EE|MSR_DR));
> +	isync();
> +	eieio();
> +	c = __raw_rm_readb(UDBG_UART_MW_ADDR + (reg << 2));
> +	mtmsr(msr);
> +	isync();
> +	return c;
> +}

How do you make sure that GCC won't emit any access to the stack between the two mtmsr() ?

What about using real_205_readb() and real_205_writeb() instead ?

> +
> +static void udbg_uart_out_isa300_rm(unsigned int reg, u8 val)
> +{
> +	uint64_t msr = mfmsr();
> +
> +	mtmsr(msr & ~(MSR_EE|MSR_DR));
> +	isync();
> +	eieio();
> +	__raw_rm_writeb(val, UDBG_UART_MW_ADDR + (reg << 2));
> +	mtmsr(msr);
> +	isync();
> +}
> +
> +void __init udbg_init_debug_microwatt(void)
> +{
> +	udbg_uart_in = udbg_uart_in_isa300_rm;
> +	udbg_uart_out = udbg_uart_out_isa300_rm;
> +	udbg_use_uart();
> +}
> +
> +#endif /* CONFIG_PPC_EARLY_DEBUG_MICROWATT */
> diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
> index b52c869c0eb8..50ed0cedb5f1 100644
> --- a/arch/powerpc/platforms/microwatt/Kconfig
> +++ b/arch/powerpc/platforms/microwatt/Kconfig
> @@ -6,6 +6,7 @@ config PPC_MICROWATT
>   	select PPC_ICS_NATIVE
>   	select PPC_ICP_NATIVE
>   	select PPC_NATIVE
> +	select PPC_UDBG_16550
>   	help
>             This option enables support for FPGA-based Microwatt implementations.
>   
> diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/platforms/microwatt/setup.c
> index 1c1b7791fa57..0b02603bdb74 100644
> --- a/arch/powerpc/platforms/microwatt/setup.c
> +++ b/arch/powerpc/platforms/microwatt/setup.c
> @@ -14,6 +14,7 @@
>   #include <asm/machdep.h>
>   #include <asm/time.h>
>   #include <asm/xics.h>
> +#include <asm/udbg.h>
>   
>   static void __init microwatt_init_IRQ(void)
>   {
> @@ -35,5 +36,6 @@ define_machine(microwatt) {
>   	.name			= "microwatt",
>   	.probe			= microwatt_probe,
>   	.init_IRQ		= microwatt_init_IRQ,
> +	.progress		= udbg_progress,
>   	.calibrate_decr		= generic_calibrate_decr,
>   };
> 
