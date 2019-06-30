Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E945AF75
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 10:42:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45c3sS2HzKzDqsh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 18:42:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45c3lk4VtSzDqKs
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 18:37:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45c3lk2dfnz9sLt; Sun, 30 Jun 2019 18:37:22 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 87997471c597d0594dc8c9346ecaafab83798cf3
X-Patchwork-Hint: ignore
In-Reply-To: <1559121711-24114-1-git-send-email-zhangshaokun@hisilicon.com>
To: Shaokun Zhang <zhangshaokun@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: Fix misleading SPR and timebase information
Message-Id: <45c3lk2dfnz9sLt@ozlabs.org>
Date: Sun, 30 Jun 2019 18:37:21 +1000 (AEST)
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
Cc: Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-05-29 at 09:21:51 UTC, Shaokun Zhang wrote:
> pr_info shows SPR and timebase as a decimal value with a '0x'
> prefix, which is somewhat misleading.
> 
> Fix it to print hexadecimal, as was intended.
> 
> Fixes: 10d91611f426 ("powerpc/64s: Reimplement book3s idle code in C")
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/87997471c597d0594dc8c9346ecaafab83798cf3

cheers
