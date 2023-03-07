Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 141956AD6A9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:06:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PW3Ld6Ggmz3cMb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 16:06:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WkCNp7TS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WkCNp7TS;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PW3Kg4SmCz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 16:05:09 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id q31-20020a17090a17a200b0023750b69614so10817362pja.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 21:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678165506;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAr/4rZLY/xW2VZEGvfJ9vcha1fPxJBixn7intPRfv8=;
        b=WkCNp7TSaFq1NkStkRRYZf/7HaSOKOYxyg90uy+CWLTCGTo10DoEcaclgmrNVAmQGd
         F0eYRS9Ept+4HdVgZ/Udc7Mu4on10dxvK4uMzKcKkSzWyei6ehYoG3+3UgQX2WiH3h7j
         99T54plxLO+Yitet0Tq/GTHLecJfBjZQOTS2rX6j6uzXLTDJ1y/E+GMvjSx8L8uRBA/k
         iokVfgi5827693E05NqR7ZGq7U+qB+N7fajZDPRhRKk8ZrfkY/T1ifewq0t3i9Vv/T5y
         djXx8rqtqpmGopvsJlT5n9nMYZP7HTFXeU0FpwYbgD/dXmdN7CrqyVA9y1kuTuItMv5h
         Lw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678165506;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fAr/4rZLY/xW2VZEGvfJ9vcha1fPxJBixn7intPRfv8=;
        b=0WzH7svqKleEvxe8uanpf/mXPcl7w/pHzeoUhmlnrtAkFvj/fHVoo93l/r6wOycSgQ
         nsGFI+e+7P2AZZbnBWtdvz00eZNHQiKEuz/en3DyCVIIY5VWrzG/aMZRSe+3CD+h1TA6
         EgrG2AU+iXCgGpUfokZnmTHhKJU9XeDDpymXyxdsIVTD/ld08MnewoW1srf6865aaSuD
         1Lxdz3pPxdfB4ZOQ38TzXBxJsMboaEsmt/w2hXDCCEfEY5FbZuF96kG8iAKChly9DFLt
         ztKaIkXhxH0IzR16/wCDDQ0O2QLt/leKVezBBvV+EvoGn96xnX5U4krzFUT2nYB+t3QR
         2MpQ==
X-Gm-Message-State: AO0yUKVBO4b9MOElKT/46lMTgKaTUyez6kac7j8ZMinrd33OuuaYsOyv
	f531jryNsG6yndWuh46MEgo=
X-Google-Smtp-Source: AK7set9xG2nILH4DDb0/bsgn5KroT2orbcWVxChMuR5XTi8NyBVoYfcVbAvq+8KCW1mCDCO4Kv/knw==
X-Received: by 2002:a17:903:1d1:b0:19e:6947:3b27 with SMTP id e17-20020a17090301d100b0019e69473b27mr17886346plh.58.1678165506568;
        Mon, 06 Mar 2023 21:05:06 -0800 (PST)
Received: from localhost ([203.220.77.23])
        by smtp.gmail.com with ESMTPSA id e7-20020a170902cf4700b0019adfb96084sm7550173plg.36.2023.03.06.21.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 21:05:05 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Mar 2023 15:05:01 +1000
Message-Id: <CQZW0SBFI6QM.3FW6O6LJ0PVS1@bobo>
Subject: Re: [RFC PATCH 04/13] powerpc/dexcr: Support userspace ROP
 protection
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Benjamin Gray" <bgray@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20221128024458.46121-1-bgray@linux.ibm.com>
 <20221128024458.46121-5-bgray@linux.ibm.com>
