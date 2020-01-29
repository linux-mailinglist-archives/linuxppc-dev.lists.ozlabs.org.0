Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A21CD14C61E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 06:50:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486sys4Vw3zDqK9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 16:50:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486sDn0JVLzDqMn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 16:17:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 486sDm3Clwz9sRW; Wed, 29 Jan 2020 16:17:28 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 970d54f99ceac5bbf27929cb5ebfe18338ba1543
In-Reply-To: <20191224064126.183670-1-ruscur@russell.cc>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/book3s64/hash: Disable 16M linear mapping
 size if not aligned
Message-Id: <486sDm3Clwz9sRW@ozlabs.org>
Date: Wed, 29 Jan 2020 16:17:28 +1100 (AEDT)
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, kernel-hardening@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-12-24 at 06:41:25 UTC, Russell Currey wrote:
> With STRICT_KERNEL_RWX on in a relocatable kernel under the hash MMU, if
> the position the kernel is loaded at is not 16M aligned, the kernel
> miscalculates its ALIGN*()s and things go horribly wrong.
> 
> We can easily avoid this when selecting the linear mapping size, so do
> so and print a warning.  I tested this for various alignments and as
> long as the position is 64K aligned it's fine (the base requirement for
> powerpc).
> 
> Signed-off-by: Russell Currey <ruscur@russell.cc>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/970d54f99ceac5bbf27929cb5ebfe18338ba1543

cheers
