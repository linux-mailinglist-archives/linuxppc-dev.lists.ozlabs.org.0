Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9796C305C60
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 14:03:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQkLs2l19zDqhH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 00:03:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=ovHxwd9v; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQkDg64SgzDqNZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 23:58:25 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611752302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rf92LTTFX4pVSu04S1qGCWjVx84cWC2RbUfV8aaylL0=;
 b=ovHxwd9vUh3DFC3tdSqrSvVBXGoeewXO7zvX/Z1ZxTpcJvFTsNg4CqY0jVrzLafIRI/IOr
 /SxIvVgLdXOEc8uCzSQppYSdFRTUf4Kin0frH1vG5ICidM8tHdpIzcCGyW77Eixiohw1qi
 X9IUpaB07dPxSu9FKXJguFEcDmxKr20=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ECBDEACBA;
 Wed, 27 Jan 2021 12:58:21 +0000 (UTC)
Date: Wed, 27 Jan 2021 13:58:21 +0100
From: Petr Mladek <pmladek@suse.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/13] livepatch: refactor klp_init_object
Message-ID: <YBFjbbuQ7sn4T7yT@alley>
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121074959.313333-4-hch@lst.de>
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

On Thu 2021-01-21 08:49:49, Christoph Hellwig wrote:
> Merge three calls to klp_is_module (including one hidden inside
> klp_find_object_module) into a single one to simplify the code a bit.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  kernel/livepatch/core.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> index f76fdb9255323d..a7f625dc24add3 100644
> --- a/kernel/livepatch/core.c
> +++ b/kernel/livepatch/core.c
> @@ -54,9 +54,6 @@ static void klp_find_object_module(struct klp_object *obj)
>  {
>  	struct module *mod;
>  
> -	if (!klp_is_module(obj))
> -		return;
> -

We need to either update the function description or keep this check.

I prefer to keep the check. The function does the right thing also
for the object "vmlinux". Also the livepatch code includes many
similar paranoid checks that makes the code less error prone
against any further changes.

Of course, it is a matter of taste.

>  	mutex_lock(&module_mutex);
>  	/*
>  	 * We do not want to block removal of patched modules and therefore

Otherwise, the patch looks fine.

Best Regards,
Petr
