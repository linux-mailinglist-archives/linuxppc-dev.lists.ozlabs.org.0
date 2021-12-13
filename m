Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE124737C8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 23:44:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCc581ScYz3c8j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 09:44:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gtp42DPr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=46.235.227.227;
 helo=bhuna.collabora.co.uk; envelope-from=ariel.dalessandro@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=gtp42DPr; 
 dkim-atps=neutral
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCc4R1fK7z2yLd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 09:43:49 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 7E26C1F44304
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639435424; bh=UEBxljg7U0AjxP8YVVrv1TQKitx1bpMVVjCQIvNZxmM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gtp42DPr62P1xEgyR9Ua5atRu227T9uo7AU0GOjOCcpdQT76gXktGHcEoHfDVKpSm
 G9sbIRXCepQNryY6CwJygV68qXn+qbLbDs2F0RIUrvbim3xazRDRoBTx+0fEfk3JfQ
 5MMwP3aNhLdNnQTZJymmDEt+r5UKlav1XDpH0FwwQWWwkBPNL5syEkmDr3nNSsFc0l
 x79S1m3gYVR9BXAiYlzobKsupboLT4i+G51pLLa901grhOEhxA9DflmEb7EiuhZC6/
 seQl9WwNKCE589LGMiy59wHts1Ulv9mQVyVx0CXwnS5yA8wJUrILquRIEExGCUy92N
 vh51hArjODXrA==
Subject: Re: [PATCH 0/4] fsl-asoc-card: Add optional dt property for setting
 mclk-id
To: Rob Herring <robh@kernel.org>
References: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
 <YbeukcwXQueEquJZ@robh.at.kernel.org>
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Message-ID: <f35f34bc-e850-40a8-7d5e-3b783aeeaac8@collabora.com>
Date: Mon, 13 Dec 2021 19:43:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YbeukcwXQueEquJZ@robh.at.kernel.org>
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

Thanks for the review.

On 12/13/21 5:35 PM, Rob Herring wrote:
> On Fri, Dec 03, 2021 at 10:49:26AM -0300, Ariel D'Alessandro wrote:
>> This is a follow up of patchset:
>>
>>     [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx
> 
> Link?

Link to the datasheet?

http://www.ti.com/lit/ds/symlink/tlv320aic3100.pdf

> 
>> Sound cards may allow using different main clock inputs. In the generic
>> fsl-asoc-card driver, these values are hardcoded for each specific card
>> configuration.
>>
>> Let's make it more flexible, allowing setting mclk-id from the
>> device-tree node.
>>
>> Ariel D'Alessandro (4):
>>   dt-bindings: sound: Rename tlv320aic31xx-micbias as tlv320aic31xx
>>   dt-bindings: tlv320aic31xx: Define PLL clock inputs
>>   ASoC: fsl-asoc-card: Add optional dt property for setting mclk-id
> 
> 'mclk-id' is not documented.
> 
>>   ASoC: fsl-asoc-card: Remove BCLK default value for tlv320aic31xx card
>>
>>  .../devicetree/bindings/sound/fsl-asoc-card.txt    |  1 +
>>  .../devicetree/bindings/sound/tlv320aic31xx.txt    |  2 +-
>>  arch/arm/boot/dts/am43x-epos-evm.dts               |  2 +-
>>  include/dt-bindings/sound/tlv320aic31xx-micbias.h  |  9 ---------
>>  include/dt-bindings/sound/tlv320aic31xx.h          | 14 ++++++++++++++
>>  sound/soc/codecs/tlv320aic31xx.c                   |  2 +-
>>  sound/soc/fsl/fsl-asoc-card.c                      |  7 ++++++-
>>  7 files changed, 24 insertions(+), 13 deletions(-)
>>  delete mode 100644 include/dt-bindings/sound/tlv320aic31xx-micbias.h
>>  create mode 100644 include/dt-bindings/sound/tlv320aic31xx.h
>>
>> -- 
>> 2.30.2

Regards,
Ariel
