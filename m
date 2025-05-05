Return-Path: <linuxppc-dev+bounces-8278-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDF8AA8D52
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 09:49:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrYZl67DXz2yf9;
	Mon,  5 May 2025 17:49:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746431375;
	cv=none; b=NAx/cUiN4uwv28u2km4Vug7wb0CiMamKrPekw2VNPuGVwf9OrOpyhXkp2DlFa3CHEa0ZpQecsm1FoB6oqTdZMUkiw3AeiKxOoz7lj6dLb3STQ2CV7MRypIS/tWmDAsXFnljPcuc8R7/UQDhfkgHNwuZjpYO7pHvdM2ivra50bT8QVwlVBirj+x2cXT2I40E7YQmczULiImCg97NeVGiI36nEur5VrVH8ftji4S7QdqTXZM+hPMv2Zygz6gPU+i6Evd4kGD4uBVGkqFNTUr4VZLIr5sVDFhUDKeDAIIo+5tToGxtuByl/fbH8XKOPInCkk4hzI/ffw27f+uH77YD26g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746431375; c=relaxed/relaxed;
	bh=9n62oCxRgeeTCTbh9dONu/vhmceSSlNkgyqeLcA3kK4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=A5qNKKeFoyQtqy2aKpqblpTGLT/caQ00mK9OWj+1AYwfcRYYUs1+ttpUute5qb6l7+ToQINGIBE3UNluqqJQzJbPP+Jrj2Rr/5QnNrP/i5XPHaZpMp5Pp0qKYH7nVe/npKkWuIbTe4iVvYlAJ/LkX1rHeF6W8LcRdftSPa1OpozUPeFzl2UdnQ7lwSpWiD697UjHFtbDc5kfOJigWkXQlnOgpHIUFVgxLSIbH4/0zu5T6clX16B9g80wktioB7HjC/+XcCbqts1m26Fob5jpxN8WsoeKWhrD91K6Z6NRroH6VfGDFzEEk3VDR0qQGaGc6GkCYt7qfyacAgZSR1E6WQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wu446dTG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wu446dTG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrYZk3YcFz2ySV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 17:49:33 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso5774678b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 May 2025 00:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746431371; x=1747036171; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9n62oCxRgeeTCTbh9dONu/vhmceSSlNkgyqeLcA3kK4=;
        b=Wu446dTGpbkIXCLMjFDTYzJ0HLPv3Yaf4TDaju8UgecHW4KtULiS77qHRclUNCYqTd
         Sb3lsXQtJZTif2BNoBNgMySvW7ozaNIrUxQcuvnNlmLZmGqVdi93iP4WcPUnSf7ZQG5F
         aFsKyAlnm5BF/Gn8yeM7Z3B0H7YZXPBo8TsVVwaEfg5V2PbnKDgTYxvD+sU6n//VMzVU
         nP5FcLw9E6KOT14hKQAwPZwu2W9tTib6hb/d0zcfWhDhF9jusEudQmpZcLEAh6x0Unow
         kjg675WyNlGAlris1yNfAIVz+gE/OdO6h/E5v5xRT5eoRZsiVusP2BNhCYD4FsU3Z37Q
         MC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746431371; x=1747036171;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9n62oCxRgeeTCTbh9dONu/vhmceSSlNkgyqeLcA3kK4=;
        b=hKq2CDg2erfjzVohGucTd1FCh5KW7iNTZdyy4eTSJB+2XM1TZAz4Gwk4qc3rompcAG
         Vy9nQlP7ggoIJUgOCve4CZZwjF1qe1xNmaIbdjOz/urQYMSYPpgPZkxeSbZEVq9xIKMB
         72m/O4qVJF74eea8qvlpvYdPyXHtSBKkp0BrOxrIPTfg5OP5hDLoHFUl9YUTGgByy2aJ
         8z+6ZWnTF7UW+VTJWF1DQZIrp25q6YEjE+kiAIvIjuO4LXRVzbsxPSEto7DKuxU1Wp+2
         OFgvAgWe9sjhfN01fWlg37EU7rdUJ5EoagJ48YUMLXeNc6M3bueszC5bsSCNzBP/+Mgj
         pIkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMatVIM+LoA3KM5G9i3pK77fw+40HHDzu+Mwo+EaCpEYoq+CxEKoYpiF/cgTWuORqaN38zw3y0330nh4M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxa2mOP1o/EJ6ZOJi6QxrvOy9EkM4Rp2xTmg4jAbtObsnGy1COh
	o2K4Rmb1dHDnQgS9qAZYvlkJzAw+hA1tbtehAnu7vl3EZ7gB0kax
