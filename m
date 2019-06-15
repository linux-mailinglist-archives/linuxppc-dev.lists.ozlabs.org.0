Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 276324703F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 15:50:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QzPP1VHyzDr3h
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 23:50:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Qz5K2qLJzDrfx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 23:36:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45Qz5J4NDmz9sNl; Sat, 15 Jun 2019 23:36:04 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d4aa219a074a5abaf95a756b9f0d190b5c03a945
X-Patchwork-Hint: ignore
In-Reply-To: <20190612044506.16392-2-nathanl@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/3] powerpc/cacheinfo: add cacheinfo_teardown,
 cacheinfo_rebuild
Message-Id: <45Qz5J4NDmz9sNl@ozlabs.org>
Date: Sat, 15 Jun 2019 23:36:04 +1000 (AEST)
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

On Wed, 2019-06-12 at 04:45:04 UTC, Nathan Lynch wrote:
> Allow external callers to force the cacheinfo code to release all its
> references to cache nodes, e.g. before processing device tree updates
> post-migration, and to rebuild the hierarchy afterward.
> 
> CPU online/offline must be blocked by callers; enforce this.
> 
> Fixes: 410bccf97881 ("powerpc/pseries: Partition migration in the kernel")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d4aa219a074a5abaf95a756b9f0d190b

cheers
