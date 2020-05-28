Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF671E635B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 16:08:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XqKv1qx7zDqDQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 00:08:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XqFk01ZZzDqXL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 00:04:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49XqFj0Wktz9sRY; Fri, 29 May 2020 00:04:40 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Rui Salvaterra <rsalvaterra@gmail.com>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <b34706f8de87f84d135abb5f3ede6b6f16fb1f41.1589969799.git.christophe.leroy@csgroup.eu>
References: <b34706f8de87f84d135abb5f3ede6b6f16fb1f41.1589969799.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] Revert "powerpc/32s: reorder Linux PTE bits to better
 match Hash PTE bits."
Message-Id: <159067441582.2990081.4426286987662980016.b4-ty@ellerman.id.au>
Date: Fri, 29 May 2020 00:04:40 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 20 May 2020 10:23:45 +0000 (UTC), Christophe Leroy wrote:
> This reverts commit 697ece78f8f749aeea40f2711389901f0974017a.
> 
> The implementation of SWAP on powerpc requires page protection
> bits to not be one of the least significant PTE bits.
> 
> Until the SWAP implementation is changed and this requirement voids,
> we have to keep at least _PAGE_RW outside of the 3 last bits.
> 
> [...]

Applied to powerpc/fixes.

[1/1] Revert "powerpc/32s: reorder Linux PTE bits to better match Hash PTE bits."
      https://git.kernel.org/powerpc/c/40bb0e904212cf7d6f041a98c58c8341b2016670

cheers
