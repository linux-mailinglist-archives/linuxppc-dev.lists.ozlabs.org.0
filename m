Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9100022BB83
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 03:28:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCWmW4qtVzDrQN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 11:28:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCWjJ3Rc3zDr88
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 11:25:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=XOKW50YA; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 4BCWjH2XG7z9sPB;
 Fri, 24 Jul 2020 11:25:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1595553924;
 bh=tm/GU39NPJjOhnUmHyDDcZvMhBdG0uDx7EnJQcKGEho=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=XOKW50YAnge0+7ZmdCpLdxd8P+Gx1IVElGxDtqg7n8o2DtROhV6Gd/km0jYnjiC5d
 /guTMY0h5sHwhoVmVXsZFdgGiGM9zm11xlDj4acp0AgSgtthMRCkNppZKXVVdG4iMg
 JERKTsxs0ZF3wBBn9wjRNUEyGlmhJhF0hZCj6qrOhp1HbGf0lwrJ5PKG9bEDe0sM53
 J8o/9EnQDDNAxlM/rMc/M5KUEUi26pwhuMQgxnB2wu4egOTE0sBUQ9/Ml1Zt01Ve3w
 pUVyVFS4/UiiX4lK6r5AKsCnqErfhyLdIIW+MCNbRLYdgaQO1KyqcYNBh6aAUWkz1f
 3o3gS8l4YgcjA==
Received: by neuling.org (Postfix, from userid 1000)
 id 3D9482C0404; Fri, 24 Jul 2020 11:25:23 +1000 (AEST)
Message-ID: <b9507631629bfc1f36893a280b2b83ea484516f9.camel@neuling.org>
Subject: Re: [PATCH v2 2/3] powerpc/powernv/idle: save-restore DAWR0,DAWRX0
 for P10
From: Michael Neuling <mikey@neuling.org>
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>, mpe@ellerman.id.au, 
 benh@kernel.crashing.org, paulus@samba.org, ravi.bangoria@linux.ibm.com, 
 ego@linux.vnet.ibm.com, svaidy@linux.ibm.com, pratik.r.sampat@gmail.com, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Fri, 24 Jul 2020 11:25:23 +1000
In-Reply-To: <20200710052207.12003-3-psampat@linux.ibm.com>
References: <20200710052207.12003-1-psampat@linux.ibm.com>
 <20200710052207.12003-3-psampat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.36.4 (3.36.4-1.fc32) 
MIME-Version: 1.0
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

On Fri, 2020-07-10 at 10:52 +0530, Pratik Rajesh Sampat wrote:
> Additional registers DAWR0, DAWRX0 may be lost on Power 10 for
> stop levels < 4.
> Therefore save the values of these SPRs before entering a  "stop"
> state and restore their values on wakeup.
>=20
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/idle.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/powerpc/platforms/powernv/idle.c
> b/arch/powerpc/platforms/powernv/idle.c
> index 19d94d021357..f2e2a6a4c274 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -600,6 +600,8 @@ struct p9_sprs {
>  	u64 iamr;
>  	u64 amor;
>  	u64 uamor;
> +	u64 dawr0;
> +	u64 dawrx0;
>  };
> =20
>  static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
> @@ -687,6 +689,10 @@ static unsigned long power9_idle_stop(unsigned long
> psscr, bool mmu_on)
>  	sprs.iamr	=3D mfspr(SPRN_IAMR);
>  	sprs.amor	=3D mfspr(SPRN_AMOR);
>  	sprs.uamor	=3D mfspr(SPRN_UAMOR);
> +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {

Can you add a comment here saying even though DAWR0 is ARCH_30, it's only
required to be saved on 31. Otherwise this looks pretty odd.

> +		sprs.dawr0 =3D mfspr(SPRN_DAWR0);
> +		sprs.dawrx0 =3D mfspr(SPRN_DAWRX0);
> +	}
> =20
>  	srr1 =3D isa300_idle_stop_mayloss(psscr);		/* go idle */
> =20
> @@ -710,6 +716,10 @@ static unsigned long power9_idle_stop(unsigned long
> psscr, bool mmu_on)
>  		mtspr(SPRN_IAMR,	sprs.iamr);
>  		mtspr(SPRN_AMOR,	sprs.amor);
>  		mtspr(SPRN_UAMOR,	sprs.uamor);
> +		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +			mtspr(SPRN_DAWR0, sprs.dawr0);
> +			mtspr(SPRN_DAWRX0, sprs.dawrx0);
> +		}
> =20
>  		/*
>  		 * Workaround for POWER9 DD2.0, if we lost resources, the ERAT

