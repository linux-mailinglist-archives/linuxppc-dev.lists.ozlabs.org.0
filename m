Return-Path: <linuxppc-dev+bounces-11651-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA73DB414BC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 08:11:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGsgj05vKz2yGM;
	Wed,  3 Sep 2025 16:11:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756879888;
	cv=none; b=fyaFckTQvN/ZmGabRFkJ6DwZ4XHS4agQZrdFUug26IRS2Mxk6DwrXM5K8c8Ns0Qe7HN6R6iPh5qIV8r7ZbqhzvUOAcoWgNlFQoHvgwFA0qOem7NWVkTEyymOX4FaFkmU7K2sEYY37ktUZiMVPQHb6A5p5KRtqI/2urwu/9ld1fspcjHZvcRw8FKABJesnFCk45HlH5Z8pf/vIGJw/kZEl5eCrqGyoBET8q2uo1ChArWVWF1qBopSxu4yMVo5S3q/WfwezjkQCyao99Fe/OnLwyy8BxrzpmCZZTnmUXbCwIsP9V9qQr0NnNSRChOsjgiGZOgg+hXb1Ke23a6idObKtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756879888; c=relaxed/relaxed;
	bh=d0WyNGuYiKE0na4f5iWEitE07ZRC6jMpsx7P8kw5Wxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KWvoe1ArikufL5LRPWevn5TRclmEcgvunIDjg36ehFQEsxPhC7WRpc0TPQgyOyfHqduf/TZvVfFG+cuNmNJnursdYB/ZO5PhEgicHdvlNNYfCmcDVBV+fRqbd613HVoUhOTpwCkCXDHbWKDqoYm4MLHCzC3Hhfvw2h1wkCWS+cn676AuXGE/oVA7G9Pgv1aSbiCHTwmhUG1IUHVJY84aYKd+BqYcE+j74n065OO7AluQNDnsmykUyKxEO51FgA96LiRBZ0+c8Huf0pTvQyusObVL1AOLCJBlwMcgCaDPtoxsxcUhYwWiOvcazFqlkFP4ciyrfRviLJ51651w8ArzGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OhG5GB8k; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OhG5GB8k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGsgg0dnTz2xnw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 16:11:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 45E8960236;
	Wed,  3 Sep 2025 06:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C74C4CEF0;
	Wed,  3 Sep 2025 06:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756879884;
	bh=DEWGVqilbGOs6UgUqJ9p5sDy7a3JODRL7uL+KLdqaDM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OhG5GB8keEQ58YNgxAI/Sjc1rocLhOfxCLl/XZwlEzS1WCwat/fRihODLk7ZhvcWr
	 H3XYzOgamWZw2UP1IcvzjzFaTBdCBESmwBjW57Q0I4QlZ/cxF1rW0y5KmmG5aM1SZs
	 0uwLCKpyV6hM1ZLubZDbjoGbQOQY4z6fZm3zXiREW8Xa2eaDBHXBu8+MrVOXj9aNfo
	 pqJnCWRxzZG176Yw/RX5egzLS+IB1ebxgjYZCtkELZ6V0YgtZVtdAYK9klO4OCqnRM
	 DQ1ON/yN8nE1oOUXnkRR5ccXnOp7joOzEV/f+6jB4MMYU965FZbZcYRzziTXfVhat1
	 LzBIkLuy7dzZg==
Message-ID: <04ca5584-b10e-465d-bbda-627b7f743ce9@kernel.org>
Date: Wed, 3 Sep 2025 08:11:12 +0200
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
Subject: Re: [PATCH v3 12/12] PM: EM: Use scope-based cleanup helper
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: airlied@gmail.com, alim.akhtar@samsung.com, beata.michalska@arm.com,
 ben.horgan@arm.com, bp@alien8.de, catalin.marinas@arm.com,
 cw00.choi@samsung.com, daniel.lezcano@kernel.org,
 dave.hansen@linux.intel.com, dri-devel@lists.freedesktop.org,
 edubezval@gmail.com, festevam@gmail.com, imx@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, j-keerthy@ti.com,
 jani.nikula@linux.intel.com, kernel@pengutronix.de,
 kyungmin.park@samsung.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, lukasz.luba@arm.com, mpe@ellerman.id.au,
 myungjoo.ham@samsung.com, pavel@kernel.org, ptsm@linux.microsoft.com,
 rafael@kernel.org, rodrigo.vivi@intel.com, rui.zhang@intel.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, simona@ffwll.ch,
 srinivas.pandruvada@linux.intel.com, sudeep.holla@arm.com,
 sumitg@nvidia.com, thierry.reding@gmail.com, tursulin@ursulin.net,
 viresh.kumar@linaro.org, will@kernel.org, yangyicong@hisilicon.com,
 zhenglifeng1@huawei.com
References: <b38e64cc-4971-4e71-931c-820453aa91a7@kernel.org>
 <20250903021230.1044454-1-zhangzihuan@kylinos.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250903021230.1044454-1-zhangzihuan@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 03/09/2025 04:12, Zihuan Zhang wrote:
>> You are not improving the source code here. This is not how to use
>>  __free() and you clearly do not understand the source code.
> 
> Sorry for the problem, policy should be assigned after cpumask_test_cpu().
> 
> I actually realized earlier that __free() only frees at the end of the variable’s lifetime. 
> I had suggested using a braced macro in cpufreq.h to allow immediate release after use, 
> but I understand the maintainer’s advice to “keep it simple” and will follow that.
> 
>> What's more, you did not use standard tools which would tell you this is
>> buggy and wrong.
> 
> Could you please let me know which standard tools you recommend for detecting such issues? 
> 
> I’d like to use them to avoid similar mistakes in the future.
All standard tools used for kernel development, sparse, smatch, clang,
coccinelle, see my talk from OSSE25.

Best regards,
Krzysztof

