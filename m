Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A02951AFF23
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 02:20:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4956mH1H2fzDqkc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 10:20:31 +1000 (AEST)
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
 header.s=20161025 header.b=k3ccSBP9; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4956kY6thSzDqcM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 10:19:00 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id j7so612074pgj.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 17:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=rzfhy/7GkqLrLXWdI03PBD5B9vg3+U9NkiaPJFFGYKs=;
 b=k3ccSBP96ZVc2XR5+cOQHqEi4UfsANKkV+YHkYywJ6/hYtswTdgh3EfwoL8NpSkxlq
 CFFcs5Zas6bDXxPxyeDcx9NOH5CzdP/MNabIkNVZdxTEUHVzpnfRAOGb9uqNebsj3Nis
 HDX5hbC0jwlILooH2mWgRXO17n1hzdcdKulkwbxpeRBPEODsN278z1ovbE6QhdNKgsAP
 cyYYYN57FeydudOsZZMVtOo1kC76kwIFF5ny3xldU+o2jayBhiLzDugyYO9WX52Oeybw
 U6wrApXU8MLjmke39cIhFF7YqQKzXZcyPTp70lNpnp2t17j8GddHjNWBymomIgoPOgxb
 Pakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=rzfhy/7GkqLrLXWdI03PBD5B9vg3+U9NkiaPJFFGYKs=;
 b=QcGGZbRWVp+cX+rFV7Kgifseq8Uoxjq1oEISGfuxPkj9ntPqBUnb74Cm9+Rvk4SL2F
 vEb1f311x7vFlDfk6+dP1AiYEisHuxyLzU00XQYUDk+G9Aj2tNrO3hcNw985tqvIQLa4
 jpJKITvLOsFtDzv2c2syAQVdNJgdR65u2psRa6ACHQUPOnh2reyLWHwFILiN8dUqgAZ9
 Ggfu6mopRKdclbuJjQviq2Q2Q4GvEPsrUPcD+xY/hD5F1oBmieov21f+nDEc6HIqX+jV
 5MJs+GeP8uS0Gojw+y4F+X2twZ/b41KMCx5qMngyAPkqHoEPqgKzKBgq/1NH2rPQmlzc
 c9Bg==
X-Gm-Message-State: AGi0PuaXu3B4Khna55kI1U83CAAfWgeg2MB9LKMGnLVzbzXti/VU44Fv
 /U53PSUGg2OjLLbu8aQwSc8WiOBOado=
X-Google-Smtp-Source: APiQypLVLszX3ON+POFRCMxIDHN3FMu94slg6R8juh2UQkvQ6ZAjYThM2ODcbzBm+/O/u8jdfgBzfQ==
X-Received: by 2002:a63:de49:: with SMTP id y9mr13468046pgi.435.1587341937536; 
 Sun, 19 Apr 2020 17:18:57 -0700 (PDT)
Received: from localhost ([203.185.249.170])
 by smtp.gmail.com with ESMTPSA id 67sm25081387pfe.168.2020.04.19.17.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Apr 2020 17:18:57 -0700 (PDT)
Date: Mon, 20 Apr 2020 10:17:41 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/book3s64/kuap: SPRN_AMR modification need CSI
 instructions before and after
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20200419135359.731325-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20200419135359.731325-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1587341611.capj46kr99.astroid@bobo.none>
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

Excerpts from Aneesh Kumar K.V's message of April 19, 2020 11:53 pm:
> As per the ISA, context synchronizing instructions is needed before and a=
fter
> SPRN_AMR update. Use isync before and the CSI after is implied by the rfi=
d
> that we will use to switch to a new context.

Not entirely sure if we need this. This will restore AMR to more=20
permissive, so if it executes ahead of a stray load from this
context, it won't make it fault.

That said, leaving this end open makes it harder to reason about
user access protection I guess, so let's add it.

Thanks,
Nick

>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/kup-radix.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerp=
c/include/asm/book3s/64/kup-radix.h
> index 3bcef989a35d..224658efe2fd 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
> @@ -16,6 +16,7 @@
>  #ifdef CONFIG_PPC_KUAP
>  	BEGIN_MMU_FTR_SECTION_NESTED(67)
>  	ld	\gpr, STACK_REGS_KUAP(r1)
> +	isync
>  	mtspr	SPRN_AMR, \gpr
>  	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
>  #endif
> @@ -62,8 +63,14 @@
> =20
>  static inline void kuap_restore_amr(struct pt_regs *regs)
>  {
> -	if (mmu_has_feature(MMU_FTR_RADIX_KUAP))
> +	if (mmu_has_feature(MMU_FTR_RADIX_KUAP)) {
> +		isync();
>  		mtspr(SPRN_AMR, regs->kuap);
> +		/*
> +		 * No following isync/CSI required because we will be
> +		 * returning to a different context using rfid
> +		 */
> +	}
>  }
> =20
>  static inline void kuap_check_amr(void)
> --=20
> 2.25.2
>=20
>=20
