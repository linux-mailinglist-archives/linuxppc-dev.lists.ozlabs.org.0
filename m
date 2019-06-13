Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04738434EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 11:46:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Pf5k258xzDrKh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 19:46:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="L0veqIHk"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Pf3n5vwJzDrHZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 19:45:09 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Pf3f5MJvzB09Zh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 11:45:02 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=L0veqIHk; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Q8623Zxric-y for <linuxppc-dev@lists.ozlabs.org>;
 Thu, 13 Jun 2019 11:45:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Pf3f4KDjzB09Zg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 11:45:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560419102; bh=rKgh1wy7xF2PSkJ48mglCp3WkDhWXqqWj+OOkJ1cvqo=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=L0veqIHkVoU6D20f64feIP+n1W+4V17txqje+kGuQ5XX8h1Ykk2YJWeOHckxfCo+L
 5NFuaxloicUu0wMpTltn62Rz+E2lgTxkRWRQR+xZfKTSinghdOSCdgf0AcCSMUQWK5
 sjz9UVr0pl6mI8MFH4gkEu7f+pdMPyzDS2gHJhXY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BE7328B8C3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 11:45:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MekzblqZsNC8 for <linuxppc-dev@lists.ozlabs.org>;
 Thu, 13 Jun 2019 11:45:03 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A8DF8B8B9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 11:45:03 +0200 (CEST)
Subject: Re: [PATCH 1/2] powerpc/8xx: move CPM1 related files from sysdev/ to
 platforms/8xx
To: linuxppc-dev@lists.ozlabs.org
References: <35488171038e3d40e7680b8513dfbd52ff7b6ef2.1557487355.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ef0fb705-e303-8b55-9513-487b656aeee1@c-s.fr>
Date: Thu, 13 Jun 2019 11:45:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <35488171038e3d40e7680b8513dfbd52ff7b6ef2.1557487355.git.christophe.leroy@c-s.fr>
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

Oops, I resent v1 together with v2. Sorry for the noise.

Le 13/06/2019 à 11:11, Christophe Leroy a écrit :
> Only 8xx selects CPM1 and related CONFIG options are already
> in platforms/8xx/Kconfig
> 
> This patch moves the related C files to platforms/8xx/.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>   arch/powerpc/platforms/8xx/Makefile                 | 3 +++
>   arch/powerpc/{sysdev => platforms/8xx}/cpm1.c       | 0
>   arch/powerpc/{sysdev => platforms/8xx}/cpm_gpio.c   | 0
>   arch/powerpc/{sysdev => platforms/8xx}/micropatch.c | 0
>   arch/powerpc/sysdev/Makefile                        | 3 ---
>   5 files changed, 3 insertions(+), 3 deletions(-)
>   rename arch/powerpc/{sysdev => platforms/8xx}/cpm1.c (100%)
>   rename arch/powerpc/{sysdev => platforms/8xx}/cpm_gpio.c (100%)
>   rename arch/powerpc/{sysdev => platforms/8xx}/micropatch.c (100%)
> 
> diff --git a/arch/powerpc/platforms/8xx/Makefile b/arch/powerpc/platforms/8xx/Makefile
> index 708ab099e886..10b338436655 100644
> --- a/arch/powerpc/platforms/8xx/Makefile
> +++ b/arch/powerpc/platforms/8xx/Makefile
> @@ -3,6 +3,9 @@
>   # Makefile for the PowerPC 8xx linux kernel.
>   #
>   obj-y			+= m8xx_setup.o machine_check.o pic.o
> +obj-$(CONFIG_CPM1)		+= cpm1.o
> +obj-$(CONFIG_UCODE_PATCH)	+= micropatch.o
> +obj-$(CONFIG_8xx_GPIO)		+= cpm_gpio.o
>   obj-$(CONFIG_MPC885ADS)   += mpc885ads_setup.o
>   obj-$(CONFIG_MPC86XADS)   += mpc86xads_setup.o
>   obj-$(CONFIG_PPC_EP88XC)  += ep88xc.o
> diff --git a/arch/powerpc/sysdev/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
> similarity index 100%
> rename from arch/powerpc/sysdev/cpm1.c
> rename to arch/powerpc/platforms/8xx/cpm1.c
> diff --git a/arch/powerpc/sysdev/cpm_gpio.c b/arch/powerpc/platforms/8xx/cpm_gpio.c
> similarity index 100%
> rename from arch/powerpc/sysdev/cpm_gpio.c
> rename to arch/powerpc/platforms/8xx/cpm_gpio.c
> diff --git a/arch/powerpc/sysdev/micropatch.c b/arch/powerpc/platforms/8xx/micropatch.c
> similarity index 100%
> rename from arch/powerpc/sysdev/micropatch.c
> rename to arch/powerpc/platforms/8xx/micropatch.c
> diff --git a/arch/powerpc/sysdev/Makefile b/arch/powerpc/sysdev/Makefile
> index aaf23283ba0c..cfcade8270a9 100644
> --- a/arch/powerpc/sysdev/Makefile
> +++ b/arch/powerpc/sysdev/Makefile
> @@ -37,12 +37,9 @@ obj-$(CONFIG_XILINX_PCI)	+= xilinx_pci.o
>   obj-$(CONFIG_OF_RTC)		+= of_rtc.o
>   
>   obj-$(CONFIG_CPM)		+= cpm_common.o
> -obj-$(CONFIG_CPM1)		+= cpm1.o
>   obj-$(CONFIG_CPM2)		+= cpm2.o cpm2_pic.o cpm_gpio.o
> -obj-$(CONFIG_8xx_GPIO)		+= cpm_gpio.o
>   obj-$(CONFIG_QUICC_ENGINE)	+= cpm_common.o
>   obj-$(CONFIG_PPC_DCR)		+= dcr.o
> -obj-$(CONFIG_UCODE_PATCH)	+= micropatch.o
>   
>   obj-$(CONFIG_PPC_MPC512x)	+= mpc5xxx_clocks.o
>   obj-$(CONFIG_PPC_MPC52xx)	+= mpc5xxx_clocks.o
> 
