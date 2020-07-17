Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6DE223A3A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 13:18:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7TBb3gK3zDrQl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 21:18:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=46.235.227.227;
 helo=bhuna.collabora.co.uk; envelope-from=arnaud.ferraris@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7T902dP4zDr7x
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 21:16:50 +1000 (AEST)
Received: from [IPv6:2a01:e35:2fb5:1510:c567:382e:1974:9868] (unknown
 [IPv6:2a01:e35:2fb5:1510:c567:382e:1974:9868])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: aferraris)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 589032A5CA8;
 Fri, 17 Jul 2020 12:16:45 +0100 (BST)
Subject: Re: [PATCH 0/4] ASoC: fsl_asrc: allow selecting arbitrary clocks
To: Nicolin Chen <nicoleotsuka@gmail.com>
References: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
 <20200702184226.GA23935@Asurada-Nvidia>
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Autocrypt: addr=arnaud.ferraris@collabora.com; keydata=
 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
 xZQG6fKWuIur3RI=
Message-ID: <abdd7265-43d2-49b5-6afd-70d65baac30e@collabora.com>
Date: Fri, 17 Jul 2020 13:16:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200702184226.GA23935@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nic,

Le 02/07/2020 à 20:42, Nicolin Chen a écrit :
> Hi Arnaud,
> 
> On Thu, Jul 02, 2020 at 04:22:31PM +0200, Arnaud Ferraris wrote:
>> The current ASRC driver hardcodes the input and output clocks used for
>> sample rate conversions. In order to allow greater flexibility and to
>> cover more use cases, it would be preferable to select the clocks using
>> device-tree properties.
> 
> We recent just merged a new change that auto-selecting internal
> clocks based on sample rates as the first option -- ideal ratio
> mode is the fallback mode now. Please refer to:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20200702&id=d0250cf4f2abfbea64ed247230f08f5ae23979f0

While working on fixing the automatic clock selection (see my v3), I
came across another potential issue, which would be better explained
with an example:
  - Input has sample rate 8kHz and uses clock SSI1 with rate 512kHz
  - Output has sample rate 16kHz and uses clock SSI2 with rate 1024kHz

Let's say my v3 patch is merged, then the selected input clock will be
SSI1, while the selected output clock will be SSI2. In that case, it's
all good, as the driver will calculate the dividers right.

Now, suppose a similar board has the input wired to SSI2 and output to
SSI1, meaning we're now in the following case:
  - Input has sample rate 8kHz and uses clock SSI2 with rate 512kHz
  - Output has sample rate 16kHz and uses clock SSI1 with rate 1024kHz
(the same result is achieved during capture with the initial example
setup, as input and output properties are then swapped)

In that case, the selected clocks will still be SSI1 for input (just
because it appears first in the clock table), and SSI2 for output,
meaning the calculated dividers will be:
  - input: 512 / 16 => 32 (should be 64)
  - output: 1024 / 8 => 128 (should be 64 here too)

---

I can't see how the clock selection algorithm could be made smart enough
to cover cases such as this one, as it would need to be aware of the
exact relationship between the sample rate and the clock rate (my
example demonstrates a case where the "sample rate to clock rate"
multiplier is identical for both input and output, but this can't be
assumed to be always the case).

Therefore, I still believe being able to force clock selection using
optional DT properties would make sense, while still using the
auto-selection by default.

Regards,
Arnaud

> 
> Having a quick review at your changes, I think the DT part may
> not be necessary as it's more likely a software configuration.
> I personally like the new auto-selecting solution more.
> 
>> This series also fix register configuration and clock assignment so
>> conversion can be conducted effectively in both directions with a good
>> quality.
> 
> If there's any further change that you feel you can improve on
> the top of mentioned change after rebasing, I'd like to review.
> 
> Thanks
> Nic
> 
