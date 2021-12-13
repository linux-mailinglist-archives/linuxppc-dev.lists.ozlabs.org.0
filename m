Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7B94737CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 23:45:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCc5q41nzz3cB0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 09:45:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lIhD4VLF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=46.235.227.227;
 helo=bhuna.collabora.co.uk; envelope-from=ariel.dalessandro@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=lIhD4VLF; 
 dkim-atps=neutral
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCc583gZSz30JT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 09:44:28 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 7A1501F44304
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639435458; bh=+jzYdtXs7CB4ta79rrB++MGxP0waydJU7QsAh1AmXQo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lIhD4VLFF2S6LlIDylVcf8FfHctEQWqmhWUr+LKKcAcmy9YIByC53bq6Eo7A2Q+GW
 G1bDUmwqaSkSoMMnGWD7S/e6cDOqeOaqjRy3Y0GsYOEga5PibX2MJA/dlMIq0VeaB/
 ZFXivb0uRKvsinimGrTPvCG+fml899xWKRTbLvBTdCky2nj1Jo8ZsCBz5eFox/SOO/
 gQ5TwXw9vLjtHFqNIyZPIdvwBwmfSeIjz0Ns+NFWpN0JKasZEHSTlmeHyVaIRVpgh/
 bG7XQVAWqF1hck75vl29HTYXEhYOnlrckapPzQrsKu95krz3dG1cQ2U8xOPYbhvJyh
 lXhvoa6gMND9A==
Subject: Re: [PATCH 3/4] ASoC: fsl-asoc-card: Add optional dt property for
 setting mclk-id
To: Rob Herring <robh@kernel.org>
References: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
 <20211203134930.128703-4-ariel.dalessandro@collabora.com>
 <Ybeu/1vsUzvAg2Ya@robh.at.kernel.org>
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Message-ID: <288a8463-b4dc-80cc-1964-23ef613201c4@collabora.com>
Date: Mon, 13 Dec 2021 19:44:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <Ybeu/1vsUzvAg2Ya@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 michael@amarulasolutions.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, broonie@kernel.org,
 bcousson@baylibre.com, perex@perex.cz, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob,

On 12/13/21 5:37 PM, Rob Herring wrote:
> On Fri, Dec 03, 2021 at 10:49:29AM -0300, Ariel D'Alessandro wrote:
>> Sound cards may allow using different main clock inputs. In the generic
>> fsl-asoc-card driver, these values are hardcoded for each specific card
>> configuration.
>>
>> Let's make it more flexible, allowing setting mclk-id from the
>> device-tree node. Otherwise, the default value for each card
>> configuration is used.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>  Documentation/devicetree/bindings/sound/fsl-asoc-card.txt | 1 +
>>  sound/soc/fsl/fsl-asoc-card.c                             | 6 ++++++
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
>> index 23d83fa7609f..b219626a5403 100644
>> --- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
>> +++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
>> @@ -82,6 +82,7 @@ Optional properties:
>>    - dai-format		: audio format, for details see simple-card.yaml.
>>    - frame-inversion	: dai-link uses frame clock inversion, for details see simple-card.yaml.
>>    - bitclock-inversion	: dai-link uses bit clock inversion, for details see simple-card.yaml.
>> +  - mclk-id		: main clock id, specific for each card configuration.
> 
> Ahh, there it is. This change and the header defines should be 1 patch 
> and driver changes another.

Ah, I see. I'll split it and send a patchset v2 for this.

Thanks,
Ariel
