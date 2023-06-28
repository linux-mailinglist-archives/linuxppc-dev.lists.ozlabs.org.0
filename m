Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2F3740EE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 12:34:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=xen0n.name header.i=@xen0n.name header.a=rsa-sha256 header.s=mail header.b=sO40R4CE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrdHc0zlKz3bWp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 20:34:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=xen0n.name header.i=@xen0n.name header.a=rsa-sha256 header.s=mail header.b=sO40R4CE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xen0n.name (client-ip=115.28.160.31; helo=mailbox.box.xen0n.name; envelope-from=kernel@xen0n.name; receiver=lists.ozlabs.org)
X-Greylist: delayed 449 seconds by postgrey-1.37 at boromir; Wed, 28 Jun 2023 20:33:45 AEST
Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrdGd49LLz305R
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 20:33:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1687947969; bh=CywiEZ2ioeoVRwvb3VhckHlwPQWISEuRuyDIMUh/SlE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sO40R4CELoyZP15+xzNfqv8fc7MUdkASAJSkqWSLOF+ywVO11MV3l+vbMWMg1dqiL
	 S3XqzYIfgs3lH9JEuQ4NBON04QSxnL2skzqa8NCotSC1yJtWdJ9eUJkPUFbXxZTmd4
	 Zxi4HVbihTOgYh7ZLnJNy6YsG4+r5nIfmYW+cbyA=
Received: from [100.100.34.13] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 05B73600A6;
	Wed, 28 Jun 2023 18:26:08 +0800 (CST)
Message-ID: <dd7bd914-634a-115f-ab5c-80349493b1f6@xen0n.name>
Date: Wed, 28 Jun 2023 18:26:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 06/19] arch/loongarch: Implement <asm/fb.h> with
 generic helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de,
 daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com,
 gregkh@linuxfoundation.org
References: <20230417125651.25126-1-tzimmermann@suse.de>
 <20230417125651.25126-7-tzimmermann@suse.de>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230417125651.25126-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2023/4/17 20:56, Thomas Zimmermann wrote:
> Replace the architecture's fbdev helpers with the generic
> ones from <asm-generic/fb.h>. No functional changes.
> 
> v2:
> 	* use default implementation for fb_pgprotect() (Arnd)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> ---
>   arch/loongarch/include/asm/fb.h | 15 +--------------
>   1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/fb.h b/arch/loongarch/include/asm/fb.h
> index 3116bde8772d..ff82f20685c8 100644
> --- a/arch/loongarch/include/asm/fb.h
> +++ b/arch/loongarch/include/asm/fb.h
> @@ -5,19 +5,6 @@
>   #ifndef _ASM_FB_H_
>   #define _ASM_FB_H_
>   
> -#include <linux/fb.h>
> -#include <linux/fs.h>
> -#include <asm/page.h>
> -
> -static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
> -				unsigned long off)
> -{
> -	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> -}
> -
> -static inline int fb_is_primary_device(struct fb_info *info)
> -{
> -	return 0;
> -}
> +#include <asm-generic/fb.h>
>   
>   #endif /* _ASM_FB_H_ */

Sorry for the late review. The change is fairly trivial, so:

Reviewed-by: WANG Xuerui <git@xen0n.name>

Thanks!

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

