Return-Path: <linuxppc-dev+bounces-5142-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7F6A0B453
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 11:18:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWp9h1nJVz2ysv;
	Mon, 13 Jan 2025 21:18:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736763480;
	cv=none; b=MsAXIeB4FR7FzbiE4Iz37wEPSFe8xwSiNXu4GFqNVeHjUiH3q4lJqzk1ACGgeFtg0etUfnKm/6benEK3NnFp18ZbNI+/F+8lkGJEGWATjSmt2L5jTfkzr6zWP+TGY+SsKpCWDcEBfStLSejBjHLTfrLRLzGDfrmTO7TT0F4KwSjuudUn3Qb5bwp/Sz+cKuGkC/m7+JlRZDGYYJ5ucjJsyrZnDczaRw8p4obiDrB00Ps+uZ+nBxkYZg1dq6fSUSA80FtwdYHMb8YipDLUb2qOKSnnPVoV843bIK9Nj/wBT9kPxHK1cfAXqZG6ta3Ccpdt+S2nJBZj/jP1aZqSX0f8qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736763480; c=relaxed/relaxed;
	bh=DbJrjvQ8St4IYkmbZHqFnXi3esZtoeC/sv8Qj0rDjec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aUntXODVW572dhIiGTNODYHZAw2pIFOOFWrzZMcDfQGw2YOVeKhfx9FkXUdUqreLVK6L8YDa/PsWxvZrthaZA7kDAtCLRzCvkJcPE2NOlpSbWwTU2mdYkYo2j+Gfg3+uu+CkHdvcFw/N9Oo+ZUWLuf1fK7hgoFXJv0FS/2KHaxjWBdYLhX3sfV8UVNpVA3nVmhIcEOJbPc5dNgrPsAWg7uKYGKxq8O3eA2ygisFejEMeVqEr9WnjPeluttfVCdM5Hd6WM3185BrxCPn9Vy5tw6Satk/rRbBt5ypliziOmhd6XXQwY32afgEf7vYua8TEbCamEopCaaxVNPVZa4aVNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=vladimir.murzin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=vladimir.murzin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWp9f52qdz2ynn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 21:17:57 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D9A51424;
	Mon, 13 Jan 2025 02:17:52 -0800 (PST)
Received: from [10.1.28.144] (e121487-lin.cambridge.arm.com [10.1.28.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23D0E3F66E;
	Mon, 13 Jan 2025 02:17:20 -0800 (PST)
Message-ID: <44d60dff-ab73-4d10-9110-c5c2ddebadf6@arm.com>
Date: Mon, 13 Jan 2025 10:17:18 +0000
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
Subject: Re: [kvm-unit-tests PATCH v1 0/5] arm64: Change the default
 --processor to max
To: Alexandru Elisei <alexandru.elisei@arm.com>, andrew.jones@linux.dev,
 eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
 david@redhat.com, pbonzini@redhat.com
Cc: kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20250110135848.35465-1-alexandru.elisei@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 1/10/25 13:58, Alexandru Elisei wrote:
> (CC'ing everyone from MAINTAINERS because I'm touching configure)
> 
> Vladimir sent a test for MTE [1], which didn't work on the default -cpu
> model, cortex-a57, because that CPU didn't implement MTE. There were two
> options to get it working:
> 
> 1. Add -cpu max to the extra_params unittest parameter.
> 2. Make the default value for the configure --processor option 'max'.
> 
> We decided that the second option was preferable, so here it is.
> 
> The first patch might look unrelated, but when I was writing the function
> to select the default processor based on the architecture I noticed that
> for arm64, $arch is first equal to aarch64, then it gets changed to arm64.
> My first instinct was to have it be arm64 from the start, but then I
> realized that, despite the help text, --arch=aarch64 has been supported
> ever since arm64 was added to kvm-unit-tests. So I decided that it might
> more prudent to go with it and document it.
> 
> [1] https://lore.kernel.org/all/20241212103447.34593-1-vladimir.murzin@arm.com/
> 

Thanks Alex! That removes extra hassle of setting up -cpu to match required
feature. My MTE test continue working fine and require one less configuration
option - undeniable improvement in user experience!

FWIW:
Tested-by: Vladimir Murzin <vladimir.murzin@arm.com> # arm64

Vladimir

> Alexandru Elisei (5):
>   configure: Document that the architecture name 'aarch64' is also
>     supported
>   configure: Display the default processor for arm and arm64
>   arm64: Implement the ./configure --processor option
>   arm/arm64: Add support for --processor=max
>   configure: arm64: Make 'max' the default for --processor
> 
>  arm/Makefile.arm    |  1 -
>  arm/Makefile.common |  3 +++
>  configure           | 35 ++++++++++++++++++++++++++---------
>  3 files changed, 29 insertions(+), 10 deletions(-)
> 
> 
> base-commit: 0ed2cdf3c80ee803b9150898e687e77e4d6f5db2
> -- 2.47.1
> 


