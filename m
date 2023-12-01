Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE1C80085B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 11:36:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oJxiobrQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShTy60bxpz3dGx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 21:36:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oJxiobrQ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShTxD6xJwz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 21:36:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701426960;
	bh=hvrVIGDjEvHvM05M//g4xvGGlLsqrVPHDwkxDc7GPuQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oJxiobrQ70dYNZ2yEqCwFWNC+vmu9wdVWZSiQr+xN/rGkfruSTBW/oORcv1CNXqlm
	 R20tlBkRNqj0Grh2TYBc0ZHnoi1Z+dyLqENDpGVHPafY6TTvnYIiKZTzgvzfXyrUhY
	 Nw6bdePNyTvKFUFPhvpQgmk98T7gtm/Ww+dsjbfCE9mHEvMvlDvWXcX2RBUUYT3akO
	 bcET96QgUFHE/Yv2D/ESijO2hxW8C7WpnhvJ+iFHDSLD6DcKU6ABY/W+vpi1bKU8or
	 LRDTh7QVmRwdOErrDBSJxwIYmgRXjynRyVGvCd8bP55ve26rPw2f+eDSQ0ijg1lExf
	 HAtgtiWOMWKPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ShTxD2pJrz4wc6;
	Fri,  1 Dec 2023 21:36:00 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 christophe.leroy@csgroup.eu
Subject: Re: [PATCH v2] powerpc/book3s/hash: Drop _PAGE_PRIVILEGED from
 PAGE_NONE
In-Reply-To: <20231114071130.197966-1-aneesh.kumar@linux.ibm.com>
References: <20231114071130.197966-1-aneesh.kumar@linux.ibm.com>
Date: Fri, 01 Dec 2023 21:35:59 +1100
Message-ID: <87a5qu1a7k.fsf@mail.lhotse>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> There used to be a dependency on _PAGE_PRIVILEGED with pte_savedwrite.
> But that got dropped by
> commit 6a56ccbcf6c6 ("mm/autonuma: use can_change_(pte|pmd)_writable() to replace savedwrite")
>
> With the change in this patch numa fault pte (pte_protnone()) gets mapped as regular user pte
> with RWX cleared (no-access) whereas earlier it used to be mapped _PAGE_PRIVILEGED.
>
> Hash fault handling code did get some WARN_ON added because those
> functions are not expected to get called with _PAGE_READ cleared.
> commit 18061c17c8ec ("powerpc/mm: Update PROTFAULT handling in the page fault path")
> explains the details.
 
You say "did get" which makes me think you're talking about the past.
But I think you're referring to the WARN_ON you are adding in this patch?

> Also revert commit 1abce0580b89 ("powerpc/64s: Fix __pte_needs_flush() false positive warning")

That could be done separately as a follow-up couldn't it? Would reduce
the diff size.

> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h  | 9 +++------
>  arch/powerpc/include/asm/book3s/64/tlbflush.h | 9 ++-------
>  arch/powerpc/mm/book3s64/hash_utils.c         | 7 +++++++
>  3 files changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index cb77eddca54b..2cc58ac74080 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -17,12 +17,6 @@
>  #define _PAGE_EXEC		0x00001 /* execute permission */
>  #define _PAGE_WRITE		0x00002 /* write access allowed */
>  #define _PAGE_READ		0x00004	/* read access allowed */
> -#define _PAGE_NA		_PAGE_PRIVILEGED
 
> -#define _PAGE_NAX		_PAGE_EXEC
> -#define _PAGE_RO		_PAGE_READ
> -#define _PAGE_ROX		(_PAGE_READ | _PAGE_EXEC)
> -#define _PAGE_RW		(_PAGE_READ | _PAGE_WRITE)
> -#define _PAGE_RWX		(_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC)
 
Those are unrelated I think?

>  #define _PAGE_PRIVILEGED	0x00008 /* kernel access only */
>  #define _PAGE_SAO		0x00010 /* Strong access order */
>  #define _PAGE_NON_IDEMPOTENT	0x00020 /* non idempotent memory */
> @@ -529,6 +523,9 @@ static inline bool pte_user(pte_t pte)
>  }
>  
>  #define pte_access_permitted pte_access_permitted
> +/*
> + * execute-only mappings return false
> + */

That would fit better in the existing comment block inside the function
I think. Normally this location would be a function description comment.

>  static inline bool pte_access_permitted(pte_t pte, bool write)
>  {
>  	/*
          ie. here

cheers
