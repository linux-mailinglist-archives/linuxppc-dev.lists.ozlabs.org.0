Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6FD30A6DF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 12:52:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTmXM1SSHzDq8x
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 22:52:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTmPy627NzDq8M
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Feb 2021 22:46:59 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 56C7C6736F; Mon,  1 Feb 2021 12:46:49 +0100 (CET)
Date: Mon, 1 Feb 2021 12:46:49 +0100
From: Christoph Hellwig <hch@lst.de>
To: Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH 04/13] module: use RCU to synchronize find_module
Message-ID: <20210201114649.GA19696@lst.de>
References: <20210128181421.2279-1-hch@lst.de>
 <20210128181421.2279-5-hch@lst.de>
 <alpine.LSU.2.21.2101291626080.22237@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.21.2101291626080.22237@pobox.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 29, 2021 at 04:29:02PM +0100, Miroslav Benes wrote:
> >  
> > -	mutex_lock(&module_mutex);
> > +	rcu_read_lock_sched();
> >  	/*
> >  	 * We do not want to block removal of patched modules and therefore
> >  	 * we do not take a reference here. The patches are removed by
> > @@ -74,7 +75,7 @@ static void klp_find_object_module(struct klp_object *obj)
> >  	if (mod && mod->klp_alive)
> 
> RCU always baffles me a bit, so I'll ask. Don't we need 
> rcu_dereference_sched() here? "mod" comes from a RCU-protected list, so I 
> wonder.

rcu_dereference* is only used for dereferencing points where that
reference itself is RCU protected, that is the lookup of mod itself down
in find_module_all in this case.