X-Gm-Gg: ASbGncsvxQrFmoQdROvDfrwzXv1W+soMh1lFXxexHneE0FxM9FMcwtk/LZLnU+Hgjlf
	MYFaAAd2GzrTHykTJ+/Ty0a8GeL8UoUXGx7Vnqv7+1hSB7rr+e2Ht0gSosQ7xgOdw7LUiOKssdy
	bRACoBVVaT1K/R47HU9Ln+FO1AI0mSe3OKiRWHykOLb/J6mLfCZdh5WjvkcvNjeRsnLJGGcgi24
	wpxyz9uiYwWBb2G4poHgxmQFq8wPPfP9vt3C99paKDwKYnnBxNWO7u4y/4c7KCDDc+7+Acxn4Ip
	gZeTuA8r+W9fHfaamZvvA+OC8uMSN2E=
X-Google-Smtp-Source: AGHT+IEYuFVDnIjzV9K0AMi7hDserIpOlUBVkVj9T9bwXFqSmujqxRySnLvmGH8T8VDjHoioU6VPfg==
X-Received: by 2002:a05:6a21:3388:b0:1fe:61a4:71d8 with SMTP id adf61e73a8af0-20e96ae4c9amr8488842637.22.1746431371369;
        Mon, 05 May 2025 00:49:31 -0700 (PDT)
Received: from dw-tp ([129.41.58.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b5b6d2sm4923970a12.25.2025.05.05.00.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:49:30 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Donet Tom <donettom@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, open list <linux-kernel@vger.kernel.org>, Donet Tom <donettom@linux.ibm.com>
Subject: Re: [PATCH for-next 1/2] book3s64/radix : Handle error conditions properly in radix_vmemmap_populate
In-Reply-To: <e876a700a4caa5610e994b946b84f71d0fe6f919.1746255312.git.donettom@linux.ibm.com>
Date: Mon, 05 May 2025 13:06:21 +0530
Message-ID: <87zffrpkzu.fsf@gmail.com>
References: <e876a700a4caa5610e994b946b84f71d0fe6f919.1746255312.git.donettom@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Precedence: list

Donet Tom <donettom@linux.ibm.com> writes:

> Error conditions are not handled properly if altmap is not present
> and PMD_SIZE vmemmap_alloc_block_buf fails.
>
> In this patch, if vmemmap_alloc_block_buf fails in the non-altmap
> case, we will fall back to the base mapping.
>

We are trying to create mappings for vmemmap area. In this, we first try
to allocate pmd entry using vmemmap_alloc_block_buf() of PMD_SIZE. If we
couldn't allocate, we should definitely fallback to base page mapping. 

Looks good to me. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


-ritesh

> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 9f764bc42b8c..3d67aee8c8ca 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -1173,7 +1173,7 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
>  				vmemmap_set_pmd(pmd, p, node, addr, next);
>  				pr_debug("PMD_SIZE vmemmap mapping\n");
>  				continue;
> -			} else if (altmap) {
> +			} else {
>  				/*
>  				 * A vmemmap block allocation can fail due to
>  				 * alignment requirements and we trying to align
> -- 
> 2.48.1

