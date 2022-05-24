Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D175331E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:51:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L74b71YYpz3bld
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 05:51:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pYXr5RXc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=pYXr5RXc; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L74ZP6KLlz3bf9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 05:51:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=fFUeIa3PlR6824TWaW8sjCJxadZnZFSVitjO7pF+RXo=; b=pYXr5RXcCs/bj9+ufsnVTxopSQ
 VS5h0VzNjOygCk/qo/47qN7XGFRDNjB0UuRF9lM8k3paTEI+aL9cOWnu5+mvuy0SDvs7iXjknyvQS
 fR3omssEDbqYU6mtdrnwhFaBcuMdmrXVaQlp84QHrxkrwqf8B6Jv80A5/yHaLx5VDbjeuEzOdOTuy
 pu7KXg1O9CHDIackf5BCB1beGxUz8C4H4Co5ikDOCJ/W9fLMgWc6iZy+oMwbvmxAhj5JcnRAujDmV
 YX4NhQ/YaGBixWMvHqplqbMQFU2uY2p8r4KSAuu86NB1nIOxIavv9g7CcARCSMTwnNKcVAnHJ5eDE
 zPWndPJw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntaYL-001QNm-MM; Tue, 24 May 2022 19:50:50 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9C36E3002AF;
 Tue, 24 May 2022 21:50:46 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 88742207A452E; Tue, 24 May 2022 21:50:46 +0200 (CEST)
Date: Tue, 24 May 2022 21:50:46 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v2 5/7] objtool: Enable objtool to run only on files
 with ftrace enabled
Message-ID: <Yo03Flwa1s+o6wda@hirez.programming.kicks-ass.net>
References: <cover.1653398233.git.christophe.leroy@csgroup.eu>
 <cf3013dfad89ad5ac7d16d56dced72d7c138a20e.1653398233.git.christophe.leroy@csgroup.eu>
 <Yo0dgyqAOuwU6gHq@hirez.programming.kicks-ass.net>
 <Yo0dpDuK3ilphNAA@hirez.programming.kicks-ass.net>
 <5cb959a2-7e88-5aff-2f8e-be8fdecd002c@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cb959a2-7e88-5aff-2f8e-be8fdecd002c@csgroup.eu>
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "sv@linux.ibm.com" <sv@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "mbenes@suse.cz" <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 24, 2022 at 06:59:50PM +0000, Christophe Leroy wrote:
> 
> 
> Le 24/05/2022 à 20:02, Peter Zijlstra a écrit :
> > On Tue, May 24, 2022 at 08:01:39PM +0200, Peter Zijlstra wrote:
> >> On Tue, May 24, 2022 at 03:17:45PM +0200, Christophe Leroy wrote:
> >>> From: Sathvika Vasireddy <sv@linux.ibm.com>
> >>>
> >>> This patch makes sure objtool runs only on the object files
> >>> that have ftrace enabled, instead of running on all the object
> >>> files.
> >>>
> >>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> >>> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> >>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >>> ---
> >>>   scripts/Makefile.build | 4 ++--
> >>>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> >>> index 2e0c3f9c1459..06ceffd92921 100644
> >>> --- a/scripts/Makefile.build
> >>> +++ b/scripts/Makefile.build
> >>> @@ -258,8 +258,8 @@ else
> >>>   # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
> >>>   # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
> >>>   
> >>> -$(obj)/%.o: objtool-enabled = $(if $(filter-out y%, \
> >>> -	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n),y)
> >>> +$(obj)/%.o: objtool-enabled = $(and $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n),y),        \
> >>> +        $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),y),y)
> >>
> >> I think this breaks x86, quite a bit of files have ftrace disabled but
> >> very much must run objtool anyway.
> > 
> > Also; since the Changelog gives 0 clue as to what problem it's trying to
> > solve, I can't suggest anything.
> 
> I asked Sathvika on the previous series, see 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220523175548.922671-3-sv@linux.ibm.com/
> 
> He says it is to solve the problem I reported at 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220318105140.43914-4-sv@linux.ibm.com/#2861128

So on x86 we have:

arch/x86/entry/vdso/Makefile:OBJECT_FILES_NON_STANDARD       := y

to kill objtool for the whole of the VDSO. When we run objtool on
vmlinux it isn't a problem, because the VDSO ends up as a data section
through linker scripts.
