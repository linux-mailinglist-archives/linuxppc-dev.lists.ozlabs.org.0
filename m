Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC84E3C415A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 05:00:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNT6N5fD4z2yyb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 13:00:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=c18j2Yq5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=c18j2Yq5; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNT5w3dY7z2yss
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 13:00:19 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id u14so16759586pga.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jul 2021 20:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=0eCF5kOKTau0RV8haml/YD6B20mltYBG9SCZ3Izqo1k=;
 b=c18j2Yq58fWAdTXzdZSGm9qmWwlRNnq2VK346HyjRcmuBR1zii3ZPJT9YG5v8g6rm1
 z6RR2wwiRp+mxkFQHxqSeRJ5oF8OtTVaO5+F3EvH6vknf2PQmEBm6PLR8MhQfzDo0iev
 ka12VwATXT6ed0d4EENlTc97kD6wsz6I9t07eYRgdXf3xLHwQDDpYjjuSgQRSZWnfp6b
 bC2+SwdYTYWO4h5yOmkcYUfCO14ZJHCGpqSl75o2gNB9Mm0ECnWU2xKuXN1FQqddNW88
 e/OaQmpRoHi93NZRAShTRwjFSNupAwjrK0D9DNQj13zsMNCk2ULo0yc0aADRyAIG1VIw
 RQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=0eCF5kOKTau0RV8haml/YD6B20mltYBG9SCZ3Izqo1k=;
 b=mCX+GQHCggxwGZTsn/JQ2L6HP7cOu4mSjA2kYoYNqLp6mQ0eOeXxydxvcRiKf1yDDs
 sB3BO3OHMgWSapXkleH7X+3AXFfjkeQeGxJQjrs9ZV4pnd/+ydNGt3/BtbagHk1B7MrW
 vE2FYztaimWp8+lY4OFelVbes/a+N8S6K6RZRmPVLby0WFRInchkMfBphNiBlyoY+sCi
 C8icoVwSpLeiDlLH/lEuRMPmynkmCXYMTh5poBSB/xmmn5Y03CJ3oN2v67Ah+ifZCLjW
 TDtClruktN2MjOG557nKsxFT4rStWiEBNrqRNkvzaa1flcN6h7r5A1vxdRCDBkKXenfc
 sEfw==
X-Gm-Message-State: AOAM530m2rWW5G/7wxQYEr1ALsJ0kW9Prl2YZxJkT0fglHCgak+sF4yf
 1IQMIE8xRv2XH6vpA07/WdA=
X-Google-Smtp-Source: ABdhPJwqvXGl8WMj4VzysHZsPpEhxiqQz4PizCF7LM2zXPuxq1YLHA/3ztrz96HsBJOD68HChH8ERA==
X-Received: by 2002:a65:5542:: with SMTP id t2mr51104772pgr.358.1626058815878; 
 Sun, 11 Jul 2021 20:00:15 -0700 (PDT)
Received: from localhost (203-219-181-43.static.tpgi.com.au. [203.219.181.43])
 by smtp.gmail.com with ESMTPSA id
 s36sm6498955pgk.64.2021.07.11.20.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 20:00:15 -0700 (PDT)
Date: Mon, 12 Jul 2021 13:00:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v0 1/1] powerpc/percpu: Use 2MB atom_size in percpu
 allocator on radix
To: Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210708052946.1497495-1-bharata@linux.ibm.com>
In-Reply-To: <20210708052946.1497495-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1626058374.3xlvhrcly8.astroid@bobo.none>
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
Cc: aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Bharata B Rao's message of July 8, 2021 3:29 pm:
> The atom_size used by percpu allocator on powerpc is currently
> determined by mmu_linear_psize which is initialized to 4K and
> mmu_linear_psize is modified only by hash. Till now for radix
> the atom_size was defaulting to PAGE_SIZE(64K).

Looks like it was 1MB to me?

> Go for 2MB
> atom_size on radix if support for 2MB pages exist.
>=20
> 2MB atom_size on radix will allow using PMD mappings in the
> vmalloc area if and when support for higher sized vmalloc
> mappings is enabled for the pecpu allocator. However right now

That would be nice.

> this change will result in more number of units to be allocated
> within one allocation due to increased upa(units per allocation).

In that case is there any reason to do it until then?

>=20
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  arch/powerpc/kernel/setup_64.c | 34 +++++++++++++++++++++++++---------
>  1 file changed, 25 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_6=
4.c
> index 1ff258f6c76c..45ce2d6e8112 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -871,6 +871,30 @@ static void __init pcpu_populate_pte(unsigned long a=
ddr)
>  	      __func__, PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
>  }
> =20
> +static size_t pcpu_atom_size(void)
> +{
> +	size_t atom_size =3D PAGE_SIZE;
> +
> +	/*
> +	 * Radix: Use PAGE_SIZE by default or 2M if available.
> +	 */
> +	if (radix_enabled()) {
> +		if (mmu_psize_defs[MMU_PAGE_2M].shift)
> +			atom_size =3D 1 << mmu_psize_defs[MMU_PAGE_2M].shift;

Looks like this changes behaviour for radix.

Also mmu_psize_defs is a pretty horrible interface you only need it in=20
some low level instruction encodings. You already explicitly know it's
2MB there, so you can just PMD_SHIFT.

If you want to know whether huge PMD is supported and enabled in vmalloc
memory, you would have to add some check which also accounts for
vmap_allow_huge, so that would be another patch.

Thanks,
Nick

> +		goto out;
> +	}
> +
> +	/*
> +	 * Hash: Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
> +	 * to group units.  For larger mappings, use 1M atom which
> +	 * should be large enough to contain a number of units.
> +	 */
> +	if (mmu_linear_psize !=3D MMU_PAGE_4K)
> +		atom_size =3D 1 << 20;
> +
> +out:
> +	return atom_size;
> +}
> =20
>  void __init setup_per_cpu_areas(void)
>  {
> @@ -880,15 +904,7 @@ void __init setup_per_cpu_areas(void)
>  	unsigned int cpu;
>  	int rc =3D -EINVAL;
> =20
> -	/*
> -	 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
> -	 * to group units.  For larger mappings, use 1M atom which
> -	 * should be large enough to contain a number of units.
> -	 */
> -	if (mmu_linear_psize =3D=3D MMU_PAGE_4K)
> -		atom_size =3D PAGE_SIZE;
> -	else
> -		atom_size =3D 1 << 20;
> +	atom_size =3D pcpu_atom_size();
> =20
>  	if (pcpu_chosen_fc !=3D PCPU_FC_PAGE) {
>  		rc =3D pcpu_embed_first_chunk(0, dyn_size, atom_size, pcpu_cpu_distanc=
e,
> --=20
> 2.31.1
>=20
>=20
