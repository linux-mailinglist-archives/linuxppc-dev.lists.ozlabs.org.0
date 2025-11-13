Return-Path: <linuxppc-dev+bounces-14159-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F50C5A14C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Nov 2025 22:20:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6tTT5bxxz2xqk;
	Fri, 14 Nov 2025 08:20:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763068813;
	cv=none; b=KsZbvwgfm0RmbpxmdJwLlRqcPMxYqwRGBjrBr0HoYrPRi2RoTrvU5/ItaOcpumf4wOisx7kY2SF7LHAU4x7PvKI5EU13k4OHbi4VdM6CPntmXHRJGscYhgg13hZ/TOQN0rmGqrJnnLB12Z4f1agQUXKU9Khum7ZclDxI9v+3DxRvgUOamTx1z8Pqh0dGQuBvwnYT6Rndm6XkeXTM0jKj+AII1+upCF4Em1dsE+hXEcZJDH4+OJTpfI6J4x2HKv22fTvEt3lX//R0EajNcUBL0j4h+QgDGHnbuN3K/LEbhRs8KU1548v48qQvPqXgBh/gVu/V/+NYHZe8MaD2V3ppwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763068813; c=relaxed/relaxed;
	bh=3SMS7VBCa5HOAMawflIUN1T2WGvQjK05sPeyzxksjKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6ZiKGmvjaNkFHY36rWESNDae3mN5Pb924ED/mh6MzFxYfG5NwmvPyE3H0sYByQL1L2XywUTTRnINfNgAYiCXSOqTI7hY7dSfIlN9HD5Ho1n3vAQuMd67YmkoFFwvy2mu1+3jx/kb/sUR4Vo8KdwCF9r/8NIlgNrqE3nXlRVErd73zBpKmaGfFvKd5IfZ+F1wXCQhXXva6b0fL47+1ASqZ0viteurkpD1Cb94eOtRNw2ytrIfl/ptRXcVbuO/tiTi0N4+j6vXJ4/8JmkNwj9AIOibJcnzJLwyQO/rDSres1spu091XykODXMxMyy6FDEi1vOAwYwjm64pDFgawtgrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=S6rUH8FB; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=S6rUH8FB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6tTR6w7Rz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 08:20:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF1D141A32;
	Thu, 13 Nov 2025 21:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C0AC4CEF5;
	Thu, 13 Nov 2025 21:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763068809;
	bh=9y9a2c/jVOu6lhfw2KQmK7c70gHOg4s3VbgeD47eFJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S6rUH8FB57R/UUe04bwBSoaGOYGmurKvFQGiKjaRp+69RaYMny8aJztzOQraBcrQq
	 2lwrKakpi4mw3npKSHEcLjHJYPumZM6bSLsdqs+5vrFZt/jlpgeaTIxOM5qITJXPz9
	 vcfnIkmnsJ7qWYDomwahLU7DQW/0LJ2QhI+mOxNo=
Date: Thu, 13 Nov 2025 16:20:08 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: bot+bpf-ci@kernel.org, linux-fsdevel@vger.kernel.org,
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz,
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name,
	a.hindborg@kernel.org, linux-mm@kvack.org,
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
	selinux@vger.kernel.org, borntraeger@linux.ibm.com,
	bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org,
	daniel@iogearbox.net, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, ihor.solodrai@linux.dev,
	Chris Mason <clm@meta.com>
Subject: Re: [functionfs] mainline UAF (was Re: [PATCH v3 36/50] functionfs:
 switch to simple_remove_by_name())
