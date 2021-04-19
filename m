Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0047C363AF6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 07:17:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNw7M73m4z3c2d
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 15:17:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DPT/GfKG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=DPT/GfKG; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNw6z4pmtz2xMw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 15:17:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FNw6z1ZSzz9vFF;
 Mon, 19 Apr 2021 15:17:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618809451;
 bh=/Sp9vIXBz0ymCicotDnSwC2yAP8CO2zeL7E0C11wDeE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=DPT/GfKGkNhXzqS6WeeWlcci8Gcy9zczmlZZXLKco4e4YtWYJHnHqc1kNjYQFHzo8
 FEuBDRD15Le1x9pWxM+J4N8czC8+J4ob6K1t5ZbK2ZI6MLgiS4vjB6wGSWXrEXz6LC
 22EDtrXi/Bal5JuxoxbtWqNeyYUHAPFtTNIXuaAb395VsCED0yos9kJEd8PkOFPJ1O
 mTQjqLciFv58mRCf9u85b1peAQu5uNz4bmFc1pb/4LMM042UO8xgWjZYlARxT64vz/
 OB8sZz8ISK8cvCOxcqdFFaeSmfZzDEMgakk+QjzWqepb8pTK2qRjeOvwj9l+yNw62h
 /5GIeA/BfFOZg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michael Ellerman <patch-notifications@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/6] powerpc/mm/64s: Add _PAGE_KERNEL_ROX
In-Reply-To: <161806492582.1467223.8385484539752497993.b4-ty@ellerman.id.au>
References: <20210211135130.3474832-1-mpe@ellerman.id.au>
 <161806492582.1467223.8385484539752497993.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 15:17:30 +1000
Message-ID: <87a6puetud.fsf@mpe.ellerman.id.au>
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
Cc: aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <patch-notifications@ellerman.id.au> writes:

> On Fri, 12 Feb 2021 00:51:25 +1100, Michael Ellerman wrote:
>> In the past we had a fallback definition for _PAGE_KERNEL_ROX, but we
>> removed that in commit d82fd29c5a8c ("powerpc/mm: Distribute platform
>> specific PAGE and PMD flags and definitions") and added definitions
>> for each MMU family.
>> 
>> However we missed adding a definition for 64s, which was not really a
>> bug because it's currently not used.
>> 
>> [...]
>
> Applied to powerpc/next.
>
> [1/6] powerpc/mm/64s: Add _PAGE_KERNEL_ROX
>       https://git.kernel.org/powerpc/c/56bec2f9d4d05675cada96772a8a93010f4d82bf
> [2/6] powerpc/pseries: Add key to flags in pSeries_lpar_hpte_updateboltedpp()
>       https://git.kernel.org/powerpc/c/b56d55a5aa4aa9fc166595a7feb57f153ef7b555
> [3/6] powerpc/64s: Use htab_convert_pte_flags() in hash__mark_rodata_ro()
>       https://git.kernel.org/powerpc/c/2c02e656a29d5f64193eb93da92781bcf0517146
> [4/6] powerpc/mm/64s/hash: Factor out change_memory_range()
>       https://git.kernel.org/powerpc/c/6f223ebe9c3f3ed315a06cec156086f1f7f7ded1
> [5/6] powerpc/mm/64s/hash: Add real-mode change_memory_range() for hash LPAR
>       https://git.kernel.org/powerpc/c/87e65ad7bd3a84a992723753fcc23d31c2d063c2
> [6/6] powerpc/mm/64s: Allow STRICT_KERNEL_RWX again
>       https://git.kernel.org/powerpc/c/bd573a81312fd9d6520b1cc81a88fd29e670e1ff

v2 was applied.

cheers
