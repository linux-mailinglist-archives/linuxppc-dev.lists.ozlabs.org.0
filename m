Return-Path: <linuxppc-dev+bounces-12999-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB18BE825D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 12:53:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp1rJ3nV5z3ccf;
	Fri, 17 Oct 2025 21:53:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760698384;
	cv=none; b=hcF02P9MbJ3lqvBZTMEr4V0Fq+yZcegZPeFWlRPPXeO9BsU1e9vKIbJspa0FLxUDIbz67TeQJO5fQpoj9T20EUYKZRsX+dtvnHuDHeIfov5JTRW0Ri/0rlFtN4yiC+eNTL1FcWU/3CNlfez2EwQJ1iqFw0KMZNyR0DD7j0zGnMaQ9G8Z/wdyCs6ZEIhzDed+Wz2rLYanBXvbstuJGV2m1BwZlJy6NiF6FzMu04YLq0z+1M9PsJCMsVgfaNeHwhj2b+3dE2+LTbdADpcbV7tGYVnRpZFC/xCjRtqfZ+JhAMY4xfqGn04Hw9b4m8nk3zs7L/3fFsGx2++FpPWd35iaFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760698384; c=relaxed/relaxed;
	bh=XK6rShI1laVwxqZnNYg1sUJOrdVDcwamBttA7hfuCSM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=g2cxKINWiPsT41r90nDPp2mKZji0oDm5DFHktSynBQJSRPFvJ0d2rB/8ooDPBBewip9tPQNn0eINoqQJS06dhnu7TUh0oPODRoMbtzeaMshZUA53HeRPmYvKPt5Y7rx4Q17WdhahlYmoqeWCKWLiMkSAbEu9rRZwL1ttURgbGrkzTVFrnMFPj/Pnl3gBxChrtxu4zIg69gcZrsQt1Sw3lSbv7QtQcdOaNHws0b4k61AiZUif4XyWh5AQ0RqGx/zKLk5Be1o/xJE0RI/WdzsqD1Z3pCxp2BDGB+WCpL4s4D6sZwOcWJtvBFajEAOrzTNFEAJop9rZzN4E32/inTaR/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=inria.fr; dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=tn4aYz9l; dkim-atps=neutral; spf=pass (client-ip=192.134.164.104; helo=mail3-relais-sop.national.inria.fr; envelope-from=julia.lawall@inria.fr; receiver=lists.ozlabs.org) smtp.mailfrom=inria.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=tn4aYz9l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inria.fr (client-ip=192.134.164.104; helo=mail3-relais-sop.national.inria.fr; envelope-from=julia.lawall@inria.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 17 Oct 2025 21:53:01 AEDT
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp1rF2GKWz3ccF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 21:53:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XK6rShI1laVwxqZnNYg1sUJOrdVDcwamBttA7hfuCSM=;
  b=tn4aYz9lmkDrc4N/iK2W/dM81CNjYMahGWFcq4rSfyrAOMJ30S0qvU5x
   DDrS1DB49dy9J+mDsmpdTC6EmQpk42hAVCNU91tBng/7RP3/kJKfUQYys
   dvZSuay+w3oYltOCgaKnt47F1KY4PVI6Z3oE5kX432CUOCAhWVjp27mxF
   g=;
X-CSE-ConnectionGUID: TVVds0QUR5GM1FOFhwN2PA==
X-CSE-MsgGUID: 9dq6U7JzTjaJHe2aNq8FFA==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.19,236,1754949600"; 
   d="scan'208";a="128490637"
Received: from bb116-15-226-202.singnet.com.sg (HELO hadrien) ([116.15.226.202])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 12:51:38 +0200
Date: Fri, 17 Oct 2025 18:51:31 +0800 (+08)
From: Julia Lawall <julia.lawall@inria.fr>
To: Thomas Gleixner <tglx@linutronix.de>
cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>, 
    Nicolas Palix <nicolas.palix@imag.fr>, kernel test robot <lkp@intel.com>, 
    Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
    Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>, 
    linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
    Heiko Carstens <hca@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
    Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
    Davidlohr Bueso <dave@stgolabs.net>, 
    =?ISO-8859-15?Q?Andr=E9_Almeida?= <andrealmeid@igalia.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, 
    Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
    linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 09/12] [RFC] coccinelle: misc: Add scoped_masked_$MODE_access()
 checker script
In-Reply-To: <20251017093030.378863263@linutronix.de>
Message-ID: <46ea566b-6c42-a73-31da-ba15ed82aaf@inria.fr>
References: <20251017085938.150569636@linutronix.de> <20251017093030.378863263@linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On Fri, 17 Oct 2025, Thomas Gleixner wrote:

