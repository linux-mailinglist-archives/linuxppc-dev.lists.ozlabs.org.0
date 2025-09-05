Return-Path: <linuxppc-dev+bounces-11766-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68183B44E8E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 09:02:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJ6jX6tNyz3bb2;
	Fri,  5 Sep 2025 17:02:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757055744;
	cv=none; b=G19ErRn1WE4DgFhg/QYv0jIYsuUE5PpJlomcG9ghsQjLoM8Q0Ie7VoW4wQlYjOeqgJqcDzKuQNay4nPmzXWVrj73ON56rR4QboHye25k/9Wra3FZWrvZq6Cg1km6hv8+0zDQ0z7h3FAa8Yb22H00RGkfuKWWU9wRJKupzW68cY4pwnqDwGX4QnpW26UBGXc6Be+PF1G0MQF1BbWJweF0o4xAVXPc1qKUskq3YE2ogqMPZfJVlOdQ+H579nj+XOSLTZa6CFsJadnzzbw56TyzHAsWoB50Ld5+QMeJVqg0ysrUH7W57jISHbZ1IIGQkoHlEyNGJqs9vKxZhYb2ot/Wag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757055744; c=relaxed/relaxed;
	bh=BCztibAhhBTDHSkAF2yablH6ptehaXCUGtBPhE4VLI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oM8qlQUD5CD5oJ9whk26MKiOuBv7l0ztd8ALJaBAAKIZT2BindA2ADlkJotsy7PeBcZLE58bqjqVi4q4g/nEzRUHCNwcar7imup0hhpyQDYN8iul4URO+wPT5BrZYjLpK9MThEo25K25LSEmHNlbs50rJwasXcdDakwZq36P8AhK9i3YGc6w+0n6z6NB3i9nHcL7BbRzNglzajfTQcQcd+4RCUu693fjToQdMxFeTYe4fBpTJ+Q+OCfYVNnQQFHlyhyN2FoiS3z7Gajd44DMBSj3amhxpu2Vt+A1pX1qDGcGC5WMgQYR0bB235/uLofDP3qr17CpinVXeYnTrwSqYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TtM6XFxq; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TtM6XFxq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJ6jX0CyQz3bV5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 17:02:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7328B60278;
	Fri,  5 Sep 2025 07:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61182C4CEF1;
	Fri,  5 Sep 2025 07:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757055741;
	bh=fTBkavZ91ssgIY3s9ptez3AviwpoecTcBhXYPHGbbbM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TtM6XFxqtN3QeBsuHZlpZfezN9qmURrZfJfI5CCDT5eGvBRGhyX9PdD9MGup8yjnn
	 0p9KCIiNdorRgLjz3L3MYT1Z5S78sCbEjPaYAd5TxYTGTYxlzNpe7dyP6ctX6eXSTt
	 wmEFEgieMnkUhnyQscTQ323sCBTvrUj+AFt1Az5eyDJQY3Y7/v1/1MNoRdo0djg0Cg
	 BGN7Js2b+GPfHh7BDZdtkTHST45y2B/DgwyGbWoz80F94Z0WMwrnI3fpho1XctpIDt
	 7jr1TSxMsWIG+Ru4C3Lhao5f3LzrMHUw1awATjvXu0RsNrOievNIEjJhefvmsZ/tIM
	 btioibLovSD7A==
Message-ID: <a04f3aa8-e7e3-4d20-bc86-5496c7abe272@kernel.org>
Date: Fri, 5 Sep 2025 09:02:09 +0200
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
Subject: Re: [PATCH v4 09/10] thermal/drivers/ti-soc-thermal: Use scope-based
 cleanup helper
To: Andreas Kemnade <andreas@kemnade.info>,
 Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Alim Akhtar
 <alim.akhtar@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Ben Horgan <ben.horgan@arm.com>, zhenglifeng <zhenglifeng1@huawei.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>, Fabio Estevam
 <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
 linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
 <20250903131733.57637-10-zhangzihuan@kylinos.cn>
 <20250905085726.2bc6fcb4@akair>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20250905085726.2bc6fcb4@akair>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 05/09/2025 08:57, Andreas Kemnade wrote:
> Am Wed,  3 Sep 2025 21:17:32 +0800
> schrieb Zihuan Zhang <zhangzihuan@kylinos.cn>:
> 
>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
>> annotation for policy references. This reduces the risk of reference
>> counting mistakes and aligns the code with the latest kernel style.
>>
>> No functional change intended.
>>
>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>> ---
>>  drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 13 ++++---------
>>  1 file changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
>> index 0cf0826b805a..37d06468913a 100644
>> --- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
>> +++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
>> @@ -27,7 +27,6 @@
>>  
>>  /* common data structures */
>>  struct ti_thermal_data {
>> -	struct cpufreq_policy *policy;
>>  	struct thermal_zone_device *ti_thermal;
>>  	struct thermal_zone_device *pcb_tz;
>>  	struct thermal_cooling_device *cool_dev;
>> @@ -218,6 +217,7 @@ int ti_thermal_register_cpu_cooling(struct ti_bandgap *bgp, int id)
>>  {
>>  	struct ti_thermal_data *data;
>>  	struct device_node *np = bgp->dev->of_node;
>> +	struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(0);
>>  
> this looks as it changes the lifecycle from the device lifetime to just
> this function...
> 
>>  	/*
>>  	 * We are assuming here that if one deploys the zone
>> @@ -234,19 +234,17 @@ int ti_thermal_register_cpu_cooling(struct ti_bandgap *bgp, int id)
>>  	if (!data)
>>  		return -EINVAL;
>>  
>> -	data->policy = cpufreq_cpu_get(0);
>> -	if (!data->policy) {
>> +	if (!policy) {
>>  		pr_debug("%s: CPUFreq policy not found\n", __func__);
>>  		return -EPROBE_DEFER;
>>  	}
>>  
>>  	/* Register cooling device */
>> -	data->cool_dev = cpufreq_cooling_register(data->policy);
>> +	data->cool_dev = cpufreq_cooling_register(policy);
> 
> and it is passed on to something living beyond this function. I see no
> _get(policy) in cpufreq_cooling_register().
> Am I missing something?
Yeah, " No functional change intended." is clearly incorrect.

I already commented on this series that it is very bad and author should
does not understand how cleanup.h works, and here is another example.

IMO, entire patchset should be dropped.

Best regards,
Krzysztof

