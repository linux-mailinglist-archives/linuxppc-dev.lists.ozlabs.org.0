Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF2C279190
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 21:59:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByjRC3v5TzDql8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Sep 2020 05:59:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=VTybZWU1; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ByjPc03jpzDqX1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Sep 2020 05:57:38 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id l126so4236329pfd.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Sep 2020 12:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=X/x6T6b2G/ZWmNX9BanYid2NgdP7BdOcEdGd61U5Bf8=;
 b=VTybZWU1t8gKaLAaYLr6CaUkHJtqbA/pABWyhRElb4n48aBBcFcCcrPGb0iAnIe/KX
 VqhetoWjGO+B2MBp7TvrJAjkoy08Z5cXTQrX6ykATc/JPaxN5zKUmhMRgpleWMzd0yuJ
 8uRQIh2lRg+5eCsMqBDoVUEM0VzVOPa/KRtPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=X/x6T6b2G/ZWmNX9BanYid2NgdP7BdOcEdGd61U5Bf8=;
 b=I6Tf5blVV9xLrnnClqBxFqM6dWcmZEyXeYr1oXa665VBKty8NCzihMeIR7cgVX1eQf
 OtrXCbnfNx3tjNjiKC09zRSUZT6VvohAJe5KKBl875xl7dbmjtmXt8hN5//JoTuKDWq/
 MZLYvH3m8x7xxdmB+U+z6zGenholNMyv9bhB9ay2Nz5X4VVB/s24TiJyxD6C5/6NhXMb
 drGo5e3iO9g78wfkLxuYcj+InLJDYo0jeoKH4Hz0NBMfWQAz2xy3vW/QFsZgXOfdNrr4
 DW207Gc2UK5Ui9het3b65Mu4eWh3lfu0n5/YhQLetJW5JEWJBZCgx9NoU8ksuv9L8nJS
 MwRA==
X-Gm-Message-State: AOAM532oNoBQuNiiXSNufYYlQnYYoliQsJ5/WaADXABhelME+7ETK+Wg
 IbGkqXIryE3hMdWRNX1PzKTWCg==
X-Google-Smtp-Source: ABdhPJzpANhJtZbxV7Ja864719vbBB//wbn0KykXI4y/dQfmciMG5vow9gyJmtJ4eVy7ppOLyLOtsw==
X-Received: by 2002:a63:524c:: with SMTP id s12mr430399pgl.287.1601063854856; 
 Fri, 25 Sep 2020 12:57:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id u22sm3052218pgi.85.2020.09.25.12.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 12:57:34 -0700 (PDT)
Date: Fri, 25 Sep 2020 12:57:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>
Subject: Re: [PATCH v2 2/3] lkdtm/powerpc: Add SLB multihit test
Message-ID: <202009251244.A4396AFF@keescook>
References: <20200925103123.21102-1-ganeshgr@linux.ibm.com>
 <20200925103123.21102-3-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200925103123.21102-3-ganeshgr@linux.ibm.com>
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
Cc: msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 25, 2020 at 04:01:22PM +0530, Ganesh Goudar wrote:
> Add support to inject slb multihit errors, to test machine
> check handling.

Thank you for more tests in here!

> 
> Based on work by Mahesh Salgaonkar and Michal Suchánek.
> 
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michal Suchánek <msuchanek@suse.de>

Should these be Co-developed-by: with S-o-b?

> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
>  drivers/misc/lkdtm/Makefile  |   4 ++
>  drivers/misc/lkdtm/core.c    |   3 +
>  drivers/misc/lkdtm/lkdtm.h   |   3 +
>  drivers/misc/lkdtm/powerpc.c | 132 +++++++++++++++++++++++++++++++++++
>  4 files changed, 142 insertions(+)
>  create mode 100644 drivers/misc/lkdtm/powerpc.c
> 
> diff --git a/drivers/misc/lkdtm/Makefile b/drivers/misc/lkdtm/Makefile
> index c70b3822013f..6a82f407fbcd 100644
> --- a/drivers/misc/lkdtm/Makefile
> +++ b/drivers/misc/lkdtm/Makefile
> @@ -11,6 +11,10 @@ lkdtm-$(CONFIG_LKDTM)		+= usercopy.o
>  lkdtm-$(CONFIG_LKDTM)		+= stackleak.o
>  lkdtm-$(CONFIG_LKDTM)		+= cfi.o
>  
> +ifeq ($(CONFIG_PPC64),y)
> +lkdtm-$(CONFIG_LKDTM)		+= powerpc.o
> +endif

