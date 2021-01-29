Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6733089E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 16:30:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DS1WG00HjzDrgL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 02:30:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=mbenes@suse.cz;
 receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DS1Tb72qkzDrdg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 02:29:07 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 51971ABDA;
 Fri, 29 Jan 2021 15:29:03 +0000 (UTC)
Date: Fri, 29 Jan 2021 16:29:02 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/13] module: use RCU to synchronize find_module
In-Reply-To: <20210128181421.2279-5-hch@lst.de>
Message-ID: <alpine.LSU.2.21.2101291626080.22237@pobox.suse.cz>
References: <20210128181421.2279-1-hch@lst.de>
 <20210128181421.2279-5-hch@lst.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Petr Mladek <pmladek@suse.com>, Jiri Kosina <jikos@kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 live-patching@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 Joe Lawrence <joe.lawrence@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jessica Yu <jeyu@kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 28 Jan 2021, Christoph Hellwig wrote:

> Allow for a RCU-sched critical section around find_module, following
> the lower level find_module_all helper, and switch the two callers
> outside of module.c to use such a RCU-sched critical section instead
> of module_mutex.

That's a nice idea.
 
> @@ -57,7 +58,7 @@ static void klp_find_object_module(struct klp_object *obj)
>  	if (!klp_is_module(obj))
>  		return;
>  
> -	mutex_lock(&module_mutex);
> +	rcu_read_lock_sched();
>  	/*
>  	 * We do not want to block removal of patched modules and therefore
>  	 * we do not take a reference here. The patches are removed by
> @@ -74,7 +75,7 @@ static void klp_find_object_module(struct klp_object *obj)
>  	if (mod && mod->klp_alive)

RCU always baffles me a bit, so I'll ask. Don't we need 
rcu_dereference_sched() here? "mod" comes from a RCU-protected list, so I 
wonder.

>  		obj->mod = mod;
>  
> -	mutex_unlock(&module_mutex);
> +	rcu_read_unlock_sched();
>  }

Thanks

Miroslav
