Return-Path: <linuxppc-dev+bounces-7590-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA933A85458
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 08:40:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYnBG28CDz3brm;
	Fri, 11 Apr 2025 16:40:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744353638;
	cv=none; b=aAHP+Zfgkl1GVveXzBp12QDVjfik+OHIEU0GsDw/JJ8tVS1EjTcYGl/9RLtM0v3gJed5kITnNjfCrSztL0x6jtbapQIOJjveRVS1E1OFbXwKkjT6j+29NlrgIWbja3qvw73J9Y14G76RaIyJPgfoSWtc0Uz+KcQ4P/pW2z5Uj80GGZJG6FNlwPkx6jBCr4pB03IGWjS3Nb0aExPfKuFAXp4neY9pCZz42WrBcExt/BsY9uECzm23MaS1aqQMG7q9hZ9VlaebSD7ZIJAmpLcUKkFQ0NMhVTIwez6RwSOdOymML381alyPXJZF8JX+Yo0tB1v8IvYnJIyRo77TIx1w7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744353638; c=relaxed/relaxed;
	bh=WFEK5BUAzhnm7Ls0LSYKvyunOzyOHTaf9tKVCyYIPn0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oRo203adbFaQvuRfD8Iol2POj0p+iygNYmXVJfLXSUfnfGpKuSbuZJXHfsxpfLVKqmya/3xyhPv0h28sPEKuEd6g3s9eNN+L2FyWnj0wmBiUSQiiKz43QRlT88IVEcqmrhK9DUR1O2jPNyNTuNsnT9+7hImxlhRf6/a29OFCJ4jso9KjmpuxhLVYVnrbsp6Etmqd3f2ex+KJJ0+TLZ+QLErjMsbA9vgNqNQYbcYL7loZWPHfvjC2BWq087+N8lcXVtGxLF3sIKzetAqWNUKgorzSQOibkyk6PMM0bx99yw/YokhtoxtFjY0SQ5uaKfPlE3g9XA7mUNVOZIajW8vFCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lmSHKIHF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lmSHKIHF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYnBD4CDJz2yfT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 16:40:35 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-739525d4e12so1515862b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Apr 2025 23:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744353634; x=1744958434; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFEK5BUAzhnm7Ls0LSYKvyunOzyOHTaf9tKVCyYIPn0=;
        b=lmSHKIHFGdohCIn3LpxwGtPK/z27fltxXRjKXJ2fzsN2gYtIkfKNK23v494GS+DT3E
         gURtkbuUi20cTmKUQVFEFXzFW1ylfY0qrWyvkMXQEirss+OXAIIOl9WQD3w6p7d5Wmtk
         D0FVUOLEGOyffsXhKR14Z/KGiHs7SUZjAV9g7C9lP/WKPXn7/ADfX7hA0rxJNvKQUIsK
         G1GO6CSlygJqwYGm6Iw9Ihdm2A2iQ27xTaLYiSB7b+4TruoZ7K886jT62+FtlvdgdRsF
         OR9XoHGSrBJpAaU+x9EaOjrhyORv2vXKbWkh4NWIkPu/FfW/L7SnvosonKBysGQSNJgq
         +Tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744353634; x=1744958434;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WFEK5BUAzhnm7Ls0LSYKvyunOzyOHTaf9tKVCyYIPn0=;
        b=qEJ9H01y9Btah/Q6aOdQesXG7OPQtMagJA/Pf1U8CWsPGLOiYstg5DRNNxD4I9lYvz
         /T7UYBFVUaISrc2uH+v94nmcUxfPn0P6fiBZg9n7eu0nP8eL5WYo+gAX99bnNkxTMB4G
         v7vpXemqLdoNOEHWSODDODjaR254Knlv2ZUexWW7AeyCd6L/0u6YvP76jHEHpHi0c7lz
         4+tdtkHJuFV6vV44gOTQwtWCQcmnBrjk/CC3MFQPkoUk4j0gol3yL1tAzbR0R/s1qxJn
         HaiyioQcsmHRIzMMnEJBr4hEJI7CuOSbmo1D0L5ma5LDm0nrr2yLw+4gxKxYF/dR8Q64
         1eiw==
X-Forwarded-Encrypted: i=1; AJvYcCWUv+LpdF1u9zM//abYlyOxgqTNcnb30t50nYr/aG88Jp9fKwuAqcdo7ACuQBvAjqG8ahqTYA0DZHfb2Gw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw5qchrtvm31Ja3Iqx7947C/BQUqe4sl1bTeJm6K4fon4/pPa0+
	p2R4xRKAv+ceTQRTV1Yoiu/hfQoAPgpOESI+a3kmlzEEamg3D/rIYoKr2w==
X-Gm-Gg: ASbGncvhm7ZV8xBAFe2tKJqXWrQzvybYM4yERTd4xtaeD3N3GBhniDG6btR37Z0B+dG
	BqaJET/GtRnXIr0zILwd7KDI6lAGRDTmjU7L+dJ/dHqdrbSwY6ohGHjZ/War8xwylgINfKha/sq
	BCh6afzquSQRb0FENR4b1wRvUgTC4pOjQ4FhcaKnnWnwk1UjvJu8M48dugyqBQcw6D0Lfkewv1E
	R98Bv9a6/3lCwnTX2bHsz1vzEGDB28yvjRRTHvSxGE/q0K+EgpRl6ZPUGAcDzN6spDCLulGXC3N
	IdX3Lhl9+XTYlHExpc9rkQ4W7TkLDvqGLw==
X-Google-Smtp-Source: AGHT+IGxv2OdTwUHRm9UMQ0BxuItHKpv+vDYxaqSXEB9Rf30X+vmBhY4lLT/tgRpdLMgX439EpkNdA==
X-Received: by 2002:a05:6a00:13a1:b0:730:927c:d451 with SMTP id d2e1a72fcca58-73bd12a9926mr2119650b3a.20.1744353633666;
        Thu, 10 Apr 2025 23:40:33 -0700 (PDT)
Received: from localhost ([220.253.99.94])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b029dff3b64sm4083209a12.0.2025.04.10.23.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 23:40:33 -0700 (PDT)
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
Date: Fri, 11 Apr 2025 16:40:25 +1000
Message-Id: <D93LR52FZ2QR.399C9CFVNU658@gmail.com>
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

It's a bit unfortunate to make this use atomic allocs for
archs that don't need it.

Could you make it depend on __HAVE_ARCH_ENTER_LAZY_MMU_MODE
or is that overkill?

I wanted to remove ppc64's per-CPU page array and replace it
with on stack or dynaimc alloc array in the thread... but
cost/benefit of working on ppc64 hash MMU code is not
high :(

Fix itself for ppc64's requirement at least looks right to me
so for that,

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

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