This can just be:

lkdtm-$(CONFIG_PPC64)		+= powerpc.o

> +
>  KASAN_SANITIZE_stackleak.o	:= n
>  KCOV_INSTRUMENT_rodata.o	:= n
>  
> diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
> index a5e344df9166..8d5db42baa90 100644
> --- a/drivers/misc/lkdtm/core.c
> +++ b/drivers/misc/lkdtm/core.c
> @@ -178,6 +178,9 @@ static const struct crashtype crashtypes[] = {
>  #ifdef CONFIG_X86_32
>  	CRASHTYPE(DOUBLE_FAULT),
>  #endif
> +#ifdef CONFIG_PPC64
> +	CRASHTYPE(PPC_SLB_MULTIHIT),
> +#endif
>  };
>  
>  
> diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
> index 8878538b2c13..b305bd511ee5 100644
> --- a/drivers/misc/lkdtm/lkdtm.h
> +++ b/drivers/misc/lkdtm/lkdtm.h
> @@ -104,4 +104,7 @@ void lkdtm_STACKLEAK_ERASING(void);
>  /* cfi.c */
>  void lkdtm_CFI_FORWARD_PROTO(void);
>  
> +/* powerpc.c */
> +void lkdtm_PPC_SLB_MULTIHIT(void);
> +
>  #endif
> diff --git a/drivers/misc/lkdtm/powerpc.c b/drivers/misc/lkdtm/powerpc.c
> new file mode 100644
> index 000000000000..d6db18444757
> --- /dev/null
> +++ b/drivers/misc/lkdtm/powerpc.c
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0
> +

Please #include "lkdtm.h" here to get the correct pr_fmt heading (and
any future header adjustments).

> +#include <linux/slab.h>
> +#include <linux/vmalloc.h>
> +
> +static inline unsigned long get_slb_index(void)
> +{
> +	unsigned long index;
> +
> +	index = get_paca()->stab_rr;
> +
> +	/*
> +	 * simple round-robin replacement of slb starting at SLB_NUM_BOLTED.
> +	 */
> +	if (index < (mmu_slb_size - 1))
> +		index++;
> +	else
> +		index = SLB_NUM_BOLTED;
> +	get_paca()->stab_rr = index;
> +	return index;
> +}
> +
> +#define slb_esid_mask(ssize)	\
> +	(((ssize) == MMU_SEGSIZE_256M) ? ESID_MASK : ESID_MASK_1T)
> +
> +static inline unsigned long mk_esid_data(unsigned long ea, int ssize,
> +					 unsigned long slot)
> +{
> +	return (ea & slb_esid_mask(ssize)) | SLB_ESID_V | slot;
> +}
> +
> +#define slb_vsid_shift(ssize)	\
> +	((ssize) == MMU_SEGSIZE_256M ? SLB_VSID_SHIFT : SLB_VSID_SHIFT_1T)
> +
> +static inline unsigned long mk_vsid_data(unsigned long ea, int ssize,
> +					 unsigned long flags)
> +{
> +	return (get_kernel_vsid(ea, ssize) << slb_vsid_shift(ssize)) | flags |
> +		((unsigned long)ssize << SLB_VSID_SSIZE_SHIFT);
> +}
> +
> +static void insert_slb_entry(char *p, int ssize)
> +{
> +	unsigned long flags, entry;
> +
> +	flags = SLB_VSID_KERNEL | mmu_psize_defs[MMU_PAGE_64K].sllp;
> +	preempt_disable();
> +
> +	entry = get_slb_index();
> +	asm volatile("slbmte %0,%1" :
> +			: "r" (mk_vsid_data((unsigned long)p, ssize, flags)),
> +			  "r" (mk_esid_data((unsigned long)p, ssize, entry))
> +			: "memory");
> +
> +	entry = get_slb_index();
> +	asm volatile("slbmte %0,%1" :
> +			: "r" (mk_vsid_data((unsigned long)p, ssize, flags)),
> +			  "r" (mk_esid_data((unsigned long)p, ssize, entry))
> +			: "memory");
> +	preempt_enable();
> +	p[0] = '!';
> +}

