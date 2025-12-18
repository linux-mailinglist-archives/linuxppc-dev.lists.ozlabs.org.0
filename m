Return-Path: <linuxppc-dev+bounces-14863-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E5ACCBB5D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 13:03:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dX8SX1r1nz2xrM;
	Thu, 18 Dec 2025 23:03:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766059388;
	cv=none; b=APJ2excZQpxzGxPNP3AWHSmVHJ/JdAMlMI6QRN8nFW9XyK0B1O7Y/cUI0lAFb3T9mftkVb+2CKcnwnBZ6b6d8FIxRklHhPmfg8IoDtzGgM6zPN+/7N76GAEF2Ee25uq+m52nh2rUWoyF0QIztfic1rWTpIm4oY8Qs0KzPynk7+f0m6eNYg5fxotv/2TPlbG8DQ6UccX1XmEng1+cV+1Iw+3t63btbzgOltbLwQDl7/ESbAc1ez+cwQGhBgTTTZ3QPHW1ngbbBLwbRaFjmEHCtuOxrLsKCO/VDVZ+biS8zs8LoLO16GB2MwfLc+Sw1ZRAuN18c2WHdXyVTjRfeCElnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766059388; c=relaxed/relaxed;
	bh=rNz6uG4a6bdn8IWV8d2tAVBbvKM+B1bG7nY3P4aag5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V/HFt0w1Sne/LvD6Vzm9yY1dIyPJso6oUN7ciQxpII5mzLW8ISjawSmKJ0h+lYnoGWUk6Wd3FM5lyP1oUcBf77RvWIoGoET/A96QJPXsbJ43U2ywxl45fRYLcamGVDxSqYjWVElAoMXZWH4UBTlQt7pdfmlxH67V6WGxrvBcZMM8oeAnO8aFZhUEi7l0gMDM4vQ/j36pwyJEhs21/c31fsy0Xhu0uvmSYauW/WtLkt7lD9+dA500kGbSFmbS6o2HsOk1RL9xO7NB2c5Nxi+uGaoA8+LYdtQBktUAYkVd7gCHXrGUmXDadSGYFIEAOLebJBXjOlcu+djRhLOXjVnWhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iEW+IUHe; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iEW+IUHe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dX8SW0GpZz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 23:03:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40A1F60129;
	Thu, 18 Dec 2025 12:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577E6C4CEFB;
	Thu, 18 Dec 2025 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766059354;
	bh=RX3bRnBmhpBc13or7Zw0e7NytvYT8ZV6+njf/aHokrY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iEW+IUHegTvXC6YsIp5YDGxKhjcCFE6QWykQXEbSEO4Z1PXHYavcyeMkTg4uqJ8nZ
	 ejHYcPvuA5ASP9jFe9iZ3TwAMvle38YKKJSHnGoYwzsVRpI4urQgNRWsJNfUsyZ/5K
	 beNc8V8+rA5WLvJbhxuEcbYE5f2KPDgToQ0wuBD88hVSIPBMdic16GZbxzIFYPkDNP
	 /pDxwW1FThBGzY4cdk8jy0GOP2jGci186EFo/jq1S/Fju+VAbPS+wVNo2blJV7MlS5
	 57qKqEycr2COf62xvyJYM2MFvoPySKgD8nLAKsSwNvtMXP2Wggq2Q+Pw8keIaJvnGy
	 LxYtRqncYAJiA==
Message-ID: <83920c44-47f5-4a46-bfa7-76713197d7e4@kernel.org>
Date: Thu, 18 Dec 2025 13:02:25 +0100
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
Subject: Re: [PATCH v5] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov
 <bp@alien8.de>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, x86@kernel.org, linux-arm64@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20251218114154.228484-1-sourabhjain@linux.ibm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251218114154.228484-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/18/25 12:41, Sourabh Jain wrote:
> Skip processing hugepage kernel arguments (hugepagesz, hugepages, and
> default_hugepagesz) when hugepages are not supported by the
> architecture.
> 
> Some architectures may need to disable hugepages based on conditions
> discovered during kernel boot. The hugepages_supported() helper allows
> architecture code to advertise whether hugepages are supported.
> 
> Currently, normal hugepage allocation is guarded by
> hugepages_supported(), but gigantic hugepages are allocated regardless
> of this check. This causes problems on powerpc for fadump (firmware-
> assisted dump).
> 
> In the fadump (firmware-assisted dump) scenario, a production kernel
> crash causes the system to boot into a special kernel whose sole
> purpose is to collect the memory dump and reboot. Features such as
> hugepages are not required in this environment and should be
> disabled.
> 
> For example, fadump kernel booting with the kernel arguments
> default_hugepagesz=1GB hugepagesz=1GB hugepages=200 prints the
> following logs:
> 
> HugeTLB: allocating 200 of page size 1.00 GiB failed.  Only allocated 58 hugepages.
> HugeTLB support is disabled!
> HugeTLB: huge pages not supported, ignoring associated command-line parameters
> hugetlbfs: disabling because there are no supported hugepage sizes
> 
> Even though the logs say that hugetlb support is disabled, gigantic
> hugepages are still getting allocated, which causes the fadump kernel
> to run out of memory during boot.

Yeah, that's suboptimal.

> 
> To fix this, the gigantic hugepage allocation should come under
> hugepages_supported().
> 
> To bring gigantic hugepage allocation under hugepages_supported(), two
> approaches were previously proposed:
> [1] Check hugepages_supported() in the generic code before allocating
> gigantic hugepages.
> [2] Make arch_hugetlb_valid_size() return false for all hugetlb sizes.
> 
> Approach [2] has two minor issues:
> 1. It prints misleading logs about invalid hugepage sizes
> 2. The kernel still processes hugepage kernel arguments unnecessarily
> 
> To control gigantic hugepage allocation, it is proposed to skip
> processing the hugepage kernel arguments (hugepagesz, hugepages, and
> default_hugepagesz) when hugepages_support() returns false.

You could briefly mention the new output here, so one has a before-after 
comparison.

Curious, should we at least add a Fixes: tag? Allocating memory when 
it's completely unusable sounds wrong.

[...]

> +	if (!hugepages_supported()) {
> +		pr_warn("HugeTLB: hugepages unsupported, ignoring default_hugepagesz=%s cmdline\n",
> +			s);
> +		return 0;
> +	}
> +
>   	parsed_valid_hugepagesz = false;
>   	if (parsed_default_hugepagesz) {
>   		pr_err("HugeTLB: default_hugepagesz previously specified, ignoring %s\n", s);


LGTM!

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David

