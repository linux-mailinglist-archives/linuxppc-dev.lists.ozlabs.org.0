Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DE668EF89
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 14:11:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBgP433N3z3f4x
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 00:11:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256 header.s=default header.b=1mxnHyyP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=perex.cz (client-ip=77.48.224.245; helo=mail1.perex.cz; envelope-from=perex@perex.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256 header.s=default header.b=1mxnHyyP;
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at boromir; Wed, 08 Feb 2023 19:47:21 AEDT
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBYXT0mSNz306l
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 19:47:20 +1100 (AEDT)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0D9C411C6;
	Wed,  8 Feb 2023 09:40:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0D9C411C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1675845607; bh=sIWx84wjVedBalx3G6+LpCIVD21PqPaz8xE7PwJql8A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1mxnHyyPGwnXqK7JnEnHKmaGGaagS1qrgtLVrvArptHnK/6E72JKa3I6trY+Z7RL+
	 JRoljUKbeoiROUzbg42OZugGhhrDfrc+4q1teOQIByi1yCv3uGOl53/0MDwog7hunN
	 1RrCoS2iZHR8TwlqySW/JlCQ3808VN9tJTHutu2s=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed,  8 Feb 2023 09:39:54 +0100 (CET)
Message-ID: <ae3efa77-0dde-4681-d68d-1f483ebd5d9e@perex.cz>
Date: Wed, 8 Feb 2023 09:39:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/3] ALSA: core: Make some functions return void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Geoff Levand <geoff@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 09 Feb 2023 00:10:33 +1100
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

On 07. 02. 23 20:19, Uwe Kleine-König wrote:
> Hello,
> 
> while checking in which cases hda_tegra_remove() can return a non-zero value, I
> found that actually cannot happen. This series makes the involved functions
> return void to make this obvious.
> 
> This is a preparation for making platform_driver::remove return void, too.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (3):
>    ALSA: core: Make snd_card_disconnect() return void
>    ALSA: core: Make snd_card_free_when_closed() return void
>    ALSA: core: Make snd_card_free() return void
> 
>   include/sound/core.h      |  6 +++---
>   sound/core/init.c         | 40 ++++++++++++++-------------------------
>   sound/pci/hda/hda_tegra.c |  6 ++----
>   sound/ppc/snd_ps3.c       |  4 +---
>   4 files changed, 20 insertions(+), 36 deletions(-)

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

