Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD6567B352
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 14:32:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P24Wq0nvLz3cGv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 00:32:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=g9DgVNrX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=g9DgVNrX;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P24Vv5JpGz2xYL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 00:31:34 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 84ED41F854;
	Wed, 25 Jan 2023 13:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674653491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pkYqfHPGmzeHocvv83wx0Y3+zQ94GNdz2CdFbiQ4jVI=;
	b=g9DgVNrXVWxk1UtKhExUALjPBThgTj85mQIVnaR7pkdykdfNb7FMLGGXC6kkXB6Uk1Q8mw
	GRjko2f6olOZhKImurgGVk1uT1ihMBT7qrClyUZoetEDCz90qiRsBNbhLVe9CLOIlw+nhE
	v/9ONhDS+F2kV0RjaWrOAvcxPic12+Y=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 5EFE52C141;
	Wed, 25 Jan 2023 13:31:31 +0000 (UTC)
Date: Wed, 25 Jan 2023 14:31:31 +0100
From: Petr Mladek <pmladek@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH 2/2] powerpc/module_64: Fix "expected nop" error on
 module re-patching
Message-ID: <Y9EvM+uuMsE2yVWz@alley>
References: <cover.1674617130.git.jpoimboe@kernel.org>
 <2f6329ffd9674df6ff57e03edeb2ca54414770ab.1674617130.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f6329ffd9674df6ff57e03edeb2ca54414770ab.1674617130.git.jpoimboe@kernel.org>
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
Cc: linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 2023-01-24 19:38:05, Josh Poimboeuf wrote:
> When a module with a livepatched function is unloaded and then reloaded,
> klp attempts to dynamically re-patch it.  On ppc64, that fails with the
> following error:
> 
>   module_64: livepatch_nfsd: Expected nop after call, got e8410018 at e_show+0x60/0x548 [livepatch_nfsd]
>   livepatch: failed to initialize patch 'livepatch_nfsd' for module 'nfsd' (-8)
>   livepatch: patch 'livepatch_nfsd' failed for module 'nfsd', refusing to load module 'nfsd'
> 
> The error happens because the restore r2 instruction had already
> previously been written into the klp module's replacement function when
> the original function was patched the first time.  So the instruction
> wasn't a nop as expected.
> 
> When the restore r2 instruction has already been patched in, detect that
> and skip the warning and the instruction write.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

It seems that the function does what it says. And it seems to be the
only location where an instruction is checked before it is modified.
I am fine with this approach.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
