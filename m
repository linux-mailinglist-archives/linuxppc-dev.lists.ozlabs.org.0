Return-Path: <linuxppc-dev+bounces-3055-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C699C206A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 16:30:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlNDd6Txwz3bwd;
	Sat,  9 Nov 2024 02:30:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731079825;
	cv=none; b=KiSQjsblAX43wcelX1Xbbzd2DA4PDnJcn2+gN5G7JzKkA9lJ0jWxL5EYXtRk6OeOHcjvfj7A0vj8TzB0WHvEmUiYTfg0VqX96A5Rl7z92gNh3kGIRyxzoQnDi0pvQEVm92UIby/gteXHQVQC6Mgrh7mGN3xvJZEQdLwXpMN7a6URLBdyjAX/KY4T2ZaL8xtKyBxf4GAPWYnCEXGh1i4sDYAF0ulWB4hqu3zEi/9BmjRjO5GrQkdc1B6voT5UGFTvgVaJyT4zIQofNE1F1TFLtJt5TE/lQEe3DZIFhIdM7cD5gPdqi5JZcrr9ORkMqcxaiK5dItzlv+ufESclDKNBcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731079825; c=relaxed/relaxed;
	bh=8I6U+47/hHNafUo95LxkdaK3+2qZRADtWBPglb8ZZc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X9vMIdeqarH5TybCc7Wz0cCL2/uRGoyM108I7KQsCVn9hPABIwkUPnsMX88kBj0nS2iHycTg5V5TyUeVHFMJLbBalL7O5GwqA50BuwAsjQa0vu6staDc1pOVZdvZCCfILQXYHrKDHrK91KyZ2Au66Ag5U99bGjlb6tYHCJF/U3xiJQs8v1ZiPZk3ikgw5WmktCqQuACSdXAapeW0X5GUP/Az+hf/iS0RtNNE/KhYxETVUKMN15K3yoKZ6l0JOLG2aFvLu0+mrmQpKN0Aftc6ADcXquE5Jq5dyvWE8smX2omNC7yPvun4/Z9DbeF8TU6JiUDZH7Iwd85Iq/o7U7sHQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=steven.price@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=steven.price@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlNDc1R3Nz3bsS
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2024 02:30:22 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6303339;
	Fri,  8 Nov 2024 07:30:21 -0800 (PST)
