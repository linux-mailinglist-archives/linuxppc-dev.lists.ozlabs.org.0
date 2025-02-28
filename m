Return-Path: <linuxppc-dev+bounces-6570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 012B2A4981F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2025 12:12:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z45Bx4rW0z3bt2;
	Fri, 28 Feb 2025 22:12:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740741129;
	cv=none; b=Pqbfxk8uiDW9ZpgtxYFZppLozC6t4qnuRFJPvilCGF0YVsspo4BApvQjnBWHzInUU3ZduKZvlaKu3wvow46NFoMdczyfs/5UrSoZhc/e6Nfue6aQ323JIYJiLBA7yJm18ZDG656b+hGzXwi+1Q9rAZOzCzQGZSS8uGJUa0Uccpftk9cHwoHHGmoCsmPBu11Dg7a927JrdqyMoQU/dprpT22RdyOui6//n4/piGBGv03xCWJU8Ao2REgQXCesCJVvhdMz0GbV6xKvj/qKY2V2fmz8ojXoe5B+SQ3qHS6FK/LEXdfF9XUgRrFI2lXBkVypHNV3EOmFkbSthye/8Qovrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740741129; c=relaxed/relaxed;
	bh=8PINQtSj+h1+XGHWWvj1mqRyEKK3f/zBFDrSF6ciHsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsS6TDomzEUxEq5EU8jhMt0gGS3s0esbzeC/kDcMMB32GehwC3JWfkGNB6UPuh7QRVCUTukGMKrpYfTTM54nTymY9T287oJUULbXkqaXSYbIU7NZdcclQL5wIUZ99eeR7KXKpRVGm8IYgFRlQZNugfBQXydLPYuk7+9h6TWY2q0NMdJBsgig5eTk6Ako94J6BY86m1zV3PgUwsaikXcRVyZhSSGEIxgnr3Q30XU2tRyxJlOOR1Z0KhK7jPIbDQ8RYuBJTttZwXmxHAK4NcElnl1mifrG4d38PaSGGPBd64fdpZLoLJs79zJgK4hLHbFfZBAwFnI9KmA8+oStppBEig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z45Bx0MTPz3bsQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2025 22:12:08 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C0951692;
	Fri, 28 Feb 2025 03:11:53 -0800 (PST)
Received: from [192.168.178.115] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A727A3F673;
	Fri, 28 Feb 2025 03:11:33 -0800 (PST)
Message-ID: <c8719fca-21a4-438e-8b9d-cd0418f135aa@arm.com>
Date: Fri, 28 Feb 2025 12:11:31 +0100
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
Subject: Re: [PATCH v11 3/4] arm64: topology: Support SMT control on ACPI
 based system
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, sudeep.holla@arm.com, tglx@linutronix.de,
 peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, pierre.gondois@arm.com
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 xuwei5@huawei.com, guohanjun@huawei.com, sshegde@linux.ibm.com
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-4-yangyicong@huawei.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20250218141018.18082-4-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 18/02/2025 15:10, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>

[...]

> @@ -67,6 +108,31 @@ int __init parse_acpi_topology(void)
>  		cpu_topology[cpu].package_id = topology_id;
>  	}
>  
> +	/*
> +	 * This should be a short loop depending on the number of heterogeneous
                ^^^^^^

This _is_ a short loop since the number of xArray elements is the number
of heterogeneous CPU clusters.

> +	 * CPU clusters. Typically on a homogeneous system there's only one
                         ^^^^^^^^^

I would remove 'Typically' here.

[...]


