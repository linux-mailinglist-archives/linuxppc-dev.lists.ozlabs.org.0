Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 177361606F4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2020 23:41:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LMYC6TMjzDqbB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 09:41:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LMWX3JyTzDqZW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 09:40:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=LaTcm1/x; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 48LMWX1sdzz9sPK;
 Mon, 17 Feb 2020 09:40:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1581892808;
 bh=G/Tu9BGtdDP3vr8nlEE7cchRJpvilg7OMHuREeSG49A=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=LaTcm1/xqXNn/I3GiEqi19nv2R+deV0sgw0w/DwW5Z1P1Mg9q6oyvf/vFRaAUePST
 Xb/cgUHa2U+bpbqe7VYwqrzH24BXhm8BC/82SW/pzzfPdoOj/b6EShlTvWLyG4YVWj
 pXD60nii1eSz+cz7YmnRj1aEioWFeR6DPxDyNwzAIPiVVuZMHHgNs+adlQmMUOpK5a
 IhZBe4hbtIoao9/JWovRGRtWOn30FVV5px+y6PELMpuViBqsptFI+F3GuN/Y72ljl/
 M3TyUmjFpYmKnNa2QKVmZ3xSjmai4PpIV+5+eXUHkQdV16NzQ/jGaeT/2ngSAhszUZ
 Jzo8x4tZoo9wA==
Received: by neuling.org (Postfix, from userid 1000)
 id 27C302C01ED; Mon, 17 Feb 2020 09:40:08 +1100 (AEDT)
Message-ID: <04cdd26307a1eaebeacc039b207db92e0b6820bb.camel@neuling.org>
Subject: Re: [PATCH] powerpc/chrp: Fix enter_rtas() with CONFIG_VMAP_STACK
From: Michael Neuling <mikey@neuling.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>
Date: Mon, 17 Feb 2020 09:40:08 +1100
In-Reply-To: <159ecb0ab021c07fd2f383d4a083a43d16d67b92.1581669187.git.christophe.leroy@c-s.fr>
References: <159ecb0ab021c07fd2f383d4a083a43d16d67b92.1581669187.git.christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-02-14 at 08:33 +0000, Christophe Leroy wrote:
> With CONFIG_VMAP_STACK, data MMU has to be enabled
> to read data on the stack.

Can you describe what goes wrong without this? Some oops message? rtas blow=
s up?
Get corrupt data?

Also can you say what you're actually doing (ie turning on MSR[DR])


> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/kernel/entry_32.S | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_3=
2.S
> index 0713daa651d9..bc056d906b51 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -1354,12 +1354,17 @@ _GLOBAL(enter_rtas)
>  	mtspr	SPRN_SRR0,r8
>  	mtspr	SPRN_SRR1,r9
>  	RFI
> -1:	tophys(r9,r1)
> +1:	tophys_novmstack r9, r1
> +#ifdef CONFIG_VMAP_STACK
> +	li	r0, MSR_KERNEL & ~MSR_IR	/* can take DTLB miss */

You're potentially turning on more than MSR DR here. This should be clear i=
n the
commit message.

> +	mtmsr	r0
> +	isync
> +#endif
>  	lwz	r8,INT_FRAME_SIZE+4(r9)	/* get return address */
>  	lwz	r9,8(r9)	/* original msr value */
>  	addi	r1,r1,INT_FRAME_SIZE
>  	li	r0,0
> -	tophys(r7, r2)
> +	tophys_novmstack r7, r2
>  	stw	r0, THREAD + RTAS_SP(r7)
>  	mtspr	SPRN_SRR0,r8
>  	mtspr	SPRN_SRR1,r9