Can you add some comments to these helpers? It'll help people (me) with
understanding what is actually being done here (and more importantly,
what is _expected_ to happen).

> +
> +static void inject_vmalloc_slb_multihit(void)
> +{
> +	char *p;
> +
> +	p = vmalloc(2048);
> +	if (!p)
> +		return;
> +
> +	insert_slb_entry(p, MMU_SEGSIZE_1T);
> +	vfree(p);
> +}
> +
> +static void inject_kmalloc_slb_multihit(void)
> +{
> +	char *p;
> +
> +	p = kmalloc(2048, GFP_KERNEL);
> +	if (!p)
> +		return;
> +
> +	insert_slb_entry(p, MMU_SEGSIZE_1T);
> +	kfree(p);
> +}

It looks like the expected failure injection is actually the "p[0] = '!'" line in the
"insert" helper? I would expect pr_info/pr_err wrappers, etc, as in
other lkdtm tests.

If this is the negative test, what does the positive test look like?
e.g. in other lkdtm tests, first a positive test is done, then a
negative: first run a legit function, then run a function from a bad
location.

> +
> +static void insert_dup_slb_entry_0(void)
> +{
> +	unsigned long test_address = 0xC000000000000000;
> +	volatile unsigned long *test_ptr;
> +	unsigned long entry, i = 0;
> +	unsigned long esid, vsid;
> +
> +	test_ptr = (unsigned long *)test_address;
> +	preempt_disable();
> +
> +	asm volatile("slbmfee  %0,%1" : "=r" (esid) : "r" (i));
> +	asm volatile("slbmfev  %0,%1" : "=r" (vsid) : "r" (i));
> +	entry = get_slb_index();
> +
> +	/* for i !=0 we would need to mask out the old entry number */
> +	asm volatile("slbmte %0,%1" :
> +			: "r" (vsid),
> +			  "r" (esid | entry)
> +			: "memory");
> +
> +	asm volatile("slbmfee  %0,%1" : "=r" (esid) : "r" (i));
> +	asm volatile("slbmfev  %0,%1" : "=r" (vsid) : "r" (i));
> +	entry = get_slb_index();
> +
> +	/* for i !=0 we would need to mask out the old entry number */
> +	asm volatile("slbmte %0,%1" :
> +			: "r" (vsid),
> +			  "r" (esid | entry)
> +			: "memory");
> +
> +	pr_info("lkdtm: %s accessing test address 0x%lx: 0x%lx\n",
> +		__func__, test_address, *test_ptr);
> +
> +	preempt_enable();
> +}

What does this do?

> +
> +void lkdtm_PPC_SLB_MULTIHIT(void)
> +{
> +	if (mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
> +		inject_vmalloc_slb_multihit();
> +		inject_kmalloc_slb_multihit();
> +		insert_dup_slb_entry_0();
> +	}
> +	pr_info("Recovered from SLB multihit. (Ignore this message on non HPTE machines)");

Is this bad? If so, I'd expect pr_err("FAIL: ...") Can HPTE machines be
detected so that an XFAIL can be emitted instead?

Since there are three (two?) distinct regions being tested, should these
be separate tests? Right now there is no way to separate a vmalloc
failure from a kmalloc failure, and no way to fail the first without
hiding the result from the latter (or maybe the machine cannot survive
this test? ... which should also be a comment.)

And finally, assuming a successful test (or testing from a separate
thread later), so there any state that needs to be restored (or cleaned
up before doing the "insert" calls)?

Thanks!

-- 
Kees Cook
