Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D8F747B4B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 03:48:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwjHD31zhz3c4J
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 11:48:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=suijingfeng@loongson.cn; receiver=lists.ozlabs.org)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qwj5t5L60z2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 11:40:16 +1000 (AEST)
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8DxxPD9yaRkgy4AAA--.989S3;
	Wed, 05 Jul 2023 09:40:13 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxriP6yaRkBM0bAA--.44417S3;
	Wed, 05 Jul 2023 09:40:10 +0800 (CST)
Message-ID: <26e355dd-049c-fa82-dc5d-565b86339253@loongson.cn>
Date: Wed, 5 Jul 2023 09:40:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [01/12] efi: Do not include <linux/screen_info.h> from EFI header
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
References: <20230629121952.10559-2-tzimmermann@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230629121952.10559-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxriP6yaRkBM0bAA--.44417S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGF1DKFy5Wr47KF13Gw1ktFc_yoWrGF1rpa
	1DCF4xAw4DGF4rGas5uw17uF1DXws8Gr9FgF9F9r10y347tr1vqrs5urnIkr1DXFWUKw10
	gFy5tw1Yka4DXwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUk529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
	xGrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_
	Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUxO
	zsDUUUU
X-Mailman-Approved-At: Wed, 05 Jul 2023 11:46:39 +1000
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
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arch@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Thomas


I love your patch, LoongArch also have UEFI GOP support,

Maybe the arch/loongarch/kernel/efi.c don't include the '#include 
<linux/screen_info.h>' explicitly.


```

diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
index 3d448fef3af4..04f4d217aefb 100644
--- a/arch/loongarch/kernel/efi.c
+++ b/arch/loongarch/kernel/efi.c
@@ -19,6 +19,7 @@
  #include <linux/memblock.h>
  #include <linux/reboot.h>
  #include <linux/uaccess.h>
+#include <linux/screen_info.h>

  #include <asm/early_ioremap.h>
  #include <asm/efi.h>
```


On 2023/6/29 19:45, Thomas Zimmermann wrote:
> The header file <linux/efi.h> does not need anything from
> <linux/screen_info.h>. Declare struct screen_info and remove
> the include statements. Update a number of source files that
> require struct screen_info's definition.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

With the above issue solved, please take my R-B if you would like.


Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

> ---
>   arch/arm/kernel/efi.c                         | 2 ++
>   arch/arm64/kernel/efi.c                       | 1 +
>   drivers/firmware/efi/libstub/efi-stub-entry.c | 2 ++
>   drivers/firmware/efi/libstub/screen_info.c    | 2 ++
>   include/linux/efi.h                           | 3 ++-
>   5 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/kernel/efi.c b/arch/arm/kernel/efi.c
> index e2b9d2618c672..e94655ef16bb3 100644
> --- a/arch/arm/kernel/efi.c
> +++ b/arch/arm/kernel/efi.c
> @@ -5,6 +5,8 @@
>   
>   #include <linux/efi.h>
>   #include <linux/memblock.h>
> +#include <linux/screen_info.h>
> +
>   #include <asm/efi.h>
>   #include <asm/mach/map.h>
>   #include <asm/mmu_context.h>
> diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> index baab8dd3ead3c..3afbe503b066f 100644
> --- a/arch/arm64/kernel/efi.c
> +++ b/arch/arm64/kernel/efi.c
> @@ -9,6 +9,7 @@
>   
>   #include <linux/efi.h>
>   #include <linux/init.h>
> +#include <linux/screen_info.h>
>   
>   #include <asm/efi.h>
>   #include <asm/stacktrace.h>
> diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
> index cc4dcaea67fa6..2f1902e5d4075 100644
> --- a/drivers/firmware/efi/libstub/efi-stub-entry.c
> +++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
> @@ -1,6 +1,8 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   
>   #include <linux/efi.h>
> +#include <linux/screen_info.h>
> +
>   #include <asm/efi.h>
>   
>   #include "efistub.h"
> diff --git a/drivers/firmware/efi/libstub/screen_info.c b/drivers/firmware/efi/libstub/screen_info.c
> index 4be1c4d1f922b..a51ec201ca3cb 100644
> --- a/drivers/firmware/efi/libstub/screen_info.c
> +++ b/drivers/firmware/efi/libstub/screen_info.c
> @@ -1,6 +1,8 @@
>   // SPDX-License-Identifier: GPL-2.0
>   
>   #include <linux/efi.h>
> +#include <linux/screen_info.h>
> +
>   #include <asm/efi.h>
>   
>   #include "efistub.h"
> diff --git a/include/linux/efi.h b/include/linux/efi.h
> index 571d1a6e1b744..360895a5572c0 100644
> --- a/include/linux/efi.h
> +++ b/include/linux/efi.h
> @@ -24,10 +24,11 @@
>   #include <linux/range.h>
>   #include <linux/reboot.h>
>   #include <linux/uuid.h>
> -#include <linux/screen_info.h>
>   
>   #include <asm/page.h>
>   
> +struct screen_info;
> +
>   #define EFI_SUCCESS		0
>   #define EFI_LOAD_ERROR		( 1 | (1UL << (BITS_PER_LONG-1)))
>   #define EFI_INVALID_PARAMETER	( 2 | (1UL << (BITS_PER_LONG-1)))

