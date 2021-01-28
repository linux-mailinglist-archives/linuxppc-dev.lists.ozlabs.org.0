Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D16307A5E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 17:12:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRQTd00tGzDrdN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 03:12:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRQRM43mxzDrcC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 03:10:05 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A3B7068AFE; Thu, 28 Jan 2021 17:09:57 +0100 (CET)
Date: Thu, 28 Jan 2021 17:09:57 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jessica Yu <jeyu@kernel.org>
Subject: Re: [PATCH 13/13] module: remove EXPORY_UNUSED_SYMBOL*
Message-ID: <20210128160957.GA2504@lst.de>
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-14-hch@lst.de> <YBFvcmUiHRjkucbf@gunter>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBFvcmUiHRjkucbf@gunter>
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
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

On Wed, Jan 27, 2021 at 02:49:38PM +0100, Jessica Yu wrote:
>> #ifdef CONFIG_MODULE_SIG
>> 	/* Signature was verified. */
>> 	bool sig_ok;
>> @@ -592,7 +580,6 @@ struct symsearch {
>> 		GPL_ONLY,
>> 		WILL_BE_GPL_ONLY,
>> 	} license;
>> -	bool unused;
>> };

> Thanks for the cleanups. While we're here, I noticed that struct
> symsearch is only used internally in kernel/module.c, so I don't think
> it actually needs to be in include/linux/module.h. I don't see it used
> anywhere else. We could move maybe that to kernel/module-internal.h.

I've added a patch to just move it directly into module.c.
