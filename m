Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCFC99535
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 15:37:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Dlv756jLzDqT4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 23:37:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DlGh4FjYzDrQ3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 23:09:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46DlGh1NG5z9sP6; Thu, 22 Aug 2019 23:08:59 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 45ff3c55958542c3b76075d59741297b8cb31cbb
In-Reply-To: <c97284f912128cbc3f2fe09d68e90e65fb3e6026.1565361876.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Erhard F. <erhard_f@mailbox.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/kasan: fix parallele loading of modules.
Message-Id: <46DlGh1NG5z9sP6@ozlabs.org>
Date: Thu, 22 Aug 2019 23:08:59 +1000 (AEST)
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

On Fri, 2019-08-09 at 14:58:09 UTC, Christophe Leroy wrote:
> Parallele loading of modules may lead to bad setup of shadow
> page table entries.
> 
> First, lets align modules so that two modules never share the same
> shadow page.
> 
> Second, ensure that two modules cannot allocate two page tables for
> the same PMD entry at the same time. This is done by using
> init_mm.page_table_lock in the same way as __pte_alloc_kernel()
> 
> Fixes: 2edb16efc899 ("powerpc/32: Add KASAN support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/45ff3c55958542c3b76075d59741297b8cb31cbb

cheers
