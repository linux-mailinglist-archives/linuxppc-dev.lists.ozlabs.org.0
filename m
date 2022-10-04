Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6575F44B3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:49:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfFw38Sfz3gBW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:49:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1b0N3nz3bjm
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:38:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1Z5gxRz4xHJ;
	Wed,  5 Oct 2022 00:38:58 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220903123640.719846-1-mpe@ellerman.id.au>
References: <20220903123640.719846-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/mm/64s: Drop pgd_huge()
Message-Id: <166488985450.779920.10720240945227242140.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:24:14 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-mm@kvack.org, aneesh.kumar@linux.ibm.com, mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 3 Sep 2022 22:36:39 +1000, Michael Ellerman wrote:
> On powerpc there are two ways for huge pages to be represented in the
> top level page table, aka PGD (Page Global Directory).
> 
> If the address space mapped by an individual PGD entry does not
> correspond to a given huge page size, then the PGD entry points to a
> non-standard page table, known as a "hugepd" (Huge Page Directory).
> The hugepd contains some number of huge page PTEs sufficient to map the
> address space with the given huge page size.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/mm/64s: Drop pgd_huge()
      https://git.kernel.org/powerpc/c/51da853e3708852f47cd95e6f5e1821c3d54c3ef
[2/2] powerpc/mm/64s: Drop p4d_leaf()
      https://git.kernel.org/powerpc/c/79c5640ab4460a03535ce0f120193174e7701b65

cheers
