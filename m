Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7145833026
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 14:48:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HZbY4Q1wzDqST
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 22:48:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HZG12jtTzDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 22:32:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45HZG03HtCz9sN6; Mon,  3 Jun 2019 22:32:54 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 1549c42deff5f3ffff326ae295ae58165e5c5830
X-Patchwork-Hint: ignore
Content-Type: text/plain; charset="utf-8";
In-Reply-To: <20190524050956.14114-1-stewart@linux.ibm.com>
To: Stewart Smith <stewart@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/powernv: Update firmware archaeology around
 OPAL_HANDLE_HMI
Message-Id: <45HZG03HtCz9sN6@ozlabs.org>
Date: Mon,  3 Jun 2019 22:32:54 +1000 (AEST)
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
Cc: Stewart Smith <stewart@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-05-24 at 05:09:56 UTC, Stewart Smith wrote:
> The first machines to ship with OPAL firmware all got firmware updates
> that have the new call, but just in case someone is foolish enough to
> believe the first 4 months of firmware is the best, we keep this code
> around.
> 
> Comment is updated to not refer to late 2014 as recent or the future.
> 
> Signed-off-by: Stewart Smith <stewart@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/1549c42deff5f3ffff326ae295ae5816

cheers
