Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9FE193EED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 13:33:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p4Ch3M12zDqwY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 23:33:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p3cc1nYdzDqkJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:06:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48p3cb04HBz9sSV; Thu, 26 Mar 2020 23:06:38 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: af92bad615be75c6c0d1b1c5b48178360250a187
In-Reply-To: <4e7b56865e01569058914c991143f5961b5d4719.1583507333.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/kasan: Fix kasan_remap_early_shadow_ro()
Message-Id: <48p3cb04HBz9sSV@ozlabs.org>
Date: Thu, 26 Mar 2020 23:06:38 +1100 (AEDT)
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

On Fri, 2020-03-06 at 15:09:40 UTC, Christophe Leroy wrote:
> At the moment kasan_remap_early_shadow_ro() does nothing, because
> k_end is 0 and k_cur < 0 is always true.
> 
> Change the test to k_cur != k_end, as done in
> kasan_init_shadow_page_tables()
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Fixes: cbd18991e24f ("powerpc/mm: Fix an Oops in kasan_mmu_init()")
> Cc: stable@vger.kernel.org

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/af92bad615be75c6c0d1b1c5b48178360250a187

cheers
