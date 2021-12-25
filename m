Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CCF47F2EB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 11:17:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLfyF4J6Xz3cP5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 21:17:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XzVdxE+8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XzVdxE+8; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLfxb72cKz308b
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 21:17:23 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id w24so8041617ply.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 02:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=+Ua4M1wfcUhBq2TD1oIgn0I4RkUTfjjelNJTCFbhcA8=;
 b=XzVdxE+8JiAKiwnNyHob3JSx3aFcs8tys+NKp+JTL7vVSeMN6btZW+kyyVAEELjmm+
 9HsrCyTsWomFmsg466x69YuLkBFmEoF+DHfqAMGEq9SAGxBqMgp9IqBP5WX9Z+xCjGQW
 axop7FvhHbl56iCsmb+4vflzxH/h5oLP7ray4NolDIqgnbDx0YBgPUGiaSescvpLZ0mX
 eq16c9qi3kQyJVrSxlOW+BISTvgE2EOVefq8H53Z3EMu5wRsldGbHu2OfVEo0C5KVsl4
 DWZWi4KKoXkAATU/nVaWSHyKTQhxINERTuKrvDD/C3RL3znqGR657canOAaZUNWabaNM
 i2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=+Ua4M1wfcUhBq2TD1oIgn0I4RkUTfjjelNJTCFbhcA8=;
 b=Wrei9G4xzsIP0361DATg37DCK/yNFAq368pEN8uXT1E3gSfcktttP28JV8VErp69nH
 jX4f6rjeK115BEgJF1MTQPkCrIYyA4RDSHmR07WOAKrbLTGqtl5J+cblhG6/zb+Pa4Vu
 nQL+1L0GfcZt/RcvReMgNR8pPmd5HaDj/n9cEr0fIQlDwssWEqlRvuKL3slarE1EAqPV
 5cVLYOoA6wW2p4yV0NK1XDl6sXmRSFQQcKg4Yx/pas7R3HaA4ixAQ2sUnYFp0mBMfeFo
 bcHue2JV/tMMvRdM4SmYHn/Nama+8ITl84mi8K15SPjWYQm7PEJACy2YGpkA2cJzPC5m
 Eoow==
X-Gm-Message-State: AOAM5303M9b2K+fFIbXbImdlWPrt8fFWYOYTEeNObRQBwYNfQHN/7yqe
 qd39GcfJOamyevwav/mFvgY=
X-Google-Smtp-Source: ABdhPJzpkbpqANhmB7dUgOLbovVw1mLVyBejti7xPBHB/aUjzpXT6jcRQ2Q1pN1KcMg4lcBTYapLoA==
X-Received: by 2002:a17:902:8c97:b0:148:ce06:eff9 with SMTP id
 t23-20020a1709028c9700b00148ce06eff9mr9827290plo.5.1640427441787; 
 Sat, 25 Dec 2021 02:17:21 -0800 (PST)
Received: from localhost (121-44-67-22.tpgi.com.au. [121.44.67.22])
 by smtp.gmail.com with ESMTPSA id w7sm9758401pgo.56.2021.12.25.02.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 02:17:21 -0800 (PST)
Date: Sat, 25 Dec 2021 20:17:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/3] KVM: PPC: Book3S HV: Check return value of
 kvmppc_radix_init
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20211223211931.3560887-1-farosas@linux.ibm.com>
 <20211223211931.3560887-2-farosas@linux.ibm.com>
In-Reply-To: <20211223211931.3560887-2-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1640427422.4ftxfv81m7.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of December 24, 2021 7:19 am:
> The return of the function is being shadowed by the call to
> kvmppc_uvmem_init.
>=20

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Fixes: ca9f4942670c ("KVM: PPC: Book3S HV: Support for running secure gue=
sts")
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 7b74fc0a986b..9f4765951733 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -6098,8 +6098,11 @@ static int kvmppc_book3s_init_hv(void)
>  	if (r)
>  		return r;
> =20
> -	if (kvmppc_radix_possible())
> +	if (kvmppc_radix_possible()) {
>  		r =3D kvmppc_radix_init();
> +		if (r)
> +			return r;
> +	}
> =20
>  	r =3D kvmppc_uvmem_init();
>  	if (r < 0)
> --=20
> 2.33.1
>=20
>=20
