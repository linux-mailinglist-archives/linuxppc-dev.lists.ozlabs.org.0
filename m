Return-Path: <linuxppc-dev+bounces-3584-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C939DA26D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2024 07:44:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyqfZ2Wlkz2yDt;
	Wed, 27 Nov 2024 17:44:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732689846;
	cv=none; b=LR24LW3jxYjrvu+6TmjvsQjhBa2Bbo+MBZYoZ96yYGMb1mH5NFWkQoPmNCf6xZfzK6AAIL7XWRmtdK1UjkV/MuUGRub1i8X+yAXt+3cPZc7wNKr4WZtaAQZdT4IFTcuwrFNpUwpIqUU4hd+jc4sZLNxKJa8WgjnjWOuIP5PXTYLdzxxk7h6IyfdXpYjAjdN+hJScobW9ZZjSgMNJH+aZb7No+RtbpjU+qhDeL2qSEGbEXgdcpl6O28WThs5EGk2jTuQlH7tPq5eqYS7JMO3fFxMpfj806DkTNUcAa9YI6RXcKNOCoKxl5DkI6ctxfHo/kd42l2tENmpAdg3fiTpwrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732689846; c=relaxed/relaxed;
	bh=2j2ArRVuoF4pVbpI+BqI0rArNlEbOJYWB08m3Sy9zFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hT5wWMsNjcEVM8ASQx+aCFQCofgs3ZnGapVSaUFsMBioi0AmQk90t3ajn+1ngrN4Ny8jxBEKfUqm/zmQB7iBlGcPtdCAJfwfMCehUqXyTWZpPSzmZAze20eQN/WbB9RqUQ9tag+lFVSF8txYak5yyq/h8VryaToKn5rXtdBFNXezGLwOGWsVs/nhiRFhLKZpOjwnxUXYTYkLat5X2MHlWpVyNzUzQiBTc2LPj3EidEZRBXtH9573rVyNP1l/eF7LgbXDeDlJ0awSvEb2T1p3LIyrAfXnyyo4dP3pb08zRpj09fIN1gbY98aGN4kH68vUbIaA3nnWXmcaFzP9NkWkJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyqfX6tXWz2xvh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2024 17:44:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XyqfT4V3Pz9sPd;
	Wed, 27 Nov 2024 07:44:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zLJ7ChzR5x-Z; Wed, 27 Nov 2024 07:44:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XyqfT3QVDz9rvV;
	Wed, 27 Nov 2024 07:44:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5BEEB8B780;
	Wed, 27 Nov 2024 07:44:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id SaDX1yXfj_ki; Wed, 27 Nov 2024 07:44:01 +0100 (CET)
Received: from [192.168.233.25] (PO18304.IDSI0.si.c-s.fr [192.168.233.25])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CF7468B77C;
	Wed, 27 Nov 2024 07:44:00 +0100 (CET)
Message-ID: <5089fd16-bc8c-4231-a89b-2658445e04b7@csgroup.eu>
Date: Wed, 27 Nov 2024 07:44:00 +0100
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
Subject: Re: [PATCH 2/3] powerpc: support dynamic preemption
To: Shrikanth Hegde <sshegde@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, maddy@linux.ibm.com, bigeasy@linutronix.de,
 ankur.a.arora@oracle.com, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, vschneid@redhat.com, peterz@infradead.org
References: <20241125042212.1522315-1-sshegde@linux.ibm.com>
 <20241125042212.1522315-3-sshegde@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241125042212.1522315-3-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 25/11/2024 à 05:22, Shrikanth Hegde a écrit :
> Once the lazy preemption is supported, it would be desirable to change
> the preemption models at runtime. So this change adds support for dynamic
> preemption using DYNAMIC_KEY.
> 
> In irq-exit to kernel path, use preempt_model_preemptible for decision.
> Other way would be using static key based decision. Keeping it
> simpler since key based change didn't show performance improvement.

What about static_call, wouldn't it improve performance ?

> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 6d6bbd93abab..01c58f5258c9 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -270,6 +270,7 @@ config PPC
>   	select HAVE_PERF_EVENTS_NMI		if PPC64
>   	select HAVE_PERF_REGS
>   	select HAVE_PERF_USER_STACK_DUMP
> +	select HAVE_PREEMPT_DYNAMIC_KEY

Can you use HAVE_PREEPT_DYNAMIC_CALL instead ? That should be more 
performant.

I know static calls are not in for PPC64 yet, you can restart from 
http://patchwork.ozlabs.org/project/linuxppc-dev/cover/20221010002957.128276-1-bgray@linux.ibm.com/ 
and https://github.com/linuxppc/issues/issues/416

Christophe

