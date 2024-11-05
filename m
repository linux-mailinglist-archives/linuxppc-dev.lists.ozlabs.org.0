Return-Path: <linuxppc-dev+bounces-2860-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A07D9BC7C9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 09:16:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjLl01PxGz2xgr;
	Tue,  5 Nov 2024 19:16:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730794571;
	cv=none; b=S2qIOwAQuVw2P18DAbFcuHsZZmy3FbvbWRWLKSzJYT7ADIEps8g2uRrKLifXU+p1cOWYd6jsH/y9apcN4LfxEI6T6tXTb5sX9o9IkeCjB9trT5tSwNN6r9ohUoTkbUUq1rCK9X4PHHgewbE193To81lA4IteqqYeH8HWePggGrXOfn7o4cn/lCrJdC80PZkOZQbU15mZjOk6+BWIW5BVOsrrFuBtS0uroC7oUkTPRIcraWnVKAAOJ3v3CdvuyD1kTnYmVi73esMCSK6ooXMpI+Iiofgw+LHflvSlsSlvxTWZKqRNKIf65PkBAVR4U0mwpJ24spRYeGA5rCsa5asqpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730794571; c=relaxed/relaxed;
	bh=602iPvSh9YR1XmM8QtfiYS0Qm0OSKwNQEobgZnK2U+U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=J+0lNYff6qkVNzSyJ5bZ809WheUxQAl8o4aKIqbCGtpOjQhTmB9sSWxww0gNi0lHiAsWyjaxEx3tiUefsr3smRXm6064FnYRMrAiic7BtM1YAuHLdQxsM+AVxfE4j+lH9kJ+BPzPFN2Yhp1zjRuC+wIv789dkEl1fohdbSysXydBGElfJOeb++NTM9jmgjn8nuoXcRIQ1RF9G2NRUX9R2HpHeCVvzGLnQWHYs8TFTxjrweaUCuwK5XhmqBwtEuuxWTQKfSU4EoRV/Dvq8otqvkXdnoZPjVl34k1U7xAPcBOf4mTdjm6g+8y97lCzFTeQU01wBs+19ipdF1mABbQLdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=M0fHK+iB; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=M0fHK+iB;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjLkx4gZqz2xgM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 19:16:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730794567;
	bh=602iPvSh9YR1XmM8QtfiYS0Qm0OSKwNQEobgZnK2U+U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M0fHK+iBkmN75aOle84ZNg5REyaTPjz4xOxkfg1YbSBNvBd+DBfRUgLbUF8jRTF61
	 znflwO0fSPvFfqVSHh5JE/phumK9AWldSxYHJH402KmCtzo/QKHW6d84b2/0vHY78T
	 C5Xa6Cxmn6OH9Wk8uHLbxeeFmXIH3ixpJcX0DC4ZUzjaOihMe4kQctZTeLcGBTwRDH
	 I5lEkQgmEEyGIF94JC9Uu3KMlFS9CDU4r2gikZiUtwMsOvmVnjGqT9Dg/58KomEoTk
	 4zwfrL46SiXx4/bWZPMyweMeoOzpR4o3mQboGcgCq0RkT0c8JdXD0pbZDnwB4c9Ua+
	 bLqaeLWZ8bmKQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XjLkv1cQ2z4wZx;
	Tue,  5 Nov 2024 19:16:07 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Hari Bathini <hbathini@linux.ibm.com>, Venkat Rao Bagalkote
 <venkat88@linux.vnet.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/fadump: allocate memory for additional
 parameters early
In-Reply-To: <20241104083528.99520-1-sourabhjain@linux.ibm.com>
References: <20241104083528.99520-1-sourabhjain@linux.ibm.com>
Date: Tue, 05 Nov 2024 19:16:08 +1100
Message-ID: <874j4m9juf.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Sourabh,

Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> From: Hari Bathini <hbathini@linux.ibm.com>
>
> Memory for passing additional parameters to fadump capture kernel
> is allocated during subsys_initcall level, using memblock. But
> as slab is already available by this time, allocation happens via
> the buddy allocator. This may work for radix MMU but is likely to

