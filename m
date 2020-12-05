Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A79CD2CFB10
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 11:59:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cp6624XfkzDqcl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 21:59:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cp64c3KZRzDqVs
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 21:58:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=LnGNulhB; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cp64b6Yv9z9sWP;
 Sat,  5 Dec 2020 21:58:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607165904;
 bh=1QqseYf6ezigIKf15eGL11f+r3rrJBEyN89MtXaqjS8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=LnGNulhB656ZWd0TNJEg7ooIjHAbyLPdktP4NERmOnAFNSCpXcDBAemRp7hyF0owD
 iXPFDbrdv3WtmvwVlmR/AAG0P0LQ5Ox5QBWvVJpV1FFXjUzVfdWgJ0VOhwIcNWE8mI
 r8ga4HPqqqOp0HMFrUZoK/eAghYftVeItJhKS/2QsR3bur21P/dHlB5Y7w22Tvy+1h
 fDlBgVpdCtHyqjqwW//yHYiU6pRV7jyk3rASLJBt2gwXhICj3725a1y+722G3Nbhum
 TU71ut0kqQMO7uAiNE0DdLQyax7g3QhcmVDmVgMBt7i+MHWg+cgnNbOeFyvshLMv/Q
 yTEH82TLxik4g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal Suchanek <msuchanek@suse.de>, stable@vger.kernel.org
Subject: Re: [PATCH] powerpc: Stop exporting __clear_user which is now inlined.
In-Reply-To: <20201204232807.31887-1-msuchanek@suse.de>
References: <20201204232807.31887-1-msuchanek@suse.de>
Date: Sat, 05 Dec 2020 21:58:23 +1100
Message-ID: <87y2ictt80.fsf@mpe.ellerman.id.au>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Suchanek <msuchanek@suse.de> writes:
> Stable commit 452e2a83ea23 ("powerpc: Fix __clear_user() with KUAP
> enabled") redefines __clear_user as inline function but does not remove
> the export.
>
> Fixes: 452e2a83ea23 ("powerpc: Fix __clear_user() with KUAP enabled")
>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>  arch/powerpc/lib/ppc_ksyms.c | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/arch/powerpc/lib/ppc_ksyms.c b/arch/powerpc/lib/ppc_ksyms.c
> index c7f8e9586316..4b81fd96aa3e 100644
> --- a/arch/powerpc/lib/ppc_ksyms.c
> +++ b/arch/powerpc/lib/ppc_ksyms.c
> @@ -24,7 +24,6 @@ EXPORT_SYMBOL(csum_tcpudp_magic);
>  #endif
>  
>  EXPORT_SYMBOL(__copy_tofrom_user);
> -EXPORT_SYMBOL(__clear_user);
>  EXPORT_SYMBOL(copy_page);
>  
>  #ifdef CONFIG_PPC64
> -- 
> 2.26.2
