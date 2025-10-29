Return-Path: <linuxppc-dev+bounces-13536-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 661BEC1C9C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 18:55:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxZf11m1tz2xlK;
	Thu, 30 Oct 2025 04:55:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761760521;
	cv=none; b=GfCARtSuwRHqLzumlf/CbbKzaOisWGR/qiVnibHvA/ZebNl0VSqrjS7tBcu264WvO7Z1FfNs/a9ZX8lXa9S4GIwgXKqaxP4A7v7cVmbhgf3teX/6KrxcKdgm5wRnR9BCdCdsR1xVLaJY6HquDxnCO7tYDv8mM4eFxcYWbdKEhGs1TgdKzeoTVfKGkWVH7SQYyEH2KZMzHrd+KE+xLXAX7/YBvAPGEhFwCSUPo1nqRjVvF7z0WwR/KJvSAwo1T3Ih7ZHlpGY/9vd9J9jTT5KCqTmQYcoYdtOq/l2SstNz/AVZ27x0hks5jIBqIa0QZVk5Yf5dT0YdJ5WNSerCvzJ3lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761760521; c=relaxed/relaxed;
	bh=hxMUsVatKbWhonDVOdoqCw+QvpkWu6d9zu8seRb9LV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n70whtYsCFrn/VFdKe4CsFNAaB6IHG0au8Ra7dDQVj/i+czpeFoK363UE8oVM+iM04rJnEOdwVjM3nwgnR9b9QYURN6MJIIDd9kQR2jrSLar1/WCRdrCJC1XpYapfghmIjxGSui8hFS3u2Xk1pr0WkJsMhXbT61Z9xFHUPsWjNnf9sMM6jZ9L4Ymz2CYHxpqdCNAxfPkVfuEw5vkKknnKmvWivN7LC8ilBwhZoK9+CyJ9CwKuLMJt2aSWZ2973KkJzJWodaxF09eWrvS9YsvDIi8LvliJbT7DMsHe9ddnBeObvgNkGNVoTKBGwgwSJq22/cnnaDJIi+/1J3LAGuLqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=ZqaowaHD; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=ZqaowaHD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxZdw194Sz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 04:55:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hxMUsVatKbWhonDVOdoqCw+QvpkWu6d9zu8seRb9LV0=; b=ZqaowaHDIWj01NIds+0TIejsHt
	XNcqF3EBDGWDHrewmjlpyIq2j0AgqblkrtlOkNOTt0EWqIzLaIERrwPKq5f9eNXMv1aTIGZLrQ1HH
	rg+ZORmt81RyG2qU67dv5WXr9ri4iBeQWNdeCGFu2fJJBw6MQcvPU6Grbx5t8CCUE+O3sDZ3z4Rll
	aINFtyxUrztNEHbgUWxk5lOkAAe1TpMz3bbiONo/ap2hMi1ciYOvoU4Vv8C738OFzygsdk1MinKCa
	dWoo2gHYZrrQJ6fr+RoKVyeWfb/xKGz1vuqhGzuDHVmJn/TDzmK0rUjeCaSxWOI8aYuDR7FgWfWEr
	uT4IVvCQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEANx-0000000D7rD-0xCn;
	Wed, 29 Oct 2025 17:55:01 +0000
Date: Wed, 29 Oct 2025 17:55:01 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Mark Tinguely <mark.tinguely@oracle.com>
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
Subject: Re: [External] : [PATCH v2 07/50] convert
 simple_{link,unlink,rmdir,rename,fill_super}() to new primitives
Message-ID: <20251029175501.GS2441659@ZenIV>
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
 <20251028004614.393374-8-viro@zeniv.linux.org.uk>
 <3ec6f671-c490-42f2-b38b-f1fa20c60da2@oracle.com>
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
In-Reply-To: <3ec6f671-c490-42f2-b38b-f1fa20c60da2@oracle.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 29, 2025 at 09:02:33AM -0500, Mark Tinguely wrote:
> On 10/27/25 7:45 PM, Al Viro wrote:
> > Note that simple_unlink() et.al. are used by many filesystems; for now
> > they can not assume that persistency mark will have been set back
> > when the object got created.  Once all conversions are done we'll
> > have them complain if called for something that had not been marked
> > persistent.
> > 
> > Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> > ---
> >   fs/libfs.c | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fs/libfs.c b/fs/libfs.c
> > index a033f35493d0..80f288a771e3 100644
> > --- a/fs/libfs.c
> > +++ b/fs/libfs.c
> 
> ...
> 
> >   EXPORT_SYMBOL(simple_unlink);
> > @@ -1078,7 +1077,8 @@ int simple_fill_super(struct super_block *s, unsigned long magic,
> >   		simple_inode_init_ts(inode);
> >   		inode->i_fop = files->ops;
> >   		inode->i_ino = i;
> > -		d_add(dentry, inode);
> > +		d_make_persistent(dentry, inode);
> > +		dput(dentry);
> >   	}
> >   	return 0;
> >   }
> 
> Putting on the dunce hat for the rest of us:
> 
> I think I understand the dput() for d_add() changes, but it is non-obvious.
> Thinking of future maintenance, you may want to make a comment.

As in
		dput(dentry);	// paired with d_alloc_name()
or
		dput(dentry);	// that would've been simple_done_creating(),
				// if we bothered with directory lock here
or...?

The thing is, d_alloc_name()/dput() instead of simple_start_creating()/
simple_done_creating() is a bit of a shortcut, possible since we
	* know that in this case nobody else could access that fs
(we are in the middle of setting it up)
	* know that directory we are populating started empty (we'd just
created it) and nobody else had a chance to mess with it (see above)
	* trust the caller to have all names in files[] array valid and
unique

And for simple_fill_super() that's pretty straightforward, but in other 
cases...  Rationale for taking that shortcut needs to be good.

