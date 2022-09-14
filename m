Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB955B89AF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 16:01:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSMSv6bRbz3c6n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 00:01:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=grvdlhiD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=grvdlhiD;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSMSC5kx3z2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 00:00:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6QAWxLdMZL2HrdyA2qxKWv8rmsu40qWwB6+Piak/frU=; b=grvdlhiDJot2FEpq+aFmAKpbVL
	618tCmlcl9TPnZnLX8PT4AhesK8/j7mmZuPujaIwSXumYee6m/OP3I9Z8QFflX21DFKDV/1eCyZSO
	1tXouQhREH2V6O6uTrrhCur9gYWzcDGFuM3KczBsBLsHjAH+g6vjLnj4+SbI8pdwWgVG/nIGTDvyD
	DiHFFwPKYeMxg+uODtM74++NkL63AwP3uz/GHM1UJwCvDU+S0s8jHC8bfF+pJP8Ip02ArlO2XX031
	PYJx514ksqOpuNFWFgGMNIp/Q19glVLvHb4u8/vmi0+mnjAgBbMDj0XzSWSfa/KX4gkD96/5qTrfO
	EMxpDi1g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSw9-000EDJ-E2; Wed, 14 Sep 2022 14:00:21 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A70D43002AE;
	Wed, 14 Sep 2022 16:00:16 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8BBF52B8AD401; Wed, 14 Sep 2022 16:00:16 +0200 (CEST)
Date: Wed, 14 Sep 2022 16:00:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [RFC] Objtool toolchain proposal:
 -fannotate-{jump-table,noreturn}
Message-ID: <YyHecBM8D0i1lRu8@hirez.programming.kicks-ass.net>
References: <20220909180704.jwwed4zhwvin7uyi@treble>
 <Yx8PcldkdOLN8eaw@nazgul.tnic>
 <alpine.LSU.2.20.2209121200120.8265@wotan.suse.de>
 <20220914000416.daxbgccbxwpknn2q@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914000416.daxbgccbxwpknn2q@treble>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Chen Zhongjin <chenzhongjin@huawei.com>, Michael Matz <matz@suse.de>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, linux-toolchains@vger.kernel.org, Indu Bhagat <indu.bhagat@oracle.com>, live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, "Jose E. Marchesi" <jemarch@gnu.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 14, 2022 at 01:04:16AM +0100, Josh Poimboeuf wrote:

> > I will mention that objtool's existence is based on mistrust, of persons 
> > (not correctly annotating stuff) and of tools (not correctly heeding those 
> > annotations).  The mistrust in persons is understandable and can be dealt 
> > with by tools, but the mistrust in tools can't be fixed by making tools 
> > more complicated by emitting even more information; there's no good reason 
> > to assume that one piece of info can be trusted more than other pieces.  
> > So, if you mistrust the tools you have already lost.  That's somewhat 
> > philosophical, so I won't beat that horse much more either.
> 
> Maybe this is semantics, but I wouldn't characterize objtool's existence
> as being based on the mistrust of tools.  It's main motivation is to
> fill in the toolchain's blind spots in asm and inline-asm, which exist
> by design.

That and a fairly deep seated loathing for the regular CFI annotations
and DWARF in general. Linus was fairly firm he didn't want anything to
do with DWARF for in-kernel unwinding.

That left us in a spot that we needed unwind information in a 'better'
format than DWARF.

Objtool was born out of those contraints. ORC not needing the CFI
annotations and ORC being *much* faster at unwiding and generation
(debug builds are slow) were all good.


