Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7911E51FCE4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 14:32:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxgXc36hWz3byl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 22:32:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PbX2S4d5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxgX0238rz2yg3
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 22:31:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PbX2S4d5; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KxgWp3pt1z4xXh;
 Mon,  9 May 2022 22:31:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652099485;
 bh=SaSGAWOIlHMiL03aULPz9oOhk6sxCFXHchcnqd+bBpA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PbX2S4d5oYkLXdvSGuVI7LqILlKlaziIAHMrU2vKHXvTe6E99DYJR/x2ZurxyP/Je
 7aHELqir2k3dFvZPoTSHM/jeMpXpv2+YFxTNhcCZ8Qstt+S9P+pHZYY2oBu5os1xdZ
 myKlub3bTkUWD6ekYYmZ1R0ueDrjMWqE7lnH6WvdxsyDzIIKvfjsTNeNYFBZ4VD+ye
 EE4lAHSPR/UlLEivLGaVOUPqxAG4e3qB4rZ4lSA4eVckw92N9TYCr7ZfGgGlhaxhlW
 TJp6Eb72phdng6mKi+w8+aPbBpiKZUuU6MM/LHyT2FKpLUoCZ1qqLmRxBOZX1rG9wj
 PNkNm4ObBPm5w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bug: Use normal relative pointers in 'struct bug_entry'
In-Reply-To: <afddb4548e93f6458ec1d9ec185a834c348eda33.1651798983.git.jpoimboe@kernel.org>
References: <afddb4548e93f6458ec1d9ec185a834c348eda33.1651798983.git.jpoimboe@kernel.org>
Date: Mon, 09 May 2022 22:31:14 +1000
Message-ID: <871qx2ubu5.fsf@mpe.ellerman.id.au>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 linux-s390@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Josh Poimboeuf <jpoimboe@kernel.org> writes:
> With CONFIG_GENERIC_BUG_RELATIVE_POINTERS, the addr/file relative
> pointers are calculated weirdly: based on the beginning of the bug_entry
> struct address, rather than their respective pointer addresses.
>
> Make the relative pointers less surprising to both humans and tools by
> calculating them the normal way.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
...
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index ecbae1832de3..76252576d889 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -13,7 +13,8 @@
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
>  .macro __EMIT_BUG_ENTRY addr,file,line,flags
>  	 .section __bug_table,"aw"
> -5001:	 .4byte \addr - 5001b, 5002f - 5001b
> +5001:	 .4byte \addr - .
> +	 .4byte 5002f - .
>  	 .short \line, \flags
>  	 .org 5001b+BUG_ENTRY_SIZE
>  	 .previous
> @@ -24,7 +25,7 @@
>  #else
>  .macro __EMIT_BUG_ENTRY addr,file,line,flags
>  	 .section __bug_table,"aw"
> -5001:	 .4byte \addr - 5001b
> +5001:	 .4byte \addr - .
>  	 .short \flags
>  	 .org 5001b+BUG_ENTRY_SIZE
>  	 .previous

Embarrassingly, we have another copy of the logic, used in the C
versions, they need updating too:

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index ecbae1832de3..3fde35fd67f8 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -49,14 +49,14 @@
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
-	"2:\t.4byte 1b - 2b, %0 - 2b\n"		\
+	"2:\t.4byte 1b - ., %0 - .\n"		\
 	"\t.short %1, %2\n"			\
 	".org 2b+%3\n"				\
 	".previous\n"
 #else
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
-	"2:\t.4byte 1b - 2b\n"			\
+	"2:\t.4byte 1b - .\n"			\
 	"\t.short %2\n"				\
 	".org 2b+%3\n"				\
 	".previous\n"


With that added it seems to be working correctly for me.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)


cheers
