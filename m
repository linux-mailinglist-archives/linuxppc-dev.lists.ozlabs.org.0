Return-Path: <linuxppc-dev+bounces-14146-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9FEC56946
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Nov 2025 10:27:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6ZfZ0lddz2yvY;
	Thu, 13 Nov 2025 20:27:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763026021;
	cv=none; b=TeYtx1RV9ESDXsV6VXNHZGLbi3IVKWCViivtQcsxjWWCc+GseFe9M9u9aWogrtih2oby/mj38Q8G2S5N8QbrdHwmYupkmI+eYjgzktM9ckrLs/VNtbjvpaDo2AIc5GSPSoELla2Dfpfmsva+nFOOBeQSz+zclVAsv/pQMu34fJiq/x4Ee8dLtL6LwSHab6/R9xv+/Pw30/pR4dLgUvsv8dBeURcfJ7XkZrR6BRa/jkr7Yhlka+mUa/dCYf/tjcNeXyVFx5q+1s96spFifqDn7FHBwDcVMJfqJ2o5gRRndz3aa7NNp8FTCNnR/EatB+pV2pXhsDGvzFF7W7W69TDyBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763026021; c=relaxed/relaxed;
	bh=LDUxCZ9a1FBEg+ndXr53elrDsetDAHrRuckIwq+rkq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPmv0Z4V0m5GD7Ca4M0AGprz4YGh044bhkJLks9xPAjk63yIKII/B3gSfRlPH9s+AzRUw+sixlQYag+SnHWkYUBp+LvQOkJQnBiQeCzBtvrGnXC0+iXzL8H0bqYQaMfkBUu58vyNYIVKshczEu5zf78Coyl4cvaSs/9n2UgfjeyXXi3OdrBDGPDHJ2t6h1vEDye+5T6QO4y0J0L6Thx/ropBNJnI8hlhaveWmVIjXSKjSCdYRBe0c01mpJ65F0qvz+oqjK82pUsTD8c77YUP2+WVxrt30niqBlFNmpL7p+WWIJlioKnyp3/MZKa7jmbhuerZ1vFLnldBE7RVR+RtjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=BZWkX6ff; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=BZWkX6ff;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6ZfV2wXwz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 20:26:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LDUxCZ9a1FBEg+ndXr53elrDsetDAHrRuckIwq+rkq0=; b=BZWkX6ff3GA3RTeDfa4driAPz2
	WEG9gIlnyiYFdtMOWlbZu9v/maRJmMXsW7OV71VZxaFQzrkQ+QdzfOvUBvZ8qNmBTAaQ0c64+1a4e
	e2Ntp0fd4Nz2PbSh3xvepolayFe8B+2k6YRJKodfIL7Czycd5Xq28Trj5RrH9AvJL7ifIGizzoNUd
	S85OBW6rXLf1OGeorqTcGvgW3AVCokPuyfp1wjY7Y3yAbmhvYTcVBNIroydt68NMMAAiPyRPwfcyz
	nXp2xc7r/dlTreE2iy/5WTgr8kPTqpleSNRGiMCmePXOZMGXGvpta32ZoNyWi03E8Avg9wVxF2qVG
	6GSVcCPw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTbA-0000000HMAd-16pF;
	Thu, 13 Nov 2025 09:26:36 +0000
Date: Thu, 13 Nov 2025 09:26:36 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bot+bpf-ci@kernel.org, linux-fsdevel@vger.kernel.org,
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz,
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name,
	a.hindborg@kernel.org, linux-mm@kvack.org,
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	kees@kernel.org, rostedt@goodmis.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, paul@paul-moore.com,
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org,
	john.johansen@canonical.com, selinux@vger.kernel.org,
	borntraeger@linux.ibm.com, bpf@vger.kernel.org, ast@kernel.org,
	andrii@kernel.org, daniel@iogearbox.net, martin.lau@kernel.org,
	eddyz87@gmail.com, yonghong.song@linux.dev, ihor.solodrai@linux.dev,
	Chris Mason <clm@meta.com>
Subject: [functionfs] mainline UAF (was Re: [PATCH v3 36/50] functionfs:
 switch to simple_remove_by_name())
Message-ID: <20251113092636.GX2441659@ZenIV>
References: <20251111065520.2847791-37-viro@zeniv.linux.org.uk>
 <20754dba9be498daeda5fe856e7276c9c91c271999320ae32331adb25a47cd4f@mail.kernel.org>
 <20251111092244.GS2441659@ZenIV>
 <e6b90909-fdd7-4c4d-b96e-df27ea9f39c4@meta.com>
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
In-Reply-To: <e6b90909-fdd7-4c4d-b96e-df27ea9f39c4@meta.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 11, 2025 at 10:44:26PM -0500, Chris Mason wrote:

