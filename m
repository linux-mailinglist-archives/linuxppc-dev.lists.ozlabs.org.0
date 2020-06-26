Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE2F20AB84
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 06:54:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tPg54kpNzDqcv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 14:54:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tPTb0FqGzDqY0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:45:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49tPTW0G2Qz9sTC; Fri, 26 Jun 2020 14:45:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20200622064019.16682-1-aneesh.kumar@linux.ibm.com>
References: <20200622064019.16682-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/mm/book3s64: Skip 16G page reservation with radix
Message-Id: <159314672806.1150869.49009797450661320.b4-ty@ellerman.id.au>
Date: Fri, 26 Jun 2020 14:45:50 +1000 (AEST)
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

On Mon, 22 Jun 2020 12:10:19 +0530, Aneesh Kumar K.V wrote:
> With hash translation, the hypervisor can hint the LPAR about 16GB contiguous range
> via ibm,expected#pages. The kernel marks the range specified in the device tree
> as reserved. Avoid doing this when using radix translation. Radix translation
> only supports 1G gigantic hugepage and kernel can do the 1G gigantic hugepage
> allocation via early memblock reservation. This can be done because with radix
> translation pages are not required to be contiguous on the host.

Applied to powerpc/next.

[1/1] powerpc/mm/book3s64: Skip 16G page reservation with radix
      https://git.kernel.org/powerpc/c/86590e524ee834b629afc55d8e5786091fbf84cc

cheers
