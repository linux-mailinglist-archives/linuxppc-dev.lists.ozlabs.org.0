Return-Path: <linuxppc-dev+bounces-7592-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55707A854BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 08:54:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYnTK0yqrz3bwF;
	Fri, 11 Apr 2025 16:53:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744354421;
	cv=none; b=DydsHc+Xur1luvISgvmIXTe8UaDhFtXAkiF1YIbaxdvYbh/htOLcYrZzhtPD8Al36ob1ZjBNyCkNLp8LVt7SamH/EZttC80JearLz5L1AlyXEGkSQ4eCPeWaSGJTPVlW23lwPf/+BNQ+B+kufD8hY0f4PfNr5bS+Tzdrd0J7SHRBMVHC5H7aSFZJUnypqGKgY6TymgD/7vm5lM5kGpPpVWRun5avkZljwlF1Lybd+VX7wEN74FhI+nGXSCdYj9eO3Ns95zPBQ/cn9e+/WS3RDCY69kDXULxGqrXCmIGXnLSQqN0ZPnbDiGa/3I62JFFugsfZGnwt5Mlqg4IW3Ket4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744354421; c=relaxed/relaxed;
	bh=q0GUgempXeR1Ai6jdCUdrwnFpwuRrrfXxvPcXnoqanQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=KW8xJ5OAttBNYEus3ZywNVY3uoyxLwaZbl/Q5Pe2SA1RfLK2PwYTw+qf89o2uHfSBFZWGwl6iAufzu+j/s+i8ae9I2y3OrkTYb67CfakDuPUdZgmJSWY7fxnnsDO+z4+l5/dOM7fHACWdfHOAwElhFZLhGLVh4oa47ywh4jsc+5HJfsvKpj8CuCyOi8fwuLcVNRfvEeGciL7jz5nVAi6moGGlhNSolrjijgzTf5uLCUV6vli8+DUJtBJfrDxzB0rWTibRFKccs+Ve0ZG1YMPeRhhbyFWY/WX4PHz8g4hh5joK6HCfrCq1D6mxtQFwgwFGKCVk3jG5vjKeVTkqKGScA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K3YdaD2x; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K3YdaD2x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYnTG6jVbz3brN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 16:53:38 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2260c91576aso13868625ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Apr 2025 23:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744354416; x=1744959216; darn=lists.ozlabs.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0GUgempXeR1Ai6jdCUdrwnFpwuRrrfXxvPcXnoqanQ=;
        b=K3YdaD2xN+6/mrNPKub2jFmkmIXDjOr0mbL72LrHo2vHO8v6jPvVyREN8QrBsYrcgb
         jBo+FmEsLfYjClA4OZ6lt/+3qEF9LdOjbZOO29q5ICyVUTGgAqYS00PObEFPQJtY/RQZ
         k7JsyGT1pVkwa0UN+CQgFzhtF8bROnn3pDFgDpurnwwO2MrF38GUQAItXkvi+2coHue1
         QEyOd7FcNnwGaHfgf3uaelTyRvmrAmGxUu12oR0ZSfLes6yy61nwOPsPlWXQ232WL2Eq
         XlSgKfeIhqvgkJGEBUugajp5OM/MDB2TMaAuk6J7UuPvvwApDJfR7o4EPPemnFUjUw36
         he7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744354416; x=1744959216;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q0GUgempXeR1Ai6jdCUdrwnFpwuRrrfXxvPcXnoqanQ=;
        b=A7Y7g+3VoRpHahb6FL+7oTPwsxKxXanw/SZG1wF2m5Q/CojG7oqYLJZPuCle+6p9h3
         AoGDRklTbiKHrvuiPzTGZNdXVjXXx0LjRaKtjtkkmJSDLovBeMvX0XxacGmCYpHhXwDL
         2C7kZfyT0t+e7/cUSgVdjSQHwvV22OY3SRHDW8yhB56afUXuWCJsNKCvnVq4eILs65Ff
         bjAXCvAvy0BTNdKJqykCyW56Ff3ayHrl958kIctDZ9GwoQAWMRcGfQaT6yMOXmVqvn1Y
         Lo+lRxHQN+wgiho3eRrn57WtSTqE4EgwtDriRAsb/c84CD0f4WS3UWMTzE/k+iNvTfrq
         gFXA==
X-Forwarded-Encrypted: i=1; AJvYcCUGEjw+QXNNVh90w9sJaOi/dShzfKnvpYjsR83GKNr9xK58b/dBXdRrN+oH100roSv7IKOD0yCKEbtxQZQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy9JNp2Pi3FS1DK3IDMEx706yUOK0BGrqRWdJzAKKcVH4T9GIS3
	hjXKPCctr0x6UTu1CxmxlPeZSURxrN7/bXR81SPPAi2Z1rN2cs4G
