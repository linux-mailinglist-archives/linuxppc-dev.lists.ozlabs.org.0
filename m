Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A634C2486B2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 16:07:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWCRN6XJJzDqNw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 00:07:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWCDV3YD4zDqVb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 23:58:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BWCDT2Qhyz9sTM; Tue, 18 Aug 2020 23:58:17 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20200817103301.158836-1-aneesh.kumar@linux.ibm.com>
References: <20200817103301.158836-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pkeys: Fix build error with PPC_MEM_KEYS disabled
Message-Id: <159775907906.1766076.6349631455013586842.b4-ty@ellerman.id.au>
Date: Tue, 18 Aug 2020 23:58:17 +1000 (AEST)
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

On Mon, 17 Aug 2020 16:03:01 +0530, Aneesh Kumar K.V wrote:
> IS_ENABLED() instead of #ifdef still requires variable declaration.
> In this specific case, default_uamor is declared in asm/pkeys.h which
> is only included if PPC_MEM_KEYS is enabled.
> 
> arch/powerpc/mm/book3s64/hash_utils.c: In function ‘hash__early_init_mmu_secondary’:
> arch/powerpc/mm/book3s64/hash_utils.c:1119:21: error: ‘default_uamor’ undeclared (first use in this function)
>  1119 |   mtspr(SPRN_UAMOR, default_uamor);
>       |                     ^~~~~~~~~~~~~

Applied to powerpc/fixes.

[1/1] powerpc/pkeys: Fix build error with PPC_MEM_KEYS disabled
      https://git.kernel.org/powerpc/c/1e4e4bcaf70ec89f8b499c93a83d078c1e5c0ea6

cheers
