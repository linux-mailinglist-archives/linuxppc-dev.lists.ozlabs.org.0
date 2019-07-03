Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3427D5E6FE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 16:42:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f3j62VXWzDq5k
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 00:42:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f3Mr6wPkzDqK1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 00:27:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45f3Mr1jKVz9sBp; Thu,  4 Jul 2019 00:27:03 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 04db3ede40ae4fc23a5c4237254c4a53bbe4c1f2
In-Reply-To: <1559829493-28457-1-git-send-email-cai@lca.pw>
To: Qian Cai <cai@lca.pw>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/cacheflush: fix variable set but not used
Message-Id: <45f3Mr1jKVz9sBp@ozlabs.org>
Date: Thu,  4 Jul 2019 00:27:03 +1000 (AEST)
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
Cc: paulus@samba.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Qian Cai <cai@lca.pw>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-06-06 at 13:58:13 UTC, Qian Cai wrote:
> The powerpc's flush_cache_vmap() is defined as a macro and never use
> both of its arguments, so it will generate a compilation warning,
> 
> lib/ioremap.c: In function 'ioremap_page_range':
> lib/ioremap.c:203:16: warning: variable 'start' set but not used
> [-Wunused-but-set-variable]
> 
> Fix it by making it an inline function.
> 
> Signed-off-by: Qian Cai <cai@lca.pw>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/04db3ede40ae4fc23a5c4237254c4a53bbe4c1f2

cheers
