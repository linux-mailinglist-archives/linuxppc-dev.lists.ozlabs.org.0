Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDB51C315B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 04:58:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FnbW2CsmzDqjJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 12:57:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FnXk0jgXzDqFM
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 12:55:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49FnXg3l6Nz9sSc;
 Mon,  4 May 2020 12:55:31 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v7 05/28] powerpc: Change calling convention for
 create_branch() et. al.
Date: Mon, 04 May 2020 12:55:30 +1000
Message-ID: <3153940.x9l3HivV66@townsend>
In-Reply-To: <20200501034220.8982-6-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
 <20200501034220.8982-6-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: npiggin@gmail.com, bala24@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday, 1 May 2020 1:41:57 PM AEST Jordan Niethe wrote:
> create_branch(), create_cond_branch() and translate_branch() return the
> instruction that they create, or return 0 to signal an error. Separate
> these concerns in preparation for an instruction type that is not just
> an unsigned int.  Fill the created instruction to a pointer passed as
> the first parameter to the function and use a non-zero return value to
> signify an error.

We're not adding any new checks for error cases here, but this patch doesn't 
change existing behaviour as far as I can tell and adding checks would be 
difficult (and could introduce other bugs) so would be best done as a separate 
series anyway if required at all.
 
> @@ -403,6 +407,7 @@ static void __init test_trampoline(void)
> 
>  static void __init test_branch_iform(void)
>  {
> +	int err;
>  	unsigned int instr;
>  	unsigned long addr;
> 
> @@ -443,35 +448,35 @@ static void __init test_branch_iform(void)
>  	check(instr_is_branch_to_addr(&instr, addr - 0x2000000));
> 
>  	/* Branch to self, with link */
> -	instr = create_branch(&instr, addr, BRANCH_SET_LINK);
> +	err = create_branch(&instr, &instr, addr, BRANCH_SET_LINK);
>  	check(instr_is_branch_to_addr(&instr, addr));

The pointer alias above initially caught my eye, but it's ok because 
create_branch() doesn't actually dereference the second instance. Arguably the 
argument type could be changed to an unsigned long but then we'd just end up 
with more casts so this is ok to me at least.

Reviewed-by: Alistair Popple <alistair@popple.id.au>



