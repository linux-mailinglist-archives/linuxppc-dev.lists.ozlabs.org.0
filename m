Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8953F43BED0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 03:11:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hf9dN3ds6z2ypL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 12:11:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KtTiqffv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hf9cm3wM1z2xVt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 12:11:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KtTiqffv; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hf9cm1Wd2z4xbW;
 Wed, 27 Oct 2021 12:11:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1635297080;
 bh=I3Ag9NoPyPnvqS/AhH06q+iM0kEFuT48hNrE1E088vQ=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=KtTiqffvf7wsJxcwV+p+kntC3Cy9YyjexeiXB1IUgzz9Hmm/wOGQ3AAlfmpp9harF
 xLgJGzPTSGdGkGlufnv0DNnfnX8MZ/mhszerQF/NRj/zg4Zx3e65cSAhuoStZmVNri
 bFjCgeGbH0exCoU3CGKEDSVX6Ts01lysKx1fqdQ/dBhVt3zQMni4d/zqcH2wSB3nCL
 KS+LltQvL8N8nsordTQH2ljpI8yRhY4RbCIZhNrYuturV9KmkuEwqDoLyaiZ/hcI25
 fYF25WGH+Ynu1UHzNvCaOvUjrmoEd5TOUf6H27xMfOxB7RpWsKzDfEdHku+bCO+32M
 ow3TGyu3+Ywvw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Denis Kirjanov <kda@linux-powerpc.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/xmon: fix task state output
In-Reply-To: <20211026133108.7113-1-kda@linux-powerpc.org>
References: <20211026133108.7113-1-kda@linux-powerpc.org>
Date: Wed, 27 Oct 2021 12:11:15 +1100
Message-ID: <87bl3bb7bg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Denis Kirjanov <kda@linux-powerpc.org> writes:
> p_state is unsigned since the commit 2f064a59a11f
>
> The patch also uses TASK_RUNNING instead of null.
>
> Fixes: 2f064a59a11f ("sched: Change task_struct::state")
> Signed-off-by: Denis Kirjanov <kda@linux-powerpc.org>
> ---
>  arch/powerpc/xmon/xmon.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index dd8241c009e5..8b28ff9d98d1 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -3264,8 +3264,7 @@ static void show_task(struct task_struct *volatile tsk)
>  	 * appropriate for calling from xmon. This could be moved
>  	 * to a common, generic, routine used by both.
>  	 */
> -	state = (p_state == 0) ? 'R' :
> -		(p_state < 0) ? 'U' :

I guess 'U' meant 'unknown'? I always thought it meant uninterruptible,
but obviously that is 'D'.

> +	state = (p_state == TASK_RUNNING) ? 'R' :
>  		(p_state & TASK_UNINTERRUPTIBLE) ? 'D' :
>  		(p_state & TASK_STOPPED) ? 'T' :
>  		(p_state & TASK_TRACED) ? 'C' :

I think a better cleanup would be to use task_is_running(),
task_is_traced(), task_is_stopped(). That way we're insulated somewhat
from any future changes.

That would add additional READ_ONCE()s of the state, but I don't think
we care, the task should not be running if the system is in xmon.

cheers
