Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC81D441CD9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 15:51:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hjbb25jbCz2yfc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 01:51:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=nLv/ytfi;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iyf/3iVA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=mbenes@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=nLv/ytfi; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=iyf/3iVA; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjbZJ3Mpxz2xXW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 01:51:03 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 3667E212C4;
 Mon,  1 Nov 2021 14:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635778259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S57HysUOBDmaPPkxy9xFNLNnV0qtuzg356ms8vO+zDs=;
 b=nLv/ytfioPKJ2E5inNqVfktlCIOh/RPq/TlUvEwD1rgVLFbnikQWvgIYm0r/+YenHEb510
 +FNTcadrc/mOf1cy8uwCKQFzWvFzNJzejuqTos3otALVjlqAO/6KIk7tU5rWWsiWl115uS
 1Bxs+rsKmQbL/dmXmw8WUxxmkKl2z7U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635778259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S57HysUOBDmaPPkxy9xFNLNnV0qtuzg356ms8vO+zDs=;
 b=iyf/3iVAxxHKP+6EEdNXf4jPP4/47uaCQuTqXGFTdNiJUg/ClccGZ5pHL+GGYn0EppdCQC
 bsi3/nLwLHHiOmCg==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 8FBF4A3B83;
 Mon,  1 Nov 2021 14:50:58 +0000 (UTC)
Date: Mon, 1 Nov 2021 15:50:58 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 0/5] Implement livepatch on PPC32
In-Reply-To: <cover.1635423081.git.christophe.leroy@csgroup.eu>
Message-ID: <alpine.LSU.2.21.2111011541380.22397@pobox.suse.cz>
References: <cover.1635423081.git.christophe.leroy@csgroup.eu>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, live-patching@vger.kernel.org,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, 28 Oct 2021, Christophe Leroy wrote:

> This series implements livepatch on PPC32.
> 
> This is largely copied from what's done on PPC64.
> 
> Christophe Leroy (5):
>   livepatch: Fix build failure on 32 bits processors
>   powerpc/ftrace: No need to read LR from stack in _mcount()
>   powerpc/ftrace: Add module_trampoline_target() for PPC32
>   powerpc/ftrace: Activate HAVE_DYNAMIC_FTRACE_WITH_REGS on PPC32
>   powerpc/ftrace: Add support for livepatch to PPC32
> 
>  arch/powerpc/Kconfig                  |   2 +-
>  arch/powerpc/include/asm/livepatch.h  |   4 +-
>  arch/powerpc/kernel/module_32.c       |  33 +++++
>  arch/powerpc/kernel/trace/ftrace.c    |  53 +++-----
>  arch/powerpc/kernel/trace/ftrace_32.S | 187 ++++++++++++++++++++++++--
>  kernel/livepatch/core.c               |   4 +-
>  6 files changed, 230 insertions(+), 53 deletions(-)

thanks for the patch set!

I wondered whether the reliability of stack traces also applies to PPC32. 
This was obviously resolved by accdd093f260 ("powerpc: Activate 
HAVE_RELIABLE_STACKTRACE for all").

Did the patch set pass the selftests in 
tools/testing/selftests/livepatch/ ?

Regards

Miroslav
