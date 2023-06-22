Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03874739FFA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 13:46:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=H7eu7PC+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qmz8k6lJSz30P2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 21:45:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qmz7j1r9xz2yyg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 21:45:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SymJEPzxOntUq4SC4sJskmBwvT6BPbdAgd+6pfYGU3o=; b=H7eu7PC+LZCqk4fNSJhv/kl69W
	8U6V8As6KOBmKg2kD5ex4wFGKKWnPtRo803Fx+Yf30QGwCRgBfeRiL4qzw4TRbjnTosdQIuejaCFC
	1iNTa3iMcZ2uXF769jUGLi5kNQ6tf1IksNX3/LkdMVB2B38p9cxSxNN+whLaC5IT/fLoRQn1AL1dl
	Ns4tSlKDPsD86UjDMQ/JUNmvXBElj6Qr0AnuV/qkfgz5h7fAlt7/JZqDz8vNsx3OAo1nM3RR+EpB9
	4JEhwDORlVc53v42mVogMtwbIU9Djps5h8LL6LxUHa3abkTEfEtYPFaGZzPL/xS3fNbxOwLR/R64p
	pk98TjzQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qCIk1-00FYgJ-0p; Thu, 22 Jun 2023 11:44:45 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3B293300274;
	Thu, 22 Jun 2023 13:44:43 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1F39524263361; Thu, 22 Jun 2023 13:44:43 +0200 (CEST)
Date: Thu, 22 Jun 2023 13:44:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 08/14] objtool: Fix JUMP_ENTRY_SIZE for bi-arch like
 powerpc
Message-ID: <20230622114443.GJ4253@hirez.programming.kicks-ass.net>
References: <cover.1687430631.git.christophe.leroy@csgroup.eu>
 <85a0e5fde0c36219332a74871ef4699008ec7edb.1687430631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85a0e5fde0c36219332a74871ef4699008ec7edb.1687430631.git.christophe.leroy@csgroup.eu>
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

On Thu, Jun 22, 2023 at 12:54:30PM +0200, Christophe Leroy wrote:
> 	struct jump_entry {
> 		s32 code;
> 		s32 target;
> 		long key;
> 	};
> 
> It means that the size of the third argument depends on
> whether we are building a 32 bits or 64 bits kernel.
> 
> Therefore JUMP_ENTRY_SIZE must depend on elf_class_addrsize(elf).
> 
> To allow that, entries[] table must be initialised at runtime. This is
> easily done by moving it into its only user which is special_get_alts().
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

However, it doesn't apply to tip/objtool/core because Josh went and
renamed a bunch of things including elf_class_addrsize(). It's now
elf_addr_siize().

> ---
>  .../arch/powerpc/include/arch/special.h       |  2 +-
>  tools/objtool/special.c                       | 55 +++++++++----------
>  2 files changed, 28 insertions(+), 29 deletions(-)
> 
> diff --git a/tools/objtool/arch/powerpc/include/arch/special.h b/tools/objtool/arch/powerpc/include/arch/special.h
> index ffef9ada7133..ede05633c2e4 100644
> --- a/tools/objtool/arch/powerpc/include/arch/special.h
> +++ b/tools/objtool/arch/powerpc/include/arch/special.h
> @@ -6,7 +6,7 @@
>  #define EX_ORIG_OFFSET 0
>  #define EX_NEW_OFFSET 4
>  
> -#define JUMP_ENTRY_SIZE 16
> +#define JUMP_ENTRY_SIZE (8 + elf_class_addrsize(elf)) /* 12 on PPC32, 16 on PPC64 */
>  #define JUMP_ORIG_OFFSET 0
>  #define JUMP_NEW_OFFSET 4
>  #define JUMP_KEY_OFFSET 8
> diff --git a/tools/objtool/special.c b/tools/objtool/special.c
> index baa85c31526b..4015c1cd0fe1 100644
> --- a/tools/objtool/special.c
> +++ b/tools/objtool/special.c
> @@ -26,34 +26,6 @@ struct special_entry {
>  	unsigned char key; /* jump_label key */
>  };
>  
> -static const struct special_entry entries[] = {
> -	{
> -		.sec = ".altinstructions",
> -		.group = true,
> -		.size = ALT_ENTRY_SIZE,
> -		.orig = ALT_ORIG_OFFSET,
> -		.orig_len = ALT_ORIG_LEN_OFFSET,
> -		.new = ALT_NEW_OFFSET,
> -		.new_len = ALT_NEW_LEN_OFFSET,
> -		.feature = ALT_FEATURE_OFFSET,
> -	},
> -	{
> -		.sec = "__jump_table",
> -		.jump_or_nop = true,
> -		.size = JUMP_ENTRY_SIZE,
> -		.orig = JUMP_ORIG_OFFSET,
> -		.new = JUMP_NEW_OFFSET,
> -		.key = JUMP_KEY_OFFSET,
> -	},
> -	{
> -		.sec = "__ex_table",
> -		.size = EX_ENTRY_SIZE,
> -		.orig = EX_ORIG_OFFSET,
> -		.new = EX_NEW_OFFSET,
> -	},
> -	{},
> -};
> -
>  void __weak arch_handle_alternative(unsigned short feature, struct special_alt *alt)
>  {
>  }
> @@ -144,6 +116,33 @@ int special_get_alts(struct elf *elf, struct list_head *alts)
>  	unsigned int nr_entries;
>  	struct special_alt *alt;
>  	int idx, ret;
> +	const struct special_entry entries[] = {
> +		{
> +			.sec = ".altinstructions",
> +			.group = true,
> +			.size = ALT_ENTRY_SIZE,
> +			.orig = ALT_ORIG_OFFSET,
> +			.orig_len = ALT_ORIG_LEN_OFFSET,
> +			.new = ALT_NEW_OFFSET,
> +			.new_len = ALT_NEW_LEN_OFFSET,
> +			.feature = ALT_FEATURE_OFFSET,
> +		},
> +		{
> +			.sec = "__jump_table",
> +			.jump_or_nop = true,
> +			.size = JUMP_ENTRY_SIZE,
> +			.orig = JUMP_ORIG_OFFSET,
> +			.new = JUMP_NEW_OFFSET,
> +			.key = JUMP_KEY_OFFSET,
> +		},
> +		{
> +			.sec = "__ex_table",
> +			.size = EX_ENTRY_SIZE,
> +			.orig = EX_ORIG_OFFSET,
> +			.new = EX_NEW_OFFSET,
> +		},
> +		{},
> +	};
>  
>  	INIT_LIST_HEAD(alts);
>  
> -- 
> 2.40.1
> 
