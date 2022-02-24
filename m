Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E04C343D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 18:58:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4LH36WPPz3bVx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 04:58:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=QZHtEKtU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20210112.gappssmtp.com
 header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=QZHtEKtU; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4LGL0jwbz3002
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 04:57:29 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id x11so2438409pll.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 09:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=4cyzICQ/23bHkeHtwzkbDtebSfIDfHBmF44TmpxS3Qs=;
 b=QZHtEKtUvZANVn2ElYT0MVq8L/sw0zRAND1G1+7+T2vN4rMWTQslOFNc01eWURY+2B
 sy0EKF687Is70s9G179bTT4gb7OQj+aQvL7fNGMlm6ZA8EcAnbYhS2KBw8jCxSfkagq+
 NucZ/R5TLUf/99L9ngjjYTgdH5a/n6N1tEKoBktikDcP1aWmcVutEpP4UHTORBHS9qay
 VyS3Euibr59HFzGcQDm5Yb7u3hl49gPPn7xuZGLRjDMT13qhnDD4l6inYvCW8iV01vNz
 aHx07dUlEYNNW1X1TiCzN3QQXMEUIWH8zIPIAR3ST5+sQ2z8sYlghZ5x1NpIC2rYLmfR
 XjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=4cyzICQ/23bHkeHtwzkbDtebSfIDfHBmF44TmpxS3Qs=;
 b=d3SpSukAei70LqRldTNBFCA1HSPSVb+v44yItXb2TJdzMFiHeFE85sSgYEH5zKpR2b
 5Ikcyxgcv0MJ9WnwjxPcd8qLu2lYsaOYfLAKPJ1MGcTTH6EzSzReImUDNgp3foi+tDns
 Q2KDS1dUva3tDPih/wYTYW2cSpI2EsxCcArEKIr80MTlHUi6MFnFkLJw/ExdaKs2xDA1
 G5JqRiKRy1ThVZwyaefGbKf/kXoEg0CsSUalqvIj03j8YDaMXfRGtksh2enI9G2qSq9c
 1LGgfR+wjGOqb/FqgsOg/gQU99rlMIJ+2gdut3vkXO1WcH2swZLSv9AmUlGECLAJauqf
 buDg==
X-Gm-Message-State: AOAM531NUNevLDkRZEfEhWHs0/nXviVUnGWhOVe0JmlNMfLN/nAGy89d
 V5hVRK9N0xwHnrDN+AQGGSCDug==
X-Google-Smtp-Source: ABdhPJyVgqSJ004YUstyik+jYZz4EuPzBWmUx2Fjtwy+WACEd9Ui4gBxtYL98zOt7vqmGF1V37Iq4w==
X-Received: by 2002:a17:902:e74e:b0:14f:f1c0:aaed with SMTP id
 p14-20020a170902e74e00b0014ff1c0aaedmr3958082plf.19.1645725447254; 
 Thu, 24 Feb 2022 09:57:27 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 b9-20020a056a000cc900b004f3581ae086sm183340pfv.16.2022.02.24.09.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 09:57:26 -0800 (PST)
Date: Thu, 24 Feb 2022 09:57:26 -0800 (PST)
X-Google-Original-Date: Thu, 24 Feb 2022 09:56:39 PST (-0800)
Subject: Re: [PATCH V6 17/20] riscv: compat: vdso: Add setup additional pages
 implementation
In-Reply-To: <20220224085410.399351-18-guoren@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-985c5e53-71d5-4d94-b9ff-deff7f834fc5@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 guoren@linux.alibaba.com, linux-parisc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>,
 drew@beagleboard.org, anup@brainfault.org, wangjunqiang@iscas.ac.cn,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, guoren@kernel.org, liush@allwinnertech.com,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, wefu@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 24 Feb 2022 00:54:07 PST (-0800), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Reconstruct __setup_additional_pages() by appending vdso info
