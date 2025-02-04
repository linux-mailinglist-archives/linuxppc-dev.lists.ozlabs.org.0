Return-Path: <linuxppc-dev+bounces-5823-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B2AA2793A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 19:00:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnWPc17gGz2ynf;
	Wed,  5 Feb 2025 05:00:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738692052;
	cv=none; b=c8IujfchAJqqSJuAHAYmGYCWANH4WDHFm7cCgf26zEU6+1tLeTTSHyhy/V2AOCHtZCIWaq7QuoSEtSdxjp5NdeCpaewHTmcQrqpLGK2dqtnoT1g9Ld2JWlSB6/+gVRoEpbJa00LM3WD+kRPdSHtblT5WFiM3fsHg3JgCef3S9RGCM/ueSMOFa3ZmIpUbRx/FZCoNXQBypGV8lCkFw+fNgHmfTqFb5dT8B5ZKAe8RLh/FWn4wRxwIQqcenjgNUZ+Fl6QVSpX1AQMcFh175cz2UKFWLeDYGLZ2CQSbZ6MYvhZ7eMeSsCd+HJiu5EH1xN5OwlFysVcShooXd58NTOvAxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738692052; c=relaxed/relaxed;
	bh=p4BrePS0fFQD/QD8FvsbHn3Mfrtvj9wf2XmXlzwXrEE=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:
	 References:In-Reply-To; b=Sd/G0X3jg2RKXt6NUz0G72NJ/ND/XMghyUB+makwxj8kWjbg8T4V7EeFYQZrc5bAG0t7GDeAH1GSU+WdO6SwqhGpNx0JbqzCoTM8NpV3w6dXnMzQ8TLWjruhGzwYzkrTzpL8B7WGKnPLBelgbsmudIxCwOs3xV/z9cFSOGW1G+UpyDprYZrU5PpXYNo5iUpg7C7p6K5OXHi+HVpWMj7zGxJTdD6pt3X8DVxwLxPK6bT1lq5HCowot4/GYh3GYo60qommXwWD0hiARfyTpxxmo8FRqurHM0gIBUxt2/UgHQJ45nhvEx3t1VdizyFgC3fDfbRFjlyTDbxjIXjjaMT4vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=marliere.net; dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=anaGa5ZR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=marliere.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=anaGa5ZR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YnWPZ4jxNz2yXd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 05:00:49 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21f0c4275a1so11341595ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Feb 2025 10:00:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738692046; x=1739296846;
        h=in-reply-to:references:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p4BrePS0fFQD/QD8FvsbHn3Mfrtvj9wf2XmXlzwXrEE=;
        b=iqn8usRBSO3aI23/SnEDITFhgsLv2x5glyYeMd3s1KjmjOgTVgbAszbliDk2LJian7
         EACIQBPm+df2/J6tl4y5g41OD3Xo9rr7OuPA4WH30qkbeBslCG84U2IskTkxtIf4jl76
         TwprG3q076mZGbTws8OHAwqNakpolNlbZ0ElEY9cyvA6QU8iYTuG8Ig6C0FRP9JTwIkj
         6NioF8BNbuUuyyA1l5krc/6n3c9mgEX/nb/ct0AsaIuXKxd7o4eWb0WcayH+pb3j/k4/
         unNI8LKK/vX6uLP4RmNDZvnLkfy3D53js//QUxWw4PoZa3lJfuiz5jjv2Bn8b8Y0EN6A
         kpNg==
X-Gm-Message-State: AOJu0YwOVHEs5QTTrG1VKMTGJLKW+/ud17rE+cPMhQPs7c3qfQe3IUNI
	fGCQzAF6BfMcaMdVcD5KBPMOd0H+N79BLi/6RgiXyLWhEolrf+FL
X-Gm-Gg: ASbGncvwuWEpEO/3+Md+xn+t0e1cWQQmTZF2AMPDaXeztvJ4G0Uu2WYCzyVwcFfH6CD
	giK4PAQ5IhKResHP+cdXeQtpBqW+jdmC8daOPecwdwRBUWHMj+16xWzr+gm0arW8LPZEuH8lamw
	RfIJr9FP/ptF94A5HaepbBx8pYR4RYEt2Jjaed4ujrxJtB+HYU75o0+2/nXKeVIKHDLn1cpk1Ro
	4YuEdqyEhQrwXsMQKOAv6FBkqBWkjuFenAcVVBgUsHW2OxkBMQQzXd8apEPn41hL2BH+5+rMKmd
	BVlNYoVE+mpZUKdujZ+AqnkdXYggbOhf
