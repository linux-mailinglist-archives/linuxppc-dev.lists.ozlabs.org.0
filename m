Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9FD7333DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 16:44:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=LaKMDQQb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjMPx6brvz3bVf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 00:44:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjMNx1GVCz3bVP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 00:44:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3Rpo3Qrh1P0e60oXjGYAsbC0oxcG5ErnolcmsNGypPI=; b=LaKMDQQbWuL972NkWJq2jkoAm1
	bE5y26fhj3zZ+y9rmbh/7JV1a5I+6/6egEOvXM1iFCJaKou4QvRffYlRVCPr5nUrP1O4Nw17BP2bn
	1BmQp0XYiXKgfhYhvHhT/9GrqY75mInOZuyycir1NwZQFqkTRMt6RIIgKk2GjYlXTWcvvQgIt1Pq0
	NNVlieQrqkkzhGD2m1Kcgy5NPh8yV4T7yc/yQtYRguS7tFUkk7JBqT2vCFYUnU65P+/HneZ6xNjpg
	psEpKtckF81Z/YGrI9i4jSWqihI18mucRavWqICJUKDxVSDcfsL/YLiOha3rq2ITV6qmcLULbXfvY
	e1ezIavw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qAAfr-0095XF-Cn; Fri, 16 Jun 2023 14:43:39 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 41500300208;
	Fri, 16 Jun 2023 16:43:37 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2366D2135D73E; Fri, 16 Jun 2023 16:43:37 +0200 (CEST)
Date: Fri, 16 Jun 2023 16:43:37 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v1 3/3] powerpc: WIP draft support to objtool check
Message-ID: <20230616144337.GQ83892@hirez.programming.kicks-ass.net>
References: <cover.1686922583.git.christophe.leroy@csgroup.eu>
 <8fbf16dd6a89e1b5b05244bd5e0746410674829e.1686922583.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fbf16dd6a89e1b5b05244bd5e0746410674829e.1686922583.git.christophe.leroy@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Few comments..

On Fri, Jun 16, 2023 at 03:47:52PM +0200, Christophe Leroy wrote:

> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 0fcf99c91400..f945fe271706 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -236,6 +236,7 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
>  		"x86_64_start_reservations",
>  		"xen_cpu_bringup_again",
>  		"xen_start_kernel",
> +		"longjmp",
>  	};
>  
>  	if (!func)
> @@ -2060,13 +2061,12 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
>  	 * instruction.
>  	 */
>  	list_for_each_entry_from(reloc, &table->sec->reloc_list, list) {
> -
>  		/* Check for the end of the table: */
>  		if (reloc != table && reloc->jump_table_start)
>  			break;
>  
>  		/* Make sure the table entries are consecutive: */
> -		if (prev_offset && reloc->offset != prev_offset + 8)
> +		if (prev_offset && reloc->offset != prev_offset + 4)

Do we want a global variable (from elf.c) called elf_sizeof_long or so?

>  			break;
>  
>  		/* Detect function pointers from contiguous objects: */
> @@ -2074,7 +2074,10 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
>  		    reloc->addend == pfunc->offset)
>  			break;
>  
> -		dest_insn = find_insn(file, reloc->sym->sec, reloc->addend);
> +		if (table->jump_table_is_rel)
> +			dest_insn = find_insn(file, reloc->sym->sec, reloc->addend + table->offset - reloc->offset);
> +		else
> +			dest_insn = find_insn(file, reloc->sym->sec, reloc->addend);

		offset = reloc->addend;
		if (table->jump_table_is_rel)
			offset += table->offset - reloc->offset;
		dest_insn = find_insn(file, reloc->sym->sec, offset);

perhaps?

>  		if (!dest_insn)
>  			break;
>  
> @@ -4024,6 +4022,11 @@ static bool ignore_unreachable_insn(struct objtool_file *file, struct instructio
>  	if (insn->ignore || insn->type == INSN_NOP || insn->type == INSN_TRAP)
>  		return true;
>  
> +	/* powerpc relocatable files have a word in front of each relocatable function */
> +	if ((file->elf->ehdr.e_machine == EM_PPC || file->elf->ehdr.e_machine == EM_PPC64) &&
> +	    (file->elf->ehdr.e_flags & EF_PPC_RELOCATABLE_LIB) &&
> +	    insn_func(next_insn_same_sec(file, insn)))
> +		return true;

Can't you simply decode that word to INSN_NOP or so?
