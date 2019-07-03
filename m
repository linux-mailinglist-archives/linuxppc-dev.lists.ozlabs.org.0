Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADD35E706
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 16:44:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f3lM2j0xzDq9V
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 00:43:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f3Ms3F0PzDqRd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 00:27:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45f3Ms0gcWz9sNf; Thu,  4 Jul 2019 00:27:04 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 9fb603050ffd94f8127df99c699cca2f575eb6a0
In-Reply-To: <20190621060518.29616-1-nathanl@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/rtas: retry when cpu offline races with
 suspend/migration
Message-Id: <45f3Ms0gcWz9sNf@ozlabs.org>
Date: Thu,  4 Jul 2019 00:27:04 +1000 (AEST)
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
Cc: ego@linux.vnet.ibm.com, mmc@linux.vnet.ibm.com, julietk@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-06-21 at 06:05:18 UTC, Nathan Lynch wrote:
> The protocol for suspending or migrating an LPAR requires all present
> processor threads to enter H_JOIN. So if we have threads offline, we
> have to temporarily bring them up. This can race with administrator
> actions such as SMT state changes. As of dfd718a2ed1f ("powerpc/rtas:
> Fix a potential race between CPU-Offline & Migration"),
> rtas_ibm_suspend_me() accounts for this, but errors out with -EBUSY
> for what almost certainly is a transient condition in any reasonable
> scenario.
> 
> Callers of rtas_ibm_suspend_me() already retry when -EAGAIN is
> returned, and it is typical during a migration for that to happen
> repeatedly for several minutes polling the H_VASI_STATE hcall result
> before proceeding to the next stage.
> 
> So return -EAGAIN instead of -EBUSY when this race is
> encountered. Additionally: logging this event is still appropriate but
> use pr_info instead of pr_err; and remove use of unlikely() while here
> as this is not a hot path at all.
> 
> Fixes: dfd718a2ed1f ("powerpc/rtas: Fix a potential race between CPU-Offline & Migration")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/9fb603050ffd94f8127df99c699cca2f575eb6a0

cheers
