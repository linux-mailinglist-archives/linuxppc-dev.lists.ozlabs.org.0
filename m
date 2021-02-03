Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A269930D7F0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:51:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVz4P4wY8zDwy2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 21:51:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVz381Q1DzDwn8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 21:49:54 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3433A6736F; Wed,  3 Feb 2021 11:49:50 +0100 (CET)
Date: Wed, 3 Feb 2021 11:49:49 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christoph Hellwig <hch@lst.de>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Jessica Yu <jeyu@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, live-patching@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 02/13] drm: remove drm_fb_helper_modinit
Message-ID: <20210203104949.GA9909@lst.de>
References: <20210128181421.2279-1-hch@lst.de>
 <20210128181421.2279-3-hch@lst.de> <YBp8ShiKbQSPCcRx@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBp8ShiKbQSPCcRx@phenom.ffwll.local>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 03, 2021 at 11:34:50AM +0100, Daniel Vetter wrote:
> On Thu, Jan 28, 2021 at 07:14:10PM +0100, Christoph Hellwig wrote:
> > drm_fb_helper_modinit has a lot of boilerplate for what is not very
> > simple functionality.  Just open code it in the only caller using
> > IS_ENABLED and IS_MODULE, and skip the find_module check as a
> > request_module is harmless if the module is already loaded (and not
> > other caller has this find_module check either).
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Hm I thought I've acked this one already somewhere for merging through
> your tree.
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

The difference is that this new version loses the find_module entirely,
while the previous one replaced it with the module_loaded helper that
didn't make it to the second version of the series.
