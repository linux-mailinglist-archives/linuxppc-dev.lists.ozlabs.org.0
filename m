Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDE419AD12
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 15:46:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48snY76RvZzDqT1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 00:46:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48smMz12f6zDr1f
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 23:53:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48smMx2C3Nz9sRf; Wed,  1 Apr 2020 23:53:33 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: efbc4303b255bb80ab1283794b36dd5fe1fb0ec3
In-Reply-To: <20200326184916.31172-1-ganeshgr@linux.ibm.com>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v4] powerpc/pseries: Handle UE event for memcpy_mcsafe
Message-Id: <48smMx2C3Nz9sRf@ozlabs.org>
Date: Wed,  1 Apr 2020 23:53:33 +1100 (AEDT)
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
Cc: mahesh@linux.vnet.ibm.com, santosh@fossix.org,
 Ganesh Goudar <ganeshgr@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-03-26 at 18:49:16 UTC, Ganesh Goudar wrote:
> memcpy_mcsafe has been implemented for power machines which is used
> by pmem infrastructure, so that an UE encountered during memcpy from
> pmem devices would not result in panic instead a right error code
> is returned. The implementation expects machine check handler to ignore
> the event and set nip to continue the execution from fixup code.
> 
> Appropriate changes are already made to powernv machine check handler,
> make similar changes to pseries machine check handler to ignore the
> the event and set nip to continue execution at the fixup entry if we
> hit UE at an instruction with a fixup entry.
> 
> while we are at it, have a common function which searches the exception
> table entry and updates nip with fixup address, and any future common
> changes can be made in this function that are valid for both architectures.
> 
> powernv changes are made by
> commit 895e3dceeb97 ("powerpc/mce: Handle UE event for memcpy_mcsafe")
> 
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
> Reviewed-by: Santosh S <santosh@fossix.org>
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/efbc4303b255bb80ab1283794b36dd5fe1fb0ec3

cheers
