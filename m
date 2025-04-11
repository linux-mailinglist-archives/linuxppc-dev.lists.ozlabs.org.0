Return-Path: <linuxppc-dev+bounces-7593-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFC4A854C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 08:55:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYnVM0B1Nz3bxM;
	Fri, 11 Apr 2025 16:54:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744354474;
	cv=none; b=YX6BgRQ4KNczAR+kh1m1/e3irUmIaTsJ1osZC1H4tFFN6Bt/Shg5Sy7VeW4vo191x9ohddNMo/ayAiJ2LYPjaAkbLyP3FZ2bMhBdH0W4ZwAKrzzs8KPgEZnX6OdXR8M6iWxay9tGJh5FmOTR9jkK+dfN/4m/o4mbJ6NZpTLFNJOcY0KC2LYbjScLH5kIpSPYa/t7ZBeuCopUpDOvOqvbFbYPlWQxf9Q6JbQp7wTsx39yM/q5gyBsbydfKZsj+WqTcf5N99M45/SLyBzUsZJmin6MG2xGFQjVaAsl6PYjHQN2b8zF76LoBSM+DsNo17NJXfO+TFpc02w6MBjJnnOqRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744354474; c=relaxed/relaxed;
	bh=EMrPec0FtWGKoKqlWKZKVYlPugkOpwSx2KisPfbkQKU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=g2RUT5T3SmSOfnXMizdOCVLRaUs4IceYYoja1ZqEUH8CfIxlxXzk20IgLhRWGj/Ccc+y2ndCX1cVIm43/nh7iAtcYUSX5/5Q0q4ptlK8oFlvfv+giDx1oyDxLu8zd9ztdZspnXP113c7rl7QxeW9u8QB4LxZyxLALOwm2Oxbg1jVrcdg/doP+1HmO51wNg514FKBDXXnq6b8vkJvc0H/PzPCgxRzBFWnA9A5NcqJ0zs9sWkNERtO0nZToP9xREsgICSvhiOOurwyMOrl7Xuc7xL+36r90eLzxMrWMA9Nv7qxOP2RfLuJPfKRVLaH87zapk2gu5iAtRZC2I2C4dm2rQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AyYwgFoS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AyYwgFoS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYnVL2XVsz3bwf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 16:54:34 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22435603572so16171015ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Apr 2025 23:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744354472; x=1744959272; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMrPec0FtWGKoKqlWKZKVYlPugkOpwSx2KisPfbkQKU=;
        b=AyYwgFoSO1dtWh+Xub/WXKMWWffEqwjGg8fRkShYeV2NEzutIBJwzBzSy6iQKOeXQX
         5rTmYMf6y2U23ZC92FUxv8A1jugVXswml5ERpOoc/emglp+2x2lGCI0yUuZkhaVWTXWT
         scZ845lfDKtt79/1BMuGxqDSoD4F8lM2fVCTZn0kwXFM4K9Sxcc+6VR7cUTgNeil6CtY
         mMjVNlKieweMofrMVeYk+0PsiOcaUFF5Trf/NrLGNHirpMRKxtGRmKWqge9oSYst00nZ
         mNlIBbx+sGi9md2NkYGw9xnchdjuKVR9edsyoB4Hg4qiNM7cWeFWGb+BiRh8cXI2po79
         9WWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744354472; x=1744959272;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EMrPec0FtWGKoKqlWKZKVYlPugkOpwSx2KisPfbkQKU=;
        b=f2SF+Rtj0XmoGA2xhHehO12xfE0uP6nljXdDWJhZiEw3TIA61SoC9MvKAR7ZPDpxnX
         SjlOmuSXcslsp4sivmGmKBLBD40kpHKlCOFYQECdIFAklDY6GZETYywZKM6j4hIbuEBe
         5gi01wxuIdpfw4rZ/iDsEdM9RisZaMGEdbkrYYAnnOj/xZcoUxSCa7hdUU/8MpYfmRQr
         jEiFIC/JhPPtftsVJa7DaxgioGYOXDxyw4Jlmx+3Jvr2HwrFQERNmIO9n5ZNNbrt2/3n
         6k9SbajcnzhNM9G3CL2Uese+i/btFiurfLkYrp+5SH/wd2ywOiLsMBJ8Mg7vqiGwWSEX
         qWmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNUnMA/OoZPj43Z7vydUeQsOeK7et0ArDe7d0N657ZVsEpXCl+eUn3kVxh7WPhQtuuZVFpElTOSDhmU1Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywqj9Nzm2XFn07Ih1tUj+mRDIF1YOCIsrvievHfGxF7K4P26+t8
	hkyw3ZZDlSVuQI97235XwXNx5/kdgdHkSdzzgZVVm2NVqL29vk/T
