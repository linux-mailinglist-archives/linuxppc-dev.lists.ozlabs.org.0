Return-Path: <linuxppc-dev+bounces-6410-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A752A41EB0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 13:20:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1fvQ6rbVz302N;
	Mon, 24 Feb 2025 23:20:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740399618;
	cv=none; b=RRmg7vO8MfTnGX7f+n/qZMBMlxL8auX5oslUQD5j4XTq2mzhz/ITP+f1tc0eyaOQOMEy4/dguwnvRMaGfkhgee7VZTpMEePO7uQeQqiTq9Ig6+B2L6RKbpwt5HAgALj75rIhmOsh6ds6RzHa77kC8FySGqaY8uVfcUA61lqEDp1xoZRgFuVT6zPS3kFBLvrt9Dw2QrZHXguJ435acjRe6gDEn+rzFJIQ7rxEXmS49/xLLM0dcXGdROtHZki9Zmj0XL8pgzhRJb+doQvMZlWg09FR3BGCeV2WQot2z+r94tXHzsvvhphR6Efi4ff+K9nJ9IAgoHgjOtgyh8h2GZNHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740399618; c=relaxed/relaxed;
	bh=NUglqXFaBSKbjaI8wCI8WMLgJ28QXB3lzAOlW7DR9vQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JvrmEDYwO5nDSwkdoklMFILICtAAoCUw1z4kMRpgUc/kvC2sv7fqnw/LIXXbEilZP8j/qtyWHqqM6R5exidxi910Jvob0vHuIOPI7/c/i+r2u5q/4w+tSR/O+pEfbLcoyUvPJ0ERyqqqKmeuWrxl//HWLpGRl47C2QRYoieVo72XrI19mMk31PoVAKcWg77zLXurg2TGA9376NTXocGt5JRk0P/xIbDlSybnepoWzK4mjfUaXIixaJYF4Y7O/O9uiXvWn0jHrwcYuYgNpZETEJOtvb+xBPPFPZg15/6TLmDHN22R94qoUCW/Z1Xpyoe5IUtf4mi8CQaO3goQ6vwFhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1fvQ1GBFz2yRM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 23:20:18 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z1fY56pPJz9sSK;
	Mon, 24 Feb 2025 13:04:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmjW4wRXcRyZ; Mon, 24 Feb 2025 13:04:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z1fY55w83z9sSC;
	Mon, 24 Feb 2025 13:04:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B37438B765;
	Mon, 24 Feb 2025 13:04:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id lGRMugV4dhlW; Mon, 24 Feb 2025 13:04:25 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7A6868B763;
	Mon, 24 Feb 2025 13:04:25 +0100 (CET)
Message-ID: <93e96586-13a2-4800-9dc7-5b35177a328e@csgroup.eu>
Date: Mon, 24 Feb 2025 13:04:25 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/5] arch/powerpc: Drop GENERIC_PTDUMP from
 mpc885_ads_defconfig
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: steven.price@arm.com, Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <20250217042220.32920-1-anshuman.khandual@arm.com>
 <20250217042220.32920-3-anshuman.khandual@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250217042220.32920-3-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 17/02/2025 à 05:22, Anshuman Khandual a écrit :
> GENERIC_PTDUMP gets selected on powerpc explicitly and hence can be dropped
> off from mpc885_ads_defconfig.
> 
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> Just wondering - Should CONFIG_PTDUMP_DEBUGFS be added instead ?

Yes please do that as a fix to commit e084728393a5 ("powerpc/ptdump: 
Convert powerpc to GENERIC_PTDUMP")

> 
>   arch/powerpc/configs/mpc885_ads_defconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
> index 77306be62e9e..ea6f836407d2 100644
> --- a/arch/powerpc/configs/mpc885_ads_defconfig
> +++ b/arch/powerpc/configs/mpc885_ads_defconfig
> @@ -78,4 +78,3 @@ CONFIG_DEBUG_VM_PGTABLE=y
>   CONFIG_DETECT_HUNG_TASK=y
>   CONFIG_BDI_SWITCH=y
>   CONFIG_PPC_EARLY_DEBUG=y
> -CONFIG_GENERIC_PTDUMP=y


