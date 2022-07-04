Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 096C756587E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 16:20:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc7JR6x5rz3c0g
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 00:20:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Bt1weozM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Bt1weozM;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc7Hm43drz30DX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 00:20:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jc10IQJyl7R9z2Pi3/7y2+bfFKI3NYUFP6i+uQTAp2Y=; b=Bt1weozMWS50R4n+lfqxMxazHF
	TveNDLTmiJEHKNHvQREVGPIKfrQGk3q9doqq/ABlctXEH2yoTOZr4BVCQ86p+X6CoJLJIhig2O5iZ
	OeOaV1ZastaIdZ+ZIAKQji7p1zTeulZ35laz2ctdBLRr/zVAfIbZWSNQUarTzPe5y+SZC1yYTqW73
	0ORHHqoORwfPsQ1r28ZMFDDIQxxpsec0odV3wyLtsOF7/DViK/0wpzxfxhnmnO4bdGVDc1T9u8E0Y
	zN4W2azWNbDIpI4ERMla+djJ3+o1Il+7ALvE/YlMp9zKcFeoD+MRSCuL2hdE4REvqBjXRWhJYou7H
	RcCHYwLw==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=worktop.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8MvM-00H9iI-Rf; Mon, 04 Jul 2022 14:19:41 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0FDEF980057; Mon,  4 Jul 2022 16:19:43 +0200 (CEST)
Date: Mon, 4 Jul 2022 16:19:42 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from WARN_ON()
Message-ID: <YsL2/uwU6j8jbzpP@worktop.programming.kicks-ass.net>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-12-sv@linux.ibm.com>
 <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
 <YsLXkCMtQpxmDhVM@hirez.programming.kicks-ass.net>
 <1d0c5ebc-3f66-f6cb-998f-072bceb41c5c@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d0c5ebc-3f66-f6cb-998f-072bceb41c5c@csgroup.eu>
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "mingo@redhat.com" <mingo@redhat.com>, Sathvika Vasireddy <sv@linux.ibm.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 04, 2022 at 12:44:30PM +0000, Christophe Leroy wrote:
> 
> 
> Le 04/07/2022 à 14:05, Peter Zijlstra a écrit :
> > On Sat, Jun 25, 2022 at 06:46:54AM +0000, Christophe Leroy wrote:
> >>
> >>
> >> Le 24/06/2022 à 20:32, Sathvika Vasireddy a écrit :
> >>> objtool is throwing *unannotated intra-function call*
> >>> warnings with a few instructions that are marked
> >>> unreachable. Remove unreachable() from WARN_ON()
> >>> to fix these warnings, as the codegen remains same
> >>> with and without unreachable() in WARN_ON().
> >>
> >> Did you try the two exemples described in commit 1e688dd2a3d6
> >> ("powerpc/bug: Provide better flexibility to WARN_ON/__WARN_FLAGS() with
> >> asm goto") ?
> >>
> >> Without your patch:
> >>
> >> 00000640 <test>:
> >>    640:	81 23 00 84 	lwz     r9,132(r3)
> >>    644:	71 29 40 00 	andi.   r9,r9,16384
> >>    648:	40 82 00 0c 	bne     654 <test+0x14>
> >>    64c:	80 63 00 0c 	lwz     r3,12(r3)
> >>    650:	4e 80 00 20 	blr
> >>    654:	0f e0 00 00 	twui    r0,0
> >>
> >> 00000658 <test9w>:
> >>    658:	2c 04 00 00 	cmpwi   r4,0
> >>    65c:	41 82 00 0c 	beq     668 <test9w+0x10>
> >>    660:	7c 63 23 96 	divwu   r3,r3,r4
> >>    664:	4e 80 00 20 	blr
> >>    668:	0f e0 00 00 	twui    r0,0
> >>    66c:	38 60 00 00 	li      r3,0
> >>    670:	4e 80 00 20 	blr
> > 
> > Per this construct you should do as x86 does and assume twui terminates
> > control flow and explicitly annotate the WARN case. That is, given the
> > fact that BUG as no instructions following it, you can't very well
> > annotate that.
> 
> That exactly the problem I guess. I'm fine with replacing the 
> unreachable() by __builtin_unreachable() with our __WARN_FLAGS() and 
> BUG() but we will still have a problem with some of the unrachable() 
> that are in core parts of the kernel.
> 
> Even the ones in arch/powerpc/, they are valid and should remain. The 
> point seems that the generic annotate_unreachable() is wrong for powerpc 
> as is, and activating CONFIG_OBJTOOL lead to bad code generation.

Right; I'm not against making that depend on yet-another OBJTOOL_$config
thing.

> By the way, for which functionnalities of objtool is that analysis 
> necessary ? I understand it is not necessary to mcount accounting, so 
> maybe the not empty annotate_unreachable() should be limited to those 
> those functionnalities ?

For all the things where it needs to follow control flow, so stack
validation, ORC generation, unreachable instruction validation etc..

I'd need to double check code-gen on x86, but the way
__builtin_unreachable() makes code-gen stop dead, I'm not entirely sure
it's right for us either.

> > Alternatively, you can teach objtool to look at __bug_table to
> > distinguish these cases.
> 
> Isn't it enough to tell objtool that execution never go past twui, using 
> INSN_BUG ?

That should work I suppose.

> By the way, for __WARN_FLAGS, we use the __extable for the continuation. 
> Is objtools able to follow __extable ?

Yes.
