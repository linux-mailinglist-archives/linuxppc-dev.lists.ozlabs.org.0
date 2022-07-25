Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65231580493
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 21:40:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls9PT1Wl1z3cfL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 05:40:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=lnm0tSCC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=lnm0tSCC;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls9Nt1Rmwz3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 05:39:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E5517B810A4;
	Mon, 25 Jul 2022 19:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24445C341C6;
	Mon, 25 Jul 2022 19:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1658777989;
	bh=cuudPE0wtvbxElXfQCMzPg0O3xDu7MgSPTnAUbd2BI0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lnm0tSCCxjmphQNW5NriYcH19FeO0pMC/0MZl19jo18xWrIdpmYjjReLjZrbQc3nV
	 M3OCLSW3PO1gZvubU1+zIdU9EZbB6ratbRpHX/aNA2dD8ZrjXLNedUC8xa5hrDNMbu
	 lcZp1M+CGZGybihQDDnCvRc7tTtqd8IELi5v8huc=
Date: Mon, 25 Jul 2022 12:39:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] profile: setup_profiling_timer() is moslty not
 implemented
Message-Id: <20220725123948.f16674b10022404814161d4a@linux-foundation.org>
In-Reply-To: <20220721195509.418205-1-ben-linux@fluff.org>
References: <20220721195509.418205-1-ben-linux@fluff.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, openrisc@lists.librecores.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 21 Jul 2022 20:55:09 +0100 Ben Dooks <ben-linux@fluff.org> wrote:

> The setup_profiling_timer() is mostly un-implemented by many
> architectures. In many places it isn't guarded by CONFIG_PROFILE
> which is needed for it to be used. Make it a weak symbol in
> kernel/profile.c and remove the 'return -EINVAL' implementations
> from the kenrel.
> 
> There are a couple of architectures which do return 0 from
> the setup_profiling_timer() function but they don't seem to
> do anything else with it. To keep the /proc compatibility for
> now, leave these for a future update or removal.
> 
> On ARM, this fixes the following sparse warning:
> arch/arm/kernel/smp.c:793:5: warning: symbol 'setup_profiling_timer' was not declared. Should it be static?

I'll grab this.

We have had some problems with weak functions lately.  See

https://lore.kernel.org/all/87ee0q7b92.fsf@email.froward.int.ebiederm.org/T/#u

Hopefully that was a rare corner case.
