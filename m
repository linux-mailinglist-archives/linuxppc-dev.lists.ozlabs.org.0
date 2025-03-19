Return-Path: <linuxppc-dev+bounces-7223-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9D8A69862
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 19:50:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHySb598fz300B;
	Thu, 20 Mar 2025 05:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742410207;
	cv=none; b=TiyzNsfDdEyZggZbkeahjIsCodheBDAP/vwMN5Lt3LTlmTkY0Sv4wUN9f8tnqRx3nS9kL4YKfgJzAiu90pSJgEgL5VJgaTmczKc8hzSj+U4ENsG7EJbUPR7BzgLi72h6tkM3vvWBHNr7v0GNUWsdqUPROODPBK4HPf7mnFyHoyvK+69VWZ+NDfxpL4e4Zar0d+LGenIrFIkzJntCz1HbX18QdL/XmqqusdP02jeg6fI6KDw1PYFv1uL37Vj3LaeuF9hYZYtR6b2F4EC1mprGE6ulT1OoluJIlSkC+D07jVd+gMgSnfHDdVaMQuPIz8NUJXVC4839twRFO9wxQZpZMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742410207; c=relaxed/relaxed;
	bh=P1ygsYqSjkKgN0yh8OFac3O8LsIymQA48w1fdSIxZao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hsd4QJs1liLrDV7GT8waVAWkT7EvmbaMVolBzI8f44zCciiFVFCPARySRlmRpoZjF5ep9RBkfVFKa4vClTqqLmY9oLF5cx5SaKQAaqlzhAPPFGBAfaXQ2hlRC+hR5AQ2zsu+SyD531q35WAINeriGwX3LfR6MRgdkrlHSozEvPzKLFybfe03bXoE1kSmPjLfk1BFbQ0YJe8+82fZxCXTrtcUCGP3Km4s9vVtUJYFXtWYz9r8yrmgHK0i7rrYpzr2ONvWeQgXs+ze6AprTJiWntmSn8EoEYftS3ltXJ2CA4QYm7qmWgnwcitJzrUbrbirE3RjoW9KqnSBL2xYzFGkSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHySZ3W0tz2yyx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 05:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZHyKr1CTQz9sRr;
	Wed, 19 Mar 2025 19:44:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Sp1VH9wXf1L; Wed, 19 Mar 2025 19:44:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZHyKr0Kl3z9sPd;
	Wed, 19 Mar 2025 19:44:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D40008B796;
	Wed, 19 Mar 2025 19:44:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id gTNqAfmOhYdH; Wed, 19 Mar 2025 19:44:15 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 72B5E8B763;
	Wed, 19 Mar 2025 19:44:15 +0100 (CET)
Message-ID: <1ad38545-77a4-4236-8ff1-d799330b7111@csgroup.eu>
Date: Wed, 19 Mar 2025 19:44:14 +0100
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
Subject: Re: [PATCH 3/3] MAINTAINERS: add the linuppc-dev list to the fsl-mc
 bus entry
To: Ioana Ciornei <ioana.ciornei@nxp.com>, Stuart Yoder <stuyoder@gmail.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250319094311.2966519-1-ioana.ciornei@nxp.com>
 <20250319094311.2966519-4-ioana.ciornei@nxp.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250319094311.2966519-4-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 19/03/2025 à 10:43, Ioana Ciornei a écrit :
> [Vous ne recevez pas souvent de courriers de ioana.ciornei@nxp.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> As discussed in the thread linked below, the fsl-mc bus lacked a clear
> maintenance path. Since Christophe accepted to take the fsl-mc bus
> patches through his soc fsl subtree, add the linuxppc-dev mailing list
> in the MAINTAINERS entry.
> 
> Link: https://lore.kernel.org/r/1d822960-85a7-42b3-88cf-9d3dbc75a831@csgroup.eu

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1e6aac2962dd..cfa6db4b6ce2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19634,6 +19634,7 @@ F:      include/linux/qnx6_fs.h
>   QORIQ DPAA2 FSL-MC BUS DRIVER
>   M:     Stuart Yoder <stuyoder@gmail.com>
>   M:     Ioana Ciornei <ioana.ciornei@nxp.com>
> +L:     linuxppc-dev@lists.ozlabs.org
>   L:     linux-kernel@vger.kernel.org
>   S:     Maintained
>   F:     Documentation/ABI/stable/sysfs-bus-fsl-mc
> --
> 2.34.1
> 