> pointer argument to meet compat_vdso_info requirement. And change
> vm_special_mapping *dm, *cm initialization into static.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/include/asm/elf.h |   5 ++
>  arch/riscv/include/asm/mmu.h |   1 +
>  arch/riscv/kernel/vdso.c     | 103 +++++++++++++++++++++++------------
>  3 files changed, 74 insertions(+), 35 deletions(-)
>
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index 3a4293dc7229..d87d3bcc758d 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -134,5 +134,10 @@ do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)		\
>  typedef compat_ulong_t			compat_elf_greg_t;
>  typedef compat_elf_greg_t		compat_elf_gregset_t[ELF_NGREG];
>
> +extern int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
> +					      int uses_interp);
> +#define compat_arch_setup_additional_pages \
> +				compat_arch_setup_additional_pages
> +
>  #endif /* CONFIG_COMPAT */
>  #endif /* _ASM_RISCV_ELF_H */
> diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> index 0099dc116168..cedcf8ea3c76 100644
> --- a/arch/riscv/include/asm/mmu.h
> +++ b/arch/riscv/include/asm/mmu.h
> @@ -16,6 +16,7 @@ typedef struct {
>  	atomic_long_t id;
>  #endif
>  	void *vdso;
> +	void *vdso_info;
>  #ifdef CONFIG_SMP
>  	/* A local icache flush is needed before user execution can resume. */
>  	cpumask_t icache_stale_mask;
> diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> index a9436a65161a..f864811aa011 100644
> --- a/arch/riscv/kernel/vdso.c
> +++ b/arch/riscv/kernel/vdso.c
> @@ -23,6 +23,9 @@ struct vdso_data {
>  #endif
>
>  extern char vdso_start[], vdso_end[];
> +#ifdef CONFIG_COMPAT
> +extern char compat_vdso_start[], compat_vdso_end[];
> +#endif
>
>  enum vvar_pages {
>  	VVAR_DATA_PAGE_OFFSET,
> @@ -30,6 +33,11 @@ enum vvar_pages {
>  	VVAR_NR_PAGES,
>  };
>
> +enum rv_vdso_map {
> +	RV_VDSO_MAP_VVAR,
> +	RV_VDSO_MAP_VDSO,
> +};
> +
>  #define VVAR_SIZE  (VVAR_NR_PAGES << PAGE_SHIFT)
>
>  /*
> @@ -52,12 +60,6 @@ struct __vdso_info {
>  	struct vm_special_mapping *cm;
>  };
>
> -static struct __vdso_info vdso_info __ro_after_init = {
> -	.name = "vdso",
> -	.vdso_code_start = vdso_start,
> -	.vdso_code_end = vdso_end,
> -};
> -
>  static int vdso_mremap(const struct vm_special_mapping *sm,
>  		       struct vm_area_struct *new_vma)
>  {
> @@ -66,37 +68,33 @@ static int vdso_mremap(const struct vm_special_mapping *sm,
>  	return 0;
>  }
>
> -static int __init __vdso_init(void)
> +static void __init __vdso_init(struct __vdso_info *vdso_info)
>  {
>  	unsigned int i;
>  	struct page **vdso_pagelist;
>  	unsigned long pfn;
>
> -	if (memcmp(vdso_info.vdso_code_start, "\177ELF", 4)) {
> -		pr_err("vDSO is not a valid ELF object!\n");
> -		return -EINVAL;
> -	}
> +	if (memcmp(vdso_info->vdso_code_start, "\177ELF", 4))
> +		panic("vDSO is not a valid ELF object!\n");
>
> -	vdso_info.vdso_pages = (
> -		vdso_info.vdso_code_end -
> -		vdso_info.vdso_code_start) >>
> +	vdso_info->vdso_pages = (
> +		vdso_info->vdso_code_end -
> +		vdso_info->vdso_code_start) >>
>  		PAGE_SHIFT;
>
> -	vdso_pagelist = kcalloc(vdso_info.vdso_pages,
> +	vdso_pagelist = kcalloc(vdso_info->vdso_pages,
>  				sizeof(struct page *),
>  				GFP_KERNEL);
>  	if (vdso_pagelist == NULL)
> -		return -ENOMEM;
> +		panic("vDSO kcalloc failed!\n");
>
>  	/* Grab the vDSO code pages. */
> -	pfn = sym_to_pfn(vdso_info.vdso_code_start);
> +	pfn = sym_to_pfn(vdso_info->vdso_code_start);
>
> -	for (i = 0; i < vdso_info.vdso_pages; i++)
> +	for (i = 0; i < vdso_info->vdso_pages; i++)
>  		vdso_pagelist[i] = pfn_to_page(pfn + i);
>
> -	vdso_info.cm->pages = vdso_pagelist;
> -
> -	return 0;
> +	vdso_info->cm->pages = vdso_pagelist;
>  }
>
>  #ifdef CONFIG_TIME_NS
> @@ -116,13 +114,14 @@ int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
>  {
>  	struct mm_struct *mm = task->mm;
>  	struct vm_area_struct *vma;
> +	struct __vdso_info *vdso_info = mm->context.vdso_info;
>
>  	mmap_read_lock(mm);
>
>  	for (vma = mm->mmap; vma; vma = vma->vm_next) {
>  		unsigned long size = vma->vm_end - vma->vm_start;
>
> -		if (vma_is_special_mapping(vma, vdso_info.dm))
> +		if (vma_is_special_mapping(vma, vdso_info->dm))
>  			zap_page_range(vma, vma->vm_start, size);
>  	}
>
> @@ -187,11 +186,6 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
>  	return vmf_insert_pfn(vma, vmf->address, pfn);
>  }
>
> -enum rv_vdso_map {
> -	RV_VDSO_MAP_VVAR,
> -	RV_VDSO_MAP_VDSO,
> -};
> -
>  static struct vm_special_mapping rv_vdso_maps[] __ro_after_init = {
>  	[RV_VDSO_MAP_VVAR] = {
>  		.name   = "[vvar]",
> @@ -203,25 +197,44 @@ static struct vm_special_mapping rv_vdso_maps[] __ro_after_init = {
>  	},
>  };
>
> +static struct __vdso_info vdso_info __ro_after_init = {
> +	.name = "vdso",
> +	.vdso_code_start = vdso_start,
> +	.vdso_code_end = vdso_end,
> +	.dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR],
> +	.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO],
> +};
> +
> +#ifdef CONFIG_COMPAT
> +static struct __vdso_info compat_vdso_info __ro_after_init = {
> +	.name = "compat_vdso",
> +	.vdso_code_start = compat_vdso_start,
> +	.vdso_code_end = compat_vdso_end,
> +	.dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR],
> +	.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO],
> +};
> +#endif
> +
>  static int __init vdso_init(void)
>  {
> -	vdso_info.dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR];
> -	vdso_info.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO];
> +	__vdso_init(&vdso_info);
> +	__vdso_init(&compat_vdso_info);

