Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C91AC3E284C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 12:11:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh1Td4xD1z3cGw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 20:11:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gQeGe6L4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gQeGe6L4; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh1T92jkWz2xZH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 20:10:53 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id i10so6440378pla.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Aug 2021 03:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=xl+toVo+Zrg478hZAS7J1S1eAiWULAkYqgfigtj4ZV8=;
 b=gQeGe6L4ibmD0WCrfE7fNyfnq8gokIDvjPbGL0eMVtI3oPq2oDd4GYFcPFMCWObQuT
 LAvVKUuM99ymXmB+ppQV/3jHYe8joyuwhupgngzFrm/v0ei+eMFi+uH27o3zNXuQrj3q
 R1YMITRi/tQ3ezSktH+nDFe3uVjX96/092rnhGbJEDxKI73KyFpImeD3VRsRYZgLmaZR
 dLpD7bMbJpkZnWfn5oUoeO07sU+/ECeBjUoyrIPiLeaPxLM09vuaV8q0l41/rYM5lJjz
 pX9CIwkD0GjH0Hg86nchrl4XwGHPalBG2Uzz1wluVmXfWNtw/XYzj4BBp6rFK9hm0Qnh
 K1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=xl+toVo+Zrg478hZAS7J1S1eAiWULAkYqgfigtj4ZV8=;
 b=QsgHTTjarwyMYupMAcOhvcozHQ4Xo+3w8W2sZ2UWHBYEkSzdbVeQGG8GoqjWskepgd
 UOMqTF4xS8sZfymdBJfzyLzIlwu91qCn/rDllqPV6OmrgxDrkseI1/K7/VAPHnx+LV24
 n34CpZVc1enwFexanZuogv4efhn47Gvr6pRFiinn7g26cuWuMvFnkS3T+N6JXklwC4yC
 rAQ/J2TalyUaewAwkRCCUoEytroWf1WQF6eLRGn8zCdc9VoFxsYkerbPiBXenZiLT6iJ
 id8Pjx2I5kMtpuIlwHqKU9oLf5PXjehKn4AhItOZ1OEd6mk0AW4Hto1B9WDQkMQXMmMO
 avGQ==
X-Gm-Message-State: AOAM531Hx0H/Cx5cdqyC2B68uKhlHOZ8FvQVpK9Oa50lc2luPlLdIwKG
 K3erQN15BOEHgS0Io1TZwOI=
X-Google-Smtp-Source: ABdhPJz4dsC4ghXRVNq0gDux6WP/xtTCO/fOTsURJhwjROT+I4DAL//Gs+cnx9EVYCYPV9ATy+ialQ==
X-Received: by 2002:a17:90a:a087:: with SMTP id
 r7mr20369035pjp.84.1628244650107; 
 Fri, 06 Aug 2021 03:10:50 -0700 (PDT)
Received: from localhost ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id v7sm9473426pfu.39.2021.08.06.03.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 03:10:49 -0700 (PDT)
Date: Fri, 06 Aug 2021 20:10:44 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 2/3] KVM: PPC: Book3S HV: Add sanity check to
 copy_tofrom_guest
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210805212616.2641017-1-farosas@linux.ibm.com>
 <20210805212616.2641017-3-farosas@linux.ibm.com>
In-Reply-To: <20210805212616.2641017-3-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1628244579.t79ynn05df.astroid@bobo.none>
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
Cc: christophe.leroy@c-s.fr, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of August 6, 2021 7:26 am:
> Both paths into __kvmhv_copy_tofrom_guest_radix ensure that we arrive
> with an effective address that is smaller than our total addressable
> space and addresses quadrant 0.
>=20
> - The H_COPY_TOFROM_GUEST hypercall path rejects the call with
> H_PARAMETER if the effective address has any of the twelve most
> significant bits set.
>=20
> - The kvmhv_copy_tofrom_guest_radix path clears the top twelve bits
> before calling the internal function.
>=20
> Although the callers make sure that the effective address is sane, any
> future use of the function is exposed to a programming error, so add a
> sanity check.

We possibly should put these into #defines in radix pgtable headers=20
somewhere but KVM already open codes them so this is good for now.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_64_mmu_radix.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/bo=
ok3s_64_mmu_radix.c
> index 44eb7b1ef289..1b1c9e9e539b 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> @@ -44,6 +44,9 @@ unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid,=
 int pid,
>  					  (to !=3D NULL) ? __pa(to): 0,
>  					  (from !=3D NULL) ? __pa(from): 0, n);
> =20
> +	if (eaddr & (0xFFFUL << 52))
> +		return ret;
> +
>  	quadrant =3D 1;
>  	if (!pid)
>  		quadrant =3D 2;
> --=20
> 2.29.2
>=20
>=20
