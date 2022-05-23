Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AD7531188
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 17:16:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6LWq1Hwlz3bwr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 01:16:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=UQslza7y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=UQslza7y; dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6LW760Nlz3bYG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 01:15:46 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id E345821B40;
 Mon, 23 May 2022 15:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1653318942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Li9Eq39Zca7A7Yd+2+8FiQZmQCwkSJCjj6oLOBXVCTQ=;
 b=UQslza7yiL1x8r4CTlcvmyaEzDceraNNRn4y2gdNRFA021qH++lF1uuahK9zlB0ChD1z2W
 opw6Z1MGw6aJi0cxM3BmTltSvfrdGBSoVU5Z/bvw/OtqPHl40yNd4DDS8TmMABzOjvjpWm
 jBE7cmrpVE3jk5YKQjCOBilTHWohuHc=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id DC5A02C141;
 Mon, 23 May 2022 15:15:40 +0000 (UTC)
Date: Mon, 23 May 2022 17:15:37 +0200
From: Petr Mladek <pmladek@suse.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] livepatch: Remove klp_arch_set_pc() and asm/livepatch.h
Message-ID: <YoulGX1p82IoEzST@alley>
References: <e029c7cfde436f6bbf99148ab14dc2da99add503.1648447981.git.christophe.leroy@csgroup.eu>
 <YkLsEUgxJkYbLZ7Z@alley>
 <e1840187-6032-9f75-d7a8-b2b2fc5cbb58@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1840187-6032-9f75-d7a8-b2b2fc5cbb58@csgroup.eu>
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
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Miroslav Benes <mbenes@suse.cz>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, "x86@kernel.org" <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Jiri Kosina <jikos@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 2022-05-23 06:51:47, Christophe Leroy wrote:
> 
> 
> Le 29/03/2022 à 13:22, Petr Mladek a écrit :
> > On Mon 2022-03-28 08:26:48, Christophe Leroy wrote:
> >> All three versions of klp_arch_set_pc() do exactly the same: they
> >> call ftrace_instruction_pointer_set().
> >>
> >> Call ftrace_instruction_pointer_set() directly and remove
> >> klp_arch_set_pc().
> >>
> >> As klp_arch_set_pc() was the only thing remaining in asm/livepatch.h
> >> on x86 and s390, remove asm/livepatch.h
> >>
> >> livepatch.h remains on powerpc but its content is exclusively used
> >> by powerpc specific code.
> >>
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > 
> > Acked-by: Petr Mladek <pmladek@suse.com>
> > 
> > I am going to take it via livepatch/livepatch.git for 5.19. We are
> > already in the middle of the merge window and this is not critical.
> > 
> 
> I haven't seen it in linux-next.
> 
> Do you still plan to take it for 5.19 ?

Thanks a lot for pointing this out. I have completely forgot about
this patch /o\

I have just pushed it into livepatching/livepatching.git,
branch for-5.19/cleanup.

I am going to create pull request for 5.19 by the end of this week
after it gets a spin in linux-next.

Best Regards,
Petr
