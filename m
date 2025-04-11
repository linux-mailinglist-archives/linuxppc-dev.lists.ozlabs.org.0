Return-Path: <linuxppc-dev+bounces-7591-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED03A85499
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 08:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYnKn2tpCz3bsm;
	Fri, 11 Apr 2025 16:47:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744354029;
	cv=none; b=iLL7QbhQxDHonisoUimyUsnv0ehsFCvi7c/YzL+fz6TBW6BbQhnoDwfywZpbvWWgthltNZEENnyC7tppbuq++mSgGWN5Mq6ugKLjKYs2SbuSIE+RIj/s8UoRvWmXqMs2Y4gDOMCwfaeR/E0c5ee4x4+mu0uRyzFULXf4KCoNKQNy/LeD/YoCuqJJ4JD7buAHFP6KsQ9ucfCoDNUoHSkQCWTTXY9/1XnFviS0Ltz9+ySQ6MxnztvKMrHZgnG9nqm7/caim0CQAGXd2f9p+3H8XxL6nxDcH92zZagPRR9TT2NMWrZmmma/IGsBVxoAcwlrqXqkQHFNQP2XAnQalKEfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744354029; c=relaxed/relaxed;
	bh=BlT93k3tsOOzLmAYutjlNjX6BFvDuWnFmTQ9IJuMKl4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=L1HixcSa9CIWTKJcCpgyVqb8Ls+W6hGPFVKwQzZ4GEOZD48RU9/+Dq9yZ1JvDpP4CisYX7gEJY8urRUNedXu7YFtMIigHEemLOY2vM9lH6wQ+VnOt5+lg7oB2G9wU6dRmTE6lm9zipBQwD5dbMA3GnFcjMjk0YiZ9/kfAMK+aY83OkZtghRIZuuo5Fd0aaYVTfhnTzP/xQ8y5KfXNVWtzi1dIaDKx2dx+W7uCDBJ5pz0fn3c9jpYhKMcwpwWheaUegrlRUJ6XZXHYodL1XZRuV7+a7DWOY53wjFdD0D6r07+Fx5HvfGuLUSUKR09gVlYoUhzTY7F2LtQPB6yVifC5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ejxKJHcy; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ejxKJHcy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYnKl6YZDz3brM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 16:47:07 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-aee773df955so2298388a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Apr 2025 23:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744354025; x=1744958825; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlT93k3tsOOzLmAYutjlNjX6BFvDuWnFmTQ9IJuMKl4=;
        b=ejxKJHcyyb+9GmKz5RfefS5YLj+xFzfnTDXh4dCNUVNAlYg/M3sG1cjgRSpc9NrviQ
         P9vUJt62DGTQzmoA37cHX+Soxrk52FhwsOAwASrX7YJZh1+E4JNBjzyttcyu6lFqHxLx
         yPoBgnLeFWbUNAo/+AJRY6wwQrk5nl5Lmk3GB5PSnMG1vuKdw4CqDu3PNc9wZFt7J50Z
         ztTzXaYWusAme6IGC9EcwkB+FCiSxQBLDMXON4eq8nyuJtDmrZ1fd/qFN1OkIc8ZStsx
         FlIPQRIEzO8+XcanZbaEITETXtPHecTvVaNkfsPFbMV6YHeGVg5iJv8D+3mdApPfFtHz
         bfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744354025; x=1744958825;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BlT93k3tsOOzLmAYutjlNjX6BFvDuWnFmTQ9IJuMKl4=;
        b=j7gRUKzUWgN9C3T0Vpiheop34KdT73Egmgy7tmh6wGEhkMZCI8pFMuY02UF7MCEPTy
         UEDOjy3yBstAfeiSBB+BPRJqyDdLSUvrAZg2HevYveljGkCiCs+8SUTX/ZtTh3HG1KMq
         8aD3m8HP94Q/6VNmtcKbh5Bo7ZVfCf8EBuw+tbHJt4hkju2JYmaXjIDpX06wdhA9GVcc
         F/NUr23SO5WBcgU4WEPqgZNPopDRzMf47+mKsbbhtEnWL47rEWDzfr9I3cYscYphWcvb
         T2+2AvzESZWnmzsSVJ5eFMKIF3SMMmJ0IOtNzHRGohqRd4zqBq6jqJnGuV2FKfQqrhPZ
         afeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1slAoBhmqqmO7ZKR0RX4SYiurlc9ERHEjOBYVsNgyPwZlmJXKpqhwBAvpOf9Mq7pbrSL0wwimoUk3Yhw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzxApICfoIaSVXahQL8FDmN/YB3VfmBwJnDUjYv804GXwzDMbDk
	heuJxa102xk4icLGi76aaKI6+IgrVtKVGpIHKzSilX1/UxLVKSJ6
