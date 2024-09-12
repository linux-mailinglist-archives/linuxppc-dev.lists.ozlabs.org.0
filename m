Return-Path: <linuxppc-dev+bounces-1283-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 484E19765C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 11:36:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4C465ydMz2yQG;
	Thu, 12 Sep 2024 19:36:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726133766;
	cv=none; b=m9/H//hMPQhVu7dLh5xNQ+ksAf7mB67j+tBmad/2TMGeAJCpXLegfC3Ww9bcxCyb6HRcZMYCQYDOvEmmZbeL7EHkLLLtzxw0MJl4ZrAuUkVWrevZVl7MmpmTMxFn6nmHEWJxjjakij/9xhFNxAOY99nCoL4kOTy0aZ17Gln22ecO32IDBMCu6khwxCbEJqgFyXrIbViDJ62MxkBH/sAnpJPCflShVj0jBYkgWCcKJ5C1TYpS7Rn6yMMOcMVZ9jH2meKvI2uzbPYEikRkDOihAOcIX6jaYZMr1nG03ZUz8wK+EigP0B83zV84VevNu/rd9rtHoChR86ZB0Jiq4c2JUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726133766; c=relaxed/relaxed;
	bh=nib4LAVPz7Q8fu4Rxjgf/Z8YFmK3NFN3UADE3mw0LCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m8Ek4TwLC1NNikAgBkjQpu92FH4gH4NL8U2auKNz1abXmec36LqKq00XVd6hJ9NRtLMc64Sob0FwNX6qbBIpUVmxlBRrb7jBAlyoiZSbPliK05SzDaURBfPImL8I8QY9tuUKNTuLcPVoMxEvxr5+2xVAQ1EaKaxNNnBEKSgzQmCbGSB+ca9C8OX0pw1ttlorE8tH0IZpDj9/2J/eiFIg697TYLM1PvG8sL8J1VzdtRGQOxCk2lNG6quA5KWjkaWfuB75Et5DSLeBkX6O4q1NFXguCl0RrEwYAMDRErkcbUVHeuhGWT71FgwajcsCEdaidZP9kmJEJzOSJn9IfPcWtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4C463XWcz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 19:36:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X4C412zgjz9sxM;
	Thu, 12 Sep 2024 11:36:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SpArUF2QQ3zC; Thu, 12 Sep 2024 11:36:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X4C3z1MTVz9sxK;
	Thu, 12 Sep 2024 11:35:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1EA468B774;
	Thu, 12 Sep 2024 11:35:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id dMPe8Im5tU2e; Thu, 12 Sep 2024 11:35:59 +0200 (CEST)
Received: from [192.168.233.25] (unknown [192.168.233.25])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BB1B28B766;
	Thu, 12 Sep 2024 11:35:58 +0200 (CEST)
Message-ID: <0a6acc6d-883e-4963-8530-efea030513c6@csgroup.eu>
Date: Thu, 12 Sep 2024 11:35:58 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] powerpc/entry: convert to common and generic entry
To: Luming Yu <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 jialong.yang@shingroup.cn, luming.yu@gmail.com
References: <B4ABABEA5F13B86A+20240912082500.1469-1-luming.yu@shingroup.cn>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <B4ABABEA5F13B86A+20240912082500.1469-1-luming.yu@shingroup.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 12/09/2024 à 10:24, Luming Yu a écrit :
> From: Yu Luming <luming.yu@gmail.com>
> 
> convert powerpc entry code in syscall and fault to use syscall_work
> and irqentry_state as well as common calls from generic entry infrastructure.
> 
> Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
> ---
>   arch/powerpc/Kconfig                   | 1 +
>   arch/powerpc/include/asm/hw_irq.h      | 5 +++++
>   arch/powerpc/include/asm/processor.h   | 6 ++++++
>   arch/powerpc/include/asm/syscall.h     | 5 +++++
>   arch/powerpc/include/asm/thread_info.h | 1 +
>   arch/powerpc/kernel/syscall.c          | 6 +++++-
>   arch/powerpc/mm/fault.c                | 5 +++++
>   7 files changed, 28 insertions(+), 1 deletion(-)
> 


asm/entry-common.h is missing, this patch doesn't build.


