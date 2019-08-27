Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FCF9DB60
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 03:52:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HX1m4FHwzDqKr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 11:52:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HWzm2zTnzDqTJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 11:50:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46HWzk4jRmz9s00;
 Tue, 27 Aug 2019 11:50:42 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alastair D'Silva <alastair@au1.ibm.com>, alastair@d-silva.org
Subject: Re: [PATCH v2] powerpc: Allow flush_(inval_)dcache_range to work
 across ranges >4GB
In-Reply-To: <20190821001929.4253-1-alastair@au1.ibm.com>
References: <20190821001929.4253-1-alastair@au1.ibm.com>
Date: Tue, 27 Aug 2019 11:50:42 +1000
Message-ID: <875zmj4brh.fsf@concordia.ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Alastair D'Silva" <alastair@au1.ibm.com> writes:

> From: Alastair D'Silva <alastair@d-silva.org>
>
> The upstream commit:
> 22e9c88d486a ("powerpc/64: reuse PPC32 static inline flush_dcache_range()")
> has a similar effect, but since it is a rewrite of the assembler to C, is
> too invasive for stable. This patch is a minimal fix to address the issue in
> assembler.
>
> This patch applies cleanly to v5.2, v4.19 & v4.14.
>
> When calling flush_(inval_)dcache_range with a size >4GB, we were masking
> off the upper 32 bits, so we would incorrectly flush a range smaller
> than intended.
>
> This patch replaces the 32 bit shifts with 64 bit ones, so that
> the full size is accounted for.
>
> Changelog:
> v2
>   - Add related upstream commit
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  arch/powerpc/kernel/misc_64.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers


> diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
> index 1ad4089dd110..d4d096f80f4b 100644
> --- a/arch/powerpc/kernel/misc_64.S
> +++ b/arch/powerpc/kernel/misc_64.S
> @@ -130,7 +130,7 @@ _GLOBAL_TOC(flush_dcache_range)
>  	subf	r8,r6,r4		/* compute length */
>  	add	r8,r8,r5		/* ensure we get enough */
>  	lwz	r9,DCACHEL1LOGBLOCKSIZE(r10)	/* Get log-2 of dcache block size */
> -	srw.	r8,r8,r9		/* compute line count */
> +	srd.	r8,r8,r9		/* compute line count */
>  	beqlr				/* nothing to do? */
>  	mtctr	r8
>  0:	dcbst	0,r6
> @@ -148,7 +148,7 @@ _GLOBAL(flush_inval_dcache_range)
>  	subf	r8,r6,r4		/* compute length */
>  	add	r8,r8,r5		/* ensure we get enough */
>  	lwz	r9,DCACHEL1LOGBLOCKSIZE(r10)/* Get log-2 of dcache block size */
> -	srw.	r8,r8,r9		/* compute line count */
> +	srd.	r8,r8,r9		/* compute line count */
>  	beqlr				/* nothing to do? */
>  	sync
>  	isync
> -- 
> 2.21.0
