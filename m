Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D8C73A016
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 13:50:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=OBGm2ITa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmzFM5Rwxz3bVS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 21:49:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=OBGm2ITa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmzCr0Chyz30K6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 21:48:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=miJaNn7+P/XL83Q10M/HymkNw93h6HnzosH9uq7JfIg=; b=OBGm2ITay2jq+9mnDUjWoS2HvD
	aO5ZS1LmSKxMTiWF7jLTd5qZpNYMPj9xi3VFYKeJMtZxmNeIpUohKspwfEDCBul06BLRCrm9IcbgF
	o+q/qdPrQMQREioNx9gdADKGPXMjUeruxPA04Wk2y1vdduHXq/r/rwMXsgaS771ZxtKeeu9Eu09vI
	javXvQhHVeQN2mPSrzu6wDIkd38oSTE5+AmcbYHYFXSBiwFNJcfzUqmSzlMnXBw62SrQMHCkzmV8j
	U904aqo23o3xQsvw075AHZl0tyUxcwSJjn8WDJ+bfPWCCW9UDC8AqdyB20i6mHuBfo6+8U2wtRFN1
	BOQbCIIg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qCInf-00FZ71-6y; Thu, 22 Jun 2023 11:48:31 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D7DFC300274;
	Thu, 22 Jun 2023 13:48:30 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id C7BE324263360; Thu, 22 Jun 2023 13:48:30 +0200 (CEST)
Date: Thu, 22 Jun 2023 13:48:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 11/14] objtool: Remove too strict constraint in jump
 table search
Message-ID: <20230622114830.GM4253@hirez.programming.kicks-ass.net>
References: <cover.1687430631.git.christophe.leroy@csgroup.eu>
 <4ffd1d04d761033fb4d37d99f6371aa7ce385fce.1687430631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ffd1d04d761033fb4d37d99f6371aa7ce385fce.1687430631.git.christophe.leroy@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 22, 2023 at 12:54:33PM +0200, Christophe Leroy wrote:
> In code there is often a pattern like:
> 
> 	load jump table address
> 	do some test
> 	conditional jump to label1:
> 	do something
> 	unconditional jump to label2:
> label1:
> 	do something else
> 	read jump table
> 	dynamic jump
> label2:
> 	do other job here ....
> 
> find_jump_table() contains a constraint that stops the backsearch
> of the table address loading when a jump is found in-between.
> 
> Remove that constraint.

Josh, happen to remember why this code exists ?

> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  tools/objtool/check.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index b810be087d7c..1911de0e1008 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -2130,13 +2130,6 @@ static struct reloc *find_jump_table(struct objtool_file *file,
>  		if (insn != orig_insn && insn->type == INSN_JUMP_DYNAMIC)
>  			break;
>  
> -		/* allow small jumps within the range */
> -		if (insn->type == INSN_JUMP_UNCONDITIONAL &&
> -		    insn->jump_dest &&
> -		    (insn->jump_dest->offset <= insn->offset ||
> -		     insn->jump_dest->offset > orig_insn->offset))
> -		    break;
> -
>  		table_reloc = arch_find_switch_table(file, insn, is_rel);
>  		if (!table_reloc)
>  			continue;
> -- 
> 2.40.1
> 
