Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 302387AACBD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:36:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=tPBubHru;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsQb80YVVz3jRj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:36:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=tPBubHru;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsQ082kB0z3gVj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 18:09:12 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 26E1C1F38A;
	Fri, 22 Sep 2023 08:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1695370149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0gLx5up2W0A7onZ8plsSQicHSESF10QpvNgWlLnvzwE=;
	b=tPBubHruDJanyHQ9yo0YvG8PNFgbYsJmVz/bV7ZQTXDr0Nsdu+vzjpGVXWn67ioWfCV4y7
	3NBUSrZRwrtPDV+mFyYO5y4B2c6WITyt2U7QlIdzqLPQzYpqqAdtpASIw0xvqusBvDmfZf
	fiTjQxxX+7YloY6n2zlTZ2YN1OM66dg=
Received: from suse.cz (pmladek.udp.ovpn2.prg.suse.de [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id E652D2C142;
	Fri, 22 Sep 2023 08:09:08 +0000 (UTC)
Date: Fri, 22 Sep 2023 10:09:07 +0200
From: Petr Mladek <pmladek@suse.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/stacktrace: Fix arch_stack_walk_reliable()
Message-ID: <ZQ1LoyYaM3wLg5m_@alley>
References: <20230921232441.1181843-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921232441.1181843-1-mpe@ellerman.id.au>
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
Cc: live-patching@vger.kernel.org, joe.lawrence@redhat.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 2023-09-22 09:24:41, Michael Ellerman wrote:
> The changes to copy_thread() made in commit eed7c420aac7 ("powerpc:
> copy_thread differentiate kthreads and user mode threads") inadvertently
> broke arch_stack_walk_reliable() because it has knowledge of the stack
> layout.
> 
> Fix it by changing the condition to match the new logic in
> copy_thread(). The changes make the comments about the stack layout
> incorrect, rather than rephrasing them just refer the reader to
> copy_thread().
> 
> Also the comment about the stack backchain is no longer true, since
> commit edbd0387f324 ("powerpc: copy_thread add a back chain to the
> switch stack frame"), so remove that as well.
> 
> Reported-by: Joe Lawrence <joe.lawrence@redhat.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Fixes: eed7c420aac7 ("powerpc: copy_thread differentiate kthreads and user mode threads")

The change makes sense to me. Well, I could not test it easily.
Anyway, feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