X-Gm-Gg: ASbGncuPfI0jK/DTkA6Eb6KHAxZpGgEu1KbTlf5aEwtAyMQM9pHXUWHBeICc2a7HOke
	qTs1U2zmL2kvMWT+fWVsv6rkhTzrpk39Pb1s1qUnAcfRge5cZG9r352R4t9RLdh0gCyhWyOfh13
	52ejN6mVo4ISuU2DMNdpI716ca2EZALjbLGGqyP1fJIVdW6oESadjMTZDRIRQSF1DbfdMIUxjH8
	AfJoCN+bLX9m1TLL5GkzOdgrLTiqMidAtiUxilA4EoRkWOhSp7hFjTDOVQm+ev8/Di1H/yazjaU
	4OO9+YCRsWUffBjmRmDSRpkqfE97V0m6XQ==
X-Google-Smtp-Source: AGHT+IGSH0OgLf53VF7UhNZNnJ/VcLJp7S3R1+Mq4jeyNCKlAufgShNsDG1jyYvvXL3wLn/jNMdw9A==
X-Received: by 2002:a17:902:ce8a:b0:224:191d:8a87 with SMTP id d9443c01a7336-22bea4bc62emr24301425ad.26.1744354472347;
        Thu, 10 Apr 2025 23:54:32 -0700 (PDT)
Received: from localhost ([220.253.99.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd23342ddsm728537b3a.164.2025.04.10.23.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 23:54:31 -0700 (PDT)
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
Date: Fri, 11 Apr 2025 16:54:25 +1000
Message-Id: <D93M1ULKMFVB.FY9I2463RQ68@gmail.com>
Cc: "Hugh Dickins" <hughd@google.com>, "Guenter Roeck" <linux@roeck-us.net>,
 "Juergen Gross" <jgross@suse.com>, "Jeremy Fitzhardinge" <jeremy@goop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <kasan-dev@googlegroups.com>, <sparclinux@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-s390@vger.kernel.org>
Subject: Re: [PATCH v1 1/4] kasan: Avoid sleepable page allocation from
 atomic context
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Alexander Gordeev" <agordeev@linux.ibm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>
X-Mailer: aerc 0.19.0
References: <cover.1744037648.git.agordeev@linux.ibm.com>
 <ad1b313b6e3e1a84d2df6f686680ad78ae99710c.1744037648.git.agordeev@linux.ibm.com>
In-Reply-To: <ad1b313b6e3e1a84d2df6f686680ad78ae99710c.1744037648.git.agordeev@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue Apr 8, 2025 at 1:11 AM AEST, Alexander Gordeev wrote:
> apply_to_page_range() enters lazy MMU mode and then invokes
> kasan_populate_vmalloc_pte() callback on each page table walk
> iteration. The lazy MMU mode may only be entered only under
> protection of the page table lock. However, the callback can
> go into sleep when trying to allocate a single page.
>
> Change __get_free_page() allocation mode from GFP_KERNEL to
> GFP_ATOMIC to avoid scheduling out while in atomic context.
>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  mm/kasan/shadow.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index 88d1c9dcb507..edfa77959474 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -301,7 +301,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, un=
signed long addr,
>  	if (likely(!pte_none(ptep_get(ptep))))
>  		return 0;
> =20
> -	page =3D __get_free_page(GFP_KERNEL);
> +	page =3D __get_free_page(GFP_ATOMIC);
>  	if (!page)
>  		return -ENOMEM;
> =20

Oh of course you can't make it GFP_KERNEL after the
patch to take ptl even for archs that don't use lazy
mmu.

Thanks,
Nick

