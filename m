Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B3B93111B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 11:23:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMxZB3yXVz3fNd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 19:22:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMxYp0NNSz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 19:22:36 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E38B7DA7;
	Mon, 15 Jul 2024 02:22:30 -0700 (PDT)
Received: from [10.162.40.16] (a077893.blr.arm.com [10.162.40.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89DCE3F73F;
	Mon, 15 Jul 2024 02:21:57 -0700 (PDT)
Message-ID: <388128db-1ddc-453f-9154-df2c5e255a2d@arm.com>
Date: Mon, 15 Jul 2024 14:51:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/29] arm64: re-order MTE VM_ flags
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-12-joey.gouly@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240503130147.1154804-12-joey.gouly@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 5/3/24 18:31, Joey Gouly wrote:
> To make it easier to share the generic PKEYs flags, move the MTE flag.

The change looks good but too less details about it here. Please do consider
adding some more description, on how moving the VM flags down the arch range
helps going forward.

> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
>  include/linux/mm.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 5605b938acce..2065727b3787 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -377,8 +377,8 @@ extern unsigned int kobjsize(const void *objp);
>  #endif
>  
>  #if defined(CONFIG_ARM64_MTE)
> -# define VM_MTE		VM_HIGH_ARCH_0	/* Use Tagged memory for access control */
> -# define VM_MTE_ALLOWED	VM_HIGH_ARCH_1	/* Tagged memory permitted */
> +# define VM_MTE		VM_HIGH_ARCH_4	/* Use Tagged memory for access control */
> +# define VM_MTE_ALLOWED	VM_HIGH_ARCH_5	/* Tagged memory permitted */
>  #else
>  # define VM_MTE		VM_NONE
>  # define VM_MTE_ALLOWED	VM_NONE
