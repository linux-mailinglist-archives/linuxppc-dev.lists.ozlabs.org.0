Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D33087A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 11:05:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRtJh2hbfzDrfW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 21:05:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=s0Jljl1g; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRtGv1J7dzDrdg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 21:04:21 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611914657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qNxzpumQOIuAdqIOWix8LagkCKY10qlSAVohdhIWCVg=;
 b=s0Jljl1gns8wLO9nXDS+CpmTLJ+z+ETchZ3Bs350di4FEOEEZeHSpbMlCueoIW9JJMb9W4
 VmFPnZC8KoLJyVf3sHmKgIToROzuPgGFbf2mjw1SJTTThlW9qvL1gLd/m13ngQbc+7RGqo
 iyQbIW7CxAsNNLuIEHKxQtodn/uN7xQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AD9ACAF7A;
 Fri, 29 Jan 2021 10:04:17 +0000 (UTC)
Date: Fri, 29 Jan 2021 11:04:17 +0100
From: Petr Mladek <pmladek@suse.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/13] module: use RCU to synchronize find_module
Message-ID: <YBPdocTviQc2aaC5@alley>
References: <20210128181421.2279-1-hch@lst.de>
 <20210128181421.2279-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128181421.2279-5-hch@lst.de>
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

On Thu 2021-01-28 19:14:12, Christoph Hellwig wrote:
> Allow for a RCU-sched critical section around find_module, following
> the lower level find_module_all helper, and switch the two callers
> outside of module.c to use such a RCU-sched critical section instead
> of module_mutex.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

It looks good and safe.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
