Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2397D737A0D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 06:09:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aDwb3nvs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qm94G6ztSz3bYC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 14:09:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aDwb3nvs;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qm93M3NFsz2xLN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 14:08:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Qm93F3VZzz4wgC;
	Wed, 21 Jun 2023 14:08:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1687320506;
	bh=NybcyVrJyjzc4xEipGmIejKULu0vywTwDgXE//RRvK8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aDwb3nvsA+fYCbuhxXjY00uryHvszL1qvenMQeNojxF7hvt2oaN4l6cJRxs5igRCo
	 Eqk8Fkyi/XzkVcbh+C3k7HUIQJEh54bXY/3rSBNMLzS2Q5erBQVxqPUuwN9xnK0wGm
	 SqSZvXodPQU62ybWhnN8jhIhFV/a0ao5wdHkEhiOIg5z5OMz5Xo13HLBaAWQvrYigC
	 rP5ulk1Zv7JJJ8MCBLZz8Wphp9tReITcMe+foR47y2TH79vHHped6atD/LxWG3OblE
	 H3kTW6Z9R8g8fNLRheW87W+/k3RWW5xDXr1wtvE8H37HkI/iFBN+RxYs7+kiUZqRmM
	 BRF75qE5brPZQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 02/16] powerpc/book3s64/mm: mmu_vmemmap_psize is used by
 radix
In-Reply-To: <20230606045608.55127-3-aneesh.kumar@linux.ibm.com>
References: <20230606045608.55127-1-aneesh.kumar@linux.ibm.com>
 <20230606045608.55127-3-aneesh.kumar@linux.ibm.com>
Date: Wed, 21 Jun 2023 14:08:25 +1000
Message-ID: <87bkh9pidi.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> This should not be within CONFIG_PPC_64S_HASHS_MMU. We use mmu_vmemmap_ps=
ize
> on radix while mapping the vmemmap area.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 2 --
>  1 file changed, 2 deletions(-)

This breaks microwatt_defconfig, which does not enable CONFIG_PPC_64S_HASH_=
MMU:

  ../arch/powerpc/mm/book3s64/radix_pgtable.c: In function =E2=80=98radix__=
early_init_mmu=E2=80=99:
  ../arch/powerpc/mm/book3s64/radix_pgtable.c:601:27: error: lvalue require=
d as left operand of assignment
    601 |         mmu_virtual_psize =3D MMU_PAGE_4K;
        |                           ^
  make[5]: *** [../scripts/Makefile.build:252: arch/powerpc/mm/book3s64/rad=
ix_pgtable.o] Error 1
  make[4]: *** [../scripts/Makefile.build:494: arch/powerpc/mm/book3s64] Er=
ror 2
  make[3]: *** [../scripts/Makefile.build:494: arch/powerpc/mm] Error 2
  make[2]: *** [../scripts/Makefile.build:494: arch/powerpc] Error 2
  make[2]: *** Waiting for unfinished jobs....
  make[1]: *** [/home/michael/linux/Makefile:2026: .] Error 2
  make: *** [Makefile:226: __sub-make] Error 2

Because mmu_virtual_psize is defined in hash_utils.c, which isn't built.

cheers
