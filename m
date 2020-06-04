Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 063471EE856
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 18:12:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49d9ll0rMPzDqsC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 02:12:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=nw/1Groc; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49d9jf2VKtzDqq7
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 02:10:30 +1000 (AEST)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3C1CA20738;
 Thu,  4 Jun 2020 16:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591287027;
 bh=0xmK7trSvCLIVSPDo+pXJAAicS42nP1V3Qi4wuKk5Qk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nw/1GrocGPE0GznF1zC3U0ogIwPCKs9DWk9Lc+DYjoRtVRPOX9TQ2jaxpJQKRDDwc
 JJ+PXKmpftVKhaxobhlE2k3dWm8TmCbU/ZOkbjf5YXY5w78w+zaobynIBRchsjQAuB
 9njWGL+bdNgxaOZyCgCTgbYQus9uy4JyXZ8cBOQk=
Date: Thu, 4 Jun 2020 17:10:22 +0100
From: Will Deacon <will@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: linux-next: build failure on powerpc 8xx with 16k pages
Message-ID: <20200604161022.GD3650@willie-the-truck>
References: <dc2b16e1-b719-5500-508d-ae97bf50c4a6@csgroup.eu>
 <20200604111723.GA1267@willie-the-truck>
 <20200604120007.GA4117@hirez.programming.kicks-ass.net>
 <1160ea76-729b-60a2-31d6-998c57b77858@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1160ea76-729b-60a2-31d6-998c57b77858@csgroup.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, arnd@arndb.de,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+Arnd since I think we spoke about this on IRC once]

On Thu, Jun 04, 2020 at 02:35:14PM +0000, Christophe Leroy wrote:
> Now I get the same issue at
> 
>    CC      mm/mincore.o
> In file included from ./include/asm-generic/bug.h:5:0,
>                  from ./arch/powerpc/include/asm/bug.h:109,
>                  from ./include/linux/bug.h:5,
>                  from ./include/linux/mmdebug.h:5,
>                  from ./include/linux/mm.h:9,
>                  from ./include/linux/pagemap.h:8,
>                  from mm/mincore.c:11:
> In function 'huge_ptep_get',
>     inlined from 'mincore_hugetlb' at mm/mincore.c:35:20:
> ./include/linux/compiler.h:392:38: error: call to '__compiletime_assert_218'
> declared with attribute error: Unsupported access size for
> {READ,WRITE}_ONCE().
>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                       ^
> ./include/linux/compiler.h:373:4: note: in definition of macro
> '__compiletime_assert'
>     prefix ## suffix();    \
>     ^
> ./include/linux/compiler.h:392:2: note: in expansion of macro
> '_compiletime_assert'
>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>   ^
> ./include/linux/compiler.h:405:2: note: in expansion of macro
> 'compiletime_assert'
>   compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
>   ^
> ./include/linux/compiler.h:291:2: note: in expansion of macro
> 'compiletime_assert_rwonce_type'
>   compiletime_assert_rwonce_type(x);    \
>   ^
> ./include/asm-generic/hugetlb.h:125:9: note: in expansion of macro
> 'READ_ONCE'
>   return READ_ONCE(*ptep);
>          ^
> make[2]: *** [mm/mincore.o] Error 1
> 
> I guess for this one I have to implement platform specific huge_ptep_get()

Yeah, or bite the bullet and introduce proper accessors for all these
things:

	pte_read()
	pmd_read()
	pud_read()
	etc

with the default implementation pointing at READ_ONCE(), but allowing an
architecture override. It's a big job because mm/ would need repainting,
but it would have the benefit of being able to remove aggregate types from
READ_ONCE() entirely and using a special accessor just for the page-table
types.

That might also mean that we could have asm-generic versions of things
like ptep_get_and_clear() that work for architectures with hardware
update and need atomic rmw. But I'm getting ahead of myself.

Will
