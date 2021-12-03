Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC8D467C7B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 18:26:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5KVS2cbXz304t
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 04:26:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lkHCYNfX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=46.235.227.227;
 helo=bhuna.collabora.co.uk; envelope-from=ariel.dalessandro@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=lkHCYNfX; 
 dkim-atps=neutral
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5KTl2Gcjz2yYJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 04:25:28 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 383891F471D5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638552325; bh=FfHl0DYl6uyJ+Pe9q9LrI9NG8e5zR5nC/wqOuKSucMk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lkHCYNfXoK7UKNmOkE+sUmLPa7Rw/CVkK/GO0EbcQNE4PrM1mAzsUEYOYRWTRwKpX
 D6tgtpxKg412ooKPvNVnt8ChkyWJ0Ol9+MD/OA2RQ4HnsP5+ORC3ZbFf1IqKg44hxT
 sRq7f/FJsTya+wDer8EFjI8unXh6dMQ9QWU9gB5FTCaabN49pdg286DJRvnF4zx530
 ldqQlxF3JrVGa1ePMTJZimP5bFYXaXq9zF5Fe5qxF6JYNz4eqzcb0X9MHwVuFfOeXm
 /D9tYleuCN0V1GnFtiD0VyqsX6GMHmGn5fcJPInRQLZrcGxFW3EnOmbxU5RBcF4j6o
 VL5ciryfoiRPA==
Subject: Re: [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
 <163762561675.2471742.16439171676950432106.b4-ty@kernel.org>
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Message-ID: <6a2ff1f0-ebd9-be6d-9b2c-5704edd7c25d@collabora.com>
Date: Fri, 3 Dec 2021 14:25:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <163762561675.2471742.16439171676950432106.b4-ty@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: bkylerussell@gmail.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com,
 michael@amarulasolutions.com, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mark,

On 11/22/21 9:00 PM, Mark Brown wrote:
> On Fri, 19 Nov 2021 12:32:43 -0300, Ariel D'Alessandro wrote:
>> The tlv320aic31xx codec allows using BCLK as the input clock for PLL,
>> deriving all the frequencies through a set of divisors.
>>
>> In this case, codec sysclk is determined by the hwparams sample
>> rate/format. So its frequency must be updated from the codec itself when
>> these are changed.
>>
>> [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/5] ASoC: tlv320aic31xx: Fix typo in BCLK clock name
>       commit: 7016fd940adf2f4d86032339b546c6ecd737062f
> [2/5] ASoC: tlv320aic31xx: Add support for pll_r coefficient
>       commit: 2664b24a8c51c21b24c2b37b7f10d6485c35b7c1
> [3/5] ASoC: tlv320aic31xx: Add divs for bclk as clk_in
>       commit: 6e6752a9c78738e27bde6da5cefa393b589276bb
> [4/5] ASoC: tlv320aic31xx: Handle BCLK set as PLL input configuration
>       commit: c5d22d5e12e776fee4e346dc098fe51d00c2f983
> [5/5] ASoC: fsl-asoc-card: Support fsl,imx-audio-tlv320aic31xx codec
>       commit: 8c9b9cfb7724685ce705f511b882f30597596536
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.

Quick question:

I gotta send a fix for one of the patches. So, should it be a new
incremental patch or I can still send a patchset v2?

Also, I sent an incremental update patchset on top of this one:

  [PATCH 0/4] fsl-asoc-card: Add optional dt property for setting mclk-id

I could merge altogether on a patchset v2. Please let me know, and sorry
the process it's not clear to me :-)

Thanks,
Ariel





