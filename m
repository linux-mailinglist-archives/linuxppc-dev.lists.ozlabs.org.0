Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF01F1D0610
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 06:32:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MMG92w8WzDqv4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 14:32:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AG/psIuq; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MMDM55PJzDqfS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 14:30:41 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id mq3so10554448pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 21:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=7w3gZkV6sgXCjv32AK9kLUdO9hSjGXqlj9yyjGeTO2M=;
 b=AG/psIuqgjbpRku2BRkLoBXAIGZSCgTQQFZ7kIB1EhvitqUBb7utx3Ad6X8EL4pulY
 8uP5H3pCAfZj7ANNNQErd5h0JG9QLJycHeI2TH8x/zKQ7SbNie+I0wBJQ2sUwoylwT+y
 dBDQ1v6l4Rc4d9zsf+vtEXodfnMSwW/m3A1BvcXRle3Oj2FYdRFv42zPw7tOsi8ffM2u
 c71yR9Dr+zgS9TkQafkGtA/im9MYuoPW2wzDAv2Gw2Bq1Q6150iK8icqaJFDfu0RrKD2
 sFeiV1WmthZxH8ZeZbMGhPlPVUHX5Mp6vohrANHoqsp5oXP01dx265lpqUYIctcc4n7M
 gnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=7w3gZkV6sgXCjv32AK9kLUdO9hSjGXqlj9yyjGeTO2M=;
 b=SdBtRJEByanRJnUtGYs6c7iCg22KY9Yt+LpEZK67I+9/C/yg/xWiBwbFNBf6ITUCL2
 ceDYC72pH5YuzanCX4kkko4DJGdpO4FPJaXL7imImel6KcU0OzlbVrez2vd7cAVihpU1
 IiCyUxwvZoHQyCAVHrmmvHTle1m1pkh8+YshcCf7sVxY8ZPig3MsFqCecZRcd4E37y/J
 6A/5UbaXWjPMixV5/rCPSO/AgiTPg1V/tinI1iInig3VaiW8bfxx5ZRX68Msyy6xI3YA
 vuFfYEsoAvBMNJUfiObILwf1V14lUrhEEDT6Ta5ZPjXo/yL82vUw2EnOpXxiZd++CL4g
 XivA==
X-Gm-Message-State: AGi0PuYHYAwQqYB5FPMzELquwi4OdtiVp03gfKaO+soN4d05jYeWNv5N
 4dYLu+vxQarh8DLgVUkZw6o=
X-Google-Smtp-Source: APiQypLs72yfubgR/qN8WwT99DHit2PSfjexoIMaCjZVhQKPBlZ3FxPpFVb1tBzNRkbn1581GWsDDQ==
X-Received: by 2002:a17:902:6947:: with SMTP id
 k7mr21944929plt.298.1589344238245; 
 Tue, 12 May 2020 21:30:38 -0700 (PDT)
Received: from localhost (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id u3sm13390165pfb.105.2020.05.12.21.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 21:30:37 -0700 (PDT)
Date: Wed, 13 May 2020 14:30:31 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/book3s64/radix/tlb: Determine hugepage flush
 correctly
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20200513030616.152288-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20200513030616.152288-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1589344088.xrvol2hteg.astroid@bobo.none>
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
Cc: Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Aneesh Kumar K.V's message of May 13, 2020 1:06 pm:
> With a 64K page size flush with start and end value as below
> (start, end) =3D (721f680d0000, 721f680e0000) results in
> (hstart, hend) =3D (721f68200000, 721f68000000)
>=20
> Avoid doing a __tlbie_va_range with the wrong hstart and hend value in th=
is
> case.
>=20
> __tlbie_va_range will skip the actual tlbie operation for start > end.
> But we still end up doing the tlbie fixup.

Hm, good catch.

> Reported-by: Bharata B Rao <bharata@linux.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/radix_tlb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3=
s64/radix_tlb.c
> index 758ade2c2b6e..d592f9e1c037 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -884,10 +884,10 @@ static inline void __radix__flush_tlb_range(struct =
mm_struct *mm,
>  		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
>  			hstart =3D (start + PMD_SIZE - 1) & PMD_MASK;
>  			hend =3D end & PMD_MASK;
> -			if (hstart =3D=3D hend)
> -				hflush =3D false;
> -			else
> +			if (hstart < hend)
>  				hflush =3D true;
> +			else
> +				hflush =3D false;

We can probably get rid of the else part since it is already false.

Otherwise

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

