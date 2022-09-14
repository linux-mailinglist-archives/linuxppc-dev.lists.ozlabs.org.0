Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5155B8A7F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 16:29:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSN4j10r7z3bkk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 00:29:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IMcU+sMz;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3fJIRsri;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=matz@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IMcU+sMz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3fJIRsri;
	dkim-atps=neutral
X-Greylist: delayed 8389 seconds by postgrey-1.36 at boromir; Thu, 15 Sep 2022 00:28:32 AEST
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSN404Bxrz2xy4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 00:28:31 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 884331FAC1;
	Wed, 14 Sep 2022 14:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1663165707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rNlI3zlemkHtad6UJYVAQefl5OerSoDA86fMBi08vO4=;
	b=IMcU+sMzPrtf2swXGKoltws1DQ4PgrmVnuO6T/Q8delDYm0q8pNrJpq1MOP7xd6pZAf/Jb
	Fj9kKS+pmhqrUq9gHQbLKe9xjwQzs0XXFM41HygdB74Nb7ZvF9w5/0sBD/TJQ6ijUhNld2
	ovmAUy7zEQzNfJwAOOA+Lerl2Xz07qg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1663165707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rNlI3zlemkHtad6UJYVAQefl5OerSoDA86fMBi08vO4=;
	b=3fJIRsrioi8AmmHGURizF9ChVKr3QoUbkZwIJ7IgJ5my1PvR3SHrnTkZipLA9y0w31fOb6
	QBhZcoLjuWM9F4Bw==
Received: from wotan.suse.de (wotan.suse.de [10.160.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 0A94B2C141;
	Wed, 14 Sep 2022 14:28:27 +0000 (UTC)
Received: by wotan.suse.de (Postfix, from userid 10510)
	id EFA0E62AF; Wed, 14 Sep 2022 14:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by wotan.suse.de (Postfix) with ESMTP id EDC3C62AE;
	Wed, 14 Sep 2022 14:28:26 +0000 (UTC)
Date: Wed, 14 Sep 2022 14:28:26 +0000 (UTC)
From: Michael Matz <matz@suse.de>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC] Objtool toolchain proposal:
 -fannotate-{jump-table,noreturn}
In-Reply-To: <YyHecBM8D0i1lRu8@hirez.programming.kicks-ass.net>
Message-ID: <alpine.LSU.2.20.2209141415340.8265@wotan.suse.de>
References: <20220909180704.jwwed4zhwvin7uyi@treble> <Yx8PcldkdOLN8eaw@nazgul.tnic> <alpine.LSU.2.20.2209121200120.8265@wotan.suse.de> <20220914000416.daxbgccbxwpknn2q@treble> <YyHecBM8D0i1lRu8@hirez.programming.kicks-ass.net>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Chen Zhongjin <chenzhongjin@huawei.com>, x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, linux-toolchains@vger.kernel.org, Indu Bhagat <indu.bhagat@oracle.com>, live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org, "Jose E. Marchesi" <jemarch@gnu.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Wed, 14 Sep 2022, Peter Zijlstra wrote:

> > Maybe this is semantics, but I wouldn't characterize objtool's existence
> > as being based on the mistrust of tools.  It's main motivation is to
> > fill in the toolchain's blind spots in asm and inline-asm, which exist
> > by design.
> 
> That and a fairly deep seated loathing for the regular CFI annotations
> and DWARF in general. Linus was fairly firm he didn't want anything to
> do with DWARF for in-kernel unwinding.

I was referring only to the check-stuff functionality of objtool, not to 
its other parts.  Altough, of course, "deep seated loathing" is a special 
form of mistrust as well ;-)

> That left us in a spot that we needed unwind information in a 'better'
> format than DWARF.
> 
> Objtool was born out of those contraints. ORC not needing the CFI
> annotations and ORC being *much* faster at unwiding and generation
> (debug builds are slow) were all good.

Don't mix DWARF debug info with DWARF-based unwinding info, the latter 
doesn't imply the former.  Out of interest: how does ORC get around the 
need for CFI annotations (or equivalents to restore registers) and what 
makes it fast?  I want faster unwinding for DWARF as well, when there's 
feature parity :-)  Maybe something can be learned for integration into 
dwarf-unwind.


Ciao,
Michael.