Does it even work for radix? If the memory has been given out the buddy
allocator then it could be overwritten at any moment. Or vice-versa,
fadump might overwrite memory used for something else.

> fail in most cases for hash MMU as hash MMU needs this memory in
> the first memory block for it to be accesible in real mode in the
> capture kernel (second boot). So, allocate memory for additional
> parameters area as soon as MMU mode is obvious.
>
> Fixes: 683eab94da75 ("powerpc/fadump: setup additional parameters for dump capture kernel")
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
> Closes: https://lore.kernel.org/lkml/a70e4064-a040-447b-8556-1fd02f19383d@linux.vnet.ibm.com/T/#u
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/fadump.h |  2 ++
>  arch/powerpc/kernel/fadump.c      | 15 ++++++++++-----
>  arch/powerpc/kernel/prom.c        |  3 +++
>  3 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
> index ef40c9b6972a..978102c5129e 100644
> --- a/arch/powerpc/include/asm/fadump.h
> +++ b/arch/powerpc/include/asm/fadump.h
> @@ -19,6 +19,7 @@ extern int is_fadump_active(void);
>  extern int should_fadump_crash(void);
>  extern void crash_fadump(struct pt_regs *, const char *);
>  extern void fadump_cleanup(void);
> +extern void fadump_setup_param_area(void);
 
You can drop extern on new declarations.

>  extern void fadump_append_bootargs(void);
>  
>  #else	/* CONFIG_FA_DUMP */
> @@ -26,6 +27,7 @@ static inline int is_fadump_active(void) { return 0; }
>  static inline int should_fadump_crash(void) { return 0; }
>  static inline void crash_fadump(struct pt_regs *regs, const char *str) { }
>  static inline void fadump_cleanup(void) { }
> +static inline void fadump_setup_param_area(void) { }
>  static inline void fadump_append_bootargs(void) { }
>  #endif /* !CONFIG_FA_DUMP */
>  
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index a612e7513a4f..4a3f80f42118 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1586,6 +1586,12 @@ static void __init fadump_init_files(void)
>  		return;
>  	}
>  
> +	if (fw_dump.param_area) {
> +		rc = sysfs_create_file(fadump_kobj, &bootargs_append_attr.attr);
> +		if (rc)
> +			pr_err("unable to create bootargs_append sysfs file (%d)\n", rc);
> +	}
> +
>  	debugfs_create_file("fadump_region", 0444, arch_debugfs_dir, NULL,
>  			    &fadump_region_fops);
>  
> @@ -1740,7 +1746,7 @@ static void __init fadump_process(void)
>   * Reserve memory to store additional parameters to be passed
>   * for fadump/capture kernel.
>   */
> -static void __init fadump_setup_param_area(void)
> +void __init fadump_setup_param_area(void)
>  {
>  	phys_addr_t range_start, range_end;
>  
> @@ -1748,7 +1754,7 @@ static void __init fadump_setup_param_area(void)
>  		return;
>  
>  	/* This memory can't be used by PFW or bootloader as it is shared across kernels */
> -	if (radix_enabled()) {
> +	if (early_radix_enabled()) {
>  		/*
>  		 * Anywhere in the upper half should be good enough as all memory
>  		 * is accessible in real mode.
> @@ -1776,12 +1782,12 @@ static void __init fadump_setup_param_area(void)
>  						       COMMAND_LINE_SIZE,
>  						       range_start,
>  						       range_end);
> -	if (!fw_dump.param_area || sysfs_create_file(fadump_kobj, &bootargs_append_attr.attr)) {
> +	if (!fw_dump.param_area) {
>  		pr_warn("WARNING: Could not setup area to pass additional parameters!\n");
>  		return;
>  	}
>  
> -	memset(phys_to_virt(fw_dump.param_area), 0, COMMAND_LINE_SIZE);
> +	memset(__va(fw_dump.param_area), 0, COMMAND_LINE_SIZE);
 
This will now be running with the MMU off, so I think it would be
clearer to not use __va() here. Using __va() will work, but only because
the CPU ignores the top bits of the address in real mode.

There are cases where it's correct to use __va() in real mode, ie. when
you're storing a pointer for later use in virtual mode, but this is not
one of those cases AFAICS.

cheers

