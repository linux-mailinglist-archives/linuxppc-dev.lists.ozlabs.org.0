Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F099D56544D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 14:06:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc4K35glmz3f4m
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 22:06:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=JLISIeys;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=JLISIeys;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc4JS5kjZz302N
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 22:05:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kIdu/42GiilHlXUS78N+LpZH4GE+kn27IfgICi3avuI=; b=JLISIeyssHb/kRbwBuaUKrdqYH
	G5DdMBv/BqSqZncpjaTbVoX38L7oDa11sj4yAPxb2R3yr+njxADtoXOt4Uan/9yV4pliVrM0ngTtf
	ojxNY8UJjAf+GKRq949ZvqIGE/kNuoXvZyub3BIGErUkR23tQVqyMOq9eVmcrp0qzQVQEtdRgy5Dk
	8Gvx/WEn2J5yzDXRFUiBj7E8XV2COecDNWybtI9RILDTkFitzC2Mljhth9BvwA4/brUyCf514b1W3
	0gmGaxFLtfix0Uia0G6HszjE0wODeG9AdiaRW6ymEKK8OXE6CQtEMEbLFyAqFqAIk9ZRp4oxkzpJX
	wZRtXUoQ==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Kpd-00HEp3-3O; Mon, 04 Jul 2022 12:05:37 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9C83830033D;
	Mon,  4 Jul 2022 14:05:36 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 85D292028F029; Mon,  4 Jul 2022 14:05:36 +0200 (CEST)
Date: Mon, 4 Jul 2022 14:05:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from WARN_ON()
Message-ID: <YsLXkCMtQpxmDhVM@hirez.programming.kicks-ass.net>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-12-sv@linux.ibm.com>
 <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
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

On Sat, Jun 25, 2022 at 06:46:54AM +0000, Christophe Leroy wrote:
> 
> 
> Le 24/06/2022 à 20:32, Sathvika Vasireddy a écrit :
> > objtool is throwing *unannotated intra-function call*
> > warnings with a few instructions that are marked
> > unreachable. Remove unreachable() from WARN_ON()
> > to fix these warnings, as the codegen remains same
> > with and without unreachable() in WARN_ON().
> 
> Did you try the two exemples described in commit 1e688dd2a3d6 
> ("powerpc/bug: Provide better flexibility to WARN_ON/__WARN_FLAGS() with 
> asm goto") ?
> 
> Without your patch:
> 
> 00000640 <test>:
>   640:	81 23 00 84 	lwz     r9,132(r3)
>   644:	71 29 40 00 	andi.   r9,r9,16384
>   648:	40 82 00 0c 	bne     654 <test+0x14>
>   64c:	80 63 00 0c 	lwz     r3,12(r3)
>   650:	4e 80 00 20 	blr
>   654:	0f e0 00 00 	twui    r0,0
> 
> 00000658 <test9w>:
>   658:	2c 04 00 00 	cmpwi   r4,0
>   65c:	41 82 00 0c 	beq     668 <test9w+0x10>
>   660:	7c 63 23 96 	divwu   r3,r3,r4
>   664:	4e 80 00 20 	blr
>   668:	0f e0 00 00 	twui    r0,0
>   66c:	38 60 00 00 	li      r3,0
>   670:	4e 80 00 20 	blr

Per this construct you should do as x86 does and assume twui terminates
control flow and explicitly annotate the WARN case. That is, given the
fact that BUG as no instructions following it, you can't very well
annotate that.

Alternatively, you can teach objtool to look at __bug_table to
distinguish these cases.
