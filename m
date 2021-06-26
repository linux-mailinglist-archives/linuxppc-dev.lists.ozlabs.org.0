Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D94D3B4E27
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:40:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBr4m1b78z3dTr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:40:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBr2Q4Wrfz3c02
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:38:54 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBr2P2tvPz9sxS; Sat, 26 Jun 2021 20:38:53 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Steven Price <steven.price@arm.com>,
 akpm@linux-foundation.org, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, dja@axtens.net
In-Reply-To: <cover.1618828806.git.christophe.leroy@csgroup.eu>
References: <cover.1618828806.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 0/4] Convert powerpc to GENERIC_PTDUMP
Message-Id: <162470383963.3589875.4353977558954497976.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:37:19 +1000
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
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
 Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 19 Apr 2021 10:47:24 +0000 (UTC), Christophe Leroy wrote:
> This series converts powerpc to generic PTDUMP.
> 
> For that, we first need to add missing hugepd support
> to pagewalk and ptdump.
> 
> v2:
> - Reworked the pagewalk modification to add locking and check ops->pte_entry
> - Modified powerpc early IO mapping to have gaps between mappings
> - Removed the logic that checked for contiguous physical memory
> - Removed the articial level calculation in ptdump_pte_entry(), level 4 is ok for all.
> - Removed page_size argument to note_page()
> 
> [...]

Patches 2 and 4 pplied to powerpc/next.

[2/4] powerpc/mm: Leave a gap between early allocated IO areas
      https://git.kernel.org/powerpc/c/57307f1b6edd781fba2bf9f7ec5f4d17a881ea54
[3/4] powerpc/mm: Properly coalesce pages in ptdump
      https://git.kernel.org/powerpc/c/6ca6512c716afd6e37281372c4c35aa6afd71d10

cheers
