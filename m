Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 446C92D39E0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 05:47:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrPg33jFHzDqnV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 15:47:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrPbY3hgtzDqjY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 15:44:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PlVCAeMh; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CrPbV2x6Zz9sWL;
 Wed,  9 Dec 2020 15:44:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607489078;
 bh=KZ5wgpAwKiYgJzOPspqhqBP0PP7NjKGB38+vQR6Jig0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PlVCAeMh/RycrGV8mp4Iyl0iSEjrcAbVXERIan3iGmed1cXLHg63sSOUhoT4rsYFt
 O7bFKxlRsLDQFLNGTxk/sQllwvTvCUhTIrjwPgFaiA3x/3bHKMNZxRHnfg1yh81kP0
 GOmJdJ4ypiy4toslx5oJBqNnNa/rcm4EW+1q1OK9XJG2p7dBr+0NXuxe+rZMcsofyp
 bzC1lOSWALJzrCu5k5BsbJBm3qXvoQca3byDNHO5HqHc0Q/+j10NDktlmjWyHGHXbv
 g8QYV0ptd6or9kPK+7lPPqddeP+qx+ddjPxQYglcMmwDUttorPjt7VNhgeyJY8PEEs
 qzYcHg8pZv3Ug==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build warning after merge of the akpm tree
In-Reply-To: <20201208230157.42c42789@canb.auug.org.au>
References: <20201204210000.660293c6@canb.auug.org.au>
 <20201208230157.42c42789@canb.auug.org.au>
Date: Wed, 09 Dec 2020 15:44:35 +1100
Message-ID: <87r1nzsi4s.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Kees Cook <keescook@chromium.org>, Mathieu Malaterre <malat@debian.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Stephen,
>
> On Fri, 4 Dec 2020 21:00:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi all,
>> 
>> After merging the akpm tree, today's linux-next build (powerpc
>> allyesconfig) produced warnings like this:
>> 
>> ld: warning: orphan section `.data..Lubsan_data177' from `arch/powerpc/oprofile/op_model_pa6t.o' being placed in section `.data..Lubsan_data177'
>> 
>> (lots of these latter ones)
>
> 781584 of them today!
>
>> I don't know what produced these, but it is in the akpm-current or
>> akpm trees.
>
> Presumably the result of commit
>
>   186c3e18dba3 ("ubsan: enable for all*config builds")
>
> from the akpm-current tree.
>
> arch/powerpc/kernel/vmlinux.lds.S has:
>
> #ifdef CONFIG_PPC32
>         .data : AT(ADDR(.data) - LOAD_OFFSET) {
>                 DATA_DATA
> #ifdef CONFIG_UBSAN
>                 *(.data..Lubsan_data*)
>                 *(.data..Lubsan_type*)
> #endif
>                 *(.data.rel*)
>                 *(SDATA_MAIN)
>
> added by commit
>
>   beba24ac5913 ("powerpc/32: Add .data..Lubsan_data*/.data..Lubsan_type* sections explicitly")
>
> in 2018, but no equivalent for 64 bit.

They should really be in DATA_DATA or similar shouldn't they?

cheers
