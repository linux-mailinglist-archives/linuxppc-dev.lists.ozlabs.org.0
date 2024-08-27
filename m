Return-Path: <linuxppc-dev+bounces-613-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B488D960CCE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 16:00:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtThv4RzZz2yVj;
	Wed, 28 Aug 2024 00:00:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724767054;
	cv=none; b=WnliY4OJlR2VX4dXvy6374Le+VeYmxeXUe9yCHliU8BTxEFa+t+p9PwcNVta2B6Wf85syePt2d02n28qZ1PcPrJGpDqi+XoAD78Xu1+Me7QQzCbIBcdd6xZ7uGloy32JcL1dsVr9VtHR0tv+/FctmPv6LbgBCljH1nmCQPVzanKjBLd60R6LEli4dVbBhRrouCRr8KVqELAfx2ir6+NtqwPLEQGSKcfBpposszYS1jBm/MkhxC5A7t1vW9jbvzNyOVsYNLaQ2HFlF9ANbSU+5kxmuz7AdSIRB6b+AJ7wi6v4uz/gQtE3sUXBj2JtFIMG7F6rjabre5J0h0jNj/OGnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724767054; c=relaxed/relaxed;
	bh=jJis+ouQ0Kcy6+6HVNxA3+Iwevp/Yl1QfjteXg47L9A=;
	h=Received:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=S55kSP35pyeZ5XJ2hGyCjaQiEod+c6WPY+8dWg7vUdo84zwyhm3lSvKWsDMad1OTu5M6bvNhc04Ez6Rr9AKjqHBg5JiSkptBOHyKuwoE+NnjBxZBhYT8mjj47iiFusT6fNt8JHnUWAFnpjOtyBEWbnWvVXAipzBnPqKGuzfkhJBfbOOiFkjLWGorK4jYwkIeCjeUE3RsWsmDd5kjDYCqId3ULBa2zOOHBCwrx55liCMjuZjZuCBd3iVqK9fn+HO4UGwqulkh8zLhwkSvQHvbGI2zm5y3dJOhQs2TGFfuLIbOM1cBHaicCUtrO+qN3hFKiLktySbbNAPYD/rkFJocvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bo3ZzlPo; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bo3ZzlPo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtTd95sxCz2yVT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 23:57:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 86391A41A26;
	Tue, 27 Aug 2024 13:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDD6C4FDF2;
	Tue, 27 Aug 2024 13:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724766652;
	bh=yyaK86cIMMTd3wpksUlSfN5t/YeeCIjLW+ZTAg0foC8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Bo3ZzlPohVVBS/ZKvyxFyFyp2cBhnsbxo9SQzyKnOYbsd9I62/PFsT7OIv0wcW+7J
	 QhKdxx2gTghDrpfNkuuHYmzDhUM7jpcJsprjKQenAmzGjF/EfX6j+GmtQ990ypUHsc
	 tWjNFOdobxbggCTId7Sg2L4bbeA3+bgj+KbdyqcjVhXQYTog1AitXi4u3kx8Gs5J6k
	 45tGjHM1sdDy+AQu2FRbIaQimz+6u6wo1pSqz6DjqtCicU6zLz6v/28dBe3jRE20XT
	 VWKYBl3hYkEI7YQZ8zhh8FbAws6VehJQlz6Owpn1+xNkHosQtqPk4ylT6TQE2XbMCv
	 V5gopRNyQjL9w==
Message-ID: <87abe3f1-3cf2-4331-8dde-a422716dd94a@kernel.org>
Date: Tue, 27 Aug 2024 15:50:45 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 2/8] soc: fsl: cpm1: Simplify with dev_err_probe()
To: Jinjie Ruan <ruanjinjie@huawei.com>, andrew@lunn.ch,
 sebastian.hesselbarth@gmail.com, gregory.clement@bootlin.com,
 herve.codina@bootlin.com, qiang.zhao@nxp.com, christophe.leroy@csgroup.eu,
 thierry.reding@gmail.com, jonathanh@nvidia.com, nm@ti.com,
 ssantosh@kernel.org, petlozup@nvidia.com, pshete@nvidia.com,
 christophe.jaillet@wanadoo.fr, ulf.hansson@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org, jic23@kernel.org
References: <20240827114607.4019972-1-ruanjinjie@huawei.com>
 <20240827114607.4019972-3-ruanjinjie@huawei.com>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20240827114607.4019972-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2024 13:46, Jinjie Ruan wrote:
> Use the dev_err_probe() helper to simplify error handling during probe.
> This also handle scenario, when EDEFER is returned and useless error
> is printed.

? Sorry, this cannot happen. Please point to below code which can defer.

> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/soc/fsl/qe/tsa.c | 62 +++++++++++++++-------------------------
>  1 file changed, 23 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> index 7fa399b7a47c..fc37d23b746d 100644
> --- a/drivers/soc/fsl/qe/tsa.c
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -453,10 +453,8 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>  
>  	for_each_available_child_of_node_scoped(np, tdm_np) {
>  		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
> -		if (ret) {
> -			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
> -			return ret;
> -		}
> +		if (ret)
> +			return dev_err_probe(tsa->dev, ret, "%pOF: failed to read reg\n", tdm_np);
>  		switch (tdm_id) {
>  		case 0:
>  			tsa->tdms |= BIT(TSA_TDMA);
> @@ -465,18 +463,15 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>  			tsa->tdms |= BIT(TSA_TDMB);
>  			break;
>  		default:
> -			dev_err(tsa->dev, "%pOF: Invalid tdm_id (%u)\n", tdm_np,
> -				tdm_id);
> -			return -EINVAL;
> +			return dev_err_probe(tsa->dev, -EINVAL, "%pOF: Invalid tdm_id (%u)\n",
> +					     tdm_np, tdm_id);
>  		}
>  	}
>  
>  	for_each_available_child_of_node_scoped(np, tdm_np) {
>  		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
> -		if (ret) {
> -			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
> -			return ret;
> -		}
> +		if (ret)
> +			return dev_err_probe(tsa->dev, ret, "%pOF: failed to read reg\n", tdm_np);
>  
>  		tdm = &tsa->tdm[tdm_id];
>  		tdm->simode_tdm = TSA_SIMODE_TDM_SDM_NORM;
> @@ -484,35 +479,26 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>  		val = 0;
>  		ret = of_property_read_u32(tdm_np, "fsl,rx-frame-sync-delay-bits",
>  					   &val);
> -		if (ret && ret != -EINVAL) {
> -			dev_err(tsa->dev,
> -				"%pOF: failed to read fsl,rx-frame-sync-delay-bits\n",
> -				tdm_np);
> -			return ret;
> -		}
> -		if (val > 3) {
> -			dev_err(tsa->dev,
> -				"%pOF: Invalid fsl,rx-frame-sync-delay-bits (%u)\n",
> -				tdm_np, val);
> -			return -EINVAL;
> -		}
> +		if (ret && ret != -EINVAL)
> +			return dev_err_probe(tsa->dev, ret,
> +					     "%pOF: failed to read fsl,rx-frame-sync-delay-bits\n",
> +					     tdm_np);
> +		if (val > 3)
> +			return dev_err_probe(tsa->dev, -EINVAL,
> +					     "%pOF: Invalid fsl,rx-frame-sync-delay-bits (%u)\n",
> +					     tdm_np, val);
>  		tdm->simode_tdm |= TSA_SIMODE_TDM_RFSD(val);
>  
>  		val = 0;
>  		ret = of_property_read_u32(tdm_np, "fsl,tx-frame-sync-delay-bits",
>  					   &val);
> -		if (ret && ret != -EINVAL) {
> -			dev_err(tsa->dev,
> -				"%pOF: failed to read fsl,tx-frame-sync-delay-bits\n",
> -				tdm_np);
> -			return ret;
> -		}
> -		if (val > 3) {
> -			dev_err(tsa->dev,
> -				"%pOF: Invalid fsl,tx-frame-sync-delay-bits (%u)\n",
> -				tdm_np, val);
> -			return -EINVAL;
> -		}
> +		if (ret && ret != -EINVAL)
> +			return dev_err_probe(tsa->dev, ret,
> +				"%pOF: failed to read fsl,tx-frame-sync-delay-bits\n", tdm_np);
> +		if (val > 3)
> +			return dev_err_probe(tsa->dev, -EINVAL,
> +					     "%pOF: Invalid fsl,tx-frame-sync-delay-bits (%u)\n",
> +					     tdm_np, val);
>  		tdm->simode_tdm |= TSA_SIMODE_TDM_TFSD(val);
>  
>  		if (of_property_read_bool(tdm_np, "fsl,common-rxtx-pins"))
> @@ -645,10 +631,8 @@ static int tsa_probe(struct platform_device *pdev)
>  		return PTR_ERR(tsa->si_regs);
>  
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "si_ram");
> -	if (!res) {
> -		dev_err(tsa->dev, "si_ram resource missing\n");
> -		return -EINVAL;
> -	}
> +	if (!res)
> +		return dev_err_probe(tsa->dev, -EINVAL, "si_ram resource missing\n");
>  	tsa->si_ram_sz = resource_size(res);
>  	tsa->si_ram = devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(tsa->si_ram))

Best regards,
Krzysztof


