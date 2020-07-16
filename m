Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAE92223F0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 15:33:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6wF80XKbzDqWj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 23:33:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vPm0X6MzDqYX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:55:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vPf4xzsz9sTw; Thu, 16 Jul 2020 22:55:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: erhard_f@mailbox.org, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <3667deb0911affbf999b99f87c31c77d5e870cd2.1593690707.git.christophe.leroy@csgroup.eu>
References: <3667deb0911affbf999b99f87c31c77d5e870cd2.1593690707.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] Revert "powerpc/kasan: Fix shadow pages allocation
 failure"
Message-Id: <159490400742.3805857.5182439247334544863.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:55:49 +1000 (AEST)
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

On Thu, 2 Jul 2020 11:52:02 +0000 (UTC), Christophe Leroy wrote:
> This reverts commit d2a91cef9bbdeb87b7449fdab1a6be6000930210.
> 
> This commit moved too much work in kasan_init(). The allocation
> of shadow pages has to be moved for the reason explained in that
> patch, but the allocation of page tables still need to be done
> before switching to the final hash table.
> 
> [...]

Applied to powerpc/next.

[1/2] Revert "powerpc/kasan: Fix shadow pages allocation failure"
      https://git.kernel.org/powerpc/c/b506923ee44ae87fc9f4de16b53feb313623e146
[2/2] powerpc/kasan: Fix shadow pages allocation failure
      https://git.kernel.org/powerpc/c/41ea93cf7ba4e0f0cc46ebfdda8b6ff27c67bc91

cheers
