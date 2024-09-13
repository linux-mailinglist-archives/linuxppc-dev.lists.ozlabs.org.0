Return-Path: <linuxppc-dev+bounces-1339-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6CB978323
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 17:01:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4yDW5LWRz2ynn;
	Sat, 14 Sep 2024 01:00:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726239659;
	cv=none; b=N731dIIHl0yKa4v17pyJ1OPpMRvmvMYo3qpQ8tNo13QJb9O8dP6dyi098nm4k990brDOARZ2Q+5J77C8enWpsuTb+ER3o1PVXZi3wFi5khafhwSzfSM7xE8pHqO6pcuArNMhsLv4Msql3nrZTCvbmjqT7Twl/OzfJPRPKuFyxmWSm/TiZrbNDTmfb4Ltz05F9B6nEGMsrTBtltE0McVUC/ttBxYU8nBGSRMrAqz6WOeoQW9YL98TMa9wUvkWNKzk1iBI3psZJJZjaAHO2RTjQswJmMDlgl/IDHuFjyAqz/NhxFVcooSAh/tVrbhPP7p+63nS7iyhUlTqwxyVF4YWNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726239659; c=relaxed/relaxed;
	bh=P6vlq4KZuWy+cpagWnMP/i1WxsOpBsApAGszCvaZ6aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VlbSHA16i+hOt479/1tyxUO1UgKI14ZMRzJAvhtJnZKJuUqBtw/dBJHpC2tBL2kREEQ8Jfxl9NPDaVuaGOqfxgeUQX6UGBeyH2/hFq6q6QTz02qmt6zzLycdg7XMJH2JsHDbXBGxv2CFCkKgYxA3xlu+s4TpN3rV80hgylkhsXbklnS7PKRblK4cCC4XwQfQd5gyU6bQMGc91fFKuxyv40DL3lgUEbB+oaKUzI9ORGecnyY+Ll6ZCovDbVL0DEP05cQSucsHeFZuKrwDpeuN75rUKMc0TOeP+fS2OGRoamuJdTCqE9YJoXWJkBvcL2jaggcxP0kCrPM5Uq3sUBnFLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UDm3heQL; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UDm3heQL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4yDW0vRGz2yk8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 01:00:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA0D65C5495
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 15:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7571C4CED3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726239655;
	bh=BA0ANnltDBBfuoBltj9aaFdaXEL//Iks38XJnB02U/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UDm3heQLpcg5nfB2wo0AUkyhUHeZzC7otMWgPlJOxbwr3+idodQD7mw/DQXAFb685
	 +hv7r9KV0G12j4Rf0C8hWRmIp8UEV8UjeYNRzJIZUC0trah5MQWx8Jc3E8tz6pTzQD
	 Bd/Xgb4r++0FL77uQSStU9FjqkhGEmhxKQT0X73g472DcGUTX9EMySKmHCLbrNPK37
	 Q+q1N9N/7GnJl1wXK4szqtZwR2y/sccxlr2jor/yF1XjEYcAWiznZtcMUp2RTsfouP
	 vm3NW1CUMNGC+XFp7p6D9yWzGJ/0zNv6I8qtpKYX3LugO/rUiO2YqReAN2zhdxhEeS
	 6/HH95+iUrWqg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f75129b3a3so25817961fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 08:00:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWusBBesXhYQ0DtOwlZOiYg63TXRv4XRpYZsQDF8l6tX6Ths9runEELbM1GKxyAGpGxVVe8IuNqDD/Ttg0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxsa4q0ngf5qiGthiw0ivoqppTD1GKmTgPch9ffUoEf7A70e0o5
	iv1uaKxmCegRQaH4GtX7nSk8HLG1v6Ul2rOFrBSIC0tmeUpoW8x11L+eKggeqLKEqO1hph9xcjU
	/E7tEGynWj+eJaWDrsUGmeILW/6o=
X-Google-Smtp-Source: AGHT+IEIp2MygUsW5Tc1gnqrEXhSi4Y5LfaJ7pDs2t1FcVSY61BEs2pVKMYAU/+O+nJIsawLe6NqpBRTPpsi7cWLSzQ=
X-Received: by 2002:a05:651c:1a0c:b0:2f0:1e0a:4696 with SMTP id
 38308e7fff4ca-2f787dabe7emr39035411fa.7.1726239653924; Fri, 13 Sep 2024
 08:00:53 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240909064730.3290724-1-rppt@kernel.org> <20240909064730.3290724-8-rppt@kernel.org>
In-Reply-To: <20240909064730.3290724-8-rppt@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 13 Sep 2024 17:00:42 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG_Z=7B_eDAk3vhtDjfcnka3AoSKNzvFQDzpvYY2EyVfg@mail.gmail.com>
Message-ID: <CAMj1kXG_Z=7B_eDAk3vhtDjfcnka3AoSKNzvFQDzpvYY2EyVfg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] execmem: add support for cache of large ROX pages
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, 
	Brian Cain <bcain@quicinc.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christoph Hellwig <hch@infradead.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet <kent.overstreet@linux.dev>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, 
	Stafford Horne <shorne@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Uladzislau Rezki <urezki@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, 
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mike,

