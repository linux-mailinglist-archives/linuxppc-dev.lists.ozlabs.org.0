Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5B44AF59F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 16:43:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jv40k5HWCz3bPM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 02:43:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=SdlN6/o0;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0X+aVbHt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=mbenes@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=SdlN6/o0; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=0X+aVbHt; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jv40258nmz2ybK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 02:42:58 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7205821106;
 Wed,  9 Feb 2022 15:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644421375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cPanT84froBQDy0fnPPljPjc/sJJc6UFVNaQtZQNyJo=;
 b=SdlN6/o0bkHJLdF7/rqstxANEqRu2FGQdADvtFm36FXgWN7qy8cv5E9FmMIqemtYqj5JCx
 jcFKtYvkxRDAXyWddaU5BJQjRCKUXa8uB96+IfTENqG3s4IjsNq2JfIo9n1aVAoh4vUxkN
 ye8z9cU4lRKUrZHOL79VeCmsS2uUcBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644421375;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cPanT84froBQDy0fnPPljPjc/sJJc6UFVNaQtZQNyJo=;
 b=0X+aVbHtAO76L1P2h7Y2RgH4e7i5tXnnZmX6Tcr6MKy1WuACuL/CGsKG7z3DXWtcr4kHZJ
 FFE4oGuZFBJRVUCA==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5BFF8A3B88;
 Wed,  9 Feb 2022 15:42:55 +0000 (UTC)
Date: Wed, 9 Feb 2022 16:42:55 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 0/5] Allocate module text and data separately
In-Reply-To: <cover.1643282353.git.christophe.leroy@csgroup.eu>
Message-ID: <alpine.LSU.2.21.2202091639491.32090@pobox.suse.cz>
References: <cover.1643282353.git.christophe.leroy@csgroup.eu>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 27 Jan 2022, Christophe Leroy wrote:

> This series allow architectures to request having modules data in
> vmalloc area instead of module area.
> 
> This is required on powerpc book3s/32 in order to set data non
> executable, because it is not possible to set executability on page
> basis, this is done per 256 Mbytes segments. The module area has exec
> right, vmalloc area has noexec. Without this change module data
> remains executable regardless of CONFIG_STRICT_MODULES_RWX.
> 
> This can also be useful on other powerpc/32 in order to maximize the
> chance of code being close enough to kernel core to avoid branch
> trampolines.
> 
> Changes in v2:
> - Dropped first two patches which are not necessary. They may be added back later as a follow-up series.
> - Fixed the printks in GDB
> 
> Christophe Leroy (5):
>   modules: Always have struct mod_tree_root
>   modules: Prepare for handling several RB trees
>   modules: Introduce data_layout
>   modules: Add CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
>   powerpc: Select ARCH_WANTS_MODULES_DATA_IN_VMALLOC on book3s/32 and
>     8xx
> 
>  arch/Kconfig                |   6 ++
>  arch/powerpc/Kconfig        |   1 +
>  include/linux/module.h      |   8 ++
>  kernel/debug/kdb/kdb_main.c |  10 +-
>  kernel/module.c             | 193 +++++++++++++++++++++++++-----------
>  5 files changed, 156 insertions(+), 62 deletions(-)

Looks good to me apart from the typo I mentioned at v1. I will review 
again once it is rebased on Aaron's patch set.

Regards,
Miroslav