Message-ID: <2025111316-cornfield-sphinx-ba89@gregkh>
References: <20251111065520.2847791-37-viro@zeniv.linux.org.uk>
 <20754dba9be498daeda5fe856e7276c9c91c271999320ae32331adb25a47cd4f@mail.kernel.org>
 <20251111092244.GS2441659@ZenIV>
 <e6b90909-fdd7-4c4d-b96e-df27ea9f39c4@meta.com>
 <20251113092636.GX2441659@ZenIV>
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
In-Reply-To: <20251113092636.GX2441659@ZenIV>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 13, 2025 at 09:26:36AM +0000, Al Viro wrote:
> On Tue, Nov 11, 2025 at 10:44:26PM -0500, Chris Mason wrote:
> 
> > We're wandering into fuzzing territory here, and I honestly have no idea
> > if this is a valid use of any of this code, but AI managed to make a
> > repro that crashes only after your patch.  So, I'll let you decide.
> > 
> > The new review:
> > 
> > Can this dereference ZERO_SIZE_PTR when eps_count is 0?
> > 
> > When ffs->eps_count is 0, ffs_epfiles_create() calls kcalloc(0, ...) which
> > returns ZERO_SIZE_PTR (0x10). The loop never executes so epfiles[0].ffs is
> > never initialized. Later, cleanup paths (ffs_data_closed and ffs_data_clear)
> > check if (epfiles) which is true for ZERO_SIZE_PTR, and call
> > ffs_epfiles_destroy(epfiles, 0).
> > 
> > In the old code, the for loop condition prevented any dereferences when
> > count=0. In the new code, "root = epfile->ffs->sb->s_root" dereferences
> > epfile before checking count, which would fault on ZERO_SIZE_PTR.
> 
> Lovely.  OK, this is a bug.  It is trivial to work around (all callers
> have ffs avaible, so just passing it as an explicit argument solves
> the problem), but there is a real UAF in functionfs since all the way
> back to original merge.  Take a look at
> 
> static int
> ffs_epfile_open(struct inode *inode, struct file *file)
> {
> 	struct ffs_epfile *epfile = inode->i_private;
> 
> 	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
> 		return -ENODEV;
> 
> 	file->private_data = epfile;
> 	ffs_data_opened(epfile->ffs);
> 
> 	return stream_open(inode, file);
> }
> 
> and think what happens if that (->open() of dynamic files in there)
> races with file removal.  Specifically, if we get called with ffs->opened
> equal to 1 due to opened ep0 and get preempted away just before the
> call ffs_data_opened().  Another thread closes ep0, hitting
> ffs_data_closed(), dropping ffs->opened to 0 and getting
> 			ffs->state = FFS_CLOSING;
> 			ffs_data_reset(ffs);
> which calls ffs_data_clear(), where we hit
> 		ffs_epfiles_destroy(epfiles, ffs->eps_count);
> All files except ep0 are removed and epfiles gets freed, leaving the
> first thread (in ffs_epfile_open()) with file->private_data pointing
> into a freed array.
> 
> open() succeeds, with any subsequent IO on the resulting file leading
> to calls of
> static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
> {
> 	struct ffs_epfile *epfile = file->private_data;
> 
> and a bunch of accesses to *epfile later in that function, all of them
> UAF.
> 
> As far as I can tell, the damn thing intends to prevent removals between
> ffs_data_opened() and ffs_data_closed(), so other methods would be safe
> if ->open() had been done right.  I'm not happy with the way that FSM
> is done (the real state is a mix of ffs->state, ffs->opened and ffs->mutex,
> and rules bloody awful; I'm still not entirely convinced that ffs itself
> can't be freed with ffs->reset_work scheduled for execution), but that's
> a separate story.  
> 
> Another variant of that scenario is with ffs->no_disconnect set;
> in a sense, it's even nastier.  In that case ffs_data_closed() won't
> remove anything - it will set ffs->state to FFS_DEACTIVATED, leaving
> the removals for ffs_data_open().  If we have *two* threads in open(),
> the first one to call ffs_data_open() will do removal; on another CPU
> the second will just get past its increment of ->opened (from 1 to 2)
> and move on, without waiting for anything.
> 
> IMO we should just take ffs->mutex in there, getting to ffs via
> inode->i_sb->s_fs_info.  And yes, compare ffs->state with FFS_ACTIVE -
> under ->mutex, without WARN_ON() and after having bumped ->opened
> so that racing ffs_data_closed() would do nothing.  Not FFS_ACTIVE -
> call ffs_data_closed() ourselves on failure exit.
> 
> As in
> 
> static int
> ffs_epfile_open(struct inode *inode, struct file *file)
> {
> 	strict ffs_data *ffs = inode->i_sb->s_fs_info;
> 	int ret;
> 
>         /* Acquire mutex */
> 	ret = ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK);
> 	if (ret < 0)
> 		return ret;
> 
> 	ffs_data_opened(ffs);
> 	/*
> 	 * not FFS_ACTIVE - there might be a pending removal;
> 	 * FFS_ACITVE alone is not enough, though - we might have
> 	 * been through FFS_CLOSING and back to FFS_ACTIVE,
> 	 * with our file already removed.
> 	 */
> 	if (unlikely(ffs->state != FFS_ACTIVE ||
> 		     !simple_positive(file->f_path.dentry))) {
> 		ffs_data_closed(ffs);
> 		mutex_unlock(&ffs->mutex);
> 		return -ENODEV;
> 	}
> 	mutex_unlock(&ffs->mutex);
> 
> 	file->private_data = inode->i_private;
> 	return stream_open(inode, file);
> }
> 
> and
> 
> static int ffs_ep0_open(struct inode *inode, struct file *file)
> {
>         struct ffs_data *ffs = inode->i_private;
> 	int ret;
> 
>         /* Acquire mutex */
> 	ret = ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK);
> 	if (ret < 0)
> 		return ret;
> 
> 	ffs_data_opened(ffs);
> 	if (ffs->state == FFS_CLOSING) {
> 		ffs_data_closed(ffs);
> 		mutex_unlock(&ffs->mutex);
> 		return -EBUSY;
> 	}
> 	mutex_unlock(&ffs->mutex);
> 
> 	file->private_data = ffs;
> 	return stream_open(inode, file);
> }
> 
> Said that, I'm _NOT_ familiar with that code; this is just from a couple
> of days digging through the driver, so I would like to hear comments from
> the maintainer...  Greg?
> 

Sorry for the delay.  Yes, we should be grabing the mutex in there, good
catch.  There's been more issues pointed out with the gadget code in the
past year or so as more people are starting to actually use it and
stress it more.  So if you have a patch for this, I'll gladly take it :)

thanks,

greg k-h

