Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5DF12857
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:01:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wNN32S8yzDqWS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:01:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNK55wFfzDqPP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNK55DB0z9sB8; Fri,  3 May 2019 16:59:05 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: a913e5e8b43be1d3897a141ce61c1ec071cad89c
X-Patchwork-Hint: ignore
In-Reply-To: <20181127082452.8307-2-anju@linux.vnet.ibm.com>
To: Anju T Sudhakar <anju@linux.vnet.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/perf: Return accordingly on invalid chip-id in
Message-Id: <44wNK55DB0z9sB8@ozlabs.org>
Date: Fri,  3 May 2019 16:59:05 +1000 (AEST)
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 anju@linux.vnet.ibm.com, dan.carpenter@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2018-11-27 at 08:24:52 UTC, Anju T Sudhakar wrote:
> Nest hardware counter memory resides in a per-chip reserve-memory.
> During nest_imc_event_init(), chip-id of the event-cpu is considered to
> calculate the base memory addresss for that cpu. Return, proper error
> condition if the chip_id calculated is invalid.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: 885dcd709ba91 ("powerpc/perf: Add nest IMC PMU support")
> Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a913e5e8b43be1d3897a141ce61c1ec0

cheers
