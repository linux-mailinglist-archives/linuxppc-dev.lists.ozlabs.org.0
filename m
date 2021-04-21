Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F865366634
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 09:21:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQBnT0qX1z30Bm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 17:21:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Qt148EfW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Qt148EfW; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQBn43xXRz2y07
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 17:21:28 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQBn34lbPz9tkF;
 Wed, 21 Apr 2021 17:21:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618989687;
 bh=V7YakiLh0lc5pULnRDAJvj1kBlxh5nVIClHoUbjkUYc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Qt148EfW9rQWMC7MzMoJKNRohR6fSDEaLPaHkHNoaCMsvwg/I/pTYkPsv+FmQ+5Uv
 TYQXOOZ12cNKIPVoSwzemRDHsFGmpzBEaCziEXZu8+ASKoNA1bYGEYUVsrhajeQJiH
 YA3GofUQ9PdL4hdNZXuxxVzPoJDJZQ1JWKIQUL2AI/dKWQEBG4p0164YIwdvQvgRVN
 kTi1tS2LptSM0XzkBiAmCJGdojfRCqFopxnk7ltlqtqMGTuXZmH9kXY1wQmBfoSgzI
 SYh0e7cbbSSYn5N8XWzdbr7krgyJGGzOzxo1AVhxkZKtJzGOhBcGn2nU0m2C/+1fJ/
 nonFQWbvKYvmQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, robh@kernel.org,
 dan.carpenter@oracle.com
Subject: Re: [PATCH 2/2] powerpc: If kexec_build_elf_info() fails return
 immediately from elf64_load()
In-Reply-To: <20210420190355.10059-2-nramas@linux.microsoft.com>
References: <20210420190355.10059-1-nramas@linux.microsoft.com>
 <20210420190355.10059-2-nramas@linux.microsoft.com>
Date: Wed, 21 Apr 2021 17:21:26 +1000
Message-ID: <87o8e8ayrt.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 nramas@linux.microsoft.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:

> Uninitialized local variable "elf_info" would be passed to
> kexec_free_elf_info() if kexec_build_elf_info() returns an error
> in elf64_load().
>
> If kexec_build_elf_info() returns an error, return the error
> immediately.
>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> index 02662e72c53d..eeb258002d1e 100644
> --- a/arch/powerpc/kexec/elf_64.c
> +++ b/arch/powerpc/kexec/elf_64.c
> @@ -45,7 +45,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>  
>  	ret = kexec_build_elf_info(kernel_buf, kernel_len, &ehdr, &elf_info);
>  	if (ret)
> -		goto out;
> +		return ERR_PTR(ret);
>  
>  	if (image->type == KEXEC_TYPE_CRASH) {
>  		/* min & max buffer values for kdump case */
> -- 
> 2.31.0