> We're wandering into fuzzing territory here, and I honestly have no idea
> if this is a valid use of any of this code, but AI managed to make a
> repro that crashes only after your patch.  So, I'll let you decide.
> 
> The new review:
> 
> Can this dereference ZERO_SIZE_PTR when eps_count is 0?
> 
> When ffs->eps_count is 0, ffs_epfiles_create() calls kcalloc(0, ...) which
> returns ZERO_SIZE_PTR (0x10). The loop never executes so epfiles[0].ffs is
> never initialized. Later, cleanup paths (ffs_data_closed and ffs_data_clear)
> check if (epfiles) which is true for ZERO_SIZE_PTR, and call
> ffs_epfiles_destroy(epfiles, 0).
> 
> In the old code, the for loop condition prevented any dereferences when
> count=0. In the new code, "root = epfile->ffs->sb->s_root" dereferences
> epfile before checking count, which would fault on ZERO_SIZE_PTR.

Lovely.  OK, this is a bug.  It is trivial to work around (all callers
have ffs avaible, so just passing it as an explicit argument solves
the problem), but there is a real UAF in functionfs since all the way
back to original merge.  Take a look at

static int
ffs_epfile_open(struct inode *inode, struct file *file)
{
	struct ffs_epfile *epfile = inode->i_private;

	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
		return -ENODEV;

	file->private_data = epfile;
	ffs_data_opened(epfile->ffs);

	return stream_open(inode, file);
}

and think what happens if that (->open() of dynamic files in there)
races with file removal.  Specifically, if we get called with ffs->opened
equal to 1 due to opened ep0 and get preempted away just before the
call ffs_data_opened().  Another thread closes ep0, hitting
ffs_data_closed(), dropping ffs->opened to 0 and getting
			ffs->state = FFS_CLOSING;
			ffs_data_reset(ffs);
which calls ffs_data_clear(), where we hit
		ffs_epfiles_destroy(epfiles, ffs->eps_count);
All files except ep0 are removed and epfiles gets freed, leaving the
first thread (in ffs_epfile_open()) with file->private_data pointing
into a freed array.

open() succeeds, with any subsequent IO on the resulting file leading
to calls of
static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
{
	struct ffs_epfile *epfile = file->private_data;

and a bunch of accesses to *epfile later in that function, all of them
UAF.

As far as I can tell, the damn thing intends to prevent removals between
ffs_data_opened() and ffs_data_closed(), so other methods would be safe
if ->open() had been done right.  I'm not happy with the way that FSM
is done (the real state is a mix of ffs->state, ffs->opened and ffs->mutex,
and rules bloody awful; I'm still not entirely convinced that ffs itself
can't be freed with ffs->reset_work scheduled for execution), but that's
a separate story.  

Another variant of that scenario is with ffs->no_disconnect set;
in a sense, it's even nastier.  In that case ffs_data_closed() won't
remove anything - it will set ffs->state to FFS_DEACTIVATED, leaving
the removals for ffs_data_open().  If we have *two* threads in open(),
the first one to call ffs_data_open() will do removal; on another CPU
the second will just get past its increment of ->opened (from 1 to 2)
and move on, without waiting for anything.

IMO we should just take ffs->mutex in there, getting to ffs via
inode->i_sb->s_fs_info.  And yes, compare ffs->state with FFS_ACTIVE -
under ->mutex, without WARN_ON() and after having bumped ->opened
so that racing ffs_data_closed() would do nothing.  Not FFS_ACTIVE -
call ffs_data_closed() ourselves on failure exit.

As in

static int
ffs_epfile_open(struct inode *inode, struct file *file)
{
	strict ffs_data *ffs = inode->i_sb->s_fs_info;
	int ret;

        /* Acquire mutex */
	ret = ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK);
	if (ret < 0)
		return ret;

	ffs_data_opened(ffs);
	/*
	 * not FFS_ACTIVE - there might be a pending removal;
	 * FFS_ACITVE alone is not enough, though - we might have
	 * been through FFS_CLOSING and back to FFS_ACTIVE,
	 * with our file already removed.
	 */
	if (unlikely(ffs->state != FFS_ACTIVE ||
		     !simple_positive(file->f_path.dentry))) {
		ffs_data_closed(ffs);
		mutex_unlock(&ffs->mutex);
		return -ENODEV;
	}
	mutex_unlock(&ffs->mutex);

	file->private_data = inode->i_private;
	return stream_open(inode, file);
}

and

static int ffs_ep0_open(struct inode *inode, struct file *file)
{
        struct ffs_data *ffs = inode->i_private;
	int ret;

        /* Acquire mutex */
	ret = ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK);
	if (ret < 0)
		return ret;

	ffs_data_opened(ffs);
	if (ffs->state == FFS_CLOSING) {
		ffs_data_closed(ffs);
		mutex_unlock(&ffs->mutex);
		return -EBUSY;
	}
	mutex_unlock(&ffs->mutex);

	file->private_data = ffs;
	return stream_open(inode, file);
}

Said that, I'm _NOT_ familiar with that code; this is just from a couple
of days digging through the driver, so I would like to hear comments from
the maintainer...  Greg?

