Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B54B630D5B0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 09:59:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVwbt5nF4zDx2c
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 19:59:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=WCS08+UT; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVwZm2vRCzDwsr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 19:58:38 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1612342715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d0+x7egL9Qu9DyTDy1qWd3xGJ1Te9iPGoSgdl08Km7U=;
 b=WCS08+UTloQ8w9V9X07PshoidPrR3T0C1D8IT5lGC/Kr+EZJ6BkxmCkeJefyLiTP8qjIqm
 L73CpIywNQvgnRWI+YV3bh4QkOhpY1J1sxsIa7QBjlU9wJ7cEAQaiI1JSwb9Elv3FGGM2s
 k1KiS9e6wuNM+KE+AaDQDSKhT09Igb0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA166AC45;
 Wed,  3 Feb 2021 08:58:35 +0000 (UTC)
Date: Wed, 3 Feb 2021 09:58:34 +0100
From: Petr Mladek <pmladek@suse.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/13] kallsyms: refactor {,module_}kallsyms_on_each_symbol
Message-ID: <YBplukHLyaxTjrpV@alley>
References: <20210202121334.1361503-1-hch@lst.de>
 <20210202121334.1361503-6-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210202121334.1361503-6-hch@lst.de>
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

On Tue 2021-02-02 13:13:26, Christoph Hellwig wrote:
> Require an explicit call to module_kallsyms_on_each_symbol to look
> for symbols in modules instead of the call from kallsyms_on_each_symbol,
> and acquire module_mutex inside of module_kallsyms_on_each_symbol instead
> of leaving that up to the caller.  Note that this slightly changes the
> behavior for the livepatch code in that the symbols from vmlinux are not
> iterated anymore if objname is set, but that actually is the desired
> behavior in this case.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Miroslav Benes <mbenes@suse.cz>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
