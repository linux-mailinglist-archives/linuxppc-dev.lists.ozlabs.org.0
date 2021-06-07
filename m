Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD4139D2B1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 03:44:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyx446Xmlz308Q
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 11:44:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hDY5h37A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hDY5h37A; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyx3Z1lp9z2yX6
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 11:43:37 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fyx3P4ngMz9s1l;
 Mon,  7 Jun 2021 11:43:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623030210;
 bh=FPR7ExVACiu4J+7LLh/Oh6D3FGm5nnJ0+HrdvUx8z6w=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hDY5h37A1YZT6orGetPUzskyKgpBxev4EUFkEkTf0PqJeFYu98qyvjlBUuOOOGHTa
 nRfLqrla3XWtpk4bffBFELKazKURK92xytEtykmQQqgLrR0yPC3rCqfFnKlt4OTnKC
 +YVoLMJOmZJzJ/OIbOW+39mEXqLpDooK7E5HseQrEuULON9Reg+aooTO0JYMruQ7aF
 U9QjsR41EnrdEQPHuFydRjX7RmbaClurrJbaXh180Q+QyPPdWENnrcS+vXlT/FYoB5
 uFz/7xtECDJ5Gmwsv4PNW3r8SvRmmWFJZWtKaxl4+R6N+jhOeCkwpmcxj/31yOzhTp
 2ukahEiZIlT5A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Guenter Roeck <linux@roeck-us.net>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH] watchdog: Remove MV64x60 watchdog driver
In-Reply-To: <e2a33fc1-f519-653d-9230-b06506b961c5@roeck-us.net>
References: <9c2952bcfaec3b1789909eaa36bbce2afbfab7ab.1616085654.git.christophe.leroy@csgroup.eu>
 <31d702e5-22d1-1766-76dd-e24860e5b1a4@roeck-us.net>
 <87im3hk3t2.fsf@mpe.ellerman.id.au>
 <e2a33fc1-f519-653d-9230-b06506b961c5@roeck-us.net>
Date: Mon, 07 Jun 2021 11:43:26 +1000
Message-ID: <87czsyfo01.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Guenter Roeck <linux@roeck-us.net> writes:
> On 5/17/21 4:17 AM, Michael Ellerman wrote:
>> Guenter Roeck <linux@roeck-us.net> writes:
>>> On 3/18/21 10:25 AM, Christophe Leroy wrote:
>>>> Commit 92c8c16f3457 ("powerpc/embedded6xx: Remove C2K board support")
>>>> removed the last selector of CONFIG_MV64X60.
>>>>
>>>> Therefore CONFIG_MV64X60_WDT cannot be selected anymore and
>>>> can be removed.
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>>
>>>> ---
>>>>   drivers/watchdog/Kconfig       |   4 -
>>>>   drivers/watchdog/Makefile      |   1 -
>>>>   drivers/watchdog/mv64x60_wdt.c | 324 ---------------------------------
>>>>   include/linux/mv643xx.h        |   8 -
>>>>   4 files changed, 337 deletions(-)
>>>>   delete mode 100644 drivers/watchdog/mv64x60_wdt.c
>> 
>> I assumed this would go via the watchdog tree, but seems like I
>> misinterpreted.
>> 
>
> Wim didn't send a pull request this time around.
>
> Guenter
>
>> Should I take this via the powerpc tree for v5.14 ?

I still don't see this in the watchdog tree, should I take it?

cheers
