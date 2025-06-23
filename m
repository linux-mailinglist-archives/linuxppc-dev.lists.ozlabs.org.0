Return-Path: <linuxppc-dev+bounces-9632-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 123DDAE3C13
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jun 2025 12:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQkcQ3HlXz2yF0;
	Mon, 23 Jun 2025 20:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750674038;
	cv=none; b=bKmcs19KPxzTAQpwqq3Ouqo1oLPr+XNQZQYK7EVhqn+U+SPC0WbLGYrQsPbaNnk2VhN7/K2GCru6jcz9VR8szhAkm9QeyUvI+3quBBUPJGfurjrIWdbNf2dTDymjU2fWFJq3dXZdozIdTDNvMhik2Jhneo880owPH3zY2gOdfeEcfubrWcxkifHMzdJU1gJmygY81VYesVVH2MIPKbWWd4jb9XlIDoj+WywfDtSmplBdo7R8j1rqzOjrPhk4rXFlv+OvOCFUNzTckRlDs8QFDzxgk+T8EwXyAtPXtlI8MIuyHkRJdVx1/YrM5yGVpf/pac0IOU9Yy1fsaAjhKHb1PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750674038; c=relaxed/relaxed;
	bh=ZY0TaR0lC4S2TgNgdNdDMXFGf+5ruq2DrjC9kwy0CRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P9PHYEgAI0H9vb/1FoY8OR19jHCl3sZawTxIlH145nduOysBVt83+jd4lWvL4IPfONGsExQgG0Up7RTgnJmvyrrpqRAUySG+IYjMRUwBCCxmDGXf2ih62jaj8Yj0sd+qYK1KVtBxAgSBjU/TFPkPxro7fKqQtqOpJvovvLYfQpDHzmqi3fKLOTEiLQ0FSqEO9p3NAvkn2imiOQ0yfjyRSeaFFL8dLhV4UUDb07f0peUMZXIVg72LLPeIXYeyfJS7vbYeOBElAV2Po171ObmkMEMzGHeJFx4xIFRWVBzRQWadx0q5k6cthUFnGqXj4dLK45LlevdubRJeZb3viRf3nA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQkcP13Hgz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 20:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bQk294JMVz9skH;
	Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2L25sduycuWc; Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bQk293bFcz9sgs;
	Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 743568B764;
	Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id a4DFXxeF3oKN; Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
Received: from [10.25.207.146] (unknown [10.25.207.146])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1FD2B8B763;
	Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
Message-ID: <c6eece57-8767-4435-beda-c9f399e3fa80@csgroup.eu>
Date: Mon, 23 Jun 2025 11:54:24 +0200
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
Subject: Re: [PATCH 0/2] soc: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>, Qiang Zhao <qiang.zhao@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
 <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,


Le 23/06/2025 à 09:33, Bartosz Golaszewski a écrit :
> On Tue, Jun 10, 2025 at 2:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
>> values") added new line setter callbacks to struct gpio_chip. They allow
>> to indicate failures to callers. We're in the process of converting all
>> GPIO controllers to using them before removing the old ones. This series
>> converts all GPIO chips implemented under drivers/soc/.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> ---
>> Bartosz Golaszewski (2):
>>        soc: fsl: qe: use new GPIO line value setter callbacks
>>        soc: renesas: pwc-rzv2m: use new GPIO line value setter callbacks
>>
>>   drivers/soc/fsl/qe/gpio.c       | 6 ++++--
>>   drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
>>   2 files changed, 9 insertions(+), 5 deletions(-)
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70
>>
>> Best regards,
>> --
>> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
> 
> I see Geert queued patch 2/2, who would take patch 1/2?


It is in my pipe for v6.17 but if someone else wants to take it I can 
Ack it instead.

Christophe

