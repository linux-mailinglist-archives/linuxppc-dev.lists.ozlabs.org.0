Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A9A17B36B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 02:05:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YTtQ0HlzzDqyl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 12:05:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YT3b3kkDzDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 11:27:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 48YT3Z6P34z9sSZ; Fri,  6 Mar 2020 11:27:54 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48YT3Z34Spz9sSm; Fri,  6 Mar 2020 11:27:54 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 3d13e839e801e081bdece0127c2affa33d0f77cf
In-Reply-To: <20200220115141.2707-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3 1/5] powerpc: Rename current_stack_pointer() to
 current_stack_frame()
Message-Id: <48YT3Z34Spz9sSm@ozlabs.org>
Date: Fri,  6 Mar 2020 11:27:54 +1100 (AEDT)
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

On Thu, 2020-02-20 at 11:51:37 UTC, Michael Ellerman wrote:
> current_stack_pointer(), which was called __get_SP(), used to just
> return the value in r1.
> 
> But that caused problems in some cases, so it was turned into a
> function in commit bfe9a2cfe91a ("powerpc: Reimplement __get_SP() as a
> function not a define").
> 
> Because it's a function in a separate compilation unit to all its
> callers, it has the effect of causing a stack frame to be created, and
> then returns the address of that frame. This is good in some cases
> like those described in the above commit, but in other cases it's
> overkill, we just need to know what stack page we're on.
> 
> On some other arches current_stack_pointer is just a register global
> giving the stack pointer, and we'd like to do that too. So rename our
> current_stack_pointer() to current_stack_frame() to make that
> possible.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Series applied to powerpc next.

https://git.kernel.org/powerpc/c/3d13e839e801e081bdece0127c2affa33d0f77cf

cheers
