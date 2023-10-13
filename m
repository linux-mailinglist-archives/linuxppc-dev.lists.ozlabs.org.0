Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D87C7C8717
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 15:43:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Cs5IhrvO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6SQ60Sh5z3vhJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 00:43:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Cs5IhrvO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050:0:465::102; helo=mout-p-102.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050:0:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6SPB3CdDz3dhR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 00:42:36 +1100 (AEDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4S6SNy00H8z9slt;
	Fri, 13 Oct 2023 15:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1697204546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5KyVORMmdsFCe+VFgUpWMVXH0T0VUg2Hs67km9vsQeg=;
	b=Cs5IhrvO7lzZAq0aoxObmbj0gtykN3EM5wzUW2+SZhlNW42WA5MTHO0xF6UQXaQ+fPHnNy
	ed5rlE7fy2i5s7rlXph7MNUpcCoaMXDgS3Gi69rSr7zYxOG5y3cqWudmkKJ8mrvi0LPOx6
	NnZuomUA7zLhNJgucNoWIBI1cIUmyhwg3+KXm0MiwXvI/LYeUoSVQKMIzzizQBCiGOuK7N
	Q+ab8AfHxG7exykdCJyf96yI8wnRgaVNDYHcsdfYwKTCoWBoF7P49cmSFMDwtbTOaQBAyR
	cH1rS82jzFHdu41tZq1+DWvQCUwNpFu9nYImO72yEGssfp1rxfKLPL/egLYAqQ==
Date: Fri, 13 Oct 2023 15:42:20 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH 0/2] Allow nesting of lazy MMU mode
Message-ID: <20231013154220.02fb2e6d@yea>
In-Reply-To: <20231012195415.282357-1-willy@infradead.org>
References: <20231012195415.282357-1-willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: fwggrtmigo4x4ffeiuzyox1abn9uz6c1
X-MBO-RS-ID: 69186c5c661cec6bfb2
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
Cc: Juergen Gross <jgross@suse.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-sparc@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 12 Oct 2023 20:54:13 +0100
"Matthew Wilcox (Oracle)" <willy@infradead.org> wrote:

> Dave Woodhouse reported that we now nest calls to
> arch_enter_lazy_mmu_mode().  That was inadvertent, but in principle we
> should allow it.  On further investigation, Juergen already fixed it
> for Xen, but didn't tell anyone.  Fix it for Sparc & PowerPC too.
> This may or may not help fix the problem that Erhard reported.
> 
> Matthew Wilcox (Oracle) (2):
>   powerpc: Allow nesting of lazy MMU mode
>   sparc: Allow nesting of lazy MMU mode
> 
>  arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 5 ++---
>  arch/sparc/mm/tlb.c                                | 5 ++---
>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> -- 
> 2.40.1

Applied the patch on top of v6.6-rc5 but unfortunately it did not fix my reported issue.

Regards,
Erhard
