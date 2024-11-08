Return-Path: <linuxppc-dev+bounces-3049-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 062249C1DE8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 14:27:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlKVK011rz3bvd;
	Sat,  9 Nov 2024 00:27:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731072424;
	cv=none; b=IdXk2+KAmj1Mvnam0Qa66cAJk0TF3hLUccmv/ObyaXUQFeRQFTaysjgYKKOo+K53GO5RqVSy8WzrBU/KTNnKPycdSvI1jel1Dix0YG0f+nqYfbfoPRC3gHERrjpX1LIm/bxdP4sBiqVrQzFHcPN/fl/pWm68GiTa3xlKGH4DWfPWx4mg2KXxuttNuIHrRJAAbvqRHCl5lfl3J1awdszaO6kqdSm96OtUNzZxfEPBkdgdfDJIVu5MGvmC+DtoBDQzDyArcnjFiVdRs0wcahtq/TkekBmnJBlxccD2GTvWNdeJKPSbjWr6j2tyI1ntWrdUTJ2Lo3t0XbEHhHayeqwIvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731072424; c=relaxed/relaxed;
	bh=QbRTpNxhRv2340WcFHG3MwlCMkrXyTpBzi+DPZo6p08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oW4UGFOD+oPVR9t8Xjm50Q8gADV5W9KGjeMQ9uyBv5N94lDHc0G44ZwFNZDsFHQsLH5FGWoVoSANB/Wx11UtANewwCOv26wtyIvLDdSZZhYpa3s7bgbodQ6+B30yiZKwGaLiH1IJw6YNTiM07v/QQLqnI9PlYQeZ7kwvKT66SYd7sQNjueSOqygOGNaGzBIY4jffKPnwjhyOPSBQq3V09OqUDJEDAVNiJleSDrU7xqSdrlH00TEj9wOGyxscmxZYWoICV6EokSoi1W0yYW/1wBaVj1xUlWL8VI+h1nYjTikBQjLjOdURtqENJV5V/nheXg/c5eKpxF5FERuBNWcvtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=steven.price@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=steven.price@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlKVG42jJz3btm
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2024 00:27:00 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E6D1339;
	Fri,  8 Nov 2024 05:26:57 -0800 (PST)
Received: from [10.1.38.24] (e122027.cambridge.arm.com [10.1.38.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C8793F528;
	Fri,  8 Nov 2024 05:26:24 -0800 (PST)
Message-ID: <73eacca6-b6cd-4689-8ccd-f7e2e8b716f3@arm.com>
Date: Fri, 8 Nov 2024 13:26:23 +0000
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
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 "Rob Herring (Arm)" <robh@kernel.org>, Saravana Kannan
 <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
References: <20241106171028.3830266-1-robh@kernel.org>
 <CGME20241108110444eucas1p20cbed7533af31573dac30dbb435c3d9d@eucas1p2.samsung.com>
 <3706d174-fadd-485f-be7b-f7ef4b11cf84@samsung.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <3706d174-fadd-485f-be7b-f7ef4b11cf84@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 08/11/2024 11:04, Marek Szyprowski wrote:
> Hi Rob,
> 
> On 06.11.2024 18:10, Rob Herring (Arm) wrote:
>> While OpenFirmware originally allowed walking parent nodes and default
>> root values for #address-cells and #size-cells, FDT has long required
>> explicit values. It's been a warning in dtc for the root node since the
>> beginning (2005) and for any parent node since 2007. Of course, not all
>> FDT uses dtc, but that should be the majority by far. The various
>> extracted OF devicetrees I have dating back to the 1990s (various
>> PowerMac, OLPC, PASemi Nemo) all have explicit root node properties. The
>> warning is disabled for Sparc as there are known systems relying on
>> default root node values.
>>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>> v2:
>>   - Add a define for excluded platforms to help clarify the intent
>>     is to have an exclude list and make adding platforms easier.
>>   - Also warn when walking parent nodes.
>> ---
>>   drivers/of/base.c | 28 ++++++++++++++++++++++------
>>   drivers/of/fdt.c  |  4 ++--
>>   2 files changed, 24 insertions(+), 8 deletions(-)
> 
> This patch landed in today's linux-next as commit 4b28a0dec185 ("of: 
> WARN on deprecated #address-cells/#size-cells handling"). In my tests I 
> found that it introduces warnings on almost all of my test systems. I 
> took a look at the first one I got in my logs (Samsung Exynos Rinato 
> board: arch/arm/boot/dts/samsung/exynos3250-rinato.dts):

Just a "me too" for rk3288-firefly.dtb:

[    0.138735] WARNING: CPU: 0 PID: 1 at drivers/of/base.c:106 of_bus_n_addr_cells+0x9c/0xd8
[    0.138776] Missing '#address-cells' in /power-management@ff730000

I'm sure it's easy to fix up the DTB, but we shouldn't be breaking long existing DTBs.

Steve


