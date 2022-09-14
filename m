Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E465B87D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 14:09:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSJzQ60GMz3c5D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 22:09:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=N6rGNIhN;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vzhve7Qq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=matz@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=N6rGNIhN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vzhve7Qq;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSJyl0yvwz3052
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 22:08:47 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 98EE41F88E;
	Wed, 14 Sep 2022 12:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1663157318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EROMvm9onlQ1pv6K+o0p8csnLRDwiei6BOviFGwrA7g=;
	b=N6rGNIhNKxdXp806QI0zAk4xPAhf+SEyit3RuVKUnJWTuttnyMc/XWf4ndMQI1e25mB6Xy
	w3n2Udc44IREotKfsObWytw9LP2JWoTa4JrdA/fpK10/bGM/9SF10Ddg58EgDLKASTNZpE
	j0pdgUmJ6VEPjp3jycWUfmlpohhWukw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1663157318;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EROMvm9onlQ1pv6K+o0p8csnLRDwiei6BOviFGwrA7g=;
	b=vzhve7Qqk2E+FT99nQbYNPPECnhq+NbJpp9DLURo5qsFj7GVE1Y4WsygcjY8gIQs5BDi35
	c3wm4mBhowD40ADw==
Received: from wotan.suse.de (wotan.suse.de [10.160.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id E0D6F2C141;
	Wed, 14 Sep 2022 12:08:37 +0000 (UTC)
Received: by wotan.suse.de (Postfix, from userid 10510)
	id B964D62AF; Wed, 14 Sep 2022 12:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by wotan.suse.de (Postfix) with ESMTP id B7682628B;
	Wed, 14 Sep 2022 12:08:37 +0000 (UTC)
Date: Wed, 14 Sep 2022 12:08:37 +0000 (UTC)
From: Michael Matz <matz@suse.de>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [RFC] Objtool toolchain proposal:
 -fannotate-{jump-table,noreturn}
In-Reply-To: <20220914102100.thl5ad35plvazark@treble>
Message-ID: <alpine.LSU.2.20.2209141201400.8265@wotan.suse.de>
References: <20220909180704.jwwed4zhwvin7uyi@treble> <20220912113114.GV25951@gate.crashing.org> <20220914102100.thl5ad35plvazark@treble>
User-Agent: Alpine 2.20 (LSU 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, linux-toolchains@vger.kernel.org, Indu Bhagat <indu.bhagat@oracle.com>, live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, "Jose E. Marchesi" <jemarch@gnu.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Wed, 14 Sep 2022, Josh Poimboeuf wrote:

> > >    This information is needed because the
> > >    code after the call to such a function is optimized out as
> > >    unreachable and objtool has no way of knowing that.
> > 
> > Since June we (GCC) have -funreachable-traps.  This creates a trap insn
> > wherever control flow would otherwise go into limbo.
> 
> Ah, that's interesting, though I'm not sure if we'd be able to
> distinguish between "call doesn't return" traps and other traps or
> reasons for UD2.

There are two reasons (which will turn out to be the same) for a trap (say 
'UD2' on x86-64) directly after a call insn:
1) "the call shall not have returned"
2) something else jumps to that trap because it was __builtin_unreachable 
   (or equivalent), and the compiler happened to put that ud2 directly 
   after the call.  It could have done that only when the call itself was 
   noreturn:
     cmp $foo, %rax
     jne do_trap
     call noret
    do_trap:
     ud2

So, it's all the same.  If there's an ud2 (or whatever the trap maker is) 
after a call then it was because it's noreturn.

(But, of course this costs (little) code size, unlike the non-alloc 
checker sections)


Ciao,
Michael.
