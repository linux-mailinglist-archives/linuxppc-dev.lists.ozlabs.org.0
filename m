Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7714A73A013
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 13:49:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=f0Zl1wtk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmzDP2c6Qz30hF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 21:49:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=f0Zl1wtk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmzCX3ypnz2xFm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 21:48:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uzialct+MKODD/ixL3G2N89n3pMfncDz7ap9guGmWDs=; b=f0Zl1wtkXjyEeF/DI7zw7Ozkq/
	HzgVP7Xf5G7eJCZzQ3488BpTmAjeAh09Vzgw0Y8fWdJ8wI9fNyQlu+Swp33AQwPTZnN4MHIpZ8Hn8
	XewofOadX/8AQSSRH9lK2psG1i3twCVFJ/76ZswQXT7jsvpsuDIb1QCpIoQckfpkIf0tSUsxGde3x
	yOGBNJJmEkhaObX/5xvTkWZY2gxUv64bqnLw65eW23bclSHePy5hpbg0BkhZpVBMeRdj5uNbfBtMJ
	j9/0peynN/AF0ePfVzU1VlbKnD6+OPRomwuj2F60iO148UY5rlhRYfdko12qv1NoEmV7NOOlfyUC/
	ria/UmpA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qCInM-001ApE-2z;
	Thu, 22 Jun 2023 11:48:15 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 16653300274;
	Thu, 22 Jun 2023 13:48:12 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id E6C3124263360; Thu, 22 Jun 2023 13:48:11 +0200 (CEST)
Date: Thu, 22 Jun 2023 13:48:11 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 10/14] objtool: Add support for relative switch tables
Message-ID: <20230622114811.GL4253@hirez.programming.kicks-ass.net>
References: <cover.1687430631.git.christophe.leroy@csgroup.eu>
 <1d60e0ffe692289fd01485f680e87161bef98760.1687430631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d60e0ffe692289fd01485f680e87161bef98760.1687430631.git.christophe.leroy@csgroup.eu>
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

On Thu, Jun 22, 2023 at 12:54:32PM +0200, Christophe Leroy wrote:
> On powerpc, switch tables are relative, than means the address of the
> table is added to the value of the entry in order to get the pointed
> address: (r10 is the table address, r4 the index in the table)
> 
>       lis     r10,0		<== Load r10 with upper part of .rodata address
>           R_PPC_ADDR16_HA     .rodata
>       addi    r10,r10,0		<== Add lower part of .rodata address
>           R_PPC_ADDR16_LO     .rodata
>       lwzx    r8,r10,r4		<== Read table entry at r10 + r4 into r8
>       add     r10,r8,r10	<== Add table address to read value
>       mtctr   r10		<== Save calculated address in CTR
>       bctr			<== Branch to address in CTR
> 
> But for c_jump_tables it is not the case, they contain the
> pointed address directly:
> 
>       lis     r28,0		<== Load r28 with upper .rodata..c_jump_table
>           R_PPC_ADDR16_HA   .rodata..c_jump_table
>       addi    r28,r28,0		<== Add lower part of .rodata..c_jump_table
>           R_PPC_ADDR16_LO   .rodata..c_jump_table
>       lwzx    r10,r28,r10	<== Read table entry at r10 + r28 into r10
>       mtctr   r10		<== Save read value in CTR
>       bctr			<== Branch to address in CTR
> 
> Add support to objtool for relative tables, with a flag in order to
> tell table by table if that table uses relative or absolute addressing.
> 
> And use correct size for 'long' instead of hard coding a size of '8'.

Again, see tip/objtool/core...

This one is going to be a little hard. It would be very good if you can
avoid growing struct reloc; Josh went through a ton of effort to shrink
it.

Would it work to use reloc->sym->is_rel_jumptable ? That still has a few
spare bits in it's bitfield.

> diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
> index e1ca588eb69d..64aac87a4825 100644
> --- a/tools/objtool/include/objtool/elf.h
> +++ b/tools/objtool/include/objtool/elf.h
> @@ -80,6 +80,7 @@ struct reloc {
>  	s64 addend;
>  	int idx;
>  	bool jump_table_start;
> +	bool jump_table_is_rel;
>  };
