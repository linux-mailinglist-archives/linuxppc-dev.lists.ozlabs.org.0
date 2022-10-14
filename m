Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 108165FE642
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 02:22:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpRsd6FKyz3dwY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 11:22:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QNSCZuJw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QNSCZuJw;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpRnL1MRVz3drZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 11:18:30 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id d7-20020a17090a2a4700b0020d268b1f02so6397439pjg.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 17:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDIJWn48kFKjO3sqy6lkx58NVPV4WSOdroKiUz2sreQ=;
        b=QNSCZuJwN5AL42gQdS1sfpYmAZVEwp1f1RGVpHpIlcEa0RL8Bb8DAlEumrRC37qcvv
         yXq4OTnCzruCvofNOLKqLLr5ABtXG82V62hbyz27ffM3TiwDziNL6QAttNY2RBFs/ipT
         32qdSsGMpl1vWjprb373RGr1wTd/YH1QbC+F8FqDGXpMVRUizNBjg8c/zlqbys1ov1Kg
         CfXLPB1U0SixH/TJ7OzliMARPGEi1Q6B+QSvDiaeCA994u6brbGq6OL1JVrc3lXdKC9M
         yfkkCPmCN1A9C5c1b2SJOrrVa0+ez2gbbh5xLgCbuRN8QokBMtfCVXjDU6AR1gU1JnNz
         bL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDIJWn48kFKjO3sqy6lkx58NVPV4WSOdroKiUz2sreQ=;
        b=Ow5QTCDrP3bDY81zcoLZnFKDDqM+QyunXmQ4mnRbSNH0U4Rh8zDezmnpv3BDpiq218
         w9XQXPzHarNykmT79IoLAH0PpfF/z1p8sc+wjKJseb64cNZ3EWOZXxS0ftXpwuihXqZV
         boR71cOMaux5247ZOB6b3n2tg6/UlxihYwTKiDmHOGrEi1ZfPTlFpEMj56Jc7M4uGQtt
         sXj3ze/2Kuj2hTeZf1d9N0lrH9UB0WDxuWevAsDWjNpVrPK9Ub5nEsxyn9pCW2WskYen
         nuBrTOOsRS1aB5ZmYrlRb+7JtocZJ6Pb+WHkPeZK5DaWmkOayq16AoW3fn+eY26HpTjE
         9R7A==
X-Gm-Message-State: ACrzQf3xlsiunolx8CZA+x8aFKd0KMoXrdJKuny4ETW8t0UynUJ+ZgFt
	0ZHakF6g9gfbFAePsilDXsY=
X-Google-Smtp-Source: AMsMyM7HaiEUvQCLp8PzDv6kOrtRarsZlSpWYW6/Dy5Sb8luGCXv5vjiKANxQTDLVxJUsx3t5hqh8g==
X-Received: by 2002:a17:90b:4a11:b0:20d:382d:3994 with SMTP id kk17-20020a17090b4a1100b0020d382d3994mr2543489pjb.173.1665706707951;
        Thu, 13 Oct 2022 17:18:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g186-20020a6252c3000000b0055f98a2c64bsm279035pfb.142.2022.10.13.17.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 17:18:27 -0700 (PDT)
Date: Thu, 13 Oct 2022 17:18:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc/64s: make HPTE lock and native_tlbie_lock
 irq-safe
Message-ID: <20221014001826.GE412544@roeck-us.net>
References: <20221013230710.1987253-1-npiggin@gmail.com>
 <20221013230710.1987253-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013230710.1987253-2-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 14, 2022 at 09:07:09AM +1000, Nicholas Piggin wrote:
