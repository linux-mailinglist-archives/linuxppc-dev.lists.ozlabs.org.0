Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2356225720
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 07:40:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B99Y56h6RzDqN2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 15:40:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JYtoSaPN; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B99WN4bKpzDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 15:38:40 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id a6so11119915wmm.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jul 2020 22:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=WmfcXpqEIL5L7r2Xf5cxWU9ZORjSLUvShgyFFMNVo24=;
 b=JYtoSaPNDACpxnN9O6Hhk5yeU8pyXQk/nTlGiKdFdmvSHsYzmkd1VGlQWBB4lQNYJM
 4Q6leo32UE1v6n8+ObYzQNe+63jVHJF7nf/xzZyRQ7NBF6UadL1SUQABaJZGAoyFcn8s
 64S54bpB7JFoZb6c2dAblSuK5dh1gBrmy99/C6OSClj/KrSVroBoOs3nUAXwo5RuLFG/
 MxqRt4DzFkALw7XKTJCeIK9ygWN+Rt6UqElBxxdDbaQQcew5/EQMKgfyJI6GnTFlHvWo
 sjsRYJHlsutGfPt88ovfnD9VguiTdkWVbCBpgIOcXiOveNWYMwX6iv6jL3vuWqfroaSb
 a0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=WmfcXpqEIL5L7r2Xf5cxWU9ZORjSLUvShgyFFMNVo24=;
 b=Q2JSYjIkhLs2Sfm9rNHPopwdkbUadY8PckE7eb4SvkHeYukPP4VR9eXMIj/BMM0m1h
 Y18Zdr5F2aJjgA8vR4sqwhlR6GiUNXdCUWfh07IUZl6fs80NGpL6dtTWAoNnttmd+rm5
 +Uk98H9IjZbI3jy3YyZPsK1vVLeadn9qHEjBdjYXDsyhBX50zRX5QS0r4X+km5Xr/fnV
 INrjWFUXdsEtj10YDlqA9vHQKfgmHanAC8AtPPJ85ObRq46NVR0B4ZxA7YzUsVxhm4a8
 cR0JKfaORxTGm3bsNagtepMIUMFEB7bJYJFh/z1GJibcRYUeslMtNsFETjV7VagXrOPJ
 uAMA==
X-Gm-Message-State: AOAM532o3v2Asjqx8xmApTBSQmvaOixzG4Tm2vslgad+u56YUh8I+VH0
 7vzxOCPgicg5kA6VEwu+LW8=
X-Google-Smtp-Source: ABdhPJzAoErHxCiTjPMdLWfbvrLGgqY+RquHmcdTaTebpwp4w3Y9DX8Ke0cLLoKn6eimPv9T/RzIAA==
X-Received: by 2002:a1c:2842:: with SMTP id o63mr19578801wmo.169.1595223516696; 
 Sun, 19 Jul 2020 22:38:36 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id 12sm29174670wmg.6.2020.07.19.22.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 22:38:36 -0700 (PDT)
Date: Mon, 20 Jul 2020 15:38:29 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [FIX PATCH] powerpc/prom: Enable Radix GTSE in cpu pa-features
To: Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20200720044258.863574-1-bharata@linux.ibm.com>
In-Reply-To: <20200720044258.863574-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1595223290.jz1cmk38dz.astroid@bobo.none>
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
Cc: aneesh.kumar@linux.ibm.com, Qian Cai <cai@lca.pw>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Bharata B Rao's message of July 20, 2020 2:42 pm:
> From: Nicholas Piggin <npiggin@gmail.com>
>=20
> When '029ab30b4c0a ("powerpc/mm: Enable radix GTSE only if supported.")'
> made GTSE an MMU feature, it was enabled by default in
> powerpc-cpu-features but was missed in pa-features. This causes
> random memory corruption during boot of PowerNV kernels where
> CONFIG_PPC_DT_CPU_FTRS isn't enabled.

Thanks for writing this up, I got a bit bogged down with other things.

> Fixes: 029ab30b4c0a ("powerpc/mm: Enable radix GTSE only if supported.")
> Reported-by: Qian Cai <cai@lca.pw>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  arch/powerpc/kernel/prom.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 9cc49f265c86..a9594bad572a 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -163,7 +163,8 @@ static struct ibm_pa_feature {
>  	{ .pabyte =3D 0,  .pabit =3D 6, .cpu_features  =3D CPU_FTR_NOEXECUTE },
>  	{ .pabyte =3D 1,  .pabit =3D 2, .mmu_features  =3D MMU_FTR_CI_LARGE_PAG=
E },
>  #ifdef CONFIG_PPC_RADIX_MMU
> -	{ .pabyte =3D 40, .pabit =3D 0, .mmu_features  =3D MMU_FTR_TYPE_RADIX }=
,
> +	{ .pabyte =3D 40, .pabit =3D 0,
> +	  .mmu_features  =3D (MMU_FTR_TYPE_RADIX | MMU_FTR_GTSE) },

It might look better like this:

        { .pabyte =3D 1,  .pabit =3D 2, .mmu_features  =3D MMU_FTR_CI_LARGE=
_PAGE },
#ifdef CONFIG_PPC_RADIX_MMU
        { .pabyte =3D 40, .pabit =3D 0, .mmu_features  =3D MMU_FTR_TYPE_RAD=
IX },
        { .pabyte =3D 40, .pabit =3D 0, .mmu_features  =3D MMU_FTR_TYPE_RAD=
IX |
                                                     MMU_FTR_GTSE },
#endif
  	{ .pabyte =3D 1,  .pabit =3D 1, .invert =3D 1, .cpu_features =3D CPU_FTR=
_NODSISRALIGN },

But that's bikeshedding a bit and the optional bits already put it out=20
of alignment.

Thanks,
Nick

