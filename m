Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C34A1BB367
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 03:19:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B3hx3VQdzDqDV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 11:19:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B3fs51GJzDqfj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 11:17:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=L+v+d18v; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49B3fr6R2Pz9sSk;
 Tue, 28 Apr 2020 11:17:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588036677;
 bh=juVL2tzpqt8KZA0Tqf+BwLqM7PEsOkcU8g9EORqqDcQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=L+v+d18vBLEOn/gVmkkziDeaEGMu+5Y+lw3dQHstKCp//wGIw9+ZfGrJ0MjRa1rCq
 NFtbtq3Yqm2X9UQnUgQgWLZ8kr0sr9QLUAaDfKUD+Gnn2njPpaLAZ4R0GNbu2gwCUj
 BvjwL/lGaqzk/K72N5fxf2KVJL1pFdSQN2tVGi53wq0Esml+JC+Lo8pE2IqcM3gAcS
 j7TusiopHiFHnmZDI0YwRGr9VF5O4LhK+grsXqM4Uugn305Zl1b2YpkQ8y27hsP5Ym
 z/4bn5tgyrVeeHEaQMABMQOr+yrnU0Sr2L248g64KbMEgT9wL3KPrccwXKIkXPAgen
 ++J3VvtQWj7CA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "H.J. Lu" <hjl.tools@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: Discard .rela* sections if CONFIG_RELOCATABLE is
 undefined
In-Reply-To: <20200427211628.4244-1-hjl.tools@gmail.com>
References: <20200427211628.4244-1-hjl.tools@gmail.com>
Date: Tue, 28 Apr 2020 11:18:13 +1000
Message-ID: <871ro8h0h6.fsf@mpe.ellerman.id.au>
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
Cc: Kees Cook <keescook@chromium.org>, Paul Mackerras <paulus@samba.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Borislav Petkov <bp@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"H.J. Lu" <hjl.tools@gmail.com> writes:

> arch/powerpc/kernel/vmlinux.lds.S has
>
>         DISCARDS
>         /DISCARD/ : {
>                 *(*.EMB.apuinfo)
>                 *(.glink .iplt .plt .rela* .comment)
>                 *(.gnu.version*)
>                 *(.gnu.attributes)
>                 *(.eh_frame)
>         }
>
> Since .rela* sections are needed when CONFIG_RELOCATABLE is defined,
> change to discard .rela* sections if CONFIG_RELOCATABLE is undefined.
>
> Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> ---
>  arch/powerpc/kernel/vmlinux.lds.S | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Please insert this patch into your series prior to the patch that caused
the build break.

cheers

> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> index 31a0f201fb6f..4ba07734a210 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -366,9 +366,12 @@ SECTIONS
>  	DISCARDS
>  	/DISCARD/ : {
>  		*(*.EMB.apuinfo)
> -		*(.glink .iplt .plt .rela* .comment)
> +		*(.glink .iplt .plt .comment)
>  		*(.gnu.version*)
>  		*(.gnu.attributes)
>  		*(.eh_frame)
> +#ifndef CONFIG_RELOCATABLE
> +		*(.rela*)
> +#endif
>  	}
>  }
> -- 
> 2.25.4
