Return-Path: <linuxppc-dev+bounces-14179-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B37C5CE72
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 12:42:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7Fcs3R9Gz2yx7;
	Fri, 14 Nov 2025 22:42:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763120573;
	cv=none; b=ddFf7XHWFVS7KF86HfKR49WCm7lM8OsSnor+BwjcWzbbQT+J7QiNUthMpvXabff2CVMNNxCVaPxHL1lbvJk3/maEL2l/ujl4j9NgyosajMfnzFE3hr1LmAgEUSsncaK27+CmSLLo27n1qlcxbTnaBsrfh259a+HJAL8RQryDps7xkYOVupSQeduIfRI3emG8A7RstEE3V9NEpgHSdaJ6MeUiQj1QwFli/MQ6qQMcHvSWqI51gtPvp6V6os5LrmFSnZXPYK94YLK52k2/dq0p4GV+MSCr59gTr2S96UUKDjg4axtB/qdt6Q+1FXGcHGjHrz2g5sMaQI0LhUoGDF0gIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763120573; c=relaxed/relaxed;
	bh=pSa4YzVp8h2bYoRAUikxeeiupwQSNFXdKAeGXPBV9Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6laQpOx9jORQWsmlqg/PsNp9d0DE0xDfXG4za7d8zyvyAV9TWACGdzrPjB8rK5mJ1n9pLlfeEowF6dQitkBVJ9mcrC8rtvX1yf4FrObvvrpsWwr2EsucmZJ9qVBghK80UgTM8flneE5Xuyb1M55XYV0bJoB0LCj5LK0xF48a822a5RopTGdFP2pRma8gpb17yg/FMHbwDKy8jnNj5pGdT8RfqzjnnBR1BHzLzAm83TwunsQJBLcOiaM42ZI39nM+6HBKE+J8F5QiblET5uHA2XvJY7cam6YDrI+VhdfDVkgEzxfVQJhOoAO/nnl2UdDGOIe+tiQrP3PgPWHA4q88Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q8fkkteN; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q8fkkteN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7Fcr2w7pz2yvN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 22:42:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 198CC60175;
	Fri, 14 Nov 2025 11:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05698C4CEF8;
	Fri, 14 Nov 2025 11:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763120568;
	bh=JCJJ+smwYrR2g3QGo7fPrR+zmXOiaWETE6PY6T/Dud0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q8fkkteNmYzK0uACVLTWx5CVyhemcbPv8ndiusq5y7wxdrRHX+D2H9fcpkAKGbyPx
	 t5aZYId2snhO2ynpmREc1bqI3cU4DdNz17nRX/z5TP+NFY1vcDyPrCXh9/NqUwnFif
	 Z6wTsOzsxOik8RgVJyp7gpXSEh75s+2HrrOGP3ASjN7IzFCA4pRUKqXxnv5YH2pe3M
	 L+vwqRdrmBiLxbWOkkw54+LuM8bcNU97McPS4KwqMsEThRjBXbgOcNftN9EmWedDtj
	 inyCQJSGs2hC3h21FdXNPEG8NpnkR4rLZbURImoTgCWZzgbov37oGW2cpm0piGUfPF
	 04fJ+m4146kng==
Date: Fri, 14 Nov 2025 12:42:39 +0100
From: Christian Brauner <brauner@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, bot+bpf-ci@kernel.org, 
	linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, jack@suse.cz, raven@themaw.net, 
	miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org, 
	rostedt@goodmis.org, linux-usb@vger.kernel.org, paul@paul-moore.com, 
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com, 
	selinux@vger.kernel.org, borntraeger@linux.ibm.com, bpf@vger.kernel.org, ast@kernel.org, 
	andrii@kernel.org, daniel@iogearbox.net, martin.lau@kernel.org, eddyz87@gmail.com, 
	yonghong.song@linux.dev, ihor.solodrai@linux.dev, Chris Mason <clm@meta.com>
Subject: Re: [functionfs] mainline UAF (was Re: [PATCH v3 36/50] functionfs:
 switch to simple_remove_by_name())
Message-ID: <20251114-abkehr-rasur-b2eae31c4d57@brauner>
References: <20251111065520.2847791-37-viro@zeniv.linux.org.uk>
 <20754dba9be498daeda5fe856e7276c9c91c271999320ae32331adb25a47cd4f@mail.kernel.org>
 <20251111092244.GS2441659@ZenIV>
 <e6b90909-fdd7-4c4d-b96e-df27ea9f39c4@meta.com>
 <20251113092636.GX2441659@ZenIV>
 <2025111316-cornfield-sphinx-ba89@gregkh>
 <20251114074614.GY2441659@ZenIV>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114074614.GY2441659@ZenIV>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 14, 2025 at 07:46:14AM +0000, Al Viro wrote:
