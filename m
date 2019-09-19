Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7061B77AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 12:47:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Ytnz4JSgzF4tf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 20:47:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YtKT5HX4zF4Xs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 20:25:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46YtKT1sSHz9sPf; Thu, 19 Sep 2019 20:25:48 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: e7ca44ed3ba77fc26cf32650bb71584896662474
In-Reply-To: <20190904075949.15607-1-ganeshgr@linux.ibm.com>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc: dump kernel log before carrying out fadump or
 kdump
Message-Id: <46YtKT1sSHz9sPf@ozlabs.org>
Date: Thu, 19 Sep 2019 20:25:48 +1000 (AEST)
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
Cc: mahesh@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-09-04 at 07:59:49 UTC, Ganesh Goudar wrote:
> Since commit 4388c9b3a6ee ("powerpc: Do not send system reset request
> through the oops path"), pstore dmesg file is not updated when dump is
> triggered from HMC. This commit modified system reset (sreset) handler
> to invoke fadump or kdump (if configured), without pushing dmesg to
> pstore. This leaves pstore to have old dmesg data which won't be much
> of a help if kdump fails to capture the dump. This patch fixes that by
> calling kmsg_dump() before heading to fadump ot kdump.
> 
> Fixes: 4388c9b3a6ee ("powerpc: Do not send system reset request through the oops path")
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/e7ca44ed3ba77fc26cf32650bb71584896662474

cheers
