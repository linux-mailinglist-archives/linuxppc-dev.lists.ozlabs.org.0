Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB9160FA9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 11:47:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gn1t6597zDqQG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 19:47:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LUYVICyP"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gn014XcdzDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 19:45:53 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id c14so5723458plo.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Jul 2019 02:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=7xT24UfwrEfDSfF/4qGfxxl7ud3opuDh5Fp56woX7VE=;
 b=LUYVICyPL8UZGvWNF1fWtfNuxc1ptuDDzwZQfmr3puRoLqHwXrXBnm8iTn7cHaA7dQ
 gh/CQ6wnG5NJ+FvAjL1tCE1DFuvbwYXyy9AYnxnUOYa08CN2ds9u0qL1Ty+Doq1WgLa2
 jeyPM7pIlScUBluXKilG8K87j6euuV14bPRD3xuZB1RJGqfk7tpyhA8FbqSugo0l6r0a
 WbrunMz/p8Fcad62tr1gcoVTIafskJeI7pkSd3NKxpJ9Bfj4qM5eRuOV1AIa8cD+ieRc
 xnAKHhZvgx9fJCusW2G4VyKEUQ/fYjw8LJBC9BGp5XopZDD6aK7GE9a35PT2k0cEXp0a
 HjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=7xT24UfwrEfDSfF/4qGfxxl7ud3opuDh5Fp56woX7VE=;
 b=ERWB4xDzXgikL30tlJs54Rc1hT3ucJcxE2HE0O6EkWdJ73VSyP/DBt9ngTxHyGChQ8
 txACW4BHe6b/LqMmfdDpmF5fwNNaFddO2+5t4koCnaggeVyuRalyvdypxtltZsHoTJo2
 GGMKPTDbkmowMoiNpVyVgEMuulIui4otfiiVNuwlhmhQi/FtH0xOSH5LkbuefcRQAN6K
 fK9m419eWiG51u0z0OGn5Xiyg7qUlFlr78rGuLU2wA9J/o0Evif7Ukzq7fKqpQU6ER/f
 EWbY5RBZXKQHR5UYNwEiFSHJahqtM+kOoFIPhrNVoFn730nCH3rEU6+jBDDmqrDJDc92
 NDCA==
X-Gm-Message-State: APjAAAU7HsjljUxVL4jSu2giaTJYcmNQC1zcK+/OWXfk33WLJMLJ3vtX
 WAoA8900yL7MvkZ8bvQ2+PGRo5O3
X-Google-Smtp-Source: APXvYqyNmUPv7QsJjfy+8hjfBuhGVGLL3Pr/aMC/SBPZ8Q0PM9yZ22IObjvx4EGGNGYJV2O+M2mx4Q==
X-Received: by 2002:a17:902:be0a:: with SMTP id
 r10mr10052000pls.51.1562406348958; 
 Sat, 06 Jul 2019 02:45:48 -0700 (PDT)
Received: from localhost (193-116-72-119.tpgi.com.au. [193.116.72.119])
 by smtp.gmail.com with ESMTPSA id d14sm21638385pfo.154.2019.07.06.02.45.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 06 Jul 2019 02:45:48 -0700 (PDT)
Date: Sat, 06 Jul 2019 19:44:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [v3 2/7] powerpc/mce: Bug fixes for MCE handling in kernel space
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Santosh Sivaraj
 <santosh@fossix.org>
References: <20190705212647.21750-1-santosh@fossix.org>
 <20190705212647.21750-3-santosh@fossix.org>
In-Reply-To: <20190705212647.21750-3-santosh@fossix.org>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562390372.4seub6x2xm.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Santosh Sivaraj's on July 6, 2019 7:26 am:
> From: Balbir Singh <bsingharora@gmail.com>
>=20
> The code currently assumes PAGE_SHIFT as the shift value of
> the pfn,

This comment doesn't really make sense on its own. Linux pfns
are always units of page shift, so if it's not that then it's
not a pfn.

I think you want the information from the last paragraph up the
here because that explains exactly what the problem is.

