Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BB8B7791
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 12:37:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YtbL74DdzF4lM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 20:37:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YtKM65m3zF4XX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 20:25:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46YtKM22Ylz9sPM; Thu, 19 Sep 2019 20:25:42 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: ed6546bdc61b7c4bd926cebd82ba52d056fcefa1
In-Reply-To: <20190902152931.17840-2-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/6] powerpc/64s: remove register_process_table callback
Message-Id: <46YtKM22Ylz9sPM@ozlabs.org>
Date: Thu, 19 Sep 2019 20:25:42 +1000 (AEST)
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-09-02 at 15:29:26 UTC, Nicholas Piggin wrote:
> This callback is only required because the partition table init comes
> before process table allocation on powernv (aka bare metal aka native).
> 
> Change the order to allocate the process table first, and remove the
> callback.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/ed6546bdc61b7c4bd926cebd82ba52d056fcefa1

cheers
