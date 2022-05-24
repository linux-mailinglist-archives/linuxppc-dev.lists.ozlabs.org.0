Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C51533005
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 20:03:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L729x4z8bz3cDt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 04:03:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Fpqfein5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=Fpqfein5; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L72944Q3gz3cdM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 04:02:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=y1TnWebPhJ1BojdW0cvueZgENLRV8F2gmqpv6bJIuPc=; b=Fpqfein5bh92hXEpVGleAKPEuZ
 yWch4DkG4Dx1jtgWEfvCef0HqeHBC5L1gYIXmDtb4MmCqTATCSYmlGOQ1vI/9OZIR15L1Au0EVlUd
 ijhgcll3q96D6F9krdEPKqSj+AqUY/pb9cdFQtxvs8ea/wtVuJGkfwslMTzxEMk9rEnmk0F98U1J/
 vF0dHBaOyHvK9xQo6W0IjRaskFXRYhd1RklUvQBdk7Vtw4fBl8hzECMNzC+97AAd7399VxIWPhred
 CtW2NtgHjpkUGdNfL/pUADxg8UafiifiLetN+tQ8nEI1j5sKcfiAd2+TsyV6We74E++c+BvbgUBjF
 SL1CJSJA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntYrG-00HIoU-JF; Tue, 24 May 2022 18:02:14 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AFF113002BE;
 Tue, 24 May 2022 20:02:12 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A0E1C201A996B; Tue, 24 May 2022 20:02:12 +0200 (CEST)
Date: Tue, 24 May 2022 20:02:12 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v2 5/7] objtool: Enable objtool to run only on files
 with ftrace enabled
Message-ID: <Yo0dpDuK3ilphNAA@hirez.programming.kicks-ass.net>
References: <cover.1653398233.git.christophe.leroy@csgroup.eu>
 <cf3013dfad89ad5ac7d16d56dced72d7c138a20e.1653398233.git.christophe.leroy@csgroup.eu>
 <Yo0dgyqAOuwU6gHq@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yo0dgyqAOuwU6gHq@hirez.programming.kicks-ass.net>
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
Cc: aik@ozlabs.ru, jpoimboe@redhat.com, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, sv@linux.ibm.com, Paul Mackerras <paulus@samba.org>,
 naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 24, 2022 at 08:01:39PM +0200, Peter Zijlstra wrote:
> On Tue, May 24, 2022 at 03:17:45PM +0200, Christophe Leroy wrote:
> > From: Sathvika Vasireddy <sv@linux.ibm.com>
> > 
> > This patch makes sure objtool runs only on the object files
> > that have ftrace enabled, instead of running on all the object
> > files.
> > 
> > Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> > Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > ---
> >  scripts/Makefile.build | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 2e0c3f9c1459..06ceffd92921 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -258,8 +258,8 @@ else
> >  # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
> >  # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
> >  
> > -$(obj)/%.o: objtool-enabled = $(if $(filter-out y%, \
> > -	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n),y)
> > +$(obj)/%.o: objtool-enabled = $(and $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n),y),        \
> > +        $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),y),y)
> 
> I think this breaks x86, quite a bit of files have ftrace disabled but
> very much must run objtool anyway.

Also; since the Changelog gives 0 clue as to what problem it's trying to
solve, I can't suggest anything.
