Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 984E273A708
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 19:15:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=AMC8cfuE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qn6Sf3xWmz3bmq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 03:15:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=AMC8cfuE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qn6Rk1LXWz30PR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 03:14:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4AA2D60BFC;
	Thu, 22 Jun 2023 17:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E516C433C8;
	Thu, 22 Jun 2023 17:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1687454061;
	bh=0p/7wDJ1WpnlaJGGYQlrL+ANC4cnKoEcAt+zejcaU8w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AMC8cfuEWXrjDXDH8RIeyelx4TnwfZxc3EImbnknh3cnKnWJDkzqIY4Dg5H+Grgyp
	 1XC9aWZqclXu6zOoHjfTuY9t4JfHVlYN4ZpkyLFzwukIZDnwmPQ5Bu8Kx3Z5N5TENN
	 hJgnbVzM2a83YuLZbvoStKy2rp6U9rVK1Q+j9xeg=
Date: Thu, 22 Jun 2023 10:14:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH] powerpc: Move arch_trigger_cpumask_backtrace from nmi.h
 to irq.h
Message-Id: <20230622101420.f50c8d702a5757647b92250a@linux-foundation.org>
In-Reply-To: <ZJQI6_P2yfJKZK52@alley>
References: <20230621164809.1.Ice67126857506712559078e7de26d32d26e64631@changeid>
	<ZJQI6_P2yfJKZK52@alley>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Tom Rix <trix@redhat.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 22 Jun 2023 10:40:11 +0200 Petr Mladek <pmladek@suse.com> wrote:

> On Wed 2023-06-21 16:48:19, Douglas Anderson wrote:
> > The powerpc architecture was the only one that defined
> > arch_trigger_cpumask_backtrace() in asm/nmi.h instead of
> > asm/irq.h. Move it to be consistent.
> > 
> > This fixes compile time errors introduced by commit 7ca8fe94aa92
> > ("watchdog/hardlockup: define HARDLOCKUP_DETECTOR_ARCH"). That commit
> 
> Will this commit end up in the mainline wihtout rebasing?
> We could use only final commit hashes in the commit messages.

7ca8fe94aa92 is now in the mm-stable branch, which is is non-rebasing,
so this hash should be good.

Patches get moved from the rebasing mm-unstable to the non-rebasing
mm-stable when they're considered to be stabilized.

Ditto mm-hotfixes-unstable/mm-hotfixes-stable and
mm-nonmm-unstable/mm-nonmm-stable.
