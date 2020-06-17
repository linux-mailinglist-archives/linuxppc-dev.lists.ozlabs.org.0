Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F831FD97C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 01:13:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nLV44yzrzDqxW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 09:13:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.172; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0172.hostedemail.com
 [216.40.44.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nLSM4sbkzDqsN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 09:12:17 +1000 (AEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id C6BF8181D330D;
 Wed, 17 Jun 2020 23:12:13 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:965:966:967:968:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2194:2196:2198:2199:2200:2201:2393:2525:2561:2564:2682:2685:2693:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4385:4390:4395:5007:6248:6691:6742:6743:7875:7903:9025:9108:10004:10400:10848:11232:11658:11914:12043:12048:12050:12297:12438:12555:12740:12760:12895:13069:13095:13311:13357:13439:14096:14097:14180:14181:14659:14721:14777:14915:21080:21433:21451:21627:21788:21811:30054:30070:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:3, LUA_SUMMARY:none
X-HE-Tag: anger66_3706ec726e0b
X-Filterd-Recvd-Size: 3931
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Wed, 17 Jun 2020 23:12:07 +0000 (UTC)
Message-ID: <38c5745d14cff75fe264a3bc61d19fd837baf7ad.camel@perches.com>
Subject: Re: [PATCH v4 0/3] mm, treewide: Rename kzfree() to kfree_sensitive()
From: Joe Perches <joe@perches.com>
To: Denis Efremov <efremov@ispras.ru>, Waiman Long <longman@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Howells
 <dhowells@redhat.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Matthew Wilcox
 <willy@infradead.org>, David Rientjes <rientjes@google.com>
Date: Wed, 17 Jun 2020 16:12:06 -0700
In-Reply-To: <17e4fede-bab0-d93c-6964-69decc889d7d@ispras.ru>
References: <20200616015718.7812-1-longman@redhat.com>
 <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
 <17e4fede-bab0-d93c-6964-69decc889d7d@ispras.ru>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-wpan@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 David Sterba <dsterba@suse.cz>, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com,
 linux-ppp@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-06-18 at 00:31 +0300, Denis Efremov wrote:
> 
> On 6/16/20 9:53 PM, Joe Perches wrote:
> > On Mon, 2020-06-15 at 21:57 -0400, Waiman Long wrote:
> > >  v4:
> > >   - Break out the memzero_explicit() change as suggested by Dan Carpenter
> > >     so that it can be backported to stable.
> > >   - Drop the "crypto: Remove unnecessary memzero_explicit()" patch for
> > >     now as there can be a bit more discussion on what is best. It will be
> > >     introduced as a separate patch later on after this one is merged.
> > 
> > To this larger audience and last week without reply:
> > https://lore.kernel.org/lkml/573b3fbd5927c643920e1364230c296b23e7584d.camel@perches.com/
> > 
> > Are there _any_ fastpath uses of kfree or vfree?
> > 
> > Many patches have been posted recently to fix mispairings
> > of specific types of alloc and free functions.
> 
> I've prepared a coccinelle script to highlight these mispairings in a function
> a couple of days ago: https://lkml.org/lkml/2020/6/5/953
> I've listed all the fixes in the commit message. 
> 
> Not so many mispairings actually, and most of them are harmless like:
> kmalloc(E) -> kvfree(E)
> 
> However, coccinelle script can't detect cross-functions mispairings, i.e.
> allocation in one function, free in another funtion.

Hey Denis, thanks for those patches.

If possible, it's probably better to not require these pairings
and use a single standard kfree/free function.

Given the existing ifs in kfree in slab/slob/slub, it seems
likely that adding a few more wouldn't have much impact.


