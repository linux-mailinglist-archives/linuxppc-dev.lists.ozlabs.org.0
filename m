Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D98AF926AE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 16:27:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bx8x3vM6zDqkG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 00:27:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gkcgg1MN"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bx3K2c3yzDqLV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 00:22:53 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id l21so1321712pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=3wjOzGQNPWx5hJUDuR8UJf29mkLp+KcC5RiCEx0shsw=;
 b=Gkcgg1MNphiD0OdXHe5ZUf+cNOeIc6wntYnShpZa0sVFlcfWgJhoUMECT1paI/2iuV
 7SpiJI+5/xSWmsGN6qIxbP2k3i6dmzbo+G21BaKf9CQo12CwhR8xJdrF6+GOpYdKXmVf
 Nur4YrSil4vn7qW5wBxAdOQZTBuF0uer8BPGLzyJzdxU2y0eOXEaeMfSmdGrlopzpv0q
 uahO49/dFHhdbb4cDeaUd95T//4dTYBcdePBGJMjil6Kvcs1AX2o+2OOb7vBZCFhuxV7
 e51AWLPV3OyAt+n0+2KVNPxeF2GwamjIBNdhjS6trEwJELOSU9ouoak1B5tfK2EBEVQD
 yUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=3wjOzGQNPWx5hJUDuR8UJf29mkLp+KcC5RiCEx0shsw=;
 b=BvMVaL6wMw4e4pHzHWIdmkwUeJ1bYdeDNWFWNj07+yDA5M2p3K4HZSfnKlELizdfWx
 L3eoxrY5cMMxxLriIfr3e73FaY2wMIH9Acib0MeVk7+jzNKeH0O1btlo90bMd0o0ysVS
 lfXz/DdY18uHmFFiFrBCoPJJze6JmrVI+bwabZZ9vvLiv0IdkuamT1sIjI7ZA+n7TRX3
 kR/5ZAA/3vErZClKzV5qyTs9Ce4w11X6O9k5MeeYItExi17AILeIN12KTJqFO7Y+RxhC
 ufJyemaEdW6Udentac9om0jxM9atSr9a9CnwMsMoV1uN6bvxgCJq/PTGqBicBe+nblvS
 Ra+A==
X-Gm-Message-State: APjAAAW/8C5mOgLUUme7gXjzNgz9jxBZ5tI3hVEAHyE6oJCzZD7iLHJn
 mtTG8la/ocGGxaJDMD/bv/Y=
X-Google-Smtp-Source: APXvYqyY+WG+trRnzIYQKoCIFr8WypsQIFbT6mqQRHM2hURnBXqN/Ma8PD7nsC4poTemzGyOPwvjKQ==
X-Received: by 2002:a17:90a:b115:: with SMTP id
 z21mr20985896pjq.79.1566224567473; 
 Mon, 19 Aug 2019 07:22:47 -0700 (PDT)
Received: from localhost (193-116-95-121.tpgi.com.au. [193.116.95.121])
 by smtp.gmail.com with ESMTPSA id o3sm22833492pje.1.2019.08.19.07.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 07:22:46 -0700 (PDT)
Date: Tue, 20 Aug 2019 00:22:35 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v10 2/7] powerpc/mce: Fix MCE handling for huge pages
To: Linux Kernel <linux-kernel@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, Santosh Sivaraj <santosh@fossix.org>
References: <20190815003941.18655-1-santosh@fossix.org>
 <20190815003941.18655-3-santosh@fossix.org>
In-Reply-To: <20190815003941.18655-3-santosh@fossix.org>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566223931.kpuwkor3n7.astroid@bobo.none>
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
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, stable@vger.kernel.org,
 Chandan Rajendra <chandan@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Santosh Sivaraj's on August 15, 2019 10:39 am:
> From: Balbir Singh <bsingharora@gmail.com>
>=20
> The current code would fail on huge pages addresses, since the shift woul=
d
> be incorrect. Use the correct page shift value returned by
> __find_linux_pte() to get the correct physical address. The code is more
> generic and can handle both regular and compound pages.
>=20
> Fixes: ba41e1e1ccb9 ("powerpc/mce: Hookup derror (load/store) UE errors")
> Signed-off-by: Balbir Singh <bsingharora@gmail.com>
> [arbab@linux.ibm.com: Fixup pseries_do_memory_failure()]
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> Co-developed-by: Santosh Sivaraj <santosh@fossix.org>
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> Tested-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
> Cc: stable@vger.kernel.org # v4.15+
> ---
>  arch/powerpc/include/asm/mce.h       |  2 +-
>  arch/powerpc/kernel/mce_power.c      | 55 ++++++++++++++--------------
>  arch/powerpc/platforms/pseries/ras.c |  9 ++---
>  3 files changed, 32 insertions(+), 34 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mc=
e.h
> index a4c6a74ad2fb..f3a6036b6bc0 100644
> --- a/arch/powerpc/include/asm/mce.h
> +++ b/arch/powerpc/include/asm/mce.h
> @@ -209,7 +209,7 @@ extern void release_mce_event(void);
>  extern void machine_check_queue_event(void);
>  extern void machine_check_print_event_info(struct machine_check_event *e=
vt,
>  					   bool user_mode, bool in_guest);
> -unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
> +unsigned long addr_to_phys(struct pt_regs *regs, unsigned long addr);
>  #ifdef CONFIG_PPC_BOOK3S_64
>  void flush_and_reload_slb(void);
>  #endif /* CONFIG_PPC_BOOK3S_64 */
> diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_po=
wer.c
> index a814d2dfb5b0..e74816f045f8 100644
> --- a/arch/powerpc/kernel/mce_power.c
> +++ b/arch/powerpc/kernel/mce_power.c
> @@ -20,13 +20,14 @@
>  #include <asm/exception-64s.h>
> =20
>  /*
> - * Convert an address related to an mm to a PFN. NOTE: we are in real
> - * mode, we could potentially race with page table updates.
> + * Convert an address related to an mm to a physical address.
> + * NOTE: we are in real mode, we could potentially race with page table =
updates.
>   */
> -unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
> +unsigned long addr_to_phys(struct pt_regs *regs, unsigned long addr)
>  {
> -	pte_t *ptep;
> -	unsigned long flags;
> +	pte_t *ptep, pte;
> +	unsigned int shift;
> +	unsigned long flags, phys_addr;
>  	struct mm_struct *mm;
> =20
>  	if (user_mode(regs))
> @@ -35,14 +36,21 @@ unsigned long addr_to_pfn(struct pt_regs *regs, unsig=
ned long addr)
>  		mm =3D &init_mm;
> =20
>  	local_irq_save(flags);
> -	if (mm =3D=3D current->mm)
> -		ptep =3D find_current_mm_pte(mm->pgd, addr, NULL, NULL);
> -	else
> -		ptep =3D find_init_mm_pte(addr, NULL);
> +	ptep =3D __find_linux_pte(mm->pgd, addr, NULL, &shift);
>  	local_irq_restore(flags);
> +
>  	if (!ptep || pte_special(*ptep))
>  		return ULONG_MAX;
> -	return pte_pfn(*ptep);
> +
> +	pte =3D *ptep;
> +	if (shift > PAGE_SHIFT) {
> +		unsigned long rpnmask =3D (1ul << shift) - PAGE_SIZE;
> +
> +		pte =3D __pte(pte_val(pte) | (addr & rpnmask));
> +	}
> +	phys_addr =3D pte_pfn(pte) << PAGE_SHIFT;
> +
> +	return phys_addr;
>  }

This should remain addr_to_pfn I think. None of the callers care what
size page the EA was mapped with. 'pfn' is referring to the Linux pfn,
which is the small page number.

  if (shift > PAGE_SHIFT)
    return (pte_pfn(*ptep) | ((addr & ((1UL << shift) - 1)) >> PAGE_SHIFT);
  else
    return pte_pfn(*ptep);

Something roughly like that, then you don't have to change any callers
or am I missing something?

Thanks,
Nick

=