Received: from [10.1.38.24] (e122027.cambridge.arm.com [10.1.38.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01B8C3F528;
	Fri,  8 Nov 2024 07:29:49 -0800 (PST)
Message-ID: <994eb729-91d3-4e96-a63e-fa0ea49f4cb7@arm.com>
Date: Fri, 8 Nov 2024 15:29:48 +0000
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells
 handling
To: Rob Herring <robh@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
References: <20241106171028.3830266-1-robh@kernel.org>
 <CGME20241108110444eucas1p20cbed7533af31573dac30dbb435c3d9d@eucas1p2.samsung.com>
 <3706d174-fadd-485f-be7b-f7ef4b11cf84@samsung.com>
 <73eacca6-b6cd-4689-8ccd-f7e2e8b716f3@arm.com>
 <CAL_JsqLyFV85w1kf397AcvZ7+Oewpe3vYeZdz_uvQrYwb1B8ag@mail.gmail.com>
 <e23ecbab-66ba-478c-b720-fb045a08bc9c@arm.com>
 <CAL_JsqLyuQaKpoq7wQeQs38HBu+_=SfgbMOGyGYtns6Dm-Y2Vw@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <CAL_JsqLyuQaKpoq7wQeQs38HBu+_=SfgbMOGyGYtns6Dm-Y2Vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 08/11/2024 14:58, Rob Herring wrote:
> On Fri, Nov 8, 2024 at 8:33 AM Steven Price <steven.price@arm.com> wrote:
>>
>> On 08/11/2024 14:04, Rob Herring wrote:
>>> On Fri, Nov 8, 2024 at 7:26 AM Steven Price <steven.price@arm.com> wrote:
>>>>
>>>> On 08/11/2024 11:04, Marek Szyprowski wrote:
>>>>> Hi Rob,
>>>>>
>>>>> On 06.11.2024 18:10, Rob Herring (Arm) wrote:
>>>>>> While OpenFirmware originally allowed walking parent nodes and default
>>>>>> root values for #address-cells and #size-cells, FDT has long required
>>>>>> explicit values. It's been a warning in dtc for the root node since the
>>>>>> beginning (2005) and for any parent node since 2007. Of course, not all
>>>>>> FDT uses dtc, but that should be the majority by far. The various
>>>>>> extracted OF devicetrees I have dating back to the 1990s (various
>>>>>> PowerMac, OLPC, PASemi Nemo) all have explicit root node properties. The
>>>>>> warning is disabled for Sparc as there are known systems relying on
>>>>>> default root node values.
>>>>>>
>>>>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>>>>> ---
>>>>>> v2:
>>>>>>   - Add a define for excluded platforms to help clarify the intent
>>>>>>     is to have an exclude list and make adding platforms easier.
>>>>>>   - Also warn when walking parent nodes.
>>>>>> ---
>>>>>>   drivers/of/base.c | 28 ++++++++++++++++++++++------
>>>>>>   drivers/of/fdt.c  |  4 ++--
>>>>>>   2 files changed, 24 insertions(+), 8 deletions(-)
>>>>>
>>>>> This patch landed in today's linux-next as commit 4b28a0dec185 ("of:
>>>>> WARN on deprecated #address-cells/#size-cells handling"). In my tests I
>>>>> found that it introduces warnings on almost all of my test systems. I
>>>>> took a look at the first one I got in my logs (Samsung Exynos Rinato
>>>>> board: arch/arm/boot/dts/samsung/exynos3250-rinato.dts):
>>>>
>>>> Just a "me too" for rk3288-firefly.dtb:
>>>>
>>>> [    0.138735] WARNING: CPU: 0 PID: 1 at drivers/of/base.c:106 of_bus_n_addr_cells+0x9c/0xd8
>>>> [    0.138776] Missing '#address-cells' in /power-management@ff730000
>>>>
>>>> I'm sure it's easy to fix up the DTB, but we shouldn't be breaking long existing DTBs.
>>>
>>> What broke?
>>
>> Nothing 'broke' as such (the board continued booting) but the WARN
>> shouldn't be happening. My CI treats the WARN as a failure as these
>> shouldn't occur unless there's a programming error.
>>
>>> The intent here is to exclude any platforms/arch which actually need
>>> the deprecated behavior, not change DTBs. That's spelled out at the
>>> WARN which I assume people would read before fixing "Missing
>>> '#address-cells' in /power-management@ff730000". I tried to make the
>>> warn message indicate that on v1 with:
>>>
>>> WARN_ONCE(!IS_ENABLED(CONFIG_SPARC), "Only listed platforms should
>>> rely on default '#address-cells'\n");
>>
>> So one possibility is to include this platform in the exclusion list -
>> but I'm not sure how to do that, I assume including CONFIG_ARM in the
>> list would rather defeat the point of the patch. But my feeling is that
>> it would involve a lot of playing whack-a-mole to identify individual
>> platforms.
> 
> Please see my posted fix in this thread. Things "broke" quite a bit
> more widely than anticipated.

Thanks for the pointer. Yes that fix seems to work for my board!

Thanks,
Steve

>> One obvious idea would be to look at the DTBs in the kernel tree and see
>> which are affected by this currently, that might be a good place to
>> start with an exclusion list.
> 
> It's been a dtc warning since 2007, so I can say all of the in tree
> dts's are fine. The problem for these reported platforms is the
> kernel, not the DT.
> 
>> You could also downgrade the warning to a pr_warn() or similar.
> 
> I find that pr_warn() may or may not get noticed, but WARN for sure
> will which is what I want here.
> 
> Rob


