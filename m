Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8DC1E74E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 06:30:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YBSg1MtfzDqTd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 14:30:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YBKY2XMszDqcW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 14:24:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49YBKX1lDgz9sT2; Fri, 29 May 2020 14:24:15 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d02f6b7dab8228487268298ea1f21081c0b4b3eb
In-Reply-To: <20200407041245.600651-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3] powerpc/uaccess: evaluate macro arguments once,
 before user access is allowed
Message-Id: <49YBKX1lDgz9sT2@ozlabs.org>
Date: Fri, 29 May 2020 14:24:15 +1000 (AEST)
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

On Tue, 2020-04-07 at 04:12:45 UTC, Nicholas Piggin wrote:
> get/put_user can be called with nontrivial arguments. fs/proc/page.c
> has a good example:
> 
>     if (put_user(stable_page_flags(ppage), out)) {
> 
> stable_page_flags is quite a lot of code, including spin locks in the
> page allocator.
> 
> Ensure these arguments are evaluated before user access is allowed.
> This improves security by reducing code with access to userspace, but
> it also fixes a PREEMPT bug with KUAP on powerpc/64s:
> stable_page_flags is currently called with AMR set to allow writes,
> it ends up calling spin_unlock(), which can call preempt_schedule. But
> the task switch code can not be called with AMR set (it relies on
> interrupts saving the register), so this blows up.
> 
> It's fine if the code inside allow_user_access is preemptible, because
> a timer or IPI will save the AMR, but it's not okay to explicitly
> cause a reschedule.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to powerpc topic/uaccess-ppc, thanks.

https://git.kernel.org/powerpc/c/d02f6b7dab8228487268298ea1f21081c0b4b3eb

cheers
