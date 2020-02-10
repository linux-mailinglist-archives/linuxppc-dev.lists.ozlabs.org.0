Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 931D115733A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 12:04:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GNM53JJKzDq5t
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 22:04:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GNJS1KqFzDqJK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 22:01:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=I+3CIT97; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48GNJP0Cxwz9sP7;
 Mon, 10 Feb 2020 22:01:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1581332501;
 bh=PJQpp+82DbTtRtYpFA6iKQwKJ/YFQPhWyqk91A7RpFM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=I+3CIT97uU9eN2rACI2HGPBGIt5YdJcCu3JmWSUcLrqAke3ZaBnFwzXcF4moZBOtD
 3l33M5rqyE+U3GWzC69car4xZrQiExj+M+CbM3XsuykI/jifpdxSSaKNFYnIP7Kj6G
 FpoZl9RXUaM140vnDOHX+TmUzKL4SvkRLOGY2hueQATjBsm6WhFvr1wEiAVP529+OH
 O78MF45p885mczAWziqTzyJ7jdy5Q246/dfdf7cQISMO+n20pHgXySs7LDduzbliHf
 clCngKK97t9Woye+hhuWf4htUQeB5I1nWisLTOKXzhVaffPHjzIDiE9MJ9hz3Ll+xY
 b2jOw5KNOzDpA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Fangrui Song <maskray@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/vdso32: mark __kernel_datapage_offset as
 STV_PROTECTED
In-Reply-To: <20200205005054.k72fuikf6rwrgfe4@google.com>
References: <20200205005054.k72fuikf6rwrgfe4@google.com>
Date: Mon, 10 Feb 2020 22:01:37 +1100
Message-ID: <87pnemzoxa.fsf@mpe.ellerman.id.au>
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
Cc: clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Fangrui Song <maskray@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fangrui Song <maskray@google.com> writes:
> A PC-relative relocation (R_PPC_REL16_LO in this case) referencing a
> preemptible symbol in a -shared link is not allowed.  GNU ld's powerpc
> port is permissive and allows it [1], but lld will report an error after
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=ec0895f08f99515194e9fcfe1338becf6f759d38
>
> Make the symbol protected so that it is non-preemptible but still
> exported.

"preemptible" means something different to me, and I assume we're not
using it to mean the same thing.

Can you explain it using small words that a kernel developer can
understand? :)

cheers

> [1]: https://sourceware.org/bugzilla/show_bug.cgi?id=25500
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/851
> Signed-off-by: Fangrui Song <maskray@google.com>

> ---
>  arch/powerpc/kernel/vdso32/datapage.S | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/vdso32/datapage.S b/arch/powerpc/kernel/vdso32/datapage.S
> index 217bb630f8f9..2831a8676365 100644
> --- a/arch/powerpc/kernel/vdso32/datapage.S
> +++ b/arch/powerpc/kernel/vdso32/datapage.S
> @@ -13,7 +13,8 @@
>  #include <asm/vdso_datapage.h>
>  
>  	.text
> -	.global	__kernel_datapage_offset;
> +	.global	__kernel_datapage_offset
> +	.protected	__kernel_datapage_offset
>  __kernel_datapage_offset:
>  	.long	0
>  
> -- 
> 2.25.0.341.g760bfbb309-goog
