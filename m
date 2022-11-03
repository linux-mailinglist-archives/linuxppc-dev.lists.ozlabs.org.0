Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D414E617912
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 09:50:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2yBn5Mtdz3cLX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 19:50:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kIRzdGpp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kIRzdGpp;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2y9d0nRdz3cJ7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 19:49:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RkNBU0hMoTYlB2liiWMqN64OIbK7z1nAKBDJNEYxYl8=; b=kIRzdGpp5IiM+w+fgoLf251UIs
	Ww3hqVs5vMpGY8H1WlW6kLu1T9HRaH9Dr1/Kb5i7hTP8gZNWod4xJebC2ZpOBFzk4zCxuKbbh6bcf
	WzIb6eTvtNwlcOhE15rcDxptNYLqlQenlkw9+TfFe6KqyaI9RDwxBcHiyln1cClH6kzRT2jYPtHZZ
	5SOaY1X7Z72tH+8YcywB48rRypL1f9lpfP+R/uJxnA2WxVTYSlUIAcaFpLTCaAnb+J5q6qe1DDJpZ
	bIBqyMVcx5gc1w2hnQ2Q4yyZSOcBKTE+aoPmoOzgeXKOQEANprZCBehgGQ1hWYqF2WWWmw9Ijf2R8
	avXk5oqw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqVuB-008dfK-G1; Thu, 03 Nov 2022 08:48:55 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2FE5A300130;
	Thu,  3 Nov 2022 09:48:53 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0BA4E20AB8864; Thu,  3 Nov 2022 09:48:53 +0100 (CET)
Date: Thu, 3 Nov 2022 09:48:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v5 02/16] powerpc: Override __ALIGN and __ALIGN_STR macros
Message-ID: <Y2OAdHBIGXVnN5Ud@hirez.programming.kicks-ass.net>
References: <20221028143346.183569-1-sv@linux.ibm.com>
 <20221028143346.183569-3-sv@linux.ibm.com>
 <327c371a-a8f4-1676-3da8-f454612b5c58@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <327c371a-a8f4-1676-3da8-f454612b5c58@csgroup.eu>
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

On Wed, Nov 02, 2022 at 12:35:07PM +0000, Christophe Leroy wrote:
> 
> 
> Le 28/10/2022 à 16:33, Sathvika Vasireddy a écrit :
> > In a subsequent patch, we would want to annotate powerpc assembly functions
> > with SYM_FUNC_START_LOCAL macro. This macro depends on __ALIGN macro.
> > 
> > The default expansion of __ALIGN macro is:
> >          #define __ALIGN      .align 4,0x90
> > 
> > So, override __ALIGN and __ALIGN_STR macros to use the same alignment as
> > that of the existing _GLOBAL macro. Also, do not pad with 0x90, because
> > repeated 0x90s are not a nop or trap on powerpc.
> 
> By the way, do we know what the instruction 0x90909090 is on powerpc ? 
> Is that something valid or not ?

Please also look at the version that's in tip/x86/core (and next). This
stuff should be gone now.

include/linux/linkage.h now reads like:

#ifndef __ALIGN
#define __ALIGN                 .balign CONFIG_FUNCTION_ALIGNMENT
#define __ALIGN_STR             __stringify(__ALIGN)
#endif
