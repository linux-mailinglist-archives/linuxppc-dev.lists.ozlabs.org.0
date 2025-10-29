Return-Path: <linuxppc-dev+bounces-13482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6F4C1845F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 06:11:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxFhJ5YWSz3bfV;
	Wed, 29 Oct 2025 16:11:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761714672;
	cv=none; b=AZHr/PtDPd6kKyVTV0O13aMAY0/gPhJeTZ4J8D/5XP/FdZxCK7XxUCynr32prus57/JVSy9C9PPlULJYHMEqVsIX/0dFvQ3PLSjJcTJq5LsXTP/rj/b53eIjv+OPG4C59/ef/lH6Z+NiwxH492otqTa3NfXYnowA6QqmVPJ+KIoanKiuQWkHs4BABiQd7udgHpB9JGQNf1O0KItdha1ylt6LyngSS79k4AofSK5CQO47yDFNVG4lEx8F27kJYeiJe+u8ObgRZ/4KsNJliS5diLhPf/8XhjE0aC6Ygd2pNhawhGsO69nvugZvQhLdHfgjE6Jh40e0/7szyyyuijNnqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761714672; c=relaxed/relaxed;
	bh=/BYNoVmF3YbRiY0Hi/9O43xTzLl3/EW8MXOY/56GuA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4y8zeK+rmiWYK+F7mN5+oUmPM8etI0XtOgbaSZH+cG3TbkEK+v5KGguzz6yQIAu/hdRyXZ+ArvHweBCq+XtUjNBdVJU5rXvi9t3Aa7vTV/vKEiJSZKCv00Z50cWgXb178mB7SErCdVlQv1Xguyo6wElUGQJCeSQhrnCIXBWNlmCLZuTCGNOk7x+EnHVzQjN5wHTuN8745bhZZY2g1wdACrVdjcHI7a2P3gYwOsanZI6y5UqtxoVLD0X1/jvA2IzV47Pa+WnHIFXlbzyPZmqMZaj+3hgjyrviw5u4x6bksIURC3GO3BwJdVflM9Cn/KNReVaXyfJD+kUV4JREEyUBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=E4trfwDo; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=E4trfwDo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxFhC21h8z2xQ2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 16:11:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/BYNoVmF3YbRiY0Hi/9O43xTzLl3/EW8MXOY/56GuA0=; b=E4trfwDo1S01UKwsa2CrgAOcSE
	ptoeCiFK8So4wlImp/8pjz/VBvtXHnB8B5MDyRYvg1yqGLdg6Tf92LaQjfNi1cdedAP3agZ1WbcNp
	Toh2ZJ7N4fK8LWTgaEb9En4+6sGHZB9iL6nmh7258KhX1IkLOZPj8HC/XgwqzmmEtafzypODzG5bt
	fwomHrB116rASJMqP4x4UdJNY2tD4SGar04GPmSHSEnVu+68QC/yQYWY/mzF2frEWxOl8gDK0uEy9
	OVrO/Ud3CraTGrePIC97bq2rxP3pXsm5U9cT7uuVndAVbke/jLFpn9/5dW08qyUL1FvIPrqIxPapE
	7bfmXpZQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDySS-00000000Yic-41sk;
	Wed, 29 Oct 2025 05:10:53 +0000
Date: Wed, 29 Oct 2025 05:10:52 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
	brauner@kernel.org, jack@suse.cz, raven@themaw.net,
	miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org,
	linux-mm@kvack.org, linux-efi@vger.kernel.org,
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
	selinux@vger.kernel.org, borntraeger@linux.ibm.com,
	bpf@vger.kernel.org
Subject: Re: [PATCH v2 06/50] primitives for maintaining persisitency
Message-ID: <20251029051052.GR2441659@ZenIV>
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
 <20251028004614.393374-7-viro@zeniv.linux.org.uk>
 <6d69842d102a496a9729924358c0267f00b170f3.camel@HansenPartnership.com>
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
In-Reply-To: <6d69842d102a496a9729924358c0267f00b170f3.camel@HansenPartnership.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28, 2025 at 08:38:00AM -0400, James Bottomley wrote:
> On Tue, 2025-10-28 at 00:45 +0000, Al Viro wrote:
> [...]
> > +void d_make_discardable(struct dentry *dentry)
> > +{
> > +	spin_lock(&dentry->d_lock);
> > +	dentry->d_flags &= ~DCACHE_PERSISTENT;
> > +	dentry->d_lockref.count--;
> > +	rcu_read_lock();
> > +	finish_dput(dentry);
> > +}
> > +EXPORT_SYMBOL(d_make_discardable);
> 
> I was going to ask why you don't have a WARN_ON if the dentry is not
> persistent here.  Fortunately I read the next patch which gives the
> explanation and saw that you do do this in patch 50.  For those of us
> who have a very linear way of reading and responding to patches, it
> would have been helpful to put a comment at the top saying something
> like persistency will be checked when all callers are converted, which
> you can replace in patch 50.

Point...  How about
void d_make_discardable(struct dentry *dentry)
{
	spin_lock(&dentry->d_lock);
	/*
	 * By the end of the series we'll add 
	 * WARN_ON(!(dentry->d_flags & DCACHE_PERSISTENT);
	 * here, but while object removal is done by a few common helpers,
	 * object creation tends to be open-coded (if nothing else, new inode
	 * needs to be set up), so adding a warning from the very beginning 
	 * would make for much messier patch series.  
	 */
	dentry->d_flags &= ~DCACHE_PERSISTENT;
	dentry->d_lockref.count--;
	rcu_read_lock();  
	finish_dput(dentry);
}

at that point of the series, with comment replaced with WARN_ON() in
#50?

