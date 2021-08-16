Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A24B3ED088
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 10:49:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp7Bf2vPVz3bXx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 18:49:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp7BD1fW2z300Q
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 18:49:07 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gp7B85mfpz9sVQ;
 Mon, 16 Aug 2021 10:49:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WG7zD1cY3IgI; Mon, 16 Aug 2021 10:49:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gp7B84mnrz9sVN;
 Mon, 16 Aug 2021 10:49:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 84CB48B78C;
 Mon, 16 Aug 2021 10:49:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id XHYfjN8DmsNE; Mon, 16 Aug 2021 10:49:04 +0200 (CEST)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 40D668B788;
 Mon, 16 Aug 2021 10:49:04 +0200 (CEST)
Subject: Re: [PATCH 2/2] powerpc/configs: Regenerate mpc885_ads_defconfig
To: Joel Stanley <joel@jms.id.au>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
References: <20210816083126.2294522-1-joel@jms.id.au>
 <20210816083126.2294522-3-joel@jms.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f02e97f3-5081-38c2-fabb-9ad4eae2c649@csgroup.eu>
Date: Mon, 16 Aug 2021 10:49:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210816083126.2294522-3-joel@jms.id.au>
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



Le 16/08/2021 à 10:31, Joel Stanley a écrit :
> Regenrate atop v5.14-rc6.

Typos.

You mean you did redo a "make savedefconfig" ?

> 
> The chagnes are mostly re-ordering, except for the following which fall
> out due to dependenacies:
> 
>   - CONFIG_DEBUG_KERNEL=y selected by EXPERT
> 
>   - CONFIG_PPC_EARLY_DEBUG_CPM_ADDR=0xff002008 which is the default
>     setting
> 
> CONFIG_MTD_PHYSMAP_OF is not longer enabled, as it depends on
> MTD_PHYSMAP which is not enabled. This is a regression from commit
> 642b1e8dbed7 ("mtd: maps: Merge physmap_of.c into physmap-core.c"),
> which added the extra dependency. Add CONFIG_MTD_PHYSMAP=y so this stays
> in the config.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   arch/powerpc/configs/mpc885_ads_defconfig | 47 +++++++++++------------
>   1 file changed, 23 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
> index 5cd17adf903f..c74dc76b1d0d 100644
> --- a/arch/powerpc/configs/mpc885_ads_defconfig
> +++ b/arch/powerpc/configs/mpc885_ads_defconfig
> @@ -1,19 +1,30 @@
> -CONFIG_PPC_8xx=y
>   # CONFIG_SWAP is not set
>   CONFIG_SYSVIPC=y
>   CONFIG_NO_HZ=y
>   CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_BPF_JIT=y
> +CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y
>   CONFIG_LOG_BUF_SHIFT=14
>   CONFIG_EXPERT=y
>   # CONFIG_ELF_CORE is not set
>   # CONFIG_BASE_FULL is not set
>   # CONFIG_FUTEX is not set
> +CONFIG_PERF_EVENTS=y
>   # CONFIG_VM_EVENT_COUNTERS is not set
> -# CONFIG_BLK_DEV_BSG is not set
> -CONFIG_PARTITION_ADVANCED=y
> +CONFIG_PPC_8xx=y
> +CONFIG_8xx_GPIO=y
> +CONFIG_SMC_UCODE_PATCH=y
> +CONFIG_PIN_TLB=y
>   CONFIG_GEN_RTC=y
>   CONFIG_HZ_100=y
> +CONFIG_MATH_EMULATION=y
> +CONFIG_PPC_16K_PAGES=y
> +CONFIG_ADVANCED_OPTIONS=y
>   # CONFIG_SECCOMP is not set
> +CONFIG_STRICT_KERNEL_RWX=y
> +CONFIG_MODULES=y
> +# CONFIG_BLK_DEV_BSG is not set
> +CONFIG_PARTITION_ADVANCED=y
>   CONFIG_NET=y
>   CONFIG_PACKET=y
>   CONFIG_UNIX=y
> @@ -33,6 +44,7 @@ CONFIG_MTD_CFI_GEOMETRY=y
>   # CONFIG_MTD_CFI_I2 is not set
>   CONFIG_MTD_CFI_I4=y
>   CONFIG_MTD_CFI_AMDSTD=y
> +CONFIG_MTD_PHYSMAP=y
>   CONFIG_MTD_PHYSMAP_OF=y
>   # CONFIG_BLK_DEV is not set
>   CONFIG_NETDEVICES=y
> @@ -45,38 +57,25 @@ CONFIG_DAVICOM_PHY=y
>   # CONFIG_LEGACY_PTYS is not set
>   CONFIG_SERIAL_CPM=y
>   CONFIG_SERIAL_CPM_CONSOLE=y
> +CONFIG_SPI=y
> +CONFIG_SPI_FSL_SPI=y
>   # CONFIG_HWMON is not set
> +CONFIG_WATCHDOG=y
> +CONFIG_8xxx_WDT=y
>   # CONFIG_USB_SUPPORT is not set
>   # CONFIG_DNOTIFY is not set
>   CONFIG_TMPFS=y
>   CONFIG_CRAMFS=y
>   CONFIG_NFS_FS=y
>   CONFIG_ROOT_NFS=y
> +CONFIG_CRYPTO=y
> +CONFIG_CRYPTO_DEV_TALITOS=y
>   CONFIG_CRC32_SLICEBY4=y
>   CONFIG_DEBUG_INFO=y
>   CONFIG_MAGIC_SYSRQ=y
> -CONFIG_DETECT_HUNG_TASK=y
> -CONFIG_PPC_16K_PAGES=y
> -CONFIG_DEBUG_KERNEL=y
>   CONFIG_DEBUG_FS=y
> -CONFIG_PPC_PTDUMP=y
> -CONFIG_MODULES=y
> -CONFIG_SPI=y
> -CONFIG_SPI_FSL_SPI=y
> -CONFIG_CRYPTO=y
> -CONFIG_CRYPTO_DEV_TALITOS=y
> -CONFIG_8xx_GPIO=y
> -CONFIG_WATCHDOG=y
> -CONFIG_8xxx_WDT=y
> -CONFIG_SMC_UCODE_PATCH=y
> -CONFIG_ADVANCED_OPTIONS=y
> -CONFIG_PIN_TLB=y
> -CONFIG_PERF_EVENTS=y
> -CONFIG_MATH_EMULATION=y
> -CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y
> -CONFIG_STRICT_KERNEL_RWX=y
> -CONFIG_BPF_JIT=y
>   CONFIG_DEBUG_VM_PGTABLE=y
> +CONFIG_DETECT_HUNG_TASK=y
>   CONFIG_BDI_SWITCH=y
>   CONFIG_PPC_EARLY_DEBUG=y
> -CONFIG_PPC_EARLY_DEBUG_CPM_ADDR=0xff002008
> +CONFIG_PPC_PTDUMP=y
> 
