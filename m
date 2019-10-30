Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11783E9B82
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 13:28:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47375v4JTWzF4G9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 23:28:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4736nj6T3qzF4BQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 23:14:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4736nj4LQdz9sQq; Wed, 30 Oct 2019 23:14:17 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 5f5d6e40a01e70b731df843d8b5a61b4b28b19d9
In-Reply-To: <20190917123851.22553-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 paulus@samba.org, dan.j.williams@intel.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/nvdimm: Update vmemmap_populated to check
 sub-section range
Message-Id: <4736nj4LQdz9sQq@ozlabs.org>
Date: Wed, 30 Oct 2019 23:14:17 +1100 (AEDT)
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-09-17 at 12:38:51 UTC, "Aneesh Kumar K.V" wrote:
> With commit: 7cc7867fb061 ("mm/devm_memremap_pages: enable sub-section remap")
> pmem namespaces are remapped in 2M chunks. On architectures like ppc64 we
> can map the memmap area using 16MB hugepage size and that can cover
> a memory range of 16G.
> 
> While enabling new pmem namespaces, since memory is added in sub-section chunks,
> before creating a new memmap mapping, kernel should check whether there is an
> existing memmap mapping covering the new pmem namespace. Currently, this is
> validated by checking whether the section covering the range is already
> initialized or not. Considering there can be multiple namespaces in the same
> section this can result in wrong validation. Update this to check for
> sub-sections in the range. This is done by checking for all pfns in the range we
> are mapping.
> 
> We could optimize this by checking only just one pfn in each sub-section. But
> since this is not fast-path we keep this simple.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/5f5d6e40a01e70b731df843d8b5a61b4b28b19d9

cheers
