Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0185C305A83
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 13:00:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQhxH1NkCzDqSN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 23:00:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=VqvtxSgm; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQhqz6HJgzDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 22:55:18 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611748514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lwuc+jSkD82sotlNHJidx8xja/Bw1JYQcR061EVrMxA=;
 b=VqvtxSgmJ5cfSryecsAWZnhhs5uilRcndo5u4Gvp2ENukoxoKJsr+mTPjc4n9b02HE5zd2
 tNiYkZOsfUa2IE/eO+Ngsze83nqq8S0L9O25uNbLapCDnMcbQVY3lblEQhhKn8OhgSez7d
 hI+RKBYuVTq7jTQ+3zuaVTVbMniYl0A=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B807AD2B;
 Wed, 27 Jan 2021 11:55:14 +0000 (UTC)
Date: Wed, 27 Jan 2021 12:55:13 +0100
From: Petr Mladek <pmladek@suse.com>
To: Jessica Yu <jeyu@kernel.org>
Subject: Re: [PATCH 04/13] livepatch: move klp_find_object_module to module.c
Message-ID: <YBFUoYxHjRTmKOEn@alley>
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-5-hch@lst.de> <YBAmTAsT3S01kU1x@gunter>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBAmTAsT3S01kU1x@gunter>
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
Cc: Joe Lawrence <joe.lawrence@redhat.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 live-patching@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miroslav Benes <mbenes@suse.cz>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 2021-01-26 15:25:16, Jessica Yu wrote:
> +++ Christoph Hellwig [21/01/21 08:49 +0100]:
> > To uncouple the livepatch code from module loader internals move a
> > slightly refactored version of klp_find_object_module to module.c
> > This allows to mark find_module static and removes one of the last
> > users of module_mutex outside of module.c.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> > include/linux/module.h  |  3 +--
> > kernel/livepatch/core.c | 39 +++++++++++++--------------------------
> > kernel/module.c         | 17 ++++++++++++++++-
> > 3 files changed, 30 insertions(+), 29 deletions(-)
> > 
> > diff --git a/include/linux/module.h b/include/linux/module.h
> > index b4654f8a408134..8588482bde4116 100644
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -586,8 +586,7 @@ static inline bool within_module(unsigned long addr, const struct module *mod)
> > 	return within_module_init(addr, mod) || within_module_core(addr, mod);
> > }
> > 
> > -/* Search for module by name: must hold module_mutex. */
> > -struct module *find_module(const char *name);
> > +struct module *find_klp_module(const char *name);
> > 
> > /* Check if a module is loaded. */
> > bool module_loaded(const char *name);
> > diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> > index a7f625dc24add3..878759baadd81c 100644
> > --- a/kernel/livepatch/core.c
> > +++ b/kernel/livepatch/core.c
> > @@ -49,30 +49,6 @@ static bool klp_is_module(struct klp_object *obj)
> > 	return obj->name;
> > }
> > 
> > -/* sets obj->mod if object is not vmlinux and module is found */
> > -static void klp_find_object_module(struct klp_object *obj)
> > -{
> > -	struct module *mod;
> > -
> > -	mutex_lock(&module_mutex);
> > -	/*
> > -	 * We do not want to block removal of patched modules and therefore
> > -	 * we do not take a reference here. The patches are removed by
> > -	 * klp_module_going() instead.
> > -	 */
> > -	mod = find_module(obj->name);
> > -	/*
> > -	 * Do not mess work of klp_module_coming() and klp_module_going().
> > -	 * Note that the patch might still be needed before klp_module_going()
> > -	 * is called. Module functions can be called even in the GOING state
> > -	 * until mod->exit() finishes. This is especially important for
> > -	 * patches that modify semantic of the functions.
> > -	 */
> > -	if (mod && mod->klp_alive)
> > -		obj->mod = mod;
> > -	mutex_unlock(&module_mutex);
> > -}
> 
> Hmm, I am not a huge fan of moving more livepatch code into module.c, I
> wonder if we can keep them separate.
> 
> Why not have module_is_loaded() kill two birds with one stone? That
> is, just have it return a module pointer to signify that the module is
> loaded, NULL if not. Then we don't need an extra find_klp_module()
> function just to call find_module() and return a pointer, as
> module_is_loaded() can just do that for us.
> 
> As for the mod->klp_alive check, I believe this function
> (klp_find_object_module()) is called with klp_mutex held, and
> mod->klp_alive is only modified under klp_mutex. Also, if klp_alive is
> true, the module is at least COMING and cannot be GOING until it
> acquires the klp_mutex again in klp_module_going(). So does that hunk
> really need to be under module_mutex? It has been a long time since
> I've looked at livepatch code so it would be great if someone could
> double check.

We need to make sure that the module is not freed before we manipulate
mod->klp_alive.

One solution would be to take the reference and block it during this
operation.

Alternatively it might be to rely on RCU. It seems that the struct
is protected by RCU because of kallsyms. But I am not sure if it
is safe in all module states. But it should be. We find the module
via the same list like kallsyms.

Best Regards,
Petr
