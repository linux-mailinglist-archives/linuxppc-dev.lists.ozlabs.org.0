Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CD0404648
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 09:35:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4rQd757hz2yb5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 17:35:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4rQ90znzz2xYL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Sep 2021 17:35:28 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H4rQ51qzmz9sWf;
 Thu,  9 Sep 2021 09:35:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id URKDW8TFRsBc; Thu,  9 Sep 2021 09:35:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H4rQ50Vdgz9sWd;
 Thu,  9 Sep 2021 09:35:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E92F38B77E;
 Thu,  9 Sep 2021 09:35:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ouyCwfPnJfe2; Thu,  9 Sep 2021 09:35:24 +0200 (CEST)
Received: from po9476vm.idsi0.si.c-s.fr (po22017.idsi0.si.c-s.fr
 [192.168.7.20])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C29B88B77D;
 Thu,  9 Sep 2021 09:35:23 +0200 (CEST)
Subject: Re: [PATCH v3 2/8] mm: Introduce a function to check for confidential
 computing features
To: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
References: <cover.1631141919.git.thomas.lendacky@amd.com>
 <0a7618d54e7e954ee56c22ad1b94af2ffe69543a.1631141919.git.thomas.lendacky@amd.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <96aa160a-e35e-452e-b785-24410265b0f6@csgroup.eu>
Date: Thu, 9 Sep 2021 07:35:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <0a7618d54e7e954ee56c22ad1b94af2ffe69543a.1631141919.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Andi Kleen <ak@linux.intel.com>, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Joerg Roedel <joro@8bytes.org>, Christoph Hellwig <hch@infradead.org>,
 Borislav Petkov <bp@alien8.de>, Brijesh Singh <brijesh.singh@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/8/21 10:58 PM, Tom Lendacky wrote:
> In prep for other confidential computing technologies, introduce a generic
> helper function, cc_platform_has(), that can be used to check for specific

I have little problem with that naming.

For me CC has always meant Compiler Collection.

> active confidential computing attributes, like memory encryption. This is
> intended to eliminate having to add multiple technology-specific checks to
> the code (e.g. if (sev_active() || tdx_active())).
> 
> Co-developed-by: Andi Kleen <ak@linux.intel.com>
> Signed-off-by: Andi Kleen <ak@linux.intel.com>
> Co-developed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>   arch/Kconfig                |  3 ++
>   include/linux/cc_platform.h | 88 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 91 insertions(+)
>   create mode 100644 include/linux/cc_platform.h
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 3743174da870..ca7c359e5da8 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1234,6 +1234,9 @@ config RELR
>   config ARCH_HAS_MEM_ENCRYPT
>   	bool
>   
> +config ARCH_HAS_CC_PLATFORM
> +	bool
> +
>   config HAVE_SPARSE_SYSCALL_NR
>          bool
>          help
> diff --git a/include/linux/cc_platform.h b/include/linux/cc_platform.h
> new file mode 100644
> index 000000000000..253f3ea66cd8
> --- /dev/null
> +++ b/include/linux/cc_platform.h
> @@ -0,0 +1,88 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Confidential Computing Platform Capability checks
> + *
> + * Copyright (C) 2021 Advanced Micro Devices, Inc.
> + *
> + * Author: Tom Lendacky <thomas.lendacky@amd.com>
> + */
> +
> +#ifndef _CC_PLATFORM_H
> +#define _CC_PLATFORM_H
> +
> +#include <linux/types.h>
> +#include <linux/stddef.h>
> +
> +/**
> + * enum cc_attr - Confidential computing attributes
> + *
> + * These attributes represent confidential computing features that are
> + * currently active.
> + */
> +enum cc_attr {
> +	/**
> +	 * @CC_ATTR_MEM_ENCRYPT: Memory encryption is active
> +	 *
> +	 * The platform/OS is running with active memory encryption. This
> +	 * includes running either as a bare-metal system or a hypervisor
> +	 * and actively using memory encryption or as a guest/virtual machine
> +	 * and actively using memory encryption.
> +	 *
> +	 * Examples include SME, SEV and SEV-ES.
> +	 */
> +	CC_ATTR_MEM_ENCRYPT,
> +
> +	/**
> +	 * @CC_ATTR_HOST_MEM_ENCRYPT: Host memory encryption is active
> +	 *
> +	 * The platform/OS is running as a bare-metal system or a hypervisor
> +	 * and actively using memory encryption.
> +	 *
> +	 * Examples include SME.
> +	 */
> +	CC_ATTR_HOST_MEM_ENCRYPT,
> +
> +	/**
> +	 * @CC_ATTR_GUEST_MEM_ENCRYPT: Guest memory encryption is active
> +	 *
> +	 * The platform/OS is running as a guest/virtual machine and actively
> +	 * using memory encryption.
> +	 *
> +	 * Examples include SEV and SEV-ES.
> +	 */
> +	CC_ATTR_GUEST_MEM_ENCRYPT,
> +
> +	/**
> +	 * @CC_ATTR_GUEST_STATE_ENCRYPT: Guest state encryption is active
> +	 *
> +	 * The platform/OS is running as a guest/virtual machine and actively
> +	 * using memory encryption and register state encryption.
> +	 *
> +	 * Examples include SEV-ES.
> +	 */
> +	CC_ATTR_GUEST_STATE_ENCRYPT,
> +};
> +
> +#ifdef CONFIG_ARCH_HAS_CC_PLATFORM
> +
> +/**
> + * cc_platform_has() - Checks if the specified cc_attr attribute is active
> + * @attr: Confidential computing attribute to check
> + *
> + * The cc_platform_has() function will return an indicator as to whether the
> + * specified Confidential Computing attribute is currently active.
> + *
> + * Context: Any context
> + * Return:
> + * * TRUE  - Specified Confidential Computing attribute is active
> + * * FALSE - Specified Confidential Computing attribute is not active
> + */
> +bool cc_platform_has(enum cc_attr attr);

This declaration make it impossible for architectures to define this 
function inline.

For such function, having it inline would make more sense as it would 
allow GCC to perform constant folding and avoid the overhead  of calling 
a sub-function.

> +
> +#else	/* !CONFIG_ARCH_HAS_CC_PLATFORM */
> +
> +static inline bool cc_platform_has(enum cc_attr attr) { return false; }
> +
> +#endif	/* CONFIG_ARCH_HAS_CC_PLATFORM */
> +
> +#endif	/* _CC_PLATFORM_H */
> 
