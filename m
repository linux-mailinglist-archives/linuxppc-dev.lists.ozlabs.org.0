Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1420E108C4A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 11:51:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47M3kZ0zWqzDqTZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 21:51:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47M3cw1zRwzDqTZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:46:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47M3cw0cKgz9sQy; Mon, 25 Nov 2019 21:46:56 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c4028fa2daa059ac9231ab3a4f57cbae814b3625
In-Reply-To: <de395e444fb8dd7a6365c3314d78e15ebb3d7d1b.1566382245.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/mm: drop #ifdef CONFIG_MMU in is_ioremap_addr()
Message-Id: <47M3cw0cKgz9sQy@ozlabs.org>
Date: Mon, 25 Nov 2019 21:46:56 +1100 (AEDT)
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

On Wed, 2019-08-21 at 10:13:32 UTC, Christophe Leroy wrote:
> powerpc always selects CONFIG_MMU and CONFIG_MMU is not checked
> anywhere else in powerpc code.
> 
> Drop the #ifdef and the alternative part of is_ioremap_addr()
> 
> Fixes: 9bd3bb6703d8("mm/nvdimm: add is_ioremap_addr and use that to check ioremap address")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/c4028fa2daa059ac9231ab3a4f57cbae814b3625

cheers