> A common mistake in user access code is that the wrong access mode is
> selected for starting the user access section. As most architectures map
> Read and Write modes to ReadWrite this goes often unnoticed for quite some
> time.
>
> Aside of that the scoped user access mechanism requires that the same
> pointer is used for the actual accessor macros that was handed in to start
> the scope because the pointer can be modified by the scope begin mechanism
> if the architecture supports masking.
>
> Add a basic (and incomplete) coccinelle script to check for the common
> issues. The error output is:
>
> kernel/futex/futex.h:303:2-17: ERROR: Invalid pointer for unsafe_put_user(p) in scoped_masked_user_write_access(to)
> kernel/futex/futex.h:292:2-17: ERROR: Invalid access mode unsafe_get_user() in scoped_masked_user_write_access()
>
> Not-Yet-Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Julia Lawall <Julia.Lawall@inria.fr>
> Cc: Nicolas Palix <nicolas.palix@imag.fr>
> ---
>  scripts/coccinelle/misc/scoped_uaccess.cocci |  108 +++++++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>
> --- /dev/null
> +++ b/scripts/coccinelle/misc/scoped_uaccess.cocci
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/// Validate scoped_masked_user*access() scopes
> +///
> +// Confidence: Zero
> +// Options: --no-includes --include-headers
> +
> +virtual context
> +virtual report
> +virtual org
> +
> +@initialize:python@
> +@@
> +
> +scopemap = {
> +  'scoped_masked_user_read_access_size'  : 'scoped_masked_user_read_access',
> +  'scoped_masked_user_write_access_size' : 'scoped_masked_user_write_access',
> +  'scoped_masked_user_rw_access_size'    : 'scoped_masked_user_rw_access',
> +}
> +
> +# Most common accessors. Incomplete list
> +noaccessmap = {
> +  'scoped_masked_user_read_access'       : ('unsafe_put_user', 'unsafe_copy_to_user'),
> +  'scoped_masked_user_write_access'      : ('unsafe_get_user', 'unsafe_copy_from_user'),
> +}
> +
> +# Most common accessors. Incomplete list
> +ptrmap = {
> +  'unsafe_put_user'			 : 1,
> +  'unsafe_get_user'			 : 1,
> +  'unsafe_copy_to_user'		 	 : 0,
> +  'unsafe_copy_from_user'		 : 0,
> +}
> +
> +print_mode = None
> +
> +def pr_err(pos, msg):
> +   if print_mode == 'R':
> +      coccilib.report.print_report(pos[0], msg)
> +   elif print_mode == 'O':
> +      cocci.print_main(msg, pos)
> +
> +@r0 depends on report || org@
> +iterator name scoped_masked_user_read_access,
> +	      scoped_masked_user_read_access_size,
> +	      scoped_masked_user_write_access,
> +	      scoped_masked_user_write_access_size,
> +	      scoped_masked_user_rw_access,
> +	      scoped_masked_user_rw_access_size;
> +iterator scope;
> +statement S;
> +@@
> +
> +(
> +(
> +scoped_masked_user_read_access(...) S
> +|
> +scoped_masked_user_read_access_size(...) S
> +|
> +scoped_masked_user_write_access(...) S
> +|
> +scoped_masked_user_write_access_size(...) S
> +|
> +scoped_masked_user_rw_access(...) S
> +|
> +scoped_masked_user_rw_access_size(...) S
> +)
> +&
> +scope(...) S
> +)
> +
> +@script:python depends on r0 && report@
> +@@
> +print_mode = 'R'
> +
> +@script:python depends on r0 && org@
> +@@
> +print_mode = 'O'
> +
> +@r1@
> +expression sp, a0, a1;
> +iterator r0.scope;
> +identifier ac;
> +position p;
> +@@
> +
> +  scope(sp,...) {
> +    <+...
> +    ac@p(a0, a1, ...);
> +    ...+>
> +  }

This will be more efficient and equally useful with <... ...>
Using + requires that there is at least one match, which has a cost.

julia


> +
> +@script:python@
> +pos << r1.p;
> +scope << r0.scope;
> +ac << r1.ac;
> +sp << r1.sp;
> +a0 << r1.a0;
> +a1 << r1.a1;
> +@@
> +
> +scope = scopemap.get(scope, scope)
> +if ac in noaccessmap.get(scope, []):
> +   pr_err(pos, 'ERROR: Invalid access mode %s() in %s()' %(ac, scope))
> +
> +if ac in ptrmap:
> +   ap = (a0, a1)[ptrmap[ac]]
> +   if sp != ap.lstrip('&').split('->')[0].strip():
> +      pr_err(pos, 'ERROR: Invalid pointer for %s(%s) in %s(%s)' %(ac, ap, scope, sp))
>
>

