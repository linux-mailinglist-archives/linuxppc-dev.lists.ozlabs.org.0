Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1328D2254D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 02:04:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B925g1LtwzDqll
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 10:04:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OaExb+xE; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B922G6zfZzDqlp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 10:01:26 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id j19so9440949pgm.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jul 2020 17:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=Qp/O47B+/PTH5X4r1WOkvdClsD8CXSU1831njywVtAo=;
 b=OaExb+xEqxuCJzRAkbSTE7/vjzqXUxq0pS5W7iEGg3sQSK7pKf41wbBSVIuJDpORU0
 5FlO6/kh4s4F57PcL+uXBcfem6TRvn6uYQelzWm8U/ppLVZPQXH8e4ZcSxiaGro+a1eZ
 TZX4IrosFE9de4fHS1QpS4Wb5yZW4hmz+AzHAPmmXz2vpnpmOqP6JdFboPpwngh+XHEE
 vwQ0CQFfoxP0kpYEmERctaoqftHj6ymkgTfHbAwiN+A2OFQEZ/i7o9SBgN4lTtjNJUKE
 uuNBY9bCjd9IvAh+L8Ugd89CCS2JdzBywV/ENymGAV2itR5dCxel1E3OSiqdnsFEVbIa
 6OyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Qp/O47B+/PTH5X4r1WOkvdClsD8CXSU1831njywVtAo=;
 b=Mi3s/praLA3Ix0mFOrWe0UcJh4RZyMnuZFNi2CR2A3EO1Zkbj8UAuSNXcstvduebFN
 YLhXx+v8op3Vj9cnlPh/OqA4PhPD83dgNudH1zvWbCqTSMMg8oqEIUS0lY3INBweW5S4
 ityHxh9X/OWh29Pm3ajHg6/LL/RXOtE1MVz7e86irzd+uHvSmvCWRdYTfyW++gMlSnnm
 kHNQKdmp2H4QTXSpMrgiAOw53Ksi6EYyU7Ao37O3WvRCfo8Oo6c1k6SJ/cIlo2DlpAHY
 TJc/YNQsK/kL8Wf5Frbb22ptjxsUe4/UdbSc/joFVJcNQAw/xFGftxXtA5cK6RbnwU/5
 Xttg==
X-Gm-Message-State: AOAM530q8WkzCSwiJD6fZg64A+IGPh4tASvB+DrpvALimhSdt2/WB74g
 pQ+7ZK9vK3ARa69Z9fUyOG+X7uNf
X-Google-Smtp-Source: ABdhPJxYwegdwxjg9r4YggaJjpy8/UCuo3gHlm19zg8v0ePWpunlzjf/YTaJClvq282r5JEsBMdI4Q==
X-Received: by 2002:a05:6a00:2294:: with SMTP id
 f20mr17462713pfe.126.1595203283725; 
 Sun, 19 Jul 2020 17:01:23 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id y6sm9807212pji.2.2020.07.19.17.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 17:01:23 -0700 (PDT)
Date: Mon, 20 Jul 2020 10:01:17 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 3/3] powerpc/powernv/idle: Exclude mfspr on HID1, 4,
 5 on P9 and above
To: benh@kernel.crashing.org, ego@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mikey@neuling.org, mpe@ellerman.id.au, paulus@samba.org,
 pratik.r.sampat@gmail.com, Pratik Rajesh Sampat <psampat@linux.ibm.com>,
 svaidy@linux.ibm.com
References: <20200717185306.60607-1-psampat@linux.ibm.com>
 <20200717185306.60607-4-psampat@linux.ibm.com>
In-Reply-To: <20200717185306.60607-4-psampat@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1595203265.suaijimybo.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Pratik Rajesh Sampat's message of July 18, 2020 4:53 am:
> POWER9 onwards the support for the registers HID1, HID4, HID5 has been
> receded.
> Although mfspr on the above registers worked in Power9, In Power10
> simulator is unrecognized. Moving their assignment under the
> check for machines lower than Power9
>=20
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/platforms/powernv/idle.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platfor=
ms/powernv/idle.c
> index d439e11af101..d24d6671f3e8 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -73,9 +73,6 @@ static int pnv_save_sprs_for_deep_states(void)
>  	 */
>  	uint64_t lpcr_val	=3D mfspr(SPRN_LPCR);
>  	uint64_t hid0_val	=3D mfspr(SPRN_HID0);
> -	uint64_t hid1_val	=3D mfspr(SPRN_HID1);
> -	uint64_t hid4_val	=3D mfspr(SPRN_HID4);
> -	uint64_t hid5_val	=3D mfspr(SPRN_HID5);
>  	uint64_t hmeer_val	=3D mfspr(SPRN_HMEER);
>  	uint64_t msr_val =3D MSR_IDLE;
>  	uint64_t psscr_val =3D pnv_deepest_stop_psscr_val;
> @@ -117,6 +114,9 @@ static int pnv_save_sprs_for_deep_states(void)
> =20
>  			/* Only p8 needs to set extra HID regiters */
>  			if (!pvr_version_is(PVR_POWER9)) {
> +				uint64_t hid1_val =3D mfspr(SPRN_HID1);
> +				uint64_t hid4_val =3D mfspr(SPRN_HID4);
> +				uint64_t hid5_val =3D mfspr(SPRN_HID5);
> =20
>  				rc =3D opal_slw_set_reg(pir, SPRN_HID1, hid1_val);
>  				if (rc !=3D 0)
> --=20
> 2.25.4
>=20
>=20
