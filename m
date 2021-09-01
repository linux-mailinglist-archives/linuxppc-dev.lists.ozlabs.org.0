Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4104B3FD5FC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 10:55:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzyYv0T9qz2yg5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 18:55:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lvjTIAv3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=lvjTIAv3; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzyY92LwLz2xYC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Sep 2021 18:54:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4WVH33cX+rNIZSshZyxMgesf4pVxYNsVlPzUVOR6Rvw=; b=lvjTIAv3jah6lQ33l2ecRpZGog
 uCXV7F4diAduy7500Nz34fdBwPwfbAu5nfNdUm1edeDumLakZyOvms48DqhdEtvQbD0rxesBIBpgq
 i6F498YzeBJR8VkW9bSAnWfXvcr1z5MT91nkjNpzw6wsRlV0rdJ/PFB2sy7j2+YPuUtK+s5C5GdfL
 tVfd0bVnFz3Ail7YpYGOWIA/Ne8niUrqfFTd2Iyln8w7MmGgS3rZ240Z9oN83jeT+PgZTJbpRgIG4
 YCwBXV0UywEWdU7FiX6NdhO5ElBSvtkHR7jCUk0Zh6tw2NDGv5JwULy8tR67CQrccmrcrw9ipt2zu
 tk/d8YnQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLLzA-00240m-J8; Wed, 01 Sep 2021 08:53:03 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CA9823002C1;
 Wed,  1 Sep 2021 10:52:36 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id B165B2DD42378; Wed,  1 Sep 2021 10:52:36 +0200 (CEST)
Date: Wed, 1 Sep 2021 10:52:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3] powerpc/32: Add support for out-of-line static calls
Message-ID: <YS8/VAdjb69sW7V3@hirez.programming.kicks-ass.net>
References: <6ec2a7865ed6a5ec54ab46d026785bafe1d837ea.1630484892.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ec2a7865ed6a5ec54ab46d026785bafe1d837ea.1630484892.git.christophe.leroy@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Jason Baron <jbaron@akamai.com>, Paul Mackerras <paulus@samba.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 01, 2021 at 08:30:21AM +0000, Christophe Leroy wrote:
> Add support for out-of-line static calls on PPC32. This change
> improve performance of calls to global function pointers by
> using direct calls instead of indirect calls.
> 
> The trampoline is initialy populated with a 'blr' or branch to target,
> followed by an unreachable long jump sequence.
> 
> In order to cater with parallele execution, the trampoline needs to
> be updated in a way that ensures it remains consistent at all time.
> This means we can't use the traditional lis/addi to load r12 with
> the target address, otherwise there would be a window during which
> the first instruction contains the upper part of the new target
> address while the second instruction still contains the lower part of
> the old target address. To avoid that the target address is stored
> just after the 'bctr' and loaded from there with a single instruction.
> 
> Then, depending on the target distance, arch_static_call_transform()
> will either replace the first instruction by a direct 'bl <target>' or
> 'nop' in order to have the trampoline fall through the long jump
> sequence.
> 
> For the special case of __static_call_return0(), to avoid the risk of
> a far branch, a version of it is inlined at the end of the trampoline.

(also, it's in the same line, so it avoids another cachemiss and it
nicely fills the hole you had in your 32byte chunk)

> Performancewise the long jump sequence is probably not better than
> the indirect calls set by GCC when we don't use static calls, but
> such calls are unlikely to be required on powerpc32: With most
> configurations the kernel size is far below 32 Mbytes so only
> modules may happen to be too far. And even modules are likely to
> be close enough as they are allocated below the kernel core and
> as close as possible of the kernel text.
> 
> static_call selftest is running successfully with this change.

Nice!, I'd ask if you'd tried PREEMPT_DYNAMIC, since that should really
stress the thing, but I see that also requires GENERIC_ENTRY and you
don't have that. Alas.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
