Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B974EAC5A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 13:32:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSS8P5Xpfz30MQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 22:32:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=a4pa12+a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=a4pa12+a; dkim-atps=neutral
X-Greylist: delayed 505 seconds by postgrey-1.36 at boromir;
 Tue, 29 Mar 2022 22:31:30 AEDT
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSS7k0CjPz2xf9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 22:31:29 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0422A1F87C;
 Tue, 29 Mar 2022 11:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1648552981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SIv5uXYMR0opeIvGmNdx5Nx23cUrlYA4mD5vDaH6REM=;
 b=a4pa12+asB0UvvOL2t6C7VRrhoYKwHDo9Jo1k1K7cQSVeCHRBqAxNEzdFkHj6Jx/cJvJMv
 xzTboGQJtPnMz32eX6bxd6a+dUtVbcvzrMkj7YY00wEBN+JYWlhoLgnAXmqUso50y5Sdu2
 ycRjhpo8VdscO15NjnBedEdqe8bBlGE=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C099FA3B82;
 Tue, 29 Mar 2022 11:23:00 +0000 (UTC)
Date: Tue, 29 Mar 2022 13:22:57 +0200
From: Petr Mladek <pmladek@suse.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] livepatch: Remove klp_arch_set_pc() and asm/livepatch.h
Message-ID: <YkLsEUgxJkYbLZ7Z@alley>
References: <e029c7cfde436f6bbf99148ab14dc2da99add503.1648447981.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e029c7cfde436f6bbf99148ab14dc2da99add503.1648447981.git.christophe.leroy@csgroup.eu>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 live-patching@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>, linux-s390@vger.kernel.org,
 Joe Lawrence <joe.lawrence@redhat.com>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Jiri Kosina <jikos@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 2022-03-28 08:26:48, Christophe Leroy wrote:
> All three versions of klp_arch_set_pc() do exactly the same: they
> call ftrace_instruction_pointer_set().
> 
> Call ftrace_instruction_pointer_set() directly and remove
> klp_arch_set_pc().
> 
> As klp_arch_set_pc() was the only thing remaining in asm/livepatch.h
> on x86 and s390, remove asm/livepatch.h
> 
> livepatch.h remains on powerpc but its content is exclusively used
> by powerpc specific code.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Petr Mladek <pmladek@suse.com>

I am going to take it via livepatch/livepatch.git for 5.19. We are
already in the middle of the merge window and this is not critical.

Best Regards,
Petr