> On Thu, Nov 13, 2025 at 04:20:08PM -0500, Greg Kroah-Hartman wrote:
> 
> > Sorry for the delay.  Yes, we should be grabing the mutex in there, good
> > catch.  There's been more issues pointed out with the gadget code in the
> > past year or so as more people are starting to actually use it and
> > stress it more.  So if you have a patch for this, I'll gladly take it :)
> 
> How about the following?
> 
> commit 330837c8101578438f64cfaec3fb85521d668e56
> Author: Al Viro <viro@zeniv.linux.org.uk>
> Date:   Fri Nov 14 02:18:22 2025 -0500
> 
>     functionfs: fix the open/removal races
>     
>     ffs_epfile_open() can race with removal, ending up with file->private_data

Very apt prefix though.
(Like Paul would say: "Sorry, couldn't resist.")

>     pointing to freed object.
>     
>     There is a total count of opened files on functionfs (both ep0 and
>     dynamic ones) and when it hits zero, dynamic files get removed.
>     Unfortunately, that removal can happen while another thread is
>     in ffs_epfile_open(), but has not incremented the count yet.
>     In that case open will succeed, leaving us with UAF on any subsequent
>     read() or write().
>     
>     The root cause is that ffs->opened is misused; atomic_dec_and_test() vs.
>     atomic_add_return() is not a good idea, when object remains visible all
>     along.
>     
>     To untangle that
>             * serialize openers on ffs->mutex (both for ep0 and for dynamic files)
>             * have dynamic ones use atomic_inc_not_zero() and fail if we had
>     zero ->opened; in that case the file we are opening is doomed.
>             * have the inodes of dynamic files marked on removal (from the
>     callback of simple_recursive_removal()) - clear ->i_private there.
>             * have open of dynamic ones verify they hadn't been already removed,
>     along with checking that state is FFS_ACTIVE.
>     
>     Fix another abuse of ->opened, while we are at it - it starts equal to 0,
>     is incremented on opens and decremented on ->release()... *and* decremented
>     (always from 0 to -1) in ->kill_sb().  Handling that case has no business
>     in ffs_data_closed() (or to ->opened); just have ffs_kill_sb() do what
>     ffs_data_closed() would in case of decrement to negative rather than
>     calling ffs_data_closed() there.
>     
>     And don't bother with bumping ffs->ref when opening a file - superblock
>     already holds the reference and it won't go away while there are any opened
>     files on the filesystem.
>     
>     Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 47cfbe41fdff..ed7fa869ea77 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -640,13 +640,22 @@ static ssize_t ffs_ep0_read(struct file *file, char __user *buf,
>  
>  static int ffs_ep0_open(struct inode *inode, struct file *file)
>  {
> -	struct ffs_data *ffs = inode->i_private;
> +	struct ffs_data *ffs = inode->i_sb->s_fs_info;
> +	int ret;
>  
> -	if (ffs->state == FFS_CLOSING)
> -		return -EBUSY;
> +	/* Acquire mutex */
> +	ret = ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK);
> +	if (ret < 0)
> +		return ret;
>  
> -	file->private_data = ffs;
>  	ffs_data_opened(ffs);
> +	if (ffs->state == FFS_CLOSING) {
> +		ffs_data_closed(ffs);
> +		mutex_unlock(&ffs->mutex);
> +		return -EBUSY;
> +	}
> +	mutex_unlock(&ffs->mutex);
> +	file->private_data = ffs;
>  
>  	return stream_open(inode, file);
>  }
> @@ -1193,14 +1202,33 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
>  static int
>  ffs_epfile_open(struct inode *inode, struct file *file)
>  {
> -	struct ffs_epfile *epfile = inode->i_private;
> +	struct ffs_data *ffs = inode->i_sb->s_fs_info;
> +	struct ffs_epfile *epfile;
> +	int ret;
>  
> -	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
> +	/* Acquire mutex */
> +	ret = ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!atomic_inc_not_zero(&ffs->opened)) {
> +		mutex_unlock(&ffs->mutex);
>  		return -ENODEV;
> +	}
> +	/*
> +	 * we want the state to be FFS_ACTIVE; FFS_ACTIVE alone is
> +	 * not enough, though - we might have been through FFS_CLOSING
> +	 * and back to FFS_ACTIVE, with our file already removed.
> +	 */
> +	epfile = smp_load_acquire(&inode->i_private);
> +	if (unlikely(ffs->state != FFS_ACTIVE || !epfile)) {
> +		mutex_unlock(&ffs->mutex);
> +		ffs_data_closed(ffs);
> +		return -ENODEV;
> +	}
> +	mutex_unlock(&ffs->mutex);
>  
>  	file->private_data = epfile;
> -	ffs_data_opened(epfile->ffs);
> -
>  	return stream_open(inode, file);
>  }
>  
> @@ -1332,7 +1360,7 @@ static void ffs_dmabuf_put(struct dma_buf_attachment *attach)
>  static int
>  ffs_epfile_release(struct inode *inode, struct file *file)
>  {
> -	struct ffs_epfile *epfile = inode->i_private;
> +	struct ffs_epfile *epfile = file->private_data;
>  	struct ffs_dmabuf_priv *priv, *tmp;
>  	struct ffs_data *ffs = epfile->ffs;
>  
> @@ -2071,12 +2099,18 @@ static int ffs_fs_init_fs_context(struct fs_context *fc)
>  	return 0;
>  }
>  
> +static void ffs_data_reset(struct ffs_data *ffs);
> +
>  static void
>  ffs_fs_kill_sb(struct super_block *sb)
>  {
>  	kill_litter_super(sb);
> -	if (sb->s_fs_info)
> -		ffs_data_closed(sb->s_fs_info);
> +	if (sb->s_fs_info) {
> +		struct ffs_data *ffs = sb->s_fs_info;
> +		ffs->state = FFS_CLOSING;
> +		ffs_data_reset(ffs);
> +		ffs_data_put(ffs);
> +	}
>  }
>  
>  static struct file_system_type ffs_fs_type = {
> @@ -2114,7 +2148,6 @@ static void functionfs_cleanup(void)
>  /* ffs_data and ffs_function construction and destruction code **************/
>  
>  static void ffs_data_clear(struct ffs_data *ffs);
> -static void ffs_data_reset(struct ffs_data *ffs);
>  
>  static void ffs_data_get(struct ffs_data *ffs)
>  {
> @@ -2123,7 +2156,6 @@ static void ffs_data_get(struct ffs_data *ffs)
>  
>  static void ffs_data_opened(struct ffs_data *ffs)
>  {
> -	refcount_inc(&ffs->ref);
>  	if (atomic_add_return(1, &ffs->opened) == 1 &&
>  			ffs->state == FFS_DEACTIVATED) {
>  		ffs->state = FFS_CLOSING;
> @@ -2148,11 +2180,11 @@ static void ffs_data_put(struct ffs_data *ffs)
>  
>  static void ffs_data_closed(struct ffs_data *ffs)
>  {
> -	struct ffs_epfile *epfiles;
> -	unsigned long flags;
> -
>  	if (atomic_dec_and_test(&ffs->opened)) {
>  		if (ffs->no_disconnect) {
> +			struct ffs_epfile *epfiles;
> +			unsigned long flags;
> +
>  			ffs->state = FFS_DEACTIVATED;
>  			spin_lock_irqsave(&ffs->eps_lock, flags);
>  			epfiles = ffs->epfiles;
> @@ -2171,12 +2203,6 @@ static void ffs_data_closed(struct ffs_data *ffs)
>  			ffs_data_reset(ffs);
>  		}
>  	}
> -	if (atomic_read(&ffs->opened) < 0) {
> -		ffs->state = FFS_CLOSING;
> -		ffs_data_reset(ffs);
> -	}
> -
> -	ffs_data_put(ffs);
>  }
>  
>  static struct ffs_data *ffs_data_new(const char *dev_name)
> @@ -2352,6 +2378,11 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
>  	return 0;
>  }
>  
> +static void clear_one(struct dentry *dentry)
> +{
> +	smp_store_release(&dentry->d_inode->i_private, NULL);
> +}
> +
>  static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count)
>  {
>  	struct ffs_epfile *epfile = epfiles;
> @@ -2359,7 +2390,7 @@ static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count)
>  	for (; count; --count, ++epfile) {
>  		BUG_ON(mutex_is_locked(&epfile->mutex));
>  		if (epfile->dentry) {
> -			simple_recursive_removal(epfile->dentry, NULL);
> +			simple_recursive_removal(epfile->dentry, clear_one);
>  			epfile->dentry = NULL;
>  		}
>  	}

