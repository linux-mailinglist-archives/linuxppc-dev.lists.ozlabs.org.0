Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ABE12967
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 10:01:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wPjJ3CZtzDqn1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 18:01:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNKf32PVzDqR1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNKf0JJFz9sD4; Fri,  3 May 2019 16:59:33 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 5b2a15296210d3b70e06d0f09a8e701ff74ccbe8
X-Patchwork-Hint: ignore
In-Reply-To: <20181004062337.14252-1-anton@ozlabs.org>
To: Anton Blanchard <anton@ozlabs.org>, benh@kernel.crashing.org,
 paulus@samba.org, npiggin@gmail.com, ruscur@russell.cc
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Add doorbell tracepoints
Message-Id: <44wNKf0JJFz9sD4@ozlabs.org>
Date: Fri,  3 May 2019 16:59:33 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2018-10-04 at 06:23:37 UTC, Anton Blanchard wrote:
> When analysing sources of OS jitter, I noticed that doorbells cannot be
> traced.
> 
> Signed-off-by: Anton Blanchard <anton@ozlabs.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/5b2a15296210d3b70e06d0f09a8e701f

cheers
