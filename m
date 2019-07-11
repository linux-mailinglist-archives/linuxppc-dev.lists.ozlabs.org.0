Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 549B66540B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 11:43:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45krhg2MbfzDqhK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 19:43:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OhOFswUd"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45krfc4qvqzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 19:41:28 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id m9so2719452pls.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 02:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=1YMFnSIgg1DHJY24b0rxS4qqzRa8py30TgHfkWCjNTg=;
 b=OhOFswUdud1A4rTKoy+cbrht+DidJ4xxRCjN/InY0dg6JLBuEHug2PMDxsBxo1ZPxn
 Ur+TafII3DL6Du+rfpKt9FjKbldXRneYtD/mBGwCJSBJyuZTALR9b+GtpK/uto69VpU7
 bR1jb+72oHUErJRA0kCfGEbYMcSO2XAuOpMDfSev4dI76hyBB1mpmysw+Pgom5cwCtb/
 QgZalYf4eEO0SHliya0A0jKinVicMeD17LgQqRMz5UjrPnY8ngS29mB0tzdKQljtYMVE
 eFi1Mj7S9MEsD0FXMQzVrkfTXYFtLrEsT6YVku7H9LnnZl3bg7szhFDo6ocmjjAwLkQ1
 tLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=1YMFnSIgg1DHJY24b0rxS4qqzRa8py30TgHfkWCjNTg=;
 b=JyQJK+17pL5Y2VywVYaC7aUZ7cvo/HR1+darWKvWMNRxjPDKbDA1k+vZP1ZB1RJWTJ
 j/IJWfkoSzKIDjRhG2xe4ZP1UJhmAhEe4xnSVtpkZi1M2w/hKb1MKL2nxLRzv/xPM8AG
 qBbH5ri3XEyiZDutR7HQjETF/ETaoz8Lcs1q8t5llrF+FaA/3SvLG5s70P5RI9v3Vr3l
 4ltgvzOHO08kSJ812LZcEYfpRJ9Un1AKgLG54iFYtxeKJMSlPu5+KuBdeJuMByuBS7Ff
 ECCQYy8L3E1uQYtd2DuviWlPCNNpxlPwxP049iSpVINTjk+l3/Wus6WBh/Unxz8SXMMC
 AGpg==
X-Gm-Message-State: APjAAAXMXAfR4gkdRc9UY5FU2PbdT/ThEklrdVuHad6QKBY1B2jqnpFg
 NDn035fr2V2L0IPQmzBlVBo=
X-Google-Smtp-Source: APXvYqzyb9kNk+e1ZzU1m7c0KyDFA05/2k6XpI8wznSPfdXjqPL3bx29pLtsCsvUL56tFQ7zXRByPA==
X-Received: by 2002:a17:902:5ac4:: with SMTP id
 g4mr3686841plm.80.1562838085053; 
 Thu, 11 Jul 2019 02:41:25 -0700 (PDT)
Received: from localhost (193-116-118-149.tpgi.com.au. [193.116.118.149])
 by smtp.gmail.com with ESMTPSA id r13sm5751370pfr.25.2019.07.11.02.41.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 02:41:24 -0700 (PDT)
Date: Thu, 11 Jul 2019 19:38:26 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [v5 2/6] powerpc/mce: Fix MCE handling for huge pages
To: linux-kernel@vger.kernel.org, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, Santosh Sivaraj <santosh@fossix.org>
References: <20190709121524.18762-1-santosh@fossix.org>
 <20190709121524.18762-3-santosh@fossix.org>
In-Reply-To: <20190709121524.18762-3-santosh@fossix.org>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562837451.yixjktlyjo.astroid@bobo.none>
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

Santosh Sivaraj's on July 9, 2019 10:15 pm:
> From: Balbir Singh <bsingharora@gmail.com>
>=20
> The current code would fail on huge pages addresses, since the shift
> would be incorrect. Use the correct page shift value returned by
> __find_linux_pte() to get the correct pfn. The code is more generic
> and can handle both regular and compound pages.
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

Ah, the comment I made earlier to this patch I think missed some detail.

But what we should do here is return the pfn (which is always units
of PAGE_SIZE). So you have to adjust by the lower part of the address
here, rather than returning shift which is unnecessary.

Possibly even better is to just return the real address, which is
what all callers seem to want anyway.

> @@ -358,15 +361,16 @@ static int mce_find_instr_ea_and_pfn(struct pt_regs=
 *regs, uint64_t *addr,
>  	unsigned long pfn, instr_addr;
>  	struct instruction_op op;
>  	struct pt_regs tmp =3D *regs;
> +	unsigned int shift;
> =20
> -	pfn =3D addr_to_pfn(regs, regs->nip);
> +	pfn =3D addr_to_pfn(regs, regs->nip, &shift);
>  	if (pfn !=3D ULONG_MAX) {
> -		instr_addr =3D (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_MASK);
> +		instr_addr =3D (pfn << shift) + (regs->nip & ((1 << shift) - 1));

This wants the exact real address.

>  		instr =3D *(unsigned int *)(instr_addr);
>  		if (!analyse_instr(&op, &tmp, instr)) {
> -			pfn =3D addr_to_pfn(regs, op.ea);
> +			pfn =3D addr_to_pfn(regs, op.ea, &shift);
>  			*addr =3D op.ea;
> -			*phys_addr =3D (pfn << PAGE_SHIFT);
> +			*phys_addr =3D (pfn << shift);
>  			return 0;
>  		}

I'm not sure this is really what we want. You do really want the
PAGE_SIZE pfn here. Say you have a failure in the nth small page
of a large page mapping, this gives the physical address of the
start of the large page, so memory failure will fail out the 0th
small page won't it?

>  		/*
> @@ -442,12 +446,14 @@ static int mce_handle_ierror(struct pt_regs *regs,
>  			if (mce_err->sync_error &&
>  				table[i].error_type =3D=3D MCE_ERROR_TYPE_UE) {
>  				unsigned long pfn;
> +				unsigned int shift;
> =20
>  				if (get_paca()->in_mce < MAX_MCE_DEPTH) {
> -					pfn =3D addr_to_pfn(regs, regs->nip);
> +					pfn =3D addr_to_pfn(regs, regs->nip,
> +							  &shift);
>  					if (pfn !=3D ULONG_MAX) {
>  						*phys_addr =3D
> -							(pfn << PAGE_SHIFT);
> +							(pfn << shift);
>  					}
>  				}
>  			}
> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platform=
s/pseries/ras.c
> index f16fdd0f71f7..5e43283d3300 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -740,12 +740,14 @@ static void pseries_do_memory_failure(struct pt_reg=
s *regs,
>  		paddr =3D be64_to_cpu(mce_log->logical_address);
>  	} else if (mce_log->sub_err_type & UE_EFFECTIVE_ADDR_PROVIDED) {
>  		unsigned long pfn;
> +		unsigned int shift;
> =20
>  		pfn =3D addr_to_pfn(regs,
> -				  be64_to_cpu(mce_log->effective_address));
> +				  be64_to_cpu(mce_log->effective_address),
> +				  &shift);
>  		if (pfn =3D=3D ULONG_MAX)
>  			return;
> -		paddr =3D pfn << PAGE_SHIFT;
> +		paddr =3D pfn << shift;
>  	} else {
>  		return;
>  	}

Same for all these.

Thanks,
Nick

=
