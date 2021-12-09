Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C3D46E43B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 09:31:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8nLr4hZQz3cRH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 19:31:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qO/uzayy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qO/uzayy; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8nL95d03z303F
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 19:30:56 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id gt5so3901606pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 00:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=hsX2vSMnrxLONlWvtWncdN8J9hcalbFSZZUOqwHblPg=;
 b=qO/uzayy+EA8UhE4ho59EbAme9+iRj7k482cZ1Le5jX7CWs5pSQ7ypaHY59gWgsRbo
 Wd5ghmMjRCHdSkIgmkWNeRECh2ws+4s7KEl8rMryEqy+rjjb8nOM6+OFuMlJCZdaMRq/
 iWxjWBjwlnNUjxOvDFPmfcGlnilB3r73ph9U8MaZk4woRJ3uEPKprU7sow7cqPgrRw2H
 TGr57HYQS9Qta5g0LWnvenrEWCsr7hJcpVSScM42o8fEtaAL+bW+I/5OzmQG2QAQXx7G
 g4rBqJivM1MZ06j4QLIHCeNuPi86II2AAAlDmjjO2DNskOwSnmz8sslOf0wywRm+rfsY
 khAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=hsX2vSMnrxLONlWvtWncdN8J9hcalbFSZZUOqwHblPg=;
 b=Xy5bJPuGTobKANXceQYVGvGutb+EdwZ6x27QN1PBaeKLnMyVJjaEjvP7lIQsHt+GVF
 mVgSlH4Y1wGG5KB1/2K6o5ZuMx0SQUgJeAQzG4XPhS3RarJdM4vUpw8Tc4qyLpdbu9Yt
 aMzrogqlYh4h0MIf/N96xCUCOvgHjEsD4Dyi9HeDapRjo8YaaZEQfUTTMnf9nXYpjYjZ
 /Ex15p3sZ/B4H7QjCwjPYueuq5y3qlPtM243XN/xGUQtwbpjAPPirB1g9DVx5eTC4FPE
 cUWIuFhLoOR55DFn+dJUFSIL8kWC/hTaKm59fQT/3fzCDvhKpDk/7BGkGhfzd+MFJLqp
 21YA==
X-Gm-Message-State: AOAM532wbhlfe2cuHqDc/PVwaw28wpkdQR3RuFfq9hx+MW45lZzO8amn
 iAeNleQL27OM6Q7wuZhRGs42WPZm1IA=
X-Google-Smtp-Source: ABdhPJyo1F4XRRLPw6tGMsz/meaX3GLeaeQgJtsI9sCs0nMTo/jgFyPUeGd12wl28hn88NOvX3/b/A==
X-Received: by 2002:a17:90b:1c0b:: with SMTP id
 oc11mr13889481pjb.237.1639038654791; 
 Thu, 09 Dec 2021 00:30:54 -0800 (PST)
Received: from localhost (203-219-139-206.static.tpgi.com.au.
 [203.219.139.206])
 by smtp.gmail.com with ESMTPSA id l9sm6544641pfu.55.2021.12.09.00.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 00:30:54 -0800 (PST)
Date: Thu, 09 Dec 2021 18:30:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 17/18] powerpc/64s: Move hash MMU support code under
 CONFIG_PPC_64S_HASH_MMU
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20211201144153.2456614-1-npiggin@gmail.com>
 <20211201144153.2456614-18-npiggin@gmail.com>
 <87czm8o9i1.fsf@mpe.ellerman.id.au>
In-Reply-To: <87czm8o9i1.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1639038631.s3sqpbsr39.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of December 7, 2021 11:00 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>>  34 files changed, 173 insertions(+), 52 deletions(-)
>=20
>=20
> I was able to clean up some of the ifdefs a little with the changes
> below. I'll run these through some test builds and then squash them in.

Looks good to me.

Thanks,
Nick

