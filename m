Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2822064826A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 13:37:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NT9Ws6ydgz3bgY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 23:37:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=lj1aIbaO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=lj1aIbaO;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NT9Vz0j80z3bXj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 23:36:24 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 3304B1FDD3;
	Fri,  9 Dec 2022 12:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670589381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XhaJ4AMLCZEgETruIyMo/c72wUMpujHKYsj5J9PetEI=;
	b=lj1aIbaOrUSW/4IH3P9xvkmt4sS+Vua3KVOSLWW/4ZaVjpZXUf9PCF+2AwJBYEoH8Ueq+T
	l1+VZhtJg3kaqSfdImLzMaVFZi0C0SAPfITWqkfevOBbkkFhYn9WKW6g/6rao/X8/xjDI9
	bRjyq6IBZlNlaPWlMUzXxToftLaK8Og=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 0EA7A2C141;
	Fri,  9 Dec 2022 12:36:21 +0000 (UTC)
Date: Fri, 9 Dec 2022 13:36:17 +0100
From: Petr Mladek <pmladek@suse.com>
To: Song Liu <song@kernel.org>
Subject: x86 part: was: Re: [PATCH v6] livepatch: Clear relocation targets on
 a module removal
Message-ID: <Y5MrwePZoa5tYlQP@alley>
References: <20220901171252.2148348-1-song@kernel.org>
 <Y3expGRt4cPoZgHL@alley>
 <CAPhsuW4qYpX7wzHn5J5Hn9cnOFSZwwQPCjTM_HPTt_zbBS03ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPhsuW4qYpX7wzHn5J5Hn9cnOFSZwwQPCjTM_HPTt_zbBS03ww@mail.gmail.com>
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

On Mon 2022-11-28 17:57:06, Song Liu wrote:
> On Fri, Nov 18, 2022 at 8:24 AM Petr Mladek <pmladek@suse.com> wrote:
> --- a/arch/x86/kernel/module.c
> +++ b/arch/x86/kernel/module.c
> > This duplicates a lot of code. Please, rename apply_relocate_add() the
> > same way as __apply_clear_relocate_add() and add the "apply" parameter.
> > Then add the wrappers for this:
> >
> > int write_relocate_add(Elf64_Shdr *sechdrs,
> >                        const char *strtab,
> >                        unsigned int symindex,
> >                        unsigned int relsec,
> >                        struct module *me,
> >                        bool apply)
> > {
> >         int ret;
> >         bool early = me->state == MODULE_STATE_UNFORMED;
> >         void *(*write)(void *, const void *, size_t) = memcpy;
> >
> >         if (!early) {
> >                 write = text_poke;
> >                 mutex_lock(&text_mutex);
> >         }
> 
> How about we move the "early" logic into __write_relocate_add()?

If I get it correctly then __write_relocate_add() has three different
return paths. I am not sure if this could be moved there a reasonable
way.

Anyway, I do not resist on the above proposal. Feel free to find
another solution that reduces the duplicated code and looks
reasonable. I am sure that there are more possibilities.

Best Regards,
Petr
