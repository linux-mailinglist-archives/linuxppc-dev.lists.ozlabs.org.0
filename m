Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 511A63C5DF8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 16:08:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNlww1Nfmz3blC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 00:08:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=q4lmagBX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q4lmagBX; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNlwH3lHJz30Gv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 00:07:58 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 62so18389175pgf.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 07:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=FgUjJS+liPV7E6DIWjQh4VsfMeSfWIFGDk8agHLk9DM=;
 b=q4lmagBX68tpTVehF/hplEYK7SUYbTRnkiSPakVLf1Wb8ionHkJ3JUgPkIhIc/+2Wo
 W8cOc3tri76WaK2bDSQes5RIHipCxRLEWrcrEmRsgctgXH8tCC4/1YzYCa5gKMyglFh7
 65E1bnFz71uDP23yZVC7a4d23bRjmJIt/G1empeBAkqmOTTt1XqweRdG5nxq7eBKGdVW
 KoXTrBIu/3F6jJQryBxCaswksOehAaqvdEk+UZd9gWkHNK5835BUy6NXx4IopUyFpJ29
 E2uWLXVk56CWDKOrbZsAh+kUi6NP9PFCCBV4ISBQwGiD+A/VHqOa6h+tGE6V0D4M6Lqy
 a1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=FgUjJS+liPV7E6DIWjQh4VsfMeSfWIFGDk8agHLk9DM=;
 b=qVRntXCAmAdlS/rGtif6BQq7WtrIJ7/2HyIIESfC9/BBWcXkyQwyRsFleiqjEfaObL
 fiFCC/oIMIoiZFJjtV+NB1JSfLOtk9r+HydSSTiGBRWaWfXw1gpI7IjO1nojV7DE6dNF
 mESARWUI9JpepoFykknZ5Nl0+SIaFnlIqDMrKmGckLpZVERtkI192dlqtusTXaTUmsYf
 GrQHR4gPpTAFRdBr2UWKPOJEOrYru1T7SsCdg58/88i93hKPek5ZBV0C2uGb/YKFQrbW
 y9qR+2L1fkGk9QsDivwcCXDPKPR1fCqdMvX1QD6KicDiyrzFajyQEOcOwlacVOj4eMTL
 8g2A==
X-Gm-Message-State: AOAM533ZIDsLx8QFkxEN063AjXURG4SWvJKZvV5uuaI3VnIOJIYB66yE
 +QvRJoBTG976X35P9/9z8w4+k+9vMfs=
X-Google-Smtp-Source: ABdhPJynRXfXlbL11L7R6tBzkunQX2zBbgOKGTav1PVDG7DgDnM8WkdZsFQSexp24OjbyjKDqyofqg==
X-Received: by 2002:a63:1a12:: with SMTP id a18mr31223847pga.269.1626098873016; 
 Mon, 12 Jul 2021 07:07:53 -0700 (PDT)
Received: from localhost (203-219-181-43.static.tpgi.com.au. [203.219.181.43])
 by smtp.gmail.com with ESMTPSA id
 i8sm17384338pjh.36.2021.07.12.07.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 07:07:52 -0700 (PDT)
Date: Tue, 13 Jul 2021 00:07:46 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/hash: Fix SLB preload cache vs kthread_use_mm
To: linuxppc-dev@lists.ozlabs.org
References: <20210708090549.77975-1-npiggin@gmail.com>
In-Reply-To: <20210708090549.77975-1-npiggin@gmail.com>
MIME-Version: 1.0
Message-Id: <1626098505.b2zofm328v.astroid@bobo.none>
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
Cc: "Christopher M . Riedl" <cmr@codefail.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of July 8, 2021 7:05 pm:
> It's possible for kernel threads to pick up SLB preload entries if
> they are accessing userspace with kthread_use_mm. If the kthread
> later is context switched while using a different mm, when it is
> switched back it could preload SLBs belonging to the previous mm.
>=20
> This could lead to data corruption, leaks, SLB multi hits, etc.
>=20
> In the absence of a usable hook to clear preloads when unusing an
> mm, fix it by keeping track of the mm that the preloads belong to.
>=20
> Adjust the isync() comment to be clear it can't be skipped if we
> had no preloads.

I should note that this patch is wrong, and so I withdraw it. The
supposed bug is not actually a bug, because the SLB preload only
records the ESID/EA to preload, not the VA.

So this cross-mm "leak" can happen, but the worst it will do is
preload some addresses used in the previous mm that are not likely to
be accessed in the new mm.

There is an idea that this is the "correct" thing to be doing as
performance goes, but on the other hand it should be pretty rare to
happen so it may not be worth the extra logic. At least it should be
submitted as a performance thing not bugfix if we did do it.

Thanks,
Nick