> With kfence enabled, there are several cases where HPTE and TLBIE locks
> are called from softirq context, for example:
> 
>   WARNING: inconsistent lock state
>   6.0.0-11845-g0cbbc95b12ac #1 Tainted: G                 N
>   --------------------------------
>   inconsistent {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage.
>   swapper/0/1 [HC0[0]:SC0[0]:HE1:SE1] takes:
>   c000000002734de8 (native_tlbie_lock){+.?.}-{2:2}, at: .native_hpte_updateboltedpp+0x1a4/0x600
>   {IN-SOFTIRQ-W} state was registered at:
>     .lock_acquire+0x20c/0x520
>     ._raw_spin_lock+0x4c/0x70
>     .native_hpte_invalidate+0x62c/0x840
>     .hash__kernel_map_pages+0x450/0x640
>     .kfence_protect+0x58/0xc0
>     .kfence_guarded_free+0x374/0x5a0
>     .__slab_free+0x3d0/0x630
>     .put_cred_rcu+0xcc/0x120
>     .rcu_core+0x3c4/0x14e0
>     .__do_softirq+0x1dc/0x7dc
>     .do_softirq_own_stack+0x40/0x60
> 
> Fix this by consistently disabling irqs while taking either of these
> locks. Don't just disable bh because several of the more common cases
> already disable irqs, so this just makes the locks always irq-safe.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/powerpc/mm/book3s64/hash_native.c | 27 ++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
> index 02d0c210a1ce..065f9c542a63 100644
> --- a/arch/powerpc/mm/book3s64/hash_native.c
> +++ b/arch/powerpc/mm/book3s64/hash_native.c
> @@ -268,8 +268,11 @@ static long native_hpte_insert(unsigned long hpte_group, unsigned long vpn,
>  {
>  	struct hash_pte *hptep = htab_address + hpte_group;
>  	unsigned long hpte_v, hpte_r;
> +	unsigned long flags;
>  	int i;
>  
> +	local_irq_save(flags);
> +
>  	if (!(vflags & HPTE_V_BOLTED)) {
>  		DBG_LOW("    insert(group=%lx, vpn=%016lx, pa=%016lx,"
>  			" rflags=%lx, vflags=%lx, psize=%d)\n",
> @@ -288,8 +291,10 @@ static long native_hpte_insert(unsigned long hpte_group, unsigned long vpn,
>  		hptep++;
>  	}
>  
> -	if (i == HPTES_PER_GROUP)
> +	if (i == HPTES_PER_GROUP) {
> +		local_irq_restore(flags);
>  		return -1;
> +	}
>  
>  	hpte_v = hpte_encode_v(vpn, psize, apsize, ssize) | vflags | HPTE_V_VALID;
>  	hpte_r = hpte_encode_r(pa, psize, apsize) | rflags;
> @@ -304,7 +309,6 @@ static long native_hpte_insert(unsigned long hpte_group, unsigned long vpn,
>  		hpte_v = hpte_old_to_new_v(hpte_v);
>  	}
>  
> -	release_hpte_lock();
>  	hptep->r = cpu_to_be64(hpte_r);
>  	/* Guarantee the second dword is visible before the valid bit */
>  	eieio();
> @@ -312,10 +316,13 @@ static long native_hpte_insert(unsigned long hpte_group, unsigned long vpn,
>  	 * Now set the first dword including the valid bit
>  	 * NOTE: this also unlocks the hpte
>  	 */
> +	release_hpte_lock();
>  	hptep->v = cpu_to_be64(hpte_v);
>  
>  	__asm__ __volatile__ ("ptesync" : : : "memory");
>  
> +	local_irq_restore(flags);
> +
>  	return i | (!!(vflags & HPTE_V_SECONDARY) << 3);
>  }
>  
> @@ -366,6 +373,9 @@ static long native_hpte_updatepp(unsigned long slot, unsigned long newpp,
>  	struct hash_pte *hptep = htab_address + slot;
>  	unsigned long hpte_v, want_v;
>  	int ret = 0, local = 0;
> +	unsigned long irqflags;
> +
> +	local_irq_save(irqflags);
>  
>  	want_v = hpte_encode_avpn(vpn, bpsize, ssize);
>  
> @@ -409,6 +419,8 @@ static long native_hpte_updatepp(unsigned long slot, unsigned long newpp,
>  	if (!(flags & HPTE_NOHPTE_UPDATE))
>  		tlbie(vpn, bpsize, apsize, ssize, local);
>  
> +	local_irq_restore(irqflags);
> +
>  	return ret;
>  }
>  
> @@ -472,6 +484,9 @@ static void native_hpte_updateboltedpp(unsigned long newpp, unsigned long ea,
>  	unsigned long vsid;
>  	long slot;
>  	struct hash_pte *hptep;
> +	unsigned long flags;
> +
> +	local_irq_save(flags);
>  
>  	vsid = get_kernel_vsid(ea, ssize);
>  	vpn = hpt_vpn(ea, vsid, ssize);
> @@ -490,6 +505,8 @@ static void native_hpte_updateboltedpp(unsigned long newpp, unsigned long ea,
>  	 * actual page size will be same.
>  	 */
>  	tlbie(vpn, psize, psize, ssize, 0);
> +
> +	local_irq_restore(flags);
>  }
>  
>  /*
> @@ -503,6 +520,9 @@ static int native_hpte_removebolted(unsigned long ea, int psize, int ssize)
>  	unsigned long vsid;
>  	long slot;
>  	struct hash_pte *hptep;
> +	unsigned long flags;
> +
> +	local_irq_save(flags);
>  
>  	vsid = get_kernel_vsid(ea, ssize);
>  	vpn = hpt_vpn(ea, vsid, ssize);
> @@ -520,6 +540,9 @@ static int native_hpte_removebolted(unsigned long ea, int psize, int ssize)
>  
>  	/* Invalidate the TLB */
>  	tlbie(vpn, psize, psize, ssize, 0);
> +
> +	local_irq_restore(flags);
> +
>  	return 0;
>  }
>  
> -- 
> 2.37.2
> 
