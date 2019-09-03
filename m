Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35275A6CA8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 17:14:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N9V15mZHzDqZB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 01:14:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=andreyknvl@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jKTgxbew"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N9Cg1vk9zDqZw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 01:02:00 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id m3so9268768pgv.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 08:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a2fhN1NcP29VAX6Q4kuHnoYPTW0IlOqHifPZstOm4mo=;
 b=jKTgxbewf7sPASPHDIRjZy/DSg3ccnPxPhmVM1qw2+3zyIY1XYDZ5fOOV+Je7/21m3
 /zKF5xLg2gmAdqSC/V898UGcMHe8vo0jdhWTZPgtUj+4omdGaDQMpZ3rsz2yJjr23hYB
 VWOBGrtzqY/vAsw1rWOghUctwpPEduxbmy9VqF3hWvqrKcQjlRWpYEzPXKGnu1GIrzvs
 dP3X5JiFfCiv0SkWuWyA7f/+6J5Z1Gt4/cUXSH+H7NXJi7Pg2eWYRkbsNF5QkBggK6xh
 3T8Og5eFyiiSTQzmTPgE3TpO3TTIBa3NbJSq9u0nCtrLFCbWmpJVWeOaKlj/WrA42Fxn
 LTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a2fhN1NcP29VAX6Q4kuHnoYPTW0IlOqHifPZstOm4mo=;
 b=gudmqeoVo6lA/wZjfY7j0xeDfPeCUPWswSUY5geLbBpIFsWxU1yDRnqXMK6xdjGsaO
 QL1kj9Q2DxDCNawAuB6CbyNO6dl1BfuCS+kz+yvK8qMWzXVFWNf9U6F2XXd6ONqiW//7
 8GdJtnx3OvN5jowQYiilneoHjd7dUe7XgZcmWH+lSgp3Swt9tpbZPxR2GtWJOH8kC09D
 e6WHmsM5URyNxDHdP5sTNy6YIRPPgwdo38nD9WTvn64yrFANXXi2lvKoRC1IPRLamdHz
 LKDVylHuBbAVdQi5hQ6YergPP+YRDvsBqV/9DjIAIgInnj0MYmpAYobzjAZ4wKwOTH0c
 9ySw==
X-Gm-Message-State: APjAAAXfM0J/UCdVf7Ma8aJjmlMyLvUg/LwPMfpJyT1TY67GB3m8+zK5
 WaVeHLTzXkqeU26Lk0rmJ8n+53zuca/e5Q5wmHJdaw==
X-Google-Smtp-Source: APXvYqzoH/zqH0zVgfmZ7SrzRTTfX8La3Wn+15p5UKdCPhfC1viIQJ8QHtV6dTQPzQxiTvlGTgw/QngMDvTtPJdudiE=
X-Received: by 2002:a63:3006:: with SMTP id w6mr30960993pgw.440.1567522917541; 
 Tue, 03 Sep 2019 08:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190903145536.3390-1-dja@axtens.net>
 <20190903145536.3390-6-dja@axtens.net>
In-Reply-To: <20190903145536.3390-6-dja@axtens.net>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Tue, 3 Sep 2019 17:01:46 +0200
Message-ID: <CAAeHK+w_HKVh___E0j3hctt_efSPR3PwKuO5XNpf=w5obfYSSA@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] kasan debug: track pages allocated for vmalloc
 shadow
To: Daniel Axtens <dja@axtens.net>
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
Cc: Mark Rutland <mark.rutland@arm.com>, gor@linux.ibm.com,
 the arch/x86 maintainers <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>, Andy Lutomirski <luto@kernel.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 3, 2019 at 4:56 PM Daniel Axtens <dja@axtens.net> wrote:
>
> Provide the current number of vmalloc shadow pages in
> /sys/kernel/debug/kasan_vmalloc/shadow_pages.

Maybe it makes sense to put this into /sys/kernel/debug/kasan/
(without _vmalloc) and name e.g. vmalloc_shadow_pages? In case we want
to expose more generic KASAN debugging info later.

>
> Signed-off-by: Daniel Axtens <dja@axtens.net>
>
> ---
>
> Merging this is probably overkill, but I leave it to the discretion
> of the broader community.
>
> On v4 (no dynamic freeing), I saw the following approximate figures
> on my test VM:
>
>  - fresh boot: 720
>  - after test_vmalloc: ~14000
>
> With v5 (lazy dynamic freeing):
>
>  - boot: ~490-500
>  - running modprobe test_vmalloc pushes the figures up to sometimes
>     as high as ~14000, but they drop down to ~560 after the test ends.
>     I'm not sure where the extra sixty pages are from, but running the
>     test repeately doesn't cause the number to keep growing, so I don't
>     think we're leaking.
>  - with vmap_stack, spawning tasks pushes the figure up to ~4200, then
>     some clearing kicks in and drops it down to previous levels again.
> ---
>  mm/kasan/common.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index e33cbab83309..e40854512417 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -35,6 +35,7 @@
>  #include <linux/vmalloc.h>
>  #include <linux/bug.h>
>  #include <linux/uaccess.h>
> +#include <linux/debugfs.h>
>
>  #include <asm/tlbflush.h>
>
> @@ -750,6 +751,8 @@ core_initcall(kasan_memhotplug_init);
>  #endif
>
>  #ifdef CONFIG_KASAN_VMALLOC
> +static u64 vmalloc_shadow_pages;
> +
>  static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>                                       void *unused)
>  {
> @@ -776,6 +779,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>         if (likely(pte_none(*ptep))) {
>                 set_pte_at(&init_mm, addr, ptep, pte);
>                 page = 0;
> +               vmalloc_shadow_pages++;
>         }
>         spin_unlock(&init_mm.page_table_lock);
>         if (page)
> @@ -829,6 +833,7 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>         if (likely(!pte_none(*ptep))) {
>                 pte_clear(&init_mm, addr, ptep);
>                 free_page(page);
> +               vmalloc_shadow_pages--;
>         }
>         spin_unlock(&init_mm.page_table_lock);
>
> @@ -947,4 +952,25 @@ void kasan_release_vmalloc(unsigned long start, unsigned long end,
>                                        (unsigned long)shadow_end);
>         }
>  }
> +
> +static __init int kasan_init_vmalloc_debugfs(void)
> +{
> +       struct dentry *root, *count;
> +
> +       root = debugfs_create_dir("kasan_vmalloc", NULL);
> +       if (IS_ERR(root)) {
> +               if (PTR_ERR(root) == -ENODEV)
> +                       return 0;
> +               return PTR_ERR(root);
> +       }
> +
> +       count = debugfs_create_u64("shadow_pages", 0444, root,
> +                                  &vmalloc_shadow_pages);
> +
> +       if (IS_ERR(count))
> +               return PTR_ERR(root);
> +
> +       return 0;
> +}
> +late_initcall(kasan_init_vmalloc_debugfs);
>  #endif
> --
> 2.20.1
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20190903145536.3390-6-dja%40axtens.net.
