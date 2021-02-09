Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65386314606
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 03:04:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZR6H5lbPzDqrg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 13:04:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n2kVSQ1X; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZR3z42flzDrgr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 13:02:39 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id m2so4745772pgq.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 18:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=utXHPcgvm9Y8ZwC4DuYoSqZra3dkj+8uEXyKJK77MuM=;
 b=n2kVSQ1XlJX6xUt/1m2yXy+XedXCXDvoOAa1zzTkBmgiUEn/AWSkU+NLDGSkqgrmmX
 ViwTenSuk6hs2X6eou1rCXLEuV7j89e3DPN+E2yhAIvBRZNd0rMBd0f2eToxAAdWgyby
 0MwZltwqg/OaRiWmqvqZfrRjVntRB2LyDqX9maj0UUyc3E2AqF7BIebDlzA7pOy7EX09
 9Qhz9umMzOXQ1xdIqrm5Iayyaz38/Xu+DnJ2m1OBdkwiZK/B6m9uOU3xlD4E7aPkVtNX
 u3SWi/C7AdB7M3L+AGRNGmyqyGCyeLEAGJ1jIkTDF8cgNU7LKMvDUyfOoxVIJs27Rm5O
 TRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=utXHPcgvm9Y8ZwC4DuYoSqZra3dkj+8uEXyKJK77MuM=;
 b=umJjSUmwbzHn2uDCrwk3aK1z3KovIEoongiy0fQyKmEkZkHqB5lF3JoA+CDUuflgx3
 CjFd6KFv705fBvmGQ7DejY+GzinqAcZ6p9bWS6xXOdfm5bArZm5iu1iZQ6oyZVfRJI1Q
 VbSvHxTXCLT5s7pLTGrrRbrd4Nu/bmr1oiSsr57kXy211LbAFdXfVtCyJNx5ebHon9+r
 EE5tJv9kVyxxcstgYO93BBiSUiYRmsoxAVT1OwyC5XcocQmujUDjIGHJUBiwd/s6pUUo
 fkU3Dtc2aGH2Co3bqqMdZ9wvD1xoz6Imq+fApYVsc6iqot7rRMCkwROeC4A3zSXXaFdg
 Yr2Q==
X-Gm-Message-State: AOAM533U7e/fdgKAusfGTKGIN+I4X+IA1OVWGeDiWGbaOhTS0Yq7+Ecy
 4Lk9IpWP8f7G/FA0pezYbSc=
X-Google-Smtp-Source: ABdhPJzuY8MD5OC5cvECJcPWzH/iIf6UjSZt7cny9SeK3VphHxxRpE48XhJHGnrzAOnUZgSXJJjn8w==
X-Received: by 2002:a65:6207:: with SMTP id d7mr20641495pgv.92.1612836156934; 
 Mon, 08 Feb 2021 18:02:36 -0800 (PST)
Received: from localhost ([220.240.226.199])
 by smtp.gmail.com with ESMTPSA id y20sm19944613pfo.210.2021.02.08.18.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 18:02:36 -0800 (PST)
Date: Tue, 09 Feb 2021 12:02:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 18/22] powerpc/syscall: Remove FULL_REGS verification
 in system_call_exception
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <6bef4d9ba0cba50160d13e344ee4627ebdf801dc.1612796617.git.christophe.leroy@csgroup.eu>
In-Reply-To: <6bef4d9ba0cba50160d13e344ee4627ebdf801dc.1612796617.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612836023.l122pe2n2b.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
> For book3s/64, FULL_REGS() is 'true' at all time, so the test voids.
> For others, non volatile registers are saved inconditionally.
>=20
> So the verification is pointless.
>=20
> Should one fail to do it, it would anyway be caught by the
> CHECK_FULL_REGS() in copy_thread() as we have removed the
> special versions ppc_fork() and friends.
>=20
> null_syscall benchmark reduction 4 cycles (332 =3D> 328 cycles)

I wonder if we rather make a CONFIG option for a bunch of these simpler
debug checks here (and also in interrupt exit, wrappers, etc) rather
than remove them entirely.

Thanks,
Nick

>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/interrupt.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interr=
upt.c
> index 8fafca727b8b..55e1aa18cdb9 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -42,7 +42,6 @@ notrace long system_call_exception(long r3, long r4, lo=
ng r5,
>  	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
>  		BUG_ON(!(regs->msr & MSR_RI));
>  	BUG_ON(!(regs->msr & MSR_PR));
> -	BUG_ON(!FULL_REGS(regs));
>  	BUG_ON(arch_irq_disabled_regs(regs));
> =20
>  #ifdef CONFIG_PPC_PKEY
> --=20
> 2.25.0
>=20
>=20
