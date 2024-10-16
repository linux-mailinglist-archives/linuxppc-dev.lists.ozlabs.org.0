Return-Path: <linuxppc-dev+bounces-2327-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F07FE9A152E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 23:54:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTPrF3Zg3z2xpn;
	Thu, 17 Oct 2024 08:54:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::232"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729089679;
	cv=none; b=b3rJ8nlEXsCqTidQMNYU00Tg9b+6ucmx/VxD5Kfls8geW7WVUrlPQkv+TUCx3Z25gRX2UoRrElI1AS7CayvjiGfBINylvK+XODgJlVLsamebbSLpyHnWzYFsctD8XofpDim4nC/cMlZleZrQPRCb5RZUCzc54WUWsqUWi2sPX0BU9Dd3rSBfbIIgBH2vkd96qvRseTJsGDWLCcasvLgrVCm+hrsZGKPlIXCc6UyVO2KlPZYrdknfqb3N2EEBLvxt5SGK3BVp8TsgQOqHDUKmCePmnM+W9xCObGcrsQQwUFliB7PzQgzVkhX9QYOabmRtwFsnCm1MeyAiIkgnpSmhvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729089679; c=relaxed/relaxed;
	bh=xNOEBHIW89c1j/jhsHn9BJm63iz+XQaKnsI8oRx93vU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmB/4Jyn9Kg4RryEIxpHimgJBOR1v28Qilo43XRsm64KVuMg6foufmWUJInVyr3iNM0nH3OW20HR0CDapfqQ5DeXRkaoPqWFb1UTC7+kak+uwO+QBz9gqxXsNpjLpyv0t8rUauX9/Fk2yCgD6E/ABKmWuNZIjnEP59h0LMte7qqHr9xUMSoN6MaEf4aC4pzE+KLtBitjdBxc6wryrfdwXbKapHathlpoMnvb4qLSos0lW5oRhS+JAlIQxuhDyHk04XFTiFRIosjtscjcNLzJISKSIQ/y7THAyNgSz5Dz/BUWeM7y0OmVnff8UWrhMcd0wjhSbFo79WVI3LipI3OdiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KHw1e9mq; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KHw1e9mq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTDDX5F52z2xk7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 01:41:15 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2fb5638dd57so31652431fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 07:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729089669; x=1729694469; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xNOEBHIW89c1j/jhsHn9BJm63iz+XQaKnsI8oRx93vU=;
        b=KHw1e9mq7CWQ0yTol4gM7aZFJTtGEx9kiqlPEuU8o9mI373dzgYydggQKVKsqnaehG
         ozVjr3iKdbCB7F7YCDGiWJuhdSO6sPwuhxcsu1VLFvszyKNFKxLSYTl0fbquE2ZT98+a
         DpL2Qg8bOJVZy7ALUl2Vl3HLdUwvIIY1Ew1To+wSnu0EVpYMkAM3fTosV5/n2oLcT6l2
         6fkwvL7sTT+0P6VnP54wazZb4/6Bzva9vp6HNDD+QOL1Z2sL4uhRMb23cjbothZw9LU/
         k5sf+7U5mcbU4EYe+DRzDJP4bnV0ztCynA4jyj94fVutug/GVttPVz4gfGrspLbYk6sb
         szaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729089669; x=1729694469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNOEBHIW89c1j/jhsHn9BJm63iz+XQaKnsI8oRx93vU=;
        b=Td696yX5qkqf3WihEMwE/B3IWhQxEVOzNivPIvysC9U9U+DPLmno4RSWaU1YUEhlMQ
         65PA5MXUCMZUxZ+6FvTH42EdlTRc+zODWfZKuvO35aliKUrRoQsTeaTSudleCfTjqWkh
         yOzEE9hbWZLD+vkdOPpIQ+y5MFCdySbRw6gNK9opZZFajT0eXBVT6hrr20coXZ8iTZ5Y
         gJBmKfcRKUF1DscyBct7lQxPPXWBobphiOJi7QoaXivO7/jOwdHHcLDXCLoelLHpLwQY
         hHRaqbDUT5CYXdLqXOvF1hP8xcbejhuhmGscNNMKZ2Ktq3OvHeCTP3kn/n5ZCacFE2sp
         GdBw==
X-Forwarded-Encrypted: i=1; AJvYcCUcSkA2WMKh6hoJmTmB5pC6ixXRz12AHljLJcvcPHCcSlvFiXvIfVeKL1MPkStR1jQliqHqfLDwXqXWMYo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwU2X21WlKx1LZft85A1xgeSWzP2CnI7qa8xK/RmVRbBp+3J88F
	SPjykcDFgL0puonEr5q2ZNGP7Q/HgQlax79PpjAsJ450hrTSahLC
X-Google-Smtp-Source: AGHT+IEQ2b77do+Ei5H+uRLYrEtNQq0NK3oK0wCc+2cFtuWRuK/aQBOOdJJvL1LeKTNOBzUMcJr/yQ==
X-Received: by 2002:a05:651c:1989:b0:2fb:6181:8ca1 with SMTP id 38308e7fff4ca-2fb61b37a76mr33036831fa.6.1729089669341;
        Wed, 16 Oct 2024 07:41:09 -0700 (PDT)