X-Gm-Gg: ASbGncu2tV+WnwHGHm5Ck3x3vWLlnahtMXFoG0SXOH/cE7lBeg6CoiDRon5umjrRGdk
	5FuTr0hw4JwqOZWvRm/vswPRIkcqGbOpxEhpPpOQwqTLt8AjSXiBuzLNuz8RZzOaJ1Gcp2H4Zpy
	soGE9CLH3xMukN/GHQLze8PSFuhcLMFwiQIRw2Jn6MdU9zQwX7pwD1WG+E8GfXXPcE0v0tjBTXg
	gGExROCWddMkVjkkz7QEpHEd7l8ZcACq0F8xj9Lx+3tjGdlHKZHLb665/+m+ygNf1UmrZsQU4+p
	4pauP4aoAAWDhGLdWc0h4JbX+5tkoijwFA==
X-Google-Smtp-Source: AGHT+IGl0nL5wKmwFlWsQ9ssGXCB2kOLf/x4PGlQUnJhSihZMIEaJP/+c7G4d96OdeU+R8O+pnzM/Q==
X-Received: by 2002:a17:902:cec4:b0:224:e33:889b with SMTP id d9443c01a7336-22bea4ade03mr24590165ad.12.1744354416369;
        Thu, 10 Apr 2025 23:53:36 -0700 (PDT)
Received: from localhost ([220.253.99.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2333841sm728200b3a.160.2025.04.10.23.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 23:53:35 -0700 (PDT)
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
Date: Fri, 11 Apr 2025 16:53:29 +1000
Message-Id: <D93M14UCYU7Y.39ZQIH7VON6DG@gmail.com>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Alexander Gordeev" <agordeev@linux.ibm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>
Cc: "Hugh Dickins" <hughd@google.com>, "Guenter Roeck" <linux@roeck-us.net>,
 "Juergen Gross" <jgross@suse.com>, "Jeremy Fitzhardinge" <jeremy@goop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <kasan-dev@googlegroups.com>, <sparclinux@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-s390@vger.kernel.org>
Subject: Re: [PATCH v1 3/4] mm: Protect kernel pgtables in
 apply_to_pte_range()
X-Mailer: aerc 0.19.0
References: <cover.1744037648.git.agordeev@linux.ibm.com>
 <11dbe3ac88130dbd2b8554f9369cd93fe138c655.1744037648.git.agordeev@linux.ibm.com>
In-Reply-To: <11dbe3ac88130dbd2b8554f9369cd93fe138c655.1744037648.git.agordeev@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue Apr 8, 2025 at 1:11 AM AEST, Alexander Gordeev wrote:
> The lazy MMU mode can only be entered and left under the protection
> of the page table locks for all page tables which may be modified.
> Yet, when it comes to kernel mappings apply_to_pte_range() does not
> take any locks. That does not conform arch_enter|leave_lazy_mmu_mode()
> semantics and could potentially lead to re-schedulling a process while
> in lazy MMU mode or racing on a kernel page table updates.
>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  mm/kasan/shadow.c | 7 ++-----
>  mm/memory.c       | 5 ++++-
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index edfa77959474..6531a7aa8562 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -308,14 +308,14 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, =
unsigned long addr,
>  	__memset((void *)page, KASAN_VMALLOC_INVALID, PAGE_SIZE);
>  	pte =3D pfn_pte(PFN_DOWN(__pa(page)), PAGE_KERNEL);
> =20
> -	spin_lock(&init_mm.page_table_lock);
>  	if (likely(pte_none(ptep_get(ptep)))) {
>  		set_pte_at(&init_mm, addr, ptep, pte);
>  		page =3D 0;
>  	}
> -	spin_unlock(&init_mm.page_table_lock);
> +
>  	if (page)
>  		free_page(page);
> +
>  	return 0;
>  }
> =20

kasan_populate_vmalloc_pte() is really the only thing that
takes the ptl in the apply_to_page_range fn()... Looks like
you may be right. I wonder why they do and nobody else? Just
luck?

Seems okay.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> @@ -401,13 +401,10 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep=
, unsigned long addr,
> =20
>  	page =3D (unsigned long)__va(pte_pfn(ptep_get(ptep)) << PAGE_SHIFT);
> =20
> -	spin_lock(&init_mm.page_table_lock);
> -
>  	if (likely(!pte_none(ptep_get(ptep)))) {
>  		pte_clear(&init_mm, addr, ptep);
>  		free_page(page);
>  	}
> -	spin_unlock(&init_mm.page_table_lock);
> =20
>  	return 0;
>  }
> diff --git a/mm/memory.c b/mm/memory.c
> index f0201c8ec1ce..1f3727104e99 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2926,6 +2926,7 @@ static int apply_to_pte_range(struct mm_struct *mm,=
 pmd_t *pmd,
>  			pte =3D pte_offset_kernel(pmd, addr);
>  		if (!pte)
>  			return err;
> +		spin_lock(&init_mm.page_table_lock);
>  	} else {
>  		if (create)
>  			pte =3D pte_alloc_map_lock(mm, pmd, addr, &ptl);
> @@ -2951,7 +2952,9 @@ static int apply_to_pte_range(struct mm_struct *mm,=
 pmd_t *pmd,
> =20
>  	arch_leave_lazy_mmu_mode();
> =20
> -	if (mm !=3D &init_mm)
> +	if (mm =3D=3D &init_mm)
> +		spin_unlock(&init_mm.page_table_lock);
> +	else
>  		pte_unmap_unlock(mapped_pte, ptl);
> =20
>  	*mask |=3D PGTBL_PTE_MODIFIED;


