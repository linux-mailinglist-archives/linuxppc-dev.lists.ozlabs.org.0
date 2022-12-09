Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CC06483AB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 15:21:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NTCqm66tSz3bqw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Dec 2022 01:21:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=S9KPDqoE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=S9KPDqoE;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NTCpp5tP5z3bZJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Dec 2022 01:20:17 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 519BF229E8;
	Fri,  9 Dec 2022 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670595614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nzwv4m3Hgg/uWdoPi0O3B5YBmF8eSTJJtprw/dS4JvI=;
	b=S9KPDqoEIBpJEb0CYzWi/31c4xU81n60FczF8mVTo/65TE9V/WYhYGIo+p3iAOaE8yb7LI
	9EFZT/TtHuRtVToHzZ+MvaH+6zE8eDtFeaD+Z0MZ3VH09k+EsrWz6c7g/1dgokCsdBWqI6
	X4Kk0boP5CGTvvybOrWwYtg3WoIsVrI=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 2DABF2C141;
	Fri,  9 Dec 2022 14:20:14 +0000 (UTC)
Date: Fri, 9 Dec 2022 15:20:13 +0100
From: Petr Mladek <pmladek@suse.com>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v6] livepatch: Clear relocation targets on a module
 removal
Message-ID: <Y5NEHdSSMSyec6S+@alley>
References: <20220901171252.2148348-1-song@kernel.org>
 <Y3expGRt4cPoZgHL@alley>
 <CAPhsuW4qYpX7wzHn5J5Hn9cnOFSZwwQPCjTM_HPTt_zbBS03ww@mail.gmail.com>
 <Y5M+AoKHDK4rn6/i@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5M+AoKHDK4rn6/i@alley>
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
Cc: jikos@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, joe.lawrence@redhat.com, Josh Poimboeuf <jpoimboe@redhat.com>, live-patching@vger.kernel.org, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 2022-12-09 14:54:10, Petr Mladek wrote:
> On Mon 2022-11-28 17:57:06, Song Liu wrote:
> > On Fri, Nov 18, 2022 at 8:24 AM Petr Mladek <pmladek@suse.com> wrote:
> > > > --- a/kernel/livepatch/core.c
> > > > +++ b/kernel/livepatch/core.c
> I see that you removed also:
> 
> 	if (strcmp(objname ? objname : "vmlinux", sec_objname))
> 		return 0;
> 
> This is another bug in your "simplification".

This actually is not a bug. It was replaced by the strcmp() check below.

> > > > +
> > > > +             if (strcmp(objname, sec_objname))
> > > > +                     continue;

But this works only because the function is not called for "vmlinux".
It can't be unloaded.

Well, this optimization is not worth it. IMHO, it is better when
the API is able to handle "vmlinux" object a safe way.

We always try to make the livepatch API as error-proof as possible.
It is the main idea of livepatching. It should fix bugs without
breaking the running system.

Best Regards,
Petr
