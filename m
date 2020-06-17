Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D19EF1FCBDF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 13:10:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49n2RQ0mtXzDqkg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 21:10:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=uEnXH1vp; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49n2PN1WD4zDqkg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 21:08:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6UMFO2TmbdpnJT0c5EXP2Aydp2MaQ5RYJc+GA8ZrxVg=; b=uEnXH1vpZaG2U8FFM/pYkfHc5Y
 SeAjiiS0wb4uxVIyAse/Mlkd6U3qaJ4r4kEh9T7lE+/o5L5t1dNjJ28G/NIqVe0DWG/fV4/lQHo1o
 QDwGZP0qomelniIocS0ybLZQjvlRxX/INLpmjUp5+LL4fh2HQo9F6qYCqhyg1imU2AHxFgkQk0jvm
 8nOqGDFYb7CZcfryOG0jsO4VWYAKfvslQU5aBRvXZEAb7odmsPQzoqooHS6qL3UZV2AdZFQmkWhak
 uKTLzMfmXR1ZbqokaLQoFEtbowD5zP+hhe/qVdQ+y0/QB4rOvsOqTW0JOhm+R3UUkEQZTtPszFNR9
 vDBLz4ZQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jlVvY-0007BQ-88; Wed, 17 Jun 2020 11:08:20 +0000
Date: Wed, 17 Jun 2020 04:08:20 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v4 0/3] mm, treewide: Rename kzfree() to kfree_sensitive()
Message-ID: <20200617110820.GG8681@bombadil.infradead.org>
References: <20200616015718.7812-1-longman@redhat.com>
 <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
 <20200616230130.GJ27795@twin.jikos.cz>
 <20200617003711.GD8681@bombadil.infradead.org>
 <20200617071212.GJ9499@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617071212.GJ9499@dhcp22.suse.cz>
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-btrfs@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, dsterba@suse.cz,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 James Morris <jmorris@namei.org>, kasan-dev@googlegroups.com,
 linux-wpan@vger.kernel.org, David Rientjes <rientjes@google.com>,
 Waiman Long <longman@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 linux-nfs@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 17, 2020 at 09:12:12AM +0200, Michal Hocko wrote:
> On Tue 16-06-20 17:37:11, Matthew Wilcox wrote:
> > Not just performance critical, but correctness critical.  Since kvfree()
> > may allocate from the vmalloc allocator, I really think that kvfree()
> > should assert that it's !in_atomic().  Otherwise we can get into trouble
> > if we end up calling vfree() and have to take the mutex.
> 
> FWIW __vfree already checks for atomic context and put the work into a
> deferred context. So this should be safe. It should be used as a last
> resort, though.

Actually, it only checks for in_interrupt().  If you call vfree() under
a spinlock, you're in trouble.  in_atomic() only knows if we hold a
spinlock for CONFIG_PREEMPT, so it's not safe to check for in_atomic()
in __vfree().  So we need the warning in order that preempt people can
tell those without that there is a bug here.
