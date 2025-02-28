Return-Path: <linuxppc-dev+bounces-6571-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07042A49822
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2025 12:12:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z45Ch4yh3z3bsY;
	Fri, 28 Feb 2025 22:12:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740741168;
	cv=none; b=GL7TzYVtX1XfnydDqR9ReDC8pwNwk5biHvGDXsGhA7xVWDgEXqfp4SjplqCkLKfGIdbHTd48b20LT75kAcfegC8MmsY+oi3QWuf/EV+UF+dsW1t2fLmaAVhuSbBW9AYMWPydIJSlKqGt+SEoSm3JQzmeiYbdDzOjAOrOo/DpKT+3HuJhoA315qaTghlRw0QuUuzDfhoaD8IXYqb19L2BpluGRCJTWf+tLRQoAlkyGry4ZpBMQagbTJg6L+jqTrU1kO+VA2yBAYmVLgJeRHs4zgDeeitcb2q7QXM/QCYx2YWRXh9q0PrwNkMh1VydiGTeRNGWXomWpaNZcpfso1K59A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740741168; c=relaxed/relaxed;
	bh=VsbgSY0KdK4WCEQoWD7P7DX8QHItEdhrghN3ri4wOyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=abHgk+RFyZWK2ZRU9kJ5bYrnyCsfN8BQVtaWiYxci/nklgVNlASyTxbupa71OTDR8Iy79WFTm9T6JfPCAPAHp136TCodK6xctKkhK4S9gtG/7QprcoSNjIUZ/9Fqh4mG4EOueD+VreoYzkeEHefRLsbCIF9+FXts3HGEbglNsBHpbTRDF1JPqj41y7moo33TzYYI8xCTlYMp7gd6rMTacv99mHjqeXPifUe7eZ0oglZ609cDl3hPhbLTDbUz8GqK1vxFm3OHl5droASZDIlfkSi//PuJGHQcsmYIB5Sfbw4WGzMuyFsKyiIYPzNjdnD+sYVQZuyPkVlpcVBiejOX2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z45Ch07MDz2xGC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2025 22:12:47 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4566D1063;
	Fri, 28 Feb 2025 03:12:32 -0800 (PST)
Received: from [192.168.178.115] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92FD63F673;
	Fri, 28 Feb 2025 03:12:12 -0800 (PST)
Message-ID: <df9784c3-c2ea-4bac-839a-2b7de0a81aac@arm.com>
Date: Fri, 28 Feb 2025 12:12:02 +0100
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
Subject: Re: [PATCH v11 0/4] Support SMT control on arm64
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
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20250218141018.18082-1-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 18/02/2025 15:10, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> The core CPU control framework supports runtime SMT control which
> is not yet supported on arm64. Besides the general vulnerabilities
> concerns we want this runtime control on our arm64 server for:
> 
> - better single CPU performance in some cases
> - saving overall power consumption
> 
> This patchset implements it in the following aspects:
> 
> - Provides a default topology_is_primary_thread()
> - support retrieve SMT thread number on OF based system
> - support retrieve SMT thread number on ACPI based system
> - select HOTPLUG_SMT for arm64
> 
> Tests has been done on our ACPI based arm64 server and on ACPI/OF
> based QEMU VMs.

[...]

> Yicong Yang (4):
>   cpu/SMT: Provide a default topology_is_primary_thread()
>   arch_topology: Support SMT control for OF based system
>   arm64: topology: Support SMT control on ACPI based system
>   arm64: Kconfig: Enable HOTPLUG_SMT
> 
>  arch/arm64/Kconfig                  |  1 +
>  arch/arm64/kernel/topology.c        | 66 +++++++++++++++++++++++++++++
>  arch/powerpc/include/asm/topology.h |  1 +
>  arch/x86/include/asm/topology.h     |  2 +-
>  drivers/base/arch_topology.c        | 27 ++++++++++++
>  include/linux/topology.h            | 22 ++++++++++
>  6 files changed, 118 insertions(+), 1 deletion(-)

With the review comments on the individual patches [0-3]/4:

Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>


