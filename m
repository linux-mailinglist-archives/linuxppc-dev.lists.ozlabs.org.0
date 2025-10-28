Return-Path: <linuxppc-dev+bounces-13464-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E51C16455
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 18:46:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwyTj58rYz2yjs;
	Wed, 29 Oct 2025 04:46:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761673561;
	cv=none; b=R5KhAtqdFIfSfKHI28MmLtQlgpeFM2JxYBMXZWFd4okD02/7KFwWeUVmkYIKcVnapKUNIKisXbXCwXs1kx/sz1m0o2fG6yEhj1scjWebSodLFhiBbYPDOEXMMykPzJBPE/R7DmkbV2K65+1JFeWe+GKq4cbbxMXW03nWl1DafODf/olEVV0HYV0ig52RjWCSu4MyRHY74d+U5bvlWZ85U+Es+v07vfIbdd70HKZBu+1brd+dBdhSZV5THeIQD0o4mCqV74j+2kpzT8SlrB7UPMGDWHzcKaeQeCda7/hYjp3tni0ivnYm99OjNRkKh1BjJFY+o0kMdiffSdFiS+7i+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761673561; c=relaxed/relaxed;
	bh=2mGX18mZZPvHyD8tp/SlP21jzNUQaCksFfGjxcCZFG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4TbhID7Z9q/xyCNc5RZOUJtBUxuKci+doinIfP0j/SbioI5qMrj9mZP/pOqZHMQUViFAcxqxYMRySO28nXmqOSQ5YlWCcuK2Auw7in5A3suuV0H0RENOpxgf/dQEZ7jkmdguGpZIhXs2c/NMUYIJsUhXjuPF7XY0TGd2qt0kxUSHy/Tft7BKVXghlGnw+QNMrqLUVfVlDKnB3YTIYVl5ktlWFlKg6hiswnpiEm3uMB+S3zWgug2Xj/hcOSYKNpUnci5wJ1DbzzVVT6Y9ga0GzWmidgPLbvNNQHdo/4rVKBEimMLHUuQq6buWyVye5iWgr9n16gZsYnuZbF/+rtFXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=QUl6NIix; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=QUl6NIix;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwyTh412Hz2yFv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 04:45:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2mGX18mZZPvHyD8tp/SlP21jzNUQaCksFfGjxcCZFG8=; b=QUl6NIixR/oJXVqt4B3YANU+NQ
	An/HOGXy/H+ZiEDYlQgRKgWKwvqssxz+gwDGLAME5GA/P7Qf6W6uPHxh6DWijCwvV4CcNYO/PXoT5
	YxZBFVCaU5Ea98ocoVf+/q91F1LwvtlAEGUyQ8O8zHEb4mZB0k+xjRSVz7F5gofV6A3RIqoPynnN9
	ezVcllUY59AGWdrRcZT+9Oh9asmURfIrTvNXHcX3TNV5V0uHjxp9Dz1RlWKoS/sBrDzfbCjA+ECAd
	RggfScej5M7Nnn6ExkwpClYDvlVq2rJMZSdhEkCYOdEy4KQyfIbMTYNy1dXL1QSfVewkCAh1tyQfP
	dUST2J4w==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDnlM-00000008bgd-3GJA;
	Tue, 28 Oct 2025 17:45:40 +0000
Date: Tue, 28 Oct 2025 17:45:40 +0000
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
Subject: Re: [PATCH v2 22/50] convert efivarfs
Message-ID: <20251028174540.GN2441659@ZenIV>
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
 <20251028004614.393374-23-viro@zeniv.linux.org.uk>
 <66300d81c5e127e3bca8c6c4d997da386b142004.camel@HansenPartnership.com>
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
In-Reply-To: <66300d81c5e127e3bca8c6c4d997da386b142004.camel@HansenPartnership.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28, 2025 at 08:53:45AM -0400, James Bottomley wrote:

> That dput looks misplaced in a creation routine and this is a common
> pattern in pseudo filesystems that either pre-populate the dentry state
> or create effectively unused dentries on other changes.  I know not
> every pseudo filesystem does this, but it did make me wonder if it
> should have it's own API, say d_create_persistent()?

That dput() is paired with efivarfs_alloc_dentry(); the real problem
here is different - efivarfs_create_dentry() relies upon the external
serialization.  Have it race with lookup (let alone unlink()) and
there's a lot of headache.

Most of the callers should be safe, but... I'm not sure that unfreeze
case can't run into trouble.

It might need to be fixed; I don't want to mix that with this series,
so I went for the minimal transformation here.  I suspect that we
ought to use simple_start_creating()/simple_done_creating() instead
of those efivarfs_alloc_dentry()/dput(), but I'll need to look at
the locking environments in all call chains ;-/

FWIW, having a special path for "we are in foofs_fill_super(), fuck
the locking - nobody's going to access it anyway" is not a great
idea, simply because the helpers tend to get reused on codepaths
where we can't cut corners that way.

It *may* be useful to grow a set of primitives for something like "we are
forming a detached tree, will splice it into the final position once we
are entirely done", and configfs might shed a lot of kludges if massaged
in that direction, but I'd rather see what configfs massage converges
to before settling on an API for that.

