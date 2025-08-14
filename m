Return-Path: <linuxppc-dev+bounces-10976-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F5CB25F81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 10:50:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2f8X4n8rz3bV6;
	Thu, 14 Aug 2025 18:50:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755161436;
	cv=none; b=Fmv3OOa7z5Oy510EVk8vRBhvptpmYoLDX0o9yn1D1fYgAxfes+ayLGViS7Ea0J7avoC4W9TVM4oLJsH+yELCsAAfYCKcCSxoa4rKfISz0hNJJviJPXM2oPSxCEFosHYbG3MUr84wnTKXOzjrI7M5ZZhTBi6xCyE/bO+yRyKHf8KM+m6JqO9Lclif+9gg8IeT61cTkokKh48IdVbml8+RJhYOlHugBr2IRfe5W1BhHVo3Z4vCrHlo0yBtTLVw8a8Hu0GOlV2u6eqjm0X0MlhWFLWPG95X27dLbm16p9EITMD/58IRH/jjxysMAp9F7gTCRWPLPIGJ0+kLKTvyKsHbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755161436; c=relaxed/relaxed;
	bh=duKEJZ5Lt9vqOLZm6GjyuiiVQw+czZ98j4BuUve2nsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4kDpnJz/8Ioct+NuSZVCswAHTsRUXsFw9O54k5V1s0AOQ1bRcsso3L47JRJCWmt0wvgDQuOAuFyaM/BYQZYwA+wV4wxiuYK4coHGupWDHCWhXgWhbbmxdrbjoWj/dbbnPAZEeVH1pPWjrOPf22dWpKeMoSBAQyhO52Pr595xo0uzeBXvVq3rjSWYYacK3eI1ixRdhPDUXJTv/tIvDp1hMuNrGDRVdfh6FbfQR97e85ymyDvhjjnotOv5CDhL3tujHLgVzRuzMRAQHJOHhFo7IEd78QO8vpvhtSvEo+qlqF8wSX0K/NNuOZiGTS2evHFRWx7gC0m6DQZcB+FSB+6rg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2f8X05GSz2yhX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 18:50:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c2dnG3Xs7z9sSL;
	Thu, 14 Aug 2025 10:33:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1tkUzicEPWcZ; Thu, 14 Aug 2025 10:33:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c2dnG2pKsz9sSK;
	Thu, 14 Aug 2025 10:33:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 472C48B764;
	Thu, 14 Aug 2025 10:33:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id PmUnmtuep_BF; Thu, 14 Aug 2025 10:33:54 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D38D28B763;
	Thu, 14 Aug 2025 10:33:53 +0200 (CEST)
Message-ID: <52be7ae1-34f7-49ef-80b0-0eb6577205ff@csgroup.eu>
Date: Thu, 14 Aug 2025 10:33:52 +0200
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
Subject: Re: [PATCH v2 1/1] powerpc/8xx: Drop legacy-of-mm-gpiochip.h header
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20241118123254.620519-1-andriy.shevchenko@linux.intel.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20241118123254.620519-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Andy,

Le 18/11/2024 à 13:31, Andy Shevchenko a écrit :
> Remove legacy-of-mm-gpiochip.h header file. The above mentioned
> file provides an OF API that's deprecated. There is no agnostic
> alternatives to it and we have to open code the logic which was
> hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
> drivers are using their own labeling schemas and resource retrieval
> that only a few may gain of the code deduplication, so whenever
> alternative is appear we can move drivers again to use that one.
> 
> As a side effect this change fixes a potential memory leak on
> an error path, if of_mm_gpiochip_add_data() fails.

Is there a reason for having done this change in cpm1_gpiochip_add16() 
and cpm1_gpiochip_add32() [arch/powerpc/platform/8xx/cpm1.c] and not in 
cpm2_gpiochip_add32() [arch/powerpc/sysdev/cpm_common.c] while all three 
functions are called from cpm_gpio_probe() 
[arch/powerpc/sysdev/cpm_gpio.c] ?

Christophe


