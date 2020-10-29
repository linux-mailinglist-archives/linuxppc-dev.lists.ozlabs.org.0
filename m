Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E91229F226
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 17:51:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMWfH2L6ZzDqLD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 03:50:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMWJm1xptzDqXL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 03:35:34 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id 32so2914859otm.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 09:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZB07qrLbOJe5x8k5kgwlwyYgrU0au+3LEdR9BcQ+dAw=;
 b=Zwp+NWogeJ2kSFV25yiLmKRipGvM4Pm2GjLFreB4OELw+eJB9KD69K38LVuK/4qkVB
 FfytGAUS1rRoAPhvQtr4NROCakH47lB3v+/4hP5a3PM+PCeFQiN2c4t2IGowVNJoQIoJ
 n7bF7U47u+mbzyZswrFTDwi+DDRBV49ovO7l6SQJ/Azm62SQsIo+m9lufht5qIyPxIQ5
 3HfsIcZ3QPN4uA7AGwUM/jToPJsNUGg5azc25rViTEoo/IDHufUFf9flRDgtOvzELw5I
 64njSRCba5U7lfHkmeBj4QeI/0cFcasO23tPCQ4Q7n0z2PWHVrVxwaKvt0POwmnlunzW
 eR6A==
X-Gm-Message-State: AOAM530nhpQlwB1c24Fec1e/exotxkiaEAdyYC6z/It5mB5WQcVOiboj
 wif6Q+VEVNlX6wkY9u2kpVAic1BsP+j4WM8Noy5G+S4e
X-Google-Smtp-Source: ABdhPJy2gnJASZanadb1mOz1tbg80ys3NM2aGYdvcYIISMX2t1bfCDW4CoQJSVVkimsx+nxAWLJibjXQBAg79vyeqWE=
X-Received: by 2002:a9d:734f:: with SMTP id l15mr4119563otk.260.1603989017370; 
 Thu, 29 Oct 2020 09:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201029161902.19272-1-rppt@kernel.org>
 <20201029161902.19272-3-rppt@kernel.org>
In-Reply-To: <20201029161902.19272-3-rppt@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 29 Oct 2020 17:30:06 +0100
Message-ID: <CAJZ5v0jY2vqZxdD7CaGUsCb2ePodamDnneOLHZcagCODn5kmrQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] PM: hibernate: make direct map manipulations more
 explicit
To: Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 the arch/x86 maintainers <x86@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Linux PM <linux-pm@vger.kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pekka Enberg <penberg@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 29, 2020 at 5:19 PM Mike Rapoport <rppt@kernel.org> wrote:
>
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> When DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP is enabled a page may be
> not present in the direct map and has to be explicitly mapped before it
> could be copied.
>
> On arm64 it is possible that a page would be removed from the direct map
> using set_direct_map_invalid_noflush() but __kernel_map_pages() will refuse
> to map this page back if DEBUG_PAGEALLOC is disabled.
>
> Introduce hibernate_map_page() that will explicitly use
> set_direct_map_{default,invalid}_noflush() for ARCH_HAS_SET_DIRECT_MAP case
> and debug_pagealloc_map_pages() for DEBUG_PAGEALLOC case.
>
> The remapping of the pages in safe_copy_page() presumes that it only
> changes protection bits in an existing PTE and so it is safe to ignore
> return value of set_direct_map_{default,invalid}_noflush().
>
> Still, add a WARN_ON() so that future changes in set_memory APIs will not
> silently break hibernation.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

From the hibernation support perspective:

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  include/linux/mm.h      | 12 ------------
>  kernel/power/snapshot.c | 30 ++++++++++++++++++++++++++++--
>  2 files changed, 28 insertions(+), 14 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 1fc0609056dc..14e397f3752c 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2927,16 +2927,6 @@ static inline bool debug_pagealloc_enabled_static(void)
>  #if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP)
>  extern void __kernel_map_pages(struct page *page, int numpages, int enable);
>
> -/*
> - * When called in DEBUG_PAGEALLOC context, the call should most likely be
> - * guarded by debug_pagealloc_enabled() or debug_pagealloc_enabled_static()
> - */
> -static inline void
> -kernel_map_pages(struct page *page, int numpages, int enable)
> -{
> -       __kernel_map_pages(page, numpages, enable);
> -}
> -
>  static inline void debug_pagealloc_map_pages(struct page *page,
>                                              int numpages, int enable)
>  {
> @@ -2948,8 +2938,6 @@ static inline void debug_pagealloc_map_pages(struct page *page,
>  extern bool kernel_page_present(struct page *page);
>  #endif /* CONFIG_HIBERNATION */
>  #else  /* CONFIG_DEBUG_PAGEALLOC || CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> -static inline void
> -kernel_map_pages(struct page *page, int numpages, int enable) {}
>  static inline void debug_pagealloc_map_pages(struct page *page,
>                                              int numpages, int enable) {}
>  #ifdef CONFIG_HIBERNATION
> diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
> index 46b1804c1ddf..054c8cce4236 100644
> --- a/kernel/power/snapshot.c
> +++ b/kernel/power/snapshot.c
> @@ -76,6 +76,32 @@ static inline void hibernate_restore_protect_page(void *page_address) {}
>  static inline void hibernate_restore_unprotect_page(void *page_address) {}
>  #endif /* CONFIG_STRICT_KERNEL_RWX  && CONFIG_ARCH_HAS_SET_MEMORY */
>
> +static inline void hibernate_map_page(struct page *page, int enable)
> +{
> +       if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
> +               unsigned long addr = (unsigned long)page_address(page);
> +               int ret;
> +
> +               /*
> +                * This should not fail because remapping a page here means
> +                * that we only update protection bits in an existing PTE.
> +                * It is still worth to have WARN_ON() here if something
> +                * changes and this will no longer be the case.
> +                */
> +               if (enable)
> +                       ret = set_direct_map_default_noflush(page);
> +               else
> +                       ret = set_direct_map_invalid_noflush(page);
> +
> +               if (WARN_ON(ret))
> +                       return;
> +
> +               flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +       } else {
> +               debug_pagealloc_map_pages(page, 1, enable);
> +       }
> +}
> +
>  static int swsusp_page_is_free(struct page *);
>  static void swsusp_set_page_forbidden(struct page *);
>  static void swsusp_unset_page_forbidden(struct page *);
> @@ -1355,9 +1381,9 @@ static void safe_copy_page(void *dst, struct page *s_page)
>         if (kernel_page_present(s_page)) {
>                 do_copy_page(dst, page_address(s_page));
>         } else {
> -               kernel_map_pages(s_page, 1, 1);
> +               hibernate_map_page(s_page, 1);
>                 do_copy_page(dst, page_address(s_page));
> -               kernel_map_pages(s_page, 1, 0);
> +               hibernate_map_page(s_page, 0);
>         }
>  }
>
> --
> 2.28.0
>
