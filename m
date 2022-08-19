Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6DE59A892
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 00:35:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8c5Q1Dkhz3fHm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 08:35:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=reYgRlcm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=reYgRlcm;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8c4g2qB8z3fBj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 08:34:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=srw+B0lt25Uk8V1RVsMgpEZ2IPWMbJUx+/4Q3wVt0bA=; b=reYgRlcmliYnCdzsm2mAVcPYgB
	CtidlA7Bqsu15v1f7j8GEehKhdqKu0N7ufjGrQAZVPR71+YDw1u3evzzW3ocdp9aDuDn0pSI4ZwTW
	yjxBB4qdh5l7DpheNC0oYb8AK5rKF2qTD32nNwIvdFQo88sevY4VZPLOM7MhjICee3UPzCCWOmCum
	cGjcvgrk/LNrED/1OxFe465et0dAjiYsBjaMfdpkEZSn8yZNs26f/7IVleBTpwqUpQfVMr4T1nuKD
	4SqGBaljOX1PAp7QOxrMDydALnLVvtxSkjaqk0lYmS02I3J3jki18kGWZDMUfvoNMnx57zsVXqxEi
	7o/ZPQCg==;
Received: from [2601:1c0:6280:3f0::a6b3]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPAZD-00Cvld-FQ; Fri, 19 Aug 2022 22:34:15 +0000
Message-ID: <35c0ff6a-387d-3c01-66b3-f659cfe67c2a@infradead.org>
Date: Fri, 19 Aug 2022 15:34:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] powerpc: Add support for early debugging via Serial 16550
 console
Content-Language: en-US
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Nick Child <nick.child@ibm.com>
References: <20220819211254.22192-1-pali@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220819211254.22192-1-pali@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi--

On 8/19/22 14:12, Pali Rohár wrote:
> Currently powerpc early debugging contains lot of platform specific
> options, but does not support standard UART / serial 16550 console.
> 
> Later legacy_serial.c code supports registering UART as early debug console
> from device tree but it is not early during booting, but rather later after
> machine description code finishes.
> 
> So for real early debugging via UART is current code unsuitable.
> 
> Add support for new early debugging option CONFIG_PPC_EARLY_DEBUG_16550
> which enable Serial 16550 console on address defined by new option
> CONFIG_PPC_EARLY_DEBUG_16550_PHYSADDR and by stride by option
> CONFIG_PPC_EARLY_DEBUG_16550_STRIDE.
> 
> With this change it is possible to debug powerpc machine descriptor code.
> For example this early debugging code can print on serial console also
> "No suitable machine description found" error which is done before
> legacy_serial.c code.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---
> Tested on P2020 board. It allowed me do debug and implement this patch series:
> https://lore.kernel.org/linuxppc-dev/20220819191557.28116-1-pali@kernel.org/
> ---
>  arch/powerpc/Kconfig.debug       | 14 ++++++++++++++
>  arch/powerpc/include/asm/udbg.h  |  1 +
>  arch/powerpc/kernel/udbg.c       |  2 ++
>  arch/powerpc/kernel/udbg_16550.c | 33 ++++++++++++++++++++++++++++++++
>  4 files changed, 50 insertions(+)
> 
> diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
> index 9f363c143d86..a4e7d90a45d2 100644
> --- a/arch/powerpc/Kconfig.debug
> +++ b/arch/powerpc/Kconfig.debug
> @@ -276,6 +276,11 @@ config PPC_EARLY_DEBUG_OPAL_HVSI
>  	  Select this to enable early debugging for the PowerNV platform
>  	  using an "hvsi" console
>  
> +config PPC_EARLY_DEBUG_16550
> +	bool "Serial 16550"
> +	help
> +	  Select this to enable early debugging via Serial 16550 console
> +
>  config PPC_EARLY_DEBUG_MEMCONS
>  	bool "In memory console"
>  	help
> @@ -355,6 +360,15 @@ config PPC_EARLY_DEBUG_CPM_ADDR
>  	  platform probing is done, all platforms selected must
>  	  share the same address.
>  
> +config PPC_EARLY_DEBUG_16550_PHYSADDR
> +	hex "Early debug Serial 16550 physical address"
> +	depends on PPC_EARLY_DEBUG_16550

Is there any chance that you could provide a default value here
so that 'make olddefconfig' does not end up like it does
without having a default value?

CONFIG_PPC_EARLY_DEBUG_16550=y
# CONFIG_PPC_EARLY_DEBUG_MEMCONS is not set
CONFIG_PPC_EARLY_DEBUG_16550_PHYSADDR=
CONFIG_PPC_EARLY_DEBUG_16550_STRIDE=1

which then causes a kconfig prompt when starting
the build...

> +
> +config PPC_EARLY_DEBUG_16550_STRIDE
> +	int "Early debug Serial 16550 stride"
> +	depends on PPC_EARLY_DEBUG_16550
> +	default 1
> +
>  config FAIL_IOMMU
>  	bool "Fault-injection capability for IOMMU"
>  	depends on FAULT_INJECTION

Thanks.
-- 
~Randy
