Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C46F307A9A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 17:24:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRQm13jt6zDrfm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 03:24:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRQjy3PjHzDqbc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 03:22:45 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 52BE468AFE; Thu, 28 Jan 2021 17:22:41 +0100 (CET)
Date: Thu, 28 Jan 2021 17:22:40 +0100
From: Christoph Hellwig <hch@lst.de>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 03/13] livepatch: refactor klp_init_object
Message-ID: <20210128162240.GA3417@lst.de>
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-4-hch@lst.de> <YBFjbbuQ7sn4T7yT@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBFjbbuQ7sn4T7yT@alley>
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
Cc: Jiri Kosina <jikos@kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 linux-kbuild@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Masahiro Yamada <masahiroy@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 live-patching@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 Joe Lawrence <joe.lawrence@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jessica Yu <jeyu@kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miroslav Benes <mbenes@suse.cz>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 27, 2021 at 01:58:21PM +0100, Petr Mladek wrote:
> > --- a/kernel/livepatch/core.c
> > +++ b/kernel/livepatch/core.c
> > @@ -54,9 +54,6 @@ static void klp_find_object_module(struct klp_object *obj)
> >  {
> >  	struct module *mod;
> >  
> > -	if (!klp_is_module(obj))
> > -		return;
> > -
> 
> We need to either update the function description or keep this check.
> 
> I prefer to keep the check. The function does the right thing also
> for the object "vmlinux". Also the livepatch code includes many
> similar paranoid checks that makes the code less error prone
> against any further changes.

Well, the check is in the caller now where we have a conditional for
it.  So I'd be tempted to either update the comment, or just drop the
patch.
