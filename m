Return-Path: <linuxppc-dev+bounces-10468-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 330F1B16386
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 17:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsbWT6qxjz3bmy;
	Thu, 31 Jul 2025 01:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753888837;
	cv=none; b=REJsonbBWr5quTfthtJS6cnDpbYyrOIUhJN4qLXnfaVkDsjByj0a2QMMM04bT725jAjd1y25S+3zut021+O+do6xNtyFXXsfR50wJQQ7pRyIy4OHVvy0E4wE9xx+jeoiyq0+QU/OVLSchK0LDmECPYZLYRi9a4IThyWKytgGxbqLlKeSVmu9Vk+xqPTnQEvAcB/+ovP++efcrBxo0PmYrys0gYsXQYjskgBg4FJI8By2vIowONHW7RUi3pwRX2cKWkkrNWF5MDPtUor8vXKL2nzohpuAYJmW5xk9shSyj0hralXTlMVb+etD5b97OJtZQDQsGd15Q90VUB5yBzGSpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753888837; c=relaxed/relaxed;
	bh=0YNieAz+cZECg0/LiA7zH4IgiLhsFDcVjXRAmd7ovYk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ign8HmfadCWlLYo8Ebh4fbSvubYLyu7Wmm7Yd1x4qxCbRBuiRHFvHM1uUfYQ0wduT1b1xv1PKt0murVuJdZL985ny0ne7USJmrj2bk5jITU2s3UXnG7axs1v3oSuEjZqGVC21XxU7mxzHZSzB02eS8D88Vd98FX2eXzxrJ9T7lwZtc3+tMUiBZOxrQFRltxvwxeoXoc+qfm6i9y/Tx2SAGvSSPwBXr0UVD8feh+Go73unlllkdg3LGTsud+mciOAaotJ42XBI7dfQVQo8H2MotJJLKFYLPkgFKpOb9yFnoKvGFI+p5HOl/e7WPeCYt1pt4crePm7isZp5CUvwGh91w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsbWS0hVPz2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 01:20:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsYDJ1Vh3z9srp;
	Wed, 30 Jul 2025 15:37:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hTOaUPuVAapB; Wed, 30 Jul 2025 15:37:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsYDC13bxz9st0;
	Wed, 30 Jul 2025 15:37:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1EEA78B76E;
	Wed, 30 Jul 2025 15:37:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id rpERR39Nzj83; Wed, 30 Jul 2025 15:37:15 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EA4F58B763;
	Wed, 30 Jul 2025 15:37:14 +0200 (CEST)
Message-ID: <5553bad0-2bd1-41c0-966f-98a0a4acbb23@csgroup.eu>
Date: Wed, 30 Jul 2025 15:37:14 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: Use dev_fwnode()
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, Qiang Zhao <qiang.zhao@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-tegra@vger.kernel.org
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-19-jirislaby@kernel.org>
 <907f875e-5ed0-4eca-b285-ebb7e47137ce@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <907f875e-5ed0-4eca-b285-ebb7e47137ce@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 08/07/2025 à 10:33, Christophe Leroy a écrit :
> Hi,
> 
> Le 11/06/2025 à 12:43, Jiri Slaby (SUSE) a écrit :
>> irq_domain_create_simple() takes fwnode as the first argument. It can be
>> extracted from the struct device using dev_fwnode() helper instead of
>> using of_node with of_fwnode_handle().
>>
>> So use the dev_fwnode() helper.
>>
>> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
>> Cc: Qiang Zhao <qiang.zhao@nxp.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Thierry Reding <thierry.reding@gmail.com>
>> Cc: Jonathan Hunter <jonathanh@nvidia.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linuxppc-dev@lists.ozlabs.org
> 
> There must be something wrong with this patch. b4 shazam applies a 
> different patch.
> 
> $ b4 shazam -l -s --single-message --no-parent 20250611104348.192092-19- 
> jirislaby@kernel.org
> Single-message mode, ignoring any follow-ups
> Grabbing thread from lore.kernel.org/all/20250611104348.192092-19- 
> jirislaby@kernel.org/t.mbox.gz
> Breaking thread to remove parents of 20250611104348.192092-19- 
> jirislaby@kernel.org
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
>    Added from v2: 1 patches
> Analyzing 25 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 22 code-review messages
> Will use the latest revision: v2
> You can pick other revisions using the -vN flag
> Checking attestation on all messages, may take a moment...
> ---
>    ✓ [PATCH v2] iio: adc: stm32-adc: Use dev_fwnode()
>      + Reviewed-by: David Lechner <dlechner@baylibre.com> (✗ DKIM/ 
> baylibre-com.20230601.gappssmtp.com)
>      + Link: https://lore.kernel.org/r/20250612084627.217341-1- 
> jirislaby@kernel.org
>      + Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>    ---
>    ✓ Signed: DKIM/kernel.org
> ---
> Total patches: 1
> ---
> Application de  iio: adc: stm32-adc: Use dev_fwnode()
> 
> You must have posted another patch with the same message ID. I had to 
> apply it manually.
> 

Applied (Manually), thanks!