X-Google-Smtp-Source: AGHT+IGqsJHwNzlx6+9TM9JAKnHUvbOEo++rsM4TM/HlHp4qmsIxp1HY8hVcFBZ2xYwbS2nKoso6hg==
X-Received: by 2002:a17:903:41cc:b0:216:73a5:ea16 with SMTP id d9443c01a7336-21dd7c66121mr409530815ad.21.1738692046502;
        Tue, 04 Feb 2025 10:00:46 -0800 (PST)
Received: from mail.marliere.net (marliere.net. [24.199.118.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f0b769f64sm12197265ad.238.2025.02.04.10.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 10:00:45 -0800 (PST)
From: =?utf-8?B?UmljYXJkbyBCLiBNYXJsacOocmU=?= <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1738692043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p4BrePS0fFQD/QD8FvsbHn3Mfrtvj9wf2XmXlzwXrEE=;
	b=anaGa5ZRSkGbg9bx9edd8rXVHLwL03LIasVGFRpPg8M2UhoC0fXXpxJEZHIqPwZD8QUhcF
	vqN3dQaag1E2N5chuhAtvsPeC/VLB3ll1uHp+jjQNE4kwrvC3OtHGc6E7Xjf2HO9fV6TFK
	wXUABPRO7O9aM8fe0N9W1kZI+GXXqODG1drWQ261ZREqQ7MJpKZzMiU6Uzftw5HkbEXef1
	uFnQ/Ki/h2Bx+ulTs96GMR+8xzku+HmXpbw6R5rlpUDxHtXBMvkNsAEw6vnZBZ3XbLJ3/h
	QL9bsHKHQe7DeJCgpCQ0Hr7eo613hO+0TiguJW7CaMs5b1AQLZWKviACawaUJg==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
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
Date: Tue, 04 Feb 2025 15:00:37 -0300
Message-Id: <D7JUVZEI35EG.3CK5XCVGHEFN0@marliere.net>
Subject: Re: [PATCH] powerpc: mpic: Use str_enabled_disabled() helper
 function
Cc: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
To: "Thorsten Blum" <thorsten.blum@linux.dev>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <20250204154424.4231-2-thorsten.blum@linux.dev>
In-Reply-To: <20250204154424.4231-2-thorsten.blum@linux.dev>
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue Feb 4, 2025 at 12:44 PM -03, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_enabled_disabled() helper
> function.
>
> Use pr_debug() instead of printk(KERN_DEBUG) to silence a checkpatch
> warning.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Ricardo B. Marli=C3=A8re <ricardo@marliere.net>

> ---
>  arch/powerpc/sysdev/mpic.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
> index d94cf36b0f65..25fc4ac91814 100644
> --- a/arch/powerpc/sysdev/mpic.c
> +++ b/arch/powerpc/sysdev/mpic.c
> @@ -27,6 +27,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/pci.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/syscore_ops.h>
>  #include <linux/ratelimit.h>
>  #include <linux/pgtable.h>
> @@ -474,9 +475,9 @@ static void __init mpic_scan_ht_msi(struct mpic *mpic=
, u8 __iomem *devbase,
>  		addr =3D addr | ((u64)readl(base + HT_MSI_ADDR_HI) << 32);
>  	}
> =20
> -	printk(KERN_DEBUG "mpic:   - HT:%02x.%x %s MSI mapping found @ 0x%llx\n=
",
> -		PCI_SLOT(devfn), PCI_FUNC(devfn),
> -		flags & HT_MSI_FLAGS_ENABLE ? "enabled" : "disabled", addr);
> +	pr_debug("mpic:   - HT:%02x.%x %s MSI mapping found @ 0x%llx\n",
> +		 PCI_SLOT(devfn), PCI_FUNC(devfn),
> +		 str_enabled_disabled(flags & HT_MSI_FLAGS_ENABLE), addr);
> =20
>  	if (!(flags & HT_MSI_FLAGS_ENABLE))
>  		writeb(flags | HT_MSI_FLAGS_ENABLE, base + HT_MSI_FLAGS);


