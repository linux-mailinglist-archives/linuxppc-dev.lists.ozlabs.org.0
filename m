Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A7F21CF0F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 07:56:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4tDg0dcmzDqVb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 15:56:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=u1MGfil8; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4t9b2FCpzDqSD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 15:53:23 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id j19so5548464pgm.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jul 2020 22:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=uecLSSMQGQtX8OytHhkOZFnvFTK3OHFUY42nNLg3ABE=;
 b=u1MGfil8qHxrkbmrq1SmKUEnko9AGmDv47/jmi8HKQ0vphBT/9ulAAQxIbKhnlPyby
 bRiw4T/khixQOpD16g4LZuIn7Ev9omDdAw8P3FfKgBU3iEVGnDupb7JTEtvmWq4+FY2K
 eLvR/rR8SuRLfdW3mxfYUjsXlTvtgBIS1LU2YbkrrfH6rPnWGse8bvwKu3bVNDkSqJDh
 to//Yy9HTPjRcsZL4xshJCJtDvnfjzDEdfs4Up2flgDjCE3QxITLdhs4SHLa9IbZTLiS
 cqPughCR86yg2hcRGdzC6nA1Wdhu/594jlBz78Ak3oVAYu216AzSzr1Zp9WJuzjuysB5
 4hDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=uecLSSMQGQtX8OytHhkOZFnvFTK3OHFUY42nNLg3ABE=;
 b=GKtZKe5hNdGG6rJbHfXWS5i7mfokINogBBuFa4y/uk4edS1E9JDQ1j4A6tN/yuzGnF
 S8ZbXRUs7jPIDpBOmOOj23Gv4nVMPjSJzaMR0utDynmqfjTiEo1nTyFTqGCtyB9DtDBs
 Bk0Ly5mTpUVzaygwCJTrLEBAzid2DKUKgDqDPeIsJMHzuPlMdngmx3Unq4oNZvqrIFhN
 bH2wfP2j5Y9eMSefqEsjSEPzo+G63SoG+f3WH5iGR22dDTYL+h1dk9+8Svrog7UOioS9
 8Um57fT1AJYtGOQjFBTqRLQpbG9ctn6WodbU2TMQ6BoVd0FRzwHBfT0202OixFDe00DB
 cU9A==
X-Gm-Message-State: AOAM533nT9WU32JDYiL7SNygLqrhnvg9XrbOeKdNogHnkFRwtMc8ze6l
 smTgKE6BbyjN5ejXpp3K2O0=
X-Google-Smtp-Source: ABdhPJzXw0ZbytaGBaYMr9UpjIoCHbbFgUMOxvQbACypUaCUiUauG1Mf/GrpNgizVfWr1PJRjeFKNA==
X-Received: by 2002:a63:3d01:: with SMTP id k1mr65375789pga.71.1594619600683; 
 Sun, 12 Jul 2020 22:53:20 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id j16sm12090719pgb.33.2020.07.12.22.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 22:53:20 -0700 (PDT)
Date: Mon, 13 Jul 2020 15:53:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/3] powerpc/powernv/idle: Exclude mfspr on HID1, 4, 5
 on P9 and above
To: benh@kernel.crashing.org, ego@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mikey@neuling.org, mpe@ellerman.id.au, paulus@samba.org,
 pratik.r.sampat@gmail.com, Pratik Rajesh Sampat <psampat@linux.ibm.com>,
 ravi.bangoria@linux.ibm.com, svaidy@linux.ibm.com
References: <20200710052207.12003-1-psampat@linux.ibm.com>
 <20200710052207.12003-2-psampat@linux.ibm.com>
In-Reply-To: <20200710052207.12003-2-psampat@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1594619577.gadjg7e4y7.astroid@bobo.none>
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

Excerpts from Pratik Rajesh Sampat's message of July 10, 2020 3:22 pm:
> POWER9 onwards the support for the registers HID1, HID4, HID5 has been
> receded.
> Although mfspr on the above registers worked in Power9, In Power10
> simulator is unrecognized. Moving their assignment under the
> check for machines lower than Power9

Seems like a good fix.

Thanks,
Nick

>=20
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/idle.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platfor=
ms/powernv/idle.c
> index 2dd467383a88..19d94d021357 100644
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
>  			if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
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
