Return-Path: <linuxppc-dev+bounces-15873-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DFFD29653
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 01:19:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsgSm3CkYz2yFY;
	Fri, 16 Jan 2026 11:19:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768522744;
	cv=none; b=QMlGBWJ9sqptrzizqwXdajR1z+RoL2RkGbep61UHjHZAPvtlizUNYkrXvwmxl81E/QvTldH3AjlbKsgyT0WVQosh4g042PWQflr/1OOzYc34w/i0mTtaVu3sb9m2wIZDAtmnOhrLMt99qQFPnQAp342gZaY9H4RENk1bxPOjhJU38gvSzqK/Xgn2BzlgivXjxs4sVFKDzOYGnLZY6/h2v10YH3zPx7oTHC17YNa6nJAvItqP+qQI8Zm3lhBz5kIyIxWp6T/J+5sqXjXcxGjr8PGjxX7gq8X7/Tpjsvz8IWT2I0XQ14bFQJzAL7KuvMpvnyuhgw2AHbqo0DF2GmSHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768522744; c=relaxed/relaxed;
	bh=8dZ9oxt9FWn/F9+lO/IJZ9dkf3WC43EemNdOt09jeRI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=RuIBOb5ny6A3Fld5R4COyBQmTHOuJbZt/2Ne0JtPX0hzjp02P2kzZec7b0U/PiKIvEfn5mWIgdqLLUGqeNcHXKvrcI5rP6tnFjZX05Mc3wB8NV6Mntp1E5DRptsra8/pyV/Z7wkK/KKhHAyvxD3T3j5Zl3tFASc/LIk9hcYwTjXwGjqBA9nd30CvZ9q0WT/0ee4RZ9gPA816lehngYUhn5d/BKn6G7EKYnCbDWRnaeOJY2dcaDzM1+1tj//AJ2i3yykMY0vyxs2U7mDG7J7pCKZafa5kxeXHJKJ5Fcht4yyPJgLf0vmjuIw66xchaDb20iThzdDZ4dBvF0Oshb/vPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=oTyrgtvf; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=oTyrgtvf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsgSl05Xpz2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 11:19:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FD3D60160;
	Fri, 16 Jan 2026 00:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBC0C116D0;
	Fri, 16 Jan 2026 00:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768522739;
	bh=xmezwQxgXFBOE+WsEI8kzMdBQ/Vtj0ziay1CjIV7d/0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oTyrgtvfzdS6SXwpo1a618aiclgOz0Sosdc70f8yw78SvJDgJcbGQ4l+n163A+84S
	 GtOC/DHsdsuWPAUiEYgrvES4udeex059kh0yHGa7HIOVi7c0lI6djZDMrpXSzDE6TI
	 6esn++KQCSZ991FCXwGinH0epC8qjUoqV4yZ1PiQ=
Date: Thu, 15 Jan 2026 16:18:57 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>,
 Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org, Nicholas Miehlbradt
 <nicholas@linux.ibm.com>, Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
 Andrew Donnellan <andrew+kernel@donnellan.id.au>, Srish Srinivasan
 <ssrish@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v18 00/12] Support page table check on PowerPC
Message-Id: <20260115161857.ad9952cf1ebd1b37839aa652@linux-foundation.org>
In-Reply-To: <cc97397d3c75d796ee71081cc842c867a62ce39a.camel@linux.ibm.com>
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
	<CA+CK2bBjoQmheEstv1MacGev_srdx=m5v=hwxdyfAKogbpG3FA@mail.gmail.com>
	<bf0def77b07a34c00928cedb46030ea17be4fceb.camel@linux.ibm.com>
	<b6c39059-faed-41a8-80b2-addaa229c143@kernel.org>
	<cc97397d3c75d796ee71081cc842c867a62ce39a.camel@linux.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 15 Jan 2026 17:13:26 +1100 Andrew Donnellan <ajd@linux.ibm.com> wrote:

> On Wed, 2026-01-14 at 10:34 +0100, Christophe Leroy (CS GROUP) wrote:
> > What is the merge plan ? I see all powerpc commits are acked by Maddy, 
> > will the series be merged by Andrew into the mm tree ?
> 
> This is what I was expecting - this revision is rebased on mm-new as it stood
> around when I sent it.

Ouch, sorry, I did not understand this.  So we've lost 4 weeks testing :(

The core MM and ARM changes are trival, in the if-it-compiles-it-works
category.  Is the mm tree really the best place for this?  It'll get
more testing in the powerpc tree?

But if you're OK with it, I'm OK with it.

> By the way it doesn't apply on top of powerpc/merge branch:

I guess we'll be hearing from Mark when this hits linux-next. 
Hopefully the resolution isn't horrible.

As I'm adding this to mm.git's mm-new branch, Mark won't actually be
seeing it.  I'll aim to move this into mm-unstable (and hence
linux-next) after just a single day.