>=20
> Fixes: 5434ae74629a ("powerpc/64s/hash: Add a SLB preload cache")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/thread_info.h |  1 +
>  arch/powerpc/mm/book3s64/slb.c         | 36 ++++++++++++++++++--------
>  2 files changed, 26 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/includ=
e/asm/thread_info.h
> index b4ec6c7dd72e..c3de13dde2af 100644
> --- a/arch/powerpc/include/asm/thread_info.h
> +++ b/arch/powerpc/include/asm/thread_info.h
> @@ -54,6 +54,7 @@ struct thread_info {
>  #if defined(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) && defined(CONFIG_PPC32)
>  	struct cpu_accounting_data accounting;
>  #endif
> +	struct mm_struct *slb_preload_mm;
>  	unsigned char slb_preload_nr;
>  	unsigned char slb_preload_tail;
>  	u32 slb_preload_esid[SLB_PRELOAD_NR];
> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/sl=
b.c
> index c91bd85eb90e..4f9dbce0dd84 100644
> --- a/arch/powerpc/mm/book3s64/slb.c
> +++ b/arch/powerpc/mm/book3s64/slb.c
> @@ -294,11 +294,20 @@ static bool preload_hit(struct thread_info *ti, uns=
igned long esid)
>  	return false;
>  }
> =20
> -static bool preload_add(struct thread_info *ti, unsigned long ea)
> +static bool preload_add(struct thread_info *ti, struct mm_struct *mm, un=
signed long ea)
>  {
>  	unsigned char idx;
>  	unsigned long esid;
> =20
> +	if (unlikely(ti->slb_preload_mm !=3D mm)) {
> +		/*
> +		 * kthread_use_mm or other temporary mm switching can
> +		 * change the mm being used by a particular thread.
> +		 */
> +		ti->slb_preload_nr =3D 0;
> +		ti->slb_preload_mm =3D mm;
> +	}
> +
>  	if (mmu_has_feature(MMU_FTR_1T_SEGMENT)) {
>  		/* EAs are stored >> 28 so 256MB segments don't need clearing */
>  		if (ea & ESID_MASK_1T)
> @@ -362,13 +371,13 @@ void slb_setup_new_exec(void)
>  	 * 0x10000000 so it makes sense to preload this segment.
>  	 */
>  	if (!is_kernel_addr(exec)) {
> -		if (preload_add(ti, exec))
> +		if (preload_add(ti, mm, exec))
>  			slb_allocate_user(mm, exec);
>  	}
> =20
>  	/* Libraries and mmaps. */
>  	if (!is_kernel_addr(mm->mmap_base)) {
> -		if (preload_add(ti, mm->mmap_base))
> +		if (preload_add(ti, mm, mm->mmap_base))
>  			slb_allocate_user(mm, mm->mmap_base);
>  	}
> =20
> @@ -394,19 +403,19 @@ void preload_new_slb_context(unsigned long start, u=
nsigned long sp)
> =20
>  	/* Userspace entry address. */
>  	if (!is_kernel_addr(start)) {
> -		if (preload_add(ti, start))
> +		if (preload_add(ti, mm, start))
>  			slb_allocate_user(mm, start);
>  	}
> =20
>  	/* Top of stack, grows down. */
>  	if (!is_kernel_addr(sp)) {
> -		if (preload_add(ti, sp))
> +		if (preload_add(ti, mm, sp))
>  			slb_allocate_user(mm, sp);
>  	}
> =20
>  	/* Bottom of heap, grows up. */
>  	if (heap && !is_kernel_addr(heap)) {
> -		if (preload_add(ti, heap))
> +		if (preload_add(ti, mm, heap))
>  			slb_allocate_user(mm, heap);
>  	}
> =20
> @@ -502,6 +511,11 @@ void switch_slb(struct task_struct *tsk, struct mm_s=
truct *mm)
> =20
>  	copy_mm_to_paca(mm);
> =20
> +	if (unlikely(ti->slb_preload_mm !=3D mm)) {
> +		ti->slb_preload_nr =3D 0;
> +		ti->slb_preload_mm =3D mm;
> +	}
> +
>  	/*
>  	 * We gradually age out SLBs after a number of context switches to
>  	 * reduce reload overhead of unused entries (like we do with FP/VEC
> @@ -513,7 +527,7 @@ void switch_slb(struct task_struct *tsk, struct mm_st=
ruct *mm)
>  		unsigned long pc =3D KSTK_EIP(tsk);
> =20
>  		preload_age(ti);
> -		preload_add(ti, pc);
> +		preload_add(ti, mm, pc);
>  	}
> =20
>  	for (i =3D 0; i < ti->slb_preload_nr; i++) {
> @@ -527,9 +541,9 @@ void switch_slb(struct task_struct *tsk, struct mm_st=
ruct *mm)
>  	}
> =20
>  	/*
> -	 * Synchronize slbmte preloads with possible subsequent user memory
> -	 * address accesses by the kernel (user mode won't happen until
> -	 * rfid, which is safe).
> +	 * Synchronize slbias and slbmte preloads with possible subsequent user
> +	 * memory address accesses by the kernel (user mode won't happen until
> +	 * rfid, which is synchronizing).
>  	 */
>  	isync();
>  }
> @@ -863,7 +877,7 @@ DEFINE_INTERRUPT_HANDLER_RAW(do_slb_fault)
> =20
>  		err =3D slb_allocate_user(mm, ea);
>  		if (!err)
> -			preload_add(current_thread_info(), ea);
> +			preload_add(current_thread_info(), mm, ea);
> =20
>  		return err;
>  	}
> --=20
> 2.23.0
>=20
>=20