> this works correctly (mostly) for user space pages,
> but the correct thing to do is
>=20
> 1. Extract the shift value returned via the pte-walk API's
> 2. Use the shift value to access the instruction address.
>=20
> Note, the final physical address still use PAGE_SHIFT for
> computation. handle_ierror() is not modified and handle_derror()
> is modified just for extracting the correct instruction
> address.
>=20
> This is largely due to __find_linux_pte() returning pfn's
> shifted by pdshift. The code is much more generic and can
> handle shift values returned.
>=20
> Fixes: ba41e1e1ccb9 ("powerpc/mce: Hookup derror (load/store) UE errors")
>=20
> Signed-off-by: Balbir Singh <bsingharora@gmail.com>
> [arbab@linux.ibm.com: Fixup pseries_do_memory_failure()]
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> ---
>  arch/powerpc/include/asm/mce.h       |  3 ++-
>  arch/powerpc/kernel/mce_power.c      | 26 ++++++++++++++++----------
>  arch/powerpc/platforms/pseries/ras.c |  6 ++++--
>  3 files changed, 22 insertions(+), 13 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mc=
e.h
> index a4c6a74ad2fb..94888a7025b3 100644
> --- a/arch/powerpc/include/asm/mce.h
> +++ b/arch/powerpc/include/asm/mce.h
> @@ -209,7 +209,8 @@ extern void release_mce_event(void);
>  extern void machine_check_queue_event(void);
>  extern void machine_check_print_event_info(struct machine_check_event *e=
vt,
>  					   bool user_mode, bool in_guest);
> -unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
> +unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr,
> +			  unsigned int *shift);
>  #ifdef CONFIG_PPC_BOOK3S_64
>  void flush_and_reload_slb(void);
>  #endif /* CONFIG_PPC_BOOK3S_64 */
> diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_po=
wer.c
> index e39536aad30d..04666c0b40a8 100644
> --- a/arch/powerpc/kernel/mce_power.c
> +++ b/arch/powerpc/kernel/mce_power.c
> @@ -23,7 +23,8 @@
>   * Convert an address related to an mm to a PFN. NOTE: we are in real
>   * mode, we could potentially race with page table updates.
>   */
> -unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
> +unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr,
> +			  unsigned int *shift)
>  {
>  	pte_t *ptep;
>  	unsigned long flags;

addr_to_pfn is too generic a name for what it does I think. I would
call it ppc_addr_to_pfn maybe. But it has other weirdness too, it's
assuming the kernel can't fault on user addresses AFAIKS.

> @@ -36,13 +37,15 @@ unsigned long addr_to_pfn(struct pt_regs *regs, unsig=
ned long addr)
> =20
>  	local_irq_save(flags);
>  	if (mm =3D=3D current->mm)
> -		ptep =3D find_current_mm_pte(mm->pgd, addr, NULL, NULL);
> +		ptep =3D find_current_mm_pte(mm->pgd, addr, NULL, shift);
>  	else
> -		ptep =3D find_init_mm_pte(addr, NULL);
> +		ptep =3D find_init_mm_pte(addr, shift);
>  	local_irq_restore(flags);
>  	if (!ptep || pte_special(*ptep))
>  		return ULONG_MAX;
> -	return pte_pfn(*ptep);
> +	if (!*shift)
> +		*shift =3D PAGE_SHIFT;
> +	return (pte_val(*ptep) & PTE_RPN_MASK) >> *shift;
>  }
> =20
>  /* flush SLBs and reload */

AFAIKS moving this weirdness into the callers is pointles, fix it up
into a proper Linux pfn in addr_to_pfn.

The duplication and divergence of machine check code between powernv
and pseries is bad, I'm looking through it and from start to end it's
trying to do basically the same thing in slightly different ways, and
we're still got a lot of bugs. I wonder if we shouldn't try to fix it
all and merge them to a single implementation...

Actually your code does not touch the core of it too significantly so
it looks like we don't have to delay your stuff in order to do that.

This is a good fix though, it should go as a fix at the top of the
series.

Thanks,
Nick
=
