Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 559AA23326C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 14:53:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHVhH0g66zDr31
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 22:53:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHVcl3qhGzDqwh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 22:50:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BHVcl1HR9z9sRX; Thu, 30 Jul 2020 22:50:15 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20200713150749.25245-1-aneesh.kumar@linux.ibm.com>
References: <20200713150749.25245-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/hugetlb/cma: Allocate gigantic hugetlb pages
 using CMA
Message-Id: <159611327944.1601380.11984377532813832527.b4-ty@ellerman.id.au>
Date: Thu, 30 Jul 2020 22:50:15 +1000 (AEST)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Jul 2020 20:37:48 +0530, Aneesh Kumar K.V wrote:
> commit: cf11e85fc08c ("mm: hugetlb: optionally allocate gigantic hugepages using cma")
> added support for allocating gigantic hugepages using CMA. This patch
> enables the same for powerpc

Applied to powerpc/next.

[1/2] powerpc/hugetlb/cma: Allocate gigantic hugetlb pages using CMA
      https://git.kernel.org/powerpc/c/ef26b76d1af61b90eb0dd3da58ad4f97d8e028f8
[2/2] powerpc/kvm/cma: Improve kernel log during boot
      https://git.kernel.org/powerpc/c/a5a8b258da7861009240b57687dfef47af91b406

cheers