X-Gm-Gg: ASbGncth/W+z6Q8qcI2lR8THweKC5kFwlAkUmHsYRJhXwdBa7xt/ZH2/pLywZ3EAYM+
	8CmSl2oRefkOPgSyXpYn3wQ4UJDwiCO8itT7wm8le/KP7Pk3G3RZzNbeJn/fEQq7NT4O6KAqgy/
	ee9qdPbcro0hBi/ybksLgtQ7wbclt0hLbK1kaBdFr8rWxmIl79rjCGcGUfCNNouY0YqOtuolYth
	TWEOESmzXsp9FA/0zihNTKfR416oJ04K7Jgo0tvkVGhvISW90LCV8G9tA+lDlra+ziJ6CeTjbsu
	oTPGesEUws+SMS+HcCE1pVObqA6TjA9CWw==
X-Google-Smtp-Source: AGHT+IEaCH7pfyseCsY0ABQGUFfCNsdZ0JepyMppPzef2Ij2uLIjrUD7lNR1McifQnqxw6aLmm43tw==
X-Received: by 2002:a17:902:d489:b0:215:58be:3349 with SMTP id d9443c01a7336-22bea05e17fmr25293145ad.14.1744354025413;
        Thu, 10 Apr 2025 23:47:05 -0700 (PDT)
Received: from localhost ([220.253.99.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b2c1sm41872295ad.59.2025.04.10.23.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 23:47:04 -0700 (PDT)
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 16:46:58 +1000
Message-Id: <D93LW58FLXOS.2U8X0CO2H9H5S@gmail.com>
Subject: Re: [PATCH v1 2/4] mm: Cleanup apply_to_pte_range() routine
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Alexander Gordeev" <agordeev@linux.ibm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>
Cc: "Hugh Dickins" <hughd@google.com>, "Guenter Roeck" <linux@roeck-us.net>,
 "Juergen Gross" <jgross@suse.com>, "Jeremy Fitzhardinge" <jeremy@goop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <kasan-dev@googlegroups.com>, <sparclinux@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-s390@vger.kernel.org>
X-Mailer: aerc 0.19.0
References: <cover.1744037648.git.agordeev@linux.ibm.com>
 <93102722541b1daf541fce9fb316a1a2614d8c86.1744037648.git.agordeev@linux.ibm.com>
In-Reply-To: <93102722541b1daf541fce9fb316a1a2614d8c86.1744037648.git.agordeev@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue Apr 8, 2025 at 1:11 AM AEST, Alexander Gordeev wrote:
> Reverse 'create' vs 'mm =3D=3D &init_mm' conditions and move
> page table mask modification out of the atomic context.
>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  mm/memory.c | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 2d8c265fc7d6..f0201c8ec1ce 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2915,24 +2915,28 @@ static int apply_to_pte_range(struct mm_struct *m=
m, pmd_t *pmd,
>  				     pte_fn_t fn, void *data, bool create,
>  				     pgtbl_mod_mask *mask)
>  {
> +	int err =3D create ? -ENOMEM : -EINVAL;

Could you make this a new variable instead of reusing
existing err? 'const int pte_err' or something?

>  	pte_t *pte, *mapped_pte;
> -	int err =3D 0;
>  	spinlock_t *ptl;
> =20
> -	if (create) {
> -		mapped_pte =3D pte =3D (mm =3D=3D &init_mm) ?
> -			pte_alloc_kernel_track(pmd, addr, mask) :
> -			pte_alloc_map_lock(mm, pmd, addr, &ptl);
> +	if (mm =3D=3D &init_mm) {
> +		if (create)
> +			pte =3D pte_alloc_kernel_track(pmd, addr, mask);
> +		else
> +			pte =3D pte_offset_kernel(pmd, addr);
>  		if (!pte)
> -			return -ENOMEM;
> +			return err;
>  	} else {
> -		mapped_pte =3D pte =3D (mm =3D=3D &init_mm) ?
> -			pte_offset_kernel(pmd, addr) :
> -			pte_offset_map_lock(mm, pmd, addr, &ptl);
> +		if (create)
> +			pte =3D pte_alloc_map_lock(mm, pmd, addr, &ptl);
> +		else
> +			pte =3D pte_offset_map_lock(mm, pmd, addr, &ptl);
>  		if (!pte)
> -			return -EINVAL;
> +			return err;
> +		mapped_pte =3D pte;
>  	}
> =20
> +	err =3D 0;
>  	arch_enter_lazy_mmu_mode();
> =20
>  	if (fn) {
> @@ -2944,12 +2948,14 @@ static int apply_to_pte_range(struct mm_struct *m=
m, pmd_t *pmd,
>  			}
>  		} while (addr +=3D PAGE_SIZE, addr !=3D end);
>  	}
> -	*mask |=3D PGTBL_PTE_MODIFIED;
> =20
>  	arch_leave_lazy_mmu_mode();
> =20
>  	if (mm !=3D &init_mm)
>  		pte_unmap_unlock(mapped_pte, ptl);
> +
> +	*mask |=3D PGTBL_PTE_MODIFIED;

This is done just because we might as well? Less work in critical
section?

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> +
>  	return err;
>  }
> =20


