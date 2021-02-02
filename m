Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCE330D140
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 03:11:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVlY705xnzDqsG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:11:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=mbenes@suse.cz;
 receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVRV345DrzDqvh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 01:07:55 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 50039B0C6;
 Tue,  2 Feb 2021 14:07:52 +0000 (UTC)
Date: Tue, 2 Feb 2021 15:07:51 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/13] module: pass struct find_symbol_args to find_symbol
In-Reply-To: <20210202121334.1361503-11-hch@lst.de>
Message-ID: <alpine.LSU.2.21.2102021504550.570@pobox.suse.cz>
References: <20210202121334.1361503-1-hch@lst.de>
 <20210202121334.1361503-11-hch@lst.de>
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

>  void *__symbol_get(const char *symbol)
>  {
> -	struct module *owner;
> -	const struct kernel_symbol *sym;
> +	struct find_symbol_arg fsa = {
> +		.name	= symbol,
> +		.gplok	= true,
> +		.warn	= true,
> +	};
>  
>  	preempt_disable();
> -	sym = find_symbol(symbol, &owner, NULL, NULL, true, true);
> -	if (sym && strong_try_module_get(owner))
> -		sym = NULL;
> +	if (!find_symbol(&fsa) || !strong_try_module_get(fsa.owner)) {

I think this should be in fact

  if (!find_symbol(&fsa) || strong_try_module_get(fsa.owner)) {

to get the logic right (note the missing !). We want to return NULL if 
strong_try_module_get() does not succeed for a found symbol.

> +		preempt_enable();
> +		return NULL;
> +	}
>  	preempt_enable();
> -
> -	return sym ? (void *)kernel_symbol_value(sym) : NULL;
> +	return (void *)kernel_symbol_value(fsa.sym);
>  }
>  EXPORT_SYMBOL_GPL(__symbol_get);

Miroslav
