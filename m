Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0463A30BB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 18:33:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G18gT2KrLz3c1n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 02:33:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=OaCK2JwD;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Q1+SIX5f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=dsterba@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=OaCK2JwD; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Q1+SIX5f; 
 dkim-atps=neutral
X-Greylist: delayed 594 seconds by postgrey-1.36 at boromir;
 Fri, 11 Jun 2021 02:33:31 AEST
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G18fz2L4Wz305k
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 02:33:30 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id AF84E2199E;
 Thu, 10 Jun 2021 16:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623342211;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KjKhr3a6YXymIHtw/GA/lThxHjdin/LlLBM4rjmo30o=;
 b=OaCK2JwDCJzSG8mw0/KxhlY24EZJYzmrY1pCXj1ftvfhrFWiJeWwKCF6VRt/3GNGIZQTKI
 64uAumwxrCoYdgNTs61JjnnHSiudVprP6OUXn6eQhEtgRh2PJr0hss4Xc4UV44n8M0sx8X
 PenUaTJWzag3UNmGuL8gosguy0gx3Mk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623342211;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KjKhr3a6YXymIHtw/GA/lThxHjdin/LlLBM4rjmo30o=;
 b=Q1+SIX5fmet/R8yDOZj1UmQUYKVKEEmnbImI7UgkAOw2mAruK7BtMq2iRopww2P1n1GTgZ
 Q69a5hyw9tRxW6Cg==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
 by relay2.suse.de (Postfix) with ESMTP id 6326CA3B93;
 Thu, 10 Jun 2021 16:23:31 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id C6DC9DAEB9; Thu, 10 Jun 2021 18:20:46 +0200 (CEST)
Date: Thu, 10 Jun 2021 18:20:46 +0200
From: David Sterba <dsterba@suse.cz>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] btrfs: Disable BTRFS on platforms having 256K pages
Message-ID: <20210610162046.GB28158@suse.cz>
Mail-Followup-To: dsterba@suse.cz,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>
References: <a16c31f3caf448dda5d9315e056585b6fafc22c5.1623302442.git.christophe.leroy@csgroup.eu>
 <185278AF-1D87-432D-87E9-C86B3223113E@fb.com>
 <cdadf66e-0a6e-4efe-0326-7236c43b2735@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cdadf66e-0a6e-4efe-0326-7236c43b2735@csgroup.eu>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
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
Reply-To: dsterba@suse.cz
Cc: "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 Josef Bacik <josef@toxicpanda.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 10, 2021 at 04:50:09PM +0200, Christophe Leroy wrote:
> 
> 
> Le 10/06/2021 à 15:54, Chris Mason a écrit :
> > 
> >> On Jun 10, 2021, at 1:23 AM, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> >>
> >> With a config having PAGE_SIZE set to 256K, BTRFS build fails
> >> with the following message
> >>
> >> include/linux/compiler_types.h:326:38: error: call to '__compiletime_assert_791' declared with attribute error: BUILD_BUG_ON failed: (BTRFS_MAX_COMPRESSED % PAGE_SIZE) != 0
> >>
> >> BTRFS_MAX_COMPRESSED being 128K, BTRFS cannot support platforms with
> >> 256K pages at the time being.
> >>
> >> There are two platforms that can select 256K pages:
> >> - hexagon
> >> - powerpc
> >>
> >> Disable BTRFS when 256K page size is selected.
> >>
> > 
> > We’ll have other subpage blocksize concerns with 256K pages, but this BTRFS_MAX_COMPRESSED #define is arbitrary.  It’s just trying to have an upper bound on the amount of memory we’ll need to uncompress a single page’s worth of random reads.
> > 
> > We could change it to max(PAGE_SIZE, 128K) or just bump to 256K.
> > 
> 
> But if 256K is problematic in other ways, is it worth bumping BTRFS_MAX_COMPRESSED to 256K ?
> 
> David, in below mail, said that 256K support would require deaper changes. So disabling BTRFS 
> support seems the easiest solution for the time being, at least for Stable (I forgot the Fixes: tag 
> and the CC: to stable).
> 
> On powerpc, 256k pages is a corner case, it requires customised binutils, so I don't think disabling 
> BTRFS is a issue there. For hexagon I don't know.

That it blew up due to the max compressed size is a coincidence. We
could have explicit BUILD_BUG_ONs for page size or other constraints
derived from the page size like INLINE_EXTENT_BUFFER_PAGES.

And there's no such thing like "just bump BTRFS_MAX_COMPRESSED to 256K".
The constant is part of on-disk format for lzo and otherwise changing it
would impact performance so this would need proper evaluation.
