Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D811174BEA0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 19:40:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=pG41tN/N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QyyGR5Qz1z3c1k
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 03:40:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=pG41tN/N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QyyFW51f9z300q
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 03:39:42 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA3E160C0B;
	Sat,  8 Jul 2023 17:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4EAC433C8;
	Sat,  8 Jul 2023 17:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1688837978;
	bh=drHKeMgcNL4TWp9p/P+2PrXQ+fcbGYyaIQwGHCxCj5A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pG41tN/NOuUi9p2O3xHgsxiCZm9Ur7qT6LNK6J41PNluKBPAFAfzwjkUk+IBoOqJ0
	 gYvAHLzr7CA3aWA+fO583UTJs0L4X9fZyeJsLRZhqu7fpJiCYldMckz2u+xwpVo7a4
	 m8F2vLyJTKNBUlLaocc7+8PhsfdYv6ml1+FfFGnk=
Date: Sat, 8 Jul 2023 10:39:36 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Fwd: Memory corruption in multithreaded user space program
 while calling fork
Message-Id: <20230708103936.4f6655cd0d8e8a0478509e25@linux-foundation.org>
In-Reply-To: <CAHk-=whKd05V49AbZGF=inYmhU6H_yNvvw1grWyhQfQ=9+5-VQ@mail.gmail.com>
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
	<5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info>
	<CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
	<CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
	<2023070359-evasive-regroup-f3b8@gregkh>
	<CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
	<2023070453-plod-swipe-cfbf@gregkh>
	<20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
	<CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
	<2023070509-undertow-pulverize-5adc@gregkh>
	<7668c45a-70b1-dc2f-d0f5-c0e76ec17145@leemhuis.info>
	<20230705084906.22eee41e6e72da588fce5a48@linux-foundation.org>
	<df1d7d39-56f3-699c-0d0f-fcc8774f182e@leemhuis.info>
	<CAHk-=whKd05V49AbZGF=inYmhU6H_yNvvw1grWyhQfQ=9+5-VQ@mail.gmail.com>
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
Cc: Jacob Young <jacobly.alt@gmail.com>, Linux regressions mailing list <regressions@lists.linux.dev>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, Thorsten Leemhuis <regressions@leemhuis.info>, Bagas Sanjaya <bagasdotme@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 8 Jul 2023 10:29:42 -0700 Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sat, 8 Jul 2023 at 04:35, Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
> >
> > The plan since early this week is to mark CONFIG_PER_VMA_LOCK as broken;
> > latest patch that does this is this one afaics:
> 
> Bah.
> 
> Both marking it as broken and the pending fix seems excessive.
> 
> Why isn't the trivial fix just to say "yes, fork() gets the mmap_lock
> for writing for a reason, and that reason is that it acts kind of like
> mprotect()".
> 
> And then just do what those functions do.
> 
> IOW, why isn't the fix just to do
> 
>   --- a/kernel/fork.c
>   +++ b/kernel/fork.c
>   @@ -686,6 +686,7 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
>         for_each_vma(old_vmi, mpnt) {
>                 struct file *file;
> 
>   +             vma_start_write(mpnt);
>                 if (mpnt->vm_flags & VM_DONTCOPY) {
>                         vm_stat_account(mm, mpnt->vm_flags, -vma_pages(mpnt));
>                         continue;
> 
> and be done with this? Yes, we could move it down a bit more, ignoring
> the VM_DONTCOPY vma's, but they are so uncommon as to not matter, so
> who cares?

That was the v1 fix, but after some discussion
(https://lkml.kernel.org/r/20230705063711.2670599-1-surenb@google.com)
it was decided to take the "excessive" approach.

Also, this change needs a couple more updates:
https://lkml.kernel.org/r/20230707043211.3682710-1-surenb@google.com
https://lkml.kernel.org/r/20230707043211.3682710-2-surenb@google.com

So I'm thinking it's best to disable the feature in 6.4.x and reenable
it for 6.5 once all this is sorted out.