In-Reply-To: <20221128024458.46121-5-bgray@linux.ibm.com>
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
Cc: linux-hardening@vger.kernel.org, ajd@linux.ibm.com, cmr@bluescreens.de, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Nov 28, 2022 at 12:44 PM AEST, Benjamin Gray wrote:
> The ISA 3.1B hashst and hashchk instructions use a per-cpu SPR HASHKEYR
> to hold a key used in the hash calculation. This key should be different
> for each process to make it harder for a malicious process to recreate
> valid hash values for a victim process.
>
> Add support for storing a per-thread hash key, and setting/clearing
> HASHKEYR appropriately.
>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/kexec.h |  3 +++
>  arch/powerpc/include/asm/processor.h       |  1 +
>  arch/powerpc/include/asm/reg.h             |  1 +
>  arch/powerpc/kernel/process.c              | 12 ++++++++++++
>  4 files changed, 17 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/kexec.h b/arch/powerpc/in=
clude/asm/book3s/64/kexec.h
> index 563baf94a962..163de935df28 100644
> --- a/arch/powerpc/include/asm/book3s/64/kexec.h
> +++ b/arch/powerpc/include/asm/book3s/64/kexec.h
> @@ -24,6 +24,9 @@ static inline void reset_sprs(void)
>  	if (cpu_has_feature(CPU_FTR_ARCH_31))
>  		mtspr(SPRN_DEXCR, 0);
> =20
> +	if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE))
> +		mtspr(SPRN_HASHKEYR, 0);
> +
>  	/*  Do we need isync()? We are going via a kexec reset */
>  	isync();
>  }
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/=
asm/processor.h
> index c17ec1e44c86..2381217c95dc 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -264,6 +264,7 @@ struct thread_struct {
>  	unsigned long   mmcr3;
>  	unsigned long   sier2;
>  	unsigned long   sier3;
> +	unsigned long	hashkeyr;
> =20
>  #endif
>  };
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/re=
g.h
> index cdd1f174c399..854664cf844f 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -384,6 +384,7 @@
>  #define SPRN_HRMOR	0x139	/* Real mode offset register */
>  #define SPRN_HSRR0	0x13A	/* Hypervisor Save/Restore 0 */
>  #define SPRN_HSRR1	0x13B	/* Hypervisor Save/Restore 1 */
> +#define SPRN_HASHKEYR	0x1D4	/* Non-privileged hashst/hashchk key registe=
r */
>  #define SPRN_ASDR	0x330	/* Access segment descriptor register */
>  #define SPRN_DEXCR	0x33C	/* Dynamic execution control register */
>  #define   DEXCR_PRO_MASK(aspect)	__MASK(63 - (32 + (aspect)))	/* Aspect =
number to problem state aspect mask */
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.=
c
> index 17d26f652b80..4d7b0c7641d0 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1229,6 +1229,9 @@ static inline void restore_sprs(struct thread_struc=
t *old_thread,
>  	    old_thread->tidr !=3D new_thread->tidr)
>  		mtspr(SPRN_TIDR, new_thread->tidr);
> =20
> +	if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE))
> +		mtspr(SPRN_HASHKEYR, new_thread->hashkeyr);

I wonder if we'd want to avoid switching it when switching to kernel
threads, and from kernel thread back to the same user thread. Might
want to optimise it to do that in future but for an initial enablement
patch this is okay.

> +
>  	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>  		unsigned long new_dexcr =3D get_thread_dexcr(new_thread);
> =20
> @@ -1818,6 +1821,10 @@ int copy_thread(struct task_struct *p, const struc=
t kernel_clone_args *args)
>  		childregs->ppr =3D DEFAULT_PPR;
> =20
>  	p->thread.tidr =3D 0;
> +#endif
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE))
> +		p->thread.hashkeyr =3D current->thread.hashkeyr;
>  #endif

Similar comment about your accessor style, if we had get/set_thread_hashkey=
r()
functions then no ifdef required.

I think it is not quite per-process? I don't actually know how the user
toolchain side is put together, but I'm thinking we can not give it a new
salt on fork(), but we could on exec(). I think we could actually give
each thread their own salt within a process too, right?

I don't know off the top of my head whether that can be translated into
a simple test at the copy_thread level. For now you're giving out a new
salt on exec I think, which should be fine at least to start with.

Thanks,
Nick

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>  	/*
>  	 * Run with the current AMR value of the kernel
> @@ -1947,6 +1954,11 @@ void start_thread(struct pt_regs *regs, unsigned l=
ong start, unsigned long sp)
>  	current->thread.load_tm =3D 0;
>  #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
>  #ifdef CONFIG_PPC_BOOK3S_64
> +	if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE)) {
> +		current->thread.hashkeyr =3D get_random_long();
> +		mtspr(SPRN_HASHKEYR, current->thread.hashkeyr);
> +	}
> +
>  	if (cpu_has_feature(CPU_FTR_ARCH_31))
>  		mtspr(SPRN_DEXCR, get_thread_dexcr(&current->thread));
>  #endif /* CONFIG_PPC_BOOK3S_64 */
> --=20
> 2.38.1

