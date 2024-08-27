Return-Path: <linuxppc-dev+bounces-622-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F1E961A10
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 00:38:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtjBk3Rkcz2xsW;
	Wed, 28 Aug 2024 08:38:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724773286;
	cv=none; b=lS0HrObJLOT5592vQ3gbC9CtJpAgEp8SdIE/DnFywgBFNhJtO61eymvaay6gtUxd+VmjqrMvPR11xpJQzIiolTRpe3NTmd+5J00T57lt8qNUynDPdO4Pyt4oiZThFdXAWSruh56g26rd9ZeveCBHeZynsXh/wOaI0mmZQZfRNIhpfqwvFJa3XUn1lvL3+ySCmt4Zr/J/KkID5Lao0Z1AFlOhfScDDxx7U6VMk/6x6NuKXzdIG6i+kj8P1+rwUpqPMiYYNCMyth0v05XuXvy4iNRcbtPJ3t9o1GiIzHl5I0e72/m/cKD5uwrLb2dTz+A8YV5iFqJernG8vlwlE3S2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724773286; c=relaxed/relaxed;
	bh=PG7WEg8ZQqhw51AEXyIgJYkeatNPH1H2jF3F2+7ftKc=;
	h=Received:Received:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=N1IcudntsbfC3OzTWagkwSZbcnPbzmc4aMbZG6hj24+DnSOspdiiJ4bXpYXKElKCY+tFgLSvTXNW43Pf5I0gFH0viVIWcOd25C04sLzXv7FABa2XnoUBAxSlCRxcyP4s9jQrRp5k2Qg/SlyF4qOwnrTiUIhx0tBRef902w3CykTJim6JKe90H1O2Tf7scTmFePKBs12hpqtP3SWHyPBdn0ZeNyh7OxQyuQTT+sFYsv7C7I3U/hADTk0WSMNHtFaVbdXA3YrVXPWtMHRScqncNJODfEcAM3ELlQXruqGWI8MirpBnt/y9N0n8NAWyU5MjZpKMMoLsHdusU0mC5T9k2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtWx20k6vz2xX4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 01:41:24 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 893EFDA7;
	Tue, 27 Aug 2024 08:41:17 -0700 (PDT)
Received: from [10.34.129.45] (e126645.nice.arm.com [10.34.129.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A21653F762;
	Tue, 27 Aug 2024 08:40:46 -0700 (PDT)
Message-ID: <4024c9be-aae9-4248-ab73-813c3c5d790b@arm.com>
Date: Tue, 27 Aug 2024 17:40:44 +0200
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
From: Pierre Gondois <pierre.gondois@arm.com>
Subject: Re: [PATCH v5 4/4] arm64: Kconfig: Enable HOTPLUG_SMT
To: Yicong Yang <yangyicong@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org,
 mpe@ellerman.id.au, peterz@infradead.org, tglx@linutronix.de,
 sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 xuwei5@huawei.com, guohanjun@huawei.com
References: <20240806085320.63514-1-yangyicong@huawei.com>
 <20240806085320.63514-5-yangyicong@huawei.com>
Content-Language: en-US
In-Reply-To: <20240806085320.63514-5-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Yicong,

Is it necessary to have an explicit dependency over SMP for arm64 ? Cf.
   commit 4b3dc9679cf7 ("arm64: force CONFIG_SMP=y and remove redundant #ifdefs")

Regards,
Pierre

On 8/6/24 10:53, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Enable HOTPLUG_SMT for SMT control.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   arch/arm64/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index a2f8ff354ca6..bd3bc2f5e0ec 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -238,6 +238,7 @@ config ARM64
>   	select HAVE_KRETPROBES
>   	select HAVE_GENERIC_VDSO
>   	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
> +	select HOTPLUG_SMT if (SMP && HOTPLUG_CPU)
>   	select IRQ_DOMAIN
>   	select IRQ_FORCED_THREADING
>   	select KASAN_VMALLOC if KASAN

