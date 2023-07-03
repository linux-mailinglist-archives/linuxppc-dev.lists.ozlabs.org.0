Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 688547454EB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:35:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZPz2Qk5z3cPy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:35:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZP066X6z2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:34:28 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZNz4djHz4wqX;
	Mon,  3 Jul 2023 15:34:27 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-mm@kvack.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
References: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
Subject: Re: (subset) [PATCH v2 00/16] Add support for DAX vmemmap optimization for ppc64
Message-Id: <168836201897.50010.5431020303397847542.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:26:58 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Mike Kravetz <mike.kravetz@oracle.com>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 16 Jun 2023 16:38:10 +0530, Aneesh Kumar K.V wrote:
> This patch series implements changes required to support DAX vmemmap
> optimization for ppc64. The vmemmap optimization is only enabled with radix MMU
> translation and 1GB PUD mapping with 64K page size. The patch series also split
> hugetlb vmemmap optimization as a separate Kconfig variable so that
> architectures can enable DAX vmemmap optimization without enabling hugetlb
> vmemmap optimization. This should enable architectures like arm64 to enable DAX
> vmemmap optimization while they can't enable hugetlb vmemmap optimization. More
> details of the same are in patch "mm/vmemmap optimization: Split hugetlb and
> devdax vmemmap optimization"
> 
> [...]

Patch 1, 3, 4 and 5 applied to powerpc/next.

[01/16] powerpc/mm/book3s64: Use pmdp_ptep helper instead of typecasting.
        https://git.kernel.org/powerpc/c/040ec6202bb89d51e2d8d4c848d8160c0e5e3fe8
[03/16] powerpc/book3s64/mm: Fix DirectMap stats in /proc/meminfo
        https://git.kernel.org/powerpc/c/0da90af431abc3f497a38ec9ef6e43b0d0dabe80
[04/16] powerpc/book3s64/mm: Use PAGE_KERNEL instead of opencoding
        https://git.kernel.org/powerpc/c/d933557b858f78d7b702e70614b469a84b72e56c
[05/16] powerpc/mm/dax: Fix the condition when checking if altmap vmemap can cross-boundary
        https://git.kernel.org/powerpc/c/c8eebc4a99f15280654f23e914e746c40a516e50

cheers
