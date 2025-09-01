Return-Path: <linuxppc-dev+bounces-11544-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D2AB3D809
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 06:00:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFZs50Hgnz2yrp;
	Mon,  1 Sep 2025 14:00:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756699208;
	cv=none; b=lBpUR9g1MKfa+U4vwBK6EdrJ90reoFahG04w1h5H6k+P6eFiiLc5/ohb/KnAU0+u1pq2cGWXKN32FOuBFZC8fSzu9+gzaUrAF+i2dEvieIfJ15aj310lWrLo8hGhqzpWUjIax2jm7DezlAyWZxDAWny7akfNinyw61tP1/0ufRJoTXt1mWCwkFHimxKGEG0jqDiwouNhTT1CDn8gQM27VJVPBqotn+J+mOnaS+5A/DWCPW+L8Cb8LsFZ1/ILme1KF6ccza82SK83SpPz5jEInyZz6npaTvj0jXnmq6mxu6SPy3WcFO+h1xMONl9FuD+caPKytAQoEvRpig7QR4QAYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756699208; c=relaxed/relaxed;
	bh=RNN05k0SkEGnYtipDErhvvyExHnexROka07GUDG5ZG8=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=edeYkgELUcZ+CFoOWRRswT/FZB10Y5dnGDWUtbrlkN1vfYW2JHDkziZJodE55JTY5LevZOrr0VB+FoLPdzGp99EYdFdGrckJCXNXGixFBqzGB5uUGg7owueqv0I494v245QLXfQtbki5ygO5W/jCC1Qk+TQ/9iIU2Ue68QPt1oemCtdPmk9GisHA87A1KTsu+zRhgPqkdJsvTi+MW8Q9dEyIdf+rJovnYHDa2W066aeNf08wN2KMFDkuJxpvuz4SFtLmjPxvET2xLF98qIo7ZeUyWQLkj5lEE2g4nSfHOHnTEdR+Fs9jtX5O+b+xUnyn257d9MB6LZ2+T7ziRD+mcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BKgTp1dP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BKgTp1dP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFZs26jfKz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 14:00:06 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-24457f581aeso35000225ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Aug 2025 21:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756699203; x=1757304003; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RNN05k0SkEGnYtipDErhvvyExHnexROka07GUDG5ZG8=;
        b=BKgTp1dPJj5j8YVO4oHyj8YyMTS7BjrhZczxiGB1i8s7FKa/3S0IZvEFkAhCp/Ez8u
         Zq4oP+BA5F1U6BSmBMde7q7HCLXtqitsReCDlUVrTFqNMn6hfEjy5/rXibGEzSckSY7R
         CWLzElDY8j5i7g8zhNFqLifCur4HqrKZ+RWeXjc/yoaokqC9b/aWqXn6+zSjV2BP5BGi
         jplbNkR4CQyNfSrFRAGBhGXYfPbIpz57Cqs94oeJQ8C0oawMI7FUIjOvq3hJN8t/XhXk
         1qG1S+0+gPsBvwqg0yPyopqS6cYfa/Moy+SKIok6ESP5Cq4hsli9sYUG5KY/r1O6Iw2G
         wr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756699203; x=1757304003;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNN05k0SkEGnYtipDErhvvyExHnexROka07GUDG5ZG8=;
        b=I/m/iFVrHvcqLK5oJaPNM4bKae5O57ON5mdzbD5OqD/yUZCDRbT/iKDZEwSlgsy+y7
         m1Yi2ppvtD7WIGwcLRJR+hnEYYydTJ82D60BmZKixhNLsvBZ3t4wlk6bvF5i0r2/TONd
         30WNOFuhjNuapOE4Yj03q9GINq4136VFg2Yyefb5oyIYlgp3KOJVP7aaELK/Ecq9fpBO
         udoJElbI1/pXm6XEWze8R+cTlQ1oWr8GVmvc9WMZPfjCDYNe1EZuauZF2IOEjuzwKBbi
         QTZgt8Fu5aCfjjWPzfIWe/SyXNYuPgX6/RAby6y3pUgiSUTEQyEJGkiQkZGf86QJ+p4A
         rTZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1N/UVlaxXqERYwTQ9vz5FVunqmJ5BYJ1eHrcmse737dh7jgtkRPu3Ijl1VvWyfkGLVBSH3KFlRwMSxAQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx9uyzOAJDQM3AGcB7y+Fgg+lKVu7ZpEcgtm2oi7rypY5i/nZEb
	OcyFRK443eD9fhOOTD1YbdYrgwTH2kmVojkp60U3UW1gcgYxQLgr5jGeMSrxpQ==
X-Gm-Gg: ASbGncviZy85PNsCVEpeeifCUZop7zBpq6uUJ4mrOdKB1KYOv2oiPQHqR+O2KouDX9b
	m11wxOGXOaNFS7X6uvIm9T0JM4D971ysc6ONOjJp+XPokI2bxgu5GAvujQ4W52AQY9TB5rYEsb3
	xkHrmjhXfDYR15MPadgPnNnOzpTenclZelz1qwvKXjriz9IMG3hxFBig3wv881BSwLlaoKMrBsM
	yh+lofP3t07PgMoAG4Z4SCCi3PN7lCjKoOVxU6mDHWmFEyXC3eDbslV1W1fSCi4O2JZMnaISUnF
	PWJ4eLgPxslfgFWgBTCdCMlrpbc/M791kGco7EsbZH5ZNWBwHuWHfAthGDGNGPALLBgz1DuqKIV
	dzfDplvDWwWPZKaelAY9wzYI=
X-Google-Smtp-Source: AGHT+IHrROqEQWLo3tJoOV3keKTK3UQx10WUIKtupLxaoq9MHd/qKW3me+GT+z8VghgqjcA+jQjk9A==
X-Received: by 2002:a17:902:e745:b0:246:e1f3:77b2 with SMTP id d9443c01a7336-24944b65071mr78080455ad.53.1756699202873;
        Sun, 31 Aug 2025 21:00:02 -0700 (PDT)
Received: from dw-tp ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249037022d9sm90560065ad.23.2025.08.31.20.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 21:00:02 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 5/7] powerpc: Stop calling page_address() in free_pages()
In-Reply-To: <20250826205617.1032945-6-vishal.moola@gmail.com>
Date: Mon, 01 Sep 2025 09:17:44 +0530
Message-ID: <87plcakf4v.fsf@gmail.com>
References: <20250826205617.1032945-1-vishal.moola@gmail.com> <20250826205617.1032945-6-vishal.moola@gmail.com>
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


Hi Vishal,

"Vishal Moola (Oracle)" <vishal.moola@gmail.com> writes:

> free_pages() should be used when we only have a virtual address. We
> should call __free_pages() directly on our page instead.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please also cc the respective subsystem mailing list if the changes span
in their area. In this case that would be linuxppc-dev@lists.ozlabs.org
( I did it this time )


Thanks for doing the cleanup. Yes, it makes no sense to do page_address()
here and then free_pages() doing virt_to_page() internally.. 

The change looks good to me. Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index be523e5fe9c5..73977dbabcf2 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -780,7 +780,7 @@ static void __meminit free_vmemmap_pages(struct page *page,
>  		while (nr_pages--)
>  			free_reserved_page(page++);
>  	} else
> -		free_pages((unsigned long)page_address(page), order);
> +		__free_pages(page, order);
>  }
>  
>  static void __meminit remove_pte_table(pte_t *pte_start, unsigned long addr,
> -- 
> 2.51.0

