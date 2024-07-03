Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAB492661E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 18:27:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rwd9e7kl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDlYs0pS1z3dK6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 02:27:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rwd9e7kl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDlYB5nJxz3cZ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 02:27:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6510ECE2D2B;
	Wed,  3 Jul 2024 16:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC89C2BD10;
	Wed,  3 Jul 2024 16:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720024025;
	bh=iqYxlC1bhe/7ALpkNeE5phKu3N9aTBnG3R0HukiaLws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rwd9e7kliYyzi9FQPgDbHOkyrNE+y0jJRVWnOdmXhAkVOD1ALZD0O10DjNWFdt3yC
	 ofb8OUs3AK4tJ1ETzauW/+3t+eb/4uqnz3ZVD6XWlRjMjQGvlP8UR9uBfs+9//130N
	 CeN/pC1bgOCnO1VB1B+hlwcVy289AeM/esB0ht8j55bH9Y8nSprZ7wpAtbvdTbz9AL
	 iL/UQJKak4mdUS3H81Mn47L1q38rjm7FaAXhIo9ngCEgZjFb3ikj1ZDBhqbVK8SiJr
	 HZg0QGdZ9zMNJD8lbhhVjPqYxuorXhgrPYWZkHunA9J73aHALa3eQQyUQIz2HvRh3j
	 HNWAuSbLQR1RA==
Date: Wed, 3 Jul 2024 09:27:04 -0700
From: Kees Cook <kees@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
Message-ID: <202407030926.D5DA9B901D@keescook>
References: <20240702122639.248110-1-jfalempe@redhat.com>
 <202407021326.E75B8EA@keescook>
 <10ea2ea1-e692-443e-8b48-ce9884e8b942@redhat.com>
 <ZoUKM9-RiOrv0_Vf@pathway.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoUKM9-RiOrv0_Vf@pathway.suse.cz>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Vignesh Raghavendra <vigneshr@ti.com>, Uros Bizjak <ubizjak@gmail.com>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Wei Liu <wei.liu@kernel.org>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Dexuan Cui <decui@microsoft.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Zimmermann <tzimmermann@suse.de>, John Ogness <john.ogness@linutronix.de>, Jani Nikula <jani.nikula@intel.com>, Haiyang Zhang <haiyangz@microsoft.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, Jocelyn Falempe <jfalempe@redhat.com>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 03, 2024 at 10:22:11AM +0200, Petr Mladek wrote:
> On Wed 2024-07-03 09:57:26, Jocelyn Falempe wrote:
> > 
> > 
> > On 02/07/2024 22:29, Kees Cook wrote:
> > > On Tue, Jul 02, 2024 at 02:26:04PM +0200, Jocelyn Falempe wrote:
> > > > kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
> > > > callback.
> > > > This patch adds a new struct kmsg_dump_detail, that will hold the
> > > > reason and description, and pass it to the dump() callback.
> > > 
> > > Thanks! I like this much better. :)
> > > 
> > > > 
> > > > To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
> > > > function and a macro for backward compatibility.
> > > > 
> > > > I've written this for drm_panic, but it can be useful for other
> > > > kmsg_dumper.
> > > > It allows to see the panic reason, like "sysrq triggered crash"
> > > > or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
> > > > 
> > > > v2:
> > > >   * Use a struct kmsg_dump_detail to hold the reason and description
> > > >     pointer, for more flexibility if we want to add other parameters.
> > > >     (Kees Cook)
> > > >   * Fix powerpc/nvram_64 build, as I didn't update the forward
> > > >     declaration of oops_to_nvram()
> > > 
> > > The versioning history commonly goes after the "---".
> > 
> > ok, I was not aware of this.
> > > 
> > > > [...]
> > > > diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
> > > > index 906521c2329c..65f5a47727bc 100644
> > > > --- a/include/linux/kmsg_dump.h
> > > > +++ b/include/linux/kmsg_dump.h
> > > > @@ -39,6 +39,17 @@ struct kmsg_dump_iter {
> > > >   	u64	next_seq;
> > > >   };
> > > > +/**
> > > > + *struct kmsg_dump_detail - kernel crash detail
> > > 
> > > Is kern-doc happy with this? I think there is supposed to be a space
> > > between the "*" and the first word:
> > > 
> > >   /**
> > >    * struct kmsg...
> > > 
> > > 
> > Good catch, yes there is a space missing.
> > 
> > I just checked with "make htmldocs", and in fact include/linux/kmsg_dump.h
> > is not indexed for kernel documentation.
> > And you can't find the definition of struct kmsg_dumper in the online doc.
> > https://www.kernel.org/doc/html/latest/search.html?q=kmsg_dumper
> > 
> > > Otherwise looks good to me!
> > > 
> > 
> > Thanks.
> > 
> > As this patch touches different subsystems, do you know on which tree it
> > should land ?
> 
> Andrew usually takes patches against kernel/panic.c.
> 
> Or you could take it via the DRM tree, especially if you already have the code
> using the string.
> 
> Also I could take it via the printk tree. The only complication is
> that I am going to be away the following two weeks and would come
> back in the middle of the merge window. I do not expect much problems
> with this change but...

If DRM doesn't want to carry it, I can put it in through the pstore
tree. Let me know! :)

-- 
Kees Cook
