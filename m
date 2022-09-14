Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1531E5B862E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 12:21:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSGbM16Wxz3c66
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 20:21:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LLIIKfyf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LLIIKfyf;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSGZh3Zbbz2xKX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 20:21:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B6C4AB81979;
	Wed, 14 Sep 2022 10:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A2FC433C1;
	Wed, 14 Sep 2022 10:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663150870;
	bh=DiPQNoNQNG+LQNzk/iOQ5X8mk924KHwwG68nSONOT+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLIIKfyfTOvDZbH9wZaRqn8c0Jveo+TQ6Zt7JqKiPzkEsMLIQ2+OrSOPk+A75ttv9
	 cdYSrFuCTthS8RzN8Fv301CuEb8gxC/23zBONTWkIngBDkRj7kzEKYY+2WLrXUExAx
	 PB05AkMjWJbeZwNBT6PLMz3GsjFf5jQ9L0QBC4fsSAFVVO2vF9bL+DlurkFyPXHYJj
	 ExNEJTXC06DKdUMf1iLprTPmyOLqTvi1MjJX8basjkokHqeUbpyq3d2+r6WAKnnLav
	 k6tHWhkuTxHDL3h18VQp1RJwgEhAOREqBPIheMRG2gg2U6A8bvuQw8pkSRGvyp8jy+
	 LusWJ4Sfx2AIA==
Date: Wed, 14 Sep 2022 11:21:00 +0100
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [RFC] Objtool toolchain proposal:
 -fannotate-{jump-table,noreturn}
Message-ID: <20220914102100.thl5ad35plvazark@treble>
References: <20220909180704.jwwed4zhwvin7uyi@treble>
 <20220912113114.GV25951@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220912113114.GV25951@gate.crashing.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michael Matz <matz@suse.de>, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, linux-toolchains@vger.kernel.org, Indu Bhagat <indu.bhagat@oracle.com>, live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, "Jose E. Marchesi" <jemarch@gnu.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 12, 2022 at 06:31:14AM -0500, Segher Boessenkool wrote:
> Hi!
> 
> On Fri, Sep 09, 2022 at 11:07:04AM -0700, Josh Poimboeuf wrote:
> > 2) Noreturn functions:
> >    
> >    There's no reliable way to determine which functions are designated
> >    by the compiler to be noreturn (either explictly via function
> >    attribute, or implicitly via a static function which is a wrapper
> >    around a noreturn function.)
> 
> Or just a function that does not return for any other reason.
> 
> The compiler makes no difference between functions that have the
> attribute and functions that do not.  There are good reasons to not
> have the attribute on functions that do in fact not return.  The
> not-returningness of the function may be just an implementation
> accident, something you do not want part of the API, so it *should* not
> have that attribute; or you may want the callers to a function to not be
> optimised according to this knowledge (you cannot *prevent* that, the
> compiler can figure it out it other ways, but still) for any other
> reason.

Yes, many static functions that are wrappers around noreturn functions
have this "implicit noreturn" property.  I agree we would need to know
about those functions (or, as Michael suggested, their call sites) as
well.

> >    This information is needed because the
> >    code after the call to such a function is optimized out as
> >    unreachable and objtool has no way of knowing that.
> 
> Since June we (GCC) have -funreachable-traps.  This creates a trap insn
> wherever control flow would otherwise go into limbo.

Ah, that's interesting, though I'm not sure if we'd be able to
distinguish between "call doesn't return" traps and other traps or
reasons for UD2.

-- 
Josh