An autobuilder is pointing out an issue here.  I'm assuming just an `#if 
defined(CONFIG_COMPAT)` will fix it, I'm OK squashing that in if it's 
the only issue -- a fixed one never hurts, though ;)

I'll try to take another look soon.

> -	return __vdso_init();
> +	return 0;
>  }
>  arch_initcall(vdso_init);
>
>  static int __setup_additional_pages(struct mm_struct *mm,
>  				    struct linux_binprm *bprm,
> -				    int uses_interp)
> +				    int uses_interp,
> +				    struct __vdso_info *vdso_info)
>  {
>  	unsigned long vdso_base, vdso_text_len, vdso_mapping_len;
>  	void *ret;
>
>  	BUILD_BUG_ON(VVAR_NR_PAGES != __VVAR_PAGES);
>
> -	vdso_text_len = vdso_info.vdso_pages << PAGE_SHIFT;
> +	vdso_text_len = vdso_info->vdso_pages << PAGE_SHIFT;
>  	/* Be sure to map the data page */
>  	vdso_mapping_len = vdso_text_len + VVAR_SIZE;
>
> @@ -232,16 +245,18 @@ static int __setup_additional_pages(struct mm_struct *mm,
>  	}
>
>  	ret = _install_special_mapping(mm, vdso_base, VVAR_SIZE,
> -		(VM_READ | VM_MAYREAD | VM_PFNMAP), vdso_info.dm);
> +		(VM_READ | VM_MAYREAD | VM_PFNMAP), vdso_info->dm);
>  	if (IS_ERR(ret))
>  		goto up_fail;
>
>  	vdso_base += VVAR_SIZE;
>  	mm->context.vdso = (void *)vdso_base;
> +	mm->context.vdso_info = (void *)vdso_info;
> +
>  	ret =
>  	   _install_special_mapping(mm, vdso_base, vdso_text_len,
>  		(VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC),
> -		vdso_info.cm);
> +		vdso_info->cm);
>
>  	if (IS_ERR(ret))
>  		goto up_fail;
> @@ -253,6 +268,24 @@ static int __setup_additional_pages(struct mm_struct *mm,
>  	return PTR_ERR(ret);
>  }
>
> +#ifdef CONFIG_COMPAT
> +int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
> +				       int uses_interp)
> +{
> +	struct mm_struct *mm = current->mm;
> +	int ret;
> +
> +	if (mmap_write_lock_killable(mm))
> +		return -EINTR;
> +
> +	ret = __setup_additional_pages(mm, bprm, uses_interp,
> +							&compat_vdso_info);
> +	mmap_write_unlock(mm);
> +
> +	return ret;
> +}
> +#endif
> +
>  int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
>  {
>  	struct mm_struct *mm = current->mm;
> @@ -261,7 +294,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
>  	if (mmap_write_lock_killable(mm))
>  		return -EINTR;
>
> -	ret = __setup_additional_pages(mm, bprm, uses_interp);
> +	ret = __setup_additional_pages(mm, bprm, uses_interp, &vdso_info);
>  	mmap_write_unlock(mm);
>
>  	return ret;
