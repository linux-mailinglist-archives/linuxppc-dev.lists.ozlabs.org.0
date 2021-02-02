Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1849030D173
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 03:26:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVltb2zw0zDqCR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:26:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jeyu@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BY/9D9Ww; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVS7s71FyzDqVV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 01:37:13 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EA0E64DD8;
 Tue,  2 Feb 2021 14:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612276631;
 bh=59H/RX/aCpZDci3/j2ROapoK3LntvgnOkKqeLSBExoU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BY/9D9WwHzXHV3rnrsxuU0DcQz++ZS4+zEjOPjc9/OVHJHNkD9pRrAGxWG86yct89
 spsDRQsLsmBukU8bUtWzDGqSf1UHtMXlOsyar1BYxqiKJGZUHOsFdPkf11uSIFH9Qr
 IUNDnpAXy7GDi69hndOCbrrQE4yQIfVKdma3R4CjrfITUh+D+4avYXaNLvWGTR4wDn
 3SaOQkpanaLTh8gQv97wPm9/HzQpzKi/b2O8G8duzYuArEHa4Td8c/jklXhu2NcE9e
 B8E7acIz+20H5HXDUSnWEx2f5jizrmOSJ11Exuk00iCVeOGUDBySpAYWwd2oTQKxuj
 AITUddLLhFuPw==
Date: Tue, 2 Feb 2021 15:37:04 +0100
From: Jessica Yu <jeyu@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: module loader dead code removal and cleanups v3
Message-ID: <YBljkDgMFcqKcH8H@gunter>
References: <20210202121334.1361503-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210202121334.1361503-1-hch@lst.de>
X-OS: Linux gunter 5.10.9-1-default x86_64
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
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+++ Christoph Hellwig [02/02/21 13:13 +0100]:
>Hi all,
>
>this series removes support for long term unused export types and
>cleans up various loose ends in the module loader.
>
>Changes since v2:
> - clean up klp_find_object_symbol a bit
> - remove the now unused module_assert_mutex helper
>
>Changes since v1:
> - move struct symsearch to module.c
> - rework drm to not call find_module at all
> - allow RCU-sched locking for find_module
> - keep find_module as a public API instead of module_loaded
> - update a few comments and commit logs

Thanks Christoph for cleaning up all that aged cruft, and thanks everyone
for the reviews.

I was curious about EXPORT_SYMBOL_GPL_FUTURE and EXPORT_UNUSED_SYMBOL
variants, and found that most of that stuff was introduced between
2006 - 2008. All the of the unused symbols were removed and gpl future
symbols were converted to gpl quite a long time ago, and I don't
believe these export types have been used ever since. So I
think it's safe to retire those export types now.

The patchset looks good so far. After Miroslav's comments are
addressed, I'll wait an extra day or two in case there are more
comments before queueing them onto modules-next. I can take the first
two patches as well provided the acks are there (I think patch 2 is
missing Daniel Vetter's ack from v1 of the series, but I'll add that
back in).

Thanks,

Jessica
