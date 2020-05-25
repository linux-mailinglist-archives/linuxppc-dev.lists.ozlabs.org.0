Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6551E0671
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 07:41:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49VmD10tDfzDqRj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 15:41:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VmBS1kTGzDqRN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 May 2020 15:39:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aqU1Kwc5; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49VmBR520kz9sSd;
 Mon, 25 May 2020 15:39:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590385183;
 bh=70h4YhpOdO2kfsEqmyTiggPpMIWWTu8kc/yJQERVsbI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aqU1Kwc5zrGM46XLxjK3UFd7TYdql2+K1plaCm/cATYJE7AwboQLNpD3h/TsxnOLC
 0Ak138M2olx39PxCR/L8Z0dhU2J1FFIWyU43AVurglkUOY3jqcihV9jr1O+o+XD0jh
 dbvmqs49oxDQD/8gTJajABnkPkwgkpYwf/dZXZzskVOEuszyTLbcI6JvifeP/FR8IO
 CJbPfPtrz4cyqwpDH7oR85gqKQRqW2MCZmzjBrA4VS6S8F+D6eSyLB6JIN9MH6+RXo
 Ddvl+kc6YEgN9VIlWeuh7IRUA3iLQBBoaQhIkSpwbtDWumbVirMX1Ta190i4op7ZK7
 QT7cyLThCGhQQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v4 14/45] powerpc/32s: Don't warn when mapping RO data ROX.
In-Reply-To: <6499f8eeb2a36330e5c9fc1cee9a79374875bd54.1589866984.git.christophe.leroy@csgroup.eu>
References: <cover.1589866984.git.christophe.leroy@csgroup.eu>
 <6499f8eeb2a36330e5c9fc1cee9a79374875bd54.1589866984.git.christophe.leroy@csgroup.eu>
Date: Mon, 25 May 2020 15:40:06 +1000
Message-ID: <87eer8fu89.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Mapping RO data as ROX is not an issue since that data
> cannot be modified to introduce an exploit.

Being pedantic: it is still an issue, in that it means there's more
targets for a code-reuse attack.

But given the entire kernel text is also available for code-reuse
attacks, the RO data is unlikely to contain any useful sequences that
aren't also in the kernel text.

> PPC64 accepts to have RO data mapped ROX, as a trade off
> between kernel size and strictness of protection.
>
> On PPC32, kernel size is even more critical as amount of
> memory is usually small.

Yep, I think it's a reasonable trade off to make.

cheers

> Depending on the number of available IBATs, the last IBATs
> might overflow the end of text. Only warn if it crosses
> the end of RO data.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/mm/book3s32/mmu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
> index 39ba53ca5bb5..a9b2cbc74797 100644
> --- a/arch/powerpc/mm/book3s32/mmu.c
> +++ b/arch/powerpc/mm/book3s32/mmu.c
> @@ -187,6 +187,7 @@ void mmu_mark_initmem_nx(void)
>  	int i;
>  	unsigned long base = (unsigned long)_stext - PAGE_OFFSET;
>  	unsigned long top = (unsigned long)_etext - PAGE_OFFSET;
> +	unsigned long border = (unsigned long)__init_begin - PAGE_OFFSET;
>  	unsigned long size;
>  
>  	if (IS_ENABLED(CONFIG_PPC_BOOK3S_601))
> @@ -201,9 +202,10 @@ void mmu_mark_initmem_nx(void)
>  		size = block_size(base, top);
>  		size = max(size, 128UL << 10);
>  		if ((top - base) > size) {
> -			if (strict_kernel_rwx_enabled())
> -				pr_warn("Kernel _etext not properly aligned\n");
>  			size <<= 1;
> +			if (strict_kernel_rwx_enabled() && base + size > border)
> +				pr_warn("Some RW data is getting mapped X. "
> +					"Adjust CONFIG_DATA_SHIFT to avoid that.\n");
>  		}
>  		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_TEXT);
>  		base += size;
> -- 
> 2.25.0
