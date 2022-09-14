Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E8B5B7DD5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 02:16:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MS1993XbMz3bvd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 10:16:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uAebFXGP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uAebFXGP;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MS18Z3R7qz2xmr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 10:16:14 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8FCDFB81197;
	Wed, 14 Sep 2022 00:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7B1C433C1;
	Wed, 14 Sep 2022 00:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663114567;
	bh=i5TCC7WtvWt2OoQKBQRRIqibY1WStajucQRycGByNsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uAebFXGP39O7QxUYL60jI5js/29Ycd5r03WLzkX4f2VlfOHVJqG1jAeGcnK4FJyBF
	 cO40DMe5y4BuxWXzb7JeoVkgtADnn0XYqS1hxJucOyFfm/iXPE2iSRMTzZPXmrUfZS
	 lrqBeoRLc1ygIdOANgEnww5kQLkJ5foumjyL1sWpITd+qKbj0Uz82P350KzizCGgz6
	 uDjbREwADetOiZzbdAYHEsrQkPamRNbxV4aW5gkVAVlXTYZ6KuY6obDs2U1ECazAMV
	 knGKmectix3ZBbrdLCuz/y3GS/JARgZ6XvJ2rr/7EYuaEQ/ThUpd8zrktMRXC1izH/
	 CCQshx2ChJG+A==
Date: Wed, 14 Sep 2022 01:15:52 +0100
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 00/16] objtool: Enable and implement --mcount option
 on powerpc
Message-ID: <20220914001552.6nerqcbrqy7burda@treble>
References: <20220912082020.226755-1-sv@linux.ibm.com>
 <YyCQIMHXP9DdvCzo@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YyCQIMHXP9DdvCzo@hirez.programming.kicks-ass.net>
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, mingo@redhat.com, Sathvika Vasireddy <sv@linux.ibm.com>, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 13, 2022 at 04:13:52PM +0200, Peter Zijlstra wrote:
> On Mon, Sep 12, 2022 at 01:50:04PM +0530, Sathvika Vasireddy wrote:
> > Christophe Leroy (4):
> >   objtool: Fix SEGFAULT
> >   objtool: Use target file endianness instead of a compiled constant
> >   objtool: Use target file class size instead of a compiled constant
> 
> > Sathvika Vasireddy (12):
> >   objtool: Add --mnop as an option to --mcount
> >   objtool: Read special sections with alts only when specific options are selected
> >   objtool: Use macros to define arch specific reloc types
> >   objtool: Add arch specific function arch_ftrace_match()
> >   objtool/powerpc: Enable objtool to be built on ppc
> >   objtool/powerpc: Add --mcount specific implementation
> 
> >  tools/objtool/arch/powerpc/Build              |   2 +
> >  tools/objtool/arch/powerpc/decode.c           | 101 ++++++++++++++++++
> >  .../arch/powerpc/include/arch/cfi_regs.h      |  11 ++
> >  tools/objtool/arch/powerpc/include/arch/elf.h |  10 ++
> >  .../arch/powerpc/include/arch/special.h       |  21 ++++
> >  tools/objtool/arch/powerpc/special.c          |  19 ++++
> >  tools/objtool/arch/x86/decode.c               |   5 +
> >  tools/objtool/arch/x86/include/arch/elf.h     |   2 +
> >  .../arch/x86/include/arch/endianness.h        |   9 --
> >  tools/objtool/builtin-check.c                 |  14 +++
> >  tools/objtool/check.c                         |  53 ++++-----
> >  tools/objtool/elf.c                           |   8 +-
> >  tools/objtool/include/objtool/arch.h          |   2 +
> >  tools/objtool/include/objtool/builtin.h       |   1 +
> >  tools/objtool/include/objtool/elf.h           |   8 ++
> >  tools/objtool/include/objtool/endianness.h    |  32 +++---
> >  tools/objtool/orc_dump.c                      |  11 +-
> >  tools/objtool/orc_gen.c                       |   4 +-
> >  tools/objtool/special.c                       |   3 +-
> 
> This seems to painlessly merge with the objtool changes I have in
> queue.git/call-depth-tracking. After that all I need is the below little
> patch to make it to build ppc44x_defconfig + CONFIG_DYNAMIC_FTRACE=y.
> 
> So I think these patches can go through the powerpc tree if Michael
> wants. Josh you okay with that, or should we do something complicated?

I'm all for avoiding complicated, but let me try to give it a proper
review first.

-- 
Josh
