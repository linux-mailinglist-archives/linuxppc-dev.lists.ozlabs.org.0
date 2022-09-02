Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EE65AAA58
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 10:43:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJrzB09nRz3bZB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 18:43:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lC/XLdh8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lC/XLdh8;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJryZ2NlFz2xn3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 18:42:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kyUq76Ekypnho/k0EISFYQkD5KK5rKzGsuomfL+eaXc=; b=lC/XLdh8VjG1swl38+yATsXvz3
	r6gwmqc2fYBtTbRW1eo85+4AMiO6E6/2aJ6THbpInNUlmeMKt3GhkNVy2uLq0QMz+pkw6c62y+5zs
	4Jgtt20xoA/PrrpZqKIkEr/sTdS1C/DfXr7RioekxoS3gM/c+KxYShn+KBf+CYQVBYyTz6sOSYPKr
	zA/fuz/3o7pf4KQyujptDcXRVlo///hpm7j+x9IpOZfxbdNB6r8/SbI8eOgz/vAODNX2wKEvUhZ/s
	/6tGqbWCZ32XiTaSegBK5VgHc2thAUjL+TvtDwt6McfUTx0ctUU/rJPbw8FyC7SF6HP1XJNbNZHox
	W7X7E9Nw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2Fo-008cnp-OP; Fri, 02 Sep 2022 08:42:21 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DC8003002C7;
	Fri,  2 Sep 2022 10:42:17 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id C62CB2B8A3BCB; Fri,  2 Sep 2022 10:42:17 +0200 (CEST)
Date: Fri, 2 Sep 2022 10:42:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 08/16] objtool: Fix SEGFAULT
Message-ID: <YxHB6VzfXYozAPEA@hirez.programming.kicks-ass.net>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-9-sv@linux.ibm.com>
 <YxEGD0TVWtXTjcGR@hirez.programming.kicks-ass.net>
 <66a3976b-48c1-f8c4-aee0-d04c2c11f5af@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66a3976b-48c1-f8c4-aee0-d04c2c11f5af@csgroup.eu>
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "mingo@redhat.com" <mingo@redhat.com>, Sathvika Vasireddy <sv@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 02, 2022 at 08:06:28AM +0000, Christophe Leroy wrote:
> 
> 
> Le 01/09/2022 à 21:20, Peter Zijlstra a écrit :
> > On Mon, Aug 29, 2022 at 11:22:15AM +0530, Sathvika Vasireddy wrote:
> >> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> >>
> >> find_insn() will return NULL in case of failure. Check insn in order
> >> to avoid a kernel Oops for NULL pointer dereference.
> >>
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> ---
> >>   tools/objtool/check.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> >> index 91678252a9b6..ed2fdfeb1d9c 100644
> >> --- a/tools/objtool/check.c
> >> +++ b/tools/objtool/check.c
> >> @@ -205,7 +205,7 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
> >>   		return false;
> >>   
> >>   	insn = find_insn(file, func->sec, func->offset);
> >> -	if (!insn->func)
> >> +	if (!insn || !insn->func)
> >>   		return false;
> > 
> > I suppose this is ok, but how can the lookup for func->sec, func->offset
> > *not* find an instruction ?!
> 
> That happened to me at the begining when the port to powerpc was not 
> fully functionnal.
> 
> I guess that could also happen with a corrupted object file so better 
> safe than sorry.

Fair enough.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
