Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF18467CAA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 18:37:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5Klr3T24z3cNK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 04:37:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Yr7TRkzR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3;
 helo=bhuna.collabora.co.uk; envelope-from=ariel.dalessandro@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Yr7TRkzR; 
 dkim-atps=neutral
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5KlC5pKMz2xtZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 04:37:11 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 3E02E1F40F12
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638553029; bh=6DQqd6PdWjbwATYc5OwpxooTIyDGyjPYpNpe0Obs3Sc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Yr7TRkzR/0XKIud0HXHmtfb1p9HPCeObqRIBjA9PgYseBSC92kOQLiCRUFZMwkVA/
 pxUJyDEdierMw6v4Y+mrSnE5uXBJQEmILlMdiy47sBKNu1JMp4JL1I2VIjmQSwkbZR
 s6XqUQEWOwIp9sHjSaKSGoyF4wSTsUN6GoymFrRFBBcHFCtBt2QIClg4RNUCW/ZMkd
 6SnXkfc3addcXm8oNwu0b9euYjERQZMbBdJqBKN3c1djj6GEbdTixaqf8r2xM+fjN5
 95qyx6k9h5kyKQQhtlUUQUmVNDbWy0hHsIfcqvMP0hJzAP0KJjYWYYopRazNyARIA1
 9Mvv8TyrSfbIg==
Subject: Re: [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx
To: Mark Brown <broonie@kernel.org>
References: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
 <163762561675.2471742.16439171676950432106.b4-ty@kernel.org>
 <6a2ff1f0-ebd9-be6d-9b2c-5704edd7c25d@collabora.com>
 <YapVH3b9urxvngWG@sirena.org.uk>
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Message-ID: <2a79ca46-74b7-4add-912e-d687cee825a7@collabora.com>
Date: Fri, 3 Dec 2021 14:37:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YapVH3b9urxvngWG@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, perex@perex.cz, nicoleotsuka@gmail.com,
 bkylerussell@gmail.com, michael@amarulasolutions.com, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mark,

On 12/3/21 2:34 PM, Mark Brown wrote:
> On Fri, Dec 03, 2021 at 02:25:17PM -0300, Ariel D'Alessandro wrote:
>> On 11/22/21 9:00 PM, Mark Brown wrote:
> 
>>> If any updates are required or you are submitting further changes they
>>> should be sent as incremental updates against current git, existing
>>> patches will not be replaced.
> 
>> I gotta send a fix for one of the patches. So, should it be a new
>> incremental patch or I can still send a patchset v2?
> 
> See above.

Got it, thank you for confirming it.
