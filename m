Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BF430D19C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 03:35:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVm4d6Bl3zDwp0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:35:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVT9w27LmzDqx9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 02:23:55 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4FA6068AFE; Tue,  2 Feb 2021 16:23:46 +0100 (CET)
Date: Tue, 2 Feb 2021 16:23:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jessica Yu <jeyu@kernel.org>
Subject: Re: module loader dead code removal and cleanups v3
Message-ID: <20210202152345.GA11849@lst.de>
References: <20210202121334.1361503-1-hch@lst.de> <YBljkDgMFcqKcH8H@gunter>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBljkDgMFcqKcH8H@gunter>
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

On Tue, Feb 02, 2021 at 03:37:04PM +0100, Jessica Yu wrote:
> The patchset looks good so far. After Miroslav's comments are
> addressed, I'll wait an extra day or two in case there are more
> comments before queueing them onto modules-next. I can take the first
> two patches as well provided the acks are there (I think patch 2 is
> missing Daniel Vetter's ack from v1 of the series, but I'll add that
> back in).

I did remove the find_module entirely compared to v1, so I'd prefer
another explicit ACK for the new version.
