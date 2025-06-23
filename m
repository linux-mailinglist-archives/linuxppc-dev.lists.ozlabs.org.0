Return-Path: <linuxppc-dev+bounces-9633-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C01AE3C17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jun 2025 12:20:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQkcV4BBsz30BG;
	Mon, 23 Jun 2025 20:20:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750674042;
	cv=none; b=XCk4qpC7zdimzJdvomfH2LvgJZ/MLvEbtz0id1C4VqXEuhGguYw9jh1VZ9h1yYGzELukS0m5L9v0ECZYyqRxguL0J+sbEV7O6F8wV9J2e8X71YUolGnOpo7SxTEKdOEzC1qCZymBQyjN7TuRHmN0mAHzVSy1uwWvdkH7xBZFfNmaLbxV/MQ6lIH+GMM/F6p0R4XD03Txjxya9a+FGJeb+wnCwyhWgK0VzakJL4scMSHxPX5q3f6ccLrNbtBOe1u9xQgB1M/kY6OHNlV/Cy5dh0l0IgDWsqi1Gbww87A+zebwSak6fIxo9uNvox+RmnR0V3q0QBgaFbubp+TCjlGr9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750674042; c=relaxed/relaxed;
	bh=QmKViGX05RHBEVBMuyA9VDcFmQR2P3+96a84D/yMUZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2NJa4GTr0yZ/BQZ+urYUv5DI5CbSza0lK9rDTLIozYiEk+mHqMkSCnAGxRRziaAwdfuMWCY4R2hBsyjXO2vlwadUzcWqZaWj9jKkKnO9X9UfMrSaC34oyqJ0iOQvKkg4APzvPqtx6H7BoatYn2MGI6HG/Wcbed31gz+M58Xf9l50SrfBid55Q0E2UYrgFfAnXDkZMG7cxI5Cmn+crCA6zfhTRMZLjfdkvOXEcXfx3JPj+mE9m66aarmOu2R+/bD0T8x13FgViisY6Hl5hUAzyPwc93DT/vP2vQHAGAr6AT13jA9d58QqCc4v9uyaB6ECrwv6+gqH4VGWppXjkRoCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQkcT4pRDz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 20:20:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bQkGv3dTSz9sp5;
	Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QCJuaHhYGyDk; Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bQkGv2shGz9snk;
	Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5D0F18B764;
	Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id GRsg_LSFRtsh; Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
Received: from [10.25.207.146] (unknown [10.25.207.146])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1F91F8B763;
	Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
Message-ID: <f527c6a8-faf2-45b8-81f5-03def802e485@csgroup.eu>
Date: Mon, 23 Jun 2025 12:05:26 +0200
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
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
 <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com>
 <c6eece57-8767-4435-beda-c9f399e3fa80@csgroup.eu>
 <CAMRc=MdYuk_O3P1QtepvF-6m01jn3xpDP4YxttQSp1-J-J2GvA@mail.gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAMRc=MdYuk_O3P1QtepvF-6m01jn3xpDP4YxttQSp1-J-J2GvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 23/06/2025 à 11:55, Bartosz Golaszewski a écrit :
> On Mon, Jun 23, 2025 at 11:54 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> Hi,
>>
>>
>> Le 23/06/2025 à 09:33, Bartosz Golaszewski a écrit :
>>> On Tue, Jun 10, 2025 at 2:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>>>
>>>> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
>>>> values") added new line setter callbacks to struct gpio_chip. They allow
>>>> to indicate failures to callers. We're in the process of converting all
>>>> GPIO controllers to using them before removing the old ones. This series
>>>> converts all GPIO chips implemented under drivers/soc/.
>>>>
>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>> ---
>>>> Bartosz Golaszewski (2):
>>>>         soc: fsl: qe: use new GPIO line value setter callbacks
>>>>         soc: renesas: pwc-rzv2m: use new GPIO line value setter callbacks
>>>>
>>>>    drivers/soc/fsl/qe/gpio.c       | 6 ++++--
>>>>    drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
>>>>    2 files changed, 9 insertions(+), 5 deletions(-)
>>>> ---
>>>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>>>> change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70
>>>>
>>>> Best regards,
>>>> --
>>>> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>
>>>
>>> I see Geert queued patch 2/2, who would take patch 1/2?
>>
>>
>> It is in my pipe for v6.17 but if someone else wants to take it I can
>> Ack it instead.
>>
>> Christophe
> 
> No, that's alright, I just didn't get any notification nor is it in
> linux-next yet.

Don't worry, it is not lost, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=&submitter=&state=&q=&archive=&delegate=61610

