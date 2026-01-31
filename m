Return-Path: <linuxppc-dev+bounces-16475-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKM/MJ9VfWn9RQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16475-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 02:06:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E22BFDA9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 02:06:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2vph1Xfvz2yGM;
	Sat, 31 Jan 2026 12:06:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769821596;
	cv=none; b=in6yOwOZkvxfZjnjO6yNBVWgDkDu1JOXfHrdt8rv0XUWlwFyoDsxB9gaI0nVOcf6O3qKzYLE64gjiqfeScQOaZK47CXJsbpHcUsDqkwrGN8WMwc4wyhaSSK1ur5vmEyZnxhw6J8IwwNPiX7BiXt/KnHxQkoUNdKpXX6okaIA4vHqULqDcHvTMd/Rn2z213PBk8kbBNSFTkqcMNbGeBrIJYnfzHIXVei5AhVKHqUZlp9yoF95FQZLUgQdo0RpD7zGnKOEO1aY2V9Hx7W61xWOkfjXIDek2uojzIR/afrzu+YgXRz08NT56mEz0sLRvQwATl9P9JkEKDWzYEAqUOrBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769821596; c=relaxed/relaxed;
	bh=j6niAf9hGe4w9oPvmCTGyNtjBKea5D0eR+MRPWb1Frg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFAkUKg1ggMFZqgwt1Nsyw4sGQ94ZFMvR0mMI/NiXuQ3dpUCdP4dRa8uz50sIbiMZBd5+bUqHAUHTBhehzdMaEMBAx7eE4LGXkWuNWtJO0BTJja6v/lBRxtSBix+RTcPmj2uLPGApp1+yxLe9pvRsLZ2f4xDb30GIfXiBRmz0ErC8YKkwcFPyiOlr1fKiy71i8/GiK2FcYH96z4X6Y8x+1tr8OJN/+kn4ZOxeK6xFgkNAeHEe+J7upU5cQrtqf+w13hKN9Wu07FCtt+eF8/6F56H0a2TLOMQ7eOR2HA6vRoRSV0elyI8uV179dDJbSJkmI0idJXSjUiMWBoVgT2I1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=bgRCHe/1; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=bgRCHe/1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2vpg3Bm6z2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 12:06:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j6niAf9hGe4w9oPvmCTGyNtjBKea5D0eR+MRPWb1Frg=; b=bgRCHe/1HuJX1btyYG1KNZ3vno
	TCqbEHHU6qGFN6p0raUIHroX/2Mch+Dje7lhnqFfAJqsXO6HOqA7hIbTc5Ox2EyVbbOISxAEFdnC6
	W6r9RbXH0cnnhzNCiUhyza8AQbuIL4q3umghKXNiUTquST9A8JtmhoMfurM+zy30Rr9a+EJlhTbz4
	mYdFlsgU/wLW6TW33NJuVF5q5MA2CVNgEEq5fEtx1mxQWuXErxAlK11j+2i67Fvpc3vfpacoulXyo
	qXmAQ2zn5lax6oOz0fp9VhU1n6CsYyGOFMeanmsPrwfxDcQRKBhE1jubjYt0zbsFP4o9GMz2qqGl5
	v717ALhA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1vlzTJ-0000000D8c0-0LnE;
	Sat, 31 Jan 2026 01:08:21 +0000
Date: Sat, 31 Jan 2026 01:08:21 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Samuel Wu <wusamuel@google.com>, Greg KH <gregkh@linuxfoundation.org>,
	linux-fsdevel@vger.kernel.org, brauner@kernel.org, jack@suse.cz,
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name,
	a.hindborg@kernel.org, linux-mm@kvack.org,
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
	selinux@vger.kernel.org, borntraeger@linux.ibm.com,
	bpf@vger.kernel.org, clm@meta.com,
	android-kernel-team <android-kernel-team@google.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
Message-ID: <20260131010821.GY3183987@ZenIV>
References: <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV>
 <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
 <20260129032335.GT3183987@ZenIV>
 <20260129225433.GU3183987@ZenIV>
 <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
 <20260130070424.GV3183987@ZenIV>
 <CAG2Kctoqja9R1bBzdEAV15_yt=sBGkcub6C2nGE6VHMJh13=FQ@mail.gmail.com>
 <20260130235743.GW3183987@ZenIV>
 <CAHk-=wgk7MRBj4iwQLHocVCa94Jf0cMEz2HzUAS9+6rGtnp4JA@mail.gmail.com>
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
In-Reply-To: <CAHk-=wgk7MRBj4iwQLHocVCa94Jf0cMEz2HzUAS9+6rGtnp4JA@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[zeniv.linux.org.uk,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linux.org.uk:s=zeniv-20220401];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[viro@zeniv.linux.org.uk,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:wusamuel@google.com,m:gregkh@linuxfoundation.org,m:linux-fsdevel@vger.kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:raven@themaw.net,m:miklos@szeredi.hu,m:neil@brown.name,m:a.hindborg@kernel.org,m:linux-mm@kvack.org,m:linux-efi@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:kees@kernel.org,m:rostedt@goodmis.org,m:linux-usb@vger.kernel.org,m:paul@paul-moore.com,m:casey@schaufler-ca.com,m:linuxppc-dev@lists.ozlabs.org,m:john.johansen@canonical.com,m:selinux@vger.kernel.org,m:borntraeger@linux.ibm.com,m:bpf@vger.kernel.org,m:clm@meta.com,m:android-kernel-team@google.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16475-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viro@zeniv.linux.org.uk,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.org.uk:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.org.uk:email,linux.org.uk:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C2E22BFDA9
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 04:14:48PM -0800, Linus Torvalds wrote:
> On Fri, 30 Jan 2026 at 15:55, Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > So we have something that does O_NDELAY opens of ep0 *and* does not retry on
> > EAGAIN?
> >
> > How lovely...
> 
> Actually, I think that is pretty normal behavior.
> 
> Generally, O_NDELAY and friends should *NOT* turn locks into trylocks
> - because user space has no sane way to deal with kernel lock issues,
> and user space simply shouldn't care.
> 
> So O_NDELAY should be about avoiding IO, not about avoiding perfectly
> normal locks.
> 
> Of course, that horrendous driver locking is broken, since it holds
> the lock over IO, so that driver basically conflates IO and locking,
> and that's arguably the fundamental problem here.
> 
> But I suspect that for this case, we should just pass in zero to
> ffs_mutex_lock() on open, and say that the O_NONBLOCK flag is purely
> about the subsequent IO, not about the open() itself.
> 
> That is, after all, how the driver used to work.

I'd rather go for a spinlock there, protecting these FFS_DEACTIVATED
transitions; let me try and put together something along those lines.
Matter of fact, I would drop the atomics for ->opened completely
and do all changes under the same spinlock - it's really just
->open() and ->release().  Simpler that way...

The shitty part is that ->set_alt() thing and its callers seems to
be written in assumption that it can come from an interrupt, so we'd
need spin_lock_irq() in open/release and spin_lock_irqsave() in
set_alt/disable...

Another fun part is that we need a barrier on transition from
FFS_CLOSING in ffs_data_reset() - right now it's not even the last
assignment in there.  Same spinlock would solve that - screw explicit
barriers, it's _not_ a hot path and the locking is convoluted enough
as it is.