Received: from pc636 (host-95-203-1-67.mobileonline.telia.com. [95.203.1.67])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb5d1d0244sm4327361fa.139.2024.10.16.07.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 07:41:08 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 16 Oct 2024 16:41:03 +0200
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v6 1/8] mm: vmalloc: group declarations depending on
 CONFIG_MMU together
Message-ID: <Zw_QfzopOv7pCZc_@pc636>
References: <20241016122424.1655560-1-rppt@kernel.org>
 <20241016122424.1655560-2-rppt@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016122424.1655560-2-rppt@kernel.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 16, 2024 at 03:24:17PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> There are a couple of declarations that depend on CONFIG_MMU in
> include/linux/vmalloc.h spread all over the file.
> 
> Group them all together to improve code readability.
> 
> No functional changes.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/vmalloc.h | 60 +++++++++++++++++------------------------
>  1 file changed, 24 insertions(+), 36 deletions(-)
> 
> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> index ad2ce7a6ab7a..27408f21e501 100644
> --- a/include/linux/vmalloc.h
> +++ b/include/linux/vmalloc.h
> @@ -134,12 +134,6 @@ extern void vm_unmap_ram(const void *mem, unsigned int count);
>  extern void *vm_map_ram(struct page **pages, unsigned int count, int node);
>  extern void vm_unmap_aliases(void);
>  
> -#ifdef CONFIG_MMU
> -extern unsigned long vmalloc_nr_pages(void);
> -#else
> -static inline unsigned long vmalloc_nr_pages(void) { return 0; }
> -#endif
> -
>  extern void *vmalloc_noprof(unsigned long size) __alloc_size(1);
>  #define vmalloc(...)		alloc_hooks(vmalloc_noprof(__VA_ARGS__))
>  
> @@ -266,12 +260,29 @@ static inline bool is_vm_area_hugepages(const void *addr)
>  #endif
>  }
>  
> +/* for /proc/kcore */
> +long vread_iter(struct iov_iter *iter, const char *addr, size_t count);
> +
> +/*
> + *	Internals.  Don't use..
> + */
> +__init void vm_area_add_early(struct vm_struct *vm);
> +__init void vm_area_register_early(struct vm_struct *vm, size_t align);
> +
> +int register_vmap_purge_notifier(struct notifier_block *nb);
> +int unregister_vmap_purge_notifier(struct notifier_block *nb);
> +
>  #ifdef CONFIG_MMU
> +#define VMALLOC_TOTAL (VMALLOC_END - VMALLOC_START)
> +
> +unsigned long vmalloc_nr_pages(void);
> +
>  int vm_area_map_pages(struct vm_struct *area, unsigned long start,
>  		      unsigned long end, struct page **pages);
>  void vm_area_unmap_pages(struct vm_struct *area, unsigned long start,
>  			 unsigned long end);
>  void vunmap_range(unsigned long addr, unsigned long end);
> +
>  static inline void set_vm_flush_reset_perms(void *addr)
>  {
>  	struct vm_struct *vm = find_vm_area(addr);
> @@ -279,24 +290,14 @@ static inline void set_vm_flush_reset_perms(void *addr)
>  	if (vm)
>  		vm->flags |= VM_FLUSH_RESET_PERMS;
>  }
> +#else  /* !CONFIG_MMU */
> +#define VMALLOC_TOTAL 0UL
>  
> -#else
> -static inline void set_vm_flush_reset_perms(void *addr)
> -{
> -}
> -#endif
> -
> -/* for /proc/kcore */
> -extern long vread_iter(struct iov_iter *iter, const char *addr, size_t count);
> -
> -/*
> - *	Internals.  Don't use..
> - */
> -extern __init void vm_area_add_early(struct vm_struct *vm);
> -extern __init void vm_area_register_early(struct vm_struct *vm, size_t align);
> +static inline unsigned long vmalloc_nr_pages(void) { return 0; }
> +static inline void set_vm_flush_reset_perms(void *addr) {}
> +#endif /* CONFIG_MMU */
>  
> -#ifdef CONFIG_SMP
> -# ifdef CONFIG_MMU
> +#if defined(CONFIG_MMU) && defined(CONFIG_SMP)
>  struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
>  				     const size_t *sizes, int nr_vms,
>  				     size_t align);
> @@ -311,22 +312,9 @@ pcpu_get_vm_areas(const unsigned long *offsets,
>  	return NULL;
>  }
>  
> -static inline void
> -pcpu_free_vm_areas(struct vm_struct **vms, int nr_vms)
> -{
> -}
> -# endif
> -#endif
> -
> -#ifdef CONFIG_MMU
> -#define VMALLOC_TOTAL (VMALLOC_END - VMALLOC_START)
> -#else
> -#define VMALLOC_TOTAL 0UL
> +static inline void pcpu_free_vm_areas(struct vm_struct **vms, int nr_vms) {}
>  #endif
>  
> -int register_vmap_purge_notifier(struct notifier_block *nb);
> -int unregister_vmap_purge_notifier(struct notifier_block *nb);
> -
>  #if defined(CONFIG_MMU) && defined(CONFIG_PRINTK)
>  bool vmalloc_dump_obj(void *object);
>  #else
> -- 
> 2.43.0
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