>=20
> cheers
>=20
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc=
/include/asm/book3s/64/mmu-hash.h
> index 3004f3323144..21f780942911 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> @@ -523,8 +523,14 @@ void slb_save_contents(struct slb_entry *slb_ptr);
>  void slb_dump_contents(struct slb_entry *slb_ptr);
> =20
>  extern void slb_vmalloc_update(void);
> -extern void slb_set_size(u16 size);
>  void preload_new_slb_context(unsigned long start, unsigned long sp);
> +
> +#ifdef CONFIG_PPC_64S_HASH_MMU
> +void slb_set_size(u16 size);
> +#else
> +static inline void slb_set_size(u16 size) { }
> +#endif
> +
>  #endif /* __ASSEMBLY__ */
> =20
>  /*
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 2197404cdcc4..75678ff04dd7 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -231,10 +231,9 @@ static void __init check_cpu_pa_features(unsigned lo=
ng node)
>  		      ibm_pa_features, ARRAY_SIZE(ibm_pa_features));
>  }
> =20
> -#ifdef CONFIG_PPC_BOOK3S_64
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>  static void __init init_mmu_slb_size(unsigned long node)
>  {
> -#ifdef CONFIG_PPC_64S_HASH_MMU
>  	const __be32 *slb_size_ptr;
> =20
>  	slb_size_ptr =3D of_get_flat_dt_prop(node, "slb-size", NULL) ? :
> @@ -242,7 +241,6 @@ static void __init init_mmu_slb_size(unsigned long no=
de)
> =20
>  	if (slb_size_ptr)
>  		mmu_slb_size =3D be32_to_cpup(slb_size_ptr);
> -#endif
>  }
>  #else
>  #define init_mmu_slb_size(node) do { } while(0)
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_6=
4.c
> index 22647bb82198..703a2e6ab08d 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -886,9 +886,7 @@ void __init setup_per_cpu_areas(void)
>  		atom_size =3D SZ_1M;
>  	} else if (radix_enabled()) {
>  		atom_size =3D PAGE_SIZE;
> -	} else {
> -#ifdef CONFIG_PPC_64S_HASH_MMU
> -
> +	} else if (IS_ENABLED(CONFIG_PPC_64S_HASH_MMU)) {
>  		/*
>  		 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
>  		 * to group units.  For larger mappings, use 1M atom which
> @@ -898,9 +896,6 @@ void __init setup_per_cpu_areas(void)
>  			atom_size =3D PAGE_SIZE;
>  		else
>  			atom_size =3D SZ_1M;
> -#else
> -		BUILD_BUG(); // radix_enabled() should be constant true
> -#endif
>  	}
> =20
>  	if (pcpu_chosen_fc !=3D PCPU_FC_PAGE) {
> diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
> index 92d831621fa0..563e9989a5bf 100644
> --- a/arch/powerpc/kexec/ranges.c
> +++ b/arch/powerpc/kexec/ranges.c
> @@ -296,7 +296,7 @@ int add_initrd_mem_range(struct crash_mem **mem_range=
s)
>  	return ret;
>  }
> =20
> -#ifdef CONFIG_PPC_BOOK3S_64
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>  /**
>   * add_htab_mem_range - Adds htab range to the given memory ranges list,
>   *                      if it exists
> @@ -306,14 +306,10 @@ int add_initrd_mem_range(struct crash_mem **mem_ran=
ges)
>   */
>  int add_htab_mem_range(struct crash_mem **mem_ranges)
>  {
> -#ifdef CONFIG_PPC_64S_HASH_MMU
>  	if (!htab_address)
>  		return 0;
> =20
>  	return add_mem_range(mem_ranges, __pa(htab_address), htab_size_bytes);
> -#else
> -	return 0;
> -#endif
>  }
>  #endif
> =20
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/b=
ook3s64/radix_pgtable.c
> index 5f8cbeca8080..3c4f0ebe5df8 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -333,10 +333,8 @@ static void __init radix_init_pgtable(void)
>  	phys_addr_t start, end;
>  	u64 i;
> =20
> -#ifdef CONFIG_PPC_64S_HASH_MMU
>  	/* We don't support slb for radix */
> -	mmu_slb_size =3D 0;
> -#endif
> +	slb_set_size(0);
> =20
>  	/*
>  	 * Create the linear mapping
> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/pla=
tforms/pseries/mobility.c
> index 21b706bcea76..85033f392c78 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -484,9 +484,7 @@ static int do_suspend(void)
>  	ret =3D rtas_ibm_suspend_me(&status);
>  	if (ret !=3D 0) {
>  		pr_err("ibm,suspend-me error: %d\n", status);
> -#ifdef CONFIG_PPC_64S_HASH_MMU
>  		slb_set_size(saved_slb_size);
> -#endif
>  	}
> =20
>  	return ret;
> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/plat=
forms/pseries/pseries.h
> index 3544778e06d0..b4c63c481f33 100644
> --- a/arch/powerpc/platforms/pseries/pseries.h
> +++ b/arch/powerpc/platforms/pseries/pseries.h
> @@ -113,6 +113,11 @@ int dlpar_workqueue_init(void);
> =20
>  extern u32 pseries_security_flavor;
>  void pseries_setup_security_mitigations(void);
> +
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>  void pseries_lpar_read_hblkrm_characteristics(void);
> +#else
> +static inline void pseries_lpar_read_hblkrm_characteristics(void) { }
> +#endif
> =20
>  #endif /* _PSERIES_PSERIES_H */
> diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/pla=
tforms/pseries/reconfig.c
> index 80dae18d6621..7f7369fec46b 100644
> --- a/arch/powerpc/platforms/pseries/reconfig.c
> +++ b/arch/powerpc/platforms/pseries/reconfig.c
> @@ -337,10 +337,8 @@ static int do_update_property(char *buf, size_t bufs=
ize)
>  	if (!newprop)
>  		return -ENOMEM;
> =20
> -#ifdef CONFIG_PPC_64S_HASH_MMU
>  	if (!strcmp(name, "slb-size") || !strcmp(name, "ibm,slb-size"))
>  		slb_set_size(*(int *)value);
> -#endif
> =20
>  	return of_update_property(np, newprop);
>  }
>=20
