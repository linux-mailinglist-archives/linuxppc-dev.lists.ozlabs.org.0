Return-Path: <linuxppc-dev+bounces-12485-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D94EAB8CE8A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 20:09:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTcpP5QzVz2yqg;
	Sun, 21 Sep 2025 04:09:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758391773;
	cv=none; b=mQEdm2vnywek8ts43kek3DtluVTgVRA4tWHjnvYmpNu6wq7BWGUgAgA5z95uJDdj6OOU9XeZnwAu7+1DNtyOlbuqqrFjSNitoe/vU0Yd/vwmZCx89xK435h/WJbNL7ng6HKcmB+7tvA2hkzyWqP9acJ0/WzgChCPwvGurXT1IWrBJ5hQTYVsyQIUW6s7zOGWLRM0Z8MwG6TMnA+fieTJTZF4hENKuJOrDNtwSIsTfjgQd6HhHz1N21RR4BZrIKAGur7F0zU0YDHt9klcWLK1GNj/8KbUKeXnQQQUfUexTE+bCBKFJCkDVrleyNISF7Up8LURkpUdsLkVKMO91ykAzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758391773; c=relaxed/relaxed;
	bh=6NL30/0+UZmJ+Ndqi2NTqpdBOV8RvNTpTtq6rtRPK9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adSzwx63Stve4QgUixlcDs5ALXZO+i9LbYAANNKOTNlKfXbQCFeuguksA0ARvtwtgjKPpR0Cb6ge1PCJEYM7v4x3LFm5XLQ6+KEX2NEOG7eYIaVDOvW4oOTEVwPnaY+0jM8W9QbgBVk2WxzZNA5g+v+2uik/hZ7VqMJY5o4p39vHK92n3tt95eVoHdG0EBGXcSiwHp/zSujaUNNcEPhECd9TxU+iCe/Yq+Qp08L2cIKwDD4q1DIQ0Fgaa1dQDWAtoRYK6WMcX0sEaeWo4vmuSAXDjPUbUXB/63MBpWHbdDB2tBGVaUkrxTkabGk9rdVeYWJZZlk1N9wrPg5ujdwm0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=NM79fJk4; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=NM79fJk4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTcpN59t9z2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Sep 2025 04:09:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6NL30/0+UZmJ+Ndqi2NTqpdBOV8RvNTpTtq6rtRPK9E=; b=NM79fJk4vVddI7amyfuuFalCjV
	KCwjdAr3TBi8ShghGh7DNgYuVH9L+WE3QjtxSRg3IZBe1atmcEKyONCQj9I3wo/0CEGQOZou4azRK
	2+7qBlOTxdA1xp127r7u5bM6TjwF9mONn+nwL5XucvYd3CZuGSX3BA5ysms187Yyj/wF6/86/CmTL
	WC2z/0mRVx9nm5VEhTaqI7AesxCZh6k1F+Lpz9Pus6qr4SxsrrMPq2R9tjnbIPN4krYN0ZoLm1Cek
	ZI6tJ4FtKRcLJdSKn5AdIr/wOwwbdc4jFYT2UcYCQC/FIOU5oSOQeuYce7ptP2b4JNzeCtNGNm6Zd
	bQgwQelw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v021O-000000039W5-3GQv;
	Sat, 20 Sep 2025 18:09:18 +0000
Date: Sat, 20 Sep 2025 19:09:18 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>, Ian Kent <raven@themaw.net>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Andreas Hindborg <a.hindborg@kernel.org>, linux-mm@kvack.org,
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	Kees Cook <kees@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	linuxppc-dev@lists.ozlabs.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Re: [PATCHES][RFC] the meat of tree-in-dcache series
Message-ID: <20250920180918.GL39973@ZenIV>
References: <20250920074156.GK39973@ZenIV>
 <CAHk-=wiXPnY9vWFC87sHudSDYY+wpfTrs-uxd7DBypeE+15Y0g@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiXPnY9vWFC87sHudSDYY+wpfTrs-uxd7DBypeE+15Y0g@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Sep 20, 2025 at 09:26:27AM -0700, Linus Torvalds wrote:

> Anyway, apart from that I only had one reaction: I think
> d_make_discardable() should have a
> 
>         WARN_ON(!(dentry->d_flags & DCACHE_PERSISTENT))
> 
> because without that I think it can mistakenly be used as some kind of
> "dput that always takes the dentry lock", which seems bad.
> 
> Or was that intentional for some reason?

In the end - sure, we want that.  But in the meanwhile that would require
separate variants of simple_unlink()/simple_recursive_removal()/etc.
for those filesystems that are already marking persistent ones, with
the only difference being that warning.

A lot more noise that way.

So I'd prefer to put a warning in the source for the time being.  In principle,
by the end of series as posted we are down to very few filesystems that use
simple_unlink() and friends without having marked them persistent in the
first place, so it would be possible to put a "make d_make_discardable() warn
if it's not marked persistent, add variants of simple_unlink()/simple_rmdir()/
simple_recursive_removal()/locked_recursive_removal() that would *NOT* warn
and switch the handful of unconverted users to calling those", but...

By the end of series as posted that's down to nfsctl, rpc_pipe, securityfs,
configfs and apparmorfs.  The first 3 - because they used to have subseries
of their own in separate branches, with corresponding conversion commits
sitting on top of merges (#work.nfsctl is the last of those branches).
No real obstacle to moving them into the queue, I just wanted to post it
for review before we get to -rc7.

The remaining two (configfs and apparmor) are special enough to warrant private
copies of simple_{unlink,rmdir}().  So I'd rather have that in patch adding
the warning - simple_recursive_remove() wouldn't need a separate copy that
way at all.

configfs has a separate series untangling it, but that's a separate story -
that work goes back to 2018; I want to resurrect it, but I'm not mixing it
into this pile.

appramor is... special.  They've got locking of their own, completely broken and
interspersed with regular directory locks.  John Johansen, if I understood him
correctly, has some plans re fixing that, and I'm happy not to have analysis
of their locking on my plate.  _Maybe_ it will end up close enough to the usual
tree-in-dcache to switch to that stuff, but at the moment I'd rather open-code
simple_{unlink,rmdir} in aafs_remove() and leave it at that.

