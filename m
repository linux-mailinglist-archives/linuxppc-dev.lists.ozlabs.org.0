Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7776F3BC570
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 06:26:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJqJK3LcPz303k
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 14:26:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=I80PzhqN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=I80PzhqN; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJqHl0ZLBz2xtj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 14:26:10 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id ie21so11073067pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jul 2021 21:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=vdXzR/bK1+DNVDAzcSda3PR9zt5jbGiSvI42CBLvE+c=;
 b=I80PzhqNGxSlRlG+RYQWEcYKC8VtUgPcMChQM13MDbJdC80nuwvoP+bTd47s/iUKqW
 r4yxImyLWfamNHHgTcIokSopPK8ijxEoUyDX6lnre6M0WUPcY7mLGBecDfRXAJ8Gv9O0
 61BBDeqrRSppsT5BWqGhxp5CmUDCZAy37akwQ8iv2Ervsop6MigI+MkT64KPbWYswb92
 POk5il5RWMhVcoH08qQmT3v5LuupvNEstPUxqSAgJ5dJkac4HougCLc8n3mIZHf/XZwG
 XrAuJW3+84GuuzU3UbBejL6V+LzYncDZhDbpTGHy89SVTHZJuoAFcP9UtGZIr2gCBrfg
 4Rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=vdXzR/bK1+DNVDAzcSda3PR9zt5jbGiSvI42CBLvE+c=;
 b=BL/ik8GqkajejZsnHqZTk7QAp7BVlD89AlHD3CFlsHn0bNO5xxEPfw6b6CU0AvtJ/X
 mG1/ZgoiH+7gn7TZXMtTNa1GhlK2tQIn3sZTXTznisEbfq30vI31Dld4pZRUp2BzFP++
 biBa7s+sHf+YmGM4GxHZsxs04d+qd5f9BttpD2QAuLkZrwOPo6DLxONWbCD3SGsP6qM/
 MRNs17UsndoH094J3n75svRNJJaVQu1AOxbfKheIfP12eBTD19rFBayCGePvwzhnw/la
 Jl3cCsPRQDmKOJC6DMGS8bT8eLfLhwkw69CXeeutrR+73lF3XLo9EornnOwjX/QmyL91
 40zg==
X-Gm-Message-State: AOAM53221w47TAYAxZI87uhn0PP4Da1c9xvja28eWTPKZX+qOaN1Si2s
 yOMBbIZfOnbAOKnwYWoZjz0=
X-Google-Smtp-Source: ABdhPJw3/DCHcp+hqwOktvQq8JT3vbt26AY4IpwCqXLGALjw1XKZIZXPES/6pZaPH3E0c5FhL1Lx1w==
X-Received: by 2002:a17:90a:cf87:: with SMTP id
 i7mr2418555pju.204.1625545566796; 
 Mon, 05 Jul 2021 21:26:06 -0700 (PDT)
Received: from localhost ([118.209.250.144])
 by smtp.gmail.com with ESMTPSA id la17sm12833313pjb.34.2021.07.05.21.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 21:26:06 -0700 (PDT)
Date: Tue, 06 Jul 2021 14:26:01 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [FSL P50xx] IRQ issues
To: Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>
References: <20210509224926.GA31035@embeddedor>
 <CADnq5_OWk+rXK5xrwu0YOMVC45WyQgFQBTUNkcF8oO3ucp+=XQ@mail.gmail.com>
 <ba5f2a73-58e8-6b3e-4048-bb19f238be51@embeddedor.com>
 <4e0a3130-4c20-aa8a-f32a-6c3f0d9cd6f8@xenosoft.de>
 <86de3024-c025-ec65-a45a-264585730c4a@xenosoft.de>
 <cc1b16c0-47d5-2c50-fba0-9e1aa014ee8a@xenosoft.de>
 <1625527692.m58rsysc62.astroid@bobo.none>
In-Reply-To: <1625527692.m58rsysc62.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1625545506.w1wah3x0jn.astroid@bobo.none>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of July 6, 2021 9:36 am:
> Excerpts from Christian Zigotzky's message of July 6, 2021 4:49 am:
>> Hi All,
>>=20
>> Our FSL P50xx machines don't boot anymore because of IRQ issues. [1]
>>=20
>> Please check the IRQ changes in the latest PowerPC updates 5.14-1. [2]
>>=20
>> Thanks,
>> Christian
>>=20
>> [1]=20
>> https://forum.hyperion-entertainment.com/download/file.php?id=3D2592&mod=
e=3Dview
>> [2]=20
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3D019b3fd94ba73d3ac615f0537440b81f129821f6
>=20
> This looks like mtmsrd in the 64e code. I think this should fix it.
>=20
> QEMU does not seem to trap on this, maybe something to improve.

With a patch to qemu to make it take an illegal instruction on mtmsrd I=20
can reproduce basically what you have, and this patch makes it work. I
think this is the best short term fix.

Thanks,
Nick

>=20
> Thanks,
> Nick
> --
>=20
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/int=
errupt_64.S
> index 4063e8a3f704..d4212d2ff0b5 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -311,9 +311,13 @@ END_BTB_FLUSH_SECTION
>  	 * trace_hardirqs_off().
>  	 */
>  	li	r11,IRQS_ALL_DISABLED
> -	li	r12,-1 /* Set MSR_EE and MSR_RI */
>  	stb	r11,PACAIRQSOFTMASK(r13)
> +#ifdef CONFIG_PPC_BOOK3S
> +	li	r12,-1 /* Set MSR_EE and MSR_RI */
>  	mtmsrd	r12,1
> +#else
> +	wrteei	1
> +#endif
> =20
>  	/* Calling convention has r9 =3D orig r0, r10 =3D regs */
>  	mr	r9,r0
>=20
