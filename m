Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D29F1E9B8F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 13:31:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47379V2WrvzDrRF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 23:31:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4736nk61MfzF4BX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 23:14:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4736nk4Wzwz9sPj; Wed, 30 Oct 2019 23:14:18 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 29674a1c71be710f8418468aa6a8addd6d1aba1c
In-Reply-To: <1568733750-14580-1-git-send-email-cai@lca.pw>
To: Qian Cai <cai@lca.pw>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pkeys: remove unused pkey_allows_readwrite
Message-Id: <4736nk4Wzwz9sPj@ozlabs.org>
Date: Wed, 30 Oct 2019 23:14:18 +1100 (AEDT)
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
Cc: Qian Cai <cai@lca.pw>, linuxppc-dev@lists.ozlabs.org, linuxram@us.ibm.com,
 linux-kernel@vger.kernel.org, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-09-17 at 15:22:30 UTC, Qian Cai wrote:
> pkey_allows_readwrite() was first introduced in the commit 5586cf61e108
> ("powerpc: introduce execute-only pkey"), but the usage was removed
> entirely in the commit a4fcc877d4e1 ("powerpc/pkeys: Preallocate
> execute-only key").
> 
> Found by the "-Wunused-function" compiler warning flag.
> 
> Fixes: a4fcc877d4e1 ("powerpc/pkeys: Preallocate execute-only key")
> Signed-off-by: Qian Cai <cai@lca.pw>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/29674a1c71be710f8418468aa6a8addd6d1aba1c

cheers
