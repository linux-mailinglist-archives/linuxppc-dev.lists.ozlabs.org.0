Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E157C4D2B9A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 10:16:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KD64w5Vvwz3bft
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 20:16:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KD64S2frgz2xtv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 20:15:52 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KD64R0F6Rz4xNq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 20:15:51 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KD64R0BnYz4xnG; Wed,  9 Mar 2022 20:15:51 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KD64Q5Sr1z4xNq
 for <linuxppc-dev@ozlabs.org>; Wed,  9 Mar 2022 20:15:49 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KD64M1YDsz9sSc;
 Wed,  9 Mar 2022 10:15:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AcfaKU_73hrd; Wed,  9 Mar 2022 10:15:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KD64M0gjvz9sSR;
 Wed,  9 Mar 2022 10:15:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 050078B77E;
 Wed,  9 Mar 2022 10:15:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0eHTayw0i_gJ; Wed,  9 Mar 2022 10:15:46 +0100 (CET)
Received: from [192.168.202.3] (unknown [192.168.202.3])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A44058B763;
 Wed,  9 Mar 2022 10:15:46 +0100 (CET)
Message-ID: <828ee749-177a-fc3c-d772-4d0692e52cd9@csgroup.eu>
Date: Wed, 9 Mar 2022 10:15:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] powerpc/configs: Turn CONFIG_RELOCATABLE on by default
Content-Language: fr-FR
To: Balbir Singh <bsingharora@gmail.com>, mpe@ellerman.id.au
References: <20170512053609.32514-1-bsingharora@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20170512053609.32514-1-bsingharora@gmail.com>
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/05/2017 à 07:36, Balbir Singh a écrit :
> On powernv/pseries and ppc64 defconfigs
> 
> Most distros will want it on by default and I've missed
> turning it on during developer testing. Having it on ensures
> we are testing our patches with the config enabled.
> 
> Signed-off-by: Balbir Singh <bsingharora@gmail.com>

Today it is already on by default on pseries_defconfig and ppc64_defconfig.

Only powernv_defconfig would need it explicitely if this patch is still 
relevant.

> ---
>   arch/powerpc/configs/powernv_defconfig | 1 +
>   arch/powerpc/configs/ppc64_defconfig   | 1 +
>   arch/powerpc/configs/pseries_defconfig | 1 +
>   3 files changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
> index 0695ce0..eca7189 100644
> --- a/arch/powerpc/configs/powernv_defconfig
> +++ b/arch/powerpc/configs/powernv_defconfig
> @@ -52,6 +52,7 @@ CONFIG_PPC_TRANSACTIONAL_MEM=y
>   CONFIG_HOTPLUG_CPU=y
>   CONFIG_KEXEC=y
>   CONFIG_KEXEC_FILE=y
> +CONFIG_RELOCATABLE=y
>   CONFIG_IRQ_ALL_CPUS=y
>   CONFIG_NUMA=y
>   CONFIG_MEMORY_HOTPLUG=y
> diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
> index 5175028..ba30841 100644
> --- a/arch/powerpc/configs/ppc64_defconfig
> +++ b/arch/powerpc/configs/ppc64_defconfig
> @@ -49,6 +49,7 @@ CONFIG_BINFMT_MISC=m
>   CONFIG_PPC_TRANSACTIONAL_MEM=y
>   CONFIG_KEXEC=y
>   CONFIG_KEXEC_FILE=y
> +CONFIG_RELOCATABLE=y
>   CONFIG_CRASH_DUMP=y
>   CONFIG_IRQ_ALL_CPUS=y
>   CONFIG_MEMORY_HOTREMOVE=y
> diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
> index 1a61aa2..54954b6 100644
> --- a/arch/powerpc/configs/pseries_defconfig
> +++ b/arch/powerpc/configs/pseries_defconfig
> @@ -55,6 +55,7 @@ CONFIG_BINFMT_MISC=m
>   CONFIG_PPC_TRANSACTIONAL_MEM=y
>   CONFIG_KEXEC=y
>   CONFIG_KEXEC_FILE=y
> +CONFIG_RELOCATABLE=y
>   CONFIG_IRQ_ALL_CPUS=y
>   CONFIG_MEMORY_HOTPLUG=y
>   CONFIG_MEMORY_HOTREMOVE=y
