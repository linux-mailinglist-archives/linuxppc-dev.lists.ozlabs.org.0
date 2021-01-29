Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C62B308787
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 10:45:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRsrp5FwczDrYX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 20:45:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=m+vDf8Ls; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRsq85nRDzDrWZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 20:43:47 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611913418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0PVYDsEOtMHVLwKO3WRBkDYemaOm+tK3a7ZQAdkFUXQ=;
 b=m+vDf8Lsaep1Xkphb0bF+JOXSQS+ZeN/XpcjQzbGwuXp/Z48gUP6AakMj93wgIfxvq6+AA
 aiLt36DqXMOUqTW+/4QyvxsT8zuX++qqf2uQ8pnxmRFiCv/El994cdzU1jHrvu+ZCxuzBt
 BAOASE+cIhm8sysLqjXC2l+jDDs6EHU=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D683EAD26;
 Fri, 29 Jan 2021 09:43:37 +0000 (UTC)
Date: Fri, 29 Jan 2021 10:43:36 +0100
From: Petr Mladek <pmladek@suse.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/13] kallsyms: refactor {,module_}kallsyms_on_each_symbol
Message-ID: <YBPYyEvesLMrRtZM@alley>
References: <20210128181421.2279-1-hch@lst.de>
 <20210128181421.2279-6-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128181421.2279-6-hch@lst.de>
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
Cc: Jiri Kosina <jikos@kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 linux-kbuild@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Masahiro Yamada <masahiroy@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 live-patching@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 Joe Lawrence <joe.lawrence@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jessica Yu <jeyu@kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miroslav Benes <mbenes@suse.cz>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 2021-01-28 19:14:13, Christoph Hellwig wrote:
> Require an explicit call to module_kallsyms_on_each_symbol to look
> for symbols in modules instead of the call from kallsyms_on_each_symbol,
> and acquire module_mutex inside of module_kallsyms_on_each_symbol instead
> of leaving that up to the caller.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  kernel/kallsyms.c       | 6 +++++-
>  kernel/livepatch/core.c | 6 +-----
>  kernel/module.c         | 8 ++++----
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index fe9de067771c34..a0d3f0865916f9 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -177,6 +177,10 @@ unsigned long kallsyms_lookup_name(const char *name)
>  	return module_kallsyms_lookup_name(name);
>  }
>  
> +/*
> + * Iterate over all symbols in vmlinux.  For symbols from modules use
> + * module_kallsyms_on_each_symbol instead.
> + */
>  int kallsyms_on_each_symbol(int (*fn)(void *, const char *, struct module *,
>  				      unsigned long),
>  			    void *data)
> @@ -192,7 +196,7 @@ int kallsyms_on_each_symbol(int (*fn)(void *, const char *, struct module *,
>  		if (ret != 0)
>  			return ret;
>  	}
> -	return module_kallsyms_on_each_symbol(fn, data);
> +	return 0;
>  }
>  
>  static unsigned long get_symbol_pos(unsigned long addr,
> diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> index 262cd9b003b9f0..f591dac5e86ef4 100644
> --- a/kernel/livepatch/core.c
> +++ b/kernel/livepatch/core.c
> @@ -164,12 +164,8 @@ static int klp_find_object_symbol(const char *objname, const char *name,
>  		.pos = sympos,
>  	};
>  
> -	mutex_lock(&module_mutex);
> -	if (objname)
> +	if (objname || !kallsyms_on_each_symbol(klp_find_callback, &args))
>  		module_kallsyms_on_each_symbol(klp_find_callback, &args);
> -	else
> -		kallsyms_on_each_symbol(klp_find_callback, &args);
> -	mutex_unlock(&module_mutex);

This change is not needed. (objname == NULL) means that we are
interested only in symbols in "vmlinux".

module_kallsyms_on_each_symbol(klp_find_callback, &args)
will always fail when objname == NULL.

Best Regards,
Petr
