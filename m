Return-Path: <linuxppc-dev+bounces-13542-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D0EC1D072
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 20:38:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxcwd6nyzz302l;
	Thu, 30 Oct 2025 06:38:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761766689;
	cv=none; b=VOwQMPp5VVeyXwHnZdBraN7lr+OFubcdT1TvmnAMbGwgvnVBQ1MQhZ0rTZEbp6AgJg2L2FaebU7qO798aJAKZK8RcVznd6Fo2rJjvvlLov0wjE8iLzTmiiJKtokYuPCKXgqNlc3bMH+f3PJW1yu9nsk4QAhoeKZ5fCfgPc7xiUxPiUZ4ttsgNFz8Q941HmynG6Z/CMU+zqxAKjZIcEa8da3cCzHjodRZUg17L0YtpnhB8twsolBWBEqiZSt+uJAzczpwNXPfBayMRu1Z7ABRoQ5QjuTiM1OAKRQimtKdT1rOfPF3+/mt3HiSOzDcEWvOqQ9Z3VTm2zktrWVPmZl38g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761766689; c=relaxed/relaxed;
	bh=O3wlz2ynSn5ZcGy2srCWEEseivI55gIJnD+HtUPEfxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBafAoQN0WuGs8+Vb1JkgEfp+npL/GlZNivSDq+gjMBHtY2S7s96Xd3VHAUnaHYFtZes6MrbSbczyGPozJFGCUaWRqntTHQgWnRjo0h5gvZKBmNnPEHEtAwPaqXhvGaqfrW1rmLCnniY4ue35PTJ5yBCCaEEGm5kBiEooMsmmAqySXHSdwVPP47CYXZn4FG60GwT9eBffXzlJ27SlW5r+/tub7ba3VE7oVXmDDUGFq7DknQiKc2P+/vHk73iDUE0wj4ZOtNTVS3pX2crs5JspNcZlRfgggcUUBATEwcfUNRGqdl1vQl+5kM5keokjqmBV1nwlFT/LBp6ERUwTqGHmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=gDSHktUU; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=gDSHktUU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxcwc6cpRz2yjm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 06:38:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O3wlz2ynSn5ZcGy2srCWEEseivI55gIJnD+HtUPEfxA=; b=gDSHktUU6QTsq14G2ZkRn8yePC
	Hzq86cB27L7IDzGmOQ4PgkSiy9xgLfqMgADtMr8DuQqi7m4vB89lz3p+i2NioSQejhH+ZWejmhFny
	5XVnwBvWfeQ4w+DXrBuHtoCWeJpnyp/cRQueiFSYZ2b2I/SZQBRaX7mJNGimhQ9z/QJ3yeRd/s4hb
	58tfvD0mBPxhhc9IfMUHEJ4XM9ximHRwZSuicgtApVI7x/xzSuXRM6l4w07JDKHJUXYpLQIfRUg09
	LpsQni2Q57A0tvpzbusesVftkmD+D02YP3tvEx7+qUqYRvQUcN6KIwG4Ua4Lk/WdekYsnfegMon4+
	NiV/QXvA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBzX-0000000F3m8-31yx;
	Wed, 29 Oct 2025 19:37:55 +0000
Date: Wed, 29 Oct 2025 19:37:55 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-fsdevel@vger.kernel.org,
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz,
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name,
	a.hindborg@kernel.org, linux-mm@kvack.org,
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	kees@kernel.org, rostedt@goodmis.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, paul@paul-moore.com,
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org,
	john.johansen@canonical.com, selinux@vger.kernel.org,
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Subject: Re: [PATCH v2 22/50] convert efivarfs
Message-ID: <20251029193755.GU2441659@ZenIV>
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
 <20251028004614.393374-23-viro@zeniv.linux.org.uk>
 <66300d81c5e127e3bca8c6c4d997da386b142004.camel@HansenPartnership.com>
 <20251028174540.GN2441659@ZenIV>
 <20251028210805.GP2441659@ZenIV>
 <CAMj1kXF6tvg6+CL_1x7h0HK1PoSGtxDjc0LQ1abGQBd5qrbffg@mail.gmail.com>
 <9f079d0c8cffb150c0decb673a12bfe1b835efc9.camel@HansenPartnership.com>
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
In-Reply-To: <9f079d0c8cffb150c0decb673a12bfe1b835efc9.camel@HansenPartnership.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 29, 2025 at 02:57:51PM -0400, James Bottomley wrote:

> I think this all looks OK.  The reason for the convolution is that
> simple_start/done_creating() didn't exist when I did the conversion ...
> although if they had, I'm not sure I'd have thought of reworking
> efivarfs_create_dentry to use them.  I tried to update some redundant
> bits, but it wasn't the focus of what I was trying to fix.
> 
> So I think the cleanup works and looks nice.
> 
> > 
> > Relying on the -EEXIST return value to detect duplicates, and
> > combining the two callbacks seem like neat optimizations to me, so
> > 
> > Acked-by: Ard Biesheuvel <ardb@kernel.org>
> > 
> > but I have to confess I am slightly out of my depth when it comes to
> > VFS stuff.
> 
> Yes, ack too.

	Umm...  FWIW, I've got a few more followups on top of that (see
#untested.efivarfs, current head at 36051c773015).  Not sure what would
be the best way to deal with that stuff - I hope to get the main series
stabilized and merged in the coming window.  Right now I'm collecting
feedback (acked-by, etc.), and there's a couple of outright bugfixes
in front of the series, so I'd expect at least a rebase to -rc4...

Hell knows - one variant would be a never-rebased branch containing
the introduction of simple_done_creating() + variant of efivarfs
patch (as posted) ported on top of that (with d_instantiate()+dget() in
place of d_make_persistent()), then have both #work.persistency and
efivarfs followups pulling that branch...  Or I could simply hold them
back until the next cycle.  Up to you - the main series is what I really
want to get out of the way ASAP, especially considering the potential for
conflicts with the stuff Neil Brown is playing with.

