Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5510668E5E5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 03:11:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBNmC1xJrz3cXl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 13:11:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ZqjGyVa9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ZqjGyVa9;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBNlB0kkzz2xGq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 13:10:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=AuTyDSrSjqaHZtVxnBwKuHAyQ6R0P+ssQyTf+RiDt24=; b=ZqjGyVa9C8gevk4DdJl9RIZ3Z/
	JhUhMdElBE4KCOSfvQ6kWk+fROA6xuLYbtFt1wqcEYaS/38nancZyGQE7K5mUEzQg0AXTDK3sqf1k
	gXP7VDbcT50A0h+xR43+n0Cab00vGpqb358gqLqkuOnW+gE4H2Ata+DvYiT6i4D3M5Mqr1sLfakUk
	5BOBj2Ez4fd2X4wIWSVbevBwCnVNRDEiy8VeubVqwY6z09mycaN0ECFoh/gx0dfDvgRiEqZcBDJO0
	1U43rm4nA+7N15ElcAb78D8f2eeBZaRtQ/bz0+1VbfUr7/xhZfwBCNaVSyAxvAockml9xHs2gpK9D
	U9q4HP1g==;
Received: from 108-90-42-56.lightspeed.sntcca.sbcglobal.net ([108.90.42.56] helo=[192.168.1.80])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPZuk-000mBb-Qa; Wed, 08 Feb 2023 02:10:27 +0000
Message-ID: <40b2139d-274f-10c5-e74a-3849c94475ae@infradead.org>
Date: Tue, 7 Feb 2023 18:10:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/3] ALSA: core: Make snd_card_free() return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
 <20230207191907.467756-4-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20230207191907.467756-4-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: alsa-devel@alsa-project.org, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Uwe,

On 2/7/23 11:19, Uwe Kleine-König wrote:
> The function returns 0 unconditionally. Make it return void instead and
> simplify all callers accordingly.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  include/sound/core.h      | 2 +-
>  sound/core/init.c         | 6 ++----
>  sound/pci/hda/hda_tegra.c | 6 ++----
>  sound/ppc/snd_ps3.c       | 4 +---
>  4 files changed, 6 insertions(+), 12 deletions(-)

> --- a/sound/ppc/snd_ps3.c
> +++ b/sound/ppc/snd_ps3.c
> @@ -1053,9 +1053,7 @@ static void snd_ps3_driver_remove(struct ps3_system_bus_device *dev)
>  	 * ctl and preallocate buffer will be freed in
>  	 * snd_card_free
>  	 */
> -	ret = snd_card_free(the_card.card);
> -	if (ret)
> -		pr_info("%s: ctl freecard=%d\n", __func__, ret);
> +	snd_card_free(the_card.card);
>  
>  	dma_free_coherent(&dev->core,
>  			  PAGE_SIZE,

Looks OK for PS3.

Acked-by: Geoff Levand <geoff@infradead.org>

