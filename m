Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4C493248E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 13:03:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNblm2c7Rz3dWC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 21:03:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNblP67W7z30Np
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 21:03:12 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A4621063;
	Tue, 16 Jul 2024 04:03:06 -0700 (PDT)
Received: from [10.163.52.225] (unknown [10.163.52.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DDED3F73F;
	Tue, 16 Jul 2024 04:02:32 -0700 (PDT)
Message-ID: <87eba7de-b267-49ad-92fe-dcf3638b75d9@arm.com>
Date: Tue, 16 Jul 2024 16:32:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/29] arm64: add Permission Overlay Extension Kconfig
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-23-joey.gouly@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240503130147.1154804-23-joey.gouly@arm.com>
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
> Now that support for POE and Protection Keys has been implemented, add a
> config to allow users to actually enable it.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/Kconfig | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 7b11c98b3e84..676ebe4bf9eb 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2095,6 +2095,28 @@ config ARM64_EPAN
>  	  if the cpu does not implement the feature.
>  endmenu # "ARMv8.7 architectural features"
>  
> +menu "ARMv8.9 architectural features"

Agree with Kevin regarding need for an empty line here.

> +config ARM64_POE
> +	prompt "Permission Overlay Extension"
> +	def_bool y
> +	select ARCH_USES_HIGH_VMA_FLAGS
> +	select ARCH_HAS_PKEYS
> +	help
> +	  The Permission Overlay Extension is used to implement Memory
> +	  Protection Keys. Memory Protection Keys provides a mechanism for
> +	  enforcing page-based protections, but without requiring modification
> +	  of the page tables when an application changes protection domains.
> +
> +	  For details, see Documentation/core-api/protection-keys.rst
> +
> +	  If unsure, say y.
> +
> +config ARCH_PKEY_BITS
> +	int
> +	default 3
> +
> +endmenu # "ARMv8.9 architectural features"
> +
>  config ARM64_SVE
>  	bool "ARM Scalable Vector Extension support"
>  	default y
