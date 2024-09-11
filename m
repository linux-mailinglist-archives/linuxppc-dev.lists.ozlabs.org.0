Return-Path: <linuxppc-dev+bounces-1270-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5193975DBA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 01:35:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3xlN12jCz2xxw;
	Thu, 12 Sep 2024 09:35:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726066956;
	cv=none; b=cMg8EldkJRpFeU6i10FRSx27KJopMHvFYi8dkki039d9F0ATzaaZfCUuvdOv/HHPCnqyUeHtZ/XSKrSm6J0UsU8idqoWQBPCol605bq872fWLILoAE6yUeNEXj/RShNGzFWkxy/DpzmZu5NmAPAPsuk6IoKHRx29iHvTDUz0zAPqd9UTFI0i8L6vxHTcr9O1914Yu4TJYk0Ycpb2ipas4lm+7Zu7Wms0Y1Ne7DQlJ/JCmcoKNz6RTQB35o/ANdxTfUmLMLpPR6kV84CsqGEvFSLnz4lFLzjz/AGjLRDZ7UaF9QwocrY7x/9y8HciqtXBeVE8dx5TTTn19KnJf7Ci8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726066956; c=relaxed/relaxed;
	bh=EYbGKm1870+1flzJfJIV1AUuqRBsBPnqdKUWToQbszU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hb68FHflmdb7UF9xzsvpA0AGsKYzx1ZteNigFE73rk8zJs0aW9cc7c6v37VIE2FHZnntsDwfnbLU3D88NTeppvJ0ZKnHGF66KJ6aF/2Ak98MEW4HBETBSyg1blqiZLF9PMwA+7/XwX348QPt16XGdUfiwvRROj6+JbF2m3p/bMrRPCeS7F0xWHEwVcg2U3PMKcFFhTMTWwCbkO90MulXfgwCMCerkB1aSmZqzFA9ldFZI00d4FDIAjv8VkxiTQ53AJz8l5Zi0sxo7o8C0DpJfQTSatvqE1E6YtIUc7TVECNl2WpJmNvHFjXl051mxVkQAKbxXBjFpezlMhuYIc7C2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3kMJ0t1Vz2xGp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 01:02:33 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBAFD1007;
	Wed, 11 Sep 2024 08:02:30 -0700 (PDT)
Received: from [10.57.74.200] (unknown [10.57.74.200])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE3AF3F73B;
	Wed, 11 Sep 2024 08:01:55 -0700 (PDT)
Message-ID: <425b8f8c-b6b5-422a-b5f4-41dd2d1ae3bb@arm.com>
Date: Wed, 11 Sep 2024 17:01:53 +0200
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
Subject: Re: [PATCH v5 06/30] arm64: context switch POR_EL0 register
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com, akpm@linux-foundation.org, aneesh.kumar@kernel.org,
 aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
 broonie@kernel.org, catalin.marinas@arm.com, christophe.leroy@csgroup.eu,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, maz@kernel.org,
 mingo@redhat.com, mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com,
 npiggin@gmail.com, oliver.upton@linux.dev, shuah@kernel.org,
 skhan@linuxfoundation.org, szabolcs.nagy@arm.com, tglx@linutronix.de,
 will@kernel.org, x86@kernel.org, kvmarm@lists.linux.dev,
 linux-kselftest@vger.kernel.org
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-7-joey.gouly@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20240822151113.1479789-7-joey.gouly@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/08/2024 17:10, Joey Gouly wrote:
> @@ -371,6 +382,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>  		if (system_supports_tpidr2())
>  			p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
>  
> +		if (system_supports_poe())
> +			p->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);

Here we are only reloading POR_EL0's value if the target is a user
thread. However, as this series stands, POR_EL0 is also relevant to
kthreads, because any uaccess or GUP done from a kthread will also be
checked against POR_EL0. This is especially important in cases like the
io_uring kthread, which accesses the memory of the user process that
spawned it. To prevent such a kthread from inheriting a stale value of
POR_EL0, it seems that we should reload POR_EL0's value in all cases
(user and kernel thread).

Other approaches could also be considered (e.g. resetting POR_EL0 to
unrestricted when creating a kthread), see my reply on v4 [1].

Kevin

[1]
https://lore.kernel.org/linux-arm-kernel/b4f8b351-4c83-43b4-bfbe-8f67f3f56fb9@arm.com/