On Mon, 9 Sept 2024 at 08:51, Mike Rapoport <rppt@kernel.org> wrote:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Using large pages to map text areas reduces iTLB pressure and improves
> performance.
>
> Extend execmem_alloc() with an ability to use huge pages with ROX
> permissions as a cache for smaller allocations.
>
> To populate the cache, a writable large page is allocated from vmalloc with
> VM_ALLOW_HUGE_VMAP, filled with invalid instructions and then remapped as
> ROX.
>
> Portions of that large page are handed out to execmem_alloc() callers
> without any changes to the permissions.
>
> When the memory is freed with execmem_free() it is invalidated again so
> that it won't contain stale instructions.
>
> The cache is enabled when an architecture sets EXECMEM_ROX_CACHE flag in
> definition of an execmem_range.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  include/linux/execmem.h |   2 +
>  mm/execmem.c            | 289 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 286 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/execmem.h b/include/linux/execmem.h
> index dfdf19f8a5e8..7436aa547818 100644
> --- a/include/linux/execmem.h
> +++ b/include/linux/execmem.h
> @@ -77,12 +77,14 @@ struct execmem_range {
>
>  /**
>   * struct execmem_info - architecture parameters for code allocations
> + * @fill_trapping_insns: set memory to contain instructions that will trap
>   * @ranges: array of parameter sets defining architecture specific
>   * parameters for executable memory allocations. The ranges that are not
>   * explicitly initialized by an architecture use parameters defined for
>   * @EXECMEM_DEFAULT.
>   */
>  struct execmem_info {
> +       void (*fill_trapping_insns)(void *ptr, size_t size, bool writable);
>         struct execmem_range    ranges[EXECMEM_TYPE_MAX];
>  };
>
> diff --git a/mm/execmem.c b/mm/execmem.c
> index 0f6691e9ffe6..f547c1f3c93d 100644
> --- a/mm/execmem.c
> +++ b/mm/execmem.c
> @@ -7,28 +7,88 @@
>   */
>
>  #include <linux/mm.h>
> +#include <linux/mutex.h>
>  #include <linux/vmalloc.h>
>  #include <linux/execmem.h>
> +#include <linux/maple_tree.h>
>  #include <linux/moduleloader.h>
>  #include <linux/text-patching.h>
>
> +#include <asm/tlbflush.h>
> +
> +#include "internal.h"
> +
>  static struct execmem_info *execmem_info __ro_after_init;
>  static struct execmem_info default_execmem_info __ro_after_init;
>
> -static void *__execmem_alloc(struct execmem_range *range, size_t size)
> +#ifdef CONFIG_MMU
> +struct execmem_cache {
> +       struct mutex mutex;
> +       struct maple_tree busy_areas;
> +       struct maple_tree free_areas;
> +};
> +
> +static struct execmem_cache execmem_cache = {
> +       .mutex = __MUTEX_INITIALIZER(execmem_cache.mutex),
> +       .busy_areas = MTREE_INIT_EXT(busy_areas, MT_FLAGS_LOCK_EXTERN,
> +                                    execmem_cache.mutex),
> +       .free_areas = MTREE_INIT_EXT(free_areas, MT_FLAGS_LOCK_EXTERN,
> +                                    execmem_cache.mutex),
> +};
> +
> +static void execmem_cache_clean(struct work_struct *work)
> +{
> +       struct maple_tree *free_areas = &execmem_cache.free_areas;
> +       struct mutex *mutex = &execmem_cache.mutex;
> +       MA_STATE(mas, free_areas, 0, ULONG_MAX);
> +       void *area;
> +
> +       mutex_lock(mutex);
> +       mas_for_each(&mas, area, ULONG_MAX) {
> +               size_t size;
> +
> +               if (!xa_is_value(area))
> +                       continue;
> +
> +               size = xa_to_value(area);
> +
> +               if (IS_ALIGNED(size, PMD_SIZE) &&
> +                   IS_ALIGNED(mas.index, PMD_SIZE)) {
> +                       void *ptr = (void *)mas.index;
> +
> +                       mas_erase(&mas);
> +                       vfree(ptr);
> +               }
> +       }
> +       mutex_unlock(mutex);
> +}
> +
> +static DECLARE_WORK(execmem_cache_clean_work, execmem_cache_clean);
> +
> +static void execmem_fill_trapping_insns(void *ptr, size_t size, bool writable)
> +{
> +       if (execmem_info->fill_trapping_insns)
> +               execmem_info->fill_trapping_insns(ptr, size, writable);
> +       else
> +               memset(ptr, 0, size);

Does this really have to be a function pointer with a runtime check?

This could just be a __weak definition, with the arch providing an
override if the memset() is not appropriate.

