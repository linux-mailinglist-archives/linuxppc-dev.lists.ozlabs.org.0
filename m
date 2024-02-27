Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3573868594
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 02:10:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FgCAthic;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkKDQ56Z9z3d2S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 12:10:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FgCAthic;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkKCZ6K44z3bc2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 12:10:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=gwiXT85stAdWTOUd6txuILwVivp2eGJBqmUEFcS5o58=; b=FgCAthicwmPNlQ+DMbEELBmK/I
	qUAzdjuLcWA2Bys4HwHthcbpwBzlNPwaS/tovAfOoew9JrEZFYjESxt+zGf8GkFapHxP9/SO/esq9
	bHcF/VwthH48hoKJXxy0LWHTdE9TbOnF3bJGbQkXPrKGnVbI83gQmS7rAZ+UCvS+MTjuKDVqPWq7L
	6H023rd4HQlenEZ+ZGEIPQvCzTnNks64kjPFKDR1Fk3MSf2LLPo/wY2dO1IMuuj+Ffy/jw98te5qy
	uxfagMnu+cQOjpgWnSf3CSb/QQb3G83xIV4aotv3un7jMKOheFwwVwCguDPGSOq/EvcNaNR/DoSr6
	eX/RJ77w==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1relyf-00000003Dq6-1hGA;
	Tue, 27 Feb 2024 01:09:59 +0000
Message-ID: <7624c14e-0f5c-435c-9f6e-3d59b4e27aa2@infradead.org>
Date: Mon, 26 Feb 2024 17:09:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Feb 26 (drivers/mtd/ubi/nvmem.c)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240226175509.37fa57da@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240226175509.37fa57da@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-mtd@lists.infradead.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/25/24 22:55, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20240223:
> 

on powerpc32:

In file included from ./arch/powerpc/include/generated/asm/div64.h:1,
                 from ../include/linux/math.h:6,
                 from ../include/linux/kernel.h:27,
                 from ../arch/powerpc/include/asm/page.h:11,
                 from ../arch/powerpc/include/asm/thread_info.h:13,
                 from ../include/linux/thread_info.h:60,
                 from ../arch/powerpc/include/asm/ptrace.h:342,
                 from ../arch/powerpc/include/asm/hw_irq.h:12,
                 from ../arch/powerpc/include/asm/irqflags.h:12,
                 from ../include/linux/irqflags.h:18,
                 from ../include/asm-generic/cmpxchg-local.h:6,
                 from ../arch/powerpc/include/asm/cmpxchg.h:755,
                 from ../arch/powerpc/include/asm/atomic.h:11,
                 from ../include/linux/atomic.h:7,
                 from ../include/linux/rcupdate.h:25,
                 from ../include/linux/rbtree.h:24,
                 from ../drivers/mtd/ubi/ubi.h:14,
                 from ../drivers/mtd/ubi/nvmem.c:7:
../drivers/mtd/ubi/nvmem.c: In function 'ubi_nvmem_reg_read':
../include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
  222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
      |                                   ^~
../drivers/mtd/ubi/nvmem.c:34:16: note: in expansion of macro 'do_div'
   34 |         offs = do_div(lnum, unv->usable_leb_size);
      |                ^~~~~~
In file included from ../include/linux/build_bug.h:5,
                 from ../include/linux/container_of.h:5,
                 from ../include/linux/list.h:5,
                 from ../drivers/mtd/ubi/ubi.h:13:
../include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
  234 |         } else if (likely(((n) >> 32) == 0)) {          \
      |                                ^~
../include/linux/compiler.h:76:45: note: in definition of macro 'likely'
   76 | # define likely(x)      __builtin_expect(!!(x), 1)
      |                                             ^
../drivers/mtd/ubi/nvmem.c:34:16: note: in expansion of macro 'do_div'
   34 |         offs = do_div(lnum, unv->usable_leb_size);
      |                ^~~~~~
../include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
  238 |                 __rem = __div64_32(&(n), __base);       \
      |                                    ^~~~
      |                                    |
      |                                    int *
../drivers/mtd/ubi/nvmem.c:34:16: note: in expansion of macro 'do_div'
   34 |         offs = do_div(lnum, unv->usable_leb_size);
      |                ^~~~~~
../include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'int *'
  213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
      |                            ~~~~~~~~~~^~~~~~~~




-- 
#Randy
