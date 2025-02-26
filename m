Return-Path: <linuxppc-dev+bounces-6504-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F71A45FBC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 13:50:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2vT50LC4z3bmQ;
	Wed, 26 Feb 2025 23:50:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740574217;
	cv=none; b=RTmYL+nW3B33f+0h3JgIqiJ9Oo/DWjICQAvCwoZBPImS7ViN3DRksQEx5xrRb4JjuyinLzZ25dzpGVH7eOSYgI6Xv/cH2+EuOo/VdwFIMkSu4Xv1KKBuSehWZgczLx+VcsVaIBJUb/ktw+99OK6NS7oNQ2dYrUVx30a3kPSa6hlWABipfH8yqOX2CDtvRQPo0SRaHP4tJmUseP+FBki8qYGF+5AJExSj3tPr+kLQHzp+hsSrc4Tl4Z3qzP3c8NO6vZhyyRGdpXQiaNX1j4a7Lv6UwQx9J9dgzKF/yFxs/CZlgHv0QAYfJGeGR5qcILYn00wnG1wqRe83IR7rVGcZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740574217; c=relaxed/relaxed;
	bh=wuvmUZ1jVuIYk6rb37wjbQ0vRwC/ateLBIVzdTKjCDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMDw1HsPsoqbUApG9LyjsJsnTcng6cxjsCJ+roLyeYKV0C2cSCN+ZQkm/EwvBe5EICKxG3rd4xO2LZHnmVz5zkeFHwD4qHduyYK7DsmqJXq0SRVFExjKKNeyIGRbQRHwNBWkeilzT3qGl9ll+cPuB8vyxx/01FTQ1lQ3DK/AVsd44x8V6aT6vggWxHJNoJSiYl97pMQ7U+nJlAzmFdZuMWMQmZHGrmG+LpCwwiNJuhMLn57+yWq32W/Z3VpKyHMXyjpz/wtuZTFNvsxF8inPmVMn3cbStCcgZfAo9+YzqYSmaz1prnMgTArCE1nmYdFvNbGYTWb568WDMvq20QA5qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2vT42BJ4z3bmY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 23:50:16 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z2v3D0g7Fz9sSK;
	Wed, 26 Feb 2025 13:31:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdl6tAtT0ddh; Wed, 26 Feb 2025 13:31:19 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z2v3C6tl5z9sSH;
	Wed, 26 Feb 2025 13:31:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D853B8B78B;
	Wed, 26 Feb 2025 13:31:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id lyR8MYIwt_Lw; Wed, 26 Feb 2025 13:31:19 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 96D918B77C;
	Wed, 26 Feb 2025 13:31:19 +0100 (CET)
Message-ID: <50339b41-9b4d-4315-a69b-ee32fc86baa6@csgroup.eu>
Date: Wed, 26 Feb 2025 13:31:19 +0100
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
Subject: Re: [PATCH V3 2/5] arch/powerpc: Drop GENERIC_PTDUMP from
 mpc885_ads_defconfig
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <20250226122404.1927473-1-anshuman.khandual@arm.com>
 <20250226122404.1927473-3-anshuman.khandual@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250226122404.1927473-3-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 26/02/2025 à 13:24, Anshuman Khandual a écrit :
> GENERIC_PTDUMP gets selected on powerpc explicitly and hence can be dropped
> off from mpc885_ads_defconfig. Replace with CONFIG_PTDUMP_DEBUGFS instead.
> 
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> Fixes: e084728393a5 ("powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP")
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/configs/mpc885_ads_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
> index 77306be62e9e..129355f87f80 100644
> --- a/arch/powerpc/configs/mpc885_ads_defconfig
> +++ b/arch/powerpc/configs/mpc885_ads_defconfig
> @@ -78,4 +78,4 @@ CONFIG_DEBUG_VM_PGTABLE=y
>   CONFIG_DETECT_HUNG_TASK=y
>   CONFIG_BDI_SWITCH=y
>   CONFIG_PPC_EARLY_DEBUG=y
> -CONFIG_GENERIC_PTDUMP=y
> +CONFIG_PTDUMP_DEBUGFS=y


