Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 379724A5C2C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 13:25:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp40H6yHZz3cCr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 23:25:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=i4K5yKyp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp3zf3Y6hz2yZ6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 23:25:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=i4K5yKyp; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Jp3zd47dzz4xRB;
 Tue,  1 Feb 2022 23:25:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1643718318;
 bh=Eo0VMNs93fqn5QtpRNO6vn2uRm7WoC7mDC/GIQ51f0A=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=i4K5yKyp07XRnPGRReWiS76W4XMGCUwlQtDgD2ynHm612NOghGzevhEdamEjFHOyE
 VhgQJIBvLqMMmAdkmQAfzcWw88FFn8AB6r8BkPF21PUOrtkotTo60PLlR4X1yb1bhP
 rqR3BhkDPn6vbiC/XarQVYOj0iDnR+QNjcw6sU4Mvc2zUUnaqVzSTZ3TfScTYAL9b9
 CXS1o6CWmnV2AVXj7uw2kFjN+Z9PeaAxMfgabHcOLMg//9FPSMYYpAhax5ZXBC6aXY
 kWgIDCyhuTuqDWpjR6/AZeSi4TqNVifVBZVT66hImSxVAi699V/JT/0sw8ZU6YQyrJ
 KEW7xJstS9Egw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/ptdump: Fix sparse warning in hashpagetable.c
In-Reply-To: <bbc196451dd34521d239023ccca488db35b8fff1.1643567900.git.christophe.leroy@csgroup.eu>
References: <bbc196451dd34521d239023ccca488db35b8fff1.1643567900.git.christophe.leroy@csgroup.eu>
Date: Tue, 01 Feb 2022 23:25:16 +1100
Message-ID: <87k0een58z.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>   arch/powerpc/mm/ptdump/hashpagetable.c:264:29: warning: restricted __be64 degrades to integer
>   arch/powerpc/mm/ptdump/hashpagetable.c:265:49: warning: restricted __be64 degrades to integer
>   arch/powerpc/mm/ptdump/hashpagetable.c:267:36: warning: incorrect type in assignment (different base types)
>   arch/powerpc/mm/ptdump/hashpagetable.c:267:36:    expected unsigned long long [usertype]
>   arch/powerpc/mm/ptdump/hashpagetable.c:267:36:    got restricted __be64 [usertype] v
>   arch/powerpc/mm/ptdump/hashpagetable.c:268:36: warning: incorrect type in assignment (different base types)
>   arch/powerpc/mm/ptdump/hashpagetable.c:268:36:    expected unsigned long long [usertype]
>   arch/powerpc/mm/ptdump/hashpagetable.c:268:36:    got restricted __be64 [usertype] r
>
> struct hash_pte fields have type __be64. Convert them to
> regular long before using them.

Your patch changes one side of the comparison but not the other, which
implies the code doesn't work at the moment, ie. it should never be
matching.

But it does work at the moment, so there must be something else going on.

> diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdump/hashpagetable.c
> index c7f824d294b2..bf60ab1bedb9 100644
> --- a/arch/powerpc/mm/ptdump/hashpagetable.c
> +++ b/arch/powerpc/mm/ptdump/hashpagetable.c
> @@ -261,11 +261,11 @@ static int pseries_find(unsigned long ea, int psize, bool primary, u64 *v, u64 *

Expanding the context a little:

	for (i = 0; i < HPTES_PER_GROUP; i += 4, hpte_group += 4) {
		lpar_rc = plpar_pte_read_4(0, hpte_group, (void *)ptes);

>  		if (lpar_rc)
>  			continue;
>  		for (j = 0; j < 4; j++) {
> -			if (HPTE_V_COMPARE(ptes[j].v, want_v) &&
> -					(ptes[j].v & HPTE_V_VALID)) {
> +			if (HPTE_V_COMPARE(be64_to_cpu(ptes[j].v), want_v) &&
> +			    (be64_to_cpu(ptes[j].v) & HPTE_V_VALID)) {
>  				/* HPTE matches */
> -				*v = ptes[j].v;
> -				*r = ptes[j].r;
> +				*v = be64_to_cpu(ptes[j].v);
> +				*r = be64_to_cpu(ptes[j].r);
>  				return 0;
>  			}
>  		}

Turns out the values returned from plpar_pte_read_4() are already in CPU
endian.

We pass an on-stack buffer to plpar_pte_read_4():

  plpar_pte_read_4(0, hpte_group, (void *)ptes);

Which makes it look like the hypercall is writing to memory (our
buffer), so we'd expect the values to need an endian swap.

But plpar_pte_read_4() writes into that buffer from another on-stack
buffer:

static inline long plpar_pte_read_4(unsigned long flags, unsigned long ptex,
				    unsigned long *ptes)

{
	long rc;
	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];

	rc = plpar_hcall9(H_READ, retbuf, flags | H_READ_4, ptex);

	memcpy(ptes, retbuf, 8*sizeof(unsigned long));

	return rc;
}


And the values in that stack buffer are actually returned from the
hypervisor in registers, r4-r11, and written into retbuf by the asm
wrapper:

_GLOBAL_TOC(plpar_hcall9)
	HMT_MEDIUM

	mfcr	r0
	stw	r0,8(r1)

	HCALL_BRANCH(plpar_hcall9_trace)

	std     r4,STK_PARAM(R4)(r1)     /* Save ret buffer */ 		<- this is retbuf

	mr	r4,r5
	mr	r5,r6
	mr	r6,r7
	mr	r7,r8
	mr	r8,r9
	mr	r9,r10
	ld	r10,STK_PARAM(R11)(r1)	 /* put arg7 in R10 */
	ld	r11,STK_PARAM(R12)(r1)	 /* put arg8 in R11 */
	ld	r12,STK_PARAM(R13)(r1)    /* put arg9 in R12 */

	HVSC				/* invoke the hypervisor */

	mr	r0,r12
	ld	r12,STK_PARAM(R4)(r1)		<- reload retbuf into r12
	std	r4,  0(r12)
	std	r5,  8(r12)
	std	r6, 16(r12)
	std	r7, 24(r12)
	std	r8, 32(r12)
	std	r9, 40(r12)
	std	r10,48(r12)
	std	r11,56(r12)
	std	r0, 64(r12)


Although the values are BE in memory in the actual HPT, they're read by
the hypervisor which does the byte swap for us, and then when the
hypervisor returns they're returned in the registers. So there's no
extra byte swap needed.

Possibly we should move struct hash_pte into hash_native.c, which is
where it's almost exclusively used, and is used to point to actual HPTEs
in memory.

But for now I think the patch below is a minimal fix for this sparse
warning, it's what other callers of plpar_pte_read_4() are doing.

cheers


diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdump/hashpagetable.c
index c7f824d294b2..9a601587836b 100644
--- a/arch/powerpc/mm/ptdump/hashpagetable.c
+++ b/arch/powerpc/mm/ptdump/hashpagetable.c
@@ -238,7 +238,10 @@ static int native_find(unsigned long ea, int psize, bool primary, u64 *v, u64
 
 static int pseries_find(unsigned long ea, int psize, bool primary, u64 *v, u64 *r)
 {
-	struct hash_pte ptes[4];
+	struct {
+		unsigned long v;
+		unsigned long r;
+	} ptes[4];
 	unsigned long vsid, vpn, hash, hpte_group, want_v;
 	int i, j, ssize = mmu_kernel_ssize;
 	long lpar_rc = 0;


