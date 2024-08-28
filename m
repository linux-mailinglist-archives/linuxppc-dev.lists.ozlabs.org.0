Return-Path: <linuxppc-dev+bounces-694-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C3296283C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 15:08:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv4Tq6d3Lz2ygX;
	Wed, 28 Aug 2024 23:08:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:40e1:4800::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724850495;
	cv=none; b=Z032lLEoXoWsQUxAnPnzaxo1av7NNrHF+YuMRuMf82Tnu+gbjjnZhbhy+ApQhvvirYOo/sRrwYdTKj+23NcaZaLW1v3gqZcEZiItGurVbG11lnGF8/F6zxE8pzgQlUXr5lJhmfZx3LY0tj+Cp4Lc/IxAk78R4q2inKAmBWDRNwXiAvttsIS9MdJ5ccDCVggGqmIrKUEonO7C8QfKqC6fFR65a25shtB2Z41hqjjHwj+2YqWXQfR3Y9pr8MhOhO0X9kaqCSdoYQ48XZG68oFJmpeORYQWDkOMl9ZbGGGKTk59jjL7wrhrBcSkdZiRQyH8FunqC9hELLL98edI9Rh9+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724850495; c=relaxed/relaxed;
	bh=eQaK4NNy+eWHolvWgTmYbH5T/NtSe/Fb5RvpAzDu5zQ=;
	h=Received:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=JJ8fN73nhG+LfdfN44TxZM2kE9kKYs2Wx7XxUx2QPVauiT7ncGyJ/MDPp/qzPWe9uI6FqGEmZz0xe4wDbpKBJIeEdRHO4oJ0QPpmhpFGfGEblquGu4wAR06arb7pqtANS4NDVNetLKDXSPnyr1khBVYU65O2rpUOKsSYD7VdNo3fhqBxcHNnI2losXyI4Td4gtzU1R7O1zDw/9PWzoIY7x+c1CTF1iVdDM4crmnLMabxz4J7Qy6QOcT5exgsOvL1aAyj4X70SmACpJ8xaKGVc7NDfsnWCbin4aTWCEI7U5Wet3fkMLCU8RxjJ9k8IcuoacA6bCyC9U1nRMhVwFm9BA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HAiFsDAs; dkim-atps=neutral; spf=pass (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HAiFsDAs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv4Tq5699z2yZZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 23:08:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B100BCE16D9;
	Wed, 28 Aug 2024 13:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61077C98ED2;
	Wed, 28 Aug 2024 13:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724850490;
	bh=yaNMXXdjBE6xh1aUs25Qs6gO9zLIC6OHaKFtHsr955o=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=HAiFsDAsdF6t7Xr1B5cQxHIoAefJ28SjkFhQBQF4eSkwJ+O3/qPXsAzl8y6+7bSl+
	 5F1i/Uagd/+9ocbcLtsfK9+LJieLzSUeAA5W6zuBoKfKKJ3jrffhVEFu6lORyJ/Fso
	 iMxBYrLXxZjj2JxqgrsZJIWCrW54u3r6krNcNxajHPbJe8YqfxfS+5NQ0gaBPSc3ZC
	 J0j+eTXai3PJG5r9AHMuY5K0SuFjwp+OLQ27EoHVYUhxtBRmSrKvSsmAXmfgoIFs4C
	 tXdrHXFznFJuLS0Fudu/zUXiSBgWi888cb0KE5ukbrNnlPdsFsXkbPZOAMj/oFLUD7
	 DX4KzuN7rxfLQ==
Message-ID: <32e8ef50-ae45-4001-92b6-1e9e0608b402@kernel.org>
Date: Wed, 28 Aug 2024 15:08:02 +0200
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
 <87abe3f1-3cf2-4331-8dde-a422716dd94a@kernel.org>
 <97ff8c02-1a97-7974-06fa-edb35437707d@huawei.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <97ff8c02-1a97-7974-06fa-edb35437707d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2024 03:58, Jinjie Ruan wrote:
> 
> 
> On 2024/8/27 21:50, Krzysztof Kozlowski wrote:
>> On 27/08/2024 13:46, Jinjie Ruan wrote:
>>> Use the dev_err_probe() helper to simplify error handling during probe.
>>> This also handle scenario, when EDEFER is returned and useless error
>>> is printed.
>>
>> ? Sorry, this cannot happen. Please point to below code which can defer.
>>
> 
> Thank you!
> 
> This is not referring to a specific one, but rather the benefits it
> offers，simplify code is the main purpose, if necessary, it will be
> removed in next version.

It just feels like you are doing these in machine way without actually
knowing concepts behind dev_err_probe().

Best regards,
Krzysztof


