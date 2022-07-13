Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D822E572D8F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 07:44:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjRQd4Krgz3c5h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 15:44:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FI+ONmOO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FI+ONmOO;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjRPz46nTz2xn7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jul 2022 15:44:07 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id o31-20020a17090a0a2200b001ef7bd037bbso1913106pjo.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 22:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=9yj2EAtSuNZAMinJVVGRYgPj8i+P4/Cj8f+O/T0clHw=;
        b=FI+ONmOO5Vd5gFla5eMA8G6nSZonHnH5dqt699ByWVAR0ZzoHm8m06Flwrbc/opi+v
         FPKfmCrHSA2R872eTWBRzwkpzfQtRkEQsVqJoKSLasmfwbnYV4gUYpTXuMLTL0IBCsR8
         2Q8AHvtLQ3d4J8ecSGGkmZNII3vKf1pZCSGEq7CLJaeyfWdwgKbnMYnBytk9gKtEcnPk
         GXqnRME8QZ83GMf9BrE+XuHvnf4VR4X5ZF0sImi/2kvuNDL4OXb5ugsZIJk8vDNlB7N9
         TzgTTtO0rA3AzlwxLsOG2QhklneDV5yl7nGfw/R4/aeFKQeT23eOJO75rd20dYgnkQ8k
         t+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=9yj2EAtSuNZAMinJVVGRYgPj8i+P4/Cj8f+O/T0clHw=;
        b=dThotspRop6uyxtye6/QsnKTtZF663pJpWo4eRif1yg2xsOBAyVMhWcR/ZSIs9sN9l
         1lHAaUm+/hINKh9uCOVwTZZzt1/XSVCvn7PqBij0v5O+rM5KI7B3X3uDtTpTZKvkvcyS
         tvwXqM/5s5xoPY2EDmXemG+RLV56xq/HvjY9wFB7OElDZzu/4/MORMEmMqzmuRp+gMmS
         9jTCwcqY88SR68Z8BOxW3GzyqU+UWqQyGap+xlJqbfK9cf/SjaifgavBY4xaRLF1LAGz
         FHWveVDvJcz48lEDZLXrs6n12/UuRPD1U4rWOMf8jdDEnt4jhSjFGueiUoYKZYVLv2N8
         O26g==
X-Gm-Message-State: AJIora9UHO4fUVLwOlAPs6cznEb9NW0QXUHF1qqBNpYeqxQk8zOii9jf
	5XIahtNOwC1h/km1cQ5OHXYor9Y4MMY=
X-Google-Smtp-Source: AGRyM1s0VnDnnka+qXUIZXahsF3gd2YjYWJWO9jXc684WELHn+twOG3hRtXXZfcJ3cehW78/h6XKvg==
X-Received: by 2002:a17:903:234d:b0:16c:3e90:12f5 with SMTP id c13-20020a170903234d00b0016c3e9012f5mr1535661plh.82.1657691044286;
        Tue, 12 Jul 2022 22:44:04 -0700 (PDT)
Received: from localhost (193-116-203-247.tpgi.com.au. [193.116.203.247])
        by smtp.gmail.com with ESMTPSA id y22-20020a634956000000b0040c8dd84ff5sm7038978pgk.72.2022.07.12.22.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 22:44:03 -0700 (PDT)
Date: Wed, 13 Jul 2022 15:43:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/kvm: Remove comment related to moving PMU
 code to perf subsystem
To: Kajol Jain <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
	mpe@ellerman.id.au
References: <20220711034927.213192-1-kjain@linux.ibm.com>
	<20220711034927.213192-2-kjain@linux.ibm.com>
In-Reply-To: <20220711034927.213192-2-kjain@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1657690936.j2o5jz3fxx.astroid@bobo.none>
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
Cc: atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Kajol Jain's message of July 11, 2022 1:49 pm:
> Commit aabcaf6ae2a0 ("KVM: PPC: Book3S HV P9: Move host OS save/restore
> functions to  built-in") added a comment in switch_pmu_to_guest
> function, indicating possibility of moving PMU handling code
> to perf subsystem. But perf subsystem code compilation depends upon
> the enablement of CONFIG_PERF_EVENTS whereas, kvm code don't have
> any dependency on this config.
> Patch remove this comment as switch_pmu_to_guest functionality is
> needed even if perf subsystem is disabled.
>=20
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

Does the host PMU state need to be saved/restored if we don't have
PERF_EVENTS enabled? Guest yes, but host maybe could become a no-op?

Thanks,
Nick

> ---
>  arch/powerpc/kvm/book3s_hv_p9_perf.c | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv_p9_perf.c b/arch/powerpc/kvm/book=
3s_hv_p9_perf.c
> index da3135cab9ea..44d24cca3df1 100644
> --- a/arch/powerpc/kvm/book3s_hv_p9_perf.c
> +++ b/arch/powerpc/kvm/book3s_hv_p9_perf.c
> @@ -44,12 +44,6 @@ void switch_pmu_to_guest(struct kvm_vcpu *vcpu,
> =20
>  	/* Save host */
>  	if (ppc_get_pmu_inuse()) {
> -		/*
> -		 * It might be better to put PMU handling (at least for the
> -		 * host) in the perf subsystem because it knows more about what
> -		 * is being used.
> -		 */
> -
>  		/* POWER9, POWER10 do not implement HPMC or SPMC */
> =20
>  		host_os_sprs->mmcr0 =3D mfspr(SPRN_MMCR0);
> --=20
> 2.27.0
>=20
>=20
