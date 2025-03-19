Return-Path: <linuxppc-dev+bounces-7224-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FAAA69864
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 19:50:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHySg5kTPz3024;
	Thu, 20 Mar 2025 05:50:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742410211;
	cv=none; b=elvvsarPWyIu1fr1xbYKRmAhoMHOzZCrd1S4oQxH3S67ee87K3YljBS7o8PGtshDTBYpGn0kRLhFIPlrqwgT2nEVigfXgk2smsy4R3sCCNQ95gx1R7i9sl2sAsehX1KAGWBc1BANRwqEkEp+I8WNBW1SBS8WBE8NLPtoNjhzwDR6+8EmgZyl7Db7SrLTGqVZRdvh5dUA18IdBBNTgSgyCfoeJMS8FPK2XwXVZB+3Q7w6kU1EJFX/CT0JqvhPoyI8LvNL7vTjVFKVeH0aTilHLe6CvViylECOS8P4jLZ4whyRQ05tqSRTui7JkA2f0yiwRFbj/e9pSOlLFb+aecDAFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742410211; c=relaxed/relaxed;
	bh=RNTzm5L8h7R9GVUMJGm/6RiObC0ApCCfl5Fz/oGe0AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nnw61WcH7Ityw9MxP2UY5XaHVWxp3OGY8pWOfwQeAe2oA7YTODiJU7ploNgjZpIX0VaVvHKMYTh7te7XQ00mbx8oGKTJDpJDPzGUlVYbbjqOr8hQHzKARtAM2ZiQYlYr1I1u5gaRuH5URBA0w5lClQmc0QZEsAPKbtIOy1q4AoL0gTDc4VlYjJNDQUXVZJaNgoaVMUFadftUJr2r0K5MxadF7XfgBkwt7oeelp144bXObSwjv8ozyXRAF1afJ/OYKp8glLwr/BXNUZcJaNCZi+tUBe7g0mgnC6iaC9McV9quSn93Uh+VH6qKmhmH/pVtGPG6isl+/26lss3HhNpGIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHySg0fSYz2yyx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 05:50:11 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZHyLF6XWJz9sRy;
	Wed, 19 Mar 2025 19:44:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12Ee0xYLXrfT; Wed, 19 Mar 2025 19:44:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZHyLF5jSKz9sRs;
	Wed, 19 Mar 2025 19:44:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A403E8B796;
	Wed, 19 Mar 2025 19:44:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id R0yBEMijh7t3; Wed, 19 Mar 2025 19:44:37 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C18C8B763;
	Wed, 19 Mar 2025 19:44:37 +0100 (CET)
Message-ID: <6981de33-4ab4-4108-a2ad-e07d77483c56@csgroup.eu>
Date: Wed, 19 Mar 2025 19:44:36 +0100
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
Subject: Re: [PATCH 2/3] MAINTAINERS: fix nonexistent dtbinding file name
To: Ioana Ciornei <ioana.ciornei@nxp.com>, Stuart Yoder <stuyoder@gmail.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250319094311.2966519-1-ioana.ciornei@nxp.com>
 <20250319094311.2966519-3-ioana.ciornei@nxp.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250319094311.2966519-3-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 19/03/2025 à 10:43, Ioana Ciornei a écrit :
> [Vous ne recevez pas souvent de courriers de ioana.ciornei@nxp.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> The blamed commit converted the fsl,qoriq-mc.txt into fsl,qoriq-mc.yaml
> but forgot to also update the MAINTAINERS file to reference the new
> filename.
> 
> Fix this by using the corrent filename - fsl,qoriq-mc.yaml.
> 
> Fixes: bfb921b2a9d5 ("dt-bindings: misc: fsl,qoriq-mc: convert to yaml format")
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 76b6db4074ce..1e6aac2962dd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19637,7 +19637,7 @@ M:      Ioana Ciornei <ioana.ciornei@nxp.com>
>   L:     linux-kernel@vger.kernel.org
>   S:     Maintained
>   F:     Documentation/ABI/stable/sysfs-bus-fsl-mc
> -F:     Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> +F:     Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml
>   F:     Documentation/networking/device_drivers/ethernet/freescale/dpaa2/overview.rst
>   F:     drivers/bus/fsl-mc/
>   F:     include/uapi/linux/fsl_mc.h
> --
> 2.34.1
> 


