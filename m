Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E032651703F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 May 2022 15:24:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsP2h5Rzcz3bcG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 May 2022 23:24:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=G0CzGoy5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsP263lK5z305j
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 May 2022 23:24:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=G0CzGoy5; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsP212WPzz4ySv;
 Mon,  2 May 2022 23:24:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651497854;
 bh=mC2Kj2FsQGLbwukle8P0U7WJDz+AcbyDLiDbnVAIbco=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=G0CzGoy5f90lqzQ39jqJmnyU4tVEYFt4isrq/7g2xFmI+n7Qhg2/PnCdeuCo5BSVB
 VD1pp70M/E/l5ex1V2gm/E1hWzrlAwd2gRYEBkj7cfh2R/l6Wjqdcr9v1E1jNsY++7
 r/UpYjDLJM/GAYLVV0uqjYE85MsUZidyWVmm5k08wVryjAhvUxUE/QRWe4/gLEmual
 EDKEOa3wt7jaHVolUf/L8km3zcj+YVlVPikzZ449e1e+QYc80xWz8vCZe62WDpWcUb
 18t9u4ud0Voc7xMp1/bp1LmOSzSmkU1WWNQKM6P2Cgx79O0vSAVJbRz0PCKDmRN+Lb
 84hxZsYDz4Wzg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: CGEL <cgel.zte@gmail.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Sandipan
 Das <sandipan@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH linux-next] power:pkeys: fix bugon.cocci warnings
In-Reply-To: <20210825064228.70487-1-deng.changcheng@zte.com.cn>
References: <20210825064228.70487-1-deng.changcheng@zte.com.cn>
Date: Mon, 02 May 2022 23:24:07 +1000
Message-ID: <8735hsvzig.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Zeal Robot <zealci@zte.com.cn>, Jing Yangyang <jing.yangyang@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CGEL <cgel.zte@gmail.com> writes:
> From: Jing Yangyang <jing.yangyang@zte.com.cn>
>
> Use BUG_ON instead of a if condition followed by BUG.
>
> ./arch/powerpc/include/asm/book3s/64/pkeys.h:21:2-5:WARNING
> Use BUG_ON instead of if condition followed by BUG.
> ./arch/powerpc/include/asm/book3s/64/pkeys.h:14:2-5:WARNING
> Use BUG_ON instead of if condition followed by BUG.
>
> Generated by: scripts/coccinelle/misc/bugon.cocci
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
> ---
>  arch/powerpc/include/asm/book3s/64/pkeys.h | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/pkeys.h b/arch/powerpc/include/asm/book3s/64/pkeys.h
> index 5b17813..5f74f0c 100644
> --- a/arch/powerpc/include/asm/book3s/64/pkeys.h
> +++ b/arch/powerpc/include/asm/book3s/64/pkeys.h
> @@ -10,15 +10,13 @@ static inline u64 vmflag_to_pte_pkey_bits(u64 vm_flags)
>  	if (!mmu_has_feature(MMU_FTR_PKEY))
>  		return 0x0UL;
>  
> -	if (radix_enabled())
> -		BUG();
> +	BUG_ON(radix_enabled());
>  	return hash__vmflag_to_pte_pkey_bits(vm_flags);
>  }
>  
>  static inline u16 pte_to_pkey_bits(u64 pteflags)
>  {
> -	if (radix_enabled())
> -		BUG();
> +	BUG_ON(radix_enabled());
>  	return hash__pte_to_pkey_bits(pteflags);
>  }

Have you checked how this changes the generated code?

radix_enabled() is a jump label, via mmu_feature().

Possibly the compiler just works it all out and generates the same code,
but I'd want some evidence of that before merging this.

cheers
