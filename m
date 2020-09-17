Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA87F26DA2C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 13:29:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsZW92VMzzDqX7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 21:29:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSL2yr5zDqSK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSL1fmhz9sTQ; Thu, 17 Sep 2020 21:27:14 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
In-Reply-To: <20200907072539.67310-1-aneesh.kumar@linux.ibm.com>
References: <20200907072539.67310-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerepc/book3s64/hash: Align start/end address correctly
 with bolt mapping
Message-Id: <160034201698.3339803.6802262384754914140.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:14 +1000 (AEST)
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

On Mon, 7 Sep 2020 12:55:39 +0530, Aneesh Kumar K.V wrote:
> This ensures we don't do a partial mapping of memory. With nvdimm, when
> creating namespaces with size not aligned to 16MB, the kernel ends up partially
> mapping the pages. This can result in kernel adding multiple hash page table
> entries for the same range. A new namespace will result in
> create_section_mapping() with start and end overlapping an already existing
> bolted hash page table entry.
> 
> [...]

Applied to powerpc/next.

[1/1] powerepc/book3s64/hash: Align start/end address correctly with bolt mapping
      https://git.kernel.org/powerpc/c/79b123cdf9cf0d4a1620baa8c611962626323a08

cheers
