Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A098D1FEAA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 07:06:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454KBk6B0wzDqY5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 15:06:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RJZNx3zL"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454K9D69XDzDqXl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 15:04:48 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id 13so1166510pfw.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 22:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=n5xAaX+gbveRUk0njT5HnWFLBayN1Qt8hJqeiwl/bgU=;
 b=RJZNx3zL04VGABPrBtZUavnCcgeIKQO8MeD83e1ptQA42++XxguV8ERCTZs1jm7XD1
 EFPHAjfYalKjjaYsj7JbAnymYBlwto4WFnJFrTdaR+9l4vcpFofZ0boi5B5aedMuXi2k
 gQpkv5Iswl8J/2ebjQeangtMycMej8PqE4T0+rmeLIYt91rMUw4G9fvWB8CbgjPWB22c
 6REpk6/QZR9d1EpCkpS88pH/p05P6zeRJwuYTw/sNzbHyidrWBompUiILkmlYZ6KVfJf
 gpLmwVYRNDyKtKJlCV6R5xMiZ+TZOSn11WtRQQm41I5vSUx4kRzglSpV5QbBFt5Xgegp
 yJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=n5xAaX+gbveRUk0njT5HnWFLBayN1Qt8hJqeiwl/bgU=;
 b=d/w2VVXOoDS/xuuND9iDBxCjKpqafACJ/iWMmFsZjLpSBdG1OIGcUeGpOKnv+0Vm2i
 ocXpOKVrXOl/PFCOe+t2BrykRVPVrhIzWGhK8xwC5CPb25YzpCTY4EPMZ0kmz+gG7c9h
 RLiVtLvhegy8w1u3F2cDrDCdfXDwkGUl59d+ZgZru5tsF3zkbjE7gIRRDIm/OKvfgu05
 iKAKNl01uZZhCza6BkzC9+FyZKNhQtVoFlljsmwbMH5FmUREwD7Yj4lO36xcmEyFlAyN
 I/+gqeaLoPoqB8p0O4p0xXp9PseT7+V+EHKYj157X1o8ZKobOX90O+MJFL7Gn7I/x2vH
 q0PQ==
X-Gm-Message-State: APjAAAUw/enrT2rbS2yGgP7np2LBzKru69Xxx3eYiIh38IErq89OkZR6
 IvTTBFa54EN5lEn+s8ePnQE=
X-Google-Smtp-Source: APXvYqzRcqXGaKOA4sCXbKULpTtBFmdQltTuhpNfm8CSMJB0x1heri0OTvA9+zEH+BVW+thY1HX5hA==
X-Received: by 2002:aa7:8e04:: with SMTP id c4mr51216495pfr.48.1557983085665; 
 Wed, 15 May 2019 22:04:45 -0700 (PDT)
Received: from localhost (193-116-124-212.tpgi.com.au. [193.116.124.212])
 by smtp.gmail.com with ESMTPSA id i13sm4971717pgn.12.2019.05.15.22.04.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 22:04:41 -0700 (PDT)
Date: Thu, 16 May 2019 15:04:32 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/book3s/mm: Clear MMU_FTR_HPTE_TABLE when radix is
 enabled.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au,
 paulus@samba.org
References: <20190514060205.20887-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20190514060205.20887-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1557982690.pk1t7llmyy.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh Kumar K.V's on May 14, 2019 4:02 pm:
> Avoids confusion when printing Oops message like below
>=20
>  Faulting instruction address: 0xc00000000008bdb4
>  Oops: Kernel access of bad area, sig: 11 [#1]
>  LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP NR_CPUS=3D2048 NUMA PowerN=
V
>=20
> Either ibm,pa-features or ibm,powerpc-cpu-features can be used to enable =
the
> MMU features. We don't clear related MMU feature bits there. We use the k=
ernel
> commandline to determine what translation mode we want to use and clear t=
he
> HPTE or radix bit accordingly. On LPAR we do have to renable HASH bit if =
the
> hypervisor can't do radix.

Well we have the HPTE feature: the CPU supports hash MMU mode. It's
just the the kernel is booted in radix mode.

Could make a difference for KVM, if it will support an HPT guest or
not.

That's all highly theoretical and we have other inconsistencies
already in this stuff, I'd just like to try make things a bit better
in the long term.

Can we just add an early_radix_enabled() in the oops printing code
to select radix or hash MMU?

> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index b97aee03924f..0fa6cac3fe82 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -77,9 +77,6 @@ static struct page *maybe_pte_to_page(pte_t pte)
> =20
>  static pte_t set_pte_filter_hash(pte_t pte)
>  {
> -	if (radix_enabled())
> -		return pte;
> -
>  	pte =3D __pte(pte_val(pte) & ~_PAGE_HPTEFLAGS);
>  	if (pte_looks_normal(pte) && !(cpu_has_feature(CPU_FTR_COHERENT_ICACHE)=
 ||
>  				       cpu_has_feature(CPU_FTR_NOEXECUTE))) {
> @@ -110,6 +107,8 @@ static pte_t set_pte_filter(pte_t pte)
> =20
>  	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
>  		return set_pte_filter_hash(pte);
> +	else if (radix_enabled())
> +		return pte;
> =20
>  	/* No exec permission in the first place, move on */
>  	if (!pte_exec(pte) || !pte_looks_normal(pte))
> @@ -140,7 +139,7 @@ static pte_t set_access_flags_filter(pte_t pte, struc=
t vm_area_struct *vma,
>  {
>  	struct page *pg;
> =20
> -	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
> +	if (mmu_has_feature(MMU_FTR_HPTE_TABLE) || radix_enabled())
>  		return pte;
> =20
>  	/* So here, we only care about exec faults, as we use them

These would still be good cleanup to make the HPTE_TABLE feature
independent from radix.

Thanks,
Nick

=
