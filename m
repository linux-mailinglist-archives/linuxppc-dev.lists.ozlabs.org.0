Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2512FF78F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 22:47:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMGG86rzgzDrZD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 08:47:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jpoimboe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=LtYvSnow; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=LtYvSnow; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMGD56FPqzDr7D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 08:45:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611265547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+rDl9+7fXwTudocqpSNQ/uswuuzlXykto241XVMPhJI=;
 b=LtYvSnowX4FyFJKUJWG/a6COsyhBBlSl9V0DXLDAS0cK+rjpoff6LS25OYXst5arREi+bH
 OGpi7R0v/+Am0HiNPIxJb8+Ex8z4ebf/Pfu6bau48W8syq4x26hJXS6iUcJSitqBR9MzLi
 /j6IvhnO0MXsAnUVRVBVDrscSNqKz5g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611265547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+rDl9+7fXwTudocqpSNQ/uswuuzlXykto241XVMPhJI=;
 b=LtYvSnowX4FyFJKUJWG/a6COsyhBBlSl9V0DXLDAS0cK+rjpoff6LS25OYXst5arREi+bH
 OGpi7R0v/+Am0HiNPIxJb8+Ex8z4ebf/Pfu6bau48W8syq4x26hJXS6iUcJSitqBR9MzLi
 /j6IvhnO0MXsAnUVRVBVDrscSNqKz5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-OKLBo_BNP5yCUTW080-5Wg-1; Thu, 21 Jan 2021 16:45:42 -0500
X-MC-Unique: OKLBo_BNP5yCUTW080-5Wg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E5AC802B40;
 Thu, 21 Jan 2021 21:45:39 +0000 (UTC)
Received: from treble (ovpn-116-102.rdu2.redhat.com [10.10.116.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EF795F9B5;
 Thu, 21 Jan 2021 21:45:31 +0000 (UTC)
Date: Thu, 21 Jan 2021 15:45:29 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/13] livepatch: move klp_find_object_module to module.c
Message-ID: <20210121214529.il2ac3vk6oqogjpr@treble>
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210121074959.313333-5-hch@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 live-patching@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Yu <jeyu@kernel.org>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miroslav Benes <mbenes@suse.cz>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 21, 2021 at 08:49:50AM +0100, Christoph Hellwig wrote:
> @@ -820,14 +796,25 @@ static int klp_init_object(struct klp_patch *patch, struct klp_object *obj)
>  	const char *name;
>  
>  	obj->patched = false;
> -	obj->mod = NULL;

Why was this line removed?

>  	if (klp_is_module(obj)) {
>  		if (strlen(obj->name) >= MODULE_NAME_LEN)
>  			return -EINVAL;
>  		name = obj->name;
>  
> -		klp_find_object_module(obj);
> +		/*
> +		 * We do not want to block removal of patched modules and
> +		 * therefore we do not take a reference here. The patches are
> +		 * removed by klp_module_going() instead.
> +		 * 
> +		 * Do not mess work of klp_module_coming() and
> +		 * klp_module_going().  Note that the patch might still be
> +		 * needed before klp_module_going() is called.  Module functions
> +		 * can be called even in the GOING state until mod->exit()
> +		 * finishes.  This is especially important for patches that
> +		 * modify semantic of the functions.
> +		 */
> +		obj->mod = find_klp_module(obj->name);

These comments don't make sense in this context, they should be kept
with the code in find_klp_module().

-- 
Josh

