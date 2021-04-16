Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F27BC361BA8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 10:42:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM8q56xGdz3bvT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 18:42:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=steven.price@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FM8pn4mlSz2yy9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 18:42:22 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11A64106F;
 Fri, 16 Apr 2021 01:42:20 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43FFA3FA45;
 Fri, 16 Apr 2021 01:42:19 -0700 (PDT)
Subject: Re: [PATCH] mm: ptdump: Fix build failure
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Andrew Morton <akpm@linux-foundation.org>
References: <912b349e2bcaa88939904815ca0af945740c6bd4.1618478922.git.christophe.leroy@csgroup.eu>
From: Steven Price <steven.price@arm.com>
Message-ID: <c6c50422-9566-8667-0ad6-627c51c9b7aa@arm.com>
Date: Fri, 16 Apr 2021 09:42:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <912b349e2bcaa88939904815ca0af945740c6bd4.1618478922.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15/04/2021 10:31, Christophe Leroy wrote:
> 	  CC      mm/ptdump.o
> 	In file included from <command-line>:
> 	mm/ptdump.c: In function 'ptdump_pte_entry':
> 	././include/linux/compiler_types.h:320:38: error: call to '__compiletime_assert_207' declared with attribute error: Unsupported access size for {READ,WRITE}_ONCE().
> 	  320 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> 	      |                                      ^
> 	././include/linux/compiler_types.h:301:4: note: in definition of macro '__compiletime_assert'
> 	  301 |    prefix ## suffix();    \
> 	      |    ^~~~~~
> 	././include/linux/compiler_types.h:320:2: note: in expansion of macro '_compiletime_assert'
> 	  320 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> 	      |  ^~~~~~~~~~~~~~~~~~~
> 	./include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
> 	   36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
> 	      |  ^~~~~~~~~~~~~~~~~~
> 	./include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
> 	   49 |  compiletime_assert_rwonce_type(x);    \
> 	      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 	mm/ptdump.c:114:14: note: in expansion of macro 'READ_ONCE'
> 	  114 |  pte_t val = READ_ONCE(*pte);
> 	      |              ^~~~~~~~~
> 	make[2]: *** [mm/ptdump.o] Error 1
> 
> READ_ONCE() cannot be used for reading PTEs. Use ptep_get()
> instead. See commit 481e980a7c19 ("mm: Allow arches to provide ptep_get()")
> and commit c0e1c8c22beb ("powerpc/8xx: Provide ptep_get() with 16k pages")
> for details.

It was cargo-culted from the arm64/x86 implementations (where this 
happens to be safe).

> Fixes: 30d621f6723b ("mm: add generic ptdump")
> Cc: Steven Price <steven.price@arm.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,

Steve

> ---
>   mm/ptdump.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/ptdump.c b/mm/ptdump.c
> index 4354c1422d57..da751448d0e4 100644
> --- a/mm/ptdump.c
> +++ b/mm/ptdump.c
> @@ -111,7 +111,7 @@ static int ptdump_pte_entry(pte_t *pte, unsigned long addr,
>   			    unsigned long next, struct mm_walk *walk)
>   {
>   	struct ptdump_state *st = walk->private;
> -	pte_t val = READ_ONCE(*pte);
> +	pte_t val = ptep_get(pte);
>   
>   	if (st->effective_prot)
>   		st->effective_prot(st, 4, pte_val(val));
> 

